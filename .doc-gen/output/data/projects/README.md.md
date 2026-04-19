# README.md

**Path:** data/projects/README.md
**Syntax:** markdown
**Generated:** 2026-04-19 15:48:51

```markdown
# steward/data/projects

Schema, seed data, and management tooling for the `projects` database.

The `projects` database is managed by the Curator — a FastAPI web application
that provides a UI for tracking projects, tasks, tags, and file attachments.

---

## Files

| File | Description |
|---|---|
| `config.yaml.template` | Copy to `config.yaml` and fill in your values |
| `config.yaml` | Your local config — gitignored, never commit this |
| `create_db.sql` | Creates the database — run once as postgres superuser |
| `schema.sql` | Tables, triggers, indexes, and views |
| `seed.sql` | Reference data and sample records |
| `init.py` | Interactive management script |
| `Makefile` | Shortcuts for schema and seed without full init |

---

## Prerequisites

- Python 3.11+
- A virtual environment with dependencies installed (see below)
- `psql` installed locally
- SSH access to the machine running postgres
- The `steward` postgres user must already exist on the target machine

---

## Setup

### 1. Create and activate a virtual environment

From the steward repo root:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
```

### 2. Create your config file

```bash
cp config.yaml.template config.yaml
```

Edit `config.yaml` and fill in:

- `host` — IP or hostname of the machine running postgres
- `port` — postgres port (usually 5432)
- `dbname` — name of the database (projects)
- `owner` — postgres user that owns the database (steward)
- `encoding` — UTF8
- `locale` — C.UTF-8
- `ssh_password` — your SSH login password for the host machine
- `sudo_password` — your sudo password on the host (usually the same as ssh_password)
- `db_password` — the steward postgres user's password

---

## Usage

### Interactive menu

```bash
python init.py
```

```
  Projects Database — 100.64.0.10

  1. Full init (drop, create, schema, seed)
  2. Schema only
  3. Seed only
  4. Quit
```

### Non-interactive (for scripting)

```bash
python init.py 1   # full init
python init.py 2   # schema only
python init.py 3   # seed only
```

### Makefile shortcuts

For day-to-day use without a full init:

```bash
make schema   # reload schema into existing database
make seed     # reload seed data into existing database
```

Override connection details on the command line:

```bash
make schema HOST=192.168.1.50
```

---

## Full init workflow

Option 1 (full init) will:

1. Prompt for confirmation **twice** before dropping the database
2. Terminate all existing connections to the database
3. Drop the database
4. Create a fresh database with UTF8 encoding via the postgres superuser
5. Load schema.sql
6. Load seed.sql

The superuser step (create database) connects to the host via SSH and runs
`sudo -u postgres psql` using the unix socket — no postgres superuser
password is required.

---

## Resetting without full init

If you only need to reset the tables without dropping the database:

```bash
make schema
make seed
```

`schema.sql` drops and recreates all tables and views, so this is equivalent
to a full reset of the schema without touching the database itself.

---

## Adding a new database

To use these files as a template for a new database:

1. Copy this directory to `steward/data/<newdb>/`
2. Copy `config.yaml.template` to `config.yaml` and fill in the values
3. Replace `schema.sql` and `seed.sql` with your own
4. Update `create_db.sql` if the database name or owner differs
5. Update `HOST`, `PORT`, `DBNAME`, and `OWNER` in the Makefile
```
