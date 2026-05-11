--
-- PostgreSQL database dump
--

\restrict iGSprs60Jau4R4vwL5FTrJKZj9LtEyaeZD694p8Gw7mzQaZDgoYFyNbKzlcgNwZ

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

SET default_table_access_method = heap;

--
-- Name: blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklist (
    id integer NOT NULL,
    type character varying(20) NOT NULL,
    value character varying(255) NOT NULL,
    reason text,
    added_at timestamp without time zone DEFAULT now(),
    added_by character varying(50) DEFAULT 'system'::character varying
);


ALTER TABLE public.blacklist OWNER TO postgres;

--
-- Name: blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blacklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blacklist_id_seq OWNER TO postgres;

--
-- Name: blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blacklist_id_seq OWNED BY public.blacklist.id;


--
-- Name: cron_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cron_executions (
    id integer NOT NULL,
    cron_id integer,
    executed_at timestamp without time zone DEFAULT now(),
    status character varying(20),
    result text,
    duration_seconds integer
);


ALTER TABLE public.cron_executions OWNER TO postgres;

--
-- Name: cron_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cron_executions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cron_executions_id_seq OWNER TO postgres;

--
-- Name: cron_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cron_executions_id_seq OWNED BY public.cron_executions.id;


--
-- Name: cron_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cron_tasks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    pattern_type character varying(50) DEFAULT 'every_active_day'::character varying NOT NULL,
    pattern_value integer,
    pattern_days character varying(20),
    active_days text DEFAULT '1,2,3,4,5'::text,
    excluded_days text,
    execution_time time without time zone DEFAULT '09:00:00'::time without time zone NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying,
    next_run timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.cron_tasks OWNER TO postgres;

--
-- Name: cron_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cron_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cron_tasks_id_seq OWNER TO postgres;

--
-- Name: cron_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cron_tasks_id_seq OWNED BY public.cron_tasks.id;


