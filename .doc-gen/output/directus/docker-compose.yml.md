# docker-compose.yml

**Path:** directus/docker-compose.yml
**Syntax:** yaml
**Generated:** 2026-04-19 15:48:51

```yaml
# =============================================================================
# Directus - Hardened Compose File
# =============================================================================
#
# Security measures applied:
#   - Image pinned by digest (update deliberately, not via :latest drift)
#   - Port bound to Tailscale interface only (100.64.0.9)
#   - Read-only root filesystem
#   - /tmp and /run mounted as tmpfs (required by Node.js at startup)
#   - All Linux capabilities dropped
#   - no-new-privileges prevents privilege escalation via setuid binaries
#   - Memory and CPU limits contain blast radius if compromised
#   - Named network isolates container from default bridge
#   - Secrets loaded from .env file (not hardcoded here)
#
# Updating Directus:
#   1. Pull the new image: docker pull directus/directus:<version>
#   2. Get the new digest: docker inspect directus/directus:<version> | grep -A1 RepoDigests
#   3. Update the image line below with new version tag and digest
#   4. docker compose up -d
#
# =============================================================================

services:
  directus:
    image: directus/directus:11.17.2@sha256:5e5978377f1cc9820ffc5b92597da1573a1350ea57f8aba42efd999139993874
    container_name: directus
    restart: unless-stopped

    # -------------------------------------------------------------------------
    # Network: bind to Tailscale interface only, no LAN or public exposure
    # -------------------------------------------------------------------------
    ports:
      - "100.64.0.9:8055:8055"
    networks:
      - directus_net

    # -------------------------------------------------------------------------
    # Filesystem hardening
    # -------------------------------------------------------------------------
    read_only: true
    tmpfs:
      - /tmp:mode=1777
      - /run:mode=755,uid=1000,gid=1000
      - /home/node/.pm2:mode=755,uid=1000,gid=1000
      - /directus/node_modules/.directus:mode=755,uid=1000,gid=1000

    # -------------------------------------------------------------------------
    # Persistent data -- all writes go to named volumes, not the container FS
    # -------------------------------------------------------------------------
    volumes:
      - directus_database:/directus/database
      - directus_uploads:/directus/uploads
      - directus_extensions:/directus/extensions

    # -------------------------------------------------------------------------
    # Capability and privilege hardening
    # -------------------------------------------------------------------------
    cap_drop:
      - ALL
    security_opt:
      - no-new-privileges:true

    # -------------------------------------------------------------------------
    # Resource limits -- contain blast radius, prevent host starvation
    # -------------------------------------------------------------------------
    deploy:
      resources:
        limits:
          memory: 512m
          cpus: "1.0"

    # -------------------------------------------------------------------------
    # Environment
    # -------------------------------------------------------------------------
    environment:
      # Server
      PUBLIC_URL: "http://100.64.0.9:8055"

      # Database -- Directus system tables land in the 'directus' schema,
      # keeping the 'public' schema clean for project data.
      DB_CLIENT: "pg"
      DB_HOST: "100.64.0.10"
      DB_PORT: "5432"
      DB_DATABASE: "projects"
      DB_USER: "steward"
      DB_PASSWORD: "${DIRECTUS_DB_PASSWORD}"
      DB_SCHEMA: "directus"
      DB_SEARCH_PATH: "directus,public"

      # Secrets loaded from .env -- never hardcode these
      ADMIN_EMAIL: "admin@wcyj.tech"
      ADMIN_PASSWORD: "${DIRECTUS_ADMIN_PASSWORD}"
      SECRET: "${DIRECTUS_SECRET}"

# =============================================================================
# Volumes
# =============================================================================
volumes:
  directus_database:
  directus_uploads:
  directus_extensions:

# =============================================================================
# Networks
# =============================================================================
networks:
  directus_net:
    driver: bridge
```
