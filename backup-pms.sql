--
-- PostgreSQL database dump
--

\restrict nIVeyskdXIKoLiEQKOUVF2P4q84Raauf63fQfLwH8DyUTsTLMfRYld64jFoJG8y

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-21 16:51:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16742)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 872 (class 1247 OID 16761)
-- Name: tb_project_members_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tb_project_members_status AS ENUM (
    'invited',
    'joined',
    'declined'
);


ALTER TYPE public.tb_project_members_status OWNER TO postgres;

--
-- TOC entry 875 (class 1247 OID 16768)
-- Name: tb_project_projects_priority; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tb_project_projects_priority AS ENUM (
    'low',
    'normal',
    'high',
    'urgent'
);


ALTER TYPE public.tb_project_projects_priority OWNER TO postgres;

--
-- TOC entry 878 (class 1247 OID 16778)
-- Name: tb_project_projects_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tb_project_projects_status AS ENUM (
    'draft',
    'started',
    'completed',
    'cancelled'
);


ALTER TYPE public.tb_project_projects_status OWNER TO postgres;

--
-- TOC entry 881 (class 1247 OID 16788)
-- Name: tb_project_tasks_priority; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tb_project_tasks_priority AS ENUM (
    'low',
    'normal',
    'high',
    'urgent'
);


ALTER TYPE public.tb_project_tasks_priority OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16746)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16812)
-- Name: tb_project_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_members (
    id integer NOT NULL,
    project_id integer,
    user_id uuid,
    status public.tb_project_members_status DEFAULT 'invited'::public.tb_project_members_status,
    invited_by uuid NOT NULL,
    is_active boolean,
    joined_at timestamp(3) without time zone,
    left_at timestamp(3) without time zone
);


ALTER TABLE public.tb_project_members OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16811)
-- Name: tb_project_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_members_id_seq OWNER TO postgres;

--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_project_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_members_id_seq OWNED BY public.tb_project_members.id;


--
-- TOC entry 224 (class 1259 OID 16822)
-- Name: tb_project_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_projects (
    id integer NOT NULL,
    join_code character varying(20),
    name character varying(255),
    description text,
    priority public.tb_project_projects_priority NOT NULL,
    status public.tb_project_projects_status NOT NULL,
    join_enabled boolean NOT NULL,
    progress_percent numeric(5,2) DEFAULT 0.00,
    completed_date timestamp(3) without time zone,
    created_by uuid,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_project_projects OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16821)
-- Name: tb_project_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_projects_id_seq OWNER TO postgres;

--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_project_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_projects_id_seq OWNED BY public.tb_project_projects.id;


--
-- TOC entry 232 (class 1259 OID 16894)
-- Name: tb_project_sub_task_assignees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_sub_task_assignees (
    id integer NOT NULL,
    subtask_id integer NOT NULL,
    user_id uuid NOT NULL,
    assigned_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_project_sub_task_assignees OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16893)
-- Name: tb_project_sub_task_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_sub_task_assignees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_sub_task_assignees_id_seq OWNER TO postgres;

--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 231
-- Name: tb_project_sub_task_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_sub_task_assignees_id_seq OWNED BY public.tb_project_sub_task_assignees.id;


--
-- TOC entry 230 (class 1259 OID 16874)
-- Name: tb_project_sub_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_sub_tasks (
    id integer NOT NULL,
    task_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    status_id integer NOT NULL,
    progress_percent numeric(5,2) NOT NULL,
    start_date timestamp(3) without time zone NOT NULL,
    has_due_date boolean,
    due_date timestamp(3) without time zone,
    completed_date timestamp(3) without time zone,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_project_sub_tasks OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16873)
-- Name: tb_project_sub_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_sub_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_sub_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_project_sub_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_sub_tasks_id_seq OWNED BY public.tb_project_sub_tasks.id;


--
-- TOC entry 236 (class 1259 OID 16921)
-- Name: tb_project_task_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_task_comments (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_id uuid NOT NULL,
    message text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tb_project_task_comments OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16920)
-- Name: tb_project_task_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_task_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_task_comments_id_seq OWNER TO postgres;

--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 235
-- Name: tb_project_task_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_task_comments_id_seq OWNED BY public.tb_project_task_comments.id;


