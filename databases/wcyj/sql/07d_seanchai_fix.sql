-- =============================================================================
-- 07b_seanchai_fix.sql — Seanchaí schema corrections
-- =============================================================================
--
-- Fixes two violations of sql_conventions.md introduced in 07_seanchai.sql:
--
--   1. v_record_detail and v_search_detail included id, created_at,
--      updated_at, created_by, updated_by — detail views must be a deliberate
--      whitelist of form fields only; id and *_by are never included.
--
--   2. No api.get_record_detail() or api.get_search_detail() functions existed.
--      web_app_user has EXECUTE on api.* only — reads must go through api
--      functions, not direct view queries.
--
-- Side effects:
--   - api.save_record and api.save_search are recreated without %ROWTYPE
--     dependencies on the views (cleaner and avoids recompile-on-view-change).
--   - api.get_record_detail / api.get_search_detail added.
--   - GRANT EXECUTE re-run per sql_conventions: wildcard grant is a snapshot,
--     not standing policy.
--
-- Depends on: 07_seanchai.sql already applied.
-- =============================================================================


-- =============================================================================
-- Step 1: Drop dependent views (CASCADE removes dependent compiled functions)
-- api.save_record and api.save_search used %ROWTYPE on these views,
-- creating a compile-time dependency that CASCADE will clean up.
-- =============================================================================

DROP VIEW IF EXISTS seanchai.v_record_detail CASCADE;
DROP VIEW IF EXISTS seanchai.v_search_detail CASCADE;


-- =============================================================================
-- Step 2: Recreate detail views — deliberate whitelist, no id or *_by columns
-- =============================================================================

CREATE VIEW seanchai.v_record_detail AS
SELECT
    r.record_id,
    r.record_type_id,
    rt.code   AS type_code,
    rt.name   AS record_type,
    r.record_status_id,
    rs.name   AS status,
    r.display_order,
    r.year,
    r.subject,
    r.county,
    r.state,
    r.source_citation,
    r.source_url,
    r.notes
FROM seanchai.records r
JOIN seanchai.record_type   rt ON rt.id = r.record_type_id
JOIN seanchai.record_status rs ON rs.id = r.record_status_id;

CREATE VIEW seanchai.v_search_detail AS
SELECT
    s.search_id,
    s.search_terms,
    s.county_scope,
    s.year_filter,
    s.result_count,
    s.status,
    s.notes,
    s.searched_at
FROM seanchai.searches s;


-- =============================================================================
-- Step 3: Restore SELECT grants on recreated views for steward
-- (web_app_user has no view grants — reads go through api.* functions)
-- =============================================================================

GRANT SELECT ON
    seanchai.v_record_detail,
    seanchai.v_search_detail
TO steward;


-- =============================================================================
-- Step 4: Read functions — required for the _fetch_*_for_display pattern
-- Joins back to base table on natural key to filter by internal PK.
-- SECURITY DEFINER runs as steward; web_app_user calls via EXECUTE grant only.
-- =============================================================================

CREATE OR REPLACE FUNCTION api.get_record_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT to_jsonb(v)
    FROM seanchai.v_record_detail v
    JOIN seanchai.records r USING (record_id)
    WHERE r.id = p_id;
$$;

CREATE OR REPLACE FUNCTION api.get_search_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT to_jsonb(v)
    FROM seanchai.v_search_detail v
    JOIN seanchai.searches s USING (search_id)
    WHERE s.id = p_id;
$$;


-- =============================================================================
-- Step 5: Recreate api.save_record without %ROWTYPE view dependency
-- Uses api.get_record_detail() for the post-save fetch.
-- =============================================================================

