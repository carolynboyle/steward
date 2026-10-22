-- =============================================================================
-- 07_detail_api.sql — API schema: get_*_detail() read functions (AFTER version)
-- =============================================================================
-- Each returns the v_*_detail row as JSONB, or NULL if the id doesn't exist.
-- Depends on: 07_detail_views.sql
-- =============================================================================

CREATE OR REPLACE FUNCTION api.get_project_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT row_to_json(t)::jsonb
    FROM projects.v_project_detail t
    WHERE t.id = p_id;
$$;

CREATE OR REPLACE FUNCTION api.get_task_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT row_to_json(t)::jsonb
    FROM projects.v_task_detail t
    WHERE t.id = p_id;
$$;

CREATE OR REPLACE FUNCTION api.get_contact_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT row_to_json(t)::jsonb
    FROM identity.v_contact_detail t
    WHERE t.id = p_id;
$$;

CREATE OR REPLACE FUNCTION api.get_organization_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT row_to_json(t)::jsonb
    FROM identity.v_organization_detail t
    WHERE t.id = p_id;
$$;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