--
-- TOC entry 234 (class 1259 OID 16906)
-- Name: tb_project_task_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_task_logs (
    id integer NOT NULL,
    task_id integer NOT NULL,
    subtask_id integer,
    changed_by uuid,
    old_status_id integer NOT NULL,
    new_status_id integer NOT NULL,
    old_progress numeric(5,2) NOT NULL,
    new_progress numeric(5,2) NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_project_task_logs OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16905)
-- Name: tb_project_task_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_task_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_task_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 233
-- Name: tb_project_task_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_task_logs_id_seq OWNED BY public.tb_project_task_logs.id;


--
-- TOC entry 226 (class 1259 OID 16840)
-- Name: tb_project_task_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_task_statuses (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(10),
    order_index integer DEFAULT 0,
    is_default boolean DEFAULT false,
    is_done boolean DEFAULT false,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tb_project_task_statuses OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16839)
-- Name: tb_project_task_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_task_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_task_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_project_task_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_task_statuses_id_seq OWNED BY public.tb_project_task_statuses.id;


--
-- TOC entry 228 (class 1259 OID 16855)
-- Name: tb_project_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_project_tasks (
    id integer NOT NULL,
    project_id integer NOT NULL,
    title character varying(255),
    description text,
    status_id integer NOT NULL,
    assigned_to uuid NOT NULL,
    priority public.tb_project_tasks_priority NOT NULL,
    progress_percent numeric(5,2) DEFAULT 0.00,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tb_project_tasks OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16854)
-- Name: tb_project_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_project_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_project_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_project_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_project_tasks_id_seq OWNED BY public.tb_project_tasks.id;


