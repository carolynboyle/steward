# seed.sql

**Path:** data/seed.sql
**Syntax:** sql
**Generated:** 2026-04-19 15:48:51

```sql
--
-- PostgreSQL database dump
--

\restrict ZPfp28cY57qdSvBIXu9bR70sfft7cxIL0WUkmvwfd4MXPeiV3uf4eydRa2uInZe

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
-- Data for Name: file_type; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (1, 'markdown', 1);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (2, 'config', 2);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (3, 'script', 3);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (4, 'log', 4);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (5, 'json', 5);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (6, 'yaml', 6);
INSERT INTO public.file_type OVERRIDING SYSTEM VALUE VALUES (7, 'other', 7);


--
-- Data for Name: location_type; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.location_type OVERRIDING SYSTEM VALUE VALUES (1, 'local', 1);
INSERT INTO public.location_type OVERRIDING SYSTEM VALUE VALUES (2, 'url', 2);
INSERT INTO public.location_type OVERRIDING SYSTEM VALUE VALUES (3, 'git', 3);
INSERT INTO public.location_type OVERRIDING SYSTEM VALUE VALUES (4, 's3', 4);


--
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.priority OVERRIDING SYSTEM VALUE VALUES (1, 'low', 1);
INSERT INTO public.priority OVERRIDING SYSTEM VALUE VALUES (2, 'normal', 2);
INSERT INTO public.priority OVERRIDING SYSTEM VALUE VALUES (3, 'high', 3);
INSERT INTO public.priority OVERRIDING SYSTEM VALUE VALUES (4, 'blocking', 4);


--
-- Data for Name: project_status; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (1, 'active', 1);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (2, 'paused', 2);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (3, 'completed', 3);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (4, 'abandoned', 4);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (5, 'Published', 10);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (6, 'Ready to Write', 20);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (7, 'In Progress', 30);
INSERT INTO public.project_status OVERRIDING SYSTEM VALUE VALUES (8, 'Queued', 40);


--
-- Data for Name: project_type; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (1, 'coding', 1);
INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (2, 'homelab', 2);
INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (3, 'game-dev', 3);
INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (4, 'personal', 4);
INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (5, 'Job Application', 5);
INSERT INTO public.project_type OVERRIDING SYSTEM VALUE VALUES (6, 'other', 6);


--
-- Data for Name: tag_category; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.tag_category OVERRIDING SYSTEM VALUE VALUES (1, 'component', 1);
INSERT INTO public.tag_category OVERRIDING SYSTEM VALUE VALUES (2, 'technology', 2);
INSERT INTO public.tag_category OVERRIDING SYSTEM VALUE VALUES (3, 'area', 3);
INSERT INTO public.tag_category OVERRIDING SYSTEM VALUE VALUES (4, 'skill', 4);


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: steward
--

INSERT INTO public.task_status OVERRIDING SYSTEM VALUE VALUES (1, 'open', '[ ]', 1, false);
INSERT INTO public.task_status OVERRIDING SYSTEM VALUE VALUES (2, 'in progress', '[~]', 2, false);
INSERT INTO public.task_status OVERRIDING SYSTEM VALUE VALUES (3, 'on hold', '[!]', 3, false);
INSERT INTO public.task_status OVERRIDING SYSTEM VALUE VALUES (4, 'complete', '[x]', 4, true);


--
-- Name: file_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.file_type_id_seq', 7, true);


--
-- Name: location_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.location_type_id_seq', 4, true);


--
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.priority_id_seq', 4, true);


--
-- Name: project_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_status_id_seq', 8, true);


--
-- Name: project_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.project_type_id_seq', 6, true);


--
-- Name: tag_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.tag_category_id_seq', 4, true);


--
-- Name: task_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steward
--

SELECT pg_catalog.setval('public.task_status_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict ZPfp28cY57qdSvBIXu9bR70sfft7cxIL0WUkmvwfd4MXPeiV3uf4eydRa2uInZe


```
