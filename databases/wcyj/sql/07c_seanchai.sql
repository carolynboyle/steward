-- =============================================================================
-- 07_seanchai.sql — Seanchaí research ledger schema
-- =============================================================================
--
-- Stores the primary source research ledger for the Seanchaí memoir project.
--   - records: primary source documents (deeds, wills, mortgages, military, etc.)
--   - searches: FamilySearch search log entries
--   - record_links: relationships between records
--
-- Record type codes:
--   PR   — property records (deeds, transfers)
--   WL   — wills
--   MG   — mortgages
--   GV   — government / county records
--   BIO  — biography and published histories
--   FB   — Felix Boyle Sr. specific records
--   MR   — military records
--   NR   — naturalization records
--   PT   — probate / testament
--   ROM  — Romania Farm specific
--   EX   — excluded (confirmed different person, kept for reference)
--
-- Depends on: 01_audit.sql (audit.log_change, public.set_updated_at)
--             02_identity.sql (identity.app_user for created_by/updated_by)
--             06_api.sql (api schema, web_app_user role)
-- =============================================================================
-- NOTE: Add to 00_drop.sql before the identity drop:
--   DROP SCHEMA IF EXISTS seanchai CASCADE;
-- =============================================================================

CREATE SCHEMA IF NOT EXISTS seanchai;


-- =============================================================================
-- Lookup tables
-- =============================================================================

