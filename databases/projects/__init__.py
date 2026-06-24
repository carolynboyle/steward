#!/usr/bin/env python3
"""
steward/data/projects/init.py
------------------------------
Interactive management script for the projects database.

Reads connection config from config.yaml in the same directory.
SSH username is taken from the current OS user ($USER).

Usage:
    python init.py          — interactive menu
    python init.py 1        — full init (drop, create, schema, seed)
    python init.py 2        — schema only
    python init.py 3        — seed only

Dependencies:
    pip install pyyaml paramiko
"""

import io
import os
import subprocess
import sys
from pathlib import Path

import paramiko
import yaml


# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

DIR = Path(__file__).parent


def load_config() -> dict:
    config_path = DIR / "config.yaml"
    if not config_path.exists():
        print(f"\n  ERROR: config.yaml not found at {config_path}")
        print("  Copy config.yaml.template to config.yaml and fill in the values.\n")
        sys.exit(1)
    with open(config_path, encoding="utf-8") as f:
        return yaml.safe_load(f)


# ---------------------------------------------------------------------------
# SSH helpers
# ---------------------------------------------------------------------------

def ssh_connect(cfg: dict) -> paramiko.SSHClient:
    """Open an SSH connection to host as the current OS user."""
    ssh_user = os.environ.get("USER", os.environ.get("LOGNAME", ""))
    if not ssh_user:
        print("  ERROR: Could not determine current OS username.")
        sys.exit(1)

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(
        hostname=cfg["host"],
        port=22,
        username=ssh_user,
        password=cfg["ssh_password"],
    )
    return client


def ssh_run(client: paramiko.SSHClient, cmd: str, sudo_password: str = None) -> tuple[int, str, str]:
    """
    Run a command over SSH, optionally feeding a sudo password via stdin.

    Returns:
        (exit_code, stdout, stderr)
    """
    stdin, stdout, stderr = client.exec_command(cmd, get_pty=True)
    if sudo_password:
        stdin.write(sudo_password + "\n")
        stdin.flush()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    exit_code = stdout.channel.recv_exit_status()
    return exit_code, out, err


def ssh_run_sql(client: paramiko.SSHClient, cfg: dict, sql: str) -> tuple[int, str, str]:
    """Run a SQL statement as the postgres superuser via sudo on the remote host."""
    cmd = f"sudo -S -u postgres psql -p {cfg['port']} -d postgres -c \"{sql}\""
    return ssh_run(client, cmd, sudo_password=cfg["sudo_password"])


def ssh_copy_and_run(client: paramiko.SSHClient, cfg: dict, local_file: Path) -> tuple[int, str, str]:
    """
    Copy a local SQL file to /tmp on the remote host and run it as postgres superuser.
    """
    remote_path = f"/tmp/{local_file.name}"

    # Copy file via SFTP
    sftp = client.open_sftp()
    sftp.put(str(local_file), remote_path)
    sftp.close()

    cmd = f"sudo -S -u postgres psql -p {cfg['port']} -d postgres -f {remote_path}"
    return ssh_run(client, cmd, sudo_password=cfg["sudo_password"])


def ok(exit_code: int, out: str, err: str, label: str) -> bool:
    """Print result and return True if successful."""
    if exit_code == 0:
        return True
    print(f"  ERROR: {label} failed (exit {exit_code})")
    if err.strip():
        print(f"  {err.strip()}")
    return False


# ---------------------------------------------------------------------------
# psql helpers (run locally, connect to remote db as owner)
# ---------------------------------------------------------------------------

def psql_file(cfg: dict, sql_file: Path) -> bool:
    """Run a SQL file as the owner user via local psql connecting to remote host."""
    env = os.environ.copy()
    env["PGPASSWORD"] = cfg["db_password"]
    cmd = [
        "psql",
        "-h", cfg["host"],
        "-p", str(cfg["port"]),
        "-U", cfg["owner"],
        "-d", cfg["dbname"],
        "-f", str(sql_file),
    ]
    result = subprocess.run(cmd, env=env)
    return result.returncode == 0


# ---------------------------------------------------------------------------
# Actions
# ---------------------------------------------------------------------------

def confirm_drop(cfg: dict) -> bool:
    """Double confirmation before dropping the database."""
    print()
    print(f"  WARNING: This will permanently destroy the '{cfg['dbname']}' database")
    print(f"  on {cfg['host']}. All data will be lost.")
    print()
    first = input("  Type 'yes' to continue: ").strip()
    if first != "yes":
        print("  Aborted.\n")
        return False
    second = input("  Type the database name to confirm: ").strip()
    if second != cfg["dbname"]:
        print("  Aborted.\n")
        return False
    return True


def full_init(cfg: dict) -> None:
    """Drop, create, load schema, load seed."""
    if not confirm_drop(cfg):
        return

    print("\n  Connecting to steward...")
    client = ssh_connect(cfg)

    print("  Terminating existing connections...")
    code, out, err = ssh_run_sql(
        client, cfg,
        f"SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '{cfg['dbname']}'"
    )
    ok(code, out, err, "terminate connections")

    print("  Dropping database...")
    code, out, err = ssh_run_sql(client, cfg, f"DROP DATABASE IF EXISTS {cfg['dbname']}")
    if not ok(code, out, err, "drop database"):
        client.close()
        return

    print("  Creating database...")
    code, out, err = ssh_copy_and_run(client, cfg, DIR / "create_db.sql")
    if not ok(code, out, err, "create database"):
        client.close()
        return

    client.close()

    print("  Loading schema...")
    if not psql_file(cfg, DIR / "schema.sql"):
        print("  ERROR: schema failed. Aborting.\n")
        return

    print("  Loading seed data...")
    if not psql_file(cfg, DIR / "seed.sql"):
        print("  ERROR: seed failed.\n")
        return

    print(f"\n  Done. '{cfg['dbname']}' is ready on {cfg['host']}.\n")


def schema_only(cfg: dict) -> None:
    """Load schema.sql into existing database."""
    print("\n  Loading schema...")
    if psql_file(cfg, DIR / "schema.sql"):
        print("  Done.\n")
    else:
        print("  ERROR: schema failed.\n")


def seed_only(cfg: dict) -> None:
    """Load seed.sql into existing database."""
    print("\n  Loading seed data...")
    if psql_file(cfg, DIR / "seed.sql"):
        print("  Done.\n")
    else:
        print("  ERROR: seed failed.\n")


# ---------------------------------------------------------------------------
# Menu
# ---------------------------------------------------------------------------

OPTIONS = {
    "1": ("Full init (drop, create, schema, seed)", full_init),
    "2": ("Schema only",                            schema_only),
    "3": ("Seed only",                              seed_only),
    "4": ("Quit",                                   None),
}


def show_menu(cfg: dict) -> None:
    print()
    print(f"  Projects Database — {cfg['host']}")
    print()
    for key, (label, _) in OPTIONS.items():
        print(f"  {key}. {label}")
    print()


def run(choice: str, cfg: dict) -> None:
    if choice not in OPTIONS:
        print(f"\n  Invalid option: {choice}\n")
        return
    label, action = OPTIONS[choice]
    if action is None:
        print("  Bye.\n")
        sys.exit(0)
    action(cfg)


def main() -> None:
    cfg = load_config()

    # Non-interactive mode: option passed as command line argument
    if len(sys.argv) > 1:
        run(sys.argv[1], cfg)
        return

    # Interactive menu
    while True:
        show_menu(cfg)
        choice = input("  Select an option: ").strip()
        run(choice, cfg)


if __name__ == "__main__":
    main()
