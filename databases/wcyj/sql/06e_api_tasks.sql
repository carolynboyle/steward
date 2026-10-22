-- =============================================================================
-- 06e_api_tasks.sql — API schema: projects.tasks save/delete procedures
-- =============================================================================
-- In the old DB these were appended to 06b_api_projects.sql (CHANGEDOC_TASKS_SQL_LAYER,
-- Section 4). Here they are a separate additive file because 06_api.sql (which
-- contains the 06b content) is already applied. Text is unchanged.
-- Depends on: 03_projects.sql, 03b_tasks_drop_sort_order.sql
-- =============================================================================

CREATE OR REPLACE FUNCTION api.save_task(
    p_payload JSONB,
    p_user_id BIGINT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id                 BIGINT;
    v_project_id         BIGINT;
    v_parent_id          BIGINT;
    v_description        TEXT;
    v_notes              TEXT;
    v_status_id          BIGINT;
    v_priority_id        BIGINT;
    v_is_terminal        BOOLEAN;
    v_completed_at       TIMESTAMPTZ;
    v_is_update          BOOLEAN;
    v_parent_project_id  BIGINT;
BEGIN
    v_description := TRIM(p_payload->>'description');

    IF v_description IS NULL OR v_description = '' THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Task description is required.'
        );
    END IF;

    v_project_id := (p_payload->>'project_id')::BIGINT;

    IF v_project_id IS NULL THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'A project is required.'
        );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM projects.projects WHERE id = v_project_id) THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Project not found.'
        );
    END IF;

    v_status_id := (p_payload->>'status_id')::BIGINT;

    IF v_status_id IS NULL THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Task status is required.'
        );
    END IF;

    SELECT is_terminal INTO v_is_terminal
    FROM projects.task_status
    WHERE id = v_status_id;

    IF NOT FOUND THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Task status not found.'
        );
    END IF;

    v_priority_id := (p_payload->>'priority_id')::BIGINT;
    v_notes       := NULLIF(TRIM(p_payload->>'notes'), '');
    v_parent_id   := (p_payload->>'parent_id')::BIGINT;
    v_id          := (p_payload->>'id')::BIGINT;
    v_is_update   := v_id IS NOT NULL;

    IF v_parent_id IS NOT NULL THEN
        IF v_is_update AND v_parent_id = v_id THEN
            RETURN jsonb_build_object(
                'success', FALSE,
                'data',    NULL,
                'message', 'A task cannot be its own parent.'
            );
        END IF;

        SELECT project_id INTO v_parent_project_id
        FROM projects.tasks
        WHERE id = v_parent_id;

        IF NOT FOUND THEN
            RETURN jsonb_build_object(
                'success', FALSE,
                'data',    NULL,
                'message', 'Parent task not found.'
            );
        END IF;

        IF v_parent_project_id != v_project_id THEN
            RETURN jsonb_build_object(
                'success', FALSE,
                'data',    NULL,
                'message', 'Parent task must belong to the same project.'
            );
        END IF;
    END IF;

    v_completed_at := CASE WHEN v_is_terminal THEN NOW() ELSE NULL END;

    IF v_is_update THEN
        IF NOT EXISTS (SELECT 1 FROM projects.tasks WHERE id = v_id) THEN
            RETURN jsonb_build_object(
                'success', FALSE,
                'data',    NULL,
                'message', 'Task not found.'
            );
        END IF;

        UPDATE projects.tasks SET
            project_id   = v_project_id,
            parent_id    = v_parent_id,
            description  = v_description,
            notes        = v_notes,
            status_id    = v_status_id,
            priority_id  = v_priority_id,
            completed_at = v_completed_at,
            updated_by   = p_user_id
        WHERE id = v_id;

        RETURN jsonb_build_object(
            'success', TRUE,
            'data',    jsonb_build_object('id', v_id),
            'message', 'Task updated.'
        );
    ELSE
        INSERT INTO projects.tasks (
            project_id, parent_id, description, notes,
            status_id, priority_id, completed_at,
            created_by, updated_by
        ) VALUES (
            v_project_id, v_parent_id, v_description, v_notes,
            v_status_id, v_priority_id, v_completed_at,
            p_user_id, p_user_id
        )
        RETURNING id INTO v_id;

        RETURN jsonb_build_object(
            'success', TRUE,
            'data',    jsonb_build_object('id', v_id),
            'message', 'Task created.'
        );
    END IF;

EXCEPTION WHEN OTHERS THEN
    RAISE WARNING 'api.save_task error: %', SQLERRM;
    RETURN jsonb_build_object(
        'success', FALSE,
        'data',    NULL,
        'message', 'An unexpected error occurred saving the task.'
    );
END;
$$;


CREATE OR REPLACE FUNCTION api.delete_task(
    p_id      BIGINT,
    p_user_id BIGINT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM projects.tasks WHERE id = p_id) THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Task not found.'
        );
    END IF;

    IF EXISTS (SELECT 1 FROM projects.tasks WHERE parent_id = p_id) THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Cannot delete task — it has subtasks. Delete or reassign them first.'
        );
    END IF;

    DELETE FROM projects.tasks WHERE id = p_id;

    RETURN jsonb_build_object(
        'success', TRUE,
        'data',    jsonb_build_object('id', p_id),
        'message', 'Task deleted.'
    );

EXCEPTION WHEN foreign_key_violation THEN
    RETURN jsonb_build_object(
        'success', FALSE,
        'data',    NULL,
        'message', 'Cannot delete task — it has dependent records.'
    );
WHEN OTHERS THEN
    RAISE WARNING 'api.delete_task error for id %: %', p_id, SQLERRM;
    RETURN jsonb_build_object(
        'success', FALSE,
        'data',    NULL,
        'message', 'An unexpected error occurred deleting the task.'
    );
END;
$$;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
