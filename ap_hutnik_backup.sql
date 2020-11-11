--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)
-- Dumped by pg_dump version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: page_ap_basebuildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_basebuildings (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    size character varying(50),
    photo character varying(100) NOT NULL,
    status integer,
    slug character varying(32)
);


ALTER TABLE public.page_ap_basebuildings OWNER TO postgres;

--
-- Name: page_ap_basebuildings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_basebuildings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_basebuildings_id_seq OWNER TO postgres;

--
-- Name: page_ap_basebuildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_basebuildings_id_seq OWNED BY public.page_ap_basebuildings.id;


--
-- Name: page_ap_baseobjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_baseobjects (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    size character varying(50) NOT NULL,
    photo character varying(100) NOT NULL,
    status integer,
    slug character varying(32),
    main_object_id integer NOT NULL
);


ALTER TABLE public.page_ap_baseobjects OWNER TO postgres;

--
-- Name: page_ap_baseobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_baseobjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_baseobjects_id_seq OWNER TO postgres;

--
-- Name: page_ap_baseobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_baseobjects_id_seq OWNED BY public.page_ap_baseobjects.id;


--
-- Name: page_ap_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_file (
    id integer NOT NULL,
    file character varying(100),
    title character varying(40) NOT NULL,
    email boolean NOT NULL
);


ALTER TABLE public.page_ap_file OWNER TO postgres;

--
-- Name: page_ap_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_file_id_seq OWNER TO postgres;

--
-- Name: page_ap_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_file_id_seq OWNED BY public.page_ap_file.id;


--
-- Name: page_ap_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_images (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    no_image boolean NOT NULL,
    building_id integer,
    post_id integer,
    team_id integer
);


ALTER TABLE public.page_ap_images OWNER TO postgres;

--
-- Name: page_ap_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_images_id_seq OWNER TO postgres;

--
-- Name: page_ap_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_images_id_seq OWNED BY public.page_ap_images.id;


--
-- Name: page_ap_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_post (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    photo character varying(100) NOT NULL,
    slug character varying(250),
    body text NOT NULL,
    publish timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status character varying(10) NOT NULL,
    author_id integer NOT NULL,
    team_id integer
);


ALTER TABLE public.page_ap_post OWNER TO postgres;

--
-- Name: page_ap_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_post_id_seq OWNER TO postgres;

--
-- Name: page_ap_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_post_id_seq OWNED BY public.page_ap_post.id;


--
-- Name: page_ap_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_profile (
    id integer NOT NULL,
    role integer NOT NULL,
    date_of_birth date,
    photo character varying(100) NOT NULL,
    slug character varying(64),
    is_player boolean,
    is_pupil boolean,
    from_team character varying(32),
    date_of_start date,
    team_name character varying(32),
    "position" integer,
    employe_position integer,
    certyficate character varying(128),
    phone_number character varying(12),
    text text,
    team_id integer,
    user_id integer NOT NULL,
    is_activated boolean NOT NULL,
    rodo boolean NOT NULL
);


ALTER TABLE public.page_ap_profile OWNER TO postgres;

--
-- Name: page_ap_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_profile_id_seq OWNER TO postgres;

--
-- Name: page_ap_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_profile_id_seq OWNED BY public.page_ap_profile.id;


--
-- Name: page_ap_sponsors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_sponsors (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    role integer NOT NULL,
    url character varying(200) NOT NULL
);


ALTER TABLE public.page_ap_sponsors OWNER TO postgres;

--
-- Name: page_ap_sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_sponsors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_sponsors_id_seq OWNER TO postgres;

--
-- Name: page_ap_sponsors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_sponsors_id_seq OWNED BY public.page_ap_sponsors.id;


--
-- Name: page_ap_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_teams (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    photo character varying(100) NOT NULL,
    archive boolean NOT NULL,
    slug character varying(32),
    coach_id integer NOT NULL,
    yearbook_id integer NOT NULL
);


ALTER TABLE public.page_ap_teams OWNER TO postgres;

--
-- Name: page_ap_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_teams_id_seq OWNER TO postgres;

--
-- Name: page_ap_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_teams_id_seq OWNED BY public.page_ap_teams.id;


