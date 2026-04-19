# Directus Deployment

Directus running on `wcyjvs1` (`100.64.0.9`), accessible via Tailscale only.
Connected to the `projects` PostgreSQL database on steward (`100.64.0.10`) as
an external data source configured through the Directus UI.

## First-time setup

```bash
# 1. Generate secrets
cp .env.template .env
chmod 600 .env

# Fill in real values:
#   DIRECTUS_SECRET:         openssl rand -base64 32
#   DIRECTUS_ADMIN_PASSWORD: openssl rand -base64 16

# 2. Start
docker compose up -d

# 3. Verify read-only filesystem is active
docker inspect directus | grep ReadonlyRootfs
# Expected: "ReadonlyRootfs": true
```

## Updating Directus

Do not just change `:latest` -- always pin by both tag and digest so updates
are deliberate.

```bash
# 1. Pull and inspect the new version
docker pull directus/directus:<new-version>
docker inspect directus/directus:<new-version> | grep -A1 RepoDigests

# 2. Update the image line in docker-compose.yml:
#    image: directus/directus:<new-version>@sha256:<new-digest>

# 3. Restart
docker compose up -d
```

## Why tmpfs mounts?

`read_only: true` makes the container's root filesystem immutable, which is a
meaningful security control -- a compromised container can't write backdoors,
install tools, or modify its own binaries.

However, Node.js writes temporary files to `/tmp` at startup (npm/npx cache,
extraction directories), and `/run` is used for Unix sockets and pid files.
Without writable tmpfs mounts at those paths the container crashes immediately
on start.

`tmpfs` mounts are in-memory only -- nothing written there survives a container
restart, which is exactly what we want for temp data.

## Security controls summary

| Control | Value |
|---|---|
| Image pinned | `11.17.2@sha256:5e5978...` |
| Port binding | Tailscale interface only (`100.64.0.9:8055`) |
| Root filesystem | Read-only |
| Temp writes | `/tmp`, `/run`, `/home/node/.pm2`, `/directus/node_modules/.directus` via tmpfs |
| Linux capabilities | All dropped |
| Privilege escalation | Blocked (`no-new-privileges`) |
| Memory limit | 512 MB |
| CPU limit | 1.0 core |
| Network | Isolated named bridge (`directus_net`) |
| Secrets | `.env` file, `chmod 600`, excluded from git |

## Accessing Directus

`http://100.64.0.9:8055` -- requires Tailscale connection.