--
-- Name: hashtags_monitored; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags_monitored (
    id integer NOT NULL,
    hashtag character varying(100) NOT NULL,
    is_active boolean DEFAULT true,
    last_scraped timestamp without time zone,
    trend_count integer DEFAULT 0,
    added_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.hashtags_monitored OWNER TO postgres;

--
-- Name: hashtags_monitored_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_monitored_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hashtags_monitored_id_seq OWNER TO postgres;

--
-- Name: hashtags_monitored_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_monitored_id_seq OWNED BY public.hashtags_monitored.id;


--
-- Name: scheduled_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheduled_events (
    id integer NOT NULL,
    cron_id integer,
    scheduled_date date NOT NULL,
    scheduled_time time without time zone NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.scheduled_events OWNER TO postgres;

--
-- Name: scheduled_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scheduled_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scheduled_events_id_seq OWNER TO postgres;

--
-- Name: scheduled_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scheduled_events_id_seq OWNED BY public.scheduled_events.id;


--
-- Name: tiktok_trends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiktok_trends (
    id integer NOT NULL,
    video_id character varying(50) NOT NULL,
    title text,
    description text,
    author_name character varying(100),
    author_id character varying(50),
    author_followers integer DEFAULT 0,
    author_verified boolean DEFAULT false,
    views bigint DEFAULT 0,
    likes integer DEFAULT 0,
    comments integer DEFAULT 0,
    shares integer DEFAULT 0,
    engagement_rate double precision DEFAULT 0,
    hashtags jsonb DEFAULT '[]'::jsonb,
    thumbnail_url text,
    video_url text,
    duration_seconds integer DEFAULT 0,
    published_at timestamp without time zone,
    trend_score double precision DEFAULT 0,
    captured_at timestamp without time zone DEFAULT now(),
    is_trending boolean DEFAULT false,
    trend_velocity character varying(20) DEFAULT 'stable'::character varying,
    source_hashtag character varying(50)
);


ALTER TABLE public.tiktok_trends OWNER TO postgres;

--
-- Name: tiktok_trends_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiktok_trends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiktok_trends_id_seq OWNER TO postgres;

--
-- Name: tiktok_trends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiktok_trends_id_seq OWNED BY public.tiktok_trends.id;


--
-- Name: trend_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trend_history (
    id integer NOT NULL,
    trend_id integer,
    captured_at timestamp without time zone,
    views bigint,
    likes integer,
    comments integer,
    trend_score double precision
);


ALTER TABLE public.trend_history OWNER TO postgres;

--
-- Name: trend_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trend_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trend_history_id_seq OWNER TO postgres;

--
-- Name: trend_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trend_history_id_seq OWNED BY public.trend_history.id;


--
-- Name: blacklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist ALTER COLUMN id SET DEFAULT nextval('public.blacklist_id_seq'::regclass);


--
-- Name: cron_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cron_executions ALTER COLUMN id SET DEFAULT nextval('public.cron_executions_id_seq'::regclass);


--
-- Name: cron_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cron_tasks ALTER COLUMN id SET DEFAULT nextval('public.cron_tasks_id_seq'::regclass);


--
-- Name: hashtags_monitored id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags_monitored ALTER COLUMN id SET DEFAULT nextval('public.hashtags_monitored_id_seq'::regclass);


--
-- Name: scheduled_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_events ALTER COLUMN id SET DEFAULT nextval('public.scheduled_events_id_seq'::regclass);


--
-- Name: tiktok_trends id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiktok_trends ALTER COLUMN id SET DEFAULT nextval('public.tiktok_trends_id_seq'::regclass);


--
-- Name: trend_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_history ALTER COLUMN id SET DEFAULT nextval('public.trend_history_id_seq'::regclass);


--
-- Data for Name: blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklist (id, type, value, reason, added_at, added_by) FROM stdin;
\.


--
-- Data for Name: cron_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cron_executions (id, cron_id, executed_at, status, result, duration_seconds) FROM stdin;
\.


--
-- Data for Name: cron_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cron_tasks (id, name, description, pattern_type, pattern_value, pattern_days, active_days, excluded_days, execution_time, status, next_run, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hashtags_monitored; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags_monitored (id, hashtag, is_active, last_scraped, trend_count, added_at) FROM stdin;
\.


--
-- Data for Name: scheduled_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheduled_events (id, cron_id, scheduled_date, scheduled_time, status, created_at) FROM stdin;
\.


--
-- Data for Name: tiktok_trends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiktok_trends (id, video_id, title, description, author_name, author_id, author_followers, author_verified, views, likes, comments, shares, engagement_rate, hashtags, thumbnail_url, video_url, duration_seconds, published_at, trend_score, captured_at, is_trending, trend_velocity, source_hashtag) FROM stdin;
\.


--
-- Data for Name: trend_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trend_history (id, trend_id, captured_at, views, likes, comments, trend_score) FROM stdin;
\.


--
-- Name: blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklist_id_seq', 1, false);


--
-- Name: cron_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cron_executions_id_seq', 1, false);


--
-- Name: cron_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cron_tasks_id_seq', 1, false);


--
-- Name: hashtags_monitored_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_monitored_id_seq', 1, false);


--
-- Name: scheduled_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scheduled_events_id_seq', 1, false);


--
-- Name: tiktok_trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiktok_trends_id_seq', 1, false);


--
-- Name: trend_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trend_history_id_seq', 1, false);


--
-- Name: blacklist blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist
    ADD CONSTRAINT blacklist_pkey PRIMARY KEY (id);


--
-- Name: cron_executions cron_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cron_executions
    ADD CONSTRAINT cron_executions_pkey PRIMARY KEY (id);


--
-- Name: cron_tasks cron_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cron_tasks
    ADD CONSTRAINT cron_tasks_pkey PRIMARY KEY (id);


--
-- Name: hashtags_monitored hashtags_monitored_hashtag_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags_monitored
    ADD CONSTRAINT hashtags_monitored_hashtag_key UNIQUE (hashtag);


--
-- Name: hashtags_monitored hashtags_monitored_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags_monitored
    ADD CONSTRAINT hashtags_monitored_pkey PRIMARY KEY (id);


--
-- Name: scheduled_events scheduled_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_events
    ADD CONSTRAINT scheduled_events_pkey PRIMARY KEY (id);


--
-- Name: tiktok_trends tiktok_trends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiktok_trends
    ADD CONSTRAINT tiktok_trends_pkey PRIMARY KEY (id);


--
-- Name: tiktok_trends tiktok_trends_video_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiktok_trends
    ADD CONSTRAINT tiktok_trends_video_id_key UNIQUE (video_id);


--
-- Name: trend_history trend_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_history
    ADD CONSTRAINT trend_history_pkey PRIMARY KEY (id);


--
-- Name: trend_history trend_history_trend_id_captured_at_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_history
    ADD CONSTRAINT trend_history_trend_id_captured_at_key UNIQUE (trend_id, captured_at);


--
-- Name: idx_blacklist_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_blacklist_type ON public.blacklist USING btree (type);


--
-- Name: idx_cron_executions_cron_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cron_executions_cron_id ON public.cron_executions USING btree (cron_id);


--
-- Name: idx_cron_tasks_next_run; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cron_tasks_next_run ON public.cron_tasks USING btree (next_run);


--
-- Name: idx_cron_tasks_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cron_tasks_status ON public.cron_tasks USING btree (status);


--
-- Name: idx_scheduled_events_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scheduled_events_date ON public.scheduled_events USING btree (scheduled_date);


--
-- Name: idx_trend_history_trend; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_trend_history_trend ON public.trend_history USING btree (trend_id);


--
-- Name: idx_trends_captured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_trends_captured ON public.tiktok_trends USING btree (captured_at);


--
-- Name: idx_trends_score; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_trends_score ON public.tiktok_trends USING btree (trend_score);


--
-- Name: idx_trends_video_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_trends_video_id ON public.tiktok_trends USING btree (video_id);


--
-- Name: cron_executions cron_executions_cron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cron_executions
    ADD CONSTRAINT cron_executions_cron_id_fkey FOREIGN KEY (cron_id) REFERENCES public.cron_tasks(id) ON DELETE CASCADE;


--
-- Name: scheduled_events scheduled_events_cron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_events
    ADD CONSTRAINT scheduled_events_cron_id_fkey FOREIGN KEY (cron_id) REFERENCES public.cron_tasks(id) ON DELETE CASCADE;


--
-- Name: trend_history trend_history_trend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_history
    ADD CONSTRAINT trend_history_trend_id_fkey FOREIGN KEY (trend_id) REFERENCES public.tiktok_trends(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict iGSprs60Jau4R4vwL5FTrJKZj9LtEyaeZD694p8Gw7mzQaZDgoYFyNbKzlcgNwZ

