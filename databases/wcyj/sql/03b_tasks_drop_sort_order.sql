-- =============================================================================
-- 03b_tasks_drop_sort_order.sql — migration: drop projects.tasks.sort_order
-- =============================================================================
-- Source: CHANGEDOC_TASKS_SQL_LAYER.md, Section 1.
-- The repo's 03_projects.sql still defines sort_order; the live (old) DB had it
-- dropped. IF EXISTS makes this safe on a fresh DB built from that file.
-- =============================================================================

ALTER TABLE projects.tasks DROP COLUMN IF EXISTS sort_order;
