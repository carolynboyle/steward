-- =============================================================================
-- 10d_seanchai_todos.sql — Seanchaí research to-do list
-- =============================================================================
--
-- Adds a todos table and a todo_records junction table to the seanchai schema.
-- Todos are research action items that may reference zero or more source
-- records (PR-001, WL-003, etc.) tracked in seanchai.records.
--
-- Priority values: high, medium, low
-- Status values:   open, complete, deferred
--
-- Depends on: 07_seanchai.sql (seanchai schema, seanchai.records)
--             01_audit.sql    (audit.log_change, public.set_updated_at)
--             02_identity.sql (identity.app_user for created_by/updated_by)
--
-- API functions (save_todo, delete_todo) are in 10e_seanchai_todos_api.sql.
-- =============================================================================

-- =============================================================================
-- Lookup table
-- =============================================================================

CREATE TABLE seanchai.todo_status (
    id   BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO seanchai.todo_status (name) VALUES
    ('open'),
    ('complete'),
    ('deferred');


-- =============================================================================
-- seanchai.todos
-- =============================================================================

CREATE TABLE seanchai.todos (
    id             BIGINT      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    todo_id        VARCHAR(20) NOT NULL UNIQUE,   -- TODO-001, TODO-002, etc.
    priority       VARCHAR(10) NOT NULL DEFAULT 'medium'
                               CHECK (priority IN ('high', 'medium', 'low')),
    description    TEXT        NOT NULL,
    todo_status_id BIGINT      NOT NULL REFERENCES seanchai.todo_status (id),
    notes          TEXT,
    completed_at   TIMESTAMPTZ,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by     BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL,
    updated_by     BIGINT      REFERENCES identity.app_user (id) ON DELETE SET NULL
);

CREATE INDEX idx_todos_status   ON seanchai.todos (todo_status_id);
CREATE INDEX idx_todos_priority ON seanchai.todos (priority);

CREATE TRIGGER trg_todos_updated_at
    BEFORE UPDATE ON seanchai.todos
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER trg_todos_audit
    AFTER INSERT OR UPDATE OR DELETE ON seanchai.todos
    FOR EACH ROW EXECUTE FUNCTION audit.log_change();


-- =============================================================================
-- seanchai.todo_records — many-to-many: todos <-> records
-- =============================================================================

CREATE TABLE seanchai.todo_records (
    id        BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    todo_id   BIGINT NOT NULL REFERENCES seanchai.todos   (id) ON DELETE CASCADE,
    record_id BIGINT NOT NULL REFERENCES seanchai.records (id) ON DELETE CASCADE,
    CONSTRAINT uq_todo_records UNIQUE (todo_id, record_id)
);

CREATE INDEX idx_todo_records_todo   ON seanchai.todo_records (todo_id);
CREATE INDEX idx_todo_records_record ON seanchai.todo_records (record_id);


-- =============================================================================
-- Views
-- =============================================================================

CREATE VIEW seanchai.v_todo_list AS
SELECT
    t.id,
    t.todo_id,
    t.priority,
    LEFT(t.description, 120)    AS description,
    ts.name                     AS status,
    COUNT(tr.record_id)         AS related_record_count,
    t.completed_at,
    t.updated_at
FROM seanchai.todos t
JOIN seanchai.todo_status ts ON ts.id = t.todo_status_id
LEFT JOIN seanchai.todo_records tr ON tr.todo_id = t.id
GROUP BY t.id, t.todo_id, t.priority, t.description, ts.name,
         t.completed_at, t.updated_at
ORDER BY
    CASE t.priority WHEN 'high' THEN 1 WHEN 'medium' THEN 2 WHEN 'low' THEN 3 END,
    t.todo_id;

CREATE VIEW seanchai.v_todo_detail AS
SELECT
    t.id,
    t.todo_id,
    t.priority,
    t.description,
    t.todo_status_id,
    ts.name                                         AS status,
    t.notes,
    t.completed_at,
    ARRAY_AGG(r.record_id ORDER BY r.record_id)
        FILTER (WHERE r.record_id IS NOT NULL)      AS related_records,
    t.created_at,
    t.updated_at,
    t.created_by,
    t.updated_by
FROM seanchai.todos t
JOIN seanchai.todo_status ts ON ts.id = t.todo_status_id
LEFT JOIN seanchai.todo_records tr ON tr.todo_id = t.id
LEFT JOIN seanchai.records r       ON r.id = tr.record_id
GROUP BY t.id, t.todo_id, t.priority, t.description,
         t.todo_status_id, ts.name, t.notes, t.completed_at,
         t.created_at, t.updated_at, t.created_by, t.updated_by;


-- =============================================================================
-- GRANTs
-- =============================================================================

GRANT SELECT ON
    seanchai.todo_status,
    seanchai.v_todo_list,
    seanchai.v_todo_detail
TO steward;

GRANT SELECT, INSERT, UPDATE ON
    seanchai.todos,
    seanchai.todo_records
TO steward;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA seanchai TO steward;

-- web_app_user gets no direct table access here.
-- EXECUTE grants on api.save_todo / api.delete_todo are added in 10e.
