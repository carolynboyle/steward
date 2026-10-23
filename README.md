# steward

Database schemas and stewardship tooling for the whycantyoujust.tech
PostgreSQL databases. Steward owns the **structure** — tables, views,
API functions, grants, reference data. Applications (Curator) and
project data (seanchaí) live in their own repos.

## Layout

```
databases/
  wcyj/sql/         Current schema for the wcyj database — numbered SQL files
  wcyj/sql/archive/ Superseded single-file schemas, kept for reference
  projects/         Earlier standalone `projects` database (pre-wcyj):
                    schema, seed, Makefile, init tooling — see its README
docs/
  design/           ER diagrams (Mermaid)
  change/           Migration notes
data/schemas/       Additional ER diagrams
templates/          config.yaml.template for the projects init tooling
archive/            Old schemas and backups
.doc-gen/           doc-gen manifest and generated documentation
```

## The wcyj database

`wcyj` is the database behind Curator. It is built from the numbered files
in `databases/wcyj/sql/`, applied in order:

| Files | Contents |
|---|---|
| `00_drop` | Drops every wcyj schema — fresh rebuilds only, **destroys data** |
| `01`–`05` | audit, identity, projects/tasks, infrastructure, seed data |
| `06*` | `api` schema, `web_app_user` role, API functions |
| `07*` | Detail views and read functions; seanchaí research ledger |
| `08*` | `api.get_field_schema` and `api.get_lookup` (used by fieldkit) |
| `10*` | Later modules: seanchaí todos, ID auto-numbering, extra types |

### Building from scratch

On a blank database owned by `steward`, apply every file in name order,
with two exceptions:

- **Skip `05b_migration_app_user.sql`.** It was a one-time change to the
  live database; `02_identity.sql` already includes it.
- **Apply `07_detail_views.sql` before `07_detail_api.sql`.** The API file
  depends on the views but sorts ahead of them.

Last verified end to end on a blank PostgreSQL 16 database on 2026-10-22.

### Applying a change to the live database

The production database runs in Docker on wcyj-meet, next to Curator.
Clones live in `~/projects/<repo>`. From the Curator directory:

```bash
cd ~/projects/curator
docker compose exec -T db psql -U steward -d wcyj -v ON_ERROR_STOP=1 \
  < ~/projects/steward/databases/wcyj/sql/<file>.sql
```

Curator checks its form definitions against the database views at startup.
After changing a view or lookup table, restart the app
(`docker compose restart app`) and check `docker compose logs app`.

## Conventions

- **Changes to the live database go in new numbered files.** An existing
  file may be corrected so that fresh builds come out right, but the live
  database only ever receives new files. Keep changes additive — nothing
  that would break the older wcyjv20 instance.
- **Writes go through `api.*` functions.** `web_app_user` has `EXECUTE` on
  the `api` schema and no direct table access. Functions are
  `SECURITY DEFINER` and return `{"success", "data", "message"}`.
- **Detail views are form definitions.** A `v_*_detail` view lists exactly
  the fields a form shows; Curator's fieldkit builds forms from it.
  Internal ids, audit columns and `*_by` columns stay out of the view;
  read functions add `id` back where the app needs it.
- **Re-run grants after adding `api` functions.** `GRANT ... ON ALL
  FUNCTIONS IN SCHEMA api` covers only functions that exist when it runs.
- **One-time data loads don't belong here.** They live with their project
  (e.g. the seanchaí ledger import is in the seanchai repo).

## Related repos

- [curator](https://github.com/carolynboyle/curator) — the web app
- [seanchai](https://github.com/carolynboyle/seanchai) — research data and import for the seanchaí module
