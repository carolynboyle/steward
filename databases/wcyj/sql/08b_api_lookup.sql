-- =============================================================================
-- 08b_api_lookup.sql — API schema: get_lookup() explicit-dispatch function
-- =============================================================================
-- Select-field options for fieldkit forms. Explicit CASE dispatch, no dynamic
-- SQL. Returns [{"value": id, "label": name}, ...] ordered by label; NULL for
-- an unknown source.
--
-- Branches project_types / project_statuses / task_statuses / priorities are
-- from CHANGEDOC_API_GET_LOOKUP + CHANGEDOC_TASKS_SQL_LAYER (Section 5).
--
-- NEW IN THIS REBUILD (not from a changedoc): record_types / record_statuses,
-- needed by fieldkit_overrides.yaml for seanchai.v_record_detail. Their source
-- in the old DB could not be found; both tables have id + name.
-- Depends on: 03_projects.sql, 07_seanchai.sql (seanchai.record_type/record_status)
-- Adding a source later: add a WHEN branch and re-run (CREATE OR REPLACE).
-- =============================================================================

CREATE OR REPLACE FUNCTION api.get_lookup(p_source TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_result JSONB;
BEGIN
    CASE p_source
        WHEN 'project_types' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM projects.project_type;

        WHEN 'project_statuses' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM projects.project_status;

        WHEN 'task_statuses' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM projects.task_status;

        WHEN 'priorities' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM projects.priority;

        WHEN 'record_types' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM seanchai.record_type;

        WHEN 'record_statuses' THEN
            SELECT jsonb_agg(
                       jsonb_build_object('value', id, 'label', name)
                       ORDER BY name
                   )
            INTO v_result
            FROM seanchai.record_status;

        ELSE
            v_result := NULL;
    END CASE;

    RETURN v_result;
END;
$$;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
