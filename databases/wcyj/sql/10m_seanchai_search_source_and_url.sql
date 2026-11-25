-- =============================================================================
-- 10m_seanchai_search_source_and_url.sql — Where a search was run, and a link
--                                          to re-run it
-- =============================================================================
--
-- Until now a search row recorded what was typed (terms, county scope, year
-- filter) but not WHERE it was typed, and searches will soon be run on sites
-- other than FamilySearch full text. This file adds two columns:
--
--   seanchai.searches.source       where the search was run, free text, e.g.
--                                  'FamilySearch Full Text'
--   seanchai.searches.search_url   the URL of the results page as it was run;
--                                  opening it re-runs the search
--
-- Both are optional free text. There is deliberately no lookup table for
-- sources: the list is short and a plain text box is enough.
--
-- 1. The two columns are added to seanchai.searches. Existing searches all
--    came from FamilySearch full text, so their source is filled in with
--    that, once, when the column is created (re-running this file never
--    refills a source you have cleared). search_url stays empty until you
--    paste one in.
--
-- 2. seanchai.v_search_detail (the whitelist that defines the search form)
--    is rebuilt. Column order is the form order:
--        source, search_url, search_id, search_terms, county_scope,
--        year_filter, result_count, status, notes, searched_at
--
-- 3. api.save_search is recreated (as in 10f) with the two new fields.
--    Unlike the older columns, these two can be CLEARED: a payload that
--    carries the key with a blank or null value empties the column, while
--    a payload that leaves the key out (a scripted import, the grid's
--    inline edit) leaves it alone. The older columns keep their existing
--    "blank means keep" behaviour.
--
-- api.get_search_detail needs no change (it returns every column of the
-- view) but is recreated so it is bound to the rebuilt view. api.list_searches
-- is unchanged: the Searches grid does not show the new columns.
--
-- DEPLOY: apply this file FIRST, then immediately
--     git pull && docker compose up -d --build
-- in ~/projects/curator. The Curator release that goes with it adds the two
-- fields to the search form and to the save route; older Curator code keeps
-- working against the new database (it simply never sends the new keys).
--
-- Depends on: 07c_seanchai.sql (searches), 07d_seanchai_fix.sql (v_search_detail),
--             10f_seanchai_autonumber.sql (api.save_search, format_ledger_id)
-- Safe to re-run.
-- =============================================================================


-- -----------------------------------------------------------------------------
-- 1. Columns, and the source for searches that already exist
-- -----------------------------------------------------------------------------
-- The backfill runs only in the run that creates the source column, so
-- re-running this file later never refills a source you have cleared.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'seanchai'
          AND table_name   = 'searches'
          AND column_name  = 'source'
    ) THEN
        ALTER TABLE seanchai.searches ADD COLUMN source TEXT;
        UPDATE seanchai.searches SET source = 'FamilySearch Full Text';
    END IF;
END
$$;

ALTER TABLE seanchai.searches
    ADD COLUMN IF NOT EXISTS search_url TEXT;


-- -----------------------------------------------------------------------------
-- 2. Rebuild the detail view (new columns go first, so a column list can't be
--    extended in place with CREATE OR REPLACE)
-- -----------------------------------------------------------------------------
DROP VIEW IF EXISTS seanchai.v_search_detail;

CREATE VIEW seanchai.v_search_detail AS
SELECT
    s.source,
    s.search_url,
    s.search_id,
    s.search_terms,
    s.county_scope,
    s.year_filter,
    s.result_count,
    s.status,
    s.notes,
    s.searched_at
FROM seanchai.searches s;

GRANT SELECT ON seanchai.v_search_detail TO steward;


-- -----------------------------------------------------------------------------
-- api.get_search_detail — same as 10f; recreated so it is bound to the new view
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.get_search_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT to_jsonb(v) || jsonb_build_object('id', s.id)
    FROM seanchai.v_search_detail v
    JOIN seanchai.searches s USING (search_id)
    WHERE s.id = p_id;
$$;


-- -----------------------------------------------------------------------------
-- 3. api.save_search — 10f's version plus source and search_url
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_search(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id        BIGINT;
    v_search_id TEXT;
    v_next      INTEGER;
BEGIN
    IF payload->>'id' IS NULL THEN
        v_search_id := NULLIF(TRIM(payload->>'search_id'), '');

        IF v_search_id IS NULL THEN
            PERFORM pg_advisory_xact_lock(hashtext('seanchai.searches:SRCH'));

            SELECT COALESCE(MAX(SUBSTRING(search_id FROM '^SRCH-(\d+)$')::INTEGER), 0) + 1
            INTO v_next
            FROM seanchai.searches
            WHERE search_id LIKE 'SRCH-%';

            v_search_id := seanchai.format_ledger_id('SRCH', v_next);
        END IF;

        INSERT INTO seanchai.searches (
            search_id, search_terms, county_scope,
            year_filter, result_count, status, notes, searched_at,
            source, search_url,
            created_by, updated_by
        ) VALUES (
            v_search_id,
            payload->>'search_terms',
            payload->>'county_scope',
            payload->>'year_filter',
            (payload->>'result_count')::INTEGER,
            COALESCE(payload->>'status', 'complete'),
            payload->>'notes',
            (payload->>'searched_at')::TIMESTAMPTZ,
            NULLIF(TRIM(payload->>'source'), ''),
            NULLIF(TRIM(payload->>'search_url'), ''),
            user_id,
            user_id
        )
        RETURNING id INTO v_id;
    ELSE
        v_id := (payload->>'id')::BIGINT;
        UPDATE seanchai.searches SET
            search_id    = COALESCE(NULLIF(TRIM(payload->>'search_id'), ''), search_id),
            search_terms = COALESCE(payload->>'search_terms',                search_terms),
            county_scope = COALESCE(payload->>'county_scope',                county_scope),
            year_filter  = COALESCE(payload->>'year_filter',                 year_filter),
            result_count = COALESCE((payload->>'result_count')::INTEGER,     result_count),
            status       = COALESCE(payload->>'status',                      status),
            notes        = COALESCE(payload->>'notes',                       notes),
            searched_at  = COALESCE((payload->>'searched_at')::TIMESTAMPTZ,  searched_at),
            -- Present key = set (blank or null clears); absent key = keep.
            source       = CASE WHEN payload ? 'source'
                                THEN NULLIF(TRIM(payload->>'source'), '')
                                ELSE source END,
            search_url   = CASE WHEN payload ? 'search_url'
                                THEN NULLIF(TRIM(payload->>'search_url'), '')
                                ELSE search_url END,
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
-- GRANTs — re-run after every new api.* function (snapshot, not a policy)
-- =============================================================================

GRANT SELECT, INSERT, UPDATE ON seanchai.searches TO steward;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