--
-- TOC entry 220 (class 1259 OID 16797)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    user_id uuid NOT NULL,
    username character varying(50),
    password_hash character varying(255),
    full_name character varying(255),
    email character varying(255),
    department character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    image character varying(255),
    v_admin integer DEFAULT 0,
    v_create integer DEFAULT 0,
    status integer DEFAULT 0,
    create_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP,
    create_by uuid,
    refresh_token text,
    sect character varying(10)
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- TOC entry 4917 (class 2604 OID 16815)
-- Name: tb_project_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_members ALTER COLUMN id SET DEFAULT nextval('public.tb_project_members_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 16825)
-- Name: tb_project_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_projects ALTER COLUMN id SET DEFAULT nextval('public.tb_project_projects_id_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 16897)
-- Name: tb_project_sub_task_assignees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_task_assignees ALTER COLUMN id SET DEFAULT nextval('public.tb_project_sub_task_assignees_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 16877)
-- Name: tb_project_sub_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_tasks ALTER COLUMN id SET DEFAULT nextval('public.tb_project_sub_tasks_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 16924)
-- Name: tb_project_task_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_comments ALTER COLUMN id SET DEFAULT nextval('public.tb_project_task_comments_id_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 16909)
-- Name: tb_project_task_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_logs ALTER COLUMN id SET DEFAULT nextval('public.tb_project_task_logs_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 16843)
-- Name: tb_project_task_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_statuses ALTER COLUMN id SET DEFAULT nextval('public.tb_project_task_statuses_id_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 16858)
-- Name: tb_project_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_tasks ALTER COLUMN id SET DEFAULT nextval('public.tb_project_tasks_id_seq'::regclass);


--
-- TOC entry 5144 (class 0 OID 16746)
-- Dependencies: 219
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
8573c897-3f95-4add-83a0-7c458a856c29	0e43f6fb4f64507010b447e12f3bf3dc67a96737a4d09f6e4aa7b3db30a01dab	2025-11-03 10:33:02.823771+07	20251103033302_init	\N	\N	2025-11-03 10:33:02.779057+07	1
d3fa3f61-c36e-47e5-8c2c-aad12c4d3dc5	67b3831d1e47101a54ed83c6e5b71d7e5762cf55352424e19ce0d0be2a1572ba	2025-11-03 10:41:33.572317+07	20251103034133_update_refresh_token_length	\N	\N	2025-11-03 10:41:33.567913+07	1
\.


--
-- TOC entry 5147 (class 0 OID 16812)
-- Dependencies: 222
-- Data for Name: tb_project_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_members (id, project_id, user_id, status, invited_by, is_active, joined_at, left_at) FROM stdin;
1	1	2eed0b7d-0a7c-4438-b138-6152ff720cc8	joined	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N	\N
2	1	ce887109-88da-4812-8a59-a3becb43b5bf	joined	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N	\N
3	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	joined	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N	\N
4	2	0e954ab9-9629-4678-9055-362f3c3d97b9	joined	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N	\N
5	2	ce887109-88da-4812-8a59-a3becb43b5bf	joined	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N	\N
\.


--
-- TOC entry 5149 (class 0 OID 16822)
-- Dependencies: 224
-- Data for Name: tb_project_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_projects (id, join_code, name, description, priority, status, join_enabled, progress_percent, completed_date, created_by, created_at, updated_at) FROM stdin;
2	D2RD75	การทดสอบ BUG ครั้งที่ 1	ทดสอบข้อมูล	urgent	completed	t	0.00	\N	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-04 07:08:29.042	2025-11-05 04:02:26.019
1	N5NBF2	ทดสอบ	ทดสอบ	normal	completed	t	0.00	\N	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-03 06:01:58.568	2025-11-05 04:14:17.187
\.


--
-- TOC entry 5157 (class 0 OID 16894)
-- Dependencies: 232
-- Data for Name: tb_project_sub_task_assignees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_sub_task_assignees (id, subtask_id, user_id, assigned_at) FROM stdin;
1	1	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-03 06:06:22.696
2	1	ce887109-88da-4812-8a59-a3becb43b5bf	2025-11-03 06:06:22.696
3	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-03 06:20:14.111
4	2	ce887109-88da-4812-8a59-a3becb43b5bf	2025-11-03 06:20:14.111
5	3	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-03 06:27:17.864
6	3	ce887109-88da-4812-8a59-a3becb43b5bf	2025-11-03 06:27:17.864
7	4	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2025-11-03 08:21:11.762
8	5	ce887109-88da-4812-8a59-a3becb43b5bf	2025-11-03 08:28:09.382
\.


--
-- TOC entry 5155 (class 0 OID 16874)
-- Dependencies: 230
-- Data for Name: tb_project_sub_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_sub_tasks (id, task_id, title, description, status_id, progress_percent, start_date, has_due_date, due_date, completed_date, created_at, updated_at) FROM stdin;
2	2	ติดตั้ง Package NPM		3	100.00	2025-11-03 00:00:00	t	2025-11-03 00:00:00	2025-11-03 06:26:27.321	2025-11-03 06:20:14.106	2025-11-03 06:26:27.321
3	1	New Project Backend		3	100.00	2025-11-03 00:00:00	f	\N	2025-11-03 06:35:29.193	2025-11-03 06:27:17.856	2025-11-03 06:35:29.193
4	3	ทดสอบ		2	100.00	2025-11-03 00:00:00	f	\N	2025-11-03 08:25:23.498	2025-11-03 08:21:11.741	2025-11-03 08:25:23.498
1	2	สร้างโปรเจค11		2	100.00	2025-11-03 00:00:00	t	2025-11-02 00:00:00	2025-11-03 06:06:42.57	2025-11-03 06:06:22.689	2025-11-03 06:06:42.57
5	3	gg		2	100.00	2025-11-03 00:00:00	f	\N	2025-11-05 03:50:58.017	2025-11-03 08:28:09.374	2025-11-05 03:50:58.017
\.


--
-- TOC entry 5161 (class 0 OID 16921)
-- Dependencies: 236
-- Data for Name: tb_project_task_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_task_comments (id, task_id, user_id, message, created_at, updated_at) FROM stdin;
1	1	ce887109-88da-4812-8a59-a3becb43b5bf	สวัสดีครับ	2025-11-03 07:18:55.165	2025-11-03 07:18:55.165
2	1	2eed0b7d-0a7c-4438-b138-6152ff720cc8	ติดตั้งแพคเก็จไม่ได้	2025-11-03 07:26:21.579	2025-11-03 07:26:21.579
3	1	ce887109-88da-4812-8a59-a3becb43b5bf	ลอง npm i ยังครับ	2025-11-03 07:26:51.998	2025-11-03 07:26:51.998
4	1	2eed0b7d-0a7c-4438-b138-6152ff720cc8	npm i ได้แล้วครับ	2025-11-03 07:31:56.218	2025-11-03 07:31:56.218
5	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	Backend ใช้ ฐานข้อมูลอะไรดีครับ	2025-11-03 07:35:41.785	2025-11-03 07:35:41.785
6	2	ce887109-88da-4812-8a59-a3becb43b5bf	MySQL ไหม	2025-11-03 07:35:57.52	2025-11-03 07:35:57.52
7	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	ได้ครับ	2025-11-03 07:36:03.746	2025-11-03 07:36:03.746
8	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	แล้วใช้ ORM อะไรดีครับ	2025-11-03 07:36:13.724	2025-11-03 07:36:13.724
9	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	TypeORM ไหม	2025-11-03 07:36:21.615	2025-11-03 07:36:21.615
10	2	ce887109-88da-4812-8a59-a3becb43b5bf	PrismaORM ดีกว่าครับ	2025-11-03 07:36:32.123	2025-11-03 07:36:32.123
11	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	รับทราบครับ	2025-11-03 07:36:36.283	2025-11-03 07:36:36.283
\.


--
-- TOC entry 5159 (class 0 OID 16906)
-- Dependencies: 234
-- Data for Name: tb_project_task_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_task_logs (id, task_id, subtask_id, changed_by, old_status_id, new_status_id, old_progress, new_progress, created_at) FROM stdin;
1	2	1	2eed0b7d-0a7c-4438-b138-6152ff720cc8	1	1	0.00	0.00	2025-11-03 06:06:22.708
2	2	1	ce887109-88da-4812-8a59-a3becb43b5bf	1	2	0.00	100.00	2025-11-03 06:06:42.603
3	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	3	3	0.00	0.00	2025-11-03 06:20:14.131
4	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	3	3	0.00	15.00	2025-11-03 06:20:50.756
5	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	3	2	15.00	50.00	2025-11-03 06:21:08.399
6	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2	3	50.00	100.00	2025-11-03 06:21:32.571
7	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	3	3	100.00	95.00	2025-11-03 06:26:11.842
8	2	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	3	3	95.00	100.00	2025-11-03 06:26:27.334
9	1	3	2eed0b7d-0a7c-4438-b138-6152ff720cc8	1	1	0.00	0.00	2025-11-03 06:27:17.88
10	1	3	2eed0b7d-0a7c-4438-b138-6152ff720cc8	1	3	0.00	100.00	2025-11-03 06:35:29.211
11	3	4	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2	2	0.00	0.00	2025-11-03 08:21:11.839
12	3	4	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2	2	0.00	50.00	2025-11-03 08:25:10.581
13	3	4	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2	2	50.00	100.00	2025-11-03 08:25:23.514
14	3	5	2eed0b7d-0a7c-4438-b138-6152ff720cc8	2	2	0.00	0.00	2025-11-03 08:28:09.394
15	3	5	ce887109-88da-4812-8a59-a3becb43b5bf	2	2	0.00	45.00	2025-11-05 03:48:56.994
16	3	5	ce887109-88da-4812-8a59-a3becb43b5bf	2	2	45.00	85.00	2025-11-05 03:50:14.529
17	3	5	ce887109-88da-4812-8a59-a3becb43b5bf	2	2	85.00	100.00	2025-11-05 03:50:58.033
\.


--
-- TOC entry 5151 (class 0 OID 16840)
-- Dependencies: 226
-- Data for Name: tb_project_task_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_task_statuses (id, project_id, name, color, order_index, is_default, is_done, created_at, updated_at) FROM stdin;
1	1	Todo	#3B82F6	1	t	f	2025-11-03 06:04:00.915	2025-11-03 06:04:00.915
2	1	Process	#27b037	2	f	f	2025-11-03 06:04:00.915	2025-11-03 06:04:00.915
3	1	Done	#f73bc5	3	f	t	2025-11-03 06:04:00.915	2025-11-03 06:04:00.915
4	2	Todo	#3B82F6	1	t	f	2025-11-04 08:30:25.172	2025-11-04 08:30:25.172
5	2	Process	#3bf75a	2	f	f	2025-11-04 08:30:25.172	2025-11-04 08:30:38.51
6	2	Done	#f4f73b	3	f	t	2025-11-04 08:30:25.172	2025-11-04 08:30:38.332
\.


--
-- TOC entry 5153 (class 0 OID 16855)
-- Dependencies: 228
-- Data for Name: tb_project_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_project_tasks (id, project_id, title, description, status_id, assigned_to, priority, progress_percent, created_at, updated_at) FROM stdin;
2	1	New Project Backend	สร้างโปรเจคด้วย Golang Fiber Gorm ORM	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	normal	100.00	2025-11-03 06:05:33.506	2025-11-04 06:22:12.892
1	1	New Project Frontend	สร้างโดย React	2	2eed0b7d-0a7c-4438-b138-6152ff720cc8	normal	100.00	2025-11-03 06:05:08.059	2025-11-04 06:22:13.443
3	1	ทดสอบ	ทดสอบ	2	ce887109-88da-4812-8a59-a3becb43b5bf	normal	100.00	2025-11-03 07:57:57.398	2025-11-05 03:50:58.028
\.


--
-- TOC entry 5145 (class 0 OID 16797)
-- Dependencies: 220
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (user_id, username, password_hash, full_name, email, department, "position", image, v_admin, v_create, status, create_date, create_by, refresh_token, sect) FROM stdin;
0e954ab9-9629-4678-9055-362f3c3d97b9	owner	$argon2id$v=19$m=65536,t=3,p=4$y9WB3FOUevc0GPcvJ1s9Vw$fBT/G3VPdmFZxh6EFGQqGEUwXp3cX9sHE987ihfGlq8	Owner TEE	owner@gmail.com	IT	STAFF	\N	0	0	0	2025-11-04 04:02:58.626	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N
ce887109-88da-4812-8a59-a3becb43b5bf	680042	$argon2id$v=19$m=65536,t=3,p=4$2ZXcwEETUpb0afSPk8QxxA$LXaSsEjKA96IPikDwsvndVRYCVyRrS3wX8P5wS+WNYQ	วสุโชค ใจน้ำ	wasuchokop@gmail.com	IT	STAFF	\N	0	0	0	2025-11-03 03:37:31.799	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjZTg4NzEwOS04OGRhLTQ4MTItOGE1OS1hM2JlY2I0M2I1YmYiLCJlbWFpbCI6Indhc3VjaG9rb3BAZ21haWwuY29tIiwicm9sZXMiOlsiZW1wbG95ZWUiXSwiaWF0IjoxNzYyMzE0MjEyLCJleHAiOjE3NjI5MTkwMTJ9.Zp8zcstXdvCZqSvY1irApX_8FamZNRS-qDSZ4eTYE5E	\N
2eed0b7d-0a7c-4438-b138-6152ff720cc8	admin	$argon2id$v=19$m=65536,t=3,p=4$nz3tGz+J0W+VNFmOCNZTRA$AadZS1Y4deiRH2Obmy7HcBXbuhOsTaTWpRFNV7/HH24	แอดมิน แอดมิน	admin@gmail.com	IT	ADMIN	uploads\\images\\users\\1762244989043.png	1	1	0	2025-11-03 03:43:29.915	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyZWVkMGI3ZC0wYTdjLTQ0MzgtYjEzOC02MTUyZmY3MjBjYzgiLCJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGVzIjpbImFkbWluIiwic3RhZmYiXSwiaWF0IjoxNzYyMzE0MjUwLCJleHAiOjE3NjI5MTkwNTB9.xsuysJCMJno_yYJI62E_m51BNUrAfbNUDSGhkI0oSx4	\N
7a0bdedd-393f-437f-a06b-bb5a546f7e10	wasuchok	$argon2id$v=19$m=65536,t=3,p=4$G3SHtI2KPKNP3UPs84nqLw$TuNlmgwYrASR8OLFHORORVo8kKWXnCmNb4BfLi3B6mc	วสุโชค ใจน้ำ	wasuchokop@gmail.com	IT	STAFF	uploads\\images\\users\\1762221743423.jpg	1	1	0	2025-11-04 02:02:23.855	2eed0b7d-0a7c-4438-b138-6152ff720cc8	\N	\N
\.


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_project_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_members_id_seq', 5, true);


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_project_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_projects_id_seq', 2, true);


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 231
-- Name: tb_project_sub_task_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_sub_task_assignees_id_seq', 8, true);


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_project_sub_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_sub_tasks_id_seq', 5, true);


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 235
-- Name: tb_project_task_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_task_comments_id_seq', 11, true);


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 233
-- Name: tb_project_task_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_task_logs_id_seq', 17, true);


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_project_task_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_task_statuses_id_seq', 6, true);


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_project_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_project_tasks_id_seq', 3, true);


--
-- TOC entry 4944 (class 2606 OID 16759)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4949 (class 2606 OID 16820)
-- Name: tb_project_members tb_project_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_members
    ADD CONSTRAINT tb_project_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4954 (class 2606 OID 16838)
-- Name: tb_project_projects tb_project_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_projects
    ADD CONSTRAINT tb_project_projects_pkey PRIMARY KEY (id);


--
-- TOC entry 4968 (class 2606 OID 16904)
-- Name: tb_project_sub_task_assignees tb_project_sub_task_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_task_assignees
    ADD CONSTRAINT tb_project_sub_task_assignees_pkey PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 16892)
-- Name: tb_project_sub_tasks tb_project_sub_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_tasks
    ADD CONSTRAINT tb_project_sub_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4977 (class 2606 OID 16934)
-- Name: tb_project_task_comments tb_project_task_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_comments
    ADD CONSTRAINT tb_project_task_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 16919)
-- Name: tb_project_task_logs tb_project_task_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_logs
    ADD CONSTRAINT tb_project_task_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4956 (class 2606 OID 16853)
-- Name: tb_project_task_statuses tb_project_task_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_statuses
    ADD CONSTRAINT tb_project_task_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4960 (class 2606 OID 16872)
-- Name: tb_project_tasks tb_project_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_tasks
    ADD CONSTRAINT tb_project_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 16810)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4950 (class 1259 OID 16936)
-- Name: tb_project_members_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_members_project_id_idx ON public.tb_project_members USING btree (project_id);


--
-- TOC entry 4951 (class 1259 OID 16937)
-- Name: tb_project_members_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_members_user_id_idx ON public.tb_project_members USING btree (user_id);


--
-- TOC entry 4952 (class 1259 OID 16938)
-- Name: tb_project_projects_created_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_projects_created_by_idx ON public.tb_project_projects USING btree (created_by);


--
-- TOC entry 4969 (class 1259 OID 16945)
-- Name: tb_project_sub_task_assignees_subtask_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_sub_task_assignees_subtask_id_idx ON public.tb_project_sub_task_assignees USING btree (subtask_id);


--
-- TOC entry 4970 (class 1259 OID 16946)
-- Name: tb_project_sub_task_assignees_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_sub_task_assignees_user_id_idx ON public.tb_project_sub_task_assignees USING btree (user_id);


--
-- TOC entry 4965 (class 1259 OID 16943)
-- Name: tb_project_sub_tasks_status_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_sub_tasks_status_id_idx ON public.tb_project_sub_tasks USING btree (status_id);


--
-- TOC entry 4966 (class 1259 OID 16944)
-- Name: tb_project_sub_tasks_task_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_sub_tasks_task_id_idx ON public.tb_project_sub_tasks USING btree (task_id);


--
-- TOC entry 4978 (class 1259 OID 16950)
-- Name: tb_project_task_comments_task_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_comments_task_id_idx ON public.tb_project_task_comments USING btree (task_id);


--
-- TOC entry 4979 (class 1259 OID 16951)
-- Name: tb_project_task_comments_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_comments_user_id_idx ON public.tb_project_task_comments USING btree (user_id);


--
-- TOC entry 4971 (class 1259 OID 16947)
-- Name: tb_project_task_logs_changed_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_logs_changed_by_idx ON public.tb_project_task_logs USING btree (changed_by);


--
-- TOC entry 4974 (class 1259 OID 16948)
-- Name: tb_project_task_logs_subtask_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_logs_subtask_id_idx ON public.tb_project_task_logs USING btree (subtask_id);


--
-- TOC entry 4975 (class 1259 OID 16949)
-- Name: tb_project_task_logs_task_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_logs_task_id_idx ON public.tb_project_task_logs USING btree (task_id);


--
-- TOC entry 4957 (class 1259 OID 16939)
-- Name: tb_project_task_statuses_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_task_statuses_project_id_idx ON public.tb_project_task_statuses USING btree (project_id);


--
-- TOC entry 4958 (class 1259 OID 16940)
-- Name: tb_project_tasks_assigned_to_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_tasks_assigned_to_idx ON public.tb_project_tasks USING btree (assigned_to);


--
-- TOC entry 4961 (class 1259 OID 16941)
-- Name: tb_project_tasks_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_tasks_project_id_idx ON public.tb_project_tasks USING btree (project_id);


--
-- TOC entry 4962 (class 1259 OID 16942)
-- Name: tb_project_tasks_status_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tb_project_tasks_status_id_idx ON public.tb_project_tasks USING btree (status_id);


--
-- TOC entry 4945 (class 1259 OID 16935)
-- Name: user_account_create_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_account_create_by_idx ON public.user_account USING btree (create_by);


--
-- TOC entry 4981 (class 2606 OID 16957)
-- Name: tb_project_members tb_project_members_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_members
    ADD CONSTRAINT tb_project_members_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.tb_project_projects(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 4982 (class 2606 OID 16962)
-- Name: tb_project_members tb_project_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_members
    ADD CONSTRAINT tb_project_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_account(user_id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 4983 (class 2606 OID 16967)
-- Name: tb_project_projects tb_project_projects_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_projects
    ADD CONSTRAINT tb_project_projects_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.user_account(user_id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 4990 (class 2606 OID 17002)
-- Name: tb_project_sub_task_assignees tb_project_sub_task_assignees_subtask_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_task_assignees
    ADD CONSTRAINT tb_project_sub_task_assignees_subtask_id_fkey FOREIGN KEY (subtask_id) REFERENCES public.tb_project_sub_tasks(id);


--
-- TOC entry 4991 (class 2606 OID 17007)
-- Name: tb_project_sub_task_assignees tb_project_sub_task_assignees_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_task_assignees
    ADD CONSTRAINT tb_project_sub_task_assignees_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_account(user_id);


--
-- TOC entry 4988 (class 2606 OID 16992)
-- Name: tb_project_sub_tasks tb_project_sub_tasks_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_tasks
    ADD CONSTRAINT tb_project_sub_tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tb_project_task_statuses(id);


--
-- TOC entry 4989 (class 2606 OID 16997)
-- Name: tb_project_sub_tasks tb_project_sub_tasks_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_sub_tasks
    ADD CONSTRAINT tb_project_sub_tasks_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tb_project_tasks(id);


--
-- TOC entry 4995 (class 2606 OID 17027)
-- Name: tb_project_task_comments tb_project_task_comments_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_comments
    ADD CONSTRAINT tb_project_task_comments_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tb_project_tasks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4996 (class 2606 OID 17032)
-- Name: tb_project_task_comments tb_project_task_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_comments
    ADD CONSTRAINT tb_project_task_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_account(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4992 (class 2606 OID 17012)
-- Name: tb_project_task_logs tb_project_task_logs_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_logs
    ADD CONSTRAINT tb_project_task_logs_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.user_account(user_id);


--
-- TOC entry 4993 (class 2606 OID 17017)
-- Name: tb_project_task_logs tb_project_task_logs_subtask_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_logs
    ADD CONSTRAINT tb_project_task_logs_subtask_id_fkey FOREIGN KEY (subtask_id) REFERENCES public.tb_project_sub_tasks(id);


--
-- TOC entry 4994 (class 2606 OID 17022)
-- Name: tb_project_task_logs tb_project_task_logs_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_logs
    ADD CONSTRAINT tb_project_task_logs_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tb_project_tasks(id);


--
-- TOC entry 4984 (class 2606 OID 16972)
-- Name: tb_project_task_statuses tb_project_task_statuses_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_task_statuses
    ADD CONSTRAINT tb_project_task_statuses_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.tb_project_projects(id);


--
-- TOC entry 4985 (class 2606 OID 16977)
-- Name: tb_project_tasks tb_project_tasks_assigned_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_tasks
    ADD CONSTRAINT tb_project_tasks_assigned_to_fkey FOREIGN KEY (assigned_to) REFERENCES public.user_account(user_id);


--
-- TOC entry 4986 (class 2606 OID 16982)
-- Name: tb_project_tasks tb_project_tasks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_tasks
    ADD CONSTRAINT tb_project_tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.tb_project_projects(id);


--
-- TOC entry 4987 (class 2606 OID 16987)
-- Name: tb_project_tasks tb_project_tasks_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_project_tasks
    ADD CONSTRAINT tb_project_tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.tb_project_task_statuses(id);


--
-- TOC entry 4980 (class 2606 OID 16952)
-- Name: user_account user_account_create_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_create_by_fkey FOREIGN KEY (create_by) REFERENCES public.user_account(user_id);


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-11-21 16:51:40

--
-- PostgreSQL database dump complete
--

\unrestrict nIVeyskdXIKoLiEQKOUVF2P4q84Raauf63fQfLwH8DyUTsTLMfRYld64jFoJG8y

