-- =============================================================================
-- 10g_seanchai_other_type.sql — "Other / Uncategorized" record type
-- =============================================================================
--
-- Adds a catch-all record type for records that don't fit an existing
-- category, and for test records kept apart from the real ledger.
-- New records of this type are numbered OTH-001, OTH-002, ... by
-- api.save_record (10f_seanchai_autonumber.sql).
--
-- Safe to re-run. After applying on a running instance, restart the app
-- so the Type dropdown picks up the new option.
--
-- Depends on: 07_seanchai.sql (seanchai.record_type)
-- =============================================================================

INSERT INTO seanchai.record_type (code, name)
VALUES ('OTH', 'Other / Uncategorized')
ON CONFLICT (code) DO NOTHING;
