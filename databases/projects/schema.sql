--
-- PostgreSQL database dump
--

\restrict y5bY3Nbw03S2OkVk8h0bfu3JqeQSPT0VOXIfVLeEoAdXDAElNDrBReVrUocv7w5

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
-- Name: contact_emails; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.contact_emails (
    id bigint NOT NULL,
    contact_id bigint NOT NULL,
    email character varying(255),
    email_type character varying(50),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact_emails OWNER TO steward;

--
-- Name: contact_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.contact_emails ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contact_imports; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.contact_imports (
    id bigint NOT NULL,
    import_file character varying(255),
    imported_at timestamp without time zone DEFAULT now() NOT NULL,
    total_rows_processed integer,
    contacts_created integer,
    emails_created integer,
    phones_created integer,
    rows_skipped integer,
    errors_count integer,
    error_log text
);


ALTER TABLE public.contact_imports OWNER TO steward;

--
-- Name: contact_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.contact_imports ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    name character varying(255),
    title character varying(100),
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    organization_id bigint
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
-- Name: organizations; Type: TABLE; Schema: public; Owner: steward
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.organizations OWNER TO steward;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: steward
--

ALTER TABLE public.organizations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.organizations_id_seq
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
    is_primary boolean DEFAULT false NOT NULL,
    primary_email_id bigint
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
            projects.type_id,
            0 AS depth,
            ARRAY[(projects.slug)::character varying] AS path
           FROM public.projects
          WHERE (projects.parent_id IS NULL)
        UNION ALL
         SELECT p.id,
            p.parent_id,
            p.name,
            p.slug,
            p.type_id,
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
    tree.path,
    pt.name AS project_type
   FROM tree
   LEFT JOIN public.project_type pt ON (pt.id = tree.type_id);


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
-- Data for Name: contact_emails; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.contact_emails (id, contact_id, email, email_type, created_at) FROM stdin;
\.


--
-- Data for Name: contact_imports; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.contact_imports (id, import_file, imported_at, total_rows_processed, contacts_created, emails_created, phones_created, rows_skipped, errors_count, error_log) FROM stdin;
\.


--
-- Data for Name: contact_phones; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.contact_phones (id, contact_id, phone_number, description, created_at) FROM stdin;
\.


--
-- Data for Name: contact_urls; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.contact_urls (id, contact_id, url_type, url, created_at) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.contacts (id, name, title, notes, created_at, updated_at, organization_id) FROM stdin;
\.


--
-- Data for Name: file_type; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.file_type (id, name, sort_order) FROM stdin;
1	markdown	1
2	config	2
3	script	3
4	log	4
5	json	5
6	yaml	6
7	other	7
\.


--
-- Data for Name: location_type; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.location_type (id, name, sort_order) FROM stdin;
1	local	1
2	url	2
3	git	3
4	s3	4
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.organizations (id, name, created_at) FROM stdin;
\.


--
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.priority (id, name, sort_order) FROM stdin;
1	low	1
2	normal	2
3	high	3
4	blocking	4
\.


--
-- Data for Name: project_contacts; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.project_contacts (id, project_id, contact_id, role, is_primary, primary_email_id) FROM stdin;
\.


--
-- Data for Name: project_files; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.project_files (id, project_id, task_id, label, file_type_id, location, location_type_id, notes, created_at) FROM stdin;
1	1	\N	source repo	7	https://github.com/carolynboyle/projs	3	\N	2026-04-14 05:48:24.398803
2	5	\N	source repo	7	https://github.com/carolynboyle/dev-utils	3	\N	2026-04-14 05:48:24.398803
3	5	\N	todo list	1	python/todo/docs/TODO.md	1	\N	2026-04-14 05:48:24.398803
\.


--
-- Data for Name: project_status; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.project_status (id, name, sort_order) FROM stdin;
1	active	1
2	paused	2
3	completed	3
4	abandoned	4
5	Published	10
6	Ready to Write	20
7	In Progress	30
8	Queued	40
\.


--
-- Data for Name: project_tags; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.project_tags (id, project_id, tag_id) FROM stdin;
1	1	1
2	1	7
3	2	11
4	2	12
5	2	10
6	2	15
7	3	16
8	4	14
9	4	7
10	5	3
11	5	9
14	7	6
15	7	9
16	7	7
\.


--
-- Data for Name: project_type; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.project_type (id, name, sort_order) FROM stdin;
1	coding	1
2	homelab	2
3	game-dev	3
4	personal	4
5	Job Application	5
6	other	6
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.projects (id, parent_id, name, slug, description, status_id, type_id, target_date, created_at, updated_at, notes) FROM stdin;
1	\N	Project Crew	project-crew	Python CLI tool for automating creation and management of coding projects. Interactive menu interface; GUI planned as a visualizer layer on top of the CLI.	1	1	\N	2026-04-14 05:48:24.298313	2026-04-14 05:48:24.298313	\N
3	\N	Job Hunt	job-hunt	Track job applications, contacts, interviews, and follow-ups.	1	4	\N	2026-04-14 05:48:24.298313	2026-04-14 05:48:24.298313	\N
4	\N	Story Gems	story-gems	Story-based game development project.	1	3	\N	2026-04-14 05:48:24.298313	2026-04-14 05:48:24.298313	\N
5	1	Todo Plugin	project-crew-todo	Migrate todo package into project-crew as a plugin. Verify Project Crew plugin compatibility and add postgres integration.	1	1	\N	2026-04-14 05:48:24.332879	2026-04-14 05:48:24.332879	\N
7	1	dbkit	dbkit	Shared postgres utility library: DBConnection, SlugResolver, FileRegistry, CSVImporter. Lives in dev-utils alongside menukit and fletcher.	1	1	\N	2026-04-14 05:48:24.332879	2026-04-14 05:48:24.332879	\N
17	16	Taming wild kittens	taming-wild-kittens	Childhood skills, Mama Cat's pedagogy, meeting learners where they are	5	6	\N	2026-04-17 17:23:01.028048	2026-04-18 15:44:49.869202	Uploaded to project 2/26/26
9	\N	WCYJ Refurbs & WCYJ Store	wcyj-refurbs-wcyj-store	The project is to get a small business going, to refurbish Windows 10 eol machines into linux, as either a home media center or using a Zorin  OS/ MX linux/other OS.\r\n\r\nA mozilla solo website was created for the business. refurbs.whycantyoujust.tech will be pointed at it. Images for the website are uploaded to this project. \r\n\r\nI've also created a solo website for store.whycantyoujust.tech 	2	1	\N	2026-04-14 23:38:06.888039	2026-04-14 23:38:06.888039	\N
24	16	Decorations That Destroy	decorations-that-destroy	Firefox crash → the Vorlt → systemic fragility in complex systems; Boyle's Law of trivial executables	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Strong outline developed; hook, anatomy of fragility, Vorlt expansion
8	1	The Curator	the-curator	Web UI for projects database CRUD operations.\r\n"Built with FastAPI and Jinja2, backed by PostgreSQL on steward. Views are driven by YAML configuration via viewkit, with dbkit handling async database connections."	1	1	\N	2026-04-14 06:41:44.522109	2026-04-22 01:04:27.455285	These notes are a pain
12	\N	dev-utils	dev-utils	repo for useful small devlopment tools that can serve as standalone tools as well as plugins to other packages.	1	1	\N	2026-04-16 20:29:44.828124	2026-04-16 20:29:44.828124	\N
13	1	code patterns	code-patterns	way to identify coding patterns in a personal library to create structures like the dev-utils *kits	2	1	\N	2026-04-16 21:18:27.257935	2026-04-16 21:18:27.257935	\N
15	12	setupkit	setupkit	refactor: add date checking for manifest and if different from runtime  prompt to generate a fresh one (y/n)	2	1	\N	2026-04-17 04:04:52.475366	2026-04-17 04:04:52.475366	\N
14	12	Fletcher	fletcher	dev-utils utility for generating a manifest of raw urls for github repos.	1	1	\N	2026-04-17 03:43:24.724252	2026-04-17 04:49:05.45188	\N
18	\N	Homelab as SMB model	homelab-as-smb-model	infrastructure	1	6	\N	2026-04-17 17:41:28.887472	2026-04-17 17:41:28.887472	\N
2	18	DNS/DHCP Hardening	bind9-dhcp	Standardise and systematise bind9 and isc-dhcp server settings for LAN devices.	2	2	\N	2026-04-14 05:48:24.298313	2026-04-17 17:43:45.043833	\N
19	18	PostgreSQL/ansible lan automation	postgresqlansible-lan-automation	\N	2	2	\N	2026-04-17 17:46:44.779715	2026-04-17 17:46:44.779715	\N
25	16	If Hemingway Had Been Happy With His Dingus...	if-hemingway-had-been-happy-with-his-dingus	Projection & reaction formation: Hemingway → Pizzagate → Epstein; Anna Freud's 1936 work	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Three-part structure developed; personal hook (7th grade Hills Like White Elephants), current events, academic foundation
26	16	The AI Personality Taxonomy (Or: Why I Pay $20/Month)	the-ai-personality-taxonomy	ChatGPT's 'Aha!', Gemini's ODD energy, Claude's economy of language; unsolicited rewriting as insult	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Voice/craft argument + presumption critique; the pen-grabbing metaphor
27	16	May You Live in Interesting Times	may-you-live-in-interesting-times	Iran-Contra adjacency, Danny Casolaro, weapons on tables, the curse disguised as a blessing	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Architecture: opens with curse, closes with survival-as-joke; 'glad no one decided I needed to be killed'
28	16	The Mindfulness Industrial Complex	the-mindfulness-industrial-complex	32% adverse effects, 1500-yr documented history of harm, $2.2B industry stripping contraindications from commercialized meditation	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Sources: Willoughby Britton (Brown U), Cheetah House; smartphone apps as unregulated psych interventions
29	16	The Rapey Priest Who Primed His Constituents...	the-rapey-priest-who-primed-his-constituents	Frank Pavone, dismantling the seamless garment, priming for moral inconsistency → Trump	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Connects anti-death-penalty Catholic organizing to larger authoritarian priming thesis
30	16	Hallucination Is Itself a Lie	hallucination-is-itself-a-lie	Industry euphemism as rhetorical cover; business model may structurally depend on misinformation driving token consumption	6	6	\N	2026-04-18 15:45:58.02814	2026-04-18 15:45:58.02814	Openers: 'People who lie to me make my back teeth grind' / 'People pay for this'
31	16	Kevin Cooper & the Death Penalty Machine	kevin-cooper-death-penalty-machine	Evidence tampering, wrongful conviction, the activist behind the scenes; possible update if Anne can be located	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Need to search Gmail for Anne's contact; Telegram Ken account now appears to belong to a teenager
32	16	Hubcap Willie and the Romance of Dropping Out	hubcap-willie-romance-dropping-out	William Angus McDavid, 1962 Life magazine, American mythology of 'lighting out for the territory' vs. the Manson inflection point	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Series anchor for book project; connects to siblings' hitchhiking stories, desert swimming hole Manson encounter
33	16	Synchronicity for Skeptics	synchronicity-for-skeptics	Jung without the dense prose; Fromm's malignant narcissism as bridge; Accidental Mystic manifesto piece	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Fromm needed clinical vocab to say 'evil'; same project as Jung. Fr. Steve + the man without a soul as case studies
16	\N	Substack	substack	article ideas for accidentalmystic substack	7	6	\N	2026-04-17 17:21:36.906668	2026-04-18 15:50:05.822032	\N
34	16	The Johnstown Flood Keeps Happening	the-johnstown-flood-keeps-happening	AI company liability parallels; wealthy owners, dismissed warnings, no legal consequences; Carson Chronicles as narrative hook	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Plot hole in the novel (civil engineer missed foundational civil engineering case study) killed interest in the series
35	16	Back to the Grind	back-to-the-grind	Third place theory (Oldenburg, 1989); Darren Conkerite; Arianna Huffington / feudalism; algorithm conversation; civic infrastructure that doesn't announce itself	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Reach out to Darren Conkerite before writing; confirm Huffington visit details; belongs in Accidental Mystic
36	16	Industrial Fraud Anatomy	industrial-fraud-anatomy	Myanmar/Mekong Delta pig-butchering scam; AT&T breach pipeline; LLM+human hybrid handler; 'Happy Easter' as localization failure = evidence of industrialized crime	7	6	\N	2026-04-18 15:46:58.217445	2026-04-18 15:46:58.217445	Complete anatomy documented in chat; trafficking embedded in infrastructure; 'what the supply chain of organized crime looks like when you catch it mid-operation'
37	16	Words Create Reality: The Meme That Ate Itself	words-create-reality-meme-ate-itself	Dawkins' original meme concept → degraded meaning; semantic evolution as power structure	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Also: 'Pharmakon' framing — words that simultaneously name and do the thing
38	16	Local Paper, Local Power	local-paper-local-power	Press-Enterprise, Richard de Atley, how building relationships beats fighting editorial bias; DA excluded from frame = lead that writes itself	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Words create reality in practical media strategy; Mama Cat's positioning principle
39	16	Terry Pratchett Saw This Coming	terry-pratchett-saw-this-coming	Ankh-Morpork as prescient kakistocracy; the difference between satirizing dysfunction and predicting it	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Connects to newkakistocracy thesis; Pratchett as accidental prophet
40	16	AI Safety Director, Meet Your AI	ai-safety-director-meet-your-ai	Summer Yue's OpenClaw deletes her emails while ignoring stop commands; pharmakon paradox; read→suggest→confirm→act vs. full autonomy	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Perfect parable; the impressive demo has it deleting; 'really good suggestion engine' vs. funding pitch
41	16	COBOL, the California Courts, and the Spaghetti Nobody Reads	cobol-california-courts-spaghetti-nobody-reads	IBM stock wipeout, VentureBeat cold water; 60-year baked-in legal logic; what actually happens to defendants when the code can't represent the situation	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	IBM 13% drop on Anthropic COBOL announcement; the horror isn't the language, it's the undocumented business logic
42	16	The Ransomware Taxonomy of Institutional Stupidity	ransomware-taxonomy-institutional-stupidity	Systematic look at conditions enabling high-profile breaches: unpatched known vulns, no MFA, perverse targeting of can't-afford-to-lose sectors	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	SonicWall/Marquis lawsuit; it's institutional stupidity, not individual — that's the more interesting beast
43	16	AI Datacenters Are an Environmental Disaster	ai-datacenters-environmental-disaster	Crystal storage as potential mitigation; honest accounting of what training and inference actually cost the planet	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	BBC Future article on everlasting memory crystals in queue; pair with datacenter emissions data
44	16	Paulo Coelho vs. Hemingway: Same Wound, Different Scar	paulo-coelho-vs-hemingway-same-wound-different-scar	Similar trauma, radically different responses; what determines whether damage becomes projection or transcendence	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Companion piece to Hemingway article
45	16	Jen Mercieca at the Minefield's Edge	jen-mercieca-at-the-minefields-edge	Teaching rhetoric at Texas A&M after they ban Plato; the cost of 'people are not pleased'; Boyle's Law at the institutional selection layer	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Check if Jen still active on Twitter/Bsky; 'professionally heroic' understatement from someone doing the math every day
46	16	The Physicist Who Found Heaven at the Universe's Edge	the-physicist-who-found-heaven-at-the-universes-edge	Categorical error of assigning coordinates to transcendent concepts; the Flatlander mapping the third dimension	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Popular Mechanics headline; 'safe for angry atheists' territory; good early Accidental Mystic piece
47	16	The Joan Shakespeare Problem	the-joan-shakespeare-problem	ChatGPT couldn't render 'technically competent AND creative'; AI anthropomorphization and the gaps between human and AI understanding; the uncertainty-as-decoration trap	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Sophisticated users trust AI MORE when they hear appropriate hedging — not realizing it's decorative, not functional
48	16	KTLA and the Kakistocracy of Competence	ktla-and-the-kakistocracy-of-competence	Emmy-winning journalists shown the door; merit decoupled from survival; the audition process filters for a particular kind of person	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Kriski/Parker/Walker; pair with Congressional clown thesis — not anomalous, features not bugs
49	16	... and the Mule You Rode In On	and-the-mule-you-rode-in-on	Claude usage limits, re-subscribing, UI too dumb to know you just paid; Gemini quote: 'selling intelligence, interface can't recognize your payment'	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Anger-ready. Wayne-quality title. Connect to Danish MitID specimen and broader design-for-someone-else's-wallet theme
50	16	Anthropic's Unusual Marketing Campaign	anthropics-unusual-marketing-campaign	Fear narrative + product-as-solution; Mythos data leak as probable intentional; async errors as atmosphere; 'we have unleashed something' as emergent institutional mythology	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Economist ad irony; Sandwich Incident; Sam Bowman's sandwich email; the incentive structure runs the play without conscious direction
51	16	This Article Is Dumb Clickbait So Why Did I Read It?	this-article-is-dumb-clickbait-so-why-did-i-read-it	BGR 'no one needs USB drives' → Boyle's Law of cloud expansion; Cloudflare as single point of failure; the psychology of hate-reading	8	6	\N	2026-04-18 15:51:31.07339	2026-04-18 15:51:31.07339	Hook: 'Just use the cloud' said the guy oblivious to infrastructure fragility; pairs with Johnstown Flood piece
52	8	roles	roles	create auth-level roles for users	8	\N	\N	2026-04-18 18:42:19.053377	2026-04-18 18:42:19.053377	\N
58	18	website security	website-security-1	Implement tools to harden security for self-hosted websites	2	2	\N	2026-04-22 01:25:18.74164	2026-04-22 01:25:18.74164	cloudflare, fail2ban on DO droplet, hardened containers for websites
\.


--
-- Data for Name: tag_category; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.tag_category (id, name, sort_order) FROM stdin;
1	component	1
2	technology	2
3	area	3
4	skill	4
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.tags (id, name, category_id) FROM stdin;
1	project-crew	1
2	doc-gen	1
3	todo	1
4	menukit	1
5	fletcher	1
6	dbkit	1
7	python	2
8	bash	2
9	postgres	2
10	ansible	2
11	bind9	2
12	dhcp	2
13	docker	2
14	pygame	2
15	networking	3
16	job-search	3
17	homelab	3
18	game-dev	3
\.


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.task_status (id, name, display, sort_order, is_terminal) FROM stdin;
1	open	[ ]	1	f
2	in progress	[~]	2	f
3	on hold	[!]	3	f
4	complete	[x]	4	t
\.


--
-- Data for Name: task_tags; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.task_tags (id, task_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: steward
--

COPY public.tasks (id, project_id, parent_id, description, status_id, priority_id, links, source_file, sort_order, created_at, updated_at, completed_at, notes) FROM stdin;
8	8	\N	Add contacts management	2	2			0	2026-04-14 06:42:43.399942	2026-04-14 06:42:43.399942	\N	\N
10	8	\N	Add sticky navbar	1	1			0	2026-04-14 06:44:26.305409	2026-04-14 06:44:26.305409	\N	\N
18	8	\N	Contacts feature — repository, routes, templates.	1	2			7	2026-04-14 20:26:56.784934	2026-04-14 20:26:56.784934	\N	\N
19	8	\N	Superuser SQL box — authenticated route, raw SQL input, result table for SELECT, confirm step for writes, session query history.	1	2			8	2026-04-14 20:26:56.784934	2026-04-14 20:26:56.784934	\N	\N
20	8	\N	Basic auth — session cookies, login route, users table linked to contacts, two roles: standard and superuser.	1	2			9	2026-04-14 20:26:56.784934	2026-04-14 20:26:56.784934	\N	\N
21	8	\N	Write tests — test_db_projects.py, test_db_tasks.py, test_routes_projects.py.	1	2			10	2026-04-14 20:26:56.784934	2026-04-14 20:26:56.784934	\N	\N
22	8	\N	Deploy to wcyjvs2.	1	2			11	2026-04-14 20:26:56.784934	2026-04-14 20:26:56.784934	\N	\N
11	8	\N	Fix "add parent"	4	4			0	2026-04-14 06:45:49.652087	2026-04-14 21:58:28.087539	2026-04-14 21:58:28.102218	\N
24	9	\N	create a customized MX linux live usb for refurbishing computers	1	2			0	2026-04-14 23:39:53.539835	2026-04-14 23:39:53.539835	\N	\N
25	9	\N	identify necessary fonts that should be installed so that things like brower emojis are rendered properly.	1	2			0	2026-04-14 23:42:02.004119	2026-04-14 23:42:02.004119	\N	\N
27	8	\N	ui theme options: enable viewing this task list on as the old alternating green/white row stripes from the olden days of paper outputs.	1	1			0	2026-04-15 00:36:53.702991	2026-04-15 00:36:53.702991	\N	\N
28	8	\N	Test the full flow — type a description, set status and priority, hit Save, and confirm it lands back on the board.	4	4			0	2026-04-15 01:03:31.292592	2026-04-15 01:28:24.017097	2026-04-15 01:28:24.02462	\N
9	8	\N	modify projects and tasks to use list boxes	4	3			0	2026-04-14 06:43:42.450723	2026-04-15 01:29:16.407536	2026-04-15 01:29:16.414565	\N
29	8	\N	fix add task so that after saving a new task it goes back to the board	4	2			0	2026-04-15 01:30:55.719491	2026-04-15 01:31:42.559649	2026-04-15 01:31:42.569366	\N
12	8	\N	Fix inverted task hierarchy UX — subtasks should be added from the parent task, not the other way around.	4	4			0	2026-04-14 20:26:56.784934	2026-04-15 01:36:58.491957	2026-04-15 01:36:58.499047	\N
30	8	\N	make index.html show cards for every database the Curator interacts with	1	1			0	2026-04-15 01:40:16.340205	2026-04-15 01:40:16.340205	\N	\N
31	3	\N	UCSD Help Desk Support Analyst\r\nhttps://www.indeed.com/viewjob?jk=34bd7e89ec38cab6&tk=1jm6h234incsh801&from=jobi2a_jobmatch-reactivation-en-US_email&rjptk=1jm6h22a0mt27805&xpse=SoC267I3kHUoCS2FVJ0LbzkdCdPP&xfps=550d9f13-cd70-4496-992c-a65aa3149b6f&xkcb=SoC167M3kGqHErWuRx0ObzkdCdPP	1	2			0	2026-04-15 02:09:21.239784	2026-04-15 02:09:21.239784	\N	\N
32	3	\N	Technical Writer, SDCCD\r\nhttps://www.sdccdjobs.com/postings/16756	1	3			0	2026-04-15 02:20:05.434055	2026-04-15 02:20:05.434055	\N	\N
15	8	\N	Replace task status dropdown symbols with double-click dialog showing word labels.	4	2			0	2026-04-14 20:26:56.784934	2026-04-15 02:28:18.681453	2026-04-15 02:28:18.687261	\N
14	8	\N	Add collapsible tree to board left panel.	4	2			0	2026-04-14 20:26:56.784934	2026-04-15 02:28:28.368535	2026-04-15 02:28:28.374862	\N
17	8	\N	Task status change in board panel should stay in panel via HTMX, not redirect to detail page.	4	2			0	2026-04-14 20:26:56.784934	2026-04-15 02:29:29.251238	2026-04-15 02:29:29.257515	\N
13	8	\N	Fix parent_id data issue — existing subprojects have wrong parent_id causing incorrect tree display in board view.	4	3			0	2026-04-14 20:26:56.784934	2026-04-15 02:29:49.086758	2026-04-15 02:29:49.092398	\N
34	8	\N	Add new task dialog to board panel — no navigation away, no parent field 	4	2			0	2026-04-15 02:30:54.73236	2026-04-15 02:30:54.73236	\N	\N
35	8	\N	Add Curator character image to empty panel state	1	1			0	2026-04-15 02:31:45.666829	2026-04-15 02:31:45.666829	\N	\N
23	8	\N	Write README.	3	1			0	2026-04-14 20:26:56.784934	2026-04-15 02:34:33.312803	\N	\N
39	2	\N	Audit devices for lan inventory databases	3	1			0	2026-04-15 02:40:51.338405	2026-04-15 02:40:51.338405	\N	\N
38	2	\N	Create a PostgreSQL database for lan information and interaction with ansible	3	2			0	2026-04-15 02:40:07.149754	2026-04-15 02:41:06.518526	\N	\N
33	8	\N	Add a task search bar at the top of the tasks detail page	4	2			0	2026-04-15 02:27:15.75587	2026-04-15 03:15:10.33656	2026-04-15 03:15:10.342731	\N
16	8	\N	Add Board link to nav in base.html.	4	2			0	2026-04-14 20:26:56.784934	2026-04-15 03:16:41.966674	2026-04-15 03:16:41.974959	\N
41	8	\N	Align task page buttons	1	1			0	2026-04-15 03:28:13.793046	2026-04-15 03:28:13.793046	\N	\N
43	8	\N	Fix inline project type edit redirect — stay on board after save, verify all other inline edits are the same	1	2			0	2026-04-16 16:25:00.522071	2026-04-16 16:25:00.522071	\N	\N
44	8	\N	Delete the standalone project detail page/route	1	1			0	2026-04-16 16:25:26.188654	2026-04-16 16:25:26.188654	\N	\N
45	12	\N	refactor any python tools that use flat layout to use src layout.	1	2			0	2026-04-16 20:34:03.865333	2026-04-16 20:34:03.865333	\N	\N
46	8	\N	"Add a related items section to project and task detail pages. A dropdown allowing users to link any project or task to any other project or task, with the relationship displayed as a navigable link on both detail pages."	1	1			0	2026-04-16 20:41:45.615121	2026-04-16 20:41:45.615121	\N	\N
47	8	\N	come up with a way to save repos in a list so they don't have to be typed from scatch every time. A filterable search page like the project tasks details page maybe or a combo dropdown bos if that's still a thing.	1	1			0	2026-04-16 20:50:05.682627	2026-04-16 20:50:05.682627	\N	\N
51	14	\N	modify fletcher to detect local git first.	4	2			0	2026-04-17 04:13:17.245829	2026-04-17 04:51:57.632369	2026-04-17 04:51:57.646264	\N
49	14	\N	refactor: have fletcher manifest.yml file date to compare to run date, prompt for ok if different\n	1	2			0	2026-04-17 03:49:46.920373	2026-04-17 03:49:46.920373	\N	\N
50	8	\N	Add ability to add sub-projects to a project record instead of having to create a new project and set a parent id	1	2			0	2026-04-17 04:06:29.50634	2026-04-17 04:06:29.50634	\N	\N
48	14	\N	fix confusion related if fletcher ever gets a version.py added to it	1	1	per:https://claude.ai/chat/16bf8064-5f8e-44fc-992f-ea2732fcd1e0		0	2026-04-17 03:44:08.511069	2026-04-17 04:50:33.925486	\N	\N
36	8	\N	Keep board panel open and refreshed after task status change via HTMX | open | normal	4	1			0	2026-04-15 02:32:22.37792	2026-04-17 04:54:32.089104	2026-04-17 04:54:32.104729	\N
52	14	\N	add --manifest cli parameter so that fletcher can run from the folder where toml is located and still find manifest.yml in the dev-utils project root.	2	4	https://claude.ai/chat/b833b5f8-29fe-47a2-80ff-70284b6b9e6d		0	2026-04-17 04:47:16.327363	2026-04-17 04:51:27.080818	\N	\N
53	8	\N	redo the search bar to fit the page better	1	1			0	2026-04-17 04:53:08.504011	2026-04-17 04:53:08.504011	\N	\N
54	8	\N	add space to the right of the pencil icon for task editing 	1	2			0	2026-04-17 04:53:46.881805	2026-04-17 04:53:46.881805	\N	\N
55	8	\N	add left and right borders to project detail page	1	2			0	2026-04-17 13:47:38.79413	2026-04-17 13:47:38.79413	\N	\N
56	8	\N	align buttons on detail page.	1	2			0	2026-04-17 13:48:05.18552	2026-04-17 13:48:05.18552	\N	\N
84	8	\N	Verify all hard-coded script values that can be moved to external configs have been moved	1	1			0	2026-04-21 21:21:03.253357	2026-04-21 21:21:03.253357	\N	\N
58	8	\N	Add the links text box to the inline editing detail page for adding a new task	1	1	https://claude.ai/chat/25cdaeac-c40d-4a90-a69d-9fb6aedfc838		0	2026-04-17 14:20:44.17362	2026-04-17 14:20:44.17362	\N	\N
57	8	\N	Add tabbed panel view with Snippets — tabs for Tasks, Subprojects, and Snippets; Snippets are project-scoped searchable reference entries (title, body, category)	1	1	https://claude.ai/chat/25cdaeac-c40d-4a90-a69d-9fb6aedfc838		0	2026-04-17 14:18:34.107614	2026-04-17 14:29:29.761007	\N	\N
59	1	\N	Reporting	1	1			0	2026-04-17 14:31:29.384333	2026-04-17 14:31:29.384333	\N	\N
60	12	\N	create a tool to automate creation of a network venv for installing python packages accessible to all users.	1	1			0	2026-04-17 14:43:52.770544	2026-04-17 14:43:52.770544	\N	\N
62	14	\N	creat a simple lookup like fletcher manifest-url dbkit that reads the local manifest and returns the raw URL.	1	2			0	2026-04-17 15:50:20.594755	2026-04-17 15:50:20.594755	\N	\N
63	15	\N	change repro branch first guess from "master" to "main"	1	2			0	2026-04-17 15:54:50.902911	2026-04-17 15:54:50.902911	\N	\N
64	15	\N	Filter out egginfo* from the list of directories.	1	2			0	2026-04-17 15:59:33.819869	2026-04-17 15:59:33.819869	\N	\N
65	14	\N	bugfix: manifest.fletch shows branch master when it is really main	1	2			0	2026-04-17 16:07:30.846375	2026-04-17 16:07:30.846375	\N	\N
61	15	\N	add packaging to pyproject.toml for setupkit	4	4			0	2026-04-17 15:31:00.867342	2026-04-17 16:09:22.772249	2026-04-17 16:09:22.779216	\N
66	15	\N	add default directory option to detected that shows as <suggested in the list	1	2			0	2026-04-17 16:10:22.042906	2026-04-17 16:10:22.042906	\N	\N
67	8	\N	walk thru all board edit re-directs to identify any issues.	2	4			0	2026-04-17 16:26:22.574573	2026-04-17 16:26:22.574573	\N	\N
69	8	\N	Between the word PROJECTS and the + sign at the top of the projects list, include a dropdown to filter for project type	1	2			0	2026-04-17 23:55:15.585916	2026-04-17 23:55:15.585916	\N	\N
71	8	\N	create a query to filter task status based on project type	1	1	https://claude.ai/chat/cbcfe055-99a3-444e-9801-5285343cfe2a		0	2026-04-18 15:34:11.491619	2026-04-18 15:34:11.491619	\N	\N
72	8	\N	Projects searching	1	2			0	2026-04-18 15:49:17.680181	2026-04-18 15:49:17.680181	\N	\N
73	12	\N	bugfix: repo branch detection	2	4	https://claude.ai/chat/5dae1f0d-a496-499a-8106-4595e9896374		0	2026-04-18 18:33:57.504865	2026-04-18 18:33:57.504865	\N	\N
74	1	\N	New member of the project crew: The Quartermaster	1	2			0	2026-04-19 18:23:39.236346	2026-04-19 18:23:39.236346	\N	\N
70	8	\N	Externalize sql that is currently in projects.py to comply with project_rules.md	4	4			0	2026-04-18 00:42:03.300443	2026-04-20 04:07:46.832778	2026-04-20 04:07:46.846025	\N
79	8	\N	Add a "full edit" button to the add task dialog	1	1			0	2026-04-21 18:36:00.568298	2026-04-21 18:36:00.568298	\N	\N
80	8	\N	save notes and urls from add task popup	1	3			0	2026-04-21 18:36:48.049234	2026-04-21 18:37:10.815089	\N	\N
85	8	\N	assure all functions have docstrings and fix anything else the linter complains about 	1	2			0	2026-04-21 21:22:11.795146	2026-04-21 21:22:11.795146	\N	\N
88	8	\N	Add status message to project add form so that records don't get duplicated on save,	1	2			0	2026-04-22 01:36:03.032082	2026-04-22 01:36:03.032082	\N	Also, consider ways to prevent duplication of records in general, unless they're supposed to be duplicated.
\.


--
-- Name: contact_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.contact_emails_id_seq', 1, false);


--
-- Name: contact_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.contact_imports_id_seq', 1, false);


--
-- Name: contact_phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.contact_phones_id_seq', 1, false);


--
-- Name: contact_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.contact_urls_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- Name: file_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.file_type_id_seq', 7, true);


--
-- Name: location_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.location_type_id_seq', 4, true);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, false);


--
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.priority_id_seq', 4, true);


--
-- Name: project_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_contacts_id_seq', 1, false);


--
-- Name: project_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_files_id_seq', 12, true);


--
-- Name: project_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_status_id_seq', 8, true);


--
-- Name: project_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_tags_id_seq', 16, true);


--
-- Name: project_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_type_id_seq', 6, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.projects_id_seq', 59, true);


--
-- Name: tag_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.tag_category_id_seq', 4, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.tags_id_seq', 18, true);


