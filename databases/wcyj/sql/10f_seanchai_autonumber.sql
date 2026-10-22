-- =============================================================================
-- 10f_seanchai_autonumber.sql — Auto-assign ledger IDs on insert
-- =============================================================================
--
-- Replaces api.save_record and api.save_search (last defined in
-- 07b_seanchai_fix.sql) so that a new row with no ledger ID gets one
-- assigned server-side:
--
--   records:  <type code>-NNN   e.g. PR-058, WL-006, EX-018
--             next number = highest existing number for that prefix + 1
--   searches: SRCH-NNN          e.g. SRCH-013
--
-- Numbers are zero-padded to 3 digits and widen naturally past 999
-- (PR-1000), so they never truncate.
--
-- An explicit record_id / search_id in the payload is still honoured —
-- useful for scripted imports. The Curator form never sends one on insert.
--
-- Updates are unchanged: the visible ID is never renumbered, even if a
-- record's type changes, because notes and links throughout the ledger
-- refer to records by that text.
--
-- Concurrency: a transaction-scoped advisory lock per prefix serialises
-- ID assignment, so two simultaneous saves can't pick the same number.
--
-- Depends on: 07b_seanchai_fix.sql (api.get_record_detail,
--             api.get_search_detail)
-- =============================================================================


-- -----------------------------------------------------------------------------
-- Helper: format a number as a ledger suffix — 3-digit minimum, no truncation
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION seanchai.format_ledger_id(p_prefix TEXT, p_n INTEGER)
RETURNS TEXT
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT p_prefix || '-' || LPAD(p_n::TEXT, GREATEST(3, LENGTH(p_n::TEXT)), '0');
$$;


-- -----------------------------------------------------------------------------
-- api.save_record(payload, user_id)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_record(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id        BIGINT;
    v_record_id TEXT;
    v_code      TEXT;
    v_next      INTEGER;
BEGIN
    IF payload->>'id' IS NULL THEN
        v_record_id := NULLIF(TRIM(payload->>'record_id'), '');

        IF v_record_id IS NULL THEN
            SELECT code INTO v_code
            FROM seanchai.record_type
            WHERE id = (payload->>'record_type_id')::BIGINT;

            IF v_code IS NULL THEN
                RETURN jsonb_build_object(
                    'success', false,
                    'message', 'Choose a record type before saving',
                    'data',    '{}'::JSONB
                );
            END IF;

            PERFORM pg_advisory_xact_lock(hashtext('seanchai.records:' || v_code));

            SELECT COALESCE(MAX(SUBSTRING(record_id FROM '^' || v_code || '-(\d+)$')::INTEGER), 0) + 1
            INTO v_next
            FROM seanchai.records
            WHERE record_id LIKE v_code || '-%';

            v_record_id := seanchai.format_ledger_id(v_code, v_next);
        END IF;

        INSERT INTO seanchai.records (
            record_id, record_type_id, record_status_id,
            display_order, year, subject,
            county, state, source_citation, source_url, notes,
            created_by, updated_by
        ) VALUES (
            v_record_id,
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
            record_id        = COALESCE(NULLIF(TRIM(payload->>'record_id'), ''), record_id),
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


-- -----------------------------------------------------------------------------
-- api.save_search(payload, user_id)
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


-- -----------------------------------------------------------------------------
-- GRANTs — CREATE OR REPLACE keeps existing grants on the two api functions;
-- the helper is called only from SECURITY DEFINER code, so no grant needed.
-- -----------------------------------------------------------------------------
