-- =============================================================================
-- 10j_seanchai_task_records_api.sql — API function for task → record links
-- =============================================================================
--
-- Adds api.get_task_linked_records(task_id) — returns the seanchai research
-- records linked to a task via seanchai.task_records (created by 10i).
--
-- Used by the Curator task detail panel to surface the source records
-- (and their source_url links) for a given research task without requiring
-- the user to navigate to the Records tab separately.
--
-- Returns a JSON array ordered by display_order then record_id.
-- Returns '[]' if the task has no linked records or the task_id is not found.
--
-- Depends on: 07_seanchai.sql, 10i_seanchai_todos_to_tasks.sql
-- =============================================================================


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
                'source_url',       r.source_url
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
-- GRANTs
-- =============================================================================

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO web_app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO steward;