--
-- Name: task_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.task_status_id_seq', 4, true);


--
-- Name: task_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.task_tags_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.tasks_id_seq', 89, true);


--
-- Name: contact_emails contact_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_emails
    ADD CONSTRAINT contact_emails_pkey PRIMARY KEY (id);


--
-- Name: contact_imports contact_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_imports
    ADD CONSTRAINT contact_imports_pkey PRIMARY KEY (id);


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
-- Name: organizations organizations_name_key; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_name_key UNIQUE (name);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


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
-- Name: idx_contact_emails_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_emails_contact ON public.contact_emails USING btree (contact_id);


--
-- Name: idx_contact_emails_email; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_emails_email ON public.contact_emails USING btree (email);


--
-- Name: idx_contact_imports_imported_at; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_imports_imported_at ON public.contact_imports USING btree (imported_at DESC);


--
-- Name: idx_contact_phones_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_phones_contact ON public.contact_phones USING btree (contact_id);


--
-- Name: idx_contact_urls_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contact_urls_contact ON public.contact_urls USING btree (contact_id);


--
-- Name: idx_contacts_organization; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_contacts_organization ON public.contacts USING btree (organization_id);


--
-- Name: idx_organizations_name; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_organizations_name ON public.organizations USING btree (name);


--
-- Name: idx_project_contacts_contact; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_contacts_contact ON public.project_contacts USING btree (contact_id);


--
-- Name: idx_project_contacts_primary_email; Type: INDEX; Schema: public; Owner: steward
--

CREATE INDEX idx_project_contacts_primary_email ON public.project_contacts USING btree (primary_email_id);


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
-- Name: contact_emails contact_emails_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contact_emails
    ADD CONSTRAINT contact_emails_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


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
-- Name: contacts contacts_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE SET NULL;


--
-- Name: project_contacts project_contacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT project_contacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- Name: project_contacts project_contacts_primary_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: steward
--

ALTER TABLE ONLY public.project_contacts
    ADD CONSTRAINT project_contacts_primary_email_id_fkey FOREIGN KEY (primary_email_id) REFERENCES public.contact_emails(id) ON DELETE SET NULL;


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

\unrestrict y5bY3Nbw03S2OkVk8h0bfu3JqeQSPT0VOXIfVLeEoAdXDAElNDrBReVrUocv7w5

