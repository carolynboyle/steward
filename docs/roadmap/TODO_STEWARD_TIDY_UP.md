# Steward — Tidy-Up Items

Logged 2026-10-22 while writing the top-level README and test-building the
wcyj schema from scratch. None of these block current work. Grouped by
area; tick items off (or delete them) as they're done.

---

## Privacy

- [ ] **Make the repo private.** Settings → General → Danger Zone →
      Change visibility. Before switching, point the wcyj-meet clone at
      SSH so `git pull` keeps working (the server's SSH key already
      authenticates to GitHub):
      `git remote set-url origin git@github.com:carolynboyle/steward.git`

  **Install script impact:** The curator install script fetches SQL files
  directly from steward via `curl` + raw GitHub URLs. If steward is private,
  one of two approaches is needed:

  - **GitHub PAT in `install.conf`** — add `GITHUB_TOKEN=ghp_...` to the
    config; pass it as `Authorization: token $GITHUB_TOKEN` on every `curl`
    call. The config is deleted on successful install, taking the token with
    it. Generate a fine-grained PAT scoped to `contents:read` on steward only;
    set a 90-day expiry and rotate on each install.
  - **`gh` CLI** — use `gh api repos/carolynboyle/steward/contents/...` instead
    of `curl`. Auth lives in `gh`'s keystore (set once with `gh auth login`),
    so no credential ever touches `install.conf`. Requires `gh` to be installed
    on the target server.

  The PAT approach is self-contained; the `gh` approach has cleaner credential
  hygiene if `gh` is already part of the server toolchain.
- [ ] **Business data committed to the repo.** Decide whether these belong
      in steward at all, or in private storage / a backup location:
  - `archive/curator_backup_20260621.sql` — full pg_dump of the old
    Curator database
  - `databases/projects/data/exports/` — CSV/ODS exports of projects,
    tasks and lookup tables
  - `archive/projects.tar.gz`, `archive/directus.tar.gz` — contents
    unchecked

  Removing them from the current tree doesn't remove them from history;
  making the repo private is what actually limits who can see them.

## wcyj fresh-build order

From the 2026-10-22 blank-database test (see README → *Building from
scratch*). Renaming files has no effect on any existing database.

- [ ] **`07_detail_api.sql` sorts before `07_detail_views.sql`** but
      depends on it. Rename so name order matches dependency order.
      `07b` is already taken (`07b_seanchai_fix.sql`), so pick names as
      part of the numbering pass below.
- [ ] **`05b_migration_app_user.sql` fails on a fresh build** ("column
      crew_role_id already exists") — it was a one-time live migration
      already folded into `02_identity.sql`. Move to
      `databases/wcyj/sql/archive/` with a one-line note.
- [ ] **`00_drop.sql` doesn't drop the `api` schema.** A rebuild via
      `00_drop` leaves the old `api.*` functions behind. Add
      `DROP SCHEMA IF EXISTS api CASCADE;` (and decide whether
      `web_app_user` should be dropped/recreated too — `06_api.sql`
      creates it only if missing).
- [ ] **Numbering pass.** Gaps and collisions: `06c`/`06e` with no
      `06a`/`06b`/`06d`; two files numbered plain `07_`; `10d`/`10f`/`10g`
      with no `10a`–`10c`/`10e` (`10e` is reserved for the seanchaí todos
      API). Goal: `ls | sort` is a valid build order, after which the
      README's build section reduces to "apply every file in name order".
      Update the README in the same change.

## Repo structure

- [ ] **`pyproject.toml` describes a package that doesn't exist.** It
      declares a `steward` Python package (paramiko, pyyaml) but there is
      no `steward/` directory. Either remove it or move the init tooling
      from `databases/projects/` into a real package.
- [ ] **`databases/projects/`** is the pre-wcyj standalone `projects`
      database (schema, seed, Makefile, init tooling). Decide: keep as
      reference, or move under `archive/`. Its README still says
      `steward/data/projects`.
- [ ] **`.doc-gen/` output is stale.** The manifest and generated docs
      reference `data/projects/` and `directus/`, which no longer exist at
      those paths. Regenerate or remove.
- [ ] **`docs/change/migration_v_project_tree_add_type (1).md`** — rename
      to drop the `(1)` download suffix.

## Branches

- [ ] **Delete `recovered-core-sql`** on GitHub — fully merged into
      `main` 2026-10-22. (Deleting from a Claude session is blocked; do it
      from the Branches page.)
- [ ] **Curator, not steward:** review curator's `part_1` branch (June
      2026, ~10 commits not on `main`: crew colours, detail panel,
      Tabulator datasheet). The work appears to have reached `main` by
      another route — confirm, then delete. Also delete curator's merged
      `seanchai-fieldkit-overrides` and `seanchai-form-fixes`.
