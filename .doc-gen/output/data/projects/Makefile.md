# Makefile

**Path:** data/projects/Makefile
**Syntax:** text
**Generated:** 2026-04-19 15:48:51

```
# =============================================================================
# steward/data/projects/Makefile
# =============================================================================
# Manages the projects database.
#
# Usage:
#   make            — show this help
#   make init       — drop, create, load schema, load seed (prompts first)
#   make schema     — load schema.sql into existing database
#   make seed       — load seed.sql into existing database
#
# Prerequisites:
#   - postgres superuser accessible via: sudo -u postgres psql
#   - $(OWNER) user must exist in postgres
#
# Example override:
#   make init HOST=192.168.1.50
# =============================================================================

HOST   = 100.64.0.10
PORT   = 5432
DBNAME = projects
OWNER  = steward

PSQL        = psql -h $(HOST) -p $(PORT) -U $(OWNER) -d $(DBNAME)
PSQL_SUPER  = sudo -u postgres psql -h $(HOST) -p $(PORT)

DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

# -----------------------------------------------------------------------------

.PHONY: help
help:
	@echo ""
	@echo "  steward/data/projects"
	@echo ""
	@echo "  make init    — full from-scratch setup (drop, create, schema, seed)"
	@echo "  make schema  — run schema.sql only"
	@echo "  make seed    — run seed.sql only"
	@echo ""
	@echo "  Variables (override on command line):"
	@echo "    HOST=$(HOST)"
	@echo "    PORT=$(PORT)"
	@echo "    DBNAME=$(DBNAME)"
	@echo "    OWNER=$(OWNER)"
	@echo ""

.PHONY: init
init:
	@echo ""
	@echo "  WARNING: This will drop and recreate the '$(DBNAME)' database on $(HOST)."
	@echo "  All data will be lost."
	@echo ""
	@read -p "  Type 'yes' to continue: " confirm && [ "$$confirm" = "yes" ]
	$(PSQL_SUPER) -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '$(DBNAME)';"
	$(PSQL_SUPER) -c "DROP DATABASE IF EXISTS $(DBNAME);"
	$(PSQL_SUPER) -f $(DIR)create_db.sql
	$(PSQL) -f $(DIR)schema.sql
	$(PSQL) -f $(DIR)seed.sql
	@echo ""
	@echo "  Done. $(DBNAME) is ready on $(HOST)."
	@echo ""

.PHONY: schema
schema:
	$(PSQL) -f $(DIR)schema.sql

.PHONY: seed
seed:
	$(PSQL) -f $(DIR)seed.sql
```
