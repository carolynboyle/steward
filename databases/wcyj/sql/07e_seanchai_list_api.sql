-- =============================================================================
-- 07c_seanchai_list_api.sql — Seanchaí list API functions
-- =============================================================================
--
-- Adds read-list functions for the Curator web UI's Tabulator grids and
-- lookup dropdowns. web_app_user has EXECUTE on api.* only — no direct
-- SELECT grants on seanchai.* tables or views — so list reads require
-- SECURITY DEFINER functions the same way single-record reads do.
--
-- Functions added:
--   api.list_records()        — all records for the Records Tabulator grid
--   api.list_searches()       — all searches for the Searches Tabulator grid
--   api.list_record_types()   — lookup [{id, code, name}] for type selects
--   api.list_record_statuses() — lookup [{id, name}] for status selects
--
-- Depends on: 07_seanchai.sql, 07b_seanchai_fix.sql already applied.
--
-- After applying, web_app_user gains EXECUTE via the GRANT EXECUTE snapshot
-- at the bottom of this file (per sql_conventions: wildcard grant not
-- standing policy — must re-run after adding new api.* functions).
-- =============================================================================


-- ---------------------------------------------------------------------------
-- api.list_records()
-- Returns all records with their type/status lookups resolved, ordered by
-- display_order then record_id. Includes record_type_id and record_status_id
-- (the FK integers) so the Curator Tabulator grid can use them for inline
-- editing with the type/status lookup maps.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.list_records()
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object(
                'id',               r.id,
                'record_id',        r.record_id,
                'record_type_id',   r.record_type_id,
                'record_type',      rt.name,
                'type_code',        rt.code,
                'record_status_id', r.record_status_id,
                'status',           rs.name,
                'display_order',    r.display_order,
                'year',             r.year,
                'subject',          r.subject,
                'county',           r.county,
                'state',            r.state,
                'updated_at',       r.updated_at
            )
            ORDER BY r.display_order, r.record_id
        ),
        '[]'::JSONB
    )
    FROM seanchai.records r
    JOIN seanchai.record_type   rt ON rt.id = r.record_type_id
    JOIN seanchai.record_status rs ON rs.id = r.record_status_id;
$$;


-- ---------------------------------------------------------------------------
-- api.list_searches()
-- Returns all searches ordered by search_id.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.list_searches()
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object(
                'id',           s.id,
                'search_id',    s.search_id,
                'search_terms', s.search_terms,
                'county_scope', s.county_scope,
                'year_filter',  s.year_filter,
                'result_count', s.result_count,
                'status',       s.status,
                'searched_at',  s.searched_at,
                'updated_at',   s.updated_at
            )
            ORDER BY s.search_id
        ),
        '[]'::JSONB
    )
    FROM seanchai.searches s;
$$;


-- ---------------------------------------------------------------------------
-- api.list_record_types()
-- Returns all record types [{id, code, name}] ordered by name.
-- Used to populate type dropdowns in the Tabulator grid and page-load
-- lookup maps (window.recordTypes in seanchai.html).
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.list_record_types()
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object('id', id, 'code', code, 'name', name)
            ORDER BY name
        ),
        '[]'::JSONB
    )
    FROM seanchai.record_type;
$$;


-- ---------------------------------------------------------------------------
-- api.list_record_statuses()
-- Returns all record statuses [{id, name}] ordered by name.
-- Used to populate status dropdowns in the Tabulator grid and page-load
-- lookup maps (window.recordStatuses in seanchai.html).
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.list_record_statuses()
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object('id', id, 'name', name)
            ORDER BY name
        ),
        '[]'::JSONB
    )
    FROM seanchai.record_status;
$$;


-- =============================================================================
-- GRANTs — re-run EXECUTE snapshot per sql_conventions
-- (wildcard grant is not standing policy; lines copied from 06_api.sql)
-- =============================================================================

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