CREATE TABLE seanchai.record_type (
    id   BIGINT       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(10)  NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE seanchai.record_status (
    id   BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


-- =============================================================================
-- seanchai.records — Primary source research ledger
-- =============================================================================

CREATE TABLE seanchai.records (
    id               BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    record_id        VARCHAR(20) NOT NULL UNIQUE,   -- PR-001, WL-003, etc.
    record_type_id   BIGINT      NOT NULL REFERENCES seanchai.record_type (id),
    record_status_id BIGINT      NOT NULL REFERENCES seanchai.record_status (id),
    display_order    INTEGER     NOT NULL DEFAULT 0,
    year             VARCHAR(20),                   -- flexible: 1834, ca.1820, 1820-1825
    subject          TEXT        NOT NULL,
    county           VARCHAR(100),
    state            VARCHAR(50) NOT NULL DEFAULT 'PA',
    source_citation  TEXT,
    source_url       TEXT,
    notes            TEXT,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by       BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL,
    updated_by       BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL
);

CREATE INDEX idx_records_type     ON seanchai.records (record_type_id);
CREATE INDEX idx_records_status   ON seanchai.records (record_status_id);
CREATE INDEX idx_records_order    ON seanchai.records (display_order);
CREATE INDEX idx_records_year     ON seanchai.records (year);

CREATE TRIGGER trg_records_updated_at
    BEFORE UPDATE ON seanchai.records
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER trg_records_audit
    AFTER INSERT OR UPDATE OR DELETE ON seanchai.records
    FOR EACH ROW EXECUTE FUNCTION audit.log_change();


-- =============================================================================
-- seanchai.searches — FamilySearch search log
-- =============================================================================

CREATE TABLE seanchai.searches (
    id           BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    search_id    VARCHAR(20) NOT NULL UNIQUE,   -- SRCH-001, etc.
    search_terms TEXT        NOT NULL,
    county_scope TEXT,
    year_filter  TEXT,                          -- flexible: 1820-1860, pre-1850
    result_count INTEGER,
    status       VARCHAR(50) NOT NULL DEFAULT 'complete',
    notes        TEXT,
    searched_at  TIMESTAMPTZ,
    created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by   BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL,
    updated_by   BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL
);

CREATE INDEX idx_searches_status ON seanchai.searches (status);

CREATE TRIGGER trg_searches_updated_at
    BEFORE UPDATE ON seanchai.searches
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER trg_searches_audit
    AFTER INSERT OR UPDATE OR DELETE ON seanchai.searches
    FOR EACH ROW EXECUTE FUNCTION audit.log_change();


-- =============================================================================
-- seanchai.record_links — Relationships between records
-- =============================================================================

CREATE TABLE seanchai.record_links (
    id                BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    record_id         BIGINT      NOT NULL REFERENCES seanchai.records (id) ON DELETE CASCADE,
    related_record_id BIGINT      NOT NULL REFERENCES seanchai.records (id) ON DELETE CASCADE,
    relationship      VARCHAR(100),             -- supports, same_person, contradicts, etc.
    notes             TEXT,
    created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_record_links UNIQUE (record_id, related_record_id)
);

CREATE INDEX idx_record_links_record  ON seanchai.record_links (record_id);
CREATE INDEX idx_record_links_related ON seanchai.record_links (related_record_id);


-- =============================================================================
-- Views (fieldkit uses these to auto-generate list and detail forms)
-- =============================================================================

CREATE VIEW seanchai.v_record_list AS
SELECT
    r.id,
    r.record_id,
    rt.code   AS type_code,
    rt.name   AS record_type,
    rs.name   AS status,
    r.display_order,
    r.year,
    r.subject,
    r.county,
    r.state,
    r.updated_at
FROM seanchai.records r
JOIN seanchai.record_type   rt ON rt.id = r.record_type_id
JOIN seanchai.record_status rs ON rs.id = r.record_status_id
ORDER BY r.display_order, r.record_id;

CREATE VIEW seanchai.v_record_detail AS
SELECT
    r.id,
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
    r.notes,
    r.created_at,
    r.updated_at,
    r.created_by,
    r.updated_by
FROM seanchai.records r
JOIN seanchai.record_type   rt ON rt.id = r.record_type_id
JOIN seanchai.record_status rs ON rs.id = r.record_status_id;

CREATE VIEW seanchai.v_search_list AS
SELECT
    s.id,
    s.search_id,
    s.search_terms,
    s.county_scope,
    s.year_filter,
    s.result_count,
    s.status,
    s.searched_at,
    s.updated_at
FROM seanchai.searches s
ORDER BY s.search_id;

CREATE VIEW seanchai.v_search_detail AS
SELECT
    s.id,
    s.search_id,
    s.search_terms,
    s.county_scope,
    s.year_filter,
    s.result_count,
    s.status,
    s.notes,
    s.searched_at,
    s.created_at,
    s.updated_at,
    s.created_by,
    s.updated_by
FROM seanchai.searches s;


-- =============================================================================
-- API functions
-- All SECURITY DEFINER. Return: {"success": bool, "data": {...}, "message": str}
-- =============================================================================

-- ---------------------------------------------------------------------------
-- api.save_record(payload, user_id)
-- INSERT when payload.id is absent; UPDATE when present.
-- Payload fields: id?, record_id, record_type_id, record_status_id,
--   display_order, year, subject, county, state,
--   source_citation, source_url, notes
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_record(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id  BIGINT;
    v_row seanchai.v_record_detail%ROWTYPE;
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

    SELECT * INTO v_row FROM seanchai.v_record_detail WHERE id = v_id;
    RETURN jsonb_build_object('success', true, 'data', to_jsonb(v_row), 'message', 'OK');

EXCEPTION WHEN unique_violation THEN
    RETURN jsonb_build_object(
        'success', false, 'message', 'Record ID already exists', 'data', '{}'::JSONB
    );
END;
$$;


-- ---------------------------------------------------------------------------
-- api.delete_record(id, user_id)
-- Soft-delete: sets status to 'excluded'. Preserves the record for reference.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.delete_record(p_id BIGINT, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_excluded_id BIGINT;
BEGIN
    SELECT id INTO v_excluded_id
    FROM seanchai.record_status
    WHERE name = 'excluded';

    UPDATE seanchai.records
    SET record_status_id = v_excluded_id, updated_by = user_id
    WHERE id = p_id;

    IF NOT FOUND THEN
        RETURN jsonb_build_object(
            'success', false, 'message', 'Record not found', 'data', '{}'::JSONB
        );
    END IF;

    RETURN jsonb_build_object('success', true, 'data', '{}'::JSONB, 'message', 'Record excluded');
END;
$$;


-- ---------------------------------------------------------------------------
-- api.save_search(payload, user_id)
-- Payload fields: id?, search_id, search_terms, county_scope,
--   year_filter, result_count, status, notes, searched_at
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_search(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id  BIGINT;
    v_row seanchai.v_search_detail%ROWTYPE;
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

    SELECT * INTO v_row FROM seanchai.v_search_detail WHERE id = v_id;
    RETURN jsonb_build_object('success', true, 'data', to_jsonb(v_row), 'message', 'OK');

EXCEPTION WHEN unique_violation THEN
    RETURN jsonb_build_object(
        'success', false, 'message', 'Search ID already exists', 'data', '{}'::JSONB
    );
END;
$$;


-- ---------------------------------------------------------------------------
-- api.delete_search(id, user_id)
-- Hard delete — searches are log entries, no history value.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.delete_search(p_id BIGINT, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    DELETE FROM seanchai.searches WHERE id = p_id;

    IF NOT FOUND THEN
        RETURN jsonb_build_object(
            'success', false, 'message', 'Search not found', 'data', '{}'::JSONB
        );
    END IF;

    RETURN jsonb_build_object('success', true, 'data', '{}'::JSONB, 'message', 'Deleted');
END;
$$;


-- =============================================================================
-- Seed data
-- =============================================================================

INSERT INTO seanchai.record_type (code, name) VALUES
    ('PR',  'Property Records'),
    ('WL',  'Wills'),
    ('MG',  'Mortgages'),
    ('GV',  'Government Records'),
    ('BIO', 'Biography / Published History'),
    ('FB',  'Felix Boyle Sr. Records'),
    ('MR',  'Military Records'),
    ('NR',  'Naturalization Records'),
    ('PT',  'Probate / Testament'),
    ('ROM', 'Romania Farm'),
    ('EX',  'Excluded (Different Person)');

INSERT INTO seanchai.record_status (name) VALUES
    ('active'),
    ('excluded'),
    ('needs_review'),
    ('duplicate');


-- =============================================================================
-- GRANTs
-- =============================================================================

GRANT USAGE ON SCHEMA seanchai TO steward;

GRANT SELECT, INSERT, UPDATE ON
    seanchai.records,
    seanchai.searches,
    seanchai.record_links
TO steward;

GRANT SELECT ON
    seanchai.record_type,
    seanchai.record_status,
    seanchai.v_record_list,
    seanchai.v_record_detail,
    seanchai.v_search_list,
    seanchai.v_search_detail
TO steward;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA seanchai TO steward;

-- web_app_user: EXECUTE on api functions only — no direct table access
GRANT EXECUTE ON FUNCTION
    api.save_record(JSONB, BIGINT),
    api.delete_record(BIGINT, BIGINT),
    api.save_search(JSONB, BIGINT),
    api.delete_search(BIGINT, BIGINT)
TO web_app_user;
