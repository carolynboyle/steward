-- =============================================================================
-- 10i_seanchai_todos_to_tasks.sql — Research todos become Seanchaí tasks
-- =============================================================================
--
-- The seanchaí todo list (seanchai.todos, from 10d) predates the Seanchaí
-- crew role. Now that the Seanchaí owns projects (10h), research to-dos
-- are ordinary tasks. This file:
--
--   1. Creates the project "FamilySearch Research" — type genealogy,
--      status active, owned by the Seanchaí.
--   2. Copies every todo into it as a task:
--        description   -> description
--        notes         -> notes, plus a closing line "Was TODO-nnn" so
--                         cross-references between todos still resolve
--        priority      -> high / normal (was medium) / low
--        status        -> open & deferred -> backlog, complete -> complete
--        completed_at, created_at carried over
--   3. Creates seanchai.task_records (task <-> research record) and copies
--      the todo -> record links into it. Not shown in the UI yet.
--
-- The seanchai.todos / todo_records / todo_status tables are left in place,
-- unused (additive rule). Drop them in a later cleanup once the tasks are
-- confirmed; 10e (a todo API) is no longer needed.
--
-- Safe to re-run: the project is matched by slug, and a todo whose task
-- already exists (by its "Was TODO-nnn" line) is skipped.
--
-- Depends on: 10d_seanchai_todos.sql (+ data import), 10h_crew_role_seanchai.sql
-- =============================================================================

BEGIN;

-- -----------------------------------------------------------------------------
-- 1. The project
-- -----------------------------------------------------------------------------
INSERT INTO projects.projects (name, slug, description, status_id, type_id, crew_role_id)
SELECT
    'FamilySearch Research',
    'familysearch-research',
    'Research to-dos for the Boyle family history, migrated from the '
        || 'seanchaí research ledger''s todo list (2026-10-22).',
    (SELECT id FROM projects.project_status WHERE name = 'active'),
    (SELECT id FROM projects.project_type   WHERE name = 'genealogy'),
    (SELECT id FROM identity.crew_role      WHERE name = 'seanchai')
ON CONFLICT (slug) DO NOTHING;


-- -----------------------------------------------------------------------------
-- 2. Task <-> research record links
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS seanchai.task_records (
    id        BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    task_id   BIGINT NOT NULL REFERENCES projects.tasks   (id) ON DELETE CASCADE,
    record_id BIGINT NOT NULL REFERENCES seanchai.records (id) ON DELETE CASCADE,
    CONSTRAINT uq_task_records UNIQUE (task_id, record_id)
);

CREATE INDEX IF NOT EXISTS idx_task_records_task   ON seanchai.task_records (task_id);
CREATE INDEX IF NOT EXISTS idx_task_records_record ON seanchai.task_records (record_id);

GRANT SELECT, INSERT, UPDATE, DELETE ON seanchai.task_records TO steward;


-- -----------------------------------------------------------------------------
-- 3. Todos -> tasks, with their record links
-- -----------------------------------------------------------------------------
DO $$
DECLARE
    v_project_id BIGINT;
    v_task_id    BIGINT;
    v_marker     TEXT;
    r            RECORD;
BEGIN
    SELECT id INTO v_project_id
    FROM projects.projects WHERE slug = 'familysearch-research';

    FOR r IN
        SELECT t.*, ts.name AS status_name
        FROM seanchai.todos t
        JOIN seanchai.todo_status ts ON ts.id = t.todo_status_id
        ORDER BY t.todo_id
    LOOP
        v_marker := 'Was ' || r.todo_id;

        -- Already migrated?
        CONTINUE WHEN EXISTS (
            SELECT 1 FROM projects.tasks
            WHERE project_id = v_project_id
              AND notes LIKE '%' || v_marker
        );

        INSERT INTO projects.tasks (
            project_id, description, notes,
            status_id, priority_id,
            completed_at, created_at
        ) VALUES (
            v_project_id,
            r.description,
            CONCAT_WS(E'\n\n', NULLIF(TRIM(r.notes), ''), v_marker),
            (SELECT id FROM projects.task_status
             WHERE name = CASE r.status_name WHEN 'complete' THEN 'complete' ELSE 'backlog' END),
            (SELECT id FROM projects.priority
             WHERE name = CASE r.priority WHEN 'medium' THEN 'normal' ELSE r.priority END),
            r.completed_at,
            r.created_at
        )
        RETURNING id INTO v_task_id;

        INSERT INTO seanchai.task_records (task_id, record_id)
        SELECT v_task_id, tr.record_id
        FROM seanchai.todo_records tr
        WHERE tr.todo_id = r.id
        ON CONFLICT ON CONSTRAINT uq_task_records DO NOTHING;
    END LOOP;
END;
$$;

COMMIT;


-- -----------------------------------------------------------------------------
-- Report
-- -----------------------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM seanchai.todos)                          AS todos,
    (SELECT COUNT(*) FROM projects.tasks t
       JOIN projects.projects p ON p.id = t.project_id
      WHERE p.slug = 'familysearch-research')                      AS tasks,
    (SELECT COUNT(*) FROM seanchai.todo_records)                   AS todo_links,
    (SELECT COUNT(*) FROM seanchai.task_records)                   AS task_links;
