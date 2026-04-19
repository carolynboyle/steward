# schema.sql

**Path:** data/schema.sql
**Syntax:** sql
**Generated:** 2026-04-19 15:48:51

```sql
--
-- PostgreSQL database dump
--

\restrict wkVr2xKLxB0hVhd9R15JCzfpiTE1hOQPdMMLYhHb9UgHcTMaktCmPPKeooYn9OC

-- Dumped from database version 15.16 (Debian 15.16-0+deb12u1)
-- Dumped by pg_dump version 15.16 (Debian 15.16-0+deb12u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: steward
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_updated_at() OWNER TO steward;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contact_phones; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.contact_phones (
    id bigint NOT NULL,
    contact_id bigint NOT NULL,
    phone_number character varying(50) NOT NULL,
    description character varying(100),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact_phones OWNER TO steward;

--
-- Name: contact_phones_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.contact_phones ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contact_urls; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.contact_urls (
    id bigint NOT NULL,
    contact_id bigint NOT NULL,
    url_type character varying(50),
    url text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact_urls OWNER TO steward;

--
-- Name: contact_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.contact_urls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255),
    title character varying(100),
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contacts OWNER TO steward;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.contacts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: file_type; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.file_type (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.file_type OWNER TO steward;

--
-- Name: file_type_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.file_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.file_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location_type; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.location_type (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.location_type OWNER TO steward;

--
-- Name: location_type_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.location_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.location_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: priority; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.priority (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.priority OWNER TO steward;

--
-- Name: priority_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.priority ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_contacts; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.project_contacts (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    contact_id bigint NOT NULL,
    role character varying(100),
    is_primary boolean DEFAULT false NOT NULL
);


ALTER TABLE public.project_contacts OWNER TO steward;

--
-- Name: project_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.project_contacts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_files; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.project_files (
    id bigint NOT NULL,
    project_id bigint,
    task_id bigint,
    label character varying(255) NOT NULL,
    file_type_id bigint NOT NULL,
    location text NOT NULL,
    location_type_id bigint NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT project_files_check CHECK (((project_id IS NOT NULL) OR (task_id IS NOT NULL)))
);


ALTER TABLE public.project_files OWNER TO steward;

--
-- Name: project_files_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.project_files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_status; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.project_status (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.project_status OWNER TO steward;

--
-- Name: project_status_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.project_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_tags; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.project_tags (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.project_tags OWNER TO steward;

--
-- Name: project_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.project_tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_type; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.project_type (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.project_type OWNER TO steward;

--
-- Name: project_type_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.project_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    parent_id bigint,
    name character varying(255) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    status_id bigint NOT NULL,
    type_id bigint,
    target_date date,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    notes text
);


ALTER TABLE public.projects OWNER TO steward;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.projects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tag_category; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.tag_category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tag_category OWNER TO steward;

--
-- Name: tag_category_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.tag_category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tag_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    category_id bigint
);


ALTER TABLE public.tags OWNER TO steward;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: task_status; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.task_status (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(10) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_terminal boolean DEFAULT false NOT NULL
);


ALTER TABLE public.task_status OWNER TO steward;

--
-- Name: task_status_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.task_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.task_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: task_tags; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.task_tags (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.task_tags OWNER TO steward;

--
-- Name: task_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.task_tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.task_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    parent_id bigint,
    description text NOT NULL,
    status_id bigint NOT NULL,
    priority_id bigint NOT NULL,
    links text DEFAULT ''::text NOT NULL,
    source_file character varying(255) DEFAULT ''::character varying NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    completed_at timestamp without time zone,
    notes text
);


ALTER TABLE public.tasks OWNER TO steward;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.tasks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: v_project_tree; Type: VIEW; Schema: public; Owner: steward
--

CREATE VIEW public.v_project_tree AS
 WITH RECURSIVE tree AS (
         SELECT projects.id,
            projects.parent_id,
            projects.name,
            projects.slug,
            0 AS depth,
            ARRAY[(projects.slug)::character varying] AS path
           FROM public.projects
          WHERE (projects.parent_id IS NULL)
        UNION ALL
         SELECT p.id,
            p.parent_id,
            p.name,
            p.slug,
            (t.depth + 1),
            (t.path || p.slug)
           FROM (public.projects p
             JOIN tree t ON ((t.id = p.parent_id)))
        )
 SELECT tree.id,
    tree.parent_id,
    tree.name,
    tree.slug,
    tree.depth,
    tree.path
   FROM tree;


ALTER TABLE public.v_project_tree OWNER TO steward;

--
-- Name: v_projects; Type: VIEW; Schema: public; Owner: steward
--

CREATE VIEW public.v_projects AS
SELECT
    NULL::bigint AS id,
    NULL::bigint AS parent_id,
    NULL::character varying(255) AS parent_name,
    NULL::character varying(100) AS parent_slug,
    NULL::character varying(255) AS name,
    NULL::character varying(100) AS slug,
    NULL::text AS description,
    NULL::text AS notes,
    NULL::character varying(50) AS status,
    NULL::character varying(50) AS project_type,
    NULL::date AS target_date,
    NULL::timestamp without time zone AS created_at,
    NULL::timestamp without time zone AS updated_at,
    NULL::bigint AS total_tasks,
    NULL::bigint AS completed_tasks,
    NULL::bigint AS open_tasks;


ALTER TABLE public.v_projects OWNER TO steward;

--
-- Name: v_task_tree; Type: VIEW; Schema: public; Owner: steward
--

CREATE VIEW public.v_task_tree AS
 WITH RECURSIVE tree AS (
         SELECT t.id,
            t.parent_id,
            t.project_id,
            p.slug AS project_slug,
            t.description,
            ts.name AS status,
            ts.is_terminal,
            pr.name AS priority,
            t.sort_order,
            0 AS depth,
            ARRAY[t.id] AS path
           FROM (((public.tasks t
             JOIN public.projects p ON ((p.id = t.project_id)))
             JOIN public.task_status ts ON ((ts.id = t.status_id)))
             JOIN public.priority pr ON ((pr.id = t.priority_id)))
          WHERE (t.parent_id IS NULL)
        UNION ALL
         SELECT t.id,
            t.parent_id,
            t.project_id,
            p.slug AS project_slug,
            t.description,
            ts.name AS status,
            ts.is_terminal,
            pr.name AS priority,
            t.sort_order,
            (tree_1.depth + 1),
            (tree_1.path || t.id)
           FROM ((((public.tasks t
             JOIN public.projects p ON ((p.id = t.project_id)))
             JOIN public.task_status ts ON ((ts.id = t.status_id)))
             JOIN public.priority pr ON ((pr.id = t.priority_id)))
             JOIN tree tree_1 ON ((tree_1.id = t.parent_id)))
        )
 SELECT tree.id,
    tree.parent_id,
    tree.project_id,
    tree.project_slug,
    tree.description,
    tree.status,
    tree.is_terminal,
    tree.priority,
    tree.sort_order,
    tree.depth,
    tree.path
   FROM tree;


ALTER TABLE public.v_task_tree OWNER TO steward;

--
-- Name: v_tasks; Type: VIEW; Schema: public; Owner: steward
--

CREATE VIEW public.v_tasks AS
 SELECT t.id,
    t.project_id,
    p.name AS project_name,
    p.slug AS project_slug,
    t.parent_id,
    pt.description AS parent_description,
    t.description,
    t.notes,
    ts.name AS status,
    ts.display AS status_display,
    ts.is_terminal,
    pr.name AS priority,
    t.links,
    t.source_file,
    t.sort_order,
    t.created_at,
    t.updated_at,
    t.completed_at
   FROM ((((public.tasks t
     JOIN public.projects p ON ((p.id = t.project_id)))
     JOIN public.task_status ts ON ((ts.id = t.status_id)))
     JOIN public.priority pr ON ((pr.id = t.priority_id)))
     LEFT JOIN public.tasks pt ON ((pt.id = t.parent_id)));


ALTER TABLE public.v_tasks OWNER TO steward;

--
-- Name: contact_phones contact_phones_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_phones
    ADD CONSTRAINT contact_phones_pkey PRIMARY KEY (id);


--
-- Name: contact_urls contact_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_urls
    ADD CONSTRAINT contact_urls_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: file_type file_type_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.file_type
    ADD CONSTRAINT file_type_name_key UNIQUE (name);


--
-- Name: file_type file_type_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.file_type
    ADD CONSTRAINT file_type_pkey PRIMARY KEY (id);


--
-- Name: location_type location_type_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.location_type
    ADD CONSTRAINT location_type_name_key UNIQUE (name);


--
-- Name: location_type location_type_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.location_type
    ADD CONSTRAINT location_type_pkey PRIMARY KEY (id);


--
-- Name: priority priority_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.priority
    ADD CONSTRAINT priority_name_key UNIQUE (name);


--
-- Name: priority priority_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.priority
    ADD CONSTRAINT priority_pkey PRIMARY KEY (id);


--
-- Name: project_contacts project_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT project_contacts_pkey PRIMARY KEY (id);


--
-- Name: project_files project_files_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_files
    ADD CONSTRAINT project_files_pkey PRIMARY KEY (id);


--
-- Name: project_status project_status_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_status
    ADD CONSTRAINT project_status_name_key UNIQUE (name);


--
-- Name: project_status project_status_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_status
    ADD CONSTRAINT project_status_pkey PRIMARY KEY (id);


--
-- Name: project_tags project_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT project_tags_pkey PRIMARY KEY (id);


--
-- Name: project_type project_type_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_type
    ADD CONSTRAINT project_type_name_key UNIQUE (name);


--
-- Name: project_type project_type_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_type
    ADD CONSTRAINT project_type_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects projects_slug_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_slug_key UNIQUE (slug);


--
-- Name: tag_category tag_category_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tag_category
    ADD CONSTRAINT tag_category_name_key UNIQUE (name);


--
-- Name: tag_category tag_category_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tag_category
    ADD CONSTRAINT tag_category_pkey PRIMARY KEY (id);


--
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: task_status task_status_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_name_key UNIQUE (name);


--
-- Name: task_status task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_pkey PRIMARY KEY (id);


--
-- Name: task_tags task_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT task_tags_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: project_contacts uq_project_contacts; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT uq_project_contacts UNIQUE (project_id, contact_id);


--
-- Name: project_tags uq_project_tags; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT uq_project_tags UNIQUE (project_id, tag_id);


--
-- Name: task_tags uq_task_tags; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT uq_task_tags UNIQUE (task_id, tag_id);


--
-- Name: idx_contact_phones_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_phones_contact ON public.contact_phones USING btree (contact_id);


--
-- Name: idx_contact_urls_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_urls_contact ON public.contact_urls USING btree (contact_id);


--
-- Name: idx_project_contacts_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_contacts_contact ON public.project_contacts USING btree (contact_id);


--
-- Name: idx_project_contacts_project; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_contacts_project ON public.project_contacts USING btree (project_id);


--
-- Name: idx_project_files_project; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_files_project ON public.project_files USING btree (project_id);


--
-- Name: idx_project_files_task; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_files_task ON public.project_files USING btree (task_id);


--
-- Name: idx_projects_parent; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_projects_parent ON public.projects USING btree (parent_id);


--
-- Name: idx_projects_status; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_projects_status ON public.projects USING btree (status_id);


--
-- Name: idx_projects_type; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_projects_type ON public.projects USING btree (type_id);


--
-- Name: idx_tags_category; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_tags_category ON public.tags USING btree (category_id);


--
-- Name: idx_tasks_parent; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_tasks_parent ON public.tasks USING btree (parent_id);


--
-- Name: idx_tasks_priority; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_tasks_priority ON public.tasks USING btree (priority_id);


--
-- Name: idx_tasks_project; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_tasks_project ON public.tasks USING btree (project_id);


--
-- Name: idx_tasks_status; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_tasks_status ON public.tasks USING btree (status_id);


--
-- Name: v_projects _RETURN; Type: RULE; Schema: public; Owner: steward
--

CREATE OR REPLACE VIEW public.v_projects AS
 SELECT p.id,
    p.parent_id,
    parent.name AS parent_name,
    parent.slug AS parent_slug,
    p.name,
    p.slug,
    p.description,
    p.notes,
    ps.name AS status,
    pt.name AS project_type,
    p.target_date,
    p.created_at,
    p.updated_at,
    count(t.id) AS total_tasks,
    count(t.id) FILTER (WHERE (ts.is_terminal = true)) AS completed_tasks,
    count(t.id) FILTER (WHERE (ts.is_terminal = false)) AS open_tasks
   FROM (((((public.projects p
     JOIN public.project_status ps ON ((ps.id = p.status_id)))
     LEFT JOIN public.project_type pt ON ((pt.id = p.type_id)))
     LEFT JOIN public.projects parent ON ((parent.id = p.parent_id)))
     LEFT JOIN public.tasks t ON ((t.project_id = p.id)))
     LEFT JOIN public.task_status ts ON ((ts.id = t.status_id)))
  GROUP BY p.id, parent.name, parent.slug, ps.name, pt.name;


--
-- Name: contacts trg_contacts_updated_at; Type: TRIGGER; Schema: public; Owner: steward
--

CREATE TRIGGER trg_contacts_updated_at BEFORE UPDATE ON public.contacts FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: projects trg_projects_updated_at; Type: TRIGGER; Schema: public; Owner: steward
--

CREATE TRIGGER trg_projects_updated_at BEFORE UPDATE ON public.projects FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: tasks trg_tasks_updated_at; Type: TRIGGER; Schema: public; Owner: steward
--

CREATE TRIGGER trg_tasks_updated_at BEFORE UPDATE ON public.tasks FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: contact_phones contact_phones_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_phones
    ADD CONSTRAINT contact_phones_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- Name: contact_urls contact_urls_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_urls
    ADD CONSTRAINT contact_urls_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- Name: project_contacts project_contacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT project_contacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- Name: project_contacts project_contacts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT project_contacts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_files project_files_file_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_files
    ADD CONSTRAINT project_files_file_type_id_fkey FOREIGN KEY (file_type_id) REFERENCES public.file_type(id);


--
-- Name: project_files project_files_location_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_files
    ADD CONSTRAINT project_files_location_type_id_fkey FOREIGN KEY (location_type_id) REFERENCES public.location_type(id);


--
-- Name: project_files project_files_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_files
    ADD CONSTRAINT project_files_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_files project_files_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_files
    ADD CONSTRAINT project_files_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: project_tags project_tags_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT project_tags_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_tags project_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT project_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: projects projects_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- Name: projects projects_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.project_status(id);


--
-- Name: projects projects_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.project_type(id);


--
-- Name: tags tags_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.tag_category(id);


--
-- Name: task_tags task_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT task_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: task_tags task_tags_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT task_tags_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.tasks(id);


--
-- Name: tasks tasks_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priority(id);


--
-- Name: tasks tasks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.task_status(id);


--
-- PostgreSQL database dump complete
--

\unrestrict wkVr2xKLxB0hVhd9R15JCzfpiTE1hOQPdMMLYhHb9UgHcTMaktCmPPKeooYn9OC


```
