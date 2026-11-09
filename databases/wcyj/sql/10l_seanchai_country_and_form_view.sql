-- =============================================================================
-- 10l_seanchai_country_and_form_view.sql — Country on records; form view
--                                          without source_url
-- =============================================================================
--
-- 1. seanchai.records gets a country column (default 'United States';
--    existing rows take the default). County stays as is; state is now
--    treated as "state / province" by the form — the column is unchanged
--    (VARCHAR(50), default 'PA'), so Canadian provinces and other
--    regions fit without a schema change.
--
-- 2. seanchai.v_record_detail (the whitelist that defines the record
--    form) is rebuilt:
--      - country added after state (form order: county, state, country)
--      - source_url removed — links now live in seanchai.record_documents
--        (10k). The column itself stays on seanchai.records until a later
--        cleanup; nothing writes it from the Curator form any more.
--
-- 3. api.save_record is recreated (as in 10f) with country handled on
--    insert and update. It still tolerates a source_url key in the payload
--    so scripted imports keep working.
--
-- DEPLOY TOGETHER with the Curator release that adds the Documents widget
-- and the country entry in fieldkit_overrides.yaml: Curator validates every
-- v_*_detail view against that YAML at startup. Apply this file, then
-- immediately: git pull && docker compose up -d --build
--
-- Depends on: 07d_seanchai_fix.sql (v_record_detail), 10f_seanchai_autonumber.sql
--             (api.save_record, format_ledger_id, get_record_detail),
--             10k_seanchai_record_documents.sql
-- =============================================================================


-- -----------------------------------------------------------------------------
-- 1. Country column
-- -----------------------------------------------------------------------------
ALTER TABLE seanchai.records
    ADD COLUMN IF NOT EXISTS country TEXT NOT NULL DEFAULT 'United States';


-- -----------------------------------------------------------------------------
-- 2. Rebuild the detail view (a column can't be dropped with CREATE OR REPLACE)
-- -----------------------------------------------------------------------------
DROP VIEW IF EXISTS seanchai.v_record_detail;

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
    r.country,
    r.source_citation,
    r.notes
FROM seanchai.records r
JOIN seanchai.record_type   rt ON rt.id = r.record_type_id
JOIN seanchai.record_status rs ON rs.id = r.record_status_id;

GRANT SELECT ON seanchai.v_record_detail TO steward;


-- -----------------------------------------------------------------------------
-- api.get_record_detail — same as 10k; recreated so it is bound to the new view
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.get_record_detail(p_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT to_jsonb(v)
           || jsonb_build_object('id', r.id)
           || jsonb_build_object('documents', api.list_record_documents(r.id))
    FROM seanchai.v_record_detail v
    JOIN seanchai.records r USING (record_id)
    WHERE r.id = p_id;
$$;


-- -----------------------------------------------------------------------------
-- 3. api.save_record — 10f's version plus country
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
            county, state, country, source_citation, source_url, notes,
            created_by, updated_by
        ) VALUES (
            v_record_id,
            (payload->>'record_type_id')::BIGINT,
            COALESCE(
                (payload->>'record_status_id')::BIGINT,
                (SELECT id FROM seanchai.record_status WHERE name = 'active')
            ),
            COALESCE((payload->>'display_order')::INTEGER, 0),
            payload->>'year',
            payload->>'subject',
            payload->>'county',
            COALESCE(payload->>'state', 'PA'),
            COALESCE(NULLIF(TRIM(payload->>'country'), ''), 'United States'),
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
            country          = COALESCE(NULLIF(TRIM(payload->>'country'), ''),   country),
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
-- GRANTs — re-run after every new api.* function (snapshot, not a policy)
-- =============================================================================

GRANT SELECT, INSERT, UPDATE ON seanchai.records TO steward;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
