-- =============================================================================
-- 06f_api_project_links.sql — API schema: projects.project_links save/delete
-- =============================================================================
-- Depends on: 03_projects.sql (projects.project_links table)
-- =============================================================================

CREATE OR REPLACE FUNCTION api.save_project_link(
    p_payload JSONB,
    p_user_id BIGINT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id         BIGINT;
    v_project_id BIGINT;
    v_label      TEXT;
    v_url        TEXT;
    v_is_update  BOOLEAN;
BEGIN
    v_label := NULLIF(TRIM(p_payload->>'label'), '');

    IF v_label IS NULL THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Label is required.'
        );
    END IF;

    v_id        := (p_payload->>'id')::BIGINT;
    v_is_update := v_id IS NOT NULL;
    v_url       := NULLIF(TRIM(p_payload->>'url'), '');

    IF v_is_update THEN
        IF NOT EXISTS (SELECT 1 FROM projects.project_links WHERE id = v_id) THEN
            RETURN jsonb_build_object(
                'success', FALSE,
                'data',    NULL,
                'message', 'Link not found.'
            );
        END IF;

        UPDATE projects.project_links SET
            label      = v_label,
            url        = v_url,
            updated_by = p_user_id
        WHERE id = v_id;

        RETURN jsonb_build_object(
            'success', TRUE,
            'data',    jsonb_build_object('id', v_id),
            'message', 'Link updated.'
        );
    ELSE
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

        INSERT INTO projects.project_links (
            project_id, label, url,
            created_by, updated_by
        ) VALUES (
            v_project_id, v_label, v_url,
            p_user_id, p_user_id
        )
        RETURNING id INTO v_id;

        RETURN jsonb_build_object(
            'success', TRUE,
            'data',    jsonb_build_object('id', v_id),
            'message', 'Link created.'
        );
    END IF;

EXCEPTION WHEN OTHERS THEN
    RAISE WARNING 'api.save_project_link error: %', SQLERRM;
    RETURN jsonb_build_object(
        'success', FALSE,
        'data',    NULL,
        'message', 'An unexpected error occurred saving the link.'
    );
END;
$$;


CREATE OR REPLACE FUNCTION api.delete_project_link(
    p_id      BIGINT,
    p_user_id BIGINT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM projects.project_links WHERE id = p_id) THEN
        RETURN jsonb_build_object(
            'success', FALSE,
            'data',    NULL,
            'message', 'Link not found.'
        );
    END IF;

    DELETE FROM projects.project_links WHERE id = p_id;

    RETURN jsonb_build_object(
        'success', TRUE,
        'data',    jsonb_build_object('id', p_id),
        'message', 'Link deleted.'
    );

EXCEPTION WHEN OTHERS THEN
    RAISE WARNING 'api.delete_project_link error for id %: %', p_id, SQLERRM;
    RETURN jsonb_build_object(
        'success', FALSE,
        'data',    NULL,
        'message', 'An unexpected error occurred deleting the link.'
    );
END;
$$;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