--
-- Name: page_ap_teams_team_persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_teams_team_persons (
    id integer NOT NULL,
    teams_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.page_ap_teams_team_persons OWNER TO postgres;

--
-- Name: page_ap_teams_team_persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_teams_team_persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_teams_team_persons_id_seq OWNER TO postgres;

--
-- Name: page_ap_teams_team_persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_teams_team_persons_id_seq OWNED BY public.page_ap_teams_team_persons.id;


--
-- Name: page_ap_trainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_trainings (
    id integer NOT NULL,
    date_start time without time zone NOT NULL,
    date_end time without time zone NOT NULL,
    day_time integer NOT NULL,
    place_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.page_ap_trainings OWNER TO postgres;

--
-- Name: page_ap_trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_trainings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_trainings_id_seq OWNER TO postgres;

--
-- Name: page_ap_trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_trainings_id_seq OWNED BY public.page_ap_trainings.id;


--
-- Name: page_ap_yearbook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_ap_yearbook (
    id integer NOT NULL,
    title character varying(4) NOT NULL,
    archive boolean,
    slug character varying(32)
);


ALTER TABLE public.page_ap_yearbook OWNER TO postgres;

--
-- Name: page_ap_yearbook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.page_ap_yearbook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_ap_yearbook_id_seq OWNER TO postgres;

--
-- Name: page_ap_yearbook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.page_ap_yearbook_id_seq OWNED BY public.page_ap_yearbook.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO postgres;

--
-- Name: webp_converter_webpimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webp_converter_webpimage (
    id integer NOT NULL,
    static_path character varying(512) NOT NULL,
    quality integer NOT NULL,
    CONSTRAINT webp_converter_webpimage_quality_check CHECK ((quality >= 0))
);


ALTER TABLE public.webp_converter_webpimage OWNER TO postgres;

--
-- Name: webp_converter_webpimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webp_converter_webpimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webp_converter_webpimage_id_seq OWNER TO postgres;

--
-- Name: webp_converter_webpimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webp_converter_webpimage_id_seq OWNED BY public.webp_converter_webpimage.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: page_ap_basebuildings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_basebuildings ALTER COLUMN id SET DEFAULT nextval('public.page_ap_basebuildings_id_seq'::regclass);


--
-- Name: page_ap_baseobjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_baseobjects ALTER COLUMN id SET DEFAULT nextval('public.page_ap_baseobjects_id_seq'::regclass);


--
-- Name: page_ap_file id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_file ALTER COLUMN id SET DEFAULT nextval('public.page_ap_file_id_seq'::regclass);


--
-- Name: page_ap_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_images ALTER COLUMN id SET DEFAULT nextval('public.page_ap_images_id_seq'::regclass);


--
-- Name: page_ap_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_post ALTER COLUMN id SET DEFAULT nextval('public.page_ap_post_id_seq'::regclass);


--
-- Name: page_ap_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_profile ALTER COLUMN id SET DEFAULT nextval('public.page_ap_profile_id_seq'::regclass);


--
-- Name: page_ap_sponsors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_sponsors ALTER COLUMN id SET DEFAULT nextval('public.page_ap_sponsors_id_seq'::regclass);


--
-- Name: page_ap_teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams ALTER COLUMN id SET DEFAULT nextval('public.page_ap_teams_id_seq'::regclass);


--
-- Name: page_ap_teams_team_persons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams_team_persons ALTER COLUMN id SET DEFAULT nextval('public.page_ap_teams_team_persons_id_seq'::regclass);


--
-- Name: page_ap_trainings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_trainings ALTER COLUMN id SET DEFAULT nextval('public.page_ap_trainings_id_seq'::regclass);


--
-- Name: page_ap_yearbook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_yearbook ALTER COLUMN id SET DEFAULT nextval('public.page_ap_yearbook_id_seq'::regclass);


--
-- Name: webp_converter_webpimage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webp_converter_webpimage ALTER COLUMN id SET DEFAULT nextval('public.webp_converter_webpimage_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	Piłkarze
1	Pracownicy
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
61	1	61
62	1	62
63	1	63
64	1	64
65	1	65
66	1	66
67	1	67
68	1	68
69	1	69
70	1	70
71	1	71
72	1	72
73	2	64
74	2	32
75	2	36
76	2	68
77	2	72
78	2	40
79	2	44
80	2	28
81	2	14
82	2	16
83	2	48
84	2	20
85	2	52
86	2	56
87	2	57
88	2	58
89	2	59
90	2	60
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add kv store	7	add_kvstore
26	Can change kv store	7	change_kvstore
27	Can delete kv store	7	delete_kvstore
28	Can view kv store	7	view_kvstore
29	Can add web p image	8	add_webpimage
30	Can change web p image	8	change_webpimage
31	Can delete web p image	8	delete_webpimage
32	Can view web p image	8	view_webpimage
33	Can add base objects	9	add_baseobjects
34	Can change base objects	9	change_baseobjects
35	Can delete base objects	9	delete_baseobjects
36	Can view base objects	9	view_baseobjects
37	Can add year book	10	add_yearbook
38	Can change year book	10	change_yearbook
39	Can delete year book	10	delete_yearbook
40	Can view year book	10	view_yearbook
41	Can add post	11	add_post
42	Can change post	11	change_post
43	Can delete post	11	delete_post
44	Can view post	11	view_post
45	Can add teams	12	add_teams
46	Can change teams	12	change_teams
47	Can delete teams	12	delete_teams
48	Can view teams	12	view_teams
49	Can add base buildings	13	add_basebuildings
50	Can change base buildings	13	change_basebuildings
51	Can delete base buildings	13	delete_basebuildings
52	Can view base buildings	13	view_basebuildings
53	Can add images	14	add_images
54	Can change images	14	change_images
55	Can delete images	14	delete_images
56	Can view images	14	view_images
57	Can add profile	15	add_profile
58	Can change profile	15	change_profile
59	Can delete profile	15	delete_profile
60	Can view profile	15	view_profile
61	Can add sponsors	16	add_sponsors
62	Can change sponsors	16	change_sponsors
63	Can delete sponsors	16	delete_sponsors
64	Can view sponsors	16	view_sponsors
65	Can add trainings	17	add_trainings
66	Can change trainings	17	change_trainings
67	Can delete trainings	17	delete_trainings
68	Can view trainings	17	view_trainings
69	Can add file	18	add_file
70	Can change file	18	change_file
71	Can delete file	18	delete_file
72	Can view file	18	view_file
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$5urXtBjNlwSO$8oZjf/0zxVOSEM4vlDsh/lAPClUT3lLmI/68MUhKkSc=	2020-11-08 09:24:10.597824+01	t	KennyDaktyl	Michał	Pielak	pielak@miktelgsm.pl	t	t	2020-05-31 15:27:12+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-05-31 15:30:01.806896+02	1	Był będzie jest Hutnik HKS	1	[{"added": {}}]	11	1
2	2020-05-31 15:34:53.576437+02	1	Profil użytkownika KennyDaktyl.	1	[{"added": {}}]	15	1
3	2020-05-31 15:35:45.016318+02	1	Profil użytkownika KennyDaktyl.	2	[{"changed": {"fields": ["Status osoby"]}}]	15	1
4	2020-05-31 15:40:09.331549+02	1	1	1	[{"added": {}}]	14	1
5	2020-05-31 16:15:41.368492+02	2	2	1	[{"added": {}}]	14	1
6	2020-05-31 16:29:14.168189+02	1	2009	1	[{"added": {}}]	10	1
7	2020-05-31 16:30:17.419878+02	2	Nowy22_555	1	[{"added": {}}]	4	1
8	2020-05-31 16:31:04.675909+02	2	Profil użytkownika Nowy22_555.	1	[{"added": {}}]	15	1
9	2020-05-31 16:31:07.737582+02	1	2009-Zielona	1	[{"added": {}}]	12	1
10	2020-05-31 17:00:57.197099+02	1	2009-Zielona	2	[{"changed": {"fields": ["Photo"]}}]	12	1
11	2020-05-31 17:01:37.581442+02	1	2009-Zielona	2	[{"changed": {"fields": ["Coach"]}}]	12	1
12	2020-05-31 17:07:46.298596+02	1	Stadion Hutnik Kraków-Stadion główny	1	[{"added": {}}]	13	1
13	2020-06-01 08:33:29.641801+02	5	qwdqwdqwdqwd	2	[{"changed": {"fields": ["Active"]}}]	4	1
14	2020-06-01 15:55:29.776012+02	1	Był będzie jest Hutnik HKS	2	[{"changed": {"fields": ["Zdj\\u0119cie g\\u0142\\u00f3wne"]}}]	11	1
15	2020-06-01 15:56:13.846574+02	2	Przykładowy post z turnieju	2	[{"changed": {"fields": ["Tytu\\u0142 posta", "Zdj\\u0119cie g\\u0142\\u00f3wne", "Tre\\u015b\\u0107 posta"]}}]	11	1
16	2020-06-01 15:59:04.801922+02	1	Profil użytkownika KennyDaktyl.	2	[{"changed": {"fields": ["Photo"]}}]	15	1
17	2020-06-01 16:01:03.795817+02	7	JanGol	2	[{"changed": {"fields": ["Username"]}}]	4	1
18	2020-06-01 16:01:55.998501+02	7	Profil użytkownika JanGol.	2	[{"changed": {"fields": ["Photo"]}}]	15	1
19	2020-06-01 16:05:54.942272+02	2	Nowy22_555	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
20	2020-06-14 14:08:46.51143+02	4	Hello wdwd dwd wd	2	[{"changed": {"fields": ["Tytu\\u0142 posta", "Tre\\u015b\\u0107 posta"]}}]	11	1
21	2020-06-14 14:08:55.369089+02	3	Hello test	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
22	2020-06-14 14:09:00.648471+02	2	Przykładowy post z turnieju	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
23	2020-06-14 14:09:07.966629+02	1	Był będzie jest Hutnik HKS	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
24	2020-06-17 18:30:33.393475+02	2	2009-Rowerzyści	2	[{"changed": {"fields": ["Photo"]}}]	12	1
25	2020-06-17 18:35:00.814807+02	2	Profil użytkownika Nowy22_555.	2	[]	15	1
26	2020-06-17 18:36:18.708899+02	2	Profil użytkownika Nowy22_555.	2	[{"changed": {"fields": ["Photo"]}}]	15	1
27	2020-06-17 23:12:34.800291+02	9	9	3		14	1
28	2020-06-17 23:12:54.703736+02	8	8	3		14	1
29	2020-06-22 09:32:39.080264+02	10	Jghj hhuu	3		11	1
30	2020-06-22 09:32:39.124908+02	9	Jhhhjm jhhhj	3		11	1
31	2020-06-22 09:32:39.127953+02	8	asdasc swawd wwq d dwq dwqd qw	3		11	1
32	2020-06-22 09:32:39.130773+02	7	Test postow	3		11	1
33	2020-06-22 09:32:39.133047+02	6	Test postow	3		11	1
34	2020-06-22 09:32:39.135577+02	5	wdd djwnjdj n jdjdwjwj djwdj jw djw jwjd j jdjwdj jw jwj jwdjjd	3		11	1
35	2020-06-22 09:32:39.13824+02	4	Hello wdwd dwd wd	3		11	1
36	2020-06-22 09:32:39.140536+02	3	Hello test	3		11	1
37	2020-06-22 09:32:39.142837+02	2	Przykładowy post z turnieju	3		11	1
38	2020-06-22 09:32:39.145106+02	1	Był będzie jest Hutnik HKS	3		11	1
39	2020-06-22 09:32:54.342886+02	2	2009-Rowerzyści	3		12	1
40	2020-06-22 09:32:54.345944+02	1	2009-Zielona	3		12	1
41	2020-06-22 09:33:08.423831+02	2	Profil użytkownika Nowy22_555.	3		15	1
42	2020-06-22 09:33:08.427862+02	8	Profil użytkownika Jan.	3		15	1
43	2020-06-22 09:34:03.065847+02	1	Profil użytkownika KennyDaktyl.	2	[{"changed": {"fields": ["Slug", "Czy jest czynnym zawodnikiem?", "Certyfikaty", "Numer telefonu", "Kariera"]}}]	15	1
44	2020-06-22 09:39:20.595223+02	2	2012	1	[{"added": {}}]	10	1
45	2020-06-22 09:39:53.974779+02	3	2012-Oriliki	1	[{"added": {}}]	12	1
46	2020-06-22 09:40:09.633062+02	11	Turniej Skawinka CUP	1	[{"added": {}}]	11	1
47	2020-06-22 09:41:01.273187+02	6	ewfwefew	3		4	1
48	2020-06-22 09:41:01.282087+02	8	Jan	3		4	1
49	2020-06-22 09:41:01.285142+02	7	JanGol	3		4	1
50	2020-06-22 09:41:01.287438+02	9	KennyDaktylwdwdw	3		4	1
51	2020-06-22 09:41:01.289397+02	2	Nowy22_555	3		4	1
52	2020-06-22 09:41:01.291245+02	3	OlafLubaszenko	3		4	1
53	2020-06-22 09:41:01.293522+02	5	qwdqwdqwdqwd	3		4	1
54	2020-06-22 09:41:01.295824+02	4	Stara	3		4	1
55	2020-06-22 10:02:21.091773+02	1	Profil użytkownika KennyDaktyl.	2	[]	15	1
56	2020-06-22 10:04:24.916039+02	1	Profil użytkownika KennyDaktyl.	2	[{"changed": {"fields": ["Tytu\\u0142 pracownika akademii"]}}]	15	1
57	2020-06-22 10:06:37.978023+02	1	2009	3		10	1
58	2020-06-22 10:17:42.032768+02	18	Pizzeria Don Roberto wspiera Hutnika!	2	[{"changed": {"fields": ["Publish"]}}]	11	1
59	2020-06-22 10:17:51.863577+02	17	Wirtualnej Futmal Ligi #WFL!	2	[{"changed": {"fields": ["Publish"]}}]	11	1
60	2020-06-22 10:23:12.884297+02	11	Turniej Skawinka CUP	2	[]	11	1
61	2020-06-22 10:25:59.81312+02	18	Pizzeria Don Roberto wspiera Hutnika!	2	[{"changed": {"fields": ["Publish"]}}]	11	1
62	2020-06-22 10:26:09.776303+02	17	Wirtualnej Futmal Ligi #WFL!	2	[{"changed": {"fields": ["Publish"]}}]	11	1
63	2020-06-22 10:26:21.299867+02	16	Akcja charytatywna dla Marysi	2	[{"changed": {"fields": ["Publish"]}}]	11	1
64	2020-06-22 10:26:26.969808+02	15	Wracamy do treningów	2	[{"changed": {"fields": ["Publish"]}}]	11	1
65	2020-06-22 10:26:33.494162+02	14	Trening indywidualnych umiejętności piłkarskich	2	[{"changed": {"fields": ["Publish"]}}]	11	1
66	2020-06-22 10:26:40.56844+02	13	Zapraszamy do drużyny skrzatów dzieci z rocznika 2014-2015	2	[{"changed": {"fields": ["Publish"]}}]	11	1
67	2020-06-22 10:26:47.067727+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Publish"]}}]	11	1
68	2020-06-22 10:26:52.529993+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Publish"]}}]	11	1
69	2020-06-22 10:28:48.749721+02	15	15	1	[{"added": {}}]	14	1
70	2020-06-22 10:31:15.401341+02	16	16	1	[{"added": {}}]	14	1
71	2020-06-22 10:37:53.141561+02	1	images/pizzeriadonrobertowspierapilkarzyakadmiihutnika.webp 3	1	[{"added": {}}]	16	1
72	2020-06-22 10:42:45.847973+02	2	images/logomiktelkrakowmichalpielak.webp 3	1	[{"added": {}}]	16	1
73	2020-06-22 12:05:48.566572+02	3	2012-Żaki	2	[{"changed": {"fields": ["Nazwa dru\\u017cyny"]}}]	12	1
74	2020-06-22 12:11:14.860845+02	3	2012-Żaki	2	[{"changed": {"fields": ["Sztab dru\\u017cyny"]}}]	12	1
75	2020-06-23 11:03:17.234283+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
76	2020-06-23 11:04:03.825512+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
77	2020-06-23 11:05:37.102686+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
78	2020-06-23 11:05:52.225528+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
79	2020-06-23 11:06:10.614487+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
80	2020-06-23 11:06:39.142906+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
81	2020-06-23 11:07:06.492416+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
82	2020-06-23 11:17:22.813894+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
83	2020-06-23 11:17:35.840108+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
84	2020-06-23 11:18:02.887446+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
85	2020-06-23 11:18:29.514093+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
86	2020-06-23 11:18:50.497199+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
87	2020-06-23 11:19:34.844791+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
88	2020-06-23 11:19:59.154828+02	12	Nabór dzieci do drużyny skrzatów	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
89	2020-06-23 11:22:41.437208+02	11	Turniej Skawinka CUP	2	[{"changed": {"fields": ["Tre\\u015b\\u0107 posta"]}}]	11	1
90	2020-06-25 09:42:59.374896+02	1	Pracownik	1	[{"added": {}}]	3	1
91	2020-06-25 09:45:02.516911+02	2	Piłkarze	1	[{"added": {}}]	3	1
92	2020-06-25 09:47:59.707611+02	1	Pracownicy	2	[{"changed": {"fields": ["Name"]}}]	3	1
93	2020-06-25 09:49:13.317455+02	1	KennyDaktyl	2	[{"changed": {"fields": ["Groups"]}}]	4	1
94	2020-06-25 09:49:22.182688+02	10	KontoTest	2	[{"changed": {"fields": ["Groups"]}}]	4	1
97	2020-06-25 10:22:06.086035+02	12	ewefewq	3		4	1
98	2020-06-25 10:22:06.09066+02	10	KontoTest	3		4	1
99	2020-06-25 10:22:06.093038+02	11	Test1	3		4	1
100	2020-06-25 11:48:32.838615+02	3	2012-Żaki	3		12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	thumbnail	kvstore
8	webp_converter	webpimage
9	page_ap	baseobjects
10	page_ap	yearbook
11	page_ap	post
12	page_ap	teams
13	page_ap	basebuildings
14	page_ap	images
15	page_ap	profile
16	page_ap	sponsors
17	page_ap	trainings
18	page_ap	file
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-05-31 15:16:34.386521+02
2	auth	0001_initial	2020-05-31 15:16:34.613866+02
3	admin	0001_initial	2020-05-31 15:16:34.833832+02
4	admin	0002_logentry_remove_auto_add	2020-05-31 15:16:34.871203+02
5	admin	0003_logentry_add_action_flag_choices	2020-05-31 15:16:34.885221+02
6	contenttypes	0002_remove_content_type_name	2020-05-31 15:16:34.928461+02
7	auth	0002_alter_permission_name_max_length	2020-05-31 15:16:34.939727+02
8	auth	0003_alter_user_email_max_length	2020-05-31 15:16:34.956451+02
9	auth	0004_alter_user_username_opts	2020-05-31 15:16:34.969847+02
10	auth	0005_alter_user_last_login_null	2020-05-31 15:16:34.983078+02
11	auth	0006_require_contenttypes_0002	2020-05-31 15:16:34.986528+02
12	auth	0007_alter_validators_add_error_messages	2020-05-31 15:16:34.999758+02
13	auth	0008_alter_user_username_max_length	2020-05-31 15:16:35.023242+02
14	auth	0009_alter_user_last_name_max_length	2020-05-31 15:16:35.051391+02
15	auth	0010_alter_group_name_max_length	2020-05-31 15:16:35.065929+02
16	auth	0011_update_proxy_permissions	2020-05-31 15:16:35.088756+02
17	sessions	0001_initial	2020-05-31 15:16:35.112967+02
18	thumbnail	0001_initial	2020-05-31 15:16:35.148965+02
19	webp_converter	0001_initial	2020-05-31 15:16:35.185018+02
20	webp_converter	0002_auto_20191202_1616	2020-05-31 15:16:35.205493+02
21	webp_converter	0003_auto_20191202_1621	2020-05-31 15:16:35.214341+02
22	page_ap	0001_initial	2020-05-31 15:17:45.968577+02
23	page_ap	0002_auto_20200614_1402	2020-06-14 14:03:05.869512+02
24	page_ap	0003_auto_20200616_0937	2020-06-16 09:37:46.453307+02
25	page_ap	0004_auto_20200622_1210	2020-06-22 12:10:14.298334+02
26	page_ap	0005_auto_20200624_1559	2020-06-24 16:00:59.465229+02
27	page_ap	0006_file	2020-06-24 16:01:00.128269+02
28	page_ap	0007_file_email	2020-06-25 09:22:47.225859+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r1an81xl73e5rzi3b9y9ebrbh400bfmi	NTRkMzJlY2U3NzI1MDRkZDNhMDhlZjdmNmQwMTc3OWI1NDE3MjA1NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDMxZGQzZTRiNmVlYWY2OTM4OTcwNTFjNzVlNTgzYmNlODdlOTEwIn0=	2020-06-14 16:32:17.971329+02
a5pff6qr0c87mgavacxwhkqkdpn0745b	OWY3NjU0MDU4ZmQ4ZGYzZjZiNjVkMWFhZWJiY2NkOTM4OTExYzQ5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzUyYTBkOGU1NDI1MmRkNjI2NWVmYTY1NTYyMjU2OWE4NWFlZThmIn0=	2020-07-09 10:47:55.952546+02
r8bhnuuit0k1ijv8m6586tr318wzyxe6	YjI1ZTU5MjM3NDkzZDBkNDBlOTYyN2E5MWU1ZGRlZDUyYzJiZTYxYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmFkYTk5Y2E0NmI0NGY0MTcwOTVmMzlkZmI3ZDRmZDcwNzZiNTIzIn0=	2020-06-14 17:16:21.182185+02
xzecmbcae2aqkfmhln3uoqz0uvwgrf30	OWY3NjU0MDU4ZmQ4ZGYzZjZiNjVkMWFhZWJiY2NkOTM4OTExYzQ5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzUyYTBkOGU1NDI1MmRkNjI2NWVmYTY1NTYyMjU2OWE4NWFlZThmIn0=	2020-08-13 15:24:37.237169+02
3iuhpgk55zqmqf42kerxsulou540l6ri	OWY3NjU0MDU4ZmQ4ZGYzZjZiNjVkMWFhZWJiY2NkOTM4OTExYzQ5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzUyYTBkOGU1NDI1MmRkNjI2NWVmYTY1NTYyMjU2OWE4NWFlZThmIn0=	2020-10-29 13:56:35.489997+01
q0dvw4jorcj6e9dpx7v21kfmj97i3hpy	YjI1ZTU5MjM3NDkzZDBkNDBlOTYyN2E5MWU1ZGRlZDUyYzJiZTYxYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmFkYTk5Y2E0NmI0NGY0MTcwOTVmMzlkZmI3ZDRmZDcwNzZiNTIzIn0=	2020-07-05 16:59:59.280661+02
icph3gpel0a911x0xlpwcbihw1ahdzxn	OWY3NjU0MDU4ZmQ4ZGYzZjZiNjVkMWFhZWJiY2NkOTM4OTExYzQ5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzUyYTBkOGU1NDI1MmRkNjI2NWVmYTY1NTYyMjU2OWE4NWFlZThmIn0=	2020-11-22 09:24:10.616431+01
596h25p3dle4vb3f3rszhi7t9cax9fua	M2Q3Njg1NTQwZTEwMmViNDY4YTJiZDNhYmZhMjQ1MzQ2NTAwZGQ5Njp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzZkZjlhZmYzOTE5NjAyM2Y1ZjEyNDE3MjU3ZTM1OWIzYzY2MTEyIn0=	2020-06-15 11:53:55.649981+02
\.


--
-- Data for Name: page_ap_basebuildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_basebuildings (id, name, size, photo, status, slug) FROM stdin;
1	Stadion Hutnik Kraków	Pojemność 3000 miejsc	buildings/2020/05/31/unnamed_1.webp	5	stadion-hutnik-krakow
\.


--
-- Data for Name: page_ap_baseobjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_baseobjects (id, name, size, photo, status, slug, main_object_id) FROM stdin;
\.


--
-- Data for Name: page_ap_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_file (id, file, title, email) FROM stdin;
1	files/197c30a360.pdf	Przykładowy plik do pobrania	f
2	files/e0ef85d2e1.png	Załącznik email	t
3	files/5a83b637c4.jpg	Załącznik email	t
4	files/15724b6afd.jpg	Załącznik email	t
5	files/69299e53d9.png	Załącznik email	t
\.


--
-- Data for Name: page_ap_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_images (id, image, no_image, building_id, post_id, team_id) FROM stdin;
1	images/logo_hks.webp	f	\N	\N	\N
2	images/flaga_akademi.webp	f	\N	\N	\N
15	images/stadionhutnikakrakow.webp	f	1	\N	\N
16	images/widokzlotuptakanastadionhutnikakrakow.webp	f	1	\N	\N
17	images/FB_IMG_1601888870790.webp	f	\N	20	\N
18	images/FB_IMG_1601888874435.webp	f	\N	20	\N
19	images/FB_IMG_1601888880424.webp	f	\N	20	\N
20	images/FB_IMG_1602766555383.webp	f	\N	23	\N
21	images/FB_IMG_1602766559740.webp	f	\N	23	\N
22	images/FB_IMG_1602766566322.webp	f	\N	23	\N
23	images/FB_IMG_1602766569294.webp	f	\N	23	\N
24	images/FB_IMG_1602773922012.webp	f	\N	24	\N
25	images/FB_IMG_1602773916152.webp	f	\N	24	\N
26	images/FB_IMG_1602773913924.webp	f	\N	24	\N
27	images/FB_IMG_1604823833971.webp	f	\N	26	\N
\.


--
-- Data for Name: page_ap_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_post (id, title, photo, slug, body, publish, created, updated, status, author_id, team_id) FROM stdin;
17	Wirtualnej Futmal Ligi #WFL!	images/posts/wirtualnafutmalligazpilkarzamiakademiihutnika_OAM7BIk_hUXTgdl.webp	wirtualnej-futmal-ligi-wfl	Ruszamy z 4.dniem Wirtualnej Futmal Ligi #WFL! Tradycyjnie już odnajdźcie swój mecz w komentarzach i lajkujcie! (10 kciuków to 1 gol dla gospodarzy, 10 serduszek to 1 gol dla gości). Bawimy się do g.21:00!\r\n---\r\nPS. Bardzo prosimy o lajkowanie komentarzy z meczami, a nie tworzenie dodatkowych komentarzy. Dla zachowania porządku i czytelności komentarzy z meczami, wszystkie tworzone przez Was będą usuwane!\r\n--\r\nWkrótce po zakończeniu meczów, publikujemy kolejne posty z podsumowaniami kolejek i tam jak najbardziej Wasze komentarze będą mile widziane!\r\n---	2020-06-22 10:26:07+02	2020-06-22 10:09:37.088337+02	2020-06-22 10:26:09.770949+02	draft	1	\N
19	Szkolenie wewnętrzne AP Hutnik Kraków	images/posts/FB_IMG_1601888581240.webp	szkolenie-wewnetrzne-ap-hutnik-krakow	W dniu dzisiejszym tj. 20.09.2020r o godzinie 17:30 w sali konferencyjnej na Hali Suche Stawy odbędzie się szkolenie wewnętrzne, w którym to udział weźmie zarówno sztab szkoleniowy Akademii Piłkarskiej Hutnik Kraków, jak i trenerzy pracujący na co dzień w naszych klubach partnerskich. :)\r\n\r\nSzkolenia wewnętrzne organizowane pod egidą naszej Akademii będą odbywały się cyklicznie. Ideą tejże inicjatywy jest potrzeba nieustannego rozwoju, zdobywania wiedzy, nowych doświadczeń dotyczących procesu szkoleniowego dzieci i młodzieży.	2020-10-05 11:03:13.458903+02	2020-10-05 11:03:14.53312+02	2020-10-05 11:03:14.533141+02	draft	1	\N
20	Certyfikat PZPN Łączy nas piłka	images/posts/FB_IMG_1601888867552.webp	certyfikat-pzpn-aczy-nas-pika	Z dumą informujemy, że w wyniku dzisiejszej kontroli certyfikacyjnej PZPN Łączy nas piłka szkółka Hutnika Kraków otrzymała 96,33 pkt na 100 możliwych. Dziękujemy wszystkim trenerom, pracownikom klubu, zawodnikom, ich rodzicom, działaczom za pracę jaka złożyła się na ten doprawdy znakomity rezultat. Dziękujemy Zarząd Infrastruktury Sportowej w Krakowie za zaufanie i pomoc w przedsięwzięciach poczynionych już na Suchych Stawach. Dla nas to kolejny etap w drodze do chwały piłkarskiej Dumy Nowej Huty. Pracujemy dalej z myślą o rozwoju naszych wychowanków.	2020-10-05 11:09:28.66957+02	2020-10-05 11:09:28.892257+02	2020-10-05 11:09:28.89228+02	draft	1	\N
18	Pizzeria Don Roberto wspiera Hutnika!	images/posts/pizzeriadonrobertowspierapilkarzyakadmiihutnika_0JDzXr1_NcMt5fo.webp	pizzeria-don-roberto-wspiera-hutnika	Pizzeria Don Roberto wspiera Hutnika!\r\nDrodzy kibice! Jeden z naszych niezawodnych sponsorów pizzeria Don Roberto postanowiła dodatkowo wesprzeć nasz klub w tym trudnym okresie.\r\nW najbliższą środę 25 marca 20 % całego dziennego obrotu firmy (godziny otwarcia 12.00 - 22.30) z bezpośrednich (nie przez pyszne.pl) zamówień telefonicznych (tel. 539 224 466) i odbiorów osobistych (ul. Szybka 27) zostaną przekazane Hutnikowi!\r\nSerdecznie dziękujemy za ten piękny gest.\r\nW środę pamiętajcie o HKS-ie i o chłopakach z Don Roberto! Udostępnijcie.\r\nCHZR.\r\nwww.donrobertopizza.pl/	2020-06-22 10:25:58+02	2020-06-22 10:11:16.007128+02	2020-06-22 10:25:59.80993+02	draft	1	\N
16	Akcja charytatywna dla Marysi	images/posts/podziekowaniadlaakademiipilkarskiejhutnikakrakow_frfuIce.webp	akcja-charytatywna-dla-marysi	Otrzymaliśmy miłe podziękowania za uczestnictwo w akcji charytatywnej dla Marysi. My również serdecznie dziękujemy naszym kibicom i po prostu ludziom dobrej woli i wielkiego serca za włączenie się w tą akcję.	2020-06-22 10:26:19+02	2020-06-22 10:05:55.796994+02	2020-06-22 10:26:21.296267+02	draft	1	\N
15	Wracamy do treningów	images/posts/pilkarzeakadamiihutnikakrakowwracajadotreningow_2qrfjh5.webp	wracamy-do-treningow	Już wkrótce wracamy do treningów!\r\nZgodnie z dzisiejszą konferencją prasową Premiera Mateusza Morawieckiego od 4 maja zostaną otwarte stadiony, boiska sportowe i orliki. Będzie pozwolenie na odbywanie się treningów w grupach do 6 osób. Oczywiście trzeba będzie zachować zasady bezpieczeństwa sanitarnego, ale podczas treningów nie trzeba będzie używać maseczek. Wkrótce podamy więcej informacji.	2020-06-22 10:26:25+02	2020-06-22 09:57:17.393088+02	2020-06-22 10:26:26.963651+02	draft	1	\N
14	Trening indywidualnych umiejętności piłkarskich	images/posts/treningiindywidualneumiejetnoscipilkarskichwakademiipilkarskiejhutnikakrak_igj3SD5.webp	trening-indywidualnych-umiejetnosci-pikarskich	Ruszają treningi indywidualne z trenerem Maciejem Papieżem. Zapraszamy!	2020-06-22 10:26:32+02	2020-06-22 09:50:50.485605+02	2020-06-22 10:26:33.489041+02	draft	1	\N
13	Zapraszamy do drużyny skrzatów dzieci z rocznika 2014-2015	images/posts/nowynabordodruzynyskrzatowakademiipilkarskiejhutnikakrakow_MMRhddp.webp	zapraszamy-do-druzyny-skrzatow-dzieci-z-rocznika-2014-2015	Zapraszamy dzieciaki z rocznika 2014/2015 do naszej najmłodszej drużyny Skrzatów!\r\nJeśli chcesz, aby Twoje dziecko:\r\n- rozpoczęło przygodę z piłką nożną\r\n- poznało nowych przyjaciół\r\n- świetnie się bawiło\r\n- rozwinęło się społecznie\r\n- grało mecze i miało z tego dużo radości\r\nTo nasza drużyna jest dla niego!\r\n\r\nOpieka dwóch trenerów, zajęcia prowadzone metodą opowieści ruchowej, gier i zabaw z piłką i bez piłki, doskonale warunki na boisku lub na hali.\r\nPrzyjdź, zobacz, zostań z nami !!!\r\nTel. Kontaktowy\r\n506 753 234	2020-06-22 10:26:39+02	2020-06-22 09:47:23.735932+02	2020-06-22 10:26:40.563797+02	draft	1	\N
21	Wojciech Włodarczyk nowym dietetykiem  w Akademii Piłkarskiej Hutnik Kraków	images/posts/FB_IMG_1602015419411.webp	wojciech-wodarczyk-nowym-dietetykiem-w-akademii-pikarskiej-hutnik-krakow	Wojciech Włodarczyk nowym dietetykiem \r\nw Akademii Piłkarskiej Hutnik Kraków! \r\n\r\nW dniu dzisiejszym nasza Akademia rozpoczyna współpracę na stanowisku Dietetyka Akademii z Wojciechem Włodarczykiem, który to będzie dbał \r\no stworzenie efektywnego środowiska \r\nw procesie prawidłowego odżywiania, nawodnienia naszych zawodników. 🥣💧\r\n\r\nWspółpracował on z wieloma klubami, a także \r\nzawodnikami grającymi na poziomie Reprezentacji Polski i Ekstraklasy, dlatego też jesteśmy bardzo zadowoleni z możliwości współpracy, która niewątpliwie pozytywnie wpłynie na rozwój naszych podopiecznych. \r\nO wszystkich bieżących kwestiach związanych z funkcjonowaniem Działu Dietetyki będziemy informowali na bieżąco. Już niebawem rozpoczynamy cykl spotkań dla zawodników i ich rodziców dotyczących żywienia i diety w życiu sportowca. \r\n\r\nW przypadku zainteresowania podjęciem współpracy przedstawiamy poniżej dane kontaktowe: \r\nWojciech Włodarczyk\r\n📞Tel. 781280746 \r\n✉️Adres e-mail: w.wlodarczyk@nh2010.pl	2020-10-06 22:17:29.79938+02	2020-10-06 22:17:30.632827+02	2020-10-06 22:17:30.632843+02	draft	1	\N
12	Nabór dzieci do drużyny skrzatów	images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q_wxPGunm_PFqcfHL_x5m914s.webp	nabor-dzieci-do-druzyny-skrzatow	ZAPRASZAMY NAJMŁODSZYCH ADEPTÓW PIŁKI NOŻNEJ!\r\nDOŁĄCZCIE DO HUTNICZEJ RODZINY.	2020-06-22 10:26:45+02	2020-06-22 09:45:04.122738+02	2020-06-23 11:19:59.149886+02	draft	1	\N
22	Współpraca Akademii Piłkarskiej Hutnika z profesjonalnym dietetykiem	images/posts/FB_IMG_1602190851495.webp	wspopraca-akademii-pikarskiej-hutnika-z-profesjonalnym-dietetykiem	#WSPÓŁPRACA 🔥⚽️👏✅\r\n\r\nNiezwykle istotne w procesie szkoleniowym młodych adeptów futbolu jest prawidłowe odżywianie i nawodnienie. W trosce o jak najbardziej efektywny rozwój naszych podopiecznych staramy się nieustannie tworzyć w tej materii jeszcze lepsze środowisko w Akademii Piłkarskiej Hutnik Kraków.🔥⚽️\r\n\r\nDlatego też nawiązaliśmy współpracę z dietetykiem, który to obejmie opieką specjalistyczną cały sztab szkoleniowy, wszystkich zawodników i ich rodziców. 🔥⚽️\r\n\r\nW dniu dzisiejszym przedstawiamy Państwu firmę – Dobra Kaloria, której to jakościowe produkty (przede wszystkim batony) wykorzystywali będziemy w naszej Akademii jako idealną formę przekąski choćby po treningu, czy też meczu. 🔥⚽️\r\n\r\nGorąco zachęcamy Państwa do skorzystania z usług tej firmy, której oferowane produkty są niezwykle wartościowe, odżywcze i charakteryzują się najwyższą jakością.🔥⚽️\r\n\r\nhttps://dobrakaloria.pl/	2020-10-08 23:03:41.589988+02	2020-10-08 23:03:43.35406+02	2020-10-08 23:03:43.354085+02	draft	1	\N
23	Pierwsze z wielu spotkań w ramach cyklu warsztatów dotyczących prawidłowości w odżywianiu	images/posts/FB_IMG_1602766562741.webp	pierwsze-z-wielu-spotkan-w-ramach-cyklu-warsztatow-dotyczacych-prawidowosci-w-odzywianiu	Za nami pierwsze z wielu spotkań w ramach cyklu warsztatów dotyczących prawidłowości w odżywianiu i nawadnianiu dla sportowców, prowadzonych przez specjalistę naszej Akademii - Wojciecha Włodarczyka. Celem spotkań jest jak najlepsze i najgłębsze poznanie własnego organizmu. ⚽️⚽️\r\n\r\nW ciągu ostatnich trzech dni przeprowadzono rozmowy z grupami szkoleniowymi: A1, B1, C1A, C1B oraz B2.\r\n\r\nGłównym tematem pierwszego warsztatu była podstawa organizmu, czyli białko - jego zalety, funkcje, wpływ na organizm, dzienne zapotrzebowanie oraz zagrożenia wynikające z niedoboru. Pewna część wykładu została przeznaczona na równie ważną kwestię, czyli nawodnienie organizmu. Czynny sportowiec, który na codzień odbywa treningi powinien pić minimum 3 litry wody każdego dnia! 💦💦 \r\nNie zabrakło również sprawdzenia wiedzy zawodników odnośnie wartości odżywczych, które możemy znaleźć w poszczególnych produktach, a także pytań dotyczących ich diety, oraz przedyskutowanie ewentualnych braków i błędów w aktualnym odżywianiu młodzieży. 🍎🍌🥕\r\n\r\nCałe spotkanie przebiegło w luźnej, przyjaznej i zabawnej atmosferze, pełnej interakcji prowadzącego z zawodnikami. ⚽️	2020-10-15 14:57:33.932223+02	2020-10-15 14:57:34.742157+02	2020-10-15 14:57:34.742177+02	draft	1	\N
24	Turniej Copalnia Talentów dla zawodników urodzonych w 2010 roku	images/posts/FB_IMG_1602773918717.webp	turniej-copalnia-talentow-dla-zawodnikow-urodzonych-w-2010-roku	W dniach 10-11.10.2020 na obiektach AWF w Krakowie drużyna prowadzona przez trenera Dawida Będkowskiego uczestniczyła w turnieju Copalnia Talentów dla zawodników urodzonych w 2010 roku i młodszych. W trakcie dwóch dni nasza drużyna zagrała 10 meczów (240 minut gry). Mieliśmy okazje zmierzyć się z takimi zespołami jak: Polonia Warszawa, AP Reissa Poznań, Radomiak Radom czy FC Wrocław Academy (zwycięzca turnieju, komplet punktów).\r\n\r\nTurniejowi towarzyszyła dobra atmosfera, sprawił on mnóstwo radości naszym zawodnikom. Jesteśmy pewni, że możliwość gry z drużynami prezentującymi tak wysoki poziom, pozytywnie zaprocentuje w niedalekiej przyszłości. ⚽️👏	2020-10-15 16:58:57.162534+02	2020-10-15 16:58:57.671223+02	2020-10-15 16:58:57.67124+02	draft	1	\N
25	Oskarżony o otyłość tłuszcz.....	images/posts/FB_IMG_1603747069338.webp	oskarzony-o-otyosc-tuszcz	Oskarżony o otyłość tłuszcz........\r\n\r\nDziś podczas kursu odżywiania on-line dla rodziców o tym wspominałem :) \r\n\r\nOd wielu lat piętnowane jest przekonanie że za całe zło świata w sprawach naszego zdrowia, zdrowia naszych serc, układów krwionośnych , za otyłość wini się tłuszcz. Stąd przekonanie, żeby schudnąć trzeba wyeliminować tłuszcze.\r\n\r\nJeśli ktoś mnie zna, wie dokładnie ze mam wprost przeciwne przekonanie o tym i w praktyce przy najlepszych rezultatach tego tłuszczu nie należy się bać, a właściwie to trzeba się z nim ZAPRZYJAŹNIĆ.💚\r\n\r\nDoskonale sprawdzam się w roli adwokata tłuszczów nawet nasyconych, bo większość z Was wie ze oliwa z oliwek, olej lniany, awokado orzechy są źródłem zdrowych kwasów tłuszczowych.\r\n\r\nDlaczego?\r\n\r\nPonieważ nie istnieją żadne dowody na to że głównym winowajcom złego cholesterolu we krwi jest właśnie tłuszcz zwierzęcy.\r\n\r\nMożna także oprzeć się na doskonale funkcjonującymi dziś prymitywnymi społecznościami bo u nich również dziwnym trafem nie występują choroby utożsamiane z działaniem tłuszczów. Wśród mieszkańców wysp Australii i Oceanii u których 30-60% przyjmowanych kalorii pochodzi właśnie z tłuszczów nasyconych pod postacią oleju kokosowego i w zasadzie nie występują choroby układu krążenia! \r\n\r\nOd niepamiętnych przez nas czasów uganialiśmy się za dziczyzną, prowadziliśmy łowczy tryb życia, i głównym źródłem naszego pożywienia było właśnie mięso. Powiedzcie mi dlaczego zatem coś co jest naturalnie wpisane w nasze menu ma nam szkodzić ? \r\nNo chyba że ! Mamy do czynienia z jakością mięsa jakie często znajdujemy w marketach, karmione paszami kukurydzianymi, sterydami, wtedy wychodząc z definicji jesteśmy tym co jemy, dokładnie to otrzymuje nasz organizm ! Sterydy, antybiotyki i modyfikowaną kukurydzę którą karmią łososie, krowy świnie kurczaki, bo generalnie to co najczęściej jest na naszych stołach.\r\n\r\nWięc nie kojarzcie wieprzowiny z czymś złym, jeżeli jest ze sprawdzonego źródła i rośnie zgodnie z tempem jak chciała Matka Natura.\r\n\r\nTemat tłuszczy zawsze był kontrowersyjny, ale tak samo jak jajek, że też powinny „dostać dożywocie” za szkody wyrządzone naszemu cholesterolowi. MIT, dawno obalony, a kierowany niestety tylko panującą polityką i tym co kto z tego będzie miał. A najwięcej mają koncerny farmaceutyczne. Jednak ani media, ani urzędnicy zajmujący się zdrowiem publicznym nie powiedzą wam tego, że tłuszcz tłuszczowi nierówny, a kluczowym elementem jest sposób jego powstawania. Musicie zrozumieć jedno, że tłuszcze nasycone wrzucono kiedyś do jednego worka, i teraz trudno jest zrozumieć komuś na czym polega różnica\r\n\r\nIstotny jest sposób ich tworzenia, niektóre wyciskane z owoców np. z pestek winogron, z orzechów, z lnu. Ale tworzone w sposób syntetyczny, robiony jest poprzez przeprowadzania w stan nasycenia w procesie uwodornienia. Uwodornienie to zmienianie struktury olejów roślinnych poprzez dodawanie atomów wodoru przy jednoczesnym podgrzewaniu. Są to wszystkie tłuszcze trans która właściwie są substancją toksyczną dla naszego organizmu. I tym sposobem produkty je zawarte stoją miesiącami pięknie zdobiąc półki sklepowe i nikt nie zwraca uwagi na to, że TO NATURALNE nie jest!!!\r\n\r\nDlatego jeżeli miałbym cokolwiek rekomendować w całym tym wyścigu szczurów, to najbezpieczniej opierać swoje wypieki, czy do smażenia czy do robienia czekolady domowej OLEJ KOKOSOWY. Problem ze smażeniem jest taki że nawet rozpowszechniony tłuszcz rzepakowy posiada frakcje nienasycone które pod wpływem temperatury utleniają się zwiększając później ilość wolnych rodników które jak wiadomo odpowiadają za rozwój m.in nowotworów.\r\n\r\nDodatkowo muszę wspomnieć, że żadna uprawa rzepaku w Polsce nie jest do końca czysta, dlatego najbezpieczniej do smażenia użyć nawet boczek, czy smalec.\r\n\r\nTłuszcz kokosowy się nie utlenia. Dlatego jesteśmy w stanie usmażyć na nim kilkukrotnie frytki (czego nie polecam oczywiście🙆‍♂️🙅‍♂️). To dzięki temu że 97% związków to tłuszcze nasycone.   Powstające w naturalny sposób tłuszcze nasycone z oleju kokosowego są zdrowe, gdyż:\r\n\r\n-mają dobroczynny wpływ na serce\r\n\r\n-sprzyjają zrzuceniu zbędnych kilogramów\r\n\r\n-wspomagają układ odpornościowy\r\n\r\n-wspomagają zdrową przemianę materii\r\n\r\n-są doskonałym źródłem energii\r\n\r\n-zapewniają zdrowy i młody wygląd skóry\r\n\r\n-regulują działanie tarczycy\r\n\r\nDzieje się to dzięki sekretnemu składnikowi, jakim jest kwas laurynowy. Połowę tłuszczów w oleju kokosowym stanowi ten rzadko spotykany kwas, o silnych właściwościach wirusowych, bakterio i pierwotniakobójczych. Skutecznie walczy z wirusem opryszczki, grypy, odrą, bakteriami chorobotwórczymi, pierwotniakami takimi jak ogoniastek jelitowy.\r\n\r\nBy zbyt nie rozciągać tematu, ogólnie olej kokosowy ma dobroczynny wpływ na zdrowie kobiet w ciąży, karmiących matek, osób starszych i o wrażliwym układzie pokarmowym, osób uprawiających sport (nawet sporadycznie), a także tych, którzy chcą zwyczajnie zadbać o siebie i swoje zdrowie. Zachęcam Was, by świadomie podejmować decyzje odnośnie wyboru tłuszczy zarówno do bezpośredniego spożycia jak i środka do przyrządzania innych potraw. 😃	2020-10-26 22:18:37.627959+01	2020-10-26 22:18:38.372305+01	2020-10-26 22:18:38.372364+01	draft	1	\N
26	Awans Młodzików Hutnika do I ligi okręgowej!	images/posts/FB_IMG_1604823831765.webp	awans-modzikow-hutnika-do-i-ligi-okregowej	Mamy awans Młodzików Hutnika do I ligi okręgowej! Podopieczni trenera Dobosza zwyciężyli dzisiaj aż 10-0 z zespołem Milenium Skawina! \r\n\r\nHUTNIK II KRAKÓW 10-0 Milenium Skawina\r\n\r\nBramki: 3x Kuchmacz, 2x Jankowski, Styczeń, Skiba, Sroka, Jedynak, Dudzic\r\n\r\nGratulujemy i życzymy powodzenia w I lidze! 👏🔝	2020-11-08 09:24:55.63606+01	2020-11-08 09:24:57.06555+01	2020-11-08 09:24:57.065573+01	draft	1	\N
\.


--
-- Data for Name: page_ap_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_profile (id, role, date_of_birth, photo, slug, is_player, is_pupil, from_team, date_of_start, team_name, "position", employe_position, certyficate, phone_number, text, team_id, user_id, is_activated, rodo) FROM stdin;
1	1	1981-07-02	users/2020/06/22/IMG_20200616_180340_o15QA4D_aI7oZmm.webp	micha-p	f	\N	\N	\N	Sparta Nowa Huta	\N	7	\N	5060029980	Administracja strony WWW	\N	1	f	f
\.


--
-- Data for Name: page_ap_sponsors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_sponsors (id, image, role, url) FROM stdin;
1	images/pizzeriadonrobertowspierapilkarzyakadmiihutnika.webp	3	http://www.donrobertopizza.pl/
2	images/logomiktelkrakowmichalpielak.webp	3	https://www.miktel.krakow.pl/
\.


--
-- Data for Name: page_ap_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_teams (id, name, photo, archive, slug, coach_id, yearbook_id) FROM stdin;
\.


--
-- Data for Name: page_ap_teams_team_persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_teams_team_persons (id, teams_id, profile_id) FROM stdin;
\.


--
-- Data for Name: page_ap_trainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_trainings (id, date_start, date_end, day_time, place_id, team_id) FROM stdin;
\.


--
-- Data for Name: page_ap_yearbook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_ap_yearbook (id, title, archive, slug) FROM stdin;
2	2012	f	2012
3	2005	f	2005
4	2006	f	2006
5	2007	f	2007
6	2008	f	2008
7	2009	f	2009
8	2010	f	2010
9	2011	f	2011
10	2013	f	2013
11	2014	f	2014
12	2015	f	2015
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||5d9cb913cc88a7379f75c4256d07a69f	{"name": "images/posts/Zrzut_ekranu_z_2020-05-27_07-05-27_uLWHvbq.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||ed6239a2b3ede762068f19ed0e8bfeb8	{"name": "cache/16/e7/16e7ea5439323a30e5ca5128f1c9ff2e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 420]}
sorl-thumbnail||image||7ea2c8a97276306b79ff8a0cfd1ccaeb	{"name": "https://image.freepik.com/free-vector/luxury-letter-e-logo-design_1017-8903.jpg", "storage": "sorl.thumbnail.images.UrlStorage", "size": [626, 626]}
sorl-thumbnail||image||b993bc6af177c1b17259a397654356a8	{"name": "cache/9f/30/9f308269236f2b7eee7fc4a138b000f4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 100]}
sorl-thumbnail||image||12d2b3ce6d013548d92fe692869ab753	{"name": "cache/a9/08/a908a06d9dfb599178cbd720e97ccc74.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||thumbnails||7ea2c8a97276306b79ff8a0cfd1ccaeb	["b993bc6af177c1b17259a397654356a8", "12d2b3ce6d013548d92fe692869ab753"]
sorl-thumbnail||image||f41293cb8c5ea4124f914f81ac81b358	{"name": "cache/17/91/17911edb56b83f4d0cca98557c73e671.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||image||a113f4b4fac07b08c1b4e6711b79f987	{"name": "users/2020/05/31/15909367266041636795184551849743_4VhNsIo.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||036fc4908d722868f453c1cb86d6d0b3	{"name": "users/2020/05/31/21c111b5e0a06af315fd3d29798e6670.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||f7a7bc55a02558e9401b0904dd48605a	{"name": "cache/5d/78/5d7879be887e4026b39d36f48d88e268.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [4000, 4000]}
sorl-thumbnail||thumbnails||036fc4908d722868f453c1cb86d6d0b3	["f7a7bc55a02558e9401b0904dd48605a"]
sorl-thumbnail||image||ceff65feabf58f7da94dceac2528bdd8	{"name": "users/2020/05/31/21c111b5e0a06af315fd3d29798e6670_gw1jeeZ.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||52ad5ee97a5fa1ba4b90c307208bcc3e	{"name": "cache/52/1f/521f4e72ab15be250da5de6a096047c3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||26e6c2c0623e388ab6c6b44e5e401732	{"name": "images/logo_hks.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||2d8c6bf396def0d983360f097b694b44	{"name": "cache/51/bf/51bffc04996dad3c5363f678b11a7761.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||6377cdc78906be8b15bfb6475ccc4cea	{"name": "cache/98/11/9811428ea30933afe1b612d1303d8764.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||26e6c2c0623e388ab6c6b44e5e401732	["2d8c6bf396def0d983360f097b694b44", "6377cdc78906be8b15bfb6475ccc4cea"]
sorl-thumbnail||image||57d7edd3f564988f9fde1930158021ce	{"name": "images/flaga_akademi.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 301]}
sorl-thumbnail||image||a089c5919813041c5209b411e4ffcfe2	{"name": "cache/05/a1/05a1c91659dedc54159dfff08bfc805c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 301]}
sorl-thumbnail||image||4412ed937c7995aaf72dcee975e2bda6	{"name": "cache/b3/4c/b34c12944878015fee248f02bf3723bc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||871bddafbf1d86d63f3fe94229705bce	{"name": "cache/90/46/904634593d1a34e32e4ec2104b9baa04.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||87206b3f14ddf683e07a7b829579fb54	{"name": "users/2020/05/31/21c111b5e0a06af315fd3d29798e6670_mTTETpX.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||496780972a81f78abd24ce9c709df772	{"name": "cache/fe/ba/febaddcac2583c61370bc427caeaa6b8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||a4ee82ca3002af4e44dbe22080bb8e42	{"name": "users/2020/05/31/21c111b5e0a06af315fd3d29798e6670_nbYlAse.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||4bb69e871811be7009135891daf6f3f7	{"name": "cache/89/72/8972764e83139cc59848955e40b0fe6e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||b8edf6b27aa4cc084a92c9594f244639	{"name": "cache/78/e7/78e73c49d20e7f81dc177bba372b3a80.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||20201a6a70031353b3b436a5d3d8048a	{"name": "cache/65/ab/65abe7abe22d70bc5b3508bf6a076461.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||8a95ee51b540d06681f18b0ff60f7d6c	{"name": "cache/5a/86/5a86fe7af2704d6d3878c9fc82468294.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||thumbnails||57d7edd3f564988f9fde1930158021ce	["5c301f61d92fb39513385cfdca5b4470", "a089c5919813041c5209b411e4ffcfe2"]
sorl-thumbnail||image||cddd6e14e5d546f102fa4eaaeaf34f7d	{"name": "cache/4d/3d/4d3dc2b196c9b473c4a5e3a9c54dfd8b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 960]}
sorl-thumbnail||thumbnails||ceff65feabf58f7da94dceac2528bdd8	["4412ed937c7995aaf72dcee975e2bda6", "52ad5ee97a5fa1ba4b90c307208bcc3e", "20201a6a70031353b3b436a5d3d8048a", "cddd6e14e5d546f102fa4eaaeaf34f7d"]
sorl-thumbnail||image||1d7eeb11849816ef195e2acf4dc1bd8b	{"name": "cache/3f/d1/3fd1faa3abba0eeeae3abb6a2fc47ce6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 960]}
sorl-thumbnail||image||9360e30f573524d369addcf0f5030607	{"name": "cache/51/f1/51f11ae32e760ae348cf35d9af16edcf.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||thumbnails||87206b3f14ddf683e07a7b829579fb54	["94f8010edf4750159901bbb35bd141f9", "871bddafbf1d86d63f3fe94229705bce", "13137d11d78cd04b6ffab1055fdde337", "496780972a81f78abd24ce9c709df772", "1d7eeb11849816ef195e2acf4dc1bd8b", "a54a84656a4d13705ca51374800b1da5"]
sorl-thumbnail||thumbnails||a4ee82ca3002af4e44dbe22080bb8e42	["4bb69e871811be7009135891daf6f3f7", "a5c121f4e02cf3aedf2e758917bfa8ff", "582fe51207e1b3c53a82ba2a6fc7a1ca"]
sorl-thumbnail||image||d2e149d04794c399279c14165adb4e08	{"name": "cache/c5/7a/c57a22898d71ff159406b287b70ffcc2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||1a75142612100ba2a2f43b0d4053f9f0	{"name": "cache/6f/f5/6ff57677cad88db672a9f765469da569.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||9f21b55cdbe7beb01436cb21b4d14689	{"name": "images/posts/IMG.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||e7e406794189a41652cb443e3e3ebeb8	{"name": "cache/0e/3c/0e3ce916b7e2a1754c9a461052417545.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||7cc5930cdf02c5f24c60be0c32607053	{"name": "cache/ff/c1/ffc109c5e830219c61ef6c70e0db6bfa.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 266]}
sorl-thumbnail||image||6094b0a70d5a9dd163f3043caa8bc906	{"name": "cache/9f/3e/9f3efe5f0692fc465e9e257265ea0750.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||a113f4b4fac07b08c1b4e6711b79f987	["d2e149d04794c399279c14165adb4e08", "1a75142612100ba2a2f43b0d4053f9f0", "e7e406794189a41652cb443e3e3ebeb8", "6094b0a70d5a9dd163f3043caa8bc906", "9360e30f573524d369addcf0f5030607"]
sorl-thumbnail||image||94f8010edf4750159901bbb35bd141f9	{"name": "cache/3c/e3/3ce3bdcd485d0caec59bbadd941225b7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||40a1b3763234f4f323f00100036ba7fc	{"name": "users/2020/05/31/15909367266041636795184551849743_4VhNsIo_pMGifbn.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||e61f86a2bb6747244817f2caf550b767	{"name": "cache/7a/00/7a00c23d52ffc8fa30d0478234510837.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||11e19dc7d2268e92e104aaf7bbefe8c5	{"name": "cache/aa/58/aa58469e48bcef1c5b4f7a2702d7fcc2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||cb0d0f5d7580f41ac7d5db7473e93303	{"name": "cache/a2/0c/a20cb2b9fd1b44c07fa3d527b8397233.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||image||3458cfd8e16bb330e13a1b83b810e87c	{"name": "cache/53/a0/53a0295f14576167901742083bc49744.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||7221c76882018d569e28fde38b6dc419	{"name": "cache/f3/18/f318f833ba3540c4e842c3166e684b2b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||aed48305c0c742a48d4fede4902c37d2	{"name": "cache/8e/58/8e585b78019006aa8eb6fe5d430c9837.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||thumbnails||312a1f08467b4b4863b620d04f011dc0	["0a0addd489c3a3993e78747aa72d5a72", "6ac9fad39997676a5c7344b37af850e9", "3523555ff53c9f3b8f4a2600a4a2eba5", "3ea6e9e095ae2da07461e3c156dda7bf", "0ed6f4cd0804dd30a900435e3f6a0f2e"]
sorl-thumbnail||image||d9be86a94ac7867b91c70eb2e76da947	{"name": "cache/d4/38/d4383102be91f3062728fe96969c372e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||40a1b3763234f4f323f00100036ba7fc	["d9be86a94ac7867b91c70eb2e76da947", "3458cfd8e16bb330e13a1b83b810e87c", "11e19dc7d2268e92e104aaf7bbefe8c5", "aed48305c0c742a48d4fede4902c37d2", "e61f86a2bb6747244817f2caf550b767"]
sorl-thumbnail||image||312a1f08467b4b4863b620d04f011dc0	{"name": "teams/2020/05/31/FB_IMG_1590937191743.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [816, 462]}
sorl-thumbnail||image||3523555ff53c9f3b8f4a2600a4a2eba5	{"name": "cache/33/e5/33e5954cf7382d66d08c1a31adb35557.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||0a0addd489c3a3993e78747aa72d5a72	{"name": "cache/98/be/98bea9a06cd6c688564e8ac63dffcd25.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 725]}
sorl-thumbnail||image||bc493b83cfb89679a50151af2cebf2f1	{"name": "images/IMG.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||6ac9fad39997676a5c7344b37af850e9	{"name": "cache/f9/a3/f9a3218daa5c0efb080b1b96808932ab.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 226]}
sorl-thumbnail||image||764eabfd8c4ebdb12a52d0bc8a64965f	{"name": "cache/ff/81/ff81c58ddb311f6bf120c17dc61dffe2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||a5c121f4e02cf3aedf2e758917bfa8ff	{"name": "cache/3e/93/3e93b88beb67db5f073e3a3c6d8e4037.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 960]}
sorl-thumbnail||image||582fe51207e1b3c53a82ba2a6fc7a1ca	{"name": "cache/19/62/1962a48b95ce2e299d4dd1c0db035c8f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||3ea6e9e095ae2da07461e3c156dda7bf	{"name": "cache/21/9c/219c132a3fc6f1fb25b211c3b377e310.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 544]}
sorl-thumbnail||image||bc362d95656258294084bdbf65da64d7	{"name": "buildings/2020/05/31/unnamed_1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [512, 341]}
sorl-thumbnail||image||eeba7f35dfc513b8ca40d2cdffc497b4	{"name": "cache/c2/fe/c2fe153c13827d33a955f54b6b495e65.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 420]}
sorl-thumbnail||image||0c8c355c7bf7cc527e1a4a5ddc57cafc	{"name": "cache/38/45/3845b7962ac5bb8bffb7ac68944f01a8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 639]}
sorl-thumbnail||image||c6b7d52d470c29938afa5630229d48a6	{"name": "cache/32/63/3263d293e907bc174755f9ef301ff6bc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||thumbnails||0f81f3e650cd23f0f2b7dec8dc39624d	["974e52861d152b7ad94e8d4363564296", "5cbbdcb6358a41f0edb151f358ae95ac", "b2cad18382dd095ad97196b2fd0f53a3"]
sorl-thumbnail||image||e6a9ff0060a8578debf42ceba670c278	{"name": "cache/0a/56/0a56878ba5ca399648e75232f569a4fd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||thumbnails||9f21b55cdbe7beb01436cb21b4d14689	["cb0d0f5d7580f41ac7d5db7473e93303", "e6a9ff0060a8578debf42ceba670c278", "c6b7d52d470c29938afa5630229d48a6", "c48b5e8df746f8934b0299ec046349a3", "d4f59119fa38eb811f5ff33b19687d2e"]
sorl-thumbnail||image||81aa69e7d075665aa0f5fe5658b78182	{"name": "cache/6b/4d/6b4d3cb41d2bfc8ab2aa4df1a8fa873f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||f16b54f1f126902db4a1c7abc45281d6	{"name": "cache/a4/e6/a4e61215fdac623ee0546b7dd1dfb445.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||a92486ba9952f828470aa4f98a10c035	{"name": "users/2020/05/31/IMG_20200531_180126.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||9e4b25091b41b4229c448c3efdc5b70b	{"name": "cache/81/8e/818e3462ab0866a4f727be6e24399cb9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||thumbnails||a92486ba9952f828470aa4f98a10c035	["9e4b25091b41b4229c448c3efdc5b70b"]
sorl-thumbnail||image||0b6d3d3103de8d8847cd9ffcc1644939	{"name": "users/2020/05/31/IMG_20200527_151350.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||22099a4aa54c500b00d3e474089d3d41	{"name": "cache/94/30/9430626619540ae522c4fcbd1a5db703.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||thumbnails||0b6d3d3103de8d8847cd9ffcc1644939	["22099a4aa54c500b00d3e474089d3d41"]
sorl-thumbnail||image||5d8dc38076c35a94ba0b31625021f284	{"name": "users/2020/05/31/IMG_20200527_171409.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||15a4dc7122001de78848095216582f7e	{"name": "cache/c2/ba/c2ba309ebb01ea43347ff7862e1520bf.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||d4f59119fa38eb811f5ff33b19687d2e	{"name": "cache/11/a6/11a6030480d1bdc9f3761bd411b75e12.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 420]}
sorl-thumbnail||image||40f6cce0761289bd733f93c15fcb2544	{"name": "cache/ab/ca/abcac6ff0c75385692a6cfa55bbc32c2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 400]}
sorl-thumbnail||image||013eede2b09889b27955e27885e09b09	{"name": "cache/7e/da/7edaf5db874a7375d2da4d16b5f62324.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||2179e33e09cf827fa2ee107665f0f498	{"name": "cache/a1/68/a16812ff59d0050aba47b8ced5d2ac2e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 639]}
sorl-thumbnail||image||83b03cac8aed7338bb98b8376c8bdbcc	{"name": "cache/53/a0/53a01b0356d1124e1fdf3746c24e2133.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||c48b5e8df746f8934b0299ec046349a3	{"name": "cache/48/fe/48fe8af6f9466c230024ec6874b08ca1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||c016698877131fe91ddbce0f105b0de8	{"name": "cache/1a/30/1a301841930c317c008593ca9c5b8b10.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||5d8dc38076c35a94ba0b31625021f284	["013eede2b09889b27955e27885e09b09", "15a4dc7122001de78848095216582f7e", "83b03cac8aed7338bb98b8376c8bdbcc", "c016698877131fe91ddbce0f105b0de8"]
sorl-thumbnail||image||84067bb1189b5b32a8e27bb459682829	{"name": "users/2020/05/31/IMG_20200531_190321.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||a2479b978b8853524e318247d177af78	{"name": "cache/b8/44/b844d9614ecb7fdfc7112db88108ad57.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||ce501b010ba871acf732abcd39aa88da	{"name": "cache/d0/c1/d0c1dae4f1f8bec132e18a7c5b9ed067.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||6e49c066dde3002c5b7d230309012b21	{"name": "cache/97/2d/972d7738d8ce8f737eb7c4fd6d6f607e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||ccda4df2f07ec7bf5a1ac31af70d5cfb	{"name": "cache/9a/66/9a66c59ccc24b15d1b7560578f7effd8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||thumbnails||5d9cb913cc88a7379f75c4256d07a69f	["f41293cb8c5ea4124f914f81ac81b358", "8a95ee51b540d06681f18b0ff60f7d6c", "b8edf6b27aa4cc084a92c9594f244639", "ed6239a2b3ede762068f19ed0e8bfeb8", "40f6cce0761289bd733f93c15fcb2544", "6e49c066dde3002c5b7d230309012b21"]
sorl-thumbnail||image||f4d993076960c176c311939d9e6cd285	{"name": "cache/aa/52/aa52a05fc60405bb103667ee181db899.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||cf8d50df6181a28ca3a0bb4902b9864b	{"name": "cache/01/23/0123469fa969114ae4cdfdf14c07c791.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||42ffb51ff943d848fb3c7728ee41b6ea	{"name": "cache/b9/dd/b9dd159be8636cccf9ec4bd2ebdc73d2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||84067bb1189b5b32a8e27bb459682829	["42ffb51ff943d848fb3c7728ee41b6ea", "ce501b010ba871acf732abcd39aa88da", "a2479b978b8853524e318247d177af78"]
sorl-thumbnail||image||7c2fbb46da15723e0b7b74c628a276ad	{"name": "users/2020/06/01/IMG.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||3ab5f14c6bfb902b10984355d517f631	{"name": "cache/14/a8/14a8e9d07a587edb99b3bea5e290590d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||1cda6eed35654b51e3c3b0878e965e7d	{"name": "cache/47/5e/475ee0fee4775436059f8f790bad1916.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||abcf9e8162184526c42e8bd80e236b11	{"name": "cache/4c/fe/4cfe8e7291ef8ad90322bae4b1061602.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||1a3e230017ea02aaf6c39f26b36c8aac	{"name": "cache/ee/24/ee24755b4a01c679bfee0bdddc3ce9d5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||thumbnails||7c2fbb46da15723e0b7b74c628a276ad	["cf8d50df6181a28ca3a0bb4902b9864b", "1a3e230017ea02aaf6c39f26b36c8aac", "abcf9e8162184526c42e8bd80e236b11", "1cda6eed35654b51e3c3b0878e965e7d", "3ab5f14c6bfb902b10984355d517f631"]
sorl-thumbnail||image||db24e9b0d936108626069d65ad644034	{"name": "users/2020/06/01/Zrzut_ekranu_1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 542]}
sorl-thumbnail||image||42a58f1bc4cac8be3a0d856bd0976c87	{"name": "cache/9d/7a/9d7a8e146c21ff5aa9e6ae1d25b2b2da.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||35f2062b58eaa98d153e62959a122a82	{"name": "cache/03/62/0362ce49ccbf41c8c3a179945c65db85.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 542]}
sorl-thumbnail||image||692be09a6d2a65df2e44303f30f35dd3	{"name": "cache/84/6c/846c8a89062dfc339019c430650e5123.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||b7376635ca5575defa1fbd6b5ae63e9a	{"name": "cache/94/60/9460fdb06db20731799b3558aecb9334.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 226]}
sorl-thumbnail||thumbnails||db24e9b0d936108626069d65ad644034	["b7376635ca5575defa1fbd6b5ae63e9a", "42a58f1bc4cac8be3a0d856bd0976c87", "35f2062b58eaa98d153e62959a122a82"]
sorl-thumbnail||image||c01a966a94b14a5de60b594b28aae329	{"name": "images/posts/FB_IMG_1591019669766.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||2cb19f700715bf0f68b3db71ab936485	{"name": "cache/e6/c9/e6c9c916af89fcea49c2c34cbbca0470.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||e1c88bf07828714940686d95d5e49d7d	{"name": "images/posts/FB_IMG_1591019665917.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||7e4701b924e68fbb79eaef68e8f90762	{"name": "cache/cc/14/cc14bac0cc2077a2ab74a20f18d0868d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||01a693ced20c7e558c2049daccfdccb1	{"name": "users/2020/06/01/51f11ae32e760ae348cf35d9af16edcf.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||e232ac0fa0b15ed30d72c2da9dde39a6	{"name": "cache/d6/b3/d6b3e77b0124373d934a51e9f54f48c5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||0a8c2f52afbd95505d7606eb03377fdb	{"name": "cache/25/77/25774653ecf360cd0b46eb3c760feec8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1440]}
sorl-thumbnail||thumbnails||01a693ced20c7e558c2049daccfdccb1	["0a8c2f52afbd95505d7606eb03377fdb", "e232ac0fa0b15ed30d72c2da9dde39a6", "3df1763ffa9802309c705a9e050c0cd7", "692be09a6d2a65df2e44303f30f35dd3"]
sorl-thumbnail||image||3df1763ffa9802309c705a9e050c0cd7	{"name": "cache/fc/33/fc33fce02fe1ea8c6e06902e26d65d84.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||image||bfe5e76742ea91af56ab37bff0e25fb6	{"name": "cache/08/68/0868a92625bc70c92585bfa1c3621bfb.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||cf65d90b82cb28a95613b3bdba14de05	{"name": "users/2020/06/01/IMG_20200601_152113.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||b691a8a82a005bc47994b3f2c06cf5e7	{"name": "cache/d3/70/d370776a74c2a43727eefdcb50f3c4ff.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||e9161956ab865a24c87d02b224f8e90f	{"name": "cache/fd/17/fd17a9b98c55e2081df35db587d3aa74.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||thumbnails||cf65d90b82cb28a95613b3bdba14de05	["b691a8a82a005bc47994b3f2c06cf5e7", "e9161956ab865a24c87d02b224f8e90f"]
sorl-thumbnail||image||a8cd3dfd9536c8aed8e4856fa19e390e	{"name": "cache/d3/46/d34658ec65d526b4a4abe29a94ae253c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||be96d2ba3927a49c677a771abbbad70f	{"name": "images/IMG_yrWsrTg.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||53f2c6067f8e996d1f8693a30afb596d	{"name": "cache/07/2a/072a090f3904d68249477ae314d52c00.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||image||f128590e372048dfb65774468f0e1fd7	{"name": "cache/a1/d3/a1d3303590ace59eba9b6e216e42b792.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||e9ce364d7cbe638255c55818a63193a5	{"name": "cache/7f/32/7f329ae8e7c120eaa4593868fc6c0324.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||thumbnails||04fe0218ef85e162a6aeb87df5d5680b	["08a74a2086d209201b58e1eb1285bdd3", "e45acbe01e718db6ca3da79f8667c76d", "811e0ec17016486da829af3cbb057013"]
sorl-thumbnail||image||6375126faf44c5348814ddf9b629634c	{"name": "cache/f6/f8/f6f8aad41ac358286d08f6ae08d89fb9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||image||158dcc40ea8e88112e7c215447ac85f9	{"name": "cache/44/48/4448f19aff0ec2413fe9dea8af2cfb94.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||04fe0218ef85e162a6aeb87df5d5680b	{"name": "images/posts/IMG_0RNSjrK.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||a244cfb3e42bf2d57e2024fdd00816a4	{"name": "cache/f7/57/f757783662eb8c28f3adf2325096e354.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||thumbnails||e1c88bf07828714940686d95d5e49d7d	["158dcc40ea8e88112e7c215447ac85f9", "7e4701b924e68fbb79eaef68e8f90762", "a244cfb3e42bf2d57e2024fdd00816a4"]
sorl-thumbnail||image||e45acbe01e718db6ca3da79f8667c76d	{"name": "cache/df/e3/dfe3d31cebc6f38fefee8d12617e255a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||image||67dd1fd5d7a9f576b7f949a0a7525c5a	{"name": "cache/f4/99/f49960d37b18967d143580a6894b9d39.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||f2aa1f97ae5d081bc01ffeb9df883a92	{"name": "cache/17/f4/17f4faa1187c1e5b6c809fd3480a2dac.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||thumbnails||c01a966a94b14a5de60b594b28aae329	["2cb19f700715bf0f68b3db71ab936485", "53f2c6067f8e996d1f8693a30afb596d", "a8cd3dfd9536c8aed8e4856fa19e390e", "d0bdae87a751a444377cb70006621624"]
sorl-thumbnail||image||6a77af920360d56b07920e820190fd3d	{"name": "cache/8a/4f/8a4fc1e8e781e3705011f077e4cf8a03.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||08a74a2086d209201b58e1eb1285bdd3	{"name": "cache/74/eb/74eb1f78332a4687bfaa4bc017a8db66.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||d0bdae87a751a444377cb70006621624	{"name": "cache/5a/89/5a8915b26c11e87a7234d1b00f918373.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||191e4088d22e43467122ece6bce14ae9	{"name": "users/2020/06/04/51f11ae32e760ae348cf35d9af16edcf.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||1bd59d5e432a2ee62bd5bc75b2909b24	{"name": "cache/e8/17/e8171e57a5646d5ffabe2a7fd621c8bd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||edc151ccb26e4e326537d5a7a18000c8	{"name": "images/IMG_20200601_200136_resize_20_compress56.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 600]}
sorl-thumbnail||image||f3d0473745defcae6c8fe98e6518d12f	{"name": "cache/86/90/8690bf6a14b31da3367944e501cb6328.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||64510ad93ef2afbe98351117b2eeb02e	{"name": "images/IMG_20200601_200136_resize_20.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 600]}
sorl-thumbnail||image||37917b197add5c5d2898457dfbf04b9e	{"name": "cache/e3/0b/e30b0c42ef896d45be63dfd66b6085c7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||f92df551c9b67f96057d484a80f74c62	{"name": "images/IMG_20200604_083248.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [720, 960]}
sorl-thumbnail||image||f4aae40cd96d76b28ca4de03430632d3	{"name": "cache/62/a0/62a0f692ae704c36e8bc700cd40da21e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||a1b8850b47fa29553393375b4f79ec57	{"name": "images/posts/20200601_111651.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||3824ead7e116d16334bb0921cb7096c8	{"name": "cache/2d/58/2d5894beb5ba2b0642453e5288ab1610.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [64, 64]}
sorl-thumbnail||image||cf0ee5aec10871950a9f18cc3755e056	{"name": "cache/f3/d9/f3d9e8f7b6bb6c7e7ac3af4b6887d24f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||811e0ec17016486da829af3cbb057013	{"name": "cache/8b/1b/8b1b471e1daaf88a3db6595b9e85f386.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||3052841cc51fc0293651c8b5b6e54542	{"name": "cache/ac/ea/aceaf5f8fdc7f0f816ff8488ce7f6375.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [450, 300]}
sorl-thumbnail||image||96e3135f0d6c1579a5114ab5e2448cd5	{"name": "cache/25/94/2594d699ce2c267ea7eac6d86ff8e86d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||0b71ffbe269fff6f3ea6c02fd83e24fc	{"name": "cache/9a/e8/9ae88707b15d182ea65a2c84bc08ceae.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||d09675cffdde3e77de55c317454b2082	{"name": "cache/dc/3d/dc3d0193084e85c2d7ae1cc6e7a0f449.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||64510ad93ef2afbe98351117b2eeb02e	["4727b8e1cbbf465dcc9daf9350b80ecf", "83fe46e8097540aa159a5dca038985a5", "8a61ddf6ee9760bb7431a8a86c9136f1", "37917b197add5c5d2898457dfbf04b9e"]
sorl-thumbnail||image||83fe46e8097540aa159a5dca038985a5	{"name": "cache/0e/20/0e20edcbb9fca0d03859dd1abb774975.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||ebb336337e3581cb167ce33e7cf683af	{"name": "cache/8f/ee/8fee52ac8f0fd21cae3888cb8cc36741.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1440]}
sorl-thumbnail||image||4727b8e1cbbf465dcc9daf9350b80ecf	{"name": "cache/81/ca/81ca9429090b92369206efd6395b3b86.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||edc151ccb26e4e326537d5a7a18000c8	["f3d0473745defcae6c8fe98e6518d12f", "e8c6792bce17364d328fde207c780bf5", "4f888fac3ffbe4015126823e5be68d1f", "610bb0bd9daa350825c61e220460dfb7"]
sorl-thumbnail||image||e8c6792bce17364d328fde207c780bf5	{"name": "cache/4c/15/4c15831afdb7ca97a3be726191ac8b68.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||5b093a3a8c46c84e0fab893ccece69e4	{"name": "cache/61/59/6159fd6e4748ee5732e53b588a705836.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 700]}
sorl-thumbnail||image||4f888fac3ffbe4015126823e5be68d1f	{"name": "cache/be/56/be567264e89f6ac549c9a71d6a1f1ec6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||c0696d5cbc2643eca8dbb83dbc9139b4	["d9f3c1e2b4ab7bec5bcb74c0d686fc1c", "1110168cbef81f1a619b66fc15da8907", "44fdfe48ec9b67f995c1629c2b515682"]
sorl-thumbnail||image||1356020f6d98dcade582db2cf31825e6	{"name": "cache/4c/ed/4ced2d64bc596b01cfb6b10a7654a2ed.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||c0696d5cbc2643eca8dbb83dbc9139b4	{"name": "images/logo+akademii+pilkarskiej+hutnik+krakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 395]}
sorl-thumbnail||image||ec3bb44978e98a7ba5cef6b276a59c26	{"name": "cache/04/ae/04ae00eae9376faf81a781f497d2e784.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||a1b8850b47fa29553393375b4f79ec57	["3824ead7e116d16334bb0921cb7096c8", "3052841cc51fc0293651c8b5b6e54542", "1356020f6d98dcade582db2cf31825e6", "cf0ee5aec10871950a9f18cc3755e056", "5b093a3a8c46c84e0fab893ccece69e4"]
sorl-thumbnail||image||1110168cbef81f1a619b66fc15da8907	{"name": "cache/ea/20/ea2026b7bcdc4992287830fc530e5e84.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 790]}
sorl-thumbnail||thumbnails||191e4088d22e43467122ece6bce14ae9	["ec3bb44978e98a7ba5cef6b276a59c26", "f45bd02efe9068a2317be7a76b1cb04a", "34ddbf0484dd2414c0add8e3b2592f36", "ebb336337e3581cb167ce33e7cf683af", "96e3135f0d6c1579a5114ab5e2448cd5", "1bd59d5e432a2ee62bd5bc75b2909b24"]
sorl-thumbnail||image||d03cd5b73659e544d1319cbd6bf536d5	{"name": "images/posts/20200601_111651_iReP1Jl.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||16c6f3d91c53bcd412ad1d9826b7adbd	{"name": "cache/3a/de/3ade5ad7f70c98eb5f5addef5ed868d4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 700]}
sorl-thumbnail||image||457158e0b21dd6d4e6ea2eae9e07e74b	{"name": "images/posts/IMG_0RNSjrK_qfrH2S7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||068b5551c6f72fae90dd0a91f5d7e16b	{"name": "cache/56/28/56285d3548a6a9913197c1f1626da7e5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||0c6d87f3e2ba034f0b2fdd5ed243d619	{"name": "images/posts/FB_IMG_1591019669766_EllSPW5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||9684b44b6f715c225a314e04849279c4	{"name": "cache/c5/91/c591529c19a0164709019003d0053402.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||df0a3fb216eb0db75e2be13c4825559d	{"name": "images/posts/FB_IMG_1591019665917_5ECnEeF.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 540]}
sorl-thumbnail||image||d2ffed542f7597945e3240ddd5ed9cf9	{"name": "cache/45/51/4551cb42769ee11e9ee65b00800933bf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||edbcf9eab6fa7992a916a9500610f397	{"name": "images/IMG_20200519_131814.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [720, 960]}
sorl-thumbnail||image||4cf054479e8713dee7f98fd1d7031cb3	{"name": "cache/32/31/323111d2bbfce912aa9e962cda4c29bc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||f145d11d2eafcac77589b1709822cb9a	{"name": "images/Zrzut_ekranu_z_2020-05-27_07-40-35_5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||7b48ace28c6f0e6438e4f3a1c43e74b9	{"name": "cache/a1/5e/a15e7eba66cf41e4bb1b62a6ea9342dc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||0dc26f62c3a24514f7b1e92c1fd2f2d1	{"name": "images/\\u0142adowarkabezprzewodowahocospecyfikacja.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||964a6230fbd1a5df60cd0ca6956fd146	{"name": "cache/52/9d/529de5c79c285d05d84d3f1c67a74e6b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||b2d9cd30e6625747ad4e91fa1bc1f38f	{"name": "images/posts/P1013590.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||d8f593d268801be44e3c05bd5c650280	{"name": "cache/52/ea/52ea2ba9ea544312ec0fe780a7d60f99.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||08d7a6bf6f9d9ad96366e07403fe24c3	{"name": "cache/38/87/3887a4a9db45745e8ee76d9f2fe73b5c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 141]}
sorl-thumbnail||image||1d96d732122b5c7fe8be14399dcd3b03	{"name": "cache/c4/7a/c47adc83d2d4f102220d4b05647b084d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||thumbnails||df0a3fb216eb0db75e2be13c4825559d	["d02a99e720b3fb688095721df5a8c654", "d2ffed542f7597945e3240ddd5ed9cf9", "41e77c45150a6e3f580c70df543595b5", "b0f15bf5aeeb7a1795def7467e0f11d9", "04e2feecc3140d86afe95f65999d32fd"]
sorl-thumbnail||image||7b6a4cb1f763c6e235c6073a891ea100	{"name": "cache/16/56/16566ee4d74e0c5eb52df724d728cd20.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 141]}
sorl-thumbnail||thumbnails||0c6d87f3e2ba034f0b2fdd5ed243d619	["1e9811f7d77cb4a98f5f28d17e2e62cf", "212680fce0d6517fec5f86d28c381f03", "7b6a4cb1f763c6e235c6073a891ea100", "9d26bf6c539063aa635840c59b02f077", "9684b44b6f715c225a314e04849279c4", "c47188c1da1d4c248b5999848c8c4f44"]
sorl-thumbnail||image||d02a99e720b3fb688095721df5a8c654	{"name": "cache/22/ef/22efb5115c5c14a7daab8a930ae4c9c7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 141]}
sorl-thumbnail||image||b3ce74c9384d097b9b28cf4c48b145ac	{"name": "cache/7b/a8/7ba849d58094816e0433126bf1f7711f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||84c291a811ed5e540850170f7c4a7dc1	{"name": "cache/a6/51/a6513a374be753fef637ce3a75cf5414.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||62898fd9127258d5503a9553e8478b49	{"name": "cache/20/4a/204aa79848c08368caf7a030bcfdb74d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||image||7ce6dcd34e193496ce28091290b7c88a	{"name": "cache/2f/5b/2f5b6c3e31e33631594cbdd219decea8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 197]}
sorl-thumbnail||image||d2e08a5f9e42740edb9f3270bc7f72f2	{"name": "cache/c2/a2/c2a237365843e842f7ec6e5526a4ab0b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||0dc26f62c3a24514f7b1e92c1fd2f2d1	["964a6230fbd1a5df60cd0ca6956fd146", "d2e08a5f9e42740edb9f3270bc7f72f2", "62898fd9127258d5503a9553e8478b49"]
sorl-thumbnail||image||dd0a5b29fba9ef8ceb76664314115650	{"name": "cache/6d/bb/6dbba75073fc5911a089a103e5e72f1f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||f145d11d2eafcac77589b1709822cb9a	["7ce6dcd34e193496ce28091290b7c88a", "dd0a5b29fba9ef8ceb76664314115650", "7b48ace28c6f0e6438e4f3a1c43e74b9"]
sorl-thumbnail||image||770406ac956b32d898a7d5002d3845b2	{"name": "cache/60/67/6067fe3acb5c2cc5b2207109e899889f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 467]}
sorl-thumbnail||image||d657f49848a35fcda6d17c39bb68729b	{"name": "cache/b1/57/b157a8227d9af640c4d56ab63b201024.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||edbcf9eab6fa7992a916a9500610f397	["770406ac956b32d898a7d5002d3845b2", "4cf054479e8713dee7f98fd1d7031cb3", "d657f49848a35fcda6d17c39bb68729b"]
sorl-thumbnail||image||98d3ad324c109db7e4cea7ee0769af21	{"name": "cache/ae/a8/aea88bcafe995bfcf7b4ae752795db4a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 700]}
sorl-thumbnail||image||c1f66b083fd2aeb1c229cdac9d86638f	{"name": "cache/76/92/7692f9841a4ecece4a4f7fbdaa4a6340.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||8994da83e283a6bf3ea9b17c37262d83	{"name": "cache/0d/fb/0dfb35752e3b5f526e2c6b44827f2657.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 467]}
sorl-thumbnail||thumbnails||f92df551c9b67f96057d484a80f74c62	["f4aae40cd96d76b28ca4de03430632d3", "d09675cffdde3e77de55c317454b2082", "0b71ffbe269fff6f3ea6c02fd83e24fc", "8994da83e283a6bf3ea9b17c37262d83"]
sorl-thumbnail||image||8a61ddf6ee9760bb7431a8a86c9136f1	{"name": "cache/47/ec/47ec9c05838c38c8b19b96c36eec1143.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||image||610bb0bd9daa350825c61e220460dfb7	{"name": "cache/2e/13/2e1308350eff0157de8c6b3df34d0611.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||image||39397fa45fa712da78fdd1846b12cb4a	{"name": "cache/8f/19/8f19ae3b55ff3e454ff1f34f596ce0d2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||7a62a93a761bbd1962a1f7318de6e79d	{"name": "cache/dd/89/dd898e98a9ef0025e78c930b8fbb22a0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||thumbnails||be96d2ba3927a49c677a771abbbad70f	["67dd1fd5d7a9f576b7f949a0a7525c5a", "7a62a93a761bbd1962a1f7318de6e79d", "6a77af920360d56b07920e820190fd3d", "f128590e372048dfb65774468f0e1fd7"]
sorl-thumbnail||image||c47188c1da1d4c248b5999848c8c4f44	{"name": "cache/d0/05/d005c4b3d6f5b27d287c55b86d8c431a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||db9d44b75c4e6471b60cfb75aa57d7f6	{"name": "cache/b3/83/b383369b92b8243571da8aaa1aff3f01.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||thumbnails||bc493b83cfb89679a50151af2cebf2f1	["f16b54f1f126902db4a1c7abc45281d6", "764eabfd8c4ebdb12a52d0bc8a64965f", "db9d44b75c4e6471b60cfb75aa57d7f6", "81aa69e7d075665aa0f5fe5658b78182"]
sorl-thumbnail||image||db5647c6ab158ebdd0f8b66465a318c6	{"name": "users/2020/06/14/IMG_20200610_140833_xeR9yLK.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||191c2240d79ad8c0cf5911e1ab26a8f3	{"name": "cache/8b/a2/8ba2347d3a0edf2f44042258d5d09879.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||0dff091e3fd805e1ee50100e5ee5d941	{"name": "cache/57/61/576117aef853da07ce23d4e92c7e38e5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||1e92033c36b5eef30146191211972bb1	{"name": "cache/16/49/1649de95edd0be809083dd5d0af2708c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||59184c8a591eb07d3b5469b25eceb0f8	{"name": "cache/1b/f9/1bf97e3c75148c277670a62937e5e2f8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||3691716879d4387733a3f60d1289beeb	{"name": "cache/fe/bd/febd0adf9c483b72bc381fcbc8744f44.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||10a6ffc389d382ab93324a215cb08253	{"name": "cache/6d/b6/6db64701419027b89eaafb8e81cdf932.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||d19a1335297d86c49bbc0a5a4cd18780	{"name": "cache/29/68/29682e40a508bd2a003233977b0d7705.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 700]}
sorl-thumbnail||image||34ddbf0484dd2414c0add8e3b2592f36	{"name": "cache/4b/72/4b72a71877c80b51696b6e40accc844c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||7a51c9174fcd2f232cc7cc56c71d39b3	{"name": "cache/9e/94/9e945acba388c9b57212d5756c79e4ce.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||d03cd5b73659e544d1319cbd6bf536d5	["84c291a811ed5e540850170f7c4a7dc1", "8d40d023fa1a46b5a19dbd6226277f24", "fc0052a91de6660dc4e9594594237716", "08d7a6bf6f9d9ad96366e07403fe24c3", "75d11df88cab28a6f468e086540045a9", "16c6f3d91c53bcd412ad1d9826b7adbd", "4564edf47e47b35095180a0d20d187f7", "c1f66b083fd2aeb1c229cdac9d86638f"]
sorl-thumbnail||image||e3d2678eb7e7dbcb16a0ad9e44aa3e12	{"name": "images/posts/FB_IMG_1592160458792.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [679, 960]}
sorl-thumbnail||image||7e3818dde5d1f6009725dd9c565aafc7	{"name": "cache/d7/fd/d7fde1c50cf2713b493eb9244750cd6f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 353]}
sorl-thumbnail||image||bfe5e4f633a5d602afbc42b69527a740	{"name": "cache/e0/fd/e0fdab38a797d9ed05d85ed9220a31b9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 700]}
sorl-thumbnail||image||0069e923f13af5b9038f9d8896b866cf	{"name": "cache/ae/d5/aed573050594fe913f331d7b79c9b93a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||22b76f41c42f3c6f9bb404e1e56f648b	{"name": "cache/19/09/1909e57164328dcfb027f34b63fd09a6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 200]}
sorl-thumbnail||image||7b6dc9063d873ee09efe328e587911d4	{"name": "cache/15/5a/155a3822fbaf52d13165003499d9f0e4.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||db8351b1cc8d86bda2d9a6c60728fbd2	{"name": "cache/44/95/4495b9dae8b07ae1d02256f1288d27ac.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1747]}
sorl-thumbnail||image||203bd063bf197351688493e988b4bb3e	{"name": "images/posts/FB_IMG_1592160371191.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [230, 314]}
sorl-thumbnail||image||8d1b9f989a64fddb768fb1e2a13b5053	{"name": "cache/99/7c/997c0af096fee9eb6d125bec6268a609.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 341]}
sorl-thumbnail||thumbnails||db5647c6ab158ebdd0f8b66465a318c6	["0dff091e3fd805e1ee50100e5ee5d941", "471efa73f4565731ccfbe2e6bc6a632d", "191c2240d79ad8c0cf5911e1ab26a8f3", "7a51c9174fcd2f232cc7cc56c71d39b3", "10a6ffc389d382ab93324a215cb08253", "59184c8a591eb07d3b5469b25eceb0f8"]
sorl-thumbnail||image||1902a2d370b629d3f99e5039e80058b2	{"name": "cache/1b/fe/1bfed89f5b3b0810d2949b363855d09e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||fb9ce31a6b1b5c3fb240158914709bfe	{"name": "cache/11/48/1148a8625b32a61c68fb870466414156.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||8d40d023fa1a46b5a19dbd6226277f24	{"name": "cache/4c/00/4c00d7dce4fae02292ed847d2b80b151.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||b7bbafca0cda0d0d93005e2f0f99d4a8	{"name": "cache/d0/56/d05656c6a0f5b10ca8aabeb67633240e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1810]}
sorl-thumbnail||image||0c7ff8335aa8d1a4b21c903850da83f6	{"name": "images/posts/flaga_akademi.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [936, 220]}
sorl-thumbnail||image||f64b96b6f86baddf90855a01f43f3589	{"name": "cache/0d/e3/0de36dfb869a6d6afdbb3e6dfdb3f034.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1747]}
sorl-thumbnail||image||13a328f34fb9be5ea61b3b164d1923c0	{"name": "cache/ed/4f/ed4fd9b317c075f950d6738513a73bba.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||d9f3c1e2b4ab7bec5bcb74c0d686fc1c	{"name": "cache/79/5a/795a2d93b8f8615891be531036048573.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 148]}
sorl-thumbnail||image||5c301f61d92fb39513385cfdca5b4470	{"name": "cache/5b/bb/5bbb4dc2c3fca4b8440bf5651b49dd62.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 188]}
sorl-thumbnail||image||6494a2e1cd749c19e697a5a42d47da23	{"name": "cache/c0/8a/c08a0c29ac797b5f1267bfd34774859a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 410]}
sorl-thumbnail||thumbnails||bc362d95656258294084bdbf65da64d7	["0c8c355c7bf7cc527e1a4a5ddc57cafc", "bf06bed18f43f867c7ae61696b369a3d", "30b24b5fff6b033f745eb23aa5f4585f", "7cc5930cdf02c5f24c60be0c32607053", "7221c76882018d569e28fde38b6dc419", "2179e33e09cf827fa2ee107665f0f498", "eeba7f35dfc513b8ca40d2cdffc497b4"]
sorl-thumbnail||image||e9e8b0dd73989f1dc930342692b94b3b	{"name": "cache/6c/1a/6c1a2805bf3ae4dd70e92c6ec09de464.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||203bd063bf197351688493e988b4bb3e	["db8351b1cc8d86bda2d9a6c60728fbd2", "d19a1335297d86c49bbc0a5a4cd18780", "f64b96b6f86baddf90855a01f43f3589", "1e92033c36b5eef30146191211972bb1", "ac8bf72ad476ffff8f3fa504246ad163", "6494a2e1cd749c19e697a5a42d47da23", "0069e923f13af5b9038f9d8896b866cf", "8d1b9f989a64fddb768fb1e2a13b5053"]
sorl-thumbnail||image||31a41bd5ef53506de625cf99d1a2e48b	{"name": "cache/fd/d1/fdd1b4c302e1534cbcc444f8542ad2e4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||75d11df88cab28a6f468e086540045a9	{"name": "cache/e1/17/e11795ef2432240827683d6d1205a8fb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||f45bd02efe9068a2317be7a76b1cb04a	{"name": "cache/c5/b7/c5b786e3c6983aed34f4036655af531d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||image||13137d11d78cd04b6ffab1055fdde337	{"name": "cache/b3/cf/b3cf4f46cd4ac0086883a91a030bb54a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||image||471efa73f4565731ccfbe2e6bc6a632d	{"name": "cache/cd/3b/cd3bffb5bcad4e7df49b23870283df8e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||image||0ed6f4cd0804dd30a900435e3f6a0f2e	{"name": "cache/11/55/115512a839f46963d9baf9bfa0c4ba0b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||30b24b5fff6b033f745eb23aa5f4585f	{"name": "cache/38/1b/381b6ac664484ac8b144f84f8f8e30e1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||44fdfe48ec9b67f995c1629c2b515682	{"name": "cache/a8/9b/a89b3e062c99e12318c24ecd6bfa3f46.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||a54a84656a4d13705ca51374800b1da5	{"name": "cache/b3/74/b374092bc1633118ef946dfcc7515411.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 240]}
sorl-thumbnail||image||79f32eb22c90c12ec53919da2413a3c0	{"name": "cache/0b/2b/0b2bb30a57de630f703108fb60aebbb7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||102f0741f0260d0c162ab4143f88ad9b	{"name": "cache/f2/75/f275316ef96e9e3d398effa586003516.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||68ea7501f134b9c3f4fab8d8ee71b14f	{"name": "cache/ac/50/ac50dff71b1b86a4c3a5f6be49d98001.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||1e9811f7d77cb4a98f5f28d17e2e62cf	{"name": "cache/ad/0b/ad0b5465184da7b07e6107cacc98b0db.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||04e2feecc3140d86afe95f65999d32fd	{"name": "cache/b6/82/b68248eeb439b16a8c1a96549e7554be.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||4d273b53f7ff4eb2bb121bbaddbf9dff	{"name": "images/Zrzut_ekranu_z_2019-03-20_08-54-20.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 360]}
sorl-thumbnail||image||10f2baf0821daad3fdc4bea485a0f751	{"name": "cache/ca/ee/caeef7fa992fa9ad7dc68ba8e9d154ca.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 180]}
sorl-thumbnail||image||5b9506dfdf17b0f133b46dae79ab5e22	{"name": "images/Zrzut_ekranu_z_2019-10-10_09-19-15.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||thumbnails||e3d2678eb7e7dbcb16a0ad9e44aa3e12	["e9e8b0dd73989f1dc930342692b94b3b", "468a81f56c810890f3d3d49665ba58f0", "1902a2d370b629d3f99e5039e80058b2", "bfe5e4f633a5d602afbc42b69527a740", "3691716879d4387733a3f60d1289beeb", "7e3818dde5d1f6009725dd9c565aafc7", "7b6dc9063d873ee09efe328e587911d4", "b7bbafca0cda0d0d93005e2f0f99d4a8"]
sorl-thumbnail||thumbnails||4d273b53f7ff4eb2bb121bbaddbf9dff	["a8285283555769dd643e51954cce6bd6", "10f2baf0821daad3fdc4bea485a0f751", "885a442179fe41b087eacbd1de93acb9"]
sorl-thumbnail||thumbnails||bc0ce2fa1e1d52f51f6970e75886d907	["636195cede81f250936057c5671dcbd3", "cf24e2bcb54ce5ca82711362792af670", "03b931ef5b3d752176de7be66f6b1ada"]
sorl-thumbnail||image||832a51537f2082801974cad273334353	{"name": "cache/63/0d/630d5d48f6129a2e605a0bec9fdf2c4b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 360]}
sorl-thumbnail||image||ee8dd9b031340a9d4643f663bc0f2ed8	{"name": "cache/95/5a/955ad79f841e10fe0d58d48ef0c2de3a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 59]}
sorl-thumbnail||image||651042d33de67c7271e3b8ec0c1728bb	{"name": "cache/e9/bf/e9bfe196415cbb41bc30cf417d3d23fc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 141]}
sorl-thumbnail||image||4823824835cb501ba83616590da08983	{"name": "cache/75/33/7533d43696bab0f457e6242ac3bc2b69.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||be5fb7e8b5cfe3adbb216ca31ca11891	{"name": "cache/9d/16/9d16c2bd522f4170f30fbf8f9a6c6b8c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 301]}
sorl-thumbnail||image||0f81f3e650cd23f0f2b7dec8dc39624d	{"name": "images/posts/IMG_20200607_133738.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||97771edb1c749de0b2cd519733429ea9	{"name": "cache/ac/05/ac05114daba354ba32db71d6bb58f4c7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 94]}
sorl-thumbnail||thumbnails||0c7ff8335aa8d1a4b21c903850da83f6	["13a328f34fb9be5ea61b3b164d1923c0", "ee8dd9b031340a9d4643f663bc0f2ed8", "97771edb1c749de0b2cd519733429ea9", "be5fb7e8b5cfe3adbb216ca31ca11891"]
sorl-thumbnail||image||49eeb91f1393af3bc1359e7f8858aaad	{"name": "cache/80/6e/806e3b3191be2a12e4c1c335ce766971.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 197]}
sorl-thumbnail||image||b3d8a83dd37f0badfeb90fe113b12bc8	{"name": "cache/75/33/7533d43696bab0f457e6242ac3bc2b69_O9DKqmw.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||094aeef6fed002a2b765934b160312e0	{"name": "cache/fb/36/fb36f50864314f51462748e345c2cab5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||5b9506dfdf17b0f133b46dae79ab5e22	["094aeef6fed002a2b765934b160312e0", "49eeb91f1393af3bc1359e7f8858aaad", "832a51537f2082801974cad273334353"]
sorl-thumbnail||image||885a442179fe41b087eacbd1de93acb9	{"name": "cache/59/51/59517baddf04b41fcf983312f33e2283.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 98]}
sorl-thumbnail||image||a8285283555769dd643e51954cce6bd6	{"name": "cache/a4/7a/a47ad687327ec398c1167d37608f0184.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||fc0052a91de6660dc4e9594594237716	{"name": "cache/71/02/71020c1cec04ebf1b77bc4de6f411cb9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||4564edf47e47b35095180a0d20d187f7	{"name": "cache/b3/79/b379b22b942b18afc3d0fa74d77747c4.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 225]}
sorl-thumbnail||image||ca4d4a19ea562977c4746da13786e1db	{"name": "cache/6a/64/6a6457db77195305247be042040187f1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||457158e0b21dd6d4e6ea2eae9e07e74b	["68ea7501f134b9c3f4fab8d8ee71b14f", "39397fa45fa712da78fdd1846b12cb4a", "ca4d4a19ea562977c4746da13786e1db", "068b5551c6f72fae90dd0a91f5d7e16b", "1d96d732122b5c7fe8be14399dcd3b03", "79f32eb22c90c12ec53919da2413a3c0"]
sorl-thumbnail||image||f135114586e43455778595fe0f4d3155	{"name": "cache/f6/df/f6df445c3ade2b2371edc2cc32ff36d5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||b2d9cd30e6625747ad4e91fa1bc1f38f	["b3ce74c9384d097b9b28cf4c48b145ac", "fb9ce31a6b1b5c3fb240158914709bfe", "d8f593d268801be44e3c05bd5c650280", "f135114586e43455778595fe0f4d3155", "102f0741f0260d0c162ab4143f88ad9b", "31a41bd5ef53506de625cf99d1a2e48b", "22b76f41c42f3c6f9bb404e1e56f648b", "98d3ad324c109db7e4cea7ee0769af21"]
sorl-thumbnail||image||1a18fa5a195eb29c3840e0858810f6dd	{"name": "teams/2020/06/17/IMG_20200614_120200.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [2736, 3648]}
sorl-thumbnail||image||7270946677625b140ec635ec829a9803	{"name": "cache/6a/92/6a92c4637eea12be0ca649caff4a1a81.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||ac5d3e39b7ab79a009c2f7bdd5423dc0	{"name": "users/2020/06/17/IMG_20200608_135539.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||a400158722567f5400a8ea0f86835c87	{"name": "cache/bf/2a/bf2afec6b439950b895fe7e2ff055e60.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||c16ad929bd13c398a1fe1dce002ef510	{"name": "cache/fb/0f/fb0fb7acb101dac5c72b4be152aa01ba.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||eb07ee8b6d74279e90398d33a12b46ae	{"name": "cache/e7/7a/e77a2f79784735f05b017b119c2773e2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||thumbnails||1a18fa5a195eb29c3840e0858810f6dd	["7270946677625b140ec635ec829a9803", "b3d8a83dd37f0badfeb90fe113b12bc8", "cd834501fb7a9fa2f2831b54834156f1", "171c99a51e055ab5d6b3f07e6a8855bb", "4823824835cb501ba83616590da08983"]
sorl-thumbnail||image||cd834501fb7a9fa2f2831b54834156f1	{"name": "cache/51/20/5120f62cff1e59c5c6556428d1a8f1ca.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1707]}
sorl-thumbnail||image||b2cad18382dd095ad97196b2fd0f53a3	{"name": "cache/83/2b/832b7e9199f3f9f2c32a100659b3fccc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||468a81f56c810890f3d3d49665ba58f0	{"name": "cache/81/9b/819bb9f87fbed03c14224c81246f628f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||b0f15bf5aeeb7a1795def7467e0f11d9	{"name": "cache/20/dd/20ddf574cb3fe22c94bdd22dcb44150d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||41e77c45150a6e3f580c70df543595b5	{"name": "cache/e7/92/e7929fec26b192281551bed1a71686df.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 225]}
sorl-thumbnail||image||e7a7853e7f0d38a26f570e557bb308fc	{"name": "cache/2a/92/2a92cc10046d40e1e9e54528c3c4ab22.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||42928bc95e66641499e5b309c1625d29	{"name": "cache/ae/83/ae837e10e680e922fb49ebd52ef302cc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 450]}
sorl-thumbnail||image||974e52861d152b7ad94e8d4363564296	{"name": "cache/c0/c2/c0c20813be338d9ad7e0d2fdcd88881c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||5cbbdcb6358a41f0edb151f358ae95ac	{"name": "cache/b1/50/b150e6cd0147cc346ff27ea086b30e79.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||ac8bf72ad476ffff8f3fa504246ad163	{"name": "cache/c1/5f/c15f65aa27154e3e3afb87ce40e87213.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 546]}
sorl-thumbnail||image||2fc8052e3b02d4ce02e703c479203073	{"name": "cache/4a/c3/4ac321501905d4f31da318a36da68a04.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||ac5d3e39b7ab79a009c2f7bdd5423dc0	["a400158722567f5400a8ea0f86835c87", "c16ad929bd13c398a1fe1dce002ef510", "2fc8052e3b02d4ce02e703c479203073", "eb07ee8b6d74279e90398d33a12b46ae"]
sorl-thumbnail||image||171c99a51e055ab5d6b3f07e6a8855bb	{"name": "cache/96/7d/967ddf4428aeba462b071f432491e8e0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||9d26bf6c539063aa635840c59b02f077	{"name": "cache/07/f9/07f98e8973ec93f53790582a4b742e25.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 720]}
sorl-thumbnail||image||212680fce0d6517fec5f86d28c381f03	{"name": "cache/c2/6a/c26aa9cfd226f5f83b0ad899a3512a94.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 225]}
sorl-thumbnail||image||cf49999ee087cdd93d77d36ccf732cac	{"name": "images/posts/IMG_20200616_180348.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||22a796ec79edb26b938265357fc8c70d	{"name": "cache/ee/dc/eedcddfd084771a44b32290547a57bc7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||85962ecae7494169028a3953632d4fc4	{"name": "images/IMG_20200606_192656.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||a242f2edf4286a1ca82a103481847a84	{"name": "cache/08/99/08996f7ce9dffb76915a1193eeb8b433.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 480]}
sorl-thumbnail||image||41ef973596f59c067fbffca62ecfa55c	{"name": "images/IMG_20200606_113541.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [720, 960]}
sorl-thumbnail||image||993a2cc6833548afe1c94b8b00412283	{"name": "cache/ef/94/ef94c8698bd7d6e5e8a7bdb868534244.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 853]}
sorl-thumbnail||image||930f511f44e1e1df4208f7dd4794c4a9	{"name": "cache/da/58/da581502a2b1b275c7b90f64a5b94e44.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||67803aeb0df0654007209c658e09b936	{"name": "cache/6f/e9/6fe9093bfecca31c7f7aad72f22ba7f6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||image||7fa97b990e7a68d8b512840d5bef5501	{"name": "cache/15/e9/15e9897f5c76e7f99a5874944f535ca8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 450]}
sorl-thumbnail||image||b11e16d35fc021213fb24d6cffd80b62	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||2f72fc9744ca909782e170a37e8f92c4	{"name": "cache/98/1a/981a68d93e949485f6997aed46dec934.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||0397bf3dcf0300efde64c46d4dd4c35a	{"name": "cache/d8/7e/d87e4be872f4df01b02f141723376c41.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||e12ed3cf5c141873dd7590b82b5e8a07	{"name": "cache/ae/fd/aefd01609ff6f54b334ebdd1c30709a7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||cf49999ee087cdd93d77d36ccf732cac	["e12ed3cf5c141873dd7590b82b5e8a07", "22a796ec79edb26b938265357fc8c70d", "2f72fc9744ca909782e170a37e8f92c4", "930f511f44e1e1df4208f7dd4794c4a9"]
sorl-thumbnail||image||d43b9cc8f048067965183cb8def7bd73	{"name": "cache/0b/c4/0bc4271cd85020f740badd6f17fa038c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 467]}
sorl-thumbnail||image||513f56121a61d820e0b839a3579f876a	{"name": "cache/ea/ee/eaee58f3dfe9ee33512a225adebd6cd4.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||3fbfcb27f0c8fc8eb1972dbe8c198dd1	{"name": "cache/33/2d/332d06c65f755c2bd91bae24d11413a5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||41ef973596f59c067fbffca62ecfa55c	["993a2cc6833548afe1c94b8b00412283", "3fbfcb27f0c8fc8eb1972dbe8c198dd1", "d43b9cc8f048067965183cb8def7bd73"]
sorl-thumbnail||image||354fab76c17d8a61b6e42e02a0bfaeb3	{"name": "cache/ee/0a/ee0a4a3ab5fcd5521fc59def10597198.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||image||5a7ca9cc899491c27552db872d4961b5	{"name": "cache/b6/51/b6511bf364946ca8a488c27f539f7beb.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||1dd89d74ea81e8435b3f86b9a4875114	{"name": "cache/36/e9/36e9fa4ddc061fa128570527a7311566.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||85962ecae7494169028a3953632d4fc4	["354fab76c17d8a61b6e42e02a0bfaeb3", "1dd89d74ea81e8435b3f86b9a4875114", "a242f2edf4286a1ca82a103481847a84"]
sorl-thumbnail||image||71e54adec1298b8d04cb59c10d1a10cb	{"name": "users/2020/06/18/IMG_20200616_180340.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||5d7f1d055024ad7595c82177f74d3282	{"name": "cache/33/38/3338dc6512149cd2f0122eb175223fe3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||thumbnails||71e54adec1298b8d04cb59c10d1a10cb	["5a7ca9cc899491c27552db872d4961b5", "67803aeb0df0654007209c658e09b936", "5d7f1d055024ad7595c82177f74d3282", "513f56121a61d820e0b839a3579f876a", "0397bf3dcf0300efde64c46d4dd4c35a"]
sorl-thumbnail||image||63e39bc93b21f439062bf864b0d7de30	{"name": "cache/35/b1/35b113370059fbf78bf45f9db6c78d5d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 450]}
sorl-thumbnail||image||f8b6356f34acb162a81c692c36f437b5	{"name": "users/2020/06/22/IMG_20200616_180340.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||c9e55a82886586058eaff563d79a1454	{"name": "cache/3d/70/3d70643d8ba8228fa47bdfd4ca4086af.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||image||c53dee17eff371d76452b0e3c7ee05e4	{"name": "teams/2020/06/22/udanywysteppilkarzyakademihutnikawturniejuskawinkacup.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||0f46cc7aefa77c75c5255aad7a7b2811	{"name": "cache/77/d3/77d3f30da9e321c28e11998d95dae331.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||e196d387915823a1044234c4ee9194a4	{"name": "cache/59/6d/596d48a7601c08f70d37eeb20d42b28e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||511cb5dd9a282d60f0cd86cf8e4733e3	{"name": "cache/8c/b9/8cb90468b54c34814defb771b21471b0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||thumbnails||c53dee17eff371d76452b0e3c7ee05e4	["b75fc487717220b240fc820db9a6f969", "0f46cc7aefa77c75c5255aad7a7b2811", "2fcb6c1dde1d9458fc9253f68b49c749", "7de102bb2851cffc1aef2051ee1d2504"]
sorl-thumbnail||image||11a07d33a982531c628ed43796bc6375	{"name": "cache/92/79/9279ed6c6db178b748f0f0ee247db233.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||9783e6b3312fe3159359fe2d5039e34c	{"name": "images/posts/nowynabordodruzynyskrzatowakademiipilkarskiejhutnikakrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [780, 520]}
sorl-thumbnail||image||6ad1d9b2ddb5ea7e3adf5e271a783b12	{"name": "cache/01/cd/01cd9a4788804a9398d87e35d18de6c6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||f8b6356f34acb162a81c692c36f437b5	["46d9bdd1023111a7f953a44ac74642f3", "110450b27056de9ca4b020fbf604f371", "c9e55a82886586058eaff563d79a1454", "668ded5cb18a6228b2ca981e80db7265"]
sorl-thumbnail||image||7de102bb2851cffc1aef2051ee1d2504	{"name": "cache/7e/89/7e8956e7287cd97c68f13dd36f97d85d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||0fb0d922cd6d76943fd35aec8177d3c5	{"name": "cache/77/a8/77a8004c2c8b0a891c513e7076248211.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||b75fc487717220b240fc820db9a6f969	{"name": "cache/20/74/2074d52b65bdae1504a92a989fa0df65.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||5b3e75c3b7a677949185b0821dff38ca	{"name": "images/posts/treningiindywidualneumiejetnoscipilkarskichwakademiipilkarskiejhutnikakrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [679, 960]}
sorl-thumbnail||image||880f3e9c801e14973c2c813247c98188	{"name": "cache/76/5b/765bdd7cdd165393a62b531023c47084.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||110450b27056de9ca4b020fbf604f371	{"name": "cache/7f/4b/7f4bfabcc99ba515db201b53575c3d51.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||0082ce79eed006db85acbded7ee88378	{"name": "cache/ee/10/ee109be9c612fb4153b83dc6d8ab5c41.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 167]}
sorl-thumbnail||image||668ded5cb18a6228b2ca981e80db7265	{"name": "cache/c7/37/c73797fbc219b196f69c3dd0017843d7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||thumbnails||0aa371a6db270a1bb90a701b9421692f	["1f716c3eeb148b9e0a7dd8139f458365", "7636d35d6b88da23851d05f4dff3f6c2", "0ae86ede892042e128f14cda241fb90d", "064867fac1f483cf0d35630e32cf6e19", "887e8c87087da8c65eb907de5d70a896"]
sorl-thumbnail||image||0aa371a6db270a1bb90a701b9421692f	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||7636d35d6b88da23851d05f4dff3f6c2	{"name": "cache/6f/ce/6fceca056f06d735485004bbb0190d44.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||064867fac1f483cf0d35630e32cf6e19	{"name": "cache/cb/6d/cb6d4d4fee09f282344b544a4b24e0f8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||7620acc163d29e33158e564ecff2dbb2	{"name": "cache/e4/44/e4443134aefd54e58eb023e572b778b9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 267]}
sorl-thumbnail||image||31694b682e8e2f9536ab29f420875337	{"name": "cache/9b/3c/9b3c813a775f50f22740e801d55ac338.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 425]}
sorl-thumbnail||image||b588361b22ead01aad7e686f856f479c	{"name": "cache/43/a8/43a80110c8be936066daa44ec746e738.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 400]}
sorl-thumbnail||image||1f716c3eeb148b9e0a7dd8139f458365	{"name": "cache/35/1d/351df526a0ca924c8f30a0aa6bde323a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1812]}
sorl-thumbnail||image||0ae86ede892042e128f14cda241fb90d	{"name": "cache/6a/03/6a033822f9d2cb3989a944bba85dfecf.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||thumbnails||9783e6b3312fe3159359fe2d5039e34c	["2ab97f0fd76ab424ff7728f64819816f", "0fb0d922cd6d76943fd35aec8177d3c5", "7620acc163d29e33158e564ecff2dbb2", "39c1972b91f80f2f7e209e26b7d26252", "0082ce79eed006db85acbded7ee88378"]
sorl-thumbnail||image||2fcb6c1dde1d9458fc9253f68b49c749	{"name": "cache/f3/06/f30696f8a2fe1a4e536fc448323ef3fe.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||2ab97f0fd76ab424ff7728f64819816f	{"name": "cache/19/17/19175146262a3a7af97c19d73a2bfa93.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 853]}
sorl-thumbnail||image||c6471003ba347cdba6d402484839d419	{"name": "cache/1c/42/1c4230c48811640eba076dd9a8d41d0e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||cca27d1a6a74e08771ae98e5a420aa7b	{"name": "cache/b6/c6/b6c6af2f76ae3f35cd8d3f22602be71b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 353]}
sorl-thumbnail||image||9d5e5de0388beabc912c19d2b760c6ca	{"name": "cache/b6/fe/b6fe90d01636c4c50a96f9715954b52d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 424]}
sorl-thumbnail||image||dda581d7b82ffff4764b09dfcbb57f52	{"name": "cache/72/47/724719c52dc5695b13c0d7b3b86ce048.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1810]}
sorl-thumbnail||image||ec9c95a77b759649996d98923270fc60	{"name": "cache/4f/b4/4fb4849b744d2f87635a5be67c99cce2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||3c51ad28f9bb5431b21eb80c5f5ffc2f	{"name": "images/posts/pilkarzeakadamiihutnikakrakowwracajadotreningow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [816, 462]}
sorl-thumbnail||image||0b902470f6e0be5179a97da133b0801a	{"name": "cache/3e/4f/3e4f9f152cc0b9bb02403925b076b4f5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||7e998ccb9b5554eec1685fb54eb98754	{"name": "cache/81/e6/81e6b6ef6b46348787c9eda731397046.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 340]}
sorl-thumbnail||image||ac7c48e2eaac1f21c3f37d6af537eb4d	{"name": "cache/35/f8/35f8b6df4a462a05064b7ab64ed83ff7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 400]}
sorl-thumbnail||image||c476f07053824142f1955d258c705dbb	{"name": "cache/4e/b0/4eb0744d3adb9dc9ac907484ff04cd3d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||b11e16d35fc021213fb24d6cffd80b62	["63e39bc93b21f439062bf864b0d7de30", "11a07d33a982531c628ed43796bc6375", "c476f07053824142f1955d258c705dbb", "511cb5dd9a282d60f0cd86cf8e4733e3", "e196d387915823a1044234c4ee9194a4", "6ad1d9b2ddb5ea7e3adf5e271a783b12"]
sorl-thumbnail||image||4ac8dfca634e1cca2c220ef92832f5c3	{"name": "cache/36/d8/36d8713b384d26049d1f1845c1691cfd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 725]}
sorl-thumbnail||thumbnails||3d5a2ab8129e1a9cc6573dae7c298f8a	["53704ea8c0e76ee1ccd37def2788833e", "ac7c48e2eaac1f21c3f37d6af537eb4d", "8dbb8fb5525fc3c2b29a623b82ff9cfb", "cf7465235e8a58ebefbeb79824bf12b5"]
sorl-thumbnail||image||5f24ce99ecced6244ad346e7b2191675	{"name": "cache/72/42/72427dbb822e68a79249deef8ec3ff4f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 226]}
sorl-thumbnail||image||39c1972b91f80f2f7e209e26b7d26252	{"name": "cache/eb/86/eb86773f63849988a41cbd2633821421.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||46d9bdd1023111a7f953a44ac74642f3	{"name": "cache/ae/65/ae65f49569757a89b8c27fd23d3177ad.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||2031388e69a2462b130ed3b18dfb634e	{"name": "users/2020/06/22/IMG_20200616_180340_o15QA4D.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||0bb86311a6f17c39daab12359fb277ef	{"name": "cache/0a/27/0a27579e6536356c3daa5e79a4cf5051.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||thumbnails||2031388e69a2462b130ed3b18dfb634e	["0bb86311a6f17c39daab12359fb277ef"]
sorl-thumbnail||image||1a269dea71a04aa13a99870990c91d74	{"name": "users/2020/06/22/IMG_20200616_180340_o15QA4D_aI7oZmm.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||90f2074ed3b7f53697951cab5224acd5	{"name": "cache/46/27/4627f36321346bdcf92558274541bccd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||35a92da7937c5916b5a78fc4af0f766e	{"name": "images/posts/podziekowaniadlaakademiipilkarskiejhutnikakrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1081, 589]}
sorl-thumbnail||image||37d2a2ea375d472b6955839ca66394ad	{"name": "cache/d3/6d/d36d23521f250459077a4e5151f4b395.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||5e37f4190a8f24cbd8c38b2f6f95f265	{"name": "cache/68/f0/68f06c6e90e7f66a1b7751a2833bcd8d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 136]}
sorl-thumbnail||image||427924e599cc4e0cc8ef2a8dc5a2a72b	{"name": "images/posts/pizzeriadonrobertowspierapilkarzyakadmiihutnika.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [349, 144]}
sorl-thumbnail||image||68d21a7cc86ed1e192442594a4eba695	{"name": "cache/3d/59/3d591a3f3c232ae1f6a1aebf743a10ae.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 142]}
sorl-thumbnail||thumbnails||3c51ad28f9bb5431b21eb80c5f5ffc2f	["4ac8dfca634e1cca2c220ef92832f5c3", "0b902470f6e0be5179a97da133b0801a", "5f24ce99ecced6244ad346e7b2191675", "7e998ccb9b5554eec1685fb54eb98754", "68d21a7cc86ed1e192442594a4eba695"]
sorl-thumbnail||image||e2b1e91138ef7aef8a4108734a7ebb7b	{"name": "cache/c2/16/c216f564695eb9967df2ffb140d948d1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 327]}
sorl-thumbnail||thumbnails||35a92da7937c5916b5a78fc4af0f766e	["e2b1e91138ef7aef8a4108734a7ebb7b", "5e37f4190a8f24cbd8c38b2f6f95f265", "37d2a2ea375d472b6955839ca66394ad"]
sorl-thumbnail||image||887e8c87087da8c65eb907de5d70a896	{"name": "cache/c2/3c/c23c2087910d836db46182814856a3b3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||3d5a2ab8129e1a9cc6573dae7c298f8a	{"name": "images/posts/wirtualnafutmalligazpilkarzamiakademiihutnika.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 854]}
sorl-thumbnail||image||cf7465235e8a58ebefbeb79824bf12b5	{"name": "cache/d0/20/d0200730d05dd577999b7c283f81deb1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||7980d93b526fe14ec374f47049b3607d	{"name": "cache/cc/8f/cc8f1161d28539d9e9f0e5dbb5824191.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||95cfe1d8274cfeeebcf120151fef1079	{"name": "cache/bb/e1/bbe1d115548cc4c5518b7449b9c705a5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 248]}
sorl-thumbnail||thumbnails||427924e599cc4e0cc8ef2a8dc5a2a72b	["396bfbb697cdb6c53db47f7024f34d6a", "7a6b5bc4fbec8b32ad7a1c3fb1c3b57e", "7980d93b526fe14ec374f47049b3607d", "95cfe1d8274cfeeebcf120151fef1079"]
sorl-thumbnail||thumbnails||1a269dea71a04aa13a99870990c91d74	["887d14c825aa7b11b3c0356974f1a70e", "90f2074ed3b7f53697951cab5224acd5", "0af1368fe5e634b6176ad0f268728fc2"]
sorl-thumbnail||image||cb57b1db561e0bcf2b46963ef91886af	{"name": "cache/98/07/98079c187ce758f4c766660fe9404983.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||5b3e75c3b7a677949185b0821dff38ca	["dda581d7b82ffff4764b09dfcbb57f52", "c6471003ba347cdba6d402484839d419", "ec9c95a77b759649996d98923270fc60", "cb57b1db561e0bcf2b46963ef91886af", "9d5e5de0388beabc912c19d2b760c6ca"]
sorl-thumbnail||image||8dbb8fb5525fc3c2b29a623b82ff9cfb	{"name": "cache/c3/09/c3093b2d0217430bce9c2f3e506a079c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 854]}
sorl-thumbnail||image||53704ea8c0e76ee1ccd37def2788833e	{"name": "cache/df/63/df6324946f7c8db731867c93c6185786.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 267]}
sorl-thumbnail||image||396bfbb697cdb6c53db47f7024f34d6a	{"name": "cache/e6/aa/e6aae3c98293b0281d73ed6f33e4a02b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 528]}
sorl-thumbnail||image||7a6b5bc4fbec8b32ad7a1c3fb1c3b57e	{"name": "cache/25/be/25be9bb3ab5219a4d61f564d0b459c75.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 165]}
sorl-thumbnail||image||96ef0468f557f86547e2d259270def4b	{"name": "images/posts/pizzeriadonrobertowspierapilkarzyakadmiihutnika_0JDzXr1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [349, 144]}
sorl-thumbnail||image||f26195a1d0c9fa8b59797a483992da5b	{"name": "cache/5c/96/5c960ee092ebadb8f93e102f1cd3ba41.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 248]}
sorl-thumbnail||image||f29a11059e18a42df3dffdb031b7c211	{"name": "cache/82/cb/82cb8f17cbfd09147e41b8ba37fe4d35.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||0d7f96612aa837dfd5e48a53b77afc28	{"name": "images/posts/wirtualnafutmalligazpilkarzamiakademiihutnika_OAM7BIk.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 854]}
sorl-thumbnail||image||3ead1d08278cd9f292432e478184926c	{"name": "cache/5f/6c/5f6cf4828c4a83f0fed909b246ebc33d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||f8dbe9b63a5ef9de250e21b0ea0b3ae7	{"name": "cache/bb/f0/bbf0229dd196b0443ef574562bdd74eb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 167]}
sorl-thumbnail||thumbnails||95261c1961899dfa4ea740cbb56ff5ce	["cbcdfd70ed331081d30e0bb01200ea1a", "75170b883e03fc52ee59862a5c36db7e", "0d4fc0afc22c61bb2c3327c5166f22a8", "ef92911ef1e14c2748647d02280de601", "047aa0d78ce6bf902ff82279e238e93b"]
sorl-thumbnail||image||5127cb4721c614f63c45f5252cbf0f38	{"name": "cache/c2/db/c2db66632d866eafe37f0ff6b1a1c2ef.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 103]}
sorl-thumbnail||thumbnails||96ef0468f557f86547e2d259270def4b	["f29a11059e18a42df3dffdb031b7c211", "f26195a1d0c9fa8b59797a483992da5b", "5127cb4721c614f63c45f5252cbf0f38"]
sorl-thumbnail||image||14e920570964c60300e0350d424d180e	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||116e67715b312e639a028746295ae693	{"name": "cache/12/8d/128d73a6e2a75ddae0033341894a8292.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||14e920570964c60300e0350d424d180e	["116e67715b312e639a028746295ae693"]
sorl-thumbnail||image||31bb2786717c42956535c0bc0495eb27	{"name": "cache/1d/51/1d51347036a31796cfc7c4bfe83ad494.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 400]}
sorl-thumbnail||thumbnails||0d7f96612aa837dfd5e48a53b77afc28	["3ead1d08278cd9f292432e478184926c", "31bb2786717c42956535c0bc0495eb27", "f8dbe9b63a5ef9de250e21b0ea0b3ae7"]
sorl-thumbnail||image||8e95c00cd3031aab95e7da67583af347	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||7c07db6a44540563d5108af5cc274eb9	{"name": "cache/a3/46/a346d6240536319f811c4723e365154a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [600, 450]}
sorl-thumbnail||image||d37d332d277a0c53a78943d7e5367a7a	{"name": "images/posts/pilkarzeakadamiihutnikakrakowwracajadotreningow_2qrfjh5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [816, 462]}
sorl-thumbnail||image||3a078232c7e14179e616af4feb42ed3f	{"name": "cache/67/9c/679cbab5bde86c1bf988e8feaaae9c0f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||a984bd22c2c1253478734a05472c3d17	{"name": "images/posts/podziekowaniadlaakademiipilkarskiejhutnikakrakow_frfuIce.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1081, 589]}
sorl-thumbnail||image||df3116a69f0ae1194e191edc4c7619c8	{"name": "cache/ee/37/ee3735d218a2df83fe4010d5701071e2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||e30f9deaf542c34be21238b184c97b1b	{"name": "images/posts/wirtualnafutmalligazpilkarzamiakademiihutnika_OAM7BIk_hUXTgdl.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 854]}
sorl-thumbnail||image||7a5722c9ae1d577cb068fb0199a98c21	{"name": "cache/14/5b/145b39d411d6b654e91294874eb1019c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||95261c1961899dfa4ea740cbb56ff5ce	{"name": "images/posts/pizzeriadonrobertowspierapilkarzyakadmiihutnika_0JDzXr1_NcMt5fo.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [349, 144]}
sorl-thumbnail||image||cbcdfd70ed331081d30e0bb01200ea1a	{"name": "cache/e0/a4/e0a4061885fa3c540158f468b390ce36.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||e30f9deaf542c34be21238b184c97b1b	["ef6062901c96aeea2d242abc66dda5b1", "b8126c67831f37f18c71e654e3e7f3c7", "7a5722c9ae1d577cb068fb0199a98c21", "9fca3fa802ac660bca6f63686f000368", "71b13c22ca310d1048adeb82b7fc9b10"]
sorl-thumbnail||thumbnails||a984bd22c2c1253478734a05472c3d17	["ccc7945c22b233b66168878ddca0704c", "b4e5dc88a21ba9b182b668633186c06f", "4618c4901b79f602fe23de392bf0255c", "85f60bf99c754de75b821744e89d735f", "df3116a69f0ae1194e191edc4c7619c8"]
sorl-thumbnail||thumbnails||d37d332d277a0c53a78943d7e5367a7a	["de1b09c68ba7ae3744911f13b55381d9", "58b983fe3105ca971ff2bb4859e76d14", "9ee6dd906e551a3b70f0ead0364668d5", "f56bc480c170c83bf87a132c25977bac", "3a078232c7e14179e616af4feb42ed3f"]
sorl-thumbnail||image||75170b883e03fc52ee59862a5c36db7e	{"name": "cache/1b/42/1b42e09bd8f7844e677516c6659ae55b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||ef6062901c96aeea2d242abc66dda5b1	{"name": "cache/ea/62/ea627eb6f4cdc860e92d7d2b5aab1435.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||85f60bf99c754de75b821744e89d735f	{"name": "cache/b5/de/b5dec1324d1c3cf16009233640bd26b9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||58b983fe3105ca971ff2bb4859e76d14	{"name": "cache/77/7f/777f31774c3902a016e5fbfd297cfccd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||d0e688e53cba1f5c91b9e4dd854a4d26	{"name": "cache/46/67/466764f742760ed210b412aef67d6fc0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||9cad9bd3dc0ae38e8f5c08ee6e54390c	{"name": "cache/fd/7c/fd7c1ef45dced467afa30a19172d10fa.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||a53521bef3f94d703cfd44c31b2259d1	{"name": "images/stadionhutnikakrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [512, 295]}
sorl-thumbnail||image||6382aa3495e5118f058749ca9b432b7c	{"name": "cache/0b/0b/0b0b09e69d379a7dc7161c34201c1f74.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||dcb91c26c7f2ccfa24c3ddbe3df16844	{"name": "cache/c2/dc/c2dc7fd6ee23c9f7e30d027bca9ce9d3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||b6140d99d7a2c030b7f0615d1dcfc371	["65b0da3b9927857a8fb01579dcc9132e", "3b727bd64edf47545072fb2061576962", "dc5104ab9d295fa106a805416b324b60", "975da3343a6ed0dc45cb1354ec900a8e"]
sorl-thumbnail||image||8e0bc83a11bfee1eeb3e44abadf276a2	{"name": "images/widokzlotuptakanastadionhutnikakrakow.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 599]}
sorl-thumbnail||image||e19bb2511a7cc905a37925be551bf712	{"name": "cache/7b/e7/7be78d598e779fa229bac5228098b3ee.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||a55a8ed1acdd8b245d24b1a9f62a36b9	{"name": "cache/fa/0d/fa0dd8e2ded27f4842fd8f2d0bc706ac.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||1e4519ca569e8d8e9c03ca58e82d899a	{"name": "cache/6e/8a/6e8a79b96b1ac86d29457e32b61da035.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [280, 240]}
sorl-thumbnail||thumbnails||053c00ac94f6241b4e03e38d9c2e81cc	["e795d6beb606a5aa47ed856a7c665f48", "f4c320163bfe866338dd8e8b3b0a1515", "e12d3c6614c0e667285470cce3fde29e", "bf9ed54255495cbc192bea4f3a9469f1", "1f02115c6e45a3d29c8c012fc7af3756"]
sorl-thumbnail||image||36abeb484b8582c4ae44ae254fbda881	{"name": "cache/7e/99/7e99aad3b33130652715bf0143627da5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 120]}
sorl-thumbnail||thumbnails||8e0bc83a11bfee1eeb3e44abadf276a2	["36abeb484b8582c4ae44ae254fbda881", "e19bb2511a7cc905a37925be551bf712", "a55a8ed1acdd8b245d24b1a9f62a36b9", "1e4519ca569e8d8e9c03ca58e82d899a"]
sorl-thumbnail||image||5ea068183d48ee05a41d9fbe12ea2b04	{"name": "cache/13/ab/13ab965860db6675518785ccbe2803f3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [280, 240]}
sorl-thumbnail||thumbnails||77aa0b666f7ee1de8befb6660aa20529	["3302708003497c891dee6d240958f27a", "9d8228e566a7569354ae79c14e0c23de", "b2ae6500d0eab5b44ef8d85c6c2a24b4", "8e266a8109f482eab94544aba7480998", "02f05c3a3ab7d5d0c4ecdedae4e94d3f"]
sorl-thumbnail||image||8c29c184920f3b27740e19a5540ebfc4	{"name": "cache/6f/f9/6ff93c6396a6dd06f089a6576ac10987.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 120]}
sorl-thumbnail||thumbnails||a53521bef3f94d703cfd44c31b2259d1	["8c29c184920f3b27740e19a5540ebfc4", "dcb91c26c7f2ccfa24c3ddbe3df16844", "5ea068183d48ee05a41d9fbe12ea2b04", "6382aa3495e5118f058749ca9b432b7c"]
sorl-thumbnail||image||8545c5083e46d9d1ab54eadc61e209b4	{"name": "cache/2d/16/2d16aae2df1331d7b6e8c5ac8196c63b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||b6140d99d7a2c030b7f0615d1dcfc371	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||dc5104ab9d295fa106a805416b324b60	{"name": "cache/3d/69/3d69d90dadc728c8c96aa07119a2cc56.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||053c00ac94f6241b4e03e38d9c2e81cc	{"name": "images/posts/nowynabordodruzynyskrzatowakademiipilkarskiejhutnikakrakow_MMRhddp.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [780, 520]}
sorl-thumbnail||image||e12d3c6614c0e667285470cce3fde29e	{"name": "cache/e4/b7/e4b70e2129648dcc314bb31db2affc30.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 167]}
sorl-thumbnail||image||77aa0b666f7ee1de8befb6660aa20529	{"name": "images/posts/treningiindywidualneumiejetnoscipilkarskichwakademiipilkarskiejhutnikakrak_igj3SD5.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [679, 960]}
sorl-thumbnail||image||8e266a8109f482eab94544aba7480998	{"name": "cache/d2/f2/d2f29d77b4a3acd736e88ee30c8af60b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 353]}
sorl-thumbnail||image||9ee6dd906e551a3b70f0ead0364668d5	{"name": "cache/38/bd/38bdda4dfa2049859f8d69ac7c8b9f77.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 142]}
sorl-thumbnail||image||4618c4901b79f602fe23de392bf0255c	{"name": "cache/b9/0b/b90babcd6b4dc39c40e8f071ab0f5efc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 136]}
sorl-thumbnail||image||71b13c22ca310d1048adeb82b7fc9b10	{"name": "cache/55/e4/55e4c408d6b5dac86528fe794f9fe903.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 167]}
sorl-thumbnail||image||047aa0d78ce6bf902ff82279e238e93b	{"name": "cache/de/56/de564493afb90812215003af635aa0ef.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 103]}
sorl-thumbnail||image||0d4fc0afc22c61bb2c3327c5166f22a8	{"name": "cache/67/da/67daa3a3ab56cc0216818a51a42d7953.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 528]}
sorl-thumbnail||image||ef92911ef1e14c2748647d02280de601	{"name": "cache/52/cf/52cfb857d75c11a6315507298c68f77d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 165]}
sorl-thumbnail||image||f487d8f2dde30148f2ff04c783a67cc4	{"name": "images/pizzeriadonrobertowspierapilkarzyakadmiihutnika.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [349, 144]}
sorl-thumbnail||image||252444067884d414f5b383bdb50dc752	{"name": "cache/0c/bb/0cbb39bd7c35ead28b1fee3627974513.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 150]}
sorl-thumbnail||image||4213cecfa277aced5e28107b4a7884be	{"name": "images/logomiktelkrakowmichalpielak.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 200]}
sorl-thumbnail||image||3b830fc5180c60382d4fd1ee129a932b	{"name": "cache/52/96/529624fdc8376cd477f6c77916bb912d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 150]}
sorl-thumbnail||image||48c956c47a4903bcb546b20e9a6752e9	{"name": "cache/d6/69/d6699198c546daa320545a5651ffbbf3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 150]}
sorl-thumbnail||thumbnails||f487d8f2dde30148f2ff04c783a67cc4	["48c956c47a4903bcb546b20e9a6752e9", "252444067884d414f5b383bdb50dc752"]
sorl-thumbnail||image||d2dc2434f710144bc5b492a189779ffe	{"name": "cache/2b/6b/2b6bd64bc78853163af1c77a339d0a44.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 150]}
sorl-thumbnail||thumbnails||4213cecfa277aced5e28107b4a7884be	["d2dc2434f710144bc5b492a189779ffe", "3b830fc5180c60382d4fd1ee129a932b"]
sorl-thumbnail||image||20ab61194fb584edf4900cc4e29fdf07	{"name": "cache/a9/59/a9597f97ec9a28e964d4507678454ee6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||8e95c00cd3031aab95e7da67583af347	["8545c5083e46d9d1ab54eadc61e209b4", "20ab61194fb584edf4900cc4e29fdf07", "9cad9bd3dc0ae38e8f5c08ee6e54390c", "7c07db6a44540563d5108af5cc274eb9", "d0e688e53cba1f5c91b9e4dd854a4d26"]
sorl-thumbnail||image||975da3343a6ed0dc45cb1354ec900a8e	{"name": "cache/72/b4/72b4ec67155d37e2d1e8b9ab6db7ce7d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||bf9ed54255495cbc192bea4f3a9469f1	{"name": "cache/a0/e8/a0e88c0dd4fec345dbd99e9ba50c4f44.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||b2ae6500d0eab5b44ef8d85c6c2a24b4	{"name": "cache/44/b6/44b69330ad23fc8342f19522c7116452.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||bf06bed18f43f867c7ae61696b369a3d	{"name": "cache/11/9b/119b7e0c569f2e3eae556d8b87cf4a6a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [240, 200]}
sorl-thumbnail||image||646fe0f37bbf108ef2aceec587785e0d	{"name": "users/2020/06/22/Micha\\u0142_Pielak.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [513, 684]}
sorl-thumbnail||image||3bde206f9b13a41461d7b9dabe02f3dc	{"name": "cache/ef/c2/efc2e232546dcf5983162dacff724be0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||f740ec088167d258acf6936fd89efa14	{"name": "cache/7c/71/7c71bde2e903b96180296b558e85d602.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 240]}
sorl-thumbnail||image||99a038375c8ca4208c5edf21ce7b04ef	{"name": "cache/85/ae/85aea57756516264d5a99fc0ac3032f2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [90, 120]}
sorl-thumbnail||image||5c7ee91eeb3bd349bb02e333ef0f45cf	{"name": "cache/34/fd/34fd3087bcd695855d6a2f6b01636d0f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||8b1f463437a17d14e4f218cd28c0d695	{"name": "cache/4f/63/4f634f039e77654cc9916d5c57db09af.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||thumbnails||646fe0f37bbf108ef2aceec587785e0d	["5c7ee91eeb3bd349bb02e333ef0f45cf", "99a038375c8ca4208c5edf21ce7b04ef", "f740ec088167d258acf6936fd89efa14", "8b1f463437a17d14e4f218cd28c0d695", "3bde206f9b13a41461d7b9dabe02f3dc"]
sorl-thumbnail||image||b8126c67831f37f18c71e654e3e7f3c7	{"name": "cache/85/41/8541eead4fb33c6443540642b1fb72ad.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 854]}
sorl-thumbnail||image||1f02115c6e45a3d29c8c012fc7af3756	{"name": "cache/20/db/20db7e5c849afcf2196e34e552ba3f81.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 853]}
sorl-thumbnail||image||e795d6beb606a5aa47ed856a7c665f48	{"name": "cache/3d/ed/3ded94b6c102eb8e341fd421699cda63.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 267]}
sorl-thumbnail||image||9fca3fa802ac660bca6f63686f000368	{"name": "cache/ac/dc/acdc85ccca874145e9c7fe68561bf0eb.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 267]}
sorl-thumbnail||image||f56bc480c170c83bf87a132c25977bac	{"name": "cache/cd/f9/cdf925af6b57bf93333e40f80884920c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 725]}
sorl-thumbnail||image||de1b09c68ba7ae3744911f13b55381d9	{"name": "cache/45/16/451626e15c716357d67e8c63f5387cd6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 226]}
sorl-thumbnail||image||65b0da3b9927857a8fb01579dcc9132e	{"name": "cache/a9/f3/a9f3002d2fc3ab8800f275aef24788b7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1812]}
sorl-thumbnail||image||ccc7945c22b233b66168878ddca0704c	{"name": "cache/32/0d/320d59d32399b89e5d9a7d1c0937ff63.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 697]}
sorl-thumbnail||image||3b727bd64edf47545072fb2061576962	{"name": "cache/fc/ee/fceeff7fb8f45861f4b3147d688548c7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||b4e5dc88a21ba9b182b668633186c06f	{"name": "cache/8a/3c/8a3c830ea77b194642d1455b890a6dbe.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 218]}
sorl-thumbnail||image||9d8228e566a7569354ae79c14e0c23de	{"name": "cache/d8/9e/d89e0bbcb47a7578fdaac606467ad35f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1810]}
sorl-thumbnail||image||02f05c3a3ab7d5d0c4ecdedae4e94d3f	{"name": "cache/e8/2f/e82ffead6782cbd114c613b5b9d29bc8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||887d14c825aa7b11b3c0356974f1a70e	{"name": "cache/78/9a/789ae55656007085b45942d3d804c6e3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||0af1368fe5e634b6176ad0f268728fc2	{"name": "cache/c2/59/c259af3f4e6b3cbc3f4deae7f78570ab.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||image||b756e8d1a705c9d275212231148f49af	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3bDc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||ef11df70091ff1df97b2afdda677ebe1	{"name": "cache/6b/ac/6bacd95add26645dacba66442cf07cb9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||de99ae2813012702d185cfeb2a5237ab	{"name": "cache/09/4b/094be72c9b4035c97caba3aed2879bb2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||0d544f5569be49720a6a69e0733ef099	["8da45a7b2bc9ca18a6c722ade41bebe1", "e367a69ee7ad8c40f7ab086d62c80fe1"]
sorl-thumbnail||image||53fd137eb255e4d536c20a70c262133c	{"name": "cache/ac/f0/acf05b5571eea8df227119c8d35287ef.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||06d12aa2b103eee260ea24765719176e	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_YeecM5a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||260e4e8fd087ce517b2bcd5859d4f815	{"name": "cache/ba/d2/bad2e1c8634989373c72504818f0fca2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||thumbnails||b756e8d1a705c9d275212231148f49af	["53fd137eb255e4d536c20a70c262133c", "ef11df70091ff1df97b2afdda677ebe1", "de99ae2813012702d185cfeb2a5237ab", "260e4e8fd087ce517b2bcd5859d4f815"]
sorl-thumbnail||image||7aa755773b5df5b67bbac8f056e2cbf1	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||033817d967ce2f58d76bdbf3918ca972	{"name": "cache/64/44/644476bf6da72d136d0d200b666e40bc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||a79fe063fced75bf362dc57da4cee9a7	{"name": "cache/63/a7/63a76baf1562358dbdf8ffcfec5bb66e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||14e006b883ca0ddec3ed3b6121579e68	{"name": "cache/85/90/8590086e7ae2b6f8181a012e711e3823.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||fa4c9418f75bedf97d714b3966bcb44d	{"name": "cache/18/94/189404d114ed81be99a5f07263408b4c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1812]}
sorl-thumbnail||image||c647821092b2f25def17ddbd433e636e	{"name": "cache/2d/a2/2da2ecdfb610c3b20d8b78ec6e851666.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||thumbnails||7aa755773b5df5b67bbac8f056e2cbf1	["a79fe063fced75bf362dc57da4cee9a7", "033817d967ce2f58d76bdbf3918ca972", "c647821092b2f25def17ddbd433e636e", "fa4c9418f75bedf97d714b3966bcb44d"]
sorl-thumbnail||image||277d099cfd5e0e1fd4f9d05e67b26f65	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q_wxPGunm.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||57698c091e7cd93de107a0d30557f550	{"name": "cache/d3/0d/d30d8f2dfbfb3db2b555b4941723324e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||edf02399d2224f93dc01550608c0b07f	{"name": "cache/13/7f/137f46c56d30f508761b0a7d780bc6d0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||277d099cfd5e0e1fd4f9d05e67b26f65	["57698c091e7cd93de107a0d30557f550", "edf02399d2224f93dc01550608c0b07f"]
sorl-thumbnail||image||59907d194d768bb1b84db0ced0521786	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q_wxPGunm_PFqcfHL.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||992a7464ae9312b1f7919a185c52ebdc	{"name": "cache/13/98/1398fa05e35c4e3cf4623ab22bf33cf5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||57362c6374f9de21f4e1b4d7d1e1ef22	{"name": "cache/58/98/5898c6f16cf06bb5a667c7a1e39b1874.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||59907d194d768bb1b84db0ced0521786	["57362c6374f9de21f4e1b4d7d1e1ef22", "992a7464ae9312b1f7919a185c52ebdc"]
sorl-thumbnail||image||0d544f5569be49720a6a69e0733ef099	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_Bgl5pS2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||e367a69ee7ad8c40f7ab086d62c80fe1	{"name": "cache/76/11/761123633f542e2108ab22014c97c91c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||8da45a7b2bc9ca18a6c722ade41bebe1	{"name": "cache/71/06/7106f3c40c17fa74f8b75d8f8bf049eb.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||3d97f9bc518e2751b7a8765fb153deef	{"name": "cache/ac/6e/ac6eefdea06373d9d901790175afdd88.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||06d12aa2b103eee260ea24765719176e	["3d97f9bc518e2751b7a8765fb153deef", "14e006b883ca0ddec3ed3b6121579e68"]
sorl-thumbnail||image||efc09aaebf24aed5660d3f3258e2d6f6	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_om8uRTR.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||05de2b0e1306d2e241b69ccf678c2497	{"name": "cache/7f/ae/7faefb988707475a6439cd072a1d646e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||ce7459085afbb34b57aa811e32af49c6	{"name": "cache/84/c3/84c39d979a95552d440f96cff4b2c318.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||efc09aaebf24aed5660d3f3258e2d6f6	["05de2b0e1306d2e241b69ccf678c2497", "ce7459085afbb34b57aa811e32af49c6"]
sorl-thumbnail||image||4175058c863750eef2f23082aa73c6c2	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_wQPHyfY.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||c0a63fa331f0857d3539f301e2f6cb5a	{"name": "cache/ec/7e/ec7e36695c332ad8e2ecbbce2eb4a250.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||82e4821253af8d6554ba9b7276518509	{"name": "cache/84/fa/84fa0e87bcd4d13b158046903e42dd6d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||4175058c863750eef2f23082aa73c6c2	["c0a63fa331f0857d3539f301e2f6cb5a", "82e4821253af8d6554ba9b7276518509"]
sorl-thumbnail||image||138d631446f087066d46581b1cfb2e29	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_xoFZmui.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||bd49df70cea449a5331732789d0ee089	{"name": "cache/9f/0b/9f0b5eaf0664448f4b98d1048aa19da6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||8b855fc31cddc02778ee6ac0585ba86c	{"name": "cache/9c/bb/9cbb1716adcad8ae4e4b80724e7bd93f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||138d631446f087066d46581b1cfb2e29	["8b855fc31cddc02778ee6ac0585ba86c", "bd49df70cea449a5331732789d0ee089"]
sorl-thumbnail||image||d736e06252d08d43dc893b8f98a6af10	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_xfEIgPG.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||739ebefcda36f7fdcf34b2ea3cf37ad0	{"name": "cache/b2/ce/b2ceea9021782c3d127cc871624fc49b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||927994ed41893c1ca97a19f765d2dbfc	{"name": "cache/03/79/0379cd16bf0c64c36eedae9838ee6aeb.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||d736e06252d08d43dc893b8f98a6af10	["739ebefcda36f7fdcf34b2ea3cf37ad0", "927994ed41893c1ca97a19f765d2dbfc"]
sorl-thumbnail||image||56abe3defc6a53858e5e8787cfa530b7	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_qLZzQ8b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||4f5f9a539ac42fcc674902f82f25828e	{"name": "cache/02/28/02286285f13102e7f9bd32d317186afe.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||0ce88961d0109d38db5f4dd6ff1cbd16	{"name": "cache/31/d3/31d3b3b50e48a6b8b750c8b86058351f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||56abe3defc6a53858e5e8787cfa530b7	["4f5f9a539ac42fcc674902f82f25828e", "0ce88961d0109d38db5f4dd6ff1cbd16"]
sorl-thumbnail||image||03780ce4e80feea0eb3bd036f61d4ba4	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_iupxlAe.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||c54ed6e9e00a25236aa4e659b93a8f34	{"name": "cache/3b/06/3b069b5060a8a8458a6b04a24aa9d15f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||image||5897ccf09800fcaacaaa65b0568cdb72	{"name": "cache/43/30/433008cd63671e48475eaac2307d9917.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||03780ce4e80feea0eb3bd036f61d4ba4	["bc40dc0a4454c0c2cdddef3fd0aea81c", "c54ed6e9e00a25236aa4e659b93a8f34", "5897ccf09800fcaacaaa65b0568cdb72", "ee05e0aa666d8c985e0c426312d45c94"]
sorl-thumbnail||image||9e36e5f933f1bddd9efd41a13606d0b5	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q_wxPGunm_PFqcfHL_3VQ8lEh.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||5140eedf37b35337cd3e7e6b8e480b53	{"name": "cache/db/fe/dbfe09cfd168eeee470d3b524cd34b7f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||3c1759adfa6819a22de0766bba8a5997	{"name": "cache/30/be/30be5ea3198a4c616f01523b764a9b03.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||thumbnails||9e36e5f933f1bddd9efd41a13606d0b5	["3c1759adfa6819a22de0766bba8a5997", "5140eedf37b35337cd3e7e6b8e480b53", "88273a23b15bcf4cc4b126c9f1ebec51", "e1466dda6c6417fec16b45b3d067d57b"]
sorl-thumbnail||image||88273a23b15bcf4cc4b126c9f1ebec51	{"name": "cache/d3/cf/d3cfc3707b29600cfa94b6387c2b94a6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1812]}
sorl-thumbnail||image||fdc9fdeb229f7809e8a24a3239722e6e	{"name": "cache/c5/fb/c5fb4d05745f52d05f606a6c9ce87bf0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 354]}
sorl-thumbnail||image||e1466dda6c6417fec16b45b3d067d57b	{"name": "cache/3f/89/3f89fa9d165eefc861a04336e69f3e5d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||17f72ee16e882071f733136c41757204	{"name": "images/posts/nowynabordoakademiipilkarskiejhutnikkrakow_nxhowpj_XeOPd6Q_wxPGunm_PFqcfHL_x5m914s.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [678, 960]}
sorl-thumbnail||image||5af62945630be08779cd065cacb28854	{"name": "cache/7a/51/7a517b1dd9822e3bb288e0f3c746019d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1812]}
sorl-thumbnail||image||0b083469279459461b8855b6f00791c6	{"name": "cache/f1/e5/f1e59660befbe330fddab884c6a93d33.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 566]}
sorl-thumbnail||image||8c1314be8ade7fea8d279befceff2882	{"name": "cache/ba/87/ba8799cceaa2d1c25ab06785852b3993.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||ee05e0aa666d8c985e0c426312d45c94	{"name": "cache/b8/93/b893dc9160dac36cdd2a2284b3647125.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||bc40dc0a4454c0c2cdddef3fd0aea81c	{"name": "cache/6d/1c/6d1c30f53c8eb83411ffa06c99ab8ee0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||fbecc718c2c94558a1cd0e844635df85	{"name": "images/posts/udanywysteppilkarzyakademihutnikawturniejuskawinkacup_qaBsa1A_QUtjV86_FUh3_GFmGnPy.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 720]}
sorl-thumbnail||image||af45d95794172aca71555d307d821889	{"name": "cache/60/00/600003155f01d451263c783608f7404c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 960]}
sorl-thumbnail||image||e4e943cd592b179f89cd984a9f1b805c	{"name": "cache/38/59/385919c89195495c785bd0edce2100a9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||f6ec95944b3d025d16fd13f8b3ff0096	{"name": "images/FB_IMG_1601888880424.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [720, 960]}
sorl-thumbnail||image||e815a991914cbf9181549f38cae86c61	{"name": "cache/3c/0e/3c0e6f4ddf964af70beaab33e33af792.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||83639e49c693806f8b47536b4a393f3f	{"name": "cache/a6/c6/a6c6da25ae5c2cb8f9b88f498a6a56a3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 853]}
sorl-thumbnail||image||ffd82a9f294c8c385d90e639a3f3c804	{"name": "cache/d7/95/d7953f136360c9d37f667820959f729d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 188]}
sorl-thumbnail||thumbnails||fbecc718c2c94558a1cd0e844635df85	["ffd82a9f294c8c385d90e639a3f3c804", "e4e943cd592b179f89cd984a9f1b805c", "e815a991914cbf9181549f38cae86c61", "af45d95794172aca71555d307d821889"]
sorl-thumbnail||image||6c537d82f5678e3131698dbc9e1e88c7	{"name": "users/2020/06/25/Micha\\u0142_Pielak.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [513, 684]}
sorl-thumbnail||image||2d9ce9687a3cbd10dee6eeab1e6f74d2	{"name": "cache/ba/25/ba25c6791c8644822366d1114a217fea.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [200, 300]}
sorl-thumbnail||image||db21e015d4c375e2828ee6464fab195e	{"name": "cache/2b/2b/2b2b9735202643d6bc4fb56c83c7027b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 1280]}
sorl-thumbnail||image||b8ef0c0c4ba3590597e147caf675cb07	{"name": "cache/39/c7/39c7590ab69ef6db650890bb2b477b30.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 533]}
sorl-thumbnail||thumbnails||6c537d82f5678e3131698dbc9e1e88c7	["2d9ce9687a3cbd10dee6eeab1e6f74d2", "b8ef0c0c4ba3590597e147caf675cb07", "db21e015d4c375e2828ee6464fab195e"]
sorl-thumbnail||image||45d63f97a11effc0805f9ede935f0bb2	{"name": "images/posts/FB_IMG_1601888581240.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [940, 788]}
sorl-thumbnail||image||f077b89ed33640fa7d9a86f503ad372b	{"name": "cache/58/f3/58f3a468372910189edc72c5b221b92a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||8deb871d63976f6072802fadd2dd341c	{"name": "cache/63/7e/637ed82abb065dc671866e7125b0645d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 210]}
sorl-thumbnail||image||b5d830cd1e438076f18eb5dcb82c3fe3	{"name": "cache/f1/73/f173316d2ca0084d0c072870b851488e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 353]}
sorl-thumbnail||image||045c0dbfdc25ac79aebb116529ea4309	{"name": "cache/1e/86/1e86bd04b82fec336770e8f9ba2a8695.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1073]}
sorl-thumbnail||image||864037a3f1263f6ea55f0e209ed2cd6d	{"name": "cache/10/d2/10d232775148d72645a91dcc958a1007.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 335]}
sorl-thumbnail||thumbnails||901ceee80bc9ca979a8485f822dace46	["20a3515ded6ddf67296931696dd3e11d", "b5d830cd1e438076f18eb5dcb82c3fe3", "2868dbd881d783f5a29eeedf899ca47b", "b80a1465f0972d516a35e181a4ed077b", "721d964be5b2cc69a8deb90de5127ade"]
sorl-thumbnail||image||901ceee80bc9ca979a8485f822dace46	{"name": "images/posts/FB_IMG_1601888867552.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [680, 960]}
sorl-thumbnail||image||b80a1465f0972d516a35e181a4ed077b	{"name": "cache/14/6f/146ffe9d773622fd68031d16599e7d52.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||27b04d41fba23d935b17e2197fdd46bf	{"name": "images/FB_IMG_1601888870790.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 924]}
sorl-thumbnail||image||7da3616fcafcbd57dabc3041e4909488	{"name": "cache/2b/55/2b557b1dd4818b6bcb0e19fc07f9422c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 616]}
sorl-thumbnail||image||7008c2b1d022b2ef3809cbabbbc2bd32	{"name": "images/FB_IMG_1601888874435.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 640]}
sorl-thumbnail||image||48b27d24860ce240d3acc8249b43be96	{"name": "cache/05/0e/050efdf5cd781670f384952849802790.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 427]}
sorl-thumbnail||image||20a3515ded6ddf67296931696dd3e11d	{"name": "cache/72/ff/72ff1fb3243fe32a4a7f2930ad4d0f84.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1807]}
sorl-thumbnail||thumbnails||45d63f97a11effc0805f9ede935f0bb2	["f077b89ed33640fa7d9a86f503ad372b", "ad4a3f8c39ad495ebed4c73476bb6fcd"]
sorl-thumbnail||image||2868dbd881d783f5a29eeedf899ca47b	{"name": "cache/af/ae/afae817a30422c7401c16f3fcc5ba998.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 565]}
sorl-thumbnail||thumbnails||f6ec95944b3d025d16fd13f8b3ff0096	["686c1376ef51aaedc99aa5193bef5178", "7406328fbe44faa994a505a38d84b3b7", "83639e49c693806f8b47536b4a393f3f"]
sorl-thumbnail||thumbnails||7008c2b1d022b2ef3809cbabbbc2bd32	["7187d011398e2614974daa6580319934", "48b27d24860ce240d3acc8249b43be96", "170ebab2384ac97bad41e3163aa5583e"]
sorl-thumbnail||thumbnails||27b04d41fba23d935b17e2197fdd46bf	["a121a6e1df2745f696333143430f4f72", "9b744970996905a72f04555ea9c59eec", "7da3616fcafcbd57dabc3041e4909488"]
sorl-thumbnail||image||686c1376ef51aaedc99aa5193bef5178	{"name": "cache/6f/e4/6fe451a8bbbd7dd14953c9f6a6db10f0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 467]}
sorl-thumbnail||image||7406328fbe44faa994a505a38d84b3b7	{"name": "cache/71/9a/719a558a68445553786b5fc71f4e5361.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||170ebab2384ac97bad41e3163aa5583e	{"name": "cache/a3/49/a3499db5831bc8259ba07b701da56556.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 233]}
sorl-thumbnail||image||7187d011398e2614974daa6580319934	{"name": "cache/bf/2a/bf2a71140dbba2e153448ced97e380f7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||a121a6e1df2745f696333143430f4f72	{"name": "cache/6f/29/6f29c952c16db92436a2096b0fdaa888.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 337]}
sorl-thumbnail||image||9b744970996905a72f04555ea9c59eec	{"name": "cache/39/c4/39c44fbbe66bc5da7797190f2fb017ef.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||3302708003497c891dee6d240958f27a	{"name": "cache/31/9d/319dc9ccba13acc8b501d35cbde3cca7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||8d92f90be565db401562e122f63639e9	{"name": "images/posts/FB_IMG_1602015419411.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [564, 960]}
sorl-thumbnail||image||4255e910071f3c41190fff1884905586	{"name": "cache/13/c3/13c394539645c443d373d71b5e8683f6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||07b442b18ed19c9b68011bb16da10c8b	{"name": "cache/1a/9b/1a9bd095ed206dafb08ad44efecbd497.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 426]}
sorl-thumbnail||image||1ec201ab282bbc2fc4ba7664be47871b	{"name": "images/FB_IMG_1602766569294.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 783]}
sorl-thumbnail||image||7467e5100ffdc5ee6c250f12b3b4fba7	{"name": "cache/dc/c2/dcc2dbcbc7feb8222a6f3173137f5bf1.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 2179]}
sorl-thumbnail||image||19fa282cdc0a13a915eb663275918191	{"name": "cache/4b/a8/4ba8b1cad1441975c6efbe904093f39e.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 522]}
sorl-thumbnail||image||5d5dfe9fa96747fef6c09bb3d0da913a	{"name": "cache/c2/7e/c27e195d49ac01c656231575735061e9.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 681]}
sorl-thumbnail||image||f4c320163bfe866338dd8e8b3b0a1515	{"name": "cache/64/7b/647b596716a5d545d13d10268b707cd7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||63d78d81096c1dfd19a17cec25e07c39	{"name": "images/posts/FB_IMG_1602190851495.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [940, 788]}
sorl-thumbnail||image||8c7b764d8056473eef40658c3539614f	{"name": "cache/fd/65/fd659dcc355d08578bf85bde46762a20.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||5c189e37196a33f03f5ccc1dcf200753	{"name": "cache/13/c1/13c10f62771446bd17895023d505bc55.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 210]}
sorl-thumbnail||image||7ec0df6c0080575ca5a7c8669020e157	{"name": "cache/34/69/3469abe4ea54173dcf06d4f02e143f2a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1073]}
sorl-thumbnail||image||a4ba947ffa6e7f3cd1592a7306564533	{"name": "cache/72/d7/72d7fc5bf54357e9c75f0272b703bb9b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 186]}
sorl-thumbnail||image||793b3b17f4b638a65c26b4d42d7e7f3e	{"name": "cache/74/84/74843b0c7081413e96bdb0f6f73ed0b2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 335]}
sorl-thumbnail||image||2afe6180cf77c08a59996d6daa104915	{"name": "cache/55/13/551352695096048a26b16e27c5431565.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||17f72ee16e882071f733136c41757204	["5af62945630be08779cd065cacb28854", "8c1314be8ade7fea8d279befceff2882", "2afe6180cf77c08a59996d6daa104915", "fdc9fdeb229f7809e8a24a3239722e6e", "0b083469279459461b8855b6f00791c6"]
sorl-thumbnail||image||2655de15c38d47696b16d3075d4e8347	{"name": "images/posts/FB_IMG_1602766562741.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 715]}
sorl-thumbnail||image||f09efdf97afc06594353c42f9235ab49	{"name": "cache/9f/eb/9feb22729db8f859dbef8144228c514a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||f458e60de61db6256a16c5d0bbfdfeeb	{"name": "images/FB_IMG_1602766555383.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 701]}
sorl-thumbnail||image||865e401568d4e7dc585e242f4cc19ae0	{"name": "cache/07/73/07731d7689b321e2038d3167cc667eac.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 467]}
sorl-thumbnail||image||f2e40593fe74bf73ac246453397b4402	{"name": "images/FB_IMG_1602766559740.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 719]}
sorl-thumbnail||image||fc4c59ed20547006243be3f49d9f45eb	{"name": "cache/49/37/493737f5b3bc1548553abb8857b8c4d6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 479]}
sorl-thumbnail||image||bc0ce2fa1e1d52f51f6970e75886d907	{"name": "images/FB_IMG_1602766566322.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 769]}
sorl-thumbnail||image||636195cede81f250936057c5671dcbd3	{"name": "cache/6f/6d/6f6d2e8433de757b52644e5a79095ef7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 513]}
sorl-thumbnail||thumbnails||8d92f90be565db401562e122f63639e9	["6019298e19181efb640608d7426e16c7", "7467e5100ffdc5ee6c250f12b3b4fba7", "5d5dfe9fa96747fef6c09bb3d0da913a", "4255e910071f3c41190fff1884905586"]
sorl-thumbnail||thumbnails||1ec201ab282bbc2fc4ba7664be47871b	["ee50fee8be25c83bf0afe12b1f2e2c63", "19fa282cdc0a13a915eb663275918191", "353dd5b97aae4105e131a6bb8c55c452"]
sorl-thumbnail||thumbnails||f458e60de61db6256a16c5d0bbfdfeeb	["865e401568d4e7dc585e242f4cc19ae0", "c40f8b874f4e1b8bb56ba157abe100bc", "12a093c00807bc9e7713d71d90ff2d93"]
sorl-thumbnail||image||97c34876f2e730f46816be69fd69a7fb	{"name": "cache/75/ae/75aef17a21d779a6d6f34040ff95b6cd.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 953]}
sorl-thumbnail||image||12cdd2bb55fba4ec6cb820a2cc3f9138	{"name": "cache/95/83/9583917cf529dbf8fd1beb4c311d5e76.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 298]}
sorl-thumbnail||thumbnails||2655de15c38d47696b16d3075d4e8347	["f09efdf97afc06594353c42f9235ab49", "97c34876f2e730f46816be69fd69a7fb", "12cdd2bb55fba4ec6cb820a2cc3f9138"]
sorl-thumbnail||image||353dd5b97aae4105e131a6bb8c55c452	{"name": "cache/30/c5/30c5604080c857ede2742acc5dd1e807.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 285]}
sorl-thumbnail||image||ee50fee8be25c83bf0afe12b1f2e2c63	{"name": "cache/c8/c6/c8c6a66dcb1cb5795ea10fc6d5f77d9b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||03b931ef5b3d752176de7be66f6b1ada	{"name": "cache/40/54/40549a1fec57276e7c0c9f5c71dfd0db.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 280]}
sorl-thumbnail||image||cf24e2bcb54ce5ca82711362792af670	{"name": "cache/a1/53/a153ff591106f2199f6c92a7d2cdb680.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||a40734a0e175d57424c14b3a58185f3f	{"name": "cache/32/d4/32d43818ae62d04971ffa9b0e069a39a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 262]}
sorl-thumbnail||image||914c9c98fdbadbeed689339a67421945	{"name": "cache/cc/5a/cc5a4abaf76ad84425a4e5e15fd7d2d0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||f2e40593fe74bf73ac246453397b4402	["a40734a0e175d57424c14b3a58185f3f", "fc4c59ed20547006243be3f49d9f45eb", "914c9c98fdbadbeed689339a67421945"]
sorl-thumbnail||image||12a093c00807bc9e7713d71d90ff2d93	{"name": "cache/a8/5a/a85a21c75da0cff6bae750d8071387e7.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 256]}
sorl-thumbnail||image||c40f8b874f4e1b8bb56ba157abe100bc	{"name": "cache/83/5d/835d051556078aab3685e9304eb0938d.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||ad4a3f8c39ad495ebed4c73476bb6fcd	{"name": "cache/3e/0e/3e0e33df8e0e91754ec96a47ed40603e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||55be955fc4e99872aed018a02ea655ad	{"name": "images/posts/FB_IMG_1602773918717.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 744]}
sorl-thumbnail||image||5251a8f80cb493db0159b9d8691b1003	{"name": "cache/47/95/4795d7c8b2a70918d38e0d8209ccd350.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||9cebc03e3650913122c52795669003f9	{"name": "images/FB_IMG_1602773922012.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 728]}
sorl-thumbnail||image||6f82c00c19f5fb4a57e17e2eb54fe45e	{"name": "cache/97/9f/979f11667312079051f97490ecb81078.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 485]}
sorl-thumbnail||image||4674d351338e069094211593b152fc78	{"name": "images/FB_IMG_1602773916152.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 708]}
sorl-thumbnail||image||92cfeeb6c4f2e91a1fa45f424aef55a9	{"name": "cache/4b/80/4b80570ab8ae524bcdf27094a990d3a2.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 472]}
sorl-thumbnail||image||08db72f6348ec61572fe005d0d7bfa3f	{"name": "images/FB_IMG_1602773913924.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 874]}
sorl-thumbnail||image||4969d9852ca18040639d29b742531728	{"name": "cache/d5/fd/d5fdbcbac236c6b7d1d220836f0ee12f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 583]}
sorl-thumbnail||image||bd0126ceebaa21b86ede068c1f9b69bd	{"name": "cache/7c/d1/7cd1578318a3f9a9755382cb88137943.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 194]}
sorl-thumbnail||thumbnails||08db72f6348ec61572fe005d0d7bfa3f	["4969d9852ca18040639d29b742531728", "65ab94b25d54b26dd2c21d1b3900529d", "fdcf85cee602a683c5f1eb3806a82d21"]
sorl-thumbnail||image||721d964be5b2cc69a8deb90de5127ade	{"name": "cache/f9/60/f9605f37f8fe4d7987ab2e8a799a73cf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||093510671b6bc0ccdff529a3a36a2a9c	{"name": "cache/76/70/76702fa481796451f047b81a27bacb9c.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 992]}
sorl-thumbnail||image||6e1f59b6a400920b4abeaadeec47be37	{"name": "cache/58/23/58238ab10a355bf1314164e1ce5393d0.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 258]}
sorl-thumbnail||image||8cf19c85a46d7551a8d35a4486911a1d	{"name": "cache/10/bb/10bb7bada9f769c0e37836c669336fe4.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 310]}
sorl-thumbnail||thumbnails||55be955fc4e99872aed018a02ea655ad	["5251a8f80cb493db0159b9d8691b1003", "bd0126ceebaa21b86ede068c1f9b69bd", "8cf19c85a46d7551a8d35a4486911a1d", "093510671b6bc0ccdff529a3a36a2a9c"]
sorl-thumbnail||image||fdcf85cee602a683c5f1eb3806a82d21	{"name": "cache/d1/f5/d1f5c483c5d1be7cba25e17d89ec064a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 319]}
sorl-thumbnail||thumbnails||4674d351338e069094211593b152fc78	["92cfeeb6c4f2e91a1fa45f424aef55a9", "7dcc11377ce7e22a3c6178d77241b0fb", "6e1f59b6a400920b4abeaadeec47be37"]
sorl-thumbnail||image||65ab94b25d54b26dd2c21d1b3900529d	{"name": "cache/6c/b2/6cb21c28fd49f7881f1806952d2f393b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||fcd85747ae833145fcc01813bec67f7d	{"name": "cache/96/11/961144d0d9c5e7f246d64d3b5102add8.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 265]}
sorl-thumbnail||image||7dcc11377ce7e22a3c6178d77241b0fb	{"name": "cache/39/b3/39b3fb1a1cd22088e0963de9dd26bf66.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||image||7e11ab4e078e10f7a6f483e049142d8d	{"name": "images/posts/FB_IMG_1603747069338.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [940, 788]}
sorl-thumbnail||image||6ad93af3239b44415d9deaf03773627b	{"name": "cache/ed/b7/edb7628ce1f41ffd60bb039d422a8d55.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||9cebc03e3650913122c52795669003f9	["fcd85747ae833145fcc01813bec67f7d", "6f82c00c19f5fb4a57e17e2eb54fe45e", "6ad93af3239b44415d9deaf03773627b"]
sorl-thumbnail||image||ea00fd8784f5383a874909ee281d3216	{"name": "cache/8f/0b/8f0bf246df382c70ba61e6aebccf0653.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||602406b4818afa74dfd8258540a6ff3c	{"name": "cache/6d/91/6d916a0074ba2f4ebbf11d834a3784e4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 210]}
sorl-thumbnail||image||d55ab27171df3d40434ae409e464d884	{"name": "cache/a6/f9/a6f91ebbd28f4f07fcd9ae3813d15291.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 1073]}
sorl-thumbnail||image||ac79abc6644714480b4c3ca57dc458d3	{"name": "cache/52/57/525796aa00f9f09beaef35cd83c341f3.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 335]}
sorl-thumbnail||thumbnails||7e11ab4e078e10f7a6f483e049142d8d	["d55ab27171df3d40434ae409e464d884", "ea00fd8784f5383a874909ee281d3216", "ac79abc6644714480b4c3ca57dc458d3"]
sorl-thumbnail||image||6019298e19181efb640608d7426e16c7	{"name": "cache/98/f9/98f919450fee19597d6da029f4048f88.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||image||b0b7079c8b10601f4b52ff6056183af5	{"name": "images/posts/FB_IMG_1604823831765.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 708]}
sorl-thumbnail||image||9c57a6cfaab05ff30305cb6a020b0ab9	{"name": "cache/ca/79/ca79b19114ba7ab98547530a5798725b.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [50, 50]}
sorl-thumbnail||image||7c74b78b6cc635c85b3d7369fe979b82	{"name": "images/FB_IMG_1604823833971.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 687]}
sorl-thumbnail||image||37e169401a551ddd1592cfd5e0d72897	{"name": "cache/61/61/61612501a9c97eefd823127d725948fc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [640, 458]}
sorl-thumbnail||image||1d380a6d71a1532cab1774cf514b7cc5	{"name": "cache/ab/6e/ab6e76cb0e12b21bf418ba510b4d6e4d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 184]}
sorl-thumbnail||image||99caa5b2f47c54ddf80a37700e75871d	{"name": "cache/5e/9a/5e9af3018c4e1b72fb1956555dcf38e6.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 944]}
sorl-thumbnail||image||79f1a37048e7fb1b943aa7c94ca9ff6d	{"name": "cache/31/de/31de5b9f94630142eb50d6b9b3088ddc.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 295]}
sorl-thumbnail||thumbnails||b0b7079c8b10601f4b52ff6056183af5	["99caa5b2f47c54ddf80a37700e75871d", "1d380a6d71a1532cab1774cf514b7cc5", "79f1a37048e7fb1b943aa7c94ca9ff6d", "9c57a6cfaab05ff30305cb6a020b0ab9"]
sorl-thumbnail||image||22ac51b37a2dabd7db71369eb0a30028	{"name": "cache/f1/7c/f17c34b3e42e22f0a59dc9c5c158172f.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 250]}
sorl-thumbnail||image||d6094dd7f3b3a48eb586f23678b2a0c6	{"name": "cache/f3/28/f328b60435260c54a495bd2f84d4226a.webp", "storage": "django.core.files.storage.FileSystemStorage", "size": [250, 200]}
sorl-thumbnail||thumbnails||7c74b78b6cc635c85b3d7369fe979b82	["37e169401a551ddd1592cfd5e0d72897", "d6094dd7f3b3a48eb586f23678b2a0c6", "22ac51b37a2dabd7db71369eb0a30028"]
sorl-thumbnail||image||ae2e0c8d12ff89a47ebddad12a3db9cc	{"name": "cache/5c/57/5c57d4e55a934e9210cd3e5e85f92038.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
sorl-thumbnail||thumbnails||63d78d81096c1dfd19a17cec25e07c39	["7ec0df6c0080575ca5a7c8669020e157", "8c7b764d8056473eef40658c3539614f", "793b3b17f4b638a65c26b4d42d7e7f3e", "ae2e0c8d12ff89a47ebddad12a3db9cc"]
\.


--
-- Data for Name: webp_converter_webpimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webp_converter_webpimage (id, static_path, quality) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 90, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 4, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 12, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 100, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: page_ap_basebuildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_basebuildings_id_seq', 1, true);


--
-- Name: page_ap_baseobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_baseobjects_id_seq', 1, false);


--
-- Name: page_ap_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_file_id_seq', 5, true);


--
-- Name: page_ap_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_images_id_seq', 27, true);


--
-- Name: page_ap_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_post_id_seq', 26, true);


--
-- Name: page_ap_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_profile_id_seq', 12, true);


--
-- Name: page_ap_sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_sponsors_id_seq', 2, true);


--
-- Name: page_ap_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_teams_id_seq', 3, true);


--
-- Name: page_ap_teams_team_persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_teams_team_persons_id_seq', 2, true);


--
-- Name: page_ap_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_trainings_id_seq', 4, true);


--
-- Name: page_ap_yearbook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.page_ap_yearbook_id_seq', 12, true);


--
-- Name: webp_converter_webpimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webp_converter_webpimage_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: page_ap_basebuildings page_ap_basebuildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_basebuildings
    ADD CONSTRAINT page_ap_basebuildings_pkey PRIMARY KEY (id);


--
-- Name: page_ap_baseobjects page_ap_baseobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_baseobjects
    ADD CONSTRAINT page_ap_baseobjects_pkey PRIMARY KEY (id);


--
-- Name: page_ap_file page_ap_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_file
    ADD CONSTRAINT page_ap_file_pkey PRIMARY KEY (id);


--
-- Name: page_ap_images page_ap_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_images
    ADD CONSTRAINT page_ap_images_pkey PRIMARY KEY (id);


--
-- Name: page_ap_post page_ap_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_post
    ADD CONSTRAINT page_ap_post_pkey PRIMARY KEY (id);


--
-- Name: page_ap_profile page_ap_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_profile
    ADD CONSTRAINT page_ap_profile_pkey PRIMARY KEY (id);


--
-- Name: page_ap_profile page_ap_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_profile
    ADD CONSTRAINT page_ap_profile_user_id_key UNIQUE (user_id);


--
-- Name: page_ap_sponsors page_ap_sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_sponsors
    ADD CONSTRAINT page_ap_sponsors_pkey PRIMARY KEY (id);


--
-- Name: page_ap_teams page_ap_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams
    ADD CONSTRAINT page_ap_teams_pkey PRIMARY KEY (id);


--
-- Name: page_ap_teams_team_persons page_ap_teams_team_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams_team_persons
    ADD CONSTRAINT page_ap_teams_team_persons_pkey PRIMARY KEY (id);


--
-- Name: page_ap_teams_team_persons page_ap_teams_team_persons_teams_id_profile_id_22c96047_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams_team_persons
    ADD CONSTRAINT page_ap_teams_team_persons_teams_id_profile_id_22c96047_uniq UNIQUE (teams_id, profile_id);


--
-- Name: page_ap_trainings page_ap_trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_trainings
    ADD CONSTRAINT page_ap_trainings_pkey PRIMARY KEY (id);


--
-- Name: page_ap_yearbook page_ap_yearbook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_yearbook
    ADD CONSTRAINT page_ap_yearbook_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: webp_converter_webpimage webp_converter_webpimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webp_converter_webpimage
    ADD CONSTRAINT webp_converter_webpimage_pkey PRIMARY KEY (id);


--
-- Name: webp_converter_webpimage webp_converter_webpimage_static_path_quality_3716e642_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webp_converter_webpimage
    ADD CONSTRAINT webp_converter_webpimage_static_path_quality_3716e642_uniq UNIQUE (static_path, quality);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: page_ap_basebuildings_slug_7cf954ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_basebuildings_slug_7cf954ad ON public.page_ap_basebuildings USING btree (slug);


--
-- Name: page_ap_basebuildings_slug_7cf954ad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_basebuildings_slug_7cf954ad_like ON public.page_ap_basebuildings USING btree (slug varchar_pattern_ops);


--
-- Name: page_ap_baseobjects_main_object_id_9a39b263; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_baseobjects_main_object_id_9a39b263 ON public.page_ap_baseobjects USING btree (main_object_id);


--
-- Name: page_ap_baseobjects_slug_4513b425; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_baseobjects_slug_4513b425 ON public.page_ap_baseobjects USING btree (slug);


--
-- Name: page_ap_baseobjects_slug_4513b425_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_baseobjects_slug_4513b425_like ON public.page_ap_baseobjects USING btree (slug varchar_pattern_ops);


--
-- Name: page_ap_images_building_id_55ed49c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_images_building_id_55ed49c0 ON public.page_ap_images USING btree (building_id);


--
-- Name: page_ap_images_post_id_061d3c05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_images_post_id_061d3c05 ON public.page_ap_images USING btree (post_id);


--
-- Name: page_ap_images_team_id_72d20424; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_images_team_id_72d20424 ON public.page_ap_images USING btree (team_id);


--
-- Name: page_ap_post_author_id_8eece14f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_post_author_id_8eece14f ON public.page_ap_post USING btree (author_id);


--
-- Name: page_ap_post_slug_cae27d69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_post_slug_cae27d69 ON public.page_ap_post USING btree (slug);


--
-- Name: page_ap_post_slug_cae27d69_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_post_slug_cae27d69_like ON public.page_ap_post USING btree (slug varchar_pattern_ops);


--
-- Name: page_ap_post_team_id_50158bdb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_post_team_id_50158bdb ON public.page_ap_post USING btree (team_id);


--
-- Name: page_ap_profile_slug_b7879697; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_profile_slug_b7879697 ON public.page_ap_profile USING btree (slug);


--
-- Name: page_ap_profile_slug_b7879697_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_profile_slug_b7879697_like ON public.page_ap_profile USING btree (slug varchar_pattern_ops);


--
-- Name: page_ap_profile_team_id_848963eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_profile_team_id_848963eb ON public.page_ap_profile USING btree (team_id);


--
-- Name: page_ap_teams_coach_id_bfee6f28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_coach_id_bfee6f28 ON public.page_ap_teams USING btree (coach_id);


--
-- Name: page_ap_teams_slug_7d54201e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_slug_7d54201e ON public.page_ap_teams USING btree (slug);


--
-- Name: page_ap_teams_slug_7d54201e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_slug_7d54201e_like ON public.page_ap_teams USING btree (slug varchar_pattern_ops);


--
-- Name: page_ap_teams_team_persons_profile_id_814f7ab3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_team_persons_profile_id_814f7ab3 ON public.page_ap_teams_team_persons USING btree (profile_id);


--
-- Name: page_ap_teams_team_persons_teams_id_71d264dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_team_persons_teams_id_71d264dc ON public.page_ap_teams_team_persons USING btree (teams_id);


--
-- Name: page_ap_teams_yearbook_id_664ba05b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_teams_yearbook_id_664ba05b ON public.page_ap_teams USING btree (yearbook_id);


--
-- Name: page_ap_trainings_place_id_d75f3252; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_trainings_place_id_d75f3252 ON public.page_ap_trainings USING btree (place_id);


--
-- Name: page_ap_trainings_team_id_190e97f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_trainings_team_id_190e97f8 ON public.page_ap_trainings USING btree (team_id);


--
-- Name: page_ap_yearbook_slug_e549b832; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_yearbook_slug_e549b832 ON public.page_ap_yearbook USING btree (slug);


--
-- Name: page_ap_yearbook_slug_e549b832_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX page_ap_yearbook_slug_e549b832_like ON public.page_ap_yearbook USING btree (slug varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_baseobjects page_ap_baseobjects_main_object_id_9a39b263_fk_page_ap_b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_baseobjects
    ADD CONSTRAINT page_ap_baseobjects_main_object_id_9a39b263_fk_page_ap_b FOREIGN KEY (main_object_id) REFERENCES public.page_ap_basebuildings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_images page_ap_images_building_id_55ed49c0_fk_page_ap_basebuildings_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_images
    ADD CONSTRAINT page_ap_images_building_id_55ed49c0_fk_page_ap_basebuildings_id FOREIGN KEY (building_id) REFERENCES public.page_ap_basebuildings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_images page_ap_images_post_id_061d3c05_fk_page_ap_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_images
    ADD CONSTRAINT page_ap_images_post_id_061d3c05_fk_page_ap_post_id FOREIGN KEY (post_id) REFERENCES public.page_ap_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_images page_ap_images_team_id_72d20424_fk_page_ap_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_images
    ADD CONSTRAINT page_ap_images_team_id_72d20424_fk_page_ap_teams_id FOREIGN KEY (team_id) REFERENCES public.page_ap_teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_post page_ap_post_author_id_8eece14f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_post
    ADD CONSTRAINT page_ap_post_author_id_8eece14f_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_post page_ap_post_team_id_50158bdb_fk_page_ap_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_post
    ADD CONSTRAINT page_ap_post_team_id_50158bdb_fk_page_ap_teams_id FOREIGN KEY (team_id) REFERENCES public.page_ap_teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_profile page_ap_profile_team_id_848963eb_fk_page_ap_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_profile
    ADD CONSTRAINT page_ap_profile_team_id_848963eb_fk_page_ap_teams_id FOREIGN KEY (team_id) REFERENCES public.page_ap_teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_profile page_ap_profile_user_id_65efbb98_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_profile
    ADD CONSTRAINT page_ap_profile_user_id_65efbb98_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_teams page_ap_teams_coach_id_bfee6f28_fk_page_ap_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams
    ADD CONSTRAINT page_ap_teams_coach_id_bfee6f28_fk_page_ap_profile_id FOREIGN KEY (coach_id) REFERENCES public.page_ap_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_teams_team_persons page_ap_teams_team_p_profile_id_814f7ab3_fk_page_ap_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams_team_persons
    ADD CONSTRAINT page_ap_teams_team_p_profile_id_814f7ab3_fk_page_ap_p FOREIGN KEY (profile_id) REFERENCES public.page_ap_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_teams_team_persons page_ap_teams_team_p_teams_id_71d264dc_fk_page_ap_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams_team_persons
    ADD CONSTRAINT page_ap_teams_team_p_teams_id_71d264dc_fk_page_ap_t FOREIGN KEY (teams_id) REFERENCES public.page_ap_teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_teams page_ap_teams_yearbook_id_664ba05b_fk_page_ap_yearbook_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_teams
    ADD CONSTRAINT page_ap_teams_yearbook_id_664ba05b_fk_page_ap_yearbook_id FOREIGN KEY (yearbook_id) REFERENCES public.page_ap_yearbook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_trainings page_ap_trainings_place_id_d75f3252_fk_page_ap_basebuildings_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_trainings
    ADD CONSTRAINT page_ap_trainings_place_id_d75f3252_fk_page_ap_basebuildings_id FOREIGN KEY (place_id) REFERENCES public.page_ap_basebuildings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_ap_trainings page_ap_trainings_team_id_190e97f8_fk_page_ap_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_ap_trainings
    ADD CONSTRAINT page_ap_trainings_team_id_190e97f8_fk_page_ap_teams_id FOREIGN KEY (team_id) REFERENCES public.page_ap_teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

