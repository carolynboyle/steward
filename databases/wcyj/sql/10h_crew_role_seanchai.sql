-- =============================================================================
-- 10h_crew_role_seanchai.sql — Seanchaí crew role + project ownership by role
-- =============================================================================
--
-- 1. New crew role 'seanchai' and project type 'genealogy'.
--
-- 2. Projects now BELONG to one crew role (projects.projects.crew_role_id).
--    Previously a role saw projects by TYPE (every 'writing' project showed
--    on the Scribe's dashboard). Now types are shared descriptions and the
--    owning role decides whose dashboard a project appears on — a Scribe
--    'writing' project and a Seanchaí 'writing' project stay separate, and
--    their tasks with them. The Captain still sees every project.
--
-- 3. Existing projects are backfilled from the old type mapping: if a
--    project's type maps to exactly one non-captain role, that role owns
--    it; 'refurb' (mapped to both Mechanic and Envoy) goes to the
--    Mechanic; anything else (no type, or a captain-only type) goes to the
--    Captain. Every dashboard shows the same projects as before, except
--    that refurb projects no longer also appear on the Envoy's. The final
--    SELECT lists Captain-owned projects so any can be reassigned.
--
-- 4. Role views (captain/scribe/mechanic/envoy_view, new seanchai_view)
--    filter by owner instead of type.
--
-- 5. project_type_role_mapping is kept (now describes which types each
--    role works with) and gains seanchai -> genealogy, writing and
--    captain -> genealogy.
--
-- 6. v_project_detail gains crew_role_id (the project form's Crew field);
--    api.get_lookup gains a 'crew_roles' source for its dropdown.
--
-- 7. api.save_project accepts crew_role_id (new projects default to the
--    Captain). FIX: on update it previously overwrote description, notes
--    and target_date with whatever the payload held — the routes never
--    send notes or target_date, so every edit blanked them, and an inline
--    grid rename blanked the description too. Update now changes only the
--    fields present in the payload.
--
-- DEPLOY ORDER: apply this file, then rebuild Curator straight away. The
-- new crew_role_id column on v_project_detail needs Curator's matching
-- fieldkit override; Curator refuses to start without it.
--
-- Additive: new column (nullable during backfill, then NOT NULL), new
-- rows, new view; existing views and functions are replaced in place.
-- Safe to re-run.
--
-- Depends on: 02_identity, 03_projects, 05_seed, 06_api, 07_detail_views,
--             08b_api_lookup
-- =============================================================================

BEGIN;

-- -----------------------------------------------------------------------------
-- 1. Role and type
-- -----------------------------------------------------------------------------
INSERT INTO identity.crew_role (name) VALUES ('seanchai')
ON CONFLICT (name) DO NOTHING;

INSERT INTO projects.project_type (name) VALUES ('genealogy')
ON CONFLICT (name) DO NOTHING;


-- -----------------------------------------------------------------------------
-- 2. Owning role on projects, backfilled from the old type mapping
-- -----------------------------------------------------------------------------
ALTER TABLE projects.projects
    ADD COLUMN IF NOT EXISTS crew_role_id BIGINT REFERENCES identity.crew_role (id);

-- 'refurb' is the one type mapped to two roles (mechanic and envoy), so
-- refurb projects showed on both dashboards. With one owner they go to
-- the Mechanic ("Hardware management and refurb tracking"); the Envoy
-- no longer sees them unless reassigned.
UPDATE projects.projects p
SET crew_role_id = (SELECT id FROM identity.crew_role WHERE name = 'mechanic')
FROM projects.project_type pt
WHERE pt.id = p.type_id
  AND pt.name = 'refurb'
  AND p.crew_role_id IS NULL;

UPDATE projects.projects p
SET crew_role_id = COALESCE(
    (
        SELECT MIN(m.crew_role_id)
        FROM projects.project_type_role_mapping m
        JOIN identity.crew_role cr ON cr.id = m.crew_role_id
        WHERE m.project_type_id = p.type_id
          AND cr.name <> 'captain'
        HAVING COUNT(*) = 1
    ),
    (SELECT id FROM identity.crew_role WHERE name = 'captain')
)
WHERE p.crew_role_id IS NULL;

ALTER TABLE projects.projects ALTER COLUMN crew_role_id SET NOT NULL;

CREATE INDEX IF NOT EXISTS idx_projects_crew_role ON projects.projects (crew_role_id);


-- -----------------------------------------------------------------------------
-- 3. Type mapping additions (types each role works with)
-- -----------------------------------------------------------------------------
INSERT INTO projects.project_type_role_mapping (project_type_id, crew_role_id)
SELECT pt.id, cr.id
FROM projects.project_type pt
JOIN identity.crew_role cr ON cr.name = 'seanchai'
WHERE pt.name IN ('genealogy', 'writing')
ON CONFLICT ON CONSTRAINT project_type_role_mapping_unique DO NOTHING;

INSERT INTO projects.project_type_role_mapping (project_type_id, crew_role_id)
SELECT pt.id, cr.id
FROM projects.project_type pt
JOIN identity.crew_role cr ON cr.name = 'captain'
WHERE pt.name = 'genealogy'
ON CONFLICT ON CONSTRAINT project_type_role_mapping_unique DO NOTHING;


-- -----------------------------------------------------------------------------
-- 4. Role views — by owner. p.* now ends with crew_role_id; CREATE OR
--    REPLACE allows a new trailing column.
-- -----------------------------------------------------------------------------
CREATE OR REPLACE VIEW projects.captain_view AS
SELECT p.*
FROM projects.projects p;

CREATE OR REPLACE VIEW projects.scribe_view AS
SELECT p.*
FROM projects.projects p
JOIN identity.crew_role cr ON cr.id = p.crew_role_id
WHERE cr.name = 'scribe';

CREATE OR REPLACE VIEW projects.mechanic_view AS
SELECT p.*
FROM projects.projects p
JOIN identity.crew_role cr ON cr.id = p.crew_role_id
WHERE cr.name = 'mechanic';

CREATE OR REPLACE VIEW projects.envoy_view AS
SELECT p.*
FROM projects.projects p
JOIN identity.crew_role cr ON cr.id = p.crew_role_id
WHERE cr.name = 'envoy';

CREATE OR REPLACE VIEW projects.seanchai_view AS
SELECT p.*
FROM projects.projects p
JOIN identity.crew_role cr ON cr.id = p.crew_role_id
WHERE cr.name = 'seanchai';

GRANT SELECT ON projects.seanchai_view TO steward;


-- -----------------------------------------------------------------------------
-- 5. Project detail view — Crew field (trailing column)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE VIEW projects.v_project_detail AS
SELECT
    id,
    name,
    description,
    type_id,
    status_id,
    crew_role_id
FROM projects.projects;


-- -----------------------------------------------------------------------------
-- 6. api.get_lookup — add 'crew_roles' (all other branches unchanged
--    from 08b_api_lookup.sql)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.get_lookup(p_source TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_result JSONB;
BEGIN
    CASE p_source
        WHEN 'project_types' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM projects.project_type;

        WHEN 'project_statuses' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM projects.project_status;

        WHEN 'task_statuses' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM projects.task_status;

        WHEN 'priorities' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM projects.priority;

        WHEN 'record_types' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM seanchai.record_type;

        WHEN 'record_statuses' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', name) ORDER BY name)
            INTO v_result FROM seanchai.record_status;

        WHEN 'crew_roles' THEN
            SELECT jsonb_agg(jsonb_build_object('value', id, 'label', INITCAP(name)) ORDER BY name)
            INTO v_result FROM identity.crew_role;

        ELSE
            v_result := NULL;
    END CASE;

    RETURN v_result;
END;
$$;


-- -----------------------------------------------------------------------------
-- 7. api.save_project — crew_role_id; update touches only supplied fields.
--    Otherwise identical to 06_api.sql (name required, status/type by
--    name, slug generation and dedup, duplicate-name check).
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION api.save_project(
    p_payload JSONB,
    p_user_id BIGINT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_id           BIGINT;
    v_name         VARCHAR(255);
    v_slug         VARCHAR(100);
    v_slug_base    VARCHAR(100);
    v_slug_suffix  INT := 0;
    v_description  TEXT;
    v_notes        TEXT;
    v_status_id    BIGINT;
    v_type_id      BIGINT;
    v_target_date  DATE;
    v_crew_role_id BIGINT;
    v_is_update    BOOLEAN;
BEGIN
    v_name := TRIM(p_payload->>'name');

    IF v_name IS NULL OR v_name = '' THEN
        RETURN jsonb_build_object(
            'success', FALSE, 'data', NULL, 'message', 'Project name is required.'
        );
    END IF;

    v_id        := (p_payload->>'id')::BIGINT;
    v_is_update := v_id IS NOT NULL;

    v_description := NULLIF(TRIM(p_payload->>'description'), '');
    v_notes       := NULLIF(TRIM(p_payload->>'notes'), '');
    v_target_date := NULLIF(p_payload->>'target_date', '')::DATE;

    SELECT id INTO v_status_id
    FROM projects.project_status
    WHERE name = LOWER(TRIM(p_payload->>'status'));

    IF v_status_id IS NULL THEN
        SELECT id INTO v_status_id
        FROM projects.project_status
        WHERE name = 'active';
    END IF;

    IF p_payload->>'type' IS NOT NULL AND p_payload->>'type' != '' THEN
        SELECT id INTO v_type_id
        FROM projects.project_type
        WHERE name = LOWER(TRIM(p_payload->>'type'));
    END IF;

    -- Owning crew role: by id; ignored if blank or unknown
    IF NULLIF(p_payload->>'crew_role_id', '') IS NOT NULL THEN
        SELECT id INTO v_crew_role_id
        FROM identity.crew_role
        WHERE id = (p_payload->>'crew_role_id')::BIGINT;
    END IF;

    IF v_is_update THEN
        IF NOT EXISTS (SELECT 1 FROM projects.projects WHERE id = v_id) THEN
            RETURN jsonb_build_object(
                'success', FALSE, 'data', NULL, 'message', 'Project not found.'
            );
        END IF;

        IF EXISTS (
            SELECT 1 FROM projects.projects WHERE name = v_name AND id != v_id
        ) THEN
            RETURN jsonb_build_object(
                'success', FALSE, 'data', NULL,
                'message', 'A project with that name already exists.'
            );
        END IF;

        UPDATE projects.projects SET
            name         = v_name,
            description  = CASE WHEN p_payload ? 'description' THEN v_description ELSE description END,
            notes        = CASE WHEN p_payload ? 'notes'       THEN v_notes       ELSE notes       END,
            status_id    = v_status_id,
            type_id      = v_type_id,
            target_date  = CASE WHEN p_payload ? 'target_date' THEN v_target_date ELSE target_date END,
            crew_role_id = COALESCE(v_crew_role_id, crew_role_id),
            updated_by   = p_user_id
        WHERE id = v_id;

        RETURN jsonb_build_object(
            'success', TRUE, 'data', jsonb_build_object('id', v_id),
            'message', 'Project updated.'
        );

    ELSE
        IF EXISTS (SELECT 1 FROM projects.projects WHERE name = v_name) THEN
            RETURN jsonb_build_object(
                'success', FALSE, 'data', NULL,
                'message', 'A project with that name already exists.'
            );
        END IF;

        IF v_crew_role_id IS NULL THEN
            SELECT id INTO v_crew_role_id
            FROM identity.crew_role
            WHERE name = 'captain';
        END IF;

        v_slug_base := LOWER(REGEXP_REPLACE(
            REGEXP_REPLACE(v_name, '[^a-zA-Z0-9\s-]', '', 'g'),
            '\s+', '-', 'g'
        ));
        v_slug_base := TRIM(BOTH '-' FROM v_slug_base);
        v_slug      := v_slug_base;

        WHILE EXISTS (SELECT 1 FROM projects.projects WHERE slug = v_slug) LOOP
            v_slug_suffix := v_slug_suffix + 1;
            v_slug := v_slug_base || '-' || v_slug_suffix;
        END LOOP;

        INSERT INTO projects.projects (
            name, slug, description, notes,
            status_id, type_id, target_date, crew_role_id,
            created_by, updated_by
        ) VALUES (
            v_name, v_slug, v_description, v_notes,
            v_status_id, v_type_id, v_target_date, v_crew_role_id,
            p_user_id, p_user_id
        )
        RETURNING id INTO v_id;

        RETURN jsonb_build_object(
            'success', TRUE, 'data', jsonb_build_object('id', v_id, 'slug', v_slug),
            'message', 'Project created.'
        );
    END IF;

EXCEPTION WHEN OTHERS THEN
    RAISE WARNING 'api.save_project error: %', SQLERRM;
    RETURN jsonb_build_object(
        'success', FALSE, 'data', NULL,
        'message', 'An unexpected error occurred saving the project.'
    );
END;
$$;

COMMIT;


-- -----------------------------------------------------------------------------
-- Report: projects now owned by the Captain (reassign any that belong to
-- another role from the Captain's dashboard, Crew field)
-- -----------------------------------------------------------------------------
SELECT p.id, p.name, pt.name AS type
FROM projects.projects p
JOIN identity.crew_role cr ON cr.id = p.crew_role_id
LEFT JOIN projects.project_type pt ON pt.id = p.type_id
WHERE cr.name = 'captain'
ORDER BY p.name;
