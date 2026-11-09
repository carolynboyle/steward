-- =============================================================================
-- 10k_seanchai_record_documents.sql — Multi-part documents for ledger records
-- =============================================================================
--
-- A ledger record (a deed, a will...) can span many pages, and each page has
-- two faces: the original image on FamilySearch and a markdown transcription
-- kept in the seanchai repo. This file adds one row per PART of a record:
--
--   seanchai.record_documents
--     record_id   the ledger record (internal id)
--     seq         reading order within the record, auto-assigned on insert
--     label       e.g. 'Deed Book 12, p. 340-341'
--     source_url  link to the original image (FamilySearch)
--     md_path     transcription, relative to the seanchai repo root,
--                 e.g. 'docs/records/PR-033/01.md'
--     status      not_transcribed | raw | cleaned | verified
--
-- Either source_url or md_path may be empty (a part with only a URL is
-- simply "not transcribed yet"), but not both.
--
-- This REPLACES seanchai.records.source_url as the home for links. The old
-- column is left in place (additive changes only) and every existing value
-- is copied in here as part 1 of its record. The column is dropped in a
-- later cleanup, after the Curator forms stop using it.
--
-- Also in this file:
--   - api.list_record_documents / save_record_document / delete_record_document
--   - api.get_record_detail now includes a 'documents' array
--   - api.get_task_linked_records now includes document_count, and its
--     'source_url' falls back to the first part's URL
--
-- NOT in this file (deploys with the Curator panel change, together with
-- fieldkit_overrides.yaml): any change to seanchai.v_record_detail.
--
-- Depends on: 07c_seanchai.sql, 10f_seanchai_autonumber.sql (get_record_detail),
--             10j_seanchai_task_records_api.sql (get_task_linked_records)
-- =============================================================================


-- -----------------------------------------------------------------------------
-- seanchai.record_documents
-- -----------------------------------------------------------------------------
CREATE TABLE seanchai.record_documents (
    id          BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    record_id   BIGINT      NOT NULL REFERENCES seanchai.records (id) ON DELETE CASCADE,
    seq         INTEGER     NOT NULL,
    label       TEXT,
    source_url  TEXT,
    md_path     TEXT,
    status      VARCHAR(20) NOT NULL DEFAULT 'not_transcribed',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by  BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL,
    updated_by  BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL,
    CONSTRAINT uq_record_documents_seq UNIQUE (record_id, seq),
    CONSTRAINT ck_record_documents_seq CHECK (seq >= 1),
    CONSTRAINT ck_record_documents_status
        CHECK (status IN ('not_transcribed', 'raw', 'cleaned', 'verified')),
    CONSTRAINT ck_record_documents_has_target
        CHECK (source_url IS NOT NULL OR md_path IS NOT NULL),
    -- repo-relative only: no leading slash, no parent-directory hops
    CONSTRAINT ck_record_documents_md_path
        CHECK (md_path IS NULL OR (md_path !~ '^/' AND md_path !~ '\.\.'))
);

CREATE INDEX idx_record_documents_record ON seanchai.record_documents (record_id, seq);

CREATE TRIGGER trg_record_documents_updated_at
    BEFORE UPDATE ON seanchai.record_documents
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER trg_record_documents_audit
    AFTER INSERT OR UPDATE OR DELETE ON seanchai.record_documents
    FOR EACH ROW EXECUTE FUNCTION audit.log_change();


-- -----------------------------------------------------------------------------
-- Copy each existing source_url in as part 1 (safe to re-run)
-- -----------------------------------------------------------------------------
INSERT INTO seanchai.record_documents (record_id, seq, source_url, status)
SELECT r.id, 1, TRIM(r.source_url), 'not_transcribed'
FROM seanchai.records r
WHERE NULLIF(TRIM(r.source_url), '') IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM seanchai.record_documents d WHERE d.record_id = r.id
  );


-- -----------------------------------------------------------------------------
-- api.list_record_documents(record_id) — parts in reading order
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.list_record_documents(p_record_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object(
                'id',         d.id,
                'record_id',  d.record_id,
                'seq',        d.seq,
                'label',      d.label,
                'source_url', d.source_url,
                'md_path',    d.md_path,
                'status',     d.status
            )
            ORDER BY d.seq
        ),
        '[]'::JSONB
    )
    FROM seanchai.record_documents d
    WHERE d.record_id = p_record_id;
$$;


