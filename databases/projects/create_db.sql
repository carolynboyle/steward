-- =============================================================================
-- steward/data/projects/create_db.sql
-- =============================================================================
-- Creates the projects database with UTF8 encoding.
--
-- Run via the Makefile:
--   make init
--
-- Or manually as the postgres superuser:
--   sudo -u postgres psql -h <host> -f create_db.sql
--
-- Do not run this file directly as the steward user —
-- CREATE DATABASE requires superuser privileges.
-- =============================================================================

CREATE DATABASE projects
    ENCODING    'UTF8'
    LC_COLLATE  'C.UTF-8'
    LC_CTYPE    'C.UTF-8'
    TEMPLATE    template0
    OWNER       steward;