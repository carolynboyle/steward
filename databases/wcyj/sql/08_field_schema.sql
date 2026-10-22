-- =============================================================================
-- 08_field_schema.sql — API schema: get_field_schema() introspection function
-- =============================================================================
-- Given a schema-qualified view name, returns each column's name, data type
-- and ordinal position as a JSONB array. No dynamic SQL. NULL if unknown view.
-- =============================================================================

CREATE OR REPLACE FUNCTION api.get_field_schema(p_view_name TEXT)
RETURNS JSONB
LANGUAGE sql
STABLE
AS $$
    SELECT jsonb_agg(
        jsonb_build_object(
            'name',      column_name,
            'data_type', data_type,
            'position',  ordinal_position
        )
        ORDER BY ordinal_position
    )
    FROM information_schema.columns
    WHERE table_schema || '.' || table_name = p_view_name;
$$;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