-- -----------------------------------------------------------------------------
-- api.get_record_detail — same as 10f, plus the documents array
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
-- api.save_record_document(payload, user_id)
--
-- Insert (no 'id' in payload): needs 'record_id' (internal id). 'seq' is
-- assigned as the record's highest seq + 1 unless the payload supplies one.
-- Update ('id' present): only keys present in the payload change, so a key
-- sent as '' or null clears that field.
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_record_document(payload JSONB, user_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id     BIGINT;
    v_rec    BIGINT;
    v_seq    INTEGER;
    v_url    TEXT;
    v_path   TEXT;
    v_status TEXT;
BEGIN
    IF payload->>'id' IS NULL THEN
        v_rec := (payload->>'record_id')::BIGINT;

        IF v_rec IS NULL OR NOT EXISTS (SELECT 1 FROM seanchai.records WHERE id = v_rec) THEN
            RETURN jsonb_build_object(
                'success', false, 'message', 'Record not found', 'data', '{}'::JSONB
            );
        END IF;

        v_seq := (payload->>'seq')::INTEGER;
        IF v_seq IS NULL THEN
            PERFORM pg_advisory_xact_lock(hashtext('seanchai.record_documents:' || v_rec));
            SELECT COALESCE(MAX(seq), 0) + 1 INTO v_seq
            FROM seanchai.record_documents
            WHERE record_id = v_rec;
        END IF;

        v_url    := NULLIF(TRIM(payload->>'source_url'), '');
        v_path   := NULLIF(TRIM(payload->>'md_path'), '');
        v_status := COALESCE(
            NULLIF(TRIM(payload->>'status'), ''),
            CASE WHEN v_path IS NULL THEN 'not_transcribed' ELSE 'raw' END
        );

        INSERT INTO seanchai.record_documents (
            record_id, seq, label, source_url, md_path, status,
            created_by, updated_by
        ) VALUES (
            v_rec, v_seq,
            NULLIF(TRIM(payload->>'label'), ''),
            v_url, v_path, v_status,
            user_id, user_id
        )
        RETURNING id INTO v_id;
    ELSE
        v_id := (payload->>'id')::BIGINT;
        UPDATE seanchai.record_documents SET
            seq        = COALESCE((payload->>'seq')::INTEGER, seq),
            label      = CASE WHEN payload ? 'label'
                              THEN NULLIF(TRIM(payload->>'label'), '') ELSE label END,
            source_url = CASE WHEN payload ? 'source_url'
                              THEN NULLIF(TRIM(payload->>'source_url'), '') ELSE source_url END,
            md_path    = CASE WHEN payload ? 'md_path'
                              THEN NULLIF(TRIM(payload->>'md_path'), '') ELSE md_path END,
            status     = COALESCE(NULLIF(TRIM(payload->>'status'), ''), status),
            updated_by = user_id
        WHERE id = v_id;

        IF NOT FOUND THEN
            RETURN jsonb_build_object(
                'success', false, 'message', 'Document part not found', 'data', '{}'::JSONB
            );
        END IF;
    END IF;

    RETURN jsonb_build_object(
        'success', true,
        'data',    (SELECT jsonb_build_object(
                        'id',         d.id,
                        'record_id',  d.record_id,
                        'seq',        d.seq,
                        'label',      d.label,
                        'source_url', d.source_url,
                        'md_path',    d.md_path,
                        'status',     d.status)
                    FROM seanchai.record_documents d WHERE d.id = v_id),
        'message', 'OK'
    );

EXCEPTION
    WHEN unique_violation THEN
        RETURN jsonb_build_object(
            'success', false, 'message', 'That part number is already used for this record',
            'data', '{}'::JSONB
        );
    WHEN check_violation THEN
        RETURN jsonb_build_object(
            'success', false,
            'message', 'A part needs a source URL or a transcription path, a repo-relative path, and a valid status',
            'data', '{}'::JSONB
        );
END;
$$;


-- -----------------------------------------------------------------------------
-- api.delete_record_document(id) — removes one part (the audit log keeps it)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.delete_record_document(p_id BIGINT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    DELETE FROM seanchai.record_documents WHERE id = p_id;

    IF NOT FOUND THEN
        RETURN jsonb_build_object(
            'success', false, 'message', 'Document part not found', 'data', '{}'::JSONB
        );
    END IF;

    RETURN jsonb_build_object('success', true, 'data', '{}'::JSONB, 'message', 'OK');
END;
$$;


-- -----------------------------------------------------------------------------
-- api.get_task_linked_records — same as 10j, plus document_count; source_url
-- falls back to the first part's URL once records.source_url is retired
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.get_task_linked_records(p_task_id BIGINT)
RETURNS JSONB
LANGUAGE sql
SECURITY DEFINER
AS $$
    SELECT COALESCE(
        jsonb_agg(
            jsonb_build_object(
                'id',               r.id,
                'record_id',        r.record_id,
                'type_code',        rt.code,
                'record_type',      rt.name,
                'year',             r.year,
                'subject',          r.subject,
                'county',           r.county,
                'source_citation',  r.source_citation,
                'source_url',       COALESCE(
                    (SELECT d.source_url
                     FROM seanchai.record_documents d
                     WHERE d.record_id = r.id AND d.source_url IS NOT NULL
                     ORDER BY d.seq LIMIT 1),
                    r.source_url),
                'document_count',   (SELECT COUNT(*)
                                     FROM seanchai.record_documents d
                                     WHERE d.record_id = r.id)
            )
            ORDER BY r.display_order, r.record_id
        ),
        '[]'::JSONB
    )
    FROM seanchai.task_records tr
    JOIN seanchai.records      r  ON r.id  = tr.record_id
    JOIN seanchai.record_type  rt ON rt.id = r.record_type_id
    WHERE tr.task_id = p_task_id;
$$;


-- =============================================================================
-- GRANTs — re-run after every new api.* function (snapshot, not a policy)
-- =============================================================================

GRANT SELECT, INSERT, UPDATE, DELETE ON seanchai.record_documents TO steward;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA seanchai TO steward;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