CREATE OR REPLACE FUNCTION api.save_record(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id BIGINT;
BEGIN
    IF payload->>'id' IS NULL THEN
        INSERT INTO seanchai.records (
            record_id, record_type_id, record_status_id,
            display_order, year, subject,
            county, state, source_citation, source_url, notes,
            created_by, updated_by
        ) VALUES (
            payload->>'record_id',
            (payload->>'record_type_id')::BIGINT,
            (payload->>'record_status_id')::BIGINT,
            COALESCE((payload->>'display_order')::INTEGER, 0),
            payload->>'year',
            payload->>'subject',
            payload->>'county',
            COALESCE(payload->>'state', 'PA'),
            payload->>'source_citation',
            payload->>'source_url',
            payload->>'notes',
            user_id,
            user_id
        )
        RETURNING id INTO v_id;
    ELSE
        v_id := (payload->>'id')::BIGINT;
        UPDATE seanchai.records SET
            record_id        = COALESCE(payload->>'record_id',                   record_id),
            record_type_id   = COALESCE((payload->>'record_type_id')::BIGINT,    record_type_id),
            record_status_id = COALESCE((payload->>'record_status_id')::BIGINT,  record_status_id),
            display_order    = COALESCE((payload->>'display_order')::INTEGER,    display_order),
            year             = COALESCE(payload->>'year',                        year),
            subject          = COALESCE(payload->>'subject',                     subject),
            county           = COALESCE(payload->>'county',                      county),
            state            = COALESCE(payload->>'state',                       state),
            source_citation  = COALESCE(payload->>'source_citation',             source_citation),
            source_url       = COALESCE(payload->>'source_url',                  source_url),
            notes            = COALESCE(payload->>'notes',                       notes),
            updated_by       = user_id
        WHERE id = v_id;

        IF NOT FOUND THEN
            RETURN jsonb_build_object(
                'success', false, 'message', 'Record not found', 'data', '{}'::JSONB
            );
        END IF;
    END IF;

    RETURN jsonb_build_object(
        'success', true,
        'data',    COALESCE(api.get_record_detail(v_id), '{}'::JSONB),
        'message', 'OK'
    );

EXCEPTION WHEN unique_violation THEN
    RETURN jsonb_build_object(
        'success', false, 'message', 'Record ID already exists', 'data', '{}'::JSONB
    );
END;
$$;


-- =============================================================================
-- Step 6: Recreate api.save_search without %ROWTYPE view dependency
-- =============================================================================

CREATE OR REPLACE FUNCTION api.save_search(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id BIGINT;
BEGIN
    IF payload->>'id' IS NULL THEN
        INSERT INTO seanchai.searches (
            search_id, search_terms, county_scope,
            year_filter, result_count, status, notes, searched_at,
            created_by, updated_by
        ) VALUES (
            payload->>'search_id',
            payload->>'search_terms',
            payload->>'county_scope',
            payload->>'year_filter',
            (payload->>'result_count')::INTEGER,
            COALESCE(payload->>'status', 'complete'),
            payload->>'notes',
            (payload->>'searched_at')::TIMESTAMPTZ,
            user_id,
            user_id
        )
        RETURNING id INTO v_id;
    ELSE
        v_id := (payload->>'id')::BIGINT;
        UPDATE seanchai.searches SET
            search_id    = COALESCE(payload->>'search_id',                   search_id),
            search_terms = COALESCE(payload->>'search_terms',                search_terms),
            county_scope = COALESCE(payload->>'county_scope',                county_scope),
            year_filter  = COALESCE(payload->>'year_filter',                 year_filter),
            result_count = COALESCE((payload->>'result_count')::INTEGER,     result_count),
            status       = COALESCE(payload->>'status',                      status),
            notes        = COALESCE(payload->>'notes',                       notes),
            searched_at  = COALESCE((payload->>'searched_at')::TIMESTAMPTZ,  searched_at),
            updated_by   = user_id
        WHERE id = v_id;

        IF NOT FOUND THEN
            RETURN jsonb_build_object(
                'success', false, 'message', 'Search not found', 'data', '{}'::JSONB
            );
        END IF;
    END IF;

    RETURN jsonb_build_object(
        'success', true,
        'data',    COALESCE(api.get_search_detail(v_id), '{}'::JSONB),
        'message', 'OK'
    );

EXCEPTION WHEN unique_violation THEN
    RETURN jsonb_build_object(
        'success', false, 'message', 'Search ID already exists', 'data', '{}'::JSONB
    );
END;
$$;


-- =============================================================================
-- Step 7: Re-run GRANT EXECUTE snapshot (per sql_conventions: wildcard grant
-- is not standing policy — re-run after adding new api.* functions)
-- Lines copied verbatim from 06_api.sql's grant block.
-- =============================================================================

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
