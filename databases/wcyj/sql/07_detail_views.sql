-- =============================================================================
-- 07_detail_views.sql — Detail-panel-backing views (AFTER version incl. tasks)
-- =============================================================================
-- Deliberate whitelist of the columns each entity's detail form shows.
-- Column order = form field order.
-- Depends on: 02_identity.sql, 03_projects.sql
-- =============================================================================

CREATE VIEW projects.v_project_detail AS
SELECT
    id,
    name,
    description,
    type_id,
    status_id
FROM projects.projects;

CREATE VIEW projects.v_task_detail AS
SELECT
    id,
    project_id,
    parent_id,
    description,
    notes,
    status_id,
    priority_id
FROM projects.tasks;

CREATE VIEW identity.v_contact_detail AS
SELECT
    id,
    name,
    title,
    notes
FROM identity.contacts;

CREATE VIEW identity.v_organization_detail AS
SELECT
    id,
    name,
    notes
FROM identity.organizations;

GRANT SELECT ON
    projects.v_project_detail,
    projects.v_task_detail
TO steward;

GRANT SELECT ON
    identity.v_contact_detail,
    identity.v_organization_detail
TO steward;
