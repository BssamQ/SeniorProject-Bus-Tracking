--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: serverpod_auth_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_auth_key (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    hash text NOT NULL,
    "scopeNames" json NOT NULL,
    method text NOT NULL
);


ALTER TABLE public.serverpod_auth_key OWNER TO postgres;

--
-- Name: serverpod_auth_key_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_auth_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_auth_key_id_seq OWNER TO postgres;

--
-- Name: serverpod_auth_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_auth_key_id_seq OWNED BY public.serverpod_auth_key.id;


--
-- Name: serverpod_cloud_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_cloud_storage (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    expiration timestamp without time zone,
    "byteData" bytea NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.serverpod_cloud_storage OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_cloud_storage_direct_upload (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    expiration timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);


ALTER TABLE public.serverpod_cloud_storage_direct_upload OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq OWNED BY public.serverpod_cloud_storage_direct_upload.id;


--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_cloud_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_cloud_storage_id_seq OWNER TO postgres;

--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_cloud_storage_id_seq OWNED BY public.serverpod_cloud_storage.id;


--
-- Name: serverpod_email_auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_email_auth (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    email text NOT NULL,
    hash text NOT NULL
);


ALTER TABLE public.serverpod_email_auth OWNER TO postgres;

--
-- Name: serverpod_email_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_email_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_email_auth_id_seq OWNER TO postgres;

--
-- Name: serverpod_email_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_email_auth_id_seq OWNED BY public.serverpod_email_auth.id;


--
-- Name: serverpod_email_create_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_email_create_request (
    id bigint NOT NULL,
    "userName" text NOT NULL,
    email text NOT NULL,
    hash text NOT NULL,
    "verificationCode" text NOT NULL
);


ALTER TABLE public.serverpod_email_create_request OWNER TO postgres;

--
-- Name: serverpod_email_create_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_email_create_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_email_create_request_id_seq OWNER TO postgres;

--
-- Name: serverpod_email_create_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_email_create_request_id_seq OWNED BY public.serverpod_email_create_request.id;


--
-- Name: serverpod_email_failed_sign_in; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_email_failed_sign_in (
    id bigint NOT NULL,
    email text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);


ALTER TABLE public.serverpod_email_failed_sign_in OWNER TO postgres;

--
-- Name: serverpod_email_failed_sign_in_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_email_failed_sign_in_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_email_failed_sign_in_id_seq OWNER TO postgres;

--
-- Name: serverpod_email_failed_sign_in_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_email_failed_sign_in_id_seq OWNED BY public.serverpod_email_failed_sign_in.id;


--
-- Name: serverpod_email_reset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_email_reset (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    expiration timestamp without time zone NOT NULL
);


ALTER TABLE public.serverpod_email_reset OWNER TO postgres;

--
-- Name: serverpod_email_reset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_email_reset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_email_reset_id_seq OWNER TO postgres;

--
-- Name: serverpod_email_reset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_email_reset_id_seq OWNED BY public.serverpod_email_reset.id;


--
-- Name: serverpod_future_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_future_call (
    id bigint NOT NULL,
    name text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    identifier text
);


ALTER TABLE public.serverpod_future_call OWNER TO postgres;

--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_future_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_future_call_id_seq OWNER TO postgres;

--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_future_call_id_seq OWNED BY public.serverpod_future_call.id;


--
-- Name: serverpod_google_refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_google_refresh_token (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);


ALTER TABLE public.serverpod_google_refresh_token OWNER TO postgres;

--
-- Name: serverpod_google_refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_google_refresh_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_google_refresh_token_id_seq OWNER TO postgres;

--
-- Name: serverpod_google_refresh_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_google_refresh_token_id_seq OWNED BY public.serverpod_google_refresh_token.id;


--
-- Name: serverpod_health_connection_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_health_connection_info (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    active bigint NOT NULL,
    closing bigint NOT NULL,
    idle bigint NOT NULL,
    granularity bigint NOT NULL
);


ALTER TABLE public.serverpod_health_connection_info OWNER TO postgres;

--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_health_connection_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_health_connection_info_id_seq OWNER TO postgres;

--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_health_connection_info_id_seq OWNED BY public.serverpod_health_connection_info.id;


--
-- Name: serverpod_health_metric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_health_metric (
    id bigint NOT NULL,
    name text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    value double precision NOT NULL,
    granularity bigint NOT NULL
);


ALTER TABLE public.serverpod_health_metric OWNER TO postgres;

--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_health_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_health_metric_id_seq OWNER TO postgres;

--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_health_metric_id_seq OWNED BY public.serverpod_health_metric.id;


--
-- Name: serverpod_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    reference text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    message text NOT NULL,
    error text,
    "stackTrace" text,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_log OWNER TO postgres;

--
-- Name: serverpod_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_log_id_seq OWNED BY public.serverpod_log.id;


--
-- Name: serverpod_message_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_message_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    endpoint text NOT NULL,
    "messageName" text NOT NULL,
    duration double precision NOT NULL,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_message_log OWNER TO postgres;

--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_message_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_message_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_message_log_id_seq OWNED BY public.serverpod_message_log.id;


--
-- Name: serverpod_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_method (
    id bigint NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL
);


ALTER TABLE public.serverpod_method OWNER TO postgres;

--
-- Name: serverpod_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_method_id_seq OWNER TO postgres;

--
-- Name: serverpod_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_method_id_seq OWNED BY public.serverpod_method.id;


--
-- Name: serverpod_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_migrations (
    id bigint NOT NULL,
    module text NOT NULL,
    version text NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.serverpod_migrations OWNER TO postgres;

--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_migrations_id_seq OWNER TO postgres;

--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_migrations_id_seq OWNED BY public.serverpod_migrations.id;


--
-- Name: serverpod_query_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_query_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    query text NOT NULL,
    duration double precision NOT NULL,
    "numRows" bigint,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);


ALTER TABLE public.serverpod_query_log OWNER TO postgres;

--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_query_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_query_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_query_log_id_seq OWNED BY public.serverpod_query_log.id;


--
-- Name: serverpod_readwrite_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_readwrite_test (
    id bigint NOT NULL,
    number bigint NOT NULL
);


ALTER TABLE public.serverpod_readwrite_test OWNER TO postgres;

--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_readwrite_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_readwrite_test_id_seq OWNER TO postgres;

--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_readwrite_test_id_seq OWNED BY public.serverpod_readwrite_test.id;


--
-- Name: serverpod_runtime_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_runtime_settings (
    id bigint NOT NULL,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);


ALTER TABLE public.serverpod_runtime_settings OWNER TO postgres;

--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_runtime_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_runtime_settings_id_seq OWNER TO postgres;

--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_runtime_settings_id_seq OWNED BY public.serverpod_runtime_settings.id;


--
-- Name: serverpod_session_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_session_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    module text,
    endpoint text,
    method text,
    duration double precision,
    "numQueries" bigint,
    slow boolean,
    error text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    touched timestamp without time zone NOT NULL
);


ALTER TABLE public.serverpod_session_log OWNER TO postgres;

--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_session_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_session_log_id_seq OWNER TO postgres;

--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_session_log_id_seq OWNED BY public.serverpod_session_log.id;


--
-- Name: serverpod_user_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_user_image (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    version bigint NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.serverpod_user_image OWNER TO postgres;

--
-- Name: serverpod_user_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_user_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_user_image_id_seq OWNER TO postgres;

--
-- Name: serverpod_user_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_user_image_id_seq OWNED BY public.serverpod_user_image.id;


--
-- Name: serverpod_user_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serverpod_user_info (
    id bigint NOT NULL,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    email text,
    created timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    blocked boolean NOT NULL
);


ALTER TABLE public.serverpod_user_info OWNER TO postgres;

--
-- Name: serverpod_user_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serverpod_user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serverpod_user_info_id_seq OWNER TO postgres;

--
-- Name: serverpod_user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serverpod_user_info_id_seq OWNED BY public.serverpod_user_info.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    location text,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: serverpod_auth_key id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_auth_key ALTER COLUMN id SET DEFAULT nextval('public.serverpod_auth_key_id_seq'::regclass);


--
-- Name: serverpod_cloud_storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_id_seq'::regclass);


--
-- Name: serverpod_cloud_storage_direct_upload id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_direct_upload_id_seq'::regclass);


--
-- Name: serverpod_email_auth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_auth ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_auth_id_seq'::regclass);


--
-- Name: serverpod_email_create_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_create_request ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_create_request_id_seq'::regclass);


--
-- Name: serverpod_email_failed_sign_in id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_failed_sign_in ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_failed_sign_in_id_seq'::regclass);


--
-- Name: serverpod_email_reset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_reset ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_reset_id_seq'::regclass);


--
-- Name: serverpod_future_call id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_future_call ALTER COLUMN id SET DEFAULT nextval('public.serverpod_future_call_id_seq'::regclass);


--
-- Name: serverpod_google_refresh_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_google_refresh_token ALTER COLUMN id SET DEFAULT nextval('public.serverpod_google_refresh_token_id_seq'::regclass);


--
-- Name: serverpod_health_connection_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_connection_info ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_connection_info_id_seq'::regclass);


--
-- Name: serverpod_health_metric id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_metric ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_metric_id_seq'::regclass);


--
-- Name: serverpod_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_log_id_seq'::regclass);


--
-- Name: serverpod_message_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_message_log_id_seq'::regclass);


--
-- Name: serverpod_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_method ALTER COLUMN id SET DEFAULT nextval('public.serverpod_method_id_seq'::regclass);


--
-- Name: serverpod_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_migrations ALTER COLUMN id SET DEFAULT nextval('public.serverpod_migrations_id_seq'::regclass);


--
-- Name: serverpod_query_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_query_log_id_seq'::regclass);


--
-- Name: serverpod_readwrite_test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_readwrite_test ALTER COLUMN id SET DEFAULT nextval('public.serverpod_readwrite_test_id_seq'::regclass);


--
-- Name: serverpod_runtime_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_runtime_settings ALTER COLUMN id SET DEFAULT nextval('public.serverpod_runtime_settings_id_seq'::regclass);


--
-- Name: serverpod_session_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_session_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_session_log_id_seq'::regclass);


--
-- Name: serverpod_user_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_user_image ALTER COLUMN id SET DEFAULT nextval('public.serverpod_user_image_id_seq'::regclass);


--
-- Name: serverpod_user_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_user_info ALTER COLUMN id SET DEFAULT nextval('public.serverpod_user_info_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: serverpod_auth_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_auth_key (id, "userId", hash, "scopeNames", method) FROM stdin;
1	1	ad691adfa6da818a2990872c49b7651d50d433a4404f77c97cbcc5fcd4e76e97	[]	email
2	1	5bad463582273d578b98032458db8a3cb931444a30171a7bd188650a81a8ad2a	[]	email
\.


--
-- Data for Name: serverpod_cloud_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_cloud_storage (id, "storageId", path, "addedTime", expiration, "byteData", verified) FROM stdin;
1	public	serverpod/user_images/1-1.jpg	2025-02-12 21:32:56.720026	\N	\\xffd8ffe000104a46494600010100000100010000ffdb0084000a07070807060a0808080b0a0a0b0e18100e0d0d0e1d15161118231f2524221f2221262b372f26293429212230413134393b3e3e3e252e4449433c48373d3e3b010a0b0b0e0d0e1c10101c3b2822283b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3bffc00011080100010003011100021101031101ffc401a20000010501010101010100000000000000000102030405060708090a0b100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9fa0100030101010101010101010000000000000102030405060708090a0b1100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00eeebe3ce80a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a00280254b79e45dc90bb29ee149ad6346a495e316d0ae81ede78d4b3c2eaa3b95228951a9157945a417445590c2800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a005552ec1546493814e29c9a480e9a188430a463a28c57d5d382a70515d0c1bb8b3462685e33d18628a905520e2fa82763986528e55860a9c1af94945c5b4cdc4a40140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014017b4983cdbade47118cfe3dabd0cbe973d5e67d089bd0dcafa0320a00c3d5a0f2eebcc0389067f1ef5f3f9852e4abccba9ac1e851af3cb0a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a00ded2e0f26cc311f349f31fe95f4581a5c94537bbd4c64eec7ea3379366e41f99be51f8d5e32a7b3a2fbbd022aec34e9bceb3424fccbf29fc28c155f6945775a049598dd520f3acd881f347f30feb538ea5cf45b5bad422eccc0af9c360a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a0028025b684cf70910fe23cfd2b5a34fda5450ee26ec8e94000000600afaa4acac8c0c6d666df3ac40f08327ea6bc3ccaaf34d41743582d2e1a3cdb276889e1c647d45196d5e5a8e0fa84d697364804107906bdc6afa191cd5cc260b8788ff09e3e9dabe56b53f6751c3b1ba77445590c2800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a0028035346832cf391d3e55feb5ebe5b4b5751fa19cdf43559822966380a326bd893514db333999a4334cf21eac735f27526e73727d4dd2b045218a54917aa9cd14e6e13525d01ea74c8c1d03af2186457d6464a49346065eb30729381d7e56fe95e3e654b55517a1a41f432abc8340a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a00e92d21fb3daa47dc0e7eb5f5387a5eca92898377641ab4de55a6c07990e3f0ef5cf9854e4a5caba9505a9855f3c6a1401bba4cde65a6c2798ce3f0ed5f4197d5e7a5cafa194d6a58bb87ed16cf1f7238fad74e229fb5a4e24a7667355f2c6e1400500140050014005001400500140050014005001400500140050014005001400500140050014005005ad3a0f3ef1323e54f98d7660a97b4acbb2d4993b23a1afa43130b559bcdbb280f118c7e3debe7b1f579eaf2f63582d0a35c0585005dd2a6f2af0293c4836fe3dabbf015792b5bb9335a1bd5f426273fa941e4de3607caff0030af9bc6d2f6759f67a9b45dd152b8ca0a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a00dbd1e0d96e6523990f1f415ef65d4b969b9bea6537a97ce71c75af499063b68f70ec59a58c92727ad788f2eab27772469ce84fec59ffe7ac7fad4ff006654ee87ce83fb167ff9eb1feb47f6654ee839d0aba3dc2b0612a020e475aa597554eea4839d1b033819ebdf15ed2db532286af07996c250398cfe86bcecc697353e75d0b83d4c4af04d42800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a0074686591635eac702aa1173928aea0ce9e3411c6a8bd146057d6422a11515d0e7069110e19d57ea71439c63bb01be745ff003d53fefa153ed61fcc87661e745ff3d53fefa147b587f320b30f3a2ff9ea9ff7d0a3dac3f99059879d17fcf54ffbe851ed61fcc82cc72c88e70aeadf439aa538cb6620741246c8dd1860d128a945c5f50399963314ad1b7553835f29383849c5f43a16a32a002800a002800a002800a002800a002800a002800a002800a002800a002800a002800a0028034747837dc34a47118e3ea6bd3cba97354737d089bd0daaf74c8e7b519bcebc720f0bf28fc2be6b1953da566fb686d156455ae4282800a002802ce9f379178849f95be53f8d7560eafb3ac9f47a1325747455f4c6262eb106c9d6603871cfd4578598d2e5a8a6ba9ac1e9633abcc2c2800a002800a002800a002800a002800a002800a002800a002800a002800a002800a002803a1d3a0f22cd011f337cc7f1afa5c1d2f6745777a98c9dd925dcde45ac9277038fad6988a9eca939092bb39aaf96370a002800a002800a00e92ce6f3ed6393b9183f5afa9c3d4f6b4948c1ab319a841e7d9b803e65f987e159e3297b4a2d755a8e2ecce7abe68d82800a002800a002800a002800a002800a002800a002800a002800a002800a002800a009ece1fb45d247d89c9fa56f87a5ed6aa889bb23a4afa93032b5a9bfd5c00ffb47fa7f5af1f33a9b535ea6905d4c9af1cd02800a002800a00280357459b97809ff00687f5af5f2dabbd37ea6735d4d6af64cce6ef21fb3dd3c78e3395fa57cbe2697b2aae26e9dd105738c2800a002800a002800a002800a002800a002800a002800a002800a002800a002801c923c67746ec87a654e2aa33941de2ec049f6bb9ff9f897fefb35a7d62b7f3bfbd8ac88ddde46dcec58fa939ace52949de4ee31b520140050014005001400e4768db723153ea0e0d546528bbc5d8093ed773ff3f12ffdf66b4fac56fe77f7b15911bc8f21cc8ece7a658e6b394e537793b8c6d48050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005001400500140050014005007ffd9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	t
\.


--
-- Data for Name: serverpod_cloud_storage_direct_upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_cloud_storage_direct_upload (id, "storageId", path, expiration, "authKey") FROM stdin;
\.


--
-- Data for Name: serverpod_email_auth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_email_auth (id, "userId", email, hash) FROM stdin;
1	1	s201968710@kfupm.edu.sa	$argon2id$By5vNTJ4jm00gOym$JWzeakGOl6OQJ7t7PKErTAKvJmXqsznJduq9qAUbtvdHWeBIfoisXtk4XQS8ARxqhl+fH/k7pCxRNAMGIvDS9WGcCvcd466efYZYyAMdmVreKwQuNgQHNPv7Fk/cOi6r8/STj+F2+iXNZ3yVIMQWmvEecb518OchrafHhfv7UyJ9hAaolb7B2GExL7r2diDCOgcHGeAQzgXYChDvmBFgv87cTku39hywTepvnXOzljMHNfrsl5Zh+VaEjuhnpO/IXlGE62K0jMjpxBv1KjODpayZLyD9VGhwq1z9vxE9lGXvWid11O3hYItZIeIMNPO2i2Ly0QtKpYmLYeFCBnZ7sg==
\.


--
-- Data for Name: serverpod_email_create_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_email_create_request (id, "userName", email, hash, "verificationCode") FROM stdin;
\.


--
-- Data for Name: serverpod_email_failed_sign_in; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_email_failed_sign_in (id, email, "time", "ipAddress") FROM stdin;
\.


--
-- Data for Name: serverpod_email_reset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_email_reset (id, "userId", "verificationCode", expiration) FROM stdin;
\.


--
-- Data for Name: serverpod_future_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_future_call (id, name, "time", "serializedObject", "serverId", identifier) FROM stdin;
\.


--
-- Data for Name: serverpod_google_refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_google_refresh_token (id, "userId", "refreshToken") FROM stdin;
\.


--
-- Data for Name: serverpod_health_connection_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_health_connection_info (id, "serverId", "timestamp", active, closing, idle, granularity) FROM stdin;
100	default	2025-02-11 13:10:00	0	0	0	1
101	default	2025-02-11 13:11:00	0	0	0	1
102	default	2025-02-11 13:12:00	0	0	0	1
103	default	2025-02-11 13:13:00	0	0	0	1
104	default	2025-02-11 13:14:00	0	0	0	1
105	default	2025-02-11 13:15:00	0	0	0	1
106	default	2025-02-11 13:16:00	0	0	0	1
107	default	2025-02-11 13:17:00	0	0	0	1
108	default	2025-02-11 13:18:00	0	0	0	1
109	default	2025-02-11 13:19:00	0	0	0	1
110	default	2025-02-11 13:20:00	0	0	0	1
111	default	2025-02-11 13:21:00	0	0	0	1
112	default	2025-02-11 13:22:00	0	0	0	1
113	default	2025-02-11 13:23:00	0	0	0	1
114	default	2025-02-11 13:24:00	0	0	0	1
115	default	2025-02-11 13:25:00	0	0	0	1
116	default	2025-02-11 13:26:00	0	0	0	1
117	default	2025-02-11 13:35:00	0	0	1	1
118	default	2025-02-11 13:36:00	0	0	1	1
119	default	2025-02-11 13:37:00	0	0	0	1
120	default	2025-02-11 13:38:00	0	0	1	1
121	default	2025-02-11 13:39:00	0	0	1	1
122	default	2025-02-11 13:40:00	0	0	0	1
123	default	2025-02-11 13:41:00	0	0	0	1
124	default	2025-02-11 13:42:00	0	0	0	1
125	default	2025-02-11 13:43:00	0	0	0	1
126	default	2025-02-11 13:44:00	0	0	0	1
127	default	2025-02-11 13:45:00	0	0	0	1
128	default	2025-02-11 13:46:00	0	0	0	1
129	default	2025-02-11 13:47:00	0	0	0	1
130	default	2025-02-11 13:48:00	0	0	0	1
131	default	2025-02-11 13:49:00	0	0	0	1
132	default	2025-02-11 13:50:00	0	0	0	1
133	default	2025-02-11 13:51:00	0	0	0	1
134	default	2025-02-11 13:52:00	0	0	0	1
135	default	2025-02-11 13:53:00	0	0	0	1
136	default	2025-02-11 13:54:00	0	0	0	1
137	default	2025-02-11 13:55:00	0	0	0	1
138	default	2025-02-11 13:56:00	0	0	0	1
139	default	2025-02-11 13:57:00	0	0	0	1
140	default	2025-02-11 13:58:00	0	0	1	1
141	default	2025-02-11 13:59:00	0	0	0	1
142	default	2025-02-11 14:00:00	0	0	0	1
143	default	2025-02-11 14:01:00	0	0	0	1
144	default	2025-02-11 14:02:00	0	0	0	1
145	default	2025-02-11 14:03:00	0	0	0	1
146	default	2025-02-11 14:04:00	0	0	0	1
147	default	2025-02-11 14:05:00	0	0	0	1
148	default	2025-02-11 14:06:00	0	0	0	1
149	default	2025-02-11 14:08:00	0	0	0	1
150	default	2025-02-11 14:09:00	0	0	0	1
151	default	2025-02-11 14:10:00	0	0	0	1
152	default	2025-02-11 14:11:00	0	0	0	1
153	default	2025-02-11 14:12:00	0	0	0	1
154	default	2025-02-11 14:13:00	0	0	0	1
155	default	2025-02-11 14:14:00	0	0	0	1
156	default	2025-02-11 14:17:00	0	0	1	1
157	default	2025-02-11 14:18:00	0	0	0	1
158	default	2025-02-11 14:19:00	0	0	0	1
159	default	2025-02-11 14:20:00	0	0	0	1
160	default	2025-02-11 14:21:00	0	0	0	1
161	default	2025-02-11 14:22:00	0	0	0	1
162	default	2025-02-11 14:23:00	0	0	0	1
163	default	2025-02-11 15:27:00	0	0	0	1
164	default	2025-02-11 15:28:00	0	0	0	1
165	default	2025-02-11 15:29:00	0	0	0	1
166	default	2025-02-11 15:30:00	0	0	0	1
167	default	2025-02-11 15:31:00	0	0	0	1
168	default	2025-02-11 15:32:00	0	0	0	1
169	default	2025-02-11 15:33:00	0	0	0	1
170	default	2025-02-11 15:34:00	0	0	0	1
171	default	2025-02-11 15:35:00	0	0	0	1
172	default	2025-02-11 15:36:00	0	0	0	1
173	default	2025-02-11 15:37:00	0	0	0	1
174	default	2025-02-11 15:38:00	0	0	0	1
175	default	2025-02-11 15:39:00	0	0	0	1
176	default	2025-02-11 15:40:00	0	0	0	1
177	default	2025-02-11 15:41:00	0	0	0	1
178	default	2025-02-11 15:42:00	0	0	0	1
179	default	2025-02-11 15:43:00	0	0	0	1
180	default	2025-02-11 15:44:00	0	0	0	1
181	default	2025-02-11 15:45:00	0	0	0	1
182	default	2025-02-11 15:46:00	0	0	0	1
183	default	2025-02-11 15:47:00	0	0	0	1
184	default	2025-02-11 15:48:00	0	0	0	1
185	default	2025-02-11 15:49:00	0	0	0	1
186	default	2025-02-11 15:50:00	0	0	0	1
187	default	2025-02-11 15:51:00	0	0	0	1
188	default	2025-02-11 15:52:00	0	0	0	1
189	default	2025-02-11 15:53:00	0	0	0	1
190	default	2025-02-11 15:54:00	0	0	0	1
191	default	2025-02-11 15:55:00	0	0	0	1
192	default	2025-02-11 15:56:00	0	0	0	1
193	default	2025-02-11 15:57:00	0	0	0	1
194	default	2025-02-11 15:58:00	0	0	0	1
195	default	2025-02-11 15:59:00	0	0	0	1
196	default	2025-02-11 16:00:00	0	0	0	1
197	default	2025-02-11 16:01:00	0	0	0	1
198	default	2025-02-11 16:02:00	0	0	0	1
199	default	2025-02-11 16:03:00	0	0	0	1
200	default	2025-02-11 16:04:00	0	0	0	1
201	default	2025-02-11 16:05:00	0	0	0	1
202	default	2025-02-11 16:06:00	0	0	0	1
203	default	2025-02-11 16:07:00	0	0	0	1
204	default	2025-02-11 16:08:00	0	0	0	1
205	default	2025-02-11 16:09:00	0	0	0	1
206	default	2025-02-11 16:10:00	0	0	0	1
207	default	2025-02-11 16:11:00	0	0	0	1
208	default	2025-02-11 16:12:00	0	0	0	1
209	default	2025-02-11 16:13:00	0	0	0	1
210	default	2025-02-11 16:14:00	0	0	0	1
211	default	2025-02-11 16:15:00	0	0	0	1
212	default	2025-02-11 16:16:00	0	0	0	1
213	default	2025-02-11 16:17:00	0	0	0	1
214	default	2025-02-11 16:18:00	0	0	0	1
215	default	2025-02-11 16:19:00	0	0	0	1
216	default	2025-02-11 16:20:00	0	0	0	1
217	default	2025-02-11 16:21:00	0	0	0	1
218	default	2025-02-11 16:22:00	0	0	0	1
219	default	2025-02-11 16:23:00	0	0	0	1
220	default	2025-02-11 16:24:00	0	0	0	1
221	default	2025-02-11 16:25:00	0	0	0	1
222	default	2025-02-11 16:26:00	0	0	0	1
223	default	2025-02-11 16:27:00	0	0	0	1
224	default	2025-02-11 16:28:00	0	0	0	1
225	default	2025-02-11 16:29:00	0	0	0	1
226	default	2025-02-11 16:30:00	0	0	0	1
227	default	2025-02-11 16:31:00	0	0	0	1
228	default	2025-02-11 16:32:00	0	0	0	1
229	default	2025-02-11 16:33:00	0	0	0	1
230	default	2025-02-11 16:34:00	0	0	0	1
231	default	2025-02-11 16:35:00	0	0	0	1
232	default	2025-02-11 16:36:00	0	0	0	1
233	default	2025-02-11 16:37:00	0	0	0	1
234	default	2025-02-11 16:38:00	0	0	0	1
235	default	2025-02-11 16:39:00	0	0	0	1
236	default	2025-02-11 16:40:00	0	0	0	1
237	default	2025-02-11 16:41:00	0	0	0	1
238	default	2025-02-11 16:42:00	0	0	0	1
239	default	2025-02-11 16:43:00	0	0	0	1
240	default	2025-02-11 16:44:00	0	0	0	1
241	default	2025-02-11 16:45:00	0	0	0	1
242	default	2025-02-11 16:46:00	0	0	0	1
243	default	2025-02-11 16:47:00	0	0	0	1
244	default	2025-02-11 16:48:00	0	0	0	1
245	default	2025-02-11 16:49:00	0	0	0	1
246	default	2025-02-11 16:50:00	0	0	0	1
247	default	2025-02-11 16:51:00	0	0	0	1
248	default	2025-02-11 16:52:00	0	0	0	1
249	default	2025-02-11 16:53:00	0	0	0	1
250	default	2025-02-11 16:54:00	0	0	0	1
251	default	2025-02-11 16:55:00	0	0	0	1
252	default	2025-02-11 16:56:00	0	0	0	1
253	default	2025-02-11 16:57:00	0	0	0	1
254	default	2025-02-11 16:58:00	0	0	0	1
255	default	2025-02-11 16:59:00	0	0	0	1
256	default	2025-02-11 17:00:00	0	0	0	1
257	default	2025-02-11 17:01:00	0	0	0	1
258	default	2025-02-11 17:02:00	0	0	0	1
259	default	2025-02-11 17:03:00	0	0	0	1
260	default	2025-02-11 17:04:00	0	0	0	1
261	default	2025-02-11 17:05:00	0	0	0	1
262	default	2025-02-11 17:06:00	0	0	0	1
263	default	2025-02-11 17:07:00	0	0	0	1
264	default	2025-02-11 17:08:00	0	0	0	1
265	default	2025-02-11 17:09:00	0	0	0	1
266	default	2025-02-11 17:10:00	0	0	0	1
267	default	2025-02-11 17:11:00	0	0	0	1
268	default	2025-02-11 17:12:00	0	0	0	1
269	default	2025-02-11 17:13:00	0	0	0	1
270	default	2025-02-11 17:14:00	0	0	0	1
271	default	2025-02-11 17:15:00	0	0	0	1
272	default	2025-02-11 17:16:00	0	0	0	1
273	default	2025-02-11 17:17:00	0	0	0	1
274	default	2025-02-11 17:18:00	0	0	0	1
275	default	2025-02-11 17:19:00	0	0	0	1
276	default	2025-02-11 17:20:00	0	0	0	1
277	default	2025-02-11 17:21:00	0	0	0	1
278	default	2025-02-11 17:22:00	0	0	0	1
279	default	2025-02-11 17:23:00	0	0	0	1
280	default	2025-02-11 17:24:00	0	0	0	1
281	default	2025-02-11 17:25:00	0	0	0	1
282	default	2025-02-11 17:26:00	0	0	0	1
283	default	2025-02-11 17:27:00	0	0	0	1
284	default	2025-02-11 17:28:00	0	0	0	1
285	default	2025-02-11 17:29:00	0	0	0	1
286	default	2025-02-11 17:30:00	0	0	0	1
287	default	2025-02-11 17:31:00	0	0	0	1
288	default	2025-02-11 17:32:00	0	0	0	1
289	default	2025-02-11 17:33:00	0	0	0	1
290	default	2025-02-11 17:34:00	0	0	0	1
291	default	2025-02-11 17:35:00	0	0	0	1
292	default	2025-02-11 17:36:00	0	0	0	1
293	default	2025-02-11 17:37:00	0	0	0	1
294	default	2025-02-11 17:38:00	0	0	0	1
295	default	2025-02-11 17:39:00	0	0	0	1
296	default	2025-02-11 17:40:00	0	0	0	1
297	default	2025-02-11 17:41:00	0	0	0	1
298	default	2025-02-11 17:42:00	0	0	0	1
299	default	2025-02-11 17:43:00	0	0	0	1
300	default	2025-02-11 17:44:00	0	0	0	1
301	default	2025-02-11 17:45:00	0	0	0	1
302	default	2025-02-11 17:46:00	0	0	0	1
303	default	2025-02-11 17:47:00	0	0	0	1
304	default	2025-02-11 17:48:00	0	0	0	1
305	default	2025-02-11 17:49:00	0	0	0	1
306	default	2025-02-11 17:50:00	0	0	0	1
307	default	2025-02-11 17:51:00	0	0	0	1
308	default	2025-02-11 17:52:00	0	0	0	1
309	default	2025-02-11 17:53:00	0	0	0	1
310	default	2025-02-11 17:54:00	0	0	0	1
311	default	2025-02-11 17:55:00	0	0	0	1
312	default	2025-02-11 17:56:00	0	0	0	1
313	default	2025-02-11 17:57:00	0	0	0	1
314	default	2025-02-11 17:58:00	0	0	0	1
315	default	2025-02-11 17:59:00	0	0	0	1
316	default	2025-02-11 18:00:00	0	0	0	1
317	default	2025-02-11 18:01:00	0	0	0	1
318	default	2025-02-11 18:02:00	0	0	0	1
319	default	2025-02-11 18:03:00	0	0	0	1
320	default	2025-02-11 18:04:00	0	0	0	1
321	default	2025-02-11 18:05:00	0	0	0	1
322	default	2025-02-11 18:06:00	0	0	0	1
323	default	2025-02-11 18:07:00	0	0	0	1
324	default	2025-02-11 18:08:00	0	0	0	1
325	default	2025-02-11 18:09:00	0	0	0	1
326	default	2025-02-11 18:10:00	0	0	0	1
327	default	2025-02-11 18:11:00	0	0	0	1
328	default	2025-02-11 18:12:00	0	0	0	1
329	default	2025-02-11 18:13:00	0	0	0	1
330	default	2025-02-11 18:14:00	0	0	0	1
331	default	2025-02-11 18:15:00	0	0	0	1
332	default	2025-02-11 18:16:00	0	0	0	1
333	default	2025-02-11 18:17:00	0	0	0	1
334	default	2025-02-11 18:18:00	0	0	0	1
335	default	2025-02-11 18:19:00	0	0	0	1
336	default	2025-02-11 18:20:00	0	0	0	1
337	default	2025-02-11 18:21:00	0	0	0	1
338	default	2025-02-11 18:22:00	0	0	0	1
339	default	2025-02-11 18:23:00	0	0	0	1
340	default	2025-02-11 18:24:00	0	0	0	1
341	default	2025-02-11 18:25:00	0	0	0	1
342	default	2025-02-11 18:26:00	0	0	0	1
343	default	2025-02-11 18:27:00	0	0	0	1
344	default	2025-02-11 18:28:00	0	0	0	1
345	default	2025-02-11 18:29:00	0	0	0	1
346	default	2025-02-11 18:30:00	0	0	0	1
347	default	2025-02-11 18:31:00	0	0	0	1
348	default	2025-02-11 18:32:00	0	0	0	1
349	default	2025-02-11 18:33:00	0	0	0	1
350	default	2025-02-11 18:34:00	0	0	0	1
351	default	2025-02-11 18:35:00	0	0	0	1
352	default	2025-02-11 18:36:00	0	0	0	1
353	default	2025-02-11 18:37:00	0	0	0	1
354	default	2025-02-11 18:38:00	0	0	0	1
355	default	2025-02-11 18:39:00	0	0	0	1
356	default	2025-02-11 18:40:00	0	0	0	1
357	default	2025-02-11 18:41:00	0	0	0	1
358	default	2025-02-11 18:42:00	0	0	0	1
359	default	2025-02-11 18:43:00	0	0	0	1
360	default	2025-02-11 18:44:00	0	0	0	1
361	default	2025-02-11 18:45:00	0	0	0	1
362	default	2025-02-11 18:46:00	0	0	0	1
363	default	2025-02-11 18:47:00	0	0	0	1
364	default	2025-02-11 18:48:00	0	0	0	1
365	default	2025-02-11 18:49:00	0	0	0	1
366	default	2025-02-11 18:50:00	0	0	0	1
367	default	2025-02-11 18:51:00	0	0	0	1
368	default	2025-02-11 18:52:00	0	0	0	1
369	default	2025-02-11 18:53:00	0	0	0	1
370	default	2025-02-11 18:54:00	0	0	0	1
371	default	2025-02-11 18:55:00	0	0	0	1
372	default	2025-02-11 18:56:00	0	0	0	1
373	default	2025-02-11 18:57:00	0	0	0	1
374	default	2025-02-11 18:58:00	0	0	0	1
375	default	2025-02-11 18:59:00	0	0	0	1
376	default	2025-02-11 19:00:00	0	0	0	1
377	default	2025-02-11 19:01:00	0	0	0	1
378	default	2025-02-11 19:02:00	0	0	0	1
379	default	2025-02-11 19:03:00	0	0	0	1
380	default	2025-02-11 19:04:00	0	0	0	1
381	default	2025-02-11 19:05:00	0	0	0	1
382	default	2025-02-11 19:06:00	0	0	0	1
383	default	2025-02-11 19:07:00	0	0	0	1
384	default	2025-02-11 19:08:00	0	0	0	1
385	default	2025-02-12 12:48:00	0	0	0	1
386	default	2025-02-12 12:49:00	0	0	0	1
387	default	2025-02-12 12:50:00	0	0	1	1
388	default	2025-02-12 12:51:00	0	0	1	1
389	default	2025-02-12 12:52:00	0	0	0	1
390	default	2025-02-12 12:53:00	0	0	0	1
391	default	2025-02-12 12:54:00	0	0	0	1
392	default	2025-02-12 12:55:00	0	0	0	1
393	default	2025-02-12 12:56:00	0	0	0	1
394	default	2025-02-12 12:57:00	0	0	0	1
395	default	2025-02-12 12:58:00	0	0	0	1
396	default	2025-02-12 12:59:00	0	0	0	1
397	default	2025-02-12 13:00:00	0	0	0	1
398	default	2025-02-12 13:01:00	0	0	0	1
399	default	2025-02-12 13:02:00	0	0	0	1
400	default	2025-02-12 14:14:00	0	0	0	1
401	default	2025-02-12 14:15:00	0	0	0	1
402	default	2025-02-12 14:16:00	0	0	0	1
403	default	2025-02-12 14:17:00	0	0	0	1
404	default	2025-02-12 14:18:00	0	0	0	1
405	default	2025-02-12 14:19:00	0	0	0	1
406	default	2025-02-12 14:20:00	0	0	0	1
407	default	2025-02-12 14:21:00	0	0	0	1
408	default	2025-02-12 14:22:00	0	0	0	1
409	default	2025-02-12 14:23:00	0	0	0	1
410	default	2025-02-12 14:24:00	0	0	0	1
411	default	2025-02-12 14:25:00	0	0	0	1
412	default	2025-02-12 14:26:00	0	0	0	1
413	default	2025-02-12 14:27:00	0	0	0	1
414	default	2025-02-12 14:28:00	0	0	0	1
415	default	2025-02-12 14:29:00	0	0	0	1
416	default	2025-02-12 14:30:00	0	0	0	1
417	default	2025-02-12 14:31:00	0	0	0	1
418	default	2025-02-12 14:32:00	0	0	0	1
419	default	2025-02-12 14:33:00	0	0	0	1
420	default	2025-02-12 14:34:00	0	0	0	1
421	default	2025-02-12 14:35:00	0	0	0	1
422	default	2025-02-12 14:36:00	0	0	0	1
423	default	2025-02-12 14:37:00	0	0	0	1
424	default	2025-02-12 14:38:00	0	0	0	1
425	default	2025-02-12 14:39:00	0	0	0	1
426	default	2025-02-12 14:40:00	0	0	0	1
427	default	2025-02-12 14:41:00	0	0	0	1
428	default	2025-02-12 14:42:00	0	0	0	1
429	default	2025-02-12 14:43:00	0	0	0	1
430	default	2025-02-12 14:44:00	0	0	0	1
431	default	2025-02-12 14:45:00	0	0	0	1
432	default	2025-02-12 14:46:00	0	0	0	1
433	default	2025-02-12 14:47:00	0	0	0	1
434	default	2025-02-12 14:48:00	0	0	0	1
435	default	2025-02-12 14:49:00	0	0	0	1
436	default	2025-02-12 14:50:00	0	0	0	1
437	default	2025-02-12 14:51:00	0	0	0	1
438	default	2025-02-12 14:52:00	0	0	0	1
439	default	2025-02-12 14:53:00	0	0	0	1
440	default	2025-02-12 14:54:00	0	0	0	1
441	default	2025-02-12 14:55:00	0	0	0	1
442	default	2025-02-12 14:56:00	0	0	0	1
443	default	2025-02-12 14:57:00	0	0	0	1
444	default	2025-02-12 14:58:00	0	0	0	1
445	default	2025-02-12 14:59:00	0	0	0	1
446	default	2025-02-12 15:00:00	0	0	0	1
447	default	2025-02-12 15:01:00	0	0	0	1
448	default	2025-02-12 15:02:00	0	0	0	1
449	default	2025-02-12 15:03:00	0	0	0	1
450	default	2025-02-12 15:04:00	0	0	0	1
451	default	2025-02-12 15:05:00	0	0	0	1
452	default	2025-02-12 15:06:00	0	0	0	1
453	default	2025-02-12 15:07:00	0	0	0	1
454	default	2025-02-12 15:08:00	0	0	0	1
455	default	2025-02-12 15:09:00	0	0	0	1
456	default	2025-02-12 15:10:00	0	0	0	1
457	default	2025-02-12 15:11:00	0	0	0	1
458	default	2025-02-12 15:12:00	0	0	0	1
459	default	2025-02-12 15:13:00	0	0	0	1
460	default	2025-02-12 15:14:00	0	0	0	1
461	default	2025-02-12 15:15:00	0	0	0	1
462	default	2025-02-12 15:16:00	0	0	0	1
463	default	2025-02-12 15:17:00	0	0	0	1
464	default	2025-02-12 15:18:00	0	0	0	1
465	default	2025-02-12 15:19:00	0	0	0	1
466	default	2025-02-12 15:20:00	0	0	0	1
467	default	2025-02-12 15:21:00	0	0	0	1
468	default	2025-02-12 15:22:00	0	0	0	1
469	default	2025-02-12 15:23:00	0	0	0	1
470	default	2025-02-12 15:24:00	0	0	0	1
471	default	2025-02-12 15:25:00	0	0	0	1
472	default	2025-02-12 15:26:00	0	0	0	1
473	default	2025-02-12 15:27:00	0	0	0	1
474	default	2025-02-12 15:28:00	0	0	0	1
475	default	2025-02-12 15:29:00	0	0	0	1
476	default	2025-02-12 15:30:00	0	0	0	1
477	default	2025-02-12 15:31:00	0	0	0	1
478	default	2025-02-12 15:32:00	0	0	0	1
479	default	2025-02-12 15:33:00	0	0	0	1
480	default	2025-02-12 15:34:00	0	0	0	1
481	default	2025-02-12 15:35:00	0	0	0	1
482	default	2025-02-12 15:36:00	0	0	0	1
483	default	2025-02-12 15:37:00	0	0	0	1
484	default	2025-02-12 15:38:00	0	0	0	1
485	default	2025-02-12 15:39:00	0	0	0	1
486	default	2025-02-12 15:40:00	0	0	0	1
487	default	2025-02-12 15:41:00	0	0	0	1
488	default	2025-02-12 15:42:00	0	0	0	1
489	default	2025-02-12 15:43:00	0	0	0	1
490	default	2025-02-12 15:44:00	0	0	0	1
491	default	2025-02-12 15:45:00	0	0	0	1
492	default	2025-02-12 15:46:00	0	0	0	1
493	default	2025-02-12 15:47:00	0	0	0	1
494	default	2025-02-12 15:48:00	0	0	0	1
495	default	2025-02-12 15:49:00	0	0	0	1
496	default	2025-02-12 15:50:00	0	0	0	1
497	default	2025-02-12 15:51:00	0	0	0	1
498	default	2025-02-12 15:52:00	0	0	0	1
499	default	2025-02-12 15:53:00	0	0	0	1
500	default	2025-02-12 15:54:00	0	0	0	1
501	default	2025-02-12 15:55:00	0	0	0	1
502	default	2025-02-12 15:56:00	0	0	0	1
503	default	2025-02-12 15:57:00	0	0	0	1
504	default	2025-02-12 15:58:00	0	0	0	1
505	default	2025-02-12 15:59:00	0	0	0	1
506	default	2025-02-12 16:00:00	0	0	0	1
507	default	2025-02-12 16:01:00	0	0	0	1
508	default	2025-02-12 16:02:00	0	0	0	1
509	default	2025-02-12 16:03:00	0	0	0	1
510	default	2025-02-12 16:04:00	0	0	0	1
511	default	2025-02-12 16:05:00	0	0	0	1
512	default	2025-02-12 16:06:00	0	0	0	1
513	default	2025-02-12 16:07:00	0	0	0	1
514	default	2025-02-12 16:08:00	0	0	0	1
515	default	2025-02-12 16:09:00	0	0	0	1
516	default	2025-02-12 16:10:00	0	0	0	1
517	default	2025-02-12 16:11:00	0	0	0	1
518	default	2025-02-12 16:12:00	0	0	0	1
519	default	2025-02-12 16:13:00	0	0	0	1
520	default	2025-02-12 17:29:00	0	0	0	1
521	default	2025-02-12 17:30:00	0	0	0	1
522	default	2025-02-12 17:31:00	0	0	0	1
523	default	2025-02-12 17:32:00	0	0	0	1
524	default	2025-02-12 17:33:00	0	0	0	1
525	default	2025-02-12 17:34:00	0	0	0	1
526	default	2025-02-12 17:35:00	0	0	0	1
527	default	2025-02-12 17:36:00	0	0	0	1
528	default	2025-02-12 17:37:00	0	0	0	1
529	default	2025-02-12 17:38:00	0	0	0	1
530	default	2025-02-12 17:39:00	0	0	0	1
531	default	2025-02-12 17:40:00	0	0	0	1
532	default	2025-02-12 17:41:00	0	0	0	1
533	default	2025-02-12 17:42:00	0	0	0	1
534	default	2025-02-12 17:43:00	0	0	0	1
535	default	2025-02-12 17:44:00	0	0	0	1
536	default	2025-02-12 17:45:00	0	0	0	1
537	default	2025-02-12 17:46:00	0	0	0	1
538	default	2025-02-12 17:47:00	0	0	0	1
539	default	2025-02-12 17:48:00	0	0	0	1
540	default	2025-02-12 17:49:00	0	0	0	1
541	default	2025-02-12 17:50:00	0	0	0	1
542	default	2025-02-12 17:51:00	0	0	0	1
543	default	2025-02-12 17:52:00	0	0	0	1
544	default	2025-02-12 17:53:00	0	0	0	1
545	default	2025-02-12 17:54:00	0	0	0	1
546	default	2025-02-12 17:55:00	0	0	0	1
547	default	2025-02-12 17:56:00	0	0	0	1
548	default	2025-02-12 17:57:00	0	0	0	1
549	default	2025-02-12 17:58:00	0	0	0	1
550	default	2025-02-12 17:59:00	0	0	0	1
551	default	2025-02-12 18:00:00	0	0	0	1
552	default	2025-02-12 18:01:00	0	0	0	1
553	default	2025-02-12 18:02:00	0	0	0	1
554	default	2025-02-12 18:03:00	0	0	0	1
555	default	2025-02-12 18:04:00	0	0	0	1
556	default	2025-02-12 18:05:00	0	0	0	1
557	default	2025-02-12 18:06:00	0	0	0	1
558	default	2025-02-12 18:07:00	0	0	0	1
559	default	2025-02-12 18:08:00	0	0	0	1
560	default	2025-02-12 18:09:00	0	0	0	1
561	default	2025-02-12 18:10:00	0	0	0	1
562	default	2025-02-12 18:11:00	0	0	0	1
563	default	2025-02-12 18:12:00	0	0	0	1
564	default	2025-02-12 18:13:00	0	0	0	1
565	default	2025-02-12 18:14:00	0	0	0	1
566	default	2025-02-12 18:15:00	0	0	0	1
567	default	2025-02-12 18:16:00	0	0	0	1
568	default	2025-02-12 18:17:00	0	0	0	1
569	default	2025-02-12 18:18:00	0	0	0	1
570	default	2025-02-12 18:19:00	0	0	0	1
571	default	2025-02-12 18:20:00	0	0	0	1
572	default	2025-02-12 18:21:00	0	0	0	1
573	default	2025-02-12 18:22:00	0	0	0	1
574	default	2025-02-12 18:23:00	0	0	0	1
575	default	2025-02-12 18:24:00	0	0	0	1
576	default	2025-02-12 18:25:00	0	0	0	1
577	default	2025-02-12 18:26:00	0	0	0	1
578	default	2025-02-12 18:27:00	0	0	0	1
579	default	2025-02-12 18:28:00	0	0	0	1
580	default	2025-02-12 20:14:00	0	0	0	1
581	default	2025-02-10 19:00:00	0	0	2	60
582	default	2025-02-12 20:15:00	0	0	0	1
583	default	2025-02-10 18:00:00	0	0	1	60
584	default	2025-02-12 20:16:00	0	0	0	1
585	default	2025-02-12 20:17:00	0	0	0	1
586	default	2025-02-12 20:18:00	0	0	0	1
587	default	2025-02-12 20:19:00	0	0	0	1
588	default	2025-02-12 20:20:00	0	0	0	1
589	default	2025-02-12 20:21:00	0	0	0	1
590	default	2025-02-12 20:22:00	0	0	0	1
591	default	2025-02-12 20:23:00	0	0	0	1
592	default	2025-02-12 20:24:00	0	0	0	1
593	default	2025-02-12 20:25:00	0	0	0	1
594	default	2025-02-12 20:26:00	0	0	0	1
595	default	2025-02-12 20:27:00	0	0	0	1
596	default	2025-02-12 20:28:00	0	0	0	1
597	default	2025-02-12 20:29:00	0	0	0	1
598	default	2025-02-12 20:30:00	0	0	0	1
599	default	2025-02-12 20:31:00	0	0	0	1
600	default	2025-02-12 20:32:00	0	0	0	1
601	default	2025-02-12 20:33:00	0	0	0	1
602	default	2025-02-12 20:34:00	0	0	0	1
603	default	2025-02-12 20:35:00	0	0	0	1
604	default	2025-02-12 20:36:00	0	0	0	1
605	default	2025-02-12 20:37:00	0	0	0	1
606	default	2025-02-12 20:38:00	0	0	0	1
607	default	2025-02-12 20:39:00	0	0	0	1
608	default	2025-02-12 20:40:00	0	0	0	1
609	default	2025-02-12 20:41:00	0	0	0	1
610	default	2025-02-12 20:42:00	0	0	0	1
611	default	2025-02-12 20:43:00	0	0	0	1
612	default	2025-02-12 20:44:00	0	0	0	1
613	default	2025-02-12 20:45:00	0	0	0	1
614	default	2025-02-12 20:46:00	0	0	0	1
615	default	2025-02-12 20:47:00	0	0	0	1
616	default	2025-02-12 20:48:00	0	0	1	1
617	default	2025-02-12 20:49:00	0	0	0	1
618	default	2025-02-12 20:50:00	0	0	0	1
619	default	2025-02-12 20:51:00	0	0	0	1
620	default	2025-02-12 20:52:00	0	0	0	1
621	default	2025-02-12 20:53:00	0	0	0	1
622	default	2025-02-12 20:54:00	0	0	0	1
623	default	2025-02-12 20:55:00	0	0	0	1
624	default	2025-02-12 20:56:00	0	0	0	1
625	default	2025-02-12 20:57:00	0	0	0	1
626	default	2025-02-12 20:58:00	0	0	0	1
627	default	2025-02-12 20:59:00	0	0	0	1
628	default	2025-02-12 21:00:00	0	0	0	1
629	default	2025-02-10 20:00:00	0	0	0	60
630	default	2025-02-12 21:01:00	0	0	0	1
631	default	2025-02-12 21:02:00	0	0	0	1
632	default	2025-02-12 21:03:00	0	0	0	1
633	default	2025-02-12 21:04:00	0	0	0	1
634	default	2025-02-12 21:05:00	0	0	0	1
635	default	2025-02-12 21:06:00	0	0	0	1
636	default	2025-02-12 21:07:00	0	0	0	1
637	default	2025-02-12 21:08:00	0	0	0	1
638	default	2025-02-12 21:09:00	0	0	0	1
639	default	2025-02-12 21:10:00	0	0	0	1
640	default	2025-02-12 21:11:00	0	0	0	1
641	default	2025-02-12 21:12:00	0	0	0	1
642	default	2025-02-12 21:13:00	0	0	0	1
643	default	2025-02-12 21:14:00	0	0	0	1
644	default	2025-02-12 21:15:00	0	0	0	1
645	default	2025-02-12 21:16:00	0	0	0	1
646	default	2025-02-12 21:17:00	0	0	0	1
647	default	2025-02-12 21:18:00	0	0	0	1
648	default	2025-02-12 21:19:00	0	0	0	1
649	default	2025-02-12 21:20:00	0	0	0	1
650	default	2025-02-12 21:21:00	0	0	0	1
651	default	2025-02-12 21:22:00	0	0	0	1
652	default	2025-02-12 21:23:00	0	0	0	1
653	default	2025-02-12 21:24:00	0	0	0	1
654	default	2025-02-12 21:25:00	0	0	0	1
655	default	2025-02-12 21:26:00	0	0	0	1
656	default	2025-02-12 21:27:00	0	0	0	1
657	default	2025-02-12 21:28:00	0	0	0	1
658	default	2025-02-12 21:30:00	0	0	0	1
659	default	2025-02-12 21:31:00	0	0	0	1
660	default	2025-02-12 21:32:00	0	0	1	1
661	default	2025-02-12 21:33:00	0	0	0	1
662	default	2025-02-12 21:34:00	0	0	0	1
663	default	2025-02-12 21:35:00	0	0	0	1
664	default	2025-02-12 21:36:00	0	0	0	1
665	default	2025-02-12 21:37:00	0	0	0	1
666	default	2025-02-12 21:38:00	0	0	0	1
667	default	2025-02-12 21:39:00	0	0	0	1
668	default	2025-02-12 21:40:00	0	0	0	1
669	default	2025-02-12 21:41:00	0	0	0	1
670	default	2025-02-12 21:42:00	0	0	0	1
671	default	2025-02-12 21:43:00	0	0	0	1
672	default	2025-02-12 21:44:00	0	0	0	1
673	default	2025-02-12 21:45:00	0	0	0	1
674	default	2025-02-12 21:46:00	0	0	0	1
675	default	2025-02-12 21:47:00	0	0	0	1
676	default	2025-02-12 21:48:00	0	0	0	1
677	default	2025-02-12 21:49:00	0	0	0	1
678	default	2025-02-12 21:50:00	0	0	0	1
679	default	2025-02-12 21:51:00	0	0	0	1
680	default	2025-02-12 21:52:00	0	0	0	1
681	default	2025-02-12 21:53:00	0	0	0	1
682	default	2025-02-12 21:54:00	0	0	1	1
683	default	2025-02-13 11:43:00	0	0	0	1
684	default	2025-02-11 08:00:00	0	0	0	60
685	default	2025-02-13 11:44:00	0	0	0	1
686	default	2025-02-13 11:45:00	0	0	0	1
687	default	2025-02-13 11:46:00	0	0	0	1
688	default	2025-02-13 11:47:00	0	0	0	1
689	default	2025-02-13 11:48:00	0	0	0	1
690	default	2025-02-13 11:49:00	0	0	0	1
691	default	2025-02-13 11:50:00	0	0	0	1
692	default	2025-02-13 11:51:00	0	0	0	1
693	default	2025-02-13 11:52:00	0	0	0	1
694	default	2025-02-13 11:53:00	0	0	0	1
695	default	2025-02-13 11:54:00	0	0	0	1
696	default	2025-02-13 11:55:00	0	0	0	1
697	default	2025-02-13 11:56:00	0	0	0	1
698	default	2025-02-13 11:57:00	0	0	0	1
699	default	2025-02-13 11:58:00	0	0	0	1
700	default	2025-02-13 11:59:00	0	0	0	1
701	default	2025-02-13 12:00:00	0	0	0	1
702	default	2025-02-13 12:01:00	0	0	0	1
703	default	2025-02-13 12:02:00	0	0	0	1
704	default	2025-02-13 12:03:00	0	0	0	1
705	default	2025-02-13 12:04:00	0	0	0	1
706	default	2025-02-13 12:05:00	0	0	0	1
707	default	2025-02-13 12:06:00	0	0	0	1
708	default	2025-02-13 12:07:00	0	0	0	1
709	default	2025-02-13 12:08:00	0	0	0	1
710	default	2025-02-13 12:09:00	0	0	0	1
711	default	2025-02-13 12:10:00	0	0	0	1
712	default	2025-02-13 12:11:00	0	0	0	1
713	default	2025-02-13 12:12:00	0	0	0	1
714	default	2025-02-13 12:13:00	0	0	0	1
715	default	2025-02-13 12:14:00	0	0	0	1
716	default	2025-02-13 12:15:00	0	0	0	1
717	default	2025-02-13 12:16:00	0	0	0	1
718	default	2025-02-13 12:17:00	0	0	0	1
719	default	2025-02-13 12:18:00	0	0	0	1
720	default	2025-02-13 12:20:00	0	0	0	1
721	default	2025-02-13 12:21:00	0	0	0	1
722	default	2025-02-13 12:22:00	0	0	0	1
723	default	2025-02-13 12:23:00	0	0	0	1
724	default	2025-02-13 12:24:00	0	0	0	1
725	default	2025-02-13 12:25:00	0	0	0	1
726	default	2025-02-13 12:26:00	0	0	0	1
727	default	2025-02-13 12:27:00	0	0	0	1
728	default	2025-02-13 12:28:00	0	0	0	1
729	default	2025-02-13 12:29:00	0	0	0	1
730	default	2025-02-13 12:30:00	0	0	0	1
731	default	2025-02-13 12:31:00	0	0	0	1
732	default	2025-02-13 12:32:00	0	0	0	1
733	default	2025-02-13 12:33:00	0	0	0	1
734	default	2025-02-13 12:34:00	0	0	0	1
735	default	2025-02-13 12:35:00	0	0	0	1
736	default	2025-02-13 12:36:00	0	0	0	1
737	default	2025-02-13 12:37:00	0	0	0	1
738	default	2025-02-13 12:38:00	0	0	0	1
739	default	2025-02-13 12:39:00	0	0	0	1
740	default	2025-02-13 12:40:00	0	0	0	1
741	default	2025-02-13 12:41:00	0	0	0	1
742	default	2025-02-13 12:42:00	0	0	0	1
743	default	2025-02-13 12:43:00	0	0	0	1
744	default	2025-02-13 12:44:00	0	0	0	1
745	default	2025-02-13 12:45:00	0	0	0	1
746	default	2025-02-13 12:46:00	0	0	0	1
747	default	2025-02-13 12:47:00	0	0	0	1
748	default	2025-02-13 12:48:00	0	0	0	1
749	default	2025-02-13 12:49:00	0	0	0	1
750	default	2025-02-13 12:50:00	0	0	0	1
751	default	2025-02-13 12:51:00	0	0	0	1
752	default	2025-02-13 12:52:00	0	0	0	1
753	default	2025-02-13 12:53:00	0	0	0	1
754	default	2025-02-13 12:54:00	0	0	0	1
755	default	2025-02-13 12:55:00	0	0	0	1
756	default	2025-02-13 12:56:00	0	0	0	1
757	default	2025-02-13 12:57:00	0	0	0	1
758	default	2025-02-13 12:58:00	0	0	0	1
759	default	2025-02-13 12:59:00	0	0	0	1
760	default	2025-02-13 13:00:00	0	0	0	1
761	default	2025-02-13 13:01:00	0	0	0	1
762	default	2025-02-13 13:02:00	0	0	0	1
763	default	2025-02-13 13:03:00	0	0	0	1
764	default	2025-02-13 13:04:00	0	0	0	1
765	default	2025-02-13 13:05:00	0	0	0	1
766	default	2025-02-13 13:06:00	0	0	0	1
767	default	2025-02-13 13:07:00	0	0	0	1
768	default	2025-02-13 13:08:00	0	0	0	1
769	default	2025-02-13 13:09:00	0	0	0	1
770	default	2025-02-13 13:10:00	0	0	0	1
771	default	2025-02-13 13:11:00	0	0	0	1
772	default	2025-02-13 13:12:00	0	0	0	1
773	default	2025-02-13 13:13:00	0	0	0	1
774	default	2025-02-13 13:14:00	0	0	0	1
775	default	2025-02-13 13:15:00	0	0	0	1
776	default	2025-02-13 13:16:00	0	0	0	1
777	default	2025-02-13 13:17:00	0	0	0	1
778	default	2025-02-13 13:18:00	0	0	0	1
779	default	2025-02-13 13:19:00	0	0	0	1
780	default	2025-02-13 13:20:00	0	0	0	1
781	default	2025-02-13 13:21:00	0	0	0	1
782	default	2025-02-13 13:22:00	0	0	0	1
783	default	2025-02-13 13:23:00	0	0	0	1
784	default	2025-02-13 13:24:00	0	0	0	1
785	default	2025-02-13 13:25:00	0	0	0	1
786	default	2025-02-13 13:26:00	0	0	0	1
787	default	2025-02-13 13:27:00	0	0	0	1
788	default	2025-02-13 13:28:00	0	0	0	1
789	default	2025-02-13 13:29:00	0	0	0	1
790	default	2025-02-13 13:30:00	0	0	0	1
791	default	2025-02-13 13:31:00	0	0	0	1
792	default	2025-02-13 13:32:00	0	0	0	1
793	default	2025-02-13 13:33:00	0	0	0	1
794	default	2025-02-13 13:34:00	0	0	0	1
\.


--
-- Data for Name: serverpod_health_metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_health_metric (id, name, "serverId", "timestamp", "isHealthy", value, granularity) FROM stdin;
101	serverpod_database	default	2025-02-11 13:10:00	t	0.050539	1
102	serverpod_database	default	2025-02-11 13:11:00	t	0.009069	1
103	serverpod_database	default	2025-02-11 13:12:00	t	0.005004	1
104	serverpod_database	default	2025-02-11 13:13:00	t	0.003538	1
105	serverpod_database	default	2025-02-11 13:14:00	t	0.005418	1
106	serverpod_database	default	2025-02-11 13:15:00	t	0.002589	1
107	serverpod_database	default	2025-02-11 13:16:00	t	0.002997	1
108	serverpod_database	default	2025-02-11 13:17:00	t	0.008016	1
109	serverpod_database	default	2025-02-11 13:18:00	t	0.006584	1
110	serverpod_database	default	2025-02-11 13:19:00	t	0.006381	1
111	serverpod_database	default	2025-02-11 13:20:00	t	0.006701	1
112	serverpod_database	default	2025-02-11 13:21:00	t	0.019202	1
113	serverpod_database	default	2025-02-11 13:22:00	t	0.00616	1
114	serverpod_database	default	2025-02-11 13:23:00	t	0.006759	1
115	serverpod_database	default	2025-02-11 13:24:00	t	0.005912	1
116	serverpod_database	default	2025-02-11 13:25:00	t	0.017168	1
117	serverpod_database	default	2025-02-11 13:26:00	t	0.005958	1
118	serverpod_database	default	2025-02-11 13:35:00	t	0.025426	1
119	serverpod_database	default	2025-02-11 13:36:00	t	0.002551	1
120	serverpod_database	default	2025-02-11 13:37:00	t	0.013189	1
121	serverpod_database	default	2025-02-11 13:38:00	t	0.002912	1
122	serverpod_database	default	2025-02-11 13:39:00	t	0.012967	1
123	serverpod_database	default	2025-02-11 13:40:00	t	0.001913	1
124	serverpod_database	default	2025-02-11 13:41:00	t	0.003999	1
125	serverpod_database	default	2025-02-11 13:42:00	t	0.012925	1
126	serverpod_database	default	2025-02-11 13:43:00	t	0.013371	1
127	serverpod_database	default	2025-02-11 13:44:00	t	0.001913	1
128	serverpod_database	default	2025-02-11 13:45:00	t	0.012685	1
129	serverpod_database	default	2025-02-11 13:46:00	t	0.014331	1
130	serverpod_database	default	2025-02-11 13:47:00	t	0.01215	1
131	serverpod_database	default	2025-02-11 13:48:00	t	0.012719	1
132	serverpod_database	default	2025-02-11 13:49:00	t	0.002013	1
133	serverpod_database	default	2025-02-11 13:50:00	t	0.012561	1
134	serverpod_database	default	2025-02-11 13:51:00	t	0.013023	1
135	serverpod_database	default	2025-02-11 13:52:00	t	0.011999	1
136	serverpod_database	default	2025-02-11 13:53:00	t	0.012517	1
137	serverpod_database	default	2025-02-11 13:54:00	t	0.013067	1
138	serverpod_database	default	2025-02-11 13:55:00	t	0.012	1
139	serverpod_database	default	2025-02-11 13:56:00	t	0.002372	1
140	serverpod_database	default	2025-02-11 13:57:00	t	0.012492	1
141	serverpod_database	default	2025-02-11 13:58:00	t	0.009999	1
142	serverpod_database	default	2025-02-11 13:59:00	t	0.002999	1
143	serverpod_database	default	2025-02-11 14:00:00	t	0.001962	1
144	serverpod_database	default	2025-02-11 14:01:00	t	0.003003	1
145	serverpod_database	default	2025-02-11 14:02:00	t	0.001996	1
146	serverpod_database	default	2025-02-11 14:03:00	t	0.013607	1
147	serverpod_database	default	2025-02-11 14:04:00	t	0.001934	1
148	serverpod_database	default	2025-02-11 14:05:00	t	0.002561	1
149	serverpod_database	default	2025-02-11 14:06:00	t	0.001908	1
150	serverpod_database	default	2025-02-11 14:08:00	t	0.009	1
151	serverpod_database	default	2025-02-11 14:09:00	t	0.002976	1
152	serverpod_database	default	2025-02-11 14:10:00	t	0.002954	1
153	serverpod_database	default	2025-02-11 14:11:00	t	0.014442	1
154	serverpod_database	default	2025-02-11 14:12:00	t	0.003	1
155	serverpod_database	default	2025-02-11 14:13:00	t	0.002018	1
156	serverpod_database	default	2025-02-11 14:14:00	t	0.005004	1
157	serverpod_database	default	2025-02-11 14:17:00	t	0.009	1
158	serverpod_database	default	2025-02-11 14:18:00	t	0.013031	1
159	serverpod_database	default	2025-02-11 14:19:00	t	0.013267	1
160	serverpod_database	default	2025-02-11 14:20:00	t	0.013574	1
161	serverpod_database	default	2025-02-11 14:21:00	t	0.012971	1
162	serverpod_database	default	2025-02-11 14:22:00	t	0.002034	1
163	serverpod_database	default	2025-02-11 14:23:00	t	0.002	1
164	serverpod_database	default	2025-02-11 15:27:00	t	0.013182	1
166	serverpod_database	default	2025-02-11 15:28:00	t	0.00203	1
167	serverpod_database	default	2025-02-11 15:29:00	t	0.001998	1
168	serverpod_database	default	2025-02-11 15:30:00	t	0.002038	1
169	serverpod_database	default	2025-02-11 15:31:00	t	0.013183	1
170	serverpod_database	default	2025-02-11 15:32:00	t	0.013309	1
171	serverpod_database	default	2025-02-11 15:33:00	t	0.012732	1
172	serverpod_database	default	2025-02-11 15:34:00	t	0.012573	1
173	serverpod_database	default	2025-02-11 15:35:00	t	0.002118	1
174	serverpod_database	default	2025-02-11 15:36:00	t	0.002024	1
175	serverpod_database	default	2025-02-11 15:37:00	t	0.002002	1
176	serverpod_database	default	2025-02-11 15:38:00	t	0.001254	1
177	serverpod_database	default	2025-02-11 15:39:00	t	0.002106	1
178	serverpod_database	default	2025-02-11 15:40:00	t	0.002	1
179	serverpod_database	default	2025-02-11 15:41:00	t	0.002	1
180	serverpod_database	default	2025-02-11 15:42:00	t	0.00194	1
181	serverpod_database	default	2025-02-11 15:43:00	t	0.001993	1
182	serverpod_database	default	2025-02-11 15:44:00	t	0.002278	1
183	serverpod_database	default	2025-02-11 15:45:00	t	0.011999	1
184	serverpod_database	default	2025-02-11 15:46:00	t	0.001993	1
185	serverpod_database	default	2025-02-11 15:47:00	t	0.014293	1
186	serverpod_database	default	2025-02-11 15:48:00	t	0.012751	1
187	serverpod_database	default	2025-02-11 15:49:00	t	0.001942	1
188	serverpod_database	default	2025-02-11 15:50:00	t	0.012425	1
189	serverpod_database	default	2025-02-11 15:51:00	t	0.001641	1
190	serverpod_database	default	2025-02-11 15:52:00	t	0.001997	1
191	serverpod_database	default	2025-02-11 15:53:00	t	0.011935	1
192	serverpod_database	default	2025-02-11 15:54:00	t	0.001974	1
193	serverpod_database	default	2025-02-11 15:55:00	t	0.00149	1
194	serverpod_database	default	2025-02-11 15:56:00	t	0.001592	1
195	serverpod_database	default	2025-02-11 15:57:00	t	0.001999	1
196	serverpod_database	default	2025-02-11 15:58:00	t	0.001661	1
197	serverpod_database	default	2025-02-11 15:59:00	t	0.001976	1
198	serverpod_database	default	2025-02-11 16:00:00	t	0.002	1
199	serverpod_database	default	2025-02-11 16:01:00	t	0.002289	1
200	serverpod_database	default	2025-02-11 16:02:00	t	0.002002	1
201	serverpod_database	default	2025-02-11 16:03:00	t	0.001934	1
202	serverpod_database	default	2025-02-11 16:04:00	t	0.001498	1
203	serverpod_database	default	2025-02-11 16:05:00	t	0.002	1
204	serverpod_database	default	2025-02-11 16:06:00	t	0.002387	1
205	serverpod_database	default	2025-02-11 16:07:00	t	0.00207	1
206	serverpod_database	default	2025-02-11 16:08:00	t	0.00173	1
207	serverpod_database	default	2025-02-11 16:09:00	t	0.00249	1
208	serverpod_database	default	2025-02-11 16:10:00	t	0.012396	1
209	serverpod_database	default	2025-02-11 16:11:00	t	0.002002	1
210	serverpod_database	default	2025-02-11 16:12:00	t	0.001936	1
211	serverpod_database	default	2025-02-11 16:13:00	t	0.001927	1
212	serverpod_database	default	2025-02-11 16:14:00	t	0.012251	1
213	serverpod_database	default	2025-02-11 16:15:00	t	0.001609	1
214	serverpod_database	default	2025-02-11 16:16:00	t	0.001572	1
215	serverpod_database	default	2025-02-11 16:17:00	t	0.001994	1
216	serverpod_database	default	2025-02-11 16:18:00	t	0.002315	1
217	serverpod_database	default	2025-02-11 16:19:00	t	0.000995	1
218	serverpod_database	default	2025-02-11 16:20:00	t	0.011863	1
219	serverpod_database	default	2025-02-11 16:21:00	t	0.00241	1
220	serverpod_database	default	2025-02-11 16:22:00	t	0.012387	1
221	serverpod_database	default	2025-02-11 16:23:00	t	0.002117	1
222	serverpod_database	default	2025-02-11 16:24:00	t	0.00117	1
223	serverpod_database	default	2025-02-11 16:25:00	t	0.00264	1
224	serverpod_database	default	2025-02-11 16:26:00	t	0.001614	1
225	serverpod_database	default	2025-02-11 16:27:00	t	0.001901	1
226	serverpod_database	default	2025-02-11 16:28:00	t	0.001936	1
227	serverpod_database	default	2025-02-11 16:29:00	t	0.011666	1
228	serverpod_database	default	2025-02-11 16:30:00	t	0.002065	1
229	serverpod_database	default	2025-02-11 16:31:00	t	0.002015	1
230	serverpod_database	default	2025-02-11 16:32:00	t	0.012158	1
231	serverpod_database	default	2025-02-11 16:33:00	t	0.011991	1
232	serverpod_database	default	2025-02-11 16:34:00	t	0.00188	1
233	serverpod_database	default	2025-02-11 16:35:00	t	0.011574	1
234	serverpod_database	default	2025-02-11 16:36:00	t	0.012005	1
235	serverpod_database	default	2025-02-11 16:37:00	t	0.012504	1
236	serverpod_database	default	2025-02-11 16:38:00	t	0.001617	1
237	serverpod_database	default	2025-02-11 16:39:00	t	0.012074	1
238	serverpod_database	default	2025-02-11 16:40:00	t	0.012925	1
239	serverpod_database	default	2025-02-11 16:41:00	t	0.012492	1
240	serverpod_database	default	2025-02-11 16:42:00	t	0.00195	1
241	serverpod_database	default	2025-02-11 16:43:00	t	0.001528	1
242	serverpod_database	default	2025-02-11 16:44:00	t	0.002738	1
243	serverpod_database	default	2025-02-11 16:45:00	t	0.012563	1
244	serverpod_database	default	2025-02-11 16:46:00	t	0.001698	1
245	serverpod_database	default	2025-02-11 16:47:00	t	0.002542	1
246	serverpod_database	default	2025-02-11 16:48:00	t	0.000993	1
247	serverpod_database	default	2025-02-11 16:49:00	t	0.001002	1
248	serverpod_database	default	2025-02-11 16:50:00	t	0.012467	1
249	serverpod_database	default	2025-02-11 16:51:00	t	0.001778	1
250	serverpod_database	default	2025-02-11 16:52:00	t	0.002172	1
251	serverpod_database	default	2025-02-11 16:53:00	t	0.002212	1
252	serverpod_database	default	2025-02-11 16:54:00	t	0.013763	1
253	serverpod_database	default	2025-02-11 16:55:00	t	0.001066	1
254	serverpod_database	default	2025-02-11 16:56:00	t	0.001	1
255	serverpod_database	default	2025-02-11 16:57:00	t	0.012268	1
256	serverpod_database	default	2025-02-11 16:58:00	t	0.004992	1
257	serverpod_database	default	2025-02-11 16:59:00	t	0.001619	1
258	serverpod_database	default	2025-02-11 17:00:00	t	0.001	1
259	serverpod_database	default	2025-02-11 17:01:00	t	0.001087	1
260	serverpod_database	default	2025-02-11 17:02:00	t	0.001001	1
261	serverpod_database	default	2025-02-11 17:03:00	t	0.001	1
262	serverpod_database	default	2025-02-11 17:04:00	t	0.001999	1
263	serverpod_database	default	2025-02-11 17:05:00	t	0.002	1
264	serverpod_database	default	2025-02-11 17:06:00	t	0.001	1
265	serverpod_database	default	2025-02-11 17:07:00	t	0.001665	1
266	serverpod_database	default	2025-02-11 17:08:00	t	0.001	1
267	serverpod_database	default	2025-02-11 17:09:00	t	0.00159	1
268	serverpod_database	default	2025-02-11 17:10:00	t	0.001986	1
269	serverpod_database	default	2025-02-11 17:11:00	t	0.000992	1
270	serverpod_database	default	2025-02-11 17:12:00	t	0.000996	1
271	serverpod_database	default	2025-02-11 17:13:00	t	0.001067	1
272	serverpod_database	default	2025-02-11 17:14:00	t	0.001117	1
273	serverpod_database	default	2025-02-11 17:15:00	t	0.011994	1
274	serverpod_database	default	2025-02-11 17:16:00	t	0.011586	1
275	serverpod_database	default	2025-02-11 17:17:00	t	0.014376	1
276	serverpod_database	default	2025-02-11 17:18:00	t	0.012001	1
277	serverpod_database	default	2025-02-11 17:19:00	t	0.000997	1
278	serverpod_database	default	2025-02-11 17:20:00	t	0.011162	1
279	serverpod_database	default	2025-02-11 17:21:00	t	0.011845	1
280	serverpod_database	default	2025-02-11 17:22:00	t	0.011999	1
281	serverpod_database	default	2025-02-11 17:23:00	t	0.01199	1
282	serverpod_database	default	2025-02-11 17:24:00	t	0.012006	1
283	serverpod_database	default	2025-02-11 17:25:00	t	0.011856	1
284	serverpod_database	default	2025-02-11 17:26:00	t	0.010999	1
285	serverpod_database	default	2025-02-11 17:27:00	t	0.006985	1
286	serverpod_database	default	2025-02-11 17:28:00	t	0.001589	1
287	serverpod_database	default	2025-02-11 17:29:00	t	0.012004	1
288	serverpod_database	default	2025-02-11 17:30:00	t	0.011994	1
289	serverpod_database	default	2025-02-11 17:31:00	t	0.001	1
290	serverpod_database	default	2025-02-11 17:32:00	t	0.011998	1
291	serverpod_database	default	2025-02-11 17:33:00	t	0.011001	1
292	serverpod_database	default	2025-02-11 17:34:00	t	0.002	1
293	serverpod_database	default	2025-02-11 17:35:00	t	0.002658	1
294	serverpod_database	default	2025-02-11 17:36:00	t	0.002001	1
295	serverpod_database	default	2025-02-11 17:37:00	t	0.002004	1
296	serverpod_database	default	2025-02-11 17:38:00	t	0.001595	1
297	serverpod_database	default	2025-02-11 17:39:00	t	0.006546	1
298	serverpod_database	default	2025-02-11 17:40:00	t	0.013	1
299	serverpod_database	default	2025-02-11 17:41:00	t	0.000997	1
300	serverpod_database	default	2025-02-11 17:42:00	t	0.012005	1
301	serverpod_database	default	2025-02-11 17:43:00	t	0.00199	1
302	serverpod_database	default	2025-02-11 17:44:00	t	0.011006	1
303	serverpod_database	default	2025-02-11 17:45:00	t	0.012821	1
304	serverpod_database	default	2025-02-11 17:46:00	t	0.011611	1
305	serverpod_database	default	2025-02-11 17:47:00	t	0.002005	1
306	serverpod_database	default	2025-02-11 17:48:00	t	0.012566	1
307	serverpod_database	default	2025-02-11 17:49:00	t	0.011937	1
308	serverpod_database	default	2025-02-11 17:50:00	t	0.003432	1
309	serverpod_database	default	2025-02-11 17:51:00	t	0.015953	1
310	serverpod_database	default	2025-02-11 17:52:00	t	0.002004	1
311	serverpod_database	default	2025-02-11 17:53:00	t	0.001976	1
312	serverpod_database	default	2025-02-11 17:54:00	t	0.001803	1
313	serverpod_database	default	2025-02-11 17:55:00	t	0.001978	1
314	serverpod_database	default	2025-02-11 17:56:00	t	0.001978	1
315	serverpod_database	default	2025-02-11 17:57:00	t	0.000999	1
316	serverpod_database	default	2025-02-11 17:58:00	t	0.002023	1
317	serverpod_database	default	2025-02-11 17:59:00	t	0.001026	1
318	serverpod_database	default	2025-02-11 18:00:00	t	0.001986	1
319	serverpod_database	default	2025-02-11 18:01:00	t	0.000975	1
320	serverpod_database	default	2025-02-11 18:02:00	t	0.001	1
321	serverpod_database	default	2025-02-11 18:03:00	t	0.001516	1
322	serverpod_database	default	2025-02-11 18:04:00	t	0.002028	1
323	serverpod_database	default	2025-02-11 18:05:00	t	0.001986	1
324	serverpod_database	default	2025-02-11 18:06:00	t	0.001017	1
325	serverpod_database	default	2025-02-11 18:07:00	t	0.001003	1
326	serverpod_database	default	2025-02-11 18:08:00	t	0.01199	1
327	serverpod_database	default	2025-02-11 18:09:00	t	0.012002	1
328	serverpod_database	default	2025-02-11 18:10:00	t	0.001963	1
329	serverpod_database	default	2025-02-11 18:11:00	t	0.011999	1
330	serverpod_database	default	2025-02-11 18:12:00	t	0.000997	1
331	serverpod_database	default	2025-02-11 18:13:00	t	0.011998	1
332	serverpod_database	default	2025-02-11 18:14:00	t	0.011513	1
333	serverpod_database	default	2025-02-11 18:15:00	t	0.012	1
334	serverpod_database	default	2025-02-11 18:16:00	t	0.012038	1
335	serverpod_database	default	2025-02-11 18:17:00	t	0.002	1
336	serverpod_database	default	2025-02-11 18:18:00	t	0.011965	1
337	serverpod_database	default	2025-02-11 18:19:00	t	0.012	1
338	serverpod_database	default	2025-02-11 18:20:00	t	0.011999	1
339	serverpod_database	default	2025-02-11 18:21:00	t	0.012001	1
340	serverpod_database	default	2025-02-11 18:22:00	t	0.012002	1
341	serverpod_database	default	2025-02-11 18:23:00	t	0.00098	1
342	serverpod_database	default	2025-02-11 18:24:00	t	0.011975	1
343	serverpod_database	default	2025-02-11 18:25:00	t	0.0124	1
344	serverpod_database	default	2025-02-11 18:26:00	t	0.012003	1
345	serverpod_database	default	2025-02-11 18:27:00	t	0.000982	1
346	serverpod_database	default	2025-02-11 18:28:00	t	0.011998	1
347	serverpod_database	default	2025-02-11 18:29:00	t	0.000999	1
348	serverpod_database	default	2025-02-11 18:30:00	t	0.001996	1
349	serverpod_database	default	2025-02-11 18:31:00	t	0.011001	1
350	serverpod_database	default	2025-02-11 18:32:00	t	0.012025	1
351	serverpod_database	default	2025-02-11 18:33:00	t	0.00199	1
352	serverpod_database	default	2025-02-11 18:34:00	t	0.012	1
353	serverpod_database	default	2025-02-11 18:35:00	t	0.012998	1
354	serverpod_database	default	2025-02-11 18:36:00	t	0.012339	1
355	serverpod_database	default	2025-02-11 18:37:00	t	0.001993	1
356	serverpod_database	default	2025-02-11 18:38:00	t	0.011445	1
357	serverpod_database	default	2025-02-11 18:39:00	t	0.011972	1
358	serverpod_database	default	2025-02-11 18:40:00	t	0.013001	1
359	serverpod_database	default	2025-02-11 18:41:00	t	0.011766	1
360	serverpod_database	default	2025-02-11 18:42:00	t	0.002003	1
361	serverpod_database	default	2025-02-11 18:43:00	t	0.011941	1
362	serverpod_database	default	2025-02-11 18:44:00	t	0.012017	1
363	serverpod_database	default	2025-02-11 18:45:00	t	0.011941	1
364	serverpod_database	default	2025-02-11 18:46:00	t	0.012002	1
365	serverpod_database	default	2025-02-11 18:47:00	t	0.000551	1
366	serverpod_database	default	2025-02-11 18:48:00	t	0.011372	1
367	serverpod_database	default	2025-02-11 18:49:00	t	0.001744	1
368	serverpod_database	default	2025-02-11 18:50:00	t	0.002001	1
369	serverpod_database	default	2025-02-11 18:51:00	t	0.01162	1
370	serverpod_database	default	2025-02-11 18:52:00	t	0.011227	1
371	serverpod_database	default	2025-02-11 18:53:00	t	0.012021	1
372	serverpod_database	default	2025-02-11 18:54:00	t	0.011873	1
373	serverpod_database	default	2025-02-11 18:55:00	t	0.011416	1
374	serverpod_database	default	2025-02-11 18:56:00	t	0.000981	1
375	serverpod_database	default	2025-02-11 18:57:00	t	0.000974	1
376	serverpod_database	default	2025-02-11 18:58:00	t	0.001003	1
377	serverpod_database	default	2025-02-11 18:59:00	t	0.012	1
378	serverpod_database	default	2025-02-11 19:00:00	t	0.002001	1
379	serverpod_database	default	2025-02-11 19:01:00	t	0.012	1
380	serverpod_database	default	2025-02-11 19:02:00	t	0.001003	1
381	serverpod_database	default	2025-02-11 19:03:00	t	0.001975	1
382	serverpod_database	default	2025-02-11 19:04:00	t	0.000993	1
383	serverpod_database	default	2025-02-11 19:05:00	t	0.001942	1
384	serverpod_database	default	2025-02-11 19:06:00	t	0.001761	1
385	serverpod_database	default	2025-02-11 19:07:00	t	0.002115	1
386	serverpod_database	default	2025-02-11 19:08:00	t	0.00099	1
387	serverpod_database	default	2025-02-12 12:48:00	t	0.01	1
388	serverpod_database	default	2025-02-12 12:49:00	t	0.002003	1
389	serverpod_database	default	2025-02-12 12:50:00	t	0.002881	1
390	serverpod_database	default	2025-02-12 12:51:00	t	0.005057	1
391	serverpod_database	default	2025-02-12 12:52:00	t	0.002	1
392	serverpod_database	default	2025-02-12 12:53:00	t	0.00257	1
393	serverpod_database	default	2025-02-12 12:54:00	t	0.001968	1
394	serverpod_database	default	2025-02-12 12:55:00	t	0.002968	1
395	serverpod_database	default	2025-02-12 12:56:00	t	0.001967	1
396	serverpod_database	default	2025-02-12 12:57:00	t	0.001874	1
397	serverpod_database	default	2025-02-12 12:58:00	t	0.002015	1
398	serverpod_database	default	2025-02-12 12:59:00	t	0.002954	1
399	serverpod_database	default	2025-02-12 13:00:00	t	0.002526	1
400	serverpod_database	default	2025-02-12 13:01:00	t	0.001556	1
401	serverpod_database	default	2025-02-12 13:02:00	t	0.001954	1
402	serverpod_database	default	2025-02-12 14:14:00	t	14.655447	1
404	serverpod_database	default	2025-02-12 14:15:00	t	0.002005	1
405	serverpod_database	default	2025-02-12 14:16:00	t	0.012351	1
406	serverpod_database	default	2025-02-12 14:17:00	t	0.01771	1
407	serverpod_database	default	2025-02-12 14:18:00	t	0.006306	1
408	serverpod_database	default	2025-02-12 14:19:00	t	0.017758	1
409	serverpod_database	default	2025-02-12 14:20:00	t	0.013389	1
410	serverpod_database	default	2025-02-12 14:21:00	t	0.016579	1
411	serverpod_database	default	2025-02-12 14:22:00	t	0.009467	1
412	serverpod_database	default	2025-02-12 14:23:00	t	0.018041	1
413	serverpod_database	default	2025-02-12 14:24:00	t	0.001998	1
414	serverpod_database	default	2025-02-12 14:25:00	t	0.016621	1
415	serverpod_database	default	2025-02-12 14:26:00	t	0.018445	1
416	serverpod_database	default	2025-02-12 14:27:00	t	0.015402	1
417	serverpod_database	default	2025-02-12 14:28:00	t	0.00604	1
418	serverpod_database	default	2025-02-12 14:29:00	t	0.020674	1
419	serverpod_database	default	2025-02-12 14:30:00	t	0.016804	1
420	serverpod_database	default	2025-02-12 14:31:00	t	0.015892	1
421	serverpod_database	default	2025-02-12 14:32:00	t	0.006494	1
422	serverpod_database	default	2025-02-12 14:33:00	t	0.004409	1
423	serverpod_database	default	2025-02-12 14:34:00	t	0.00399	1
424	serverpod_database	default	2025-02-12 14:35:00	t	0.006424	1
425	serverpod_database	default	2025-02-12 14:36:00	t	0.002906	1
426	serverpod_database	default	2025-02-12 14:37:00	t	0.005337	1
427	serverpod_database	default	2025-02-12 14:38:00	t	0.003907	1
428	serverpod_database	default	2025-02-12 14:39:00	t	0.005999	1
429	serverpod_database	default	2025-02-12 14:40:00	t	0.003997	1
430	serverpod_database	default	2025-02-12 14:41:00	t	0.005064	1
431	serverpod_database	default	2025-02-12 14:42:00	t	0.012409	1
432	serverpod_database	default	2025-02-12 14:43:00	t	0.001554	1
433	serverpod_database	default	2025-02-12 14:44:00	t	0.01743	1
434	serverpod_database	default	2025-02-12 14:45:00	t	0.002032	1
435	serverpod_database	default	2025-02-12 14:46:00	t	0.001998	1
436	serverpod_database	default	2025-02-12 14:47:00	t	0.005029	1
437	serverpod_database	default	2025-02-12 14:48:00	t	0.014691	1
438	serverpod_database	default	2025-02-12 14:49:00	t	0.005607	1
439	serverpod_database	default	2025-02-12 14:50:00	t	0.015635	1
440	serverpod_database	default	2025-02-12 14:51:00	t	0.016602	1
441	serverpod_database	default	2025-02-12 14:52:00	t	0.006042	1
442	serverpod_database	default	2025-02-12 14:53:00	t	0.005998	1
443	serverpod_database	default	2025-02-12 14:54:00	t	0.004002	1
444	serverpod_database	default	2025-02-12 14:55:00	t	0.006052	1
445	serverpod_database	default	2025-02-12 14:56:00	t	0.004995	1
446	serverpod_database	default	2025-02-12 14:57:00	t	0.005055	1
447	serverpod_database	default	2025-02-12 14:58:00	t	0.002003	1
448	serverpod_database	default	2025-02-12 14:59:00	t	0.002999	1
449	serverpod_database	default	2025-02-12 15:00:00	t	0.001915	1
450	serverpod_database	default	2025-02-12 15:01:00	t	0.001956	1
451	serverpod_database	default	2025-02-12 15:02:00	t	0.000999	1
452	serverpod_database	default	2025-02-12 15:03:00	t	0.001001	1
453	serverpod_database	default	2025-02-12 15:04:00	t	0.001996	1
454	serverpod_database	default	2025-02-12 15:05:00	t	0.00195	1
455	serverpod_database	default	2025-02-12 15:06:00	t	0.007994	1
456	serverpod_database	default	2025-02-12 15:07:00	t	0.01272	1
457	serverpod_database	default	2025-02-12 15:08:00	t	0.011972	1
458	serverpod_database	default	2025-02-12 15:09:00	t	0.011905	1
459	serverpod_database	default	2025-02-12 15:10:00	t	0.012181	1
460	serverpod_database	default	2025-02-12 15:11:00	t	0.002003	1
461	serverpod_database	default	2025-02-12 15:12:00	t	0.001914	1
462	serverpod_database	default	2025-02-12 15:13:00	t	0.012917	1
463	serverpod_database	default	2025-02-12 15:14:00	t	0.012136	1
464	serverpod_database	default	2025-02-12 15:15:00	t	0.011995	1
465	serverpod_database	default	2025-02-12 15:16:00	t	0.011917	1
466	serverpod_database	default	2025-02-12 15:17:00	t	0.012741	1
467	serverpod_database	default	2025-02-12 15:18:00	t	0.001998	1
468	serverpod_database	default	2025-02-12 15:19:00	t	0.011975	1
469	serverpod_database	default	2025-02-12 15:20:00	t	0.012992	1
470	serverpod_database	default	2025-02-12 15:21:00	t	0.012648	1
471	serverpod_database	default	2025-02-12 15:22:00	t	0.011039	1
472	serverpod_database	default	2025-02-12 15:23:00	t	0.012092	1
473	serverpod_database	default	2025-02-12 15:24:00	t	0.013005	1
474	serverpod_database	default	2025-02-12 15:25:00	t	0.001959	1
475	serverpod_database	default	2025-02-12 15:26:00	t	0.011965	1
476	serverpod_database	default	2025-02-12 15:27:00	t	0.001909	1
477	serverpod_database	default	2025-02-12 15:28:00	t	0.012002	1
478	serverpod_database	default	2025-02-12 15:29:00	t	0.001998	1
479	serverpod_database	default	2025-02-12 15:30:00	t	0.01297	1
480	serverpod_database	default	2025-02-12 15:31:00	t	0.001002	1
481	serverpod_database	default	2025-02-12 15:32:00	t	0.022954	1
482	serverpod_database	default	2025-02-12 15:33:00	t	0.012002	1
483	serverpod_database	default	2025-02-12 15:34:00	t	0.012954	1
484	serverpod_database	default	2025-02-12 15:35:00	t	0.012234	1
485	serverpod_database	default	2025-02-12 15:36:00	t	0.011914	1
486	serverpod_database	default	2025-02-12 15:37:00	t	0.001917	1
487	serverpod_database	default	2025-02-12 15:38:00	t	0.001003	1
488	serverpod_database	default	2025-02-12 15:39:00	t	0.011995	1
489	serverpod_database	default	2025-02-12 15:40:00	t	0.002	1
490	serverpod_database	default	2025-02-12 15:41:00	t	0.011999	1
491	serverpod_database	default	2025-02-12 15:42:00	t	0.002009	1
492	serverpod_database	default	2025-02-12 15:43:00	t	0.0014	1
493	serverpod_database	default	2025-02-12 15:44:00	t	0.012944	1
494	serverpod_database	default	2025-02-12 15:45:00	t	0.013121	1
495	serverpod_database	default	2025-02-12 15:46:00	t	0.012623	1
496	serverpod_database	default	2025-02-12 15:47:00	t	0.000965	1
497	serverpod_database	default	2025-02-12 15:48:00	t	0.000962	1
498	serverpod_database	default	2025-02-12 15:49:00	t	0.001707	1
499	serverpod_database	default	2025-02-12 15:50:00	t	0.002002	1
500	serverpod_database	default	2025-02-12 15:51:00	t	0.002004	1
501	serverpod_database	default	2025-02-12 15:52:00	t	0.003008	1
502	serverpod_database	default	2025-02-12 15:53:00	t	0.001001	1
503	serverpod_database	default	2025-02-12 15:54:00	t	0.001414	1
504	serverpod_database	default	2025-02-12 15:55:00	t	0.026015	1
505	serverpod_database	default	2025-02-12 15:56:00	t	0.000964	1
506	serverpod_database	default	2025-02-12 15:57:00	t	0.000999	1
507	serverpod_database	default	2025-02-12 15:58:00	t	0.001006	1
508	serverpod_database	default	2025-02-12 15:59:00	t	0.001001	1
509	serverpod_database	default	2025-02-12 16:00:00	t	0.001003	1
510	serverpod_database	default	2025-02-12 16:01:00	t	0.000971	1
511	serverpod_database	default	2025-02-12 16:02:00	t	0.002001	1
512	serverpod_database	default	2025-02-12 16:03:00	t	0.001944	1
513	serverpod_database	default	2025-02-12 16:04:00	t	0.001997	1
514	serverpod_database	default	2025-02-12 16:05:00	t	0.002038	1
515	serverpod_database	default	2025-02-12 16:06:00	t	0.00297	1
516	serverpod_database	default	2025-02-12 16:07:00	t	0.00152	1
517	serverpod_database	default	2025-02-12 16:08:00	t	0.002038	1
518	serverpod_database	default	2025-02-12 16:09:00	t	0.001	1
519	serverpod_database	default	2025-02-12 16:10:00	t	0.002	1
520	serverpod_database	default	2025-02-12 16:11:00	t	0.001752	1
521	serverpod_database	default	2025-02-12 16:12:00	t	0.001963	1
522	serverpod_database	default	2025-02-12 16:13:00	t	0.001997	1
523	serverpod_database	default	2025-02-12 17:29:00	t	0.079972	1
525	serverpod_database	default	2025-02-12 17:30:00	t	0.002003	1
526	serverpod_database	default	2025-02-12 17:31:00	t	0.003012	1
527	serverpod_database	default	2025-02-12 17:32:00	t	0.016197	1
528	serverpod_database	default	2025-02-12 17:33:00	t	0.015469	1
529	serverpod_database	default	2025-02-12 17:34:00	t	0.013725	1
530	serverpod_database	default	2025-02-12 17:35:00	t	0.011688	1
531	serverpod_database	default	2025-02-12 17:36:00	t	0.003822	1
532	serverpod_database	default	2025-02-12 17:37:00	t	0.015715	1
533	serverpod_database	default	2025-02-12 17:38:00	t	0.005077	1
534	serverpod_database	default	2025-02-12 17:39:00	t	0.015367	1
535	serverpod_database	default	2025-02-12 17:40:00	t	0.014459	1
536	serverpod_database	default	2025-02-12 17:41:00	t	0.004665	1
537	serverpod_database	default	2025-02-12 17:42:00	t	0.016311	1
538	serverpod_database	default	2025-02-12 17:43:00	t	0.004961	1
539	serverpod_database	default	2025-02-12 17:44:00	t	0.004056	1
540	serverpod_database	default	2025-02-12 17:45:00	t	0.006406	1
541	serverpod_database	default	2025-02-12 17:46:00	t	0.016626	1
542	serverpod_database	default	2025-02-12 17:47:00	t	0.016641	1
543	serverpod_database	default	2025-02-12 17:48:00	t	0.015342	1
544	serverpod_database	default	2025-02-12 17:49:00	t	0.004812	1
545	serverpod_database	default	2025-02-12 17:50:00	t	0.013575	1
546	serverpod_database	default	2025-02-12 17:51:00	t	0.014981	1
547	serverpod_database	default	2025-02-12 17:52:00	t	0.015254	1
548	serverpod_database	default	2025-02-12 17:53:00	t	0.017019	1
549	serverpod_database	default	2025-02-12 17:54:00	t	0.015703	1
550	serverpod_database	default	2025-02-12 17:55:00	t	0.015669	1
551	serverpod_database	default	2025-02-12 17:56:00	t	0.015979	1
552	serverpod_database	default	2025-02-12 17:57:00	t	0.015734	1
553	serverpod_database	default	2025-02-12 17:58:00	t	0.016619	1
554	serverpod_database	default	2025-02-12 17:59:00	t	0.015694	1
555	serverpod_database	default	2025-02-12 18:00:00	t	0.017787	1
556	serverpod_database	default	2025-02-12 18:01:00	t	0.002006	1
557	serverpod_database	default	2025-02-12 18:02:00	t	0.013573	1
558	serverpod_database	default	2025-02-12 18:03:00	t	0.004302	1
559	serverpod_database	default	2025-02-12 18:04:00	t	0.016081	1
560	serverpod_database	default	2025-02-12 18:05:00	t	0.016595	1
561	serverpod_database	default	2025-02-12 18:06:00	t	0.016656	1
562	serverpod_database	default	2025-02-12 18:07:00	t	0.000998	1
563	serverpod_database	default	2025-02-12 18:08:00	t	0.016406	1
564	serverpod_database	default	2025-02-12 18:09:00	t	0.003003	1
565	serverpod_database	default	2025-02-12 18:10:00	t	0.016422	1
566	serverpod_database	default	2025-02-12 18:11:00	t	0.015219	1
567	serverpod_database	default	2025-02-12 18:12:00	t	0.013672	1
568	serverpod_database	default	2025-02-12 18:13:00	t	0.015945	1
569	serverpod_database	default	2025-02-12 18:14:00	t	0.015974	1
570	serverpod_database	default	2025-02-12 18:15:00	t	0.015959	1
571	serverpod_database	default	2025-02-12 18:16:00	t	0.004984	1
572	serverpod_database	default	2025-02-12 18:17:00	t	0.005031	1
573	serverpod_database	default	2025-02-12 18:18:00	t	0.015708	1
574	serverpod_database	default	2025-02-12 18:19:00	t	0.003981	1
575	serverpod_database	default	2025-02-12 18:20:00	t	0.003035	1
576	serverpod_database	default	2025-02-12 18:21:00	t	0.013581	1
577	serverpod_database	default	2025-02-12 18:22:00	t	0.004992	1
578	serverpod_database	default	2025-02-12 18:23:00	t	0.011969	1
579	serverpod_database	default	2025-02-12 18:24:00	t	0.003001	1
580	serverpod_database	default	2025-02-12 18:25:00	t	0.012	1
581	serverpod_database	default	2025-02-12 18:26:00	t	0.011999	1
582	serverpod_database	default	2025-02-12 18:27:00	t	0.009093	1
583	serverpod_database	default	2025-02-12 18:28:00	t	0.001989	1
584	serverpod_database	default	2025-02-12 20:14:00	t	0.015919	1
585	serverpod_database	default	2025-02-10 19:00:00	t	0.007420803278688524	60
586	serverpod_database	default	2025-02-12 20:15:00	t	0.002789	1
587	serverpod_database	default	2025-02-10 18:00:00	t	0.006932714285714285	60
588	serverpod_database	default	2025-02-12 20:16:00	t	0.002596	1
589	serverpod_database	default	2025-02-12 20:17:00	t	0.003061	1
590	serverpod_database	default	2025-02-12 20:18:00	t	0.002156	1
591	serverpod_database	default	2025-02-12 20:19:00	t	0.002805	1
592	serverpod_database	default	2025-02-12 20:20:00	t	0.001628	1
593	serverpod_database	default	2025-02-12 20:21:00	t	0.012886	1
594	serverpod_database	default	2025-02-12 20:22:00	t	0.002435	1
595	serverpod_database	default	2025-02-12 20:23:00	t	0.001	1
596	serverpod_database	default	2025-02-12 20:24:00	t	0.001001	1
597	serverpod_database	default	2025-02-12 20:25:00	t	0.011996	1
598	serverpod_database	default	2025-02-12 20:26:00	t	0.012966	1
599	serverpod_database	default	2025-02-12 20:27:00	t	0.012083	1
600	serverpod_database	default	2025-02-12 20:28:00	t	0.013101	1
601	serverpod_database	default	2025-02-12 20:29:00	t	0.001917	1
602	serverpod_database	default	2025-02-12 20:30:00	t	0.013014	1
603	serverpod_database	default	2025-02-12 20:31:00	t	0.012432	1
604	serverpod_database	default	2025-02-12 20:32:00	t	0.012419	1
605	serverpod_database	default	2025-02-12 20:33:00	t	0.013059	1
606	serverpod_database	default	2025-02-12 20:34:00	t	0.013128	1
607	serverpod_database	default	2025-02-12 20:35:00	t	0.001911	1
608	serverpod_database	default	2025-02-12 20:36:00	t	0.002946	1
609	serverpod_database	default	2025-02-12 20:37:00	t	0.013106	1
610	serverpod_database	default	2025-02-12 20:38:00	t	0.013087	1
611	serverpod_database	default	2025-02-12 20:39:00	t	0.01274	1
612	serverpod_database	default	2025-02-12 20:40:00	t	0.012387	1
613	serverpod_database	default	2025-02-12 20:41:00	t	0.002516	1
614	serverpod_database	default	2025-02-12 20:42:00	t	0.01267	1
615	serverpod_database	default	2025-02-12 20:43:00	t	0.011981	1
616	serverpod_database	default	2025-02-12 20:44:00	t	0.012989	1
617	serverpod_database	default	2025-02-12 20:45:00	t	0.012083	1
618	serverpod_database	default	2025-02-12 20:46:00	t	0.012315	1
619	serverpod_database	default	2025-02-12 20:47:00	t	0.002	1
620	serverpod_database	default	2025-02-12 20:48:00	t	0.001996	1
621	serverpod_database	default	2025-02-12 20:49:00	t	0.001917	1
622	serverpod_database	default	2025-02-12 20:50:00	t	0.001913	1
623	serverpod_database	default	2025-02-12 20:51:00	t	0.002001	1
624	serverpod_database	default	2025-02-12 20:52:00	t	0.001633	1
625	serverpod_database	default	2025-02-12 20:53:00	t	0.002	1
626	serverpod_database	default	2025-02-12 20:54:00	t	0.001996	1
627	serverpod_database	default	2025-02-12 20:55:00	t	0.001911	1
628	serverpod_database	default	2025-02-12 20:56:00	t	0.00964	1
629	serverpod_database	default	2025-02-12 20:57:00	t	0.003078	1
630	serverpod_database	default	2025-02-12 20:58:00	t	0.002944	1
631	serverpod_database	default	2025-02-12 20:59:00	t	0.002913	1
632	serverpod_database	default	2025-02-12 21:00:00	t	0.002013	1
633	serverpod_database	default	2025-02-10 20:00:00	t	0.005690964285714285	60
634	serverpod_database	default	2025-02-12 21:01:00	t	0.002006	1
635	serverpod_database	default	2025-02-12 21:02:00	t	0.001999	1
636	serverpod_database	default	2025-02-12 21:03:00	t	0.001859	1
637	serverpod_database	default	2025-02-12 21:04:00	t	0.002038	1
638	serverpod_database	default	2025-02-12 21:05:00	t	0.012943	1
639	serverpod_database	default	2025-02-12 21:06:00	t	0.012	1
640	serverpod_database	default	2025-02-12 21:07:00	t	0.012194	1
641	serverpod_database	default	2025-02-12 21:08:00	t	0.003004	1
642	serverpod_database	default	2025-02-12 21:09:00	t	0.013207	1
643	serverpod_database	default	2025-02-12 21:10:00	t	0.01319	1
644	serverpod_database	default	2025-02-12 21:11:00	t	0.012829	1
645	serverpod_database	default	2025-02-12 21:12:00	t	0.001912	1
646	serverpod_database	default	2025-02-12 21:13:00	t	0.012801	1
647	serverpod_database	default	2025-02-12 21:14:00	t	0.013255	1
648	serverpod_database	default	2025-02-12 21:15:00	t	0.013148	1
649	serverpod_database	default	2025-02-12 21:16:00	t	0.012968	1
650	serverpod_database	default	2025-02-12 21:17:00	t	0.012974	1
651	serverpod_database	default	2025-02-12 21:18:00	t	0.013195	1
652	serverpod_database	default	2025-02-12 21:19:00	t	0.013192	1
653	serverpod_database	default	2025-02-12 21:20:00	t	0.013016	1
654	serverpod_database	default	2025-02-12 21:21:00	t	0.012024	1
655	serverpod_database	default	2025-02-12 21:22:00	t	0.012784	1
656	serverpod_database	default	2025-02-12 21:23:00	t	0.012781	1
657	serverpod_database	default	2025-02-12 21:24:00	t	0.002858	1
658	serverpod_database	default	2025-02-12 21:25:00	t	0.002011	1
659	serverpod_database	default	2025-02-12 21:26:00	t	0.001536	1
660	serverpod_database	default	2025-02-12 21:27:00	t	0.012923	1
661	serverpod_database	default	2025-02-12 21:28:00	t	0.006998	1
662	serverpod_database	default	2025-02-12 21:30:00	t	0.009995	1
663	serverpod_database	default	2025-02-12 21:31:00	t	0.002	1
664	serverpod_database	default	2025-02-12 21:32:00	t	0.001967	1
665	serverpod_database	default	2025-02-12 21:33:00	t	0.013024	1
666	serverpod_database	default	2025-02-12 21:34:00	t	0.001969	1
667	serverpod_database	default	2025-02-12 21:35:00	t	0.012586	1
668	serverpod_database	default	2025-02-12 21:36:00	t	0.014928	1
669	serverpod_database	default	2025-02-12 21:37:00	t	0.016946	1
670	serverpod_database	default	2025-02-12 21:38:00	t	0.00706	1
671	serverpod_database	default	2025-02-12 21:39:00	t	0.018512	1
672	serverpod_database	default	2025-02-12 21:40:00	t	0.018037	1
673	serverpod_database	default	2025-02-12 21:41:00	t	0.017245	1
674	serverpod_database	default	2025-02-12 21:42:00	t	0.016812	1
675	serverpod_database	default	2025-02-12 21:43:00	t	0.013514	1
676	serverpod_database	default	2025-02-12 21:44:00	t	0.01617	1
677	serverpod_database	default	2025-02-12 21:45:00	t	0.016885	1
678	serverpod_database	default	2025-02-12 21:46:00	t	0.021953	1
679	serverpod_database	default	2025-02-12 21:47:00	t	0.015886	1
680	serverpod_database	default	2025-02-12 21:48:00	t	0.018342	1
681	serverpod_database	default	2025-02-12 21:49:00	t	0.015503	1
682	serverpod_database	default	2025-02-12 21:50:00	t	0.015043	1
683	serverpod_database	default	2025-02-12 21:51:00	t	0.017897	1
684	serverpod_database	default	2025-02-12 21:52:00	t	0.015909	1
685	serverpod_database	default	2025-02-12 21:53:00	t	0.018772	1
686	serverpod_database	default	2025-02-12 21:54:00	t	0.002006	1
687	serverpod_database	default	2025-02-13 11:43:00	t	0.030774	1
688	serverpod_database	default	2025-02-11 08:00:00	t	0.710619	60
689	serverpod_database	default	2025-02-13 11:44:00	t	0.011503	1
690	serverpod_database	default	2025-02-13 11:45:00	t	0.001749	1
691	serverpod_database	default	2025-02-13 11:46:00	t	0.003906	1
692	serverpod_database	default	2025-02-13 11:47:00	t	0.001798	1
693	serverpod_database	default	2025-02-13 11:48:00	t	0.002681	1
694	serverpod_database	default	2025-02-13 11:49:00	t	0.002733	1
695	serverpod_database	default	2025-02-13 11:50:00	t	0.002566	1
696	serverpod_database	default	2025-02-13 11:51:00	t	0.002083	1
697	serverpod_database	default	2025-02-13 11:52:00	t	0.001909	1
698	serverpod_database	default	2025-02-13 11:53:00	t	0.002836	1
699	serverpod_database	default	2025-02-13 11:54:00	t	0.002919	1
700	serverpod_database	default	2025-02-13 11:55:00	t	0.00274	1
701	serverpod_database	default	2025-02-13 11:56:00	t	0.00201	1
702	serverpod_database	default	2025-02-13 11:57:00	t	0.001994	1
703	serverpod_database	default	2025-02-13 11:58:00	t	0.001908	1
704	serverpod_database	default	2025-02-13 11:59:00	t	0.001811	1
705	serverpod_database	default	2025-02-13 12:00:00	t	0.008958	1
706	serverpod_database	default	2025-02-13 12:01:00	t	0.012943	1
707	serverpod_database	default	2025-02-13 12:02:00	t	0.012637	1
708	serverpod_database	default	2025-02-13 12:03:00	t	0.012879	1
709	serverpod_database	default	2025-02-13 12:04:00	t	0.012099	1
710	serverpod_database	default	2025-02-13 12:05:00	t	0.012771	1
711	serverpod_database	default	2025-02-13 12:06:00	t	0.012959	1
712	serverpod_database	default	2025-02-13 12:07:00	t	0.007465	1
713	serverpod_database	default	2025-02-13 12:08:00	t	0.002997	1
714	serverpod_database	default	2025-02-13 12:09:00	t	0.012683	1
715	serverpod_database	default	2025-02-13 12:10:00	t	0.012798	1
716	serverpod_database	default	2025-02-13 12:11:00	t	0.012816	1
717	serverpod_database	default	2025-02-13 12:12:00	t	0.003001	1
718	serverpod_database	default	2025-02-13 12:13:00	t	0.013085	1
719	serverpod_database	default	2025-02-13 12:14:00	t	0.013007	1
720	serverpod_database	default	2025-02-13 12:15:00	t	0.012816	1
721	serverpod_database	default	2025-02-13 12:16:00	t	0.001912	1
722	serverpod_database	default	2025-02-13 12:17:00	t	0.012791	1
723	serverpod_database	default	2025-02-13 12:18:00	t	0.006753	1
724	serverpod_database	default	2025-02-13 12:20:00	t	0.019171	1
725	serverpod_database	default	2025-02-13 12:21:00	t	0.013596	1
726	serverpod_database	default	2025-02-13 12:22:00	t	0.002961	1
727	serverpod_database	default	2025-02-13 12:23:00	t	0.01342	1
728	serverpod_database	default	2025-02-13 12:24:00	t	0.01332	1
729	serverpod_database	default	2025-02-13 12:25:00	t	0.012843	1
730	serverpod_database	default	2025-02-13 12:26:00	t	0.013039	1
731	serverpod_database	default	2025-02-13 12:27:00	t	0.005081	1
732	serverpod_database	default	2025-02-13 12:28:00	t	0.011727	1
733	serverpod_database	default	2025-02-13 12:29:00	t	0.001927	1
734	serverpod_database	default	2025-02-13 12:30:00	t	0.002986	1
735	serverpod_database	default	2025-02-13 12:31:00	t	0.002117	1
736	serverpod_database	default	2025-02-13 12:32:00	t	0.01279	1
737	serverpod_database	default	2025-02-13 12:33:00	t	0.01302	1
738	serverpod_database	default	2025-02-13 12:34:00	t	0.002042	1
739	serverpod_database	default	2025-02-13 12:35:00	t	0.001996	1
740	serverpod_database	default	2025-02-13 12:36:00	t	0.011969	1
741	serverpod_database	default	2025-02-13 12:37:00	t	0.012318	1
742	serverpod_database	default	2025-02-13 12:38:00	t	0.013045	1
743	serverpod_database	default	2025-02-13 12:39:00	t	0.01306	1
744	serverpod_database	default	2025-02-13 12:40:00	t	0.013129	1
745	serverpod_database	default	2025-02-13 12:41:00	t	0.002345	1
746	serverpod_database	default	2025-02-13 12:42:00	t	0.01204	1
747	serverpod_database	default	2025-02-13 12:43:00	t	0.01259	1
748	serverpod_database	default	2025-02-13 12:44:00	t	0.012738	1
749	serverpod_database	default	2025-02-13 12:45:00	t	0.001917	1
750	serverpod_database	default	2025-02-13 12:46:00	t	0.011894	1
751	serverpod_database	default	2025-02-13 12:47:00	t	0.01243	1
752	serverpod_database	default	2025-02-13 12:48:00	t	0.012773	1
753	serverpod_database	default	2025-02-13 12:49:00	t	0.001806	1
754	serverpod_database	default	2025-02-13 12:50:00	t	0.012928	1
755	serverpod_database	default	2025-02-13 12:51:00	t	0.012446	1
756	serverpod_database	default	2025-02-13 12:52:00	t	0.011495	1
757	serverpod_database	default	2025-02-13 12:53:00	t	0.012582	1
758	serverpod_database	default	2025-02-13 12:54:00	t	0.012833	1
759	serverpod_database	default	2025-02-13 12:55:00	t	0.013247	1
760	serverpod_database	default	2025-02-13 12:56:00	t	0.013145	1
761	serverpod_database	default	2025-02-13 12:57:00	t	0.012863	1
762	serverpod_database	default	2025-02-13 12:58:00	t	0.012035	1
763	serverpod_database	default	2025-02-13 12:59:00	t	0.012907	1
764	serverpod_database	default	2025-02-13 13:00:00	t	0.00328	1
765	serverpod_database	default	2025-02-13 13:01:00	t	0.01279	1
766	serverpod_database	default	2025-02-13 13:02:00	t	0.011226	1
767	serverpod_database	default	2025-02-13 13:03:00	t	0.00253	1
768	serverpod_database	default	2025-02-13 13:04:00	t	0.001861	1
769	serverpod_database	default	2025-02-13 13:05:00	t	0.012147	1
770	serverpod_database	default	2025-02-13 13:06:00	t	0.00201	1
771	serverpod_database	default	2025-02-13 13:07:00	t	0.012581	1
772	serverpod_database	default	2025-02-13 13:08:00	t	0.012401	1
773	serverpod_database	default	2025-02-13 13:09:00	t	0.011988	1
774	serverpod_database	default	2025-02-13 13:10:00	t	0.012534	1
775	serverpod_database	default	2025-02-13 13:11:00	t	0.012915	1
776	serverpod_database	default	2025-02-13 13:12:00	t	0.012472	1
777	serverpod_database	default	2025-02-13 13:13:00	t	0.002937	1
778	serverpod_database	default	2025-02-13 13:14:00	t	0.001868	1
779	serverpod_database	default	2025-02-13 13:15:00	t	0.00178	1
780	serverpod_database	default	2025-02-13 13:16:00	t	0.001478	1
781	serverpod_database	default	2025-02-13 13:17:00	t	0.0018	1
782	serverpod_database	default	2025-02-13 13:18:00	t	0.002706	1
783	serverpod_database	default	2025-02-13 13:19:00	t	0.001947	1
784	serverpod_database	default	2025-02-13 13:20:00	t	0.004076	1
785	serverpod_database	default	2025-02-13 13:21:00	t	0.002845	1
786	serverpod_database	default	2025-02-13 13:22:00	t	0.00214	1
787	serverpod_database	default	2025-02-13 13:23:00	t	0.001581	1
788	serverpod_database	default	2025-02-13 13:24:00	t	0.001712	1
789	serverpod_database	default	2025-02-13 13:25:00	t	0.001722	1
790	serverpod_database	default	2025-02-13 13:26:00	t	0.00141	1
791	serverpod_database	default	2025-02-13 13:27:00	t	0.001381	1
792	serverpod_database	default	2025-02-13 13:28:00	t	0.001796	1
793	serverpod_database	default	2025-02-13 13:29:00	t	0.012551	1
794	serverpod_database	default	2025-02-13 13:30:00	t	0.012416	1
795	serverpod_database	default	2025-02-13 13:31:00	t	0.012718	1
796	serverpod_database	default	2025-02-13 13:32:00	t	0.001886	1
797	serverpod_database	default	2025-02-13 13:33:00	t	0.011954	1
798	serverpod_database	default	2025-02-13 13:34:00	t	0.001949	1
\.


--
-- Data for Name: serverpod_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_log (id, "sessionLogId", "messageId", reference, "serverId", "time", "logLevel", message, error, "stackTrace", "order") FROM stdin;
\.


--
-- Data for Name: serverpod_message_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_message_log (id, "sessionLogId", "serverId", "messageId", endpoint, "messageName", duration, error, "stackTrace", slow, "order") FROM stdin;
\.


--
-- Data for Name: serverpod_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_method (id, endpoint, method) FROM stdin;
\.


--
-- Data for Name: serverpod_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_migrations (id, module, version, "timestamp") FROM stdin;
1	bus_tracking	20250210173841221	2025-02-10 18:27:54.722322
2	serverpod	20240516151843329	2025-02-10 18:27:54.722322
3	serverpod_auth	20240520102713718	2025-02-10 18:27:54.722322
\.


--
-- Data for Name: serverpod_query_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_query_log (id, "serverId", "sessionLogId", "messageId", query, duration, "numRows", error, "stackTrace", slow, "order") FROM stdin;
\.


--
-- Data for Name: serverpod_readwrite_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_readwrite_test (id, number) FROM stdin;
1	859990
2	788302
3	86758
4	556475
5	66749
6	916146
7	887260
8	706974
9	231548
10	99493
11	3042
12	501691
13	927206
14	401453
15	291518
16	873543
17	432879
18	977204
19	63715
20	364035
21	340938
22	132224
23	455946
24	652163
25	535762
26	552027
27	652277
28	134169
29	66281
30	64282
31	214588
32	341040
33	403615
34	146863
35	697587
36	157003
37	660802
38	180360
39	586915
40	986168
41	174622
42	641996
43	541665
44	754351
45	393018
46	499155
47	751703
48	759393
49	158909
50	95719
51	389422
52	793563
53	47602
54	565553
55	610407
56	61925
57	323047
58	916936
59	896149
60	336414
61	304344
62	713014
63	806975
64	140251
65	810612
66	458606
67	345832
68	879702
69	75411
70	178234
71	663778
72	710206
73	586586
74	59100
75	75749
76	522834
77	54081
78	668758
79	514638
80	454758
81	510376
82	749174
83	691548
84	579415
85	425451
86	229064
87	804130
88	379992
89	963172
90	550406
91	375669
92	771253
93	157184
94	84481
95	246013
96	470105
97	181126
98	470241
99	606285
100	178348
101	402464
102	89395
103	902430
104	507829
105	579715
106	938397
107	88256
108	554427
109	926394
110	657977
111	760293
112	41191
113	82480
114	152089
115	157217
116	49937
117	444522
118	898509
119	441018
120	783821
121	175264
122	92096
123	407470
124	23771
125	16789
126	5481
127	306163
128	499046
129	885968
130	520280
131	827016
132	910928
133	798593
134	776690
135	756047
136	87406
137	545017
138	841720
139	216714
140	819544
141	972274
142	137442
143	731728
144	859507
145	637441
146	400680
147	239968
148	281468
149	587881
150	221268
151	509026
152	938043
153	449000
154	943142
155	166966
156	788314
157	905475
158	463464
159	599773
160	113967
161	188440
162	831965
163	741675
164	87130
165	266316
166	354424
167	605248
168	324001
169	550209
170	335936
171	167129
172	918716
173	69840
174	520549
175	906893
176	718327
177	805915
178	412854
179	337859
180	540347
181	618695
182	425854
183	819680
184	387147
185	807848
186	210186
187	973683
188	233878
189	731248
190	451213
191	622867
192	698788
193	467930
194	190268
195	679834
196	431345
197	114883
198	157375
199	887889
200	299875
201	102945
202	147221
203	761041
204	224113
205	609928
206	830058
207	931453
208	699341
209	415319
210	186472
211	936218
212	147208
213	670529
214	421831
215	674033
216	431595
217	733804
218	473070
219	897194
220	257418
221	790909
222	355906
223	637395
224	699727
225	635573
226	426059
227	94178
228	586911
229	142391
230	2747
231	66764
232	290768
233	698259
234	479880
235	292654
236	221063
237	352994
238	817234
239	24810
240	796423
241	677399
242	925597
243	651574
244	138261
245	534215
246	526817
247	393179
248	76851
249	876505
250	115085
251	444647
252	4513
253	280680
254	691886
255	513714
256	723560
257	818285
258	645455
259	614811
260	325234
261	264706
262	463256
263	715614
264	665959
265	801666
266	551788
267	879895
268	607322
269	473497
270	148095
271	463241
272	832593
273	348284
274	911129
275	157611
276	409732
277	359010
278	443876
279	49718
280	393813
281	231997
282	502335
283	469702
284	955300
285	932854
286	235458
287	636836
288	441160
289	323153
290	125364
291	988041
292	107494
293	770883
294	132170
295	903988
296	921507
297	500198
298	285180
299	309376
300	569505
301	560845
302	93671
303	494510
304	288942
305	230079
306	234525
307	285282
308	912365
309	780519
310	933205
311	885725
312	271563
313	263500
314	956119
315	725703
316	294868
317	512
318	794156
319	58596
320	77855
321	19371
322	290565
323	867159
324	900376
325	436560
326	204406
327	468969
328	183030
329	13803
330	324556
331	208070
332	234464
333	981202
334	489970
335	658733
336	506876
337	404344
338	38310
339	620130
340	515789
341	604174
342	464528
343	777312
344	886261
345	401680
346	390048
347	384900
348	587447
349	416047
350	418560
351	194202
352	288911
353	880630
354	451151
355	239733
356	231364
357	835044
358	598072
359	688749
360	355265
361	914658
362	392080
363	539614
364	478749
365	312743
366	658453
367	40921
368	903273
369	166307
370	22975
371	635727
372	472392
373	196657
374	519967
375	714704
376	212395
377	910446
378	522431
379	883160
380	267617
381	176538
382	805810
383	456937
384	987543
385	381704
386	952327
387	455936
388	417680
389	488805
390	965856
391	197824
392	558001
393	528089
394	886423
395	702839
396	75673
397	117098
398	664403
399	154439
400	679695
401	873394
402	270790
403	154476
404	266321
405	921914
406	728675
407	166052
408	125859
409	656843
410	220643
411	208516
412	832693
413	260409
414	984415
415	891807
416	255494
417	77382
418	359403
419	359828
420	330330
421	319705
422	431588
423	191133
424	744536
425	267418
426	62505
427	171758
428	258868
429	156839
430	240151
431	533696
432	903746
433	489875
434	984766
435	514229
436	56055
437	310500
438	230005
439	192794
440	287602
441	882884
442	145080
443	223395
444	275186
445	992242
446	270570
447	51259
448	530185
449	545626
450	498277
451	31911
452	333537
453	670402
454	131661
455	138141
456	68956
457	572494
458	243305
459	673861
460	240800
461	894670
462	775794
463	404427
464	997245
465	636614
466	476260
467	236558
468	799779
469	298220
470	708112
471	690389
472	323800
473	140962
474	807631
475	563691
476	209873
477	654385
478	715573
479	539372
480	584212
481	386970
482	64846
483	817331
484	347750
485	537421
486	523429
487	71869
488	556434
489	637734
490	243908
491	510090
492	184772
493	163046
494	165382
495	150565
496	152236
497	9719
498	328175
499	357024
500	824803
501	810467
502	978498
503	552786
504	137974
505	503756
506	281832
507	646105
508	419200
509	973252
510	490288
511	577062
512	102135
513	280143
514	541178
515	600234
516	261043
517	343041
518	140143
519	432902
520	154175
521	43477
522	727496
523	473859
524	567273
525	316561
526	931228
527	14934
528	263543
529	322968
530	277384
531	924869
532	414756
533	536894
534	54294
535	834065
536	146774
537	863371
538	105216
539	145129
540	244581
541	860161
542	198549
543	434277
544	870250
545	49289
546	101099
547	608929
548	3137
549	440628
550	123276
551	457609
552	554962
553	222851
554	327180
555	147315
556	735890
557	661220
558	276653
559	572370
560	362219
561	334620
562	175363
563	800297
564	155773
565	252575
566	715016
567	708500
568	239115
569	619568
570	767386
571	479218
572	315788
573	408320
574	725023
575	677313
576	34369
577	803695
578	302810
579	383293
580	325720
581	574384
582	395701
583	413533
584	251405
585	538709
586	791649
587	285190
588	895121
589	27558
590	19500
591	606004
592	211888
593	660779
594	87237
595	543605
596	481403
597	929853
598	93291
599	190391
600	612642
601	509461
602	585731
603	67248
604	854586
605	839655
606	993799
607	231262
608	725880
609	849701
610	792540
611	677646
612	399308
613	392074
614	55680
615	412622
616	122628
617	484699
618	820283
619	617388
620	107362
621	623567
622	675752
623	994620
624	47924
625	572122
626	266461
627	494949
628	200983
629	544566
630	950041
631	947820
632	939312
633	483052
634	955970
635	774950
636	933833
637	704258
638	959243
639	495171
640	176978
641	432696
642	91491
643	292511
644	978294
645	707506
646	218851
647	323145
648	560502
649	194713
650	383396
651	549999
652	522896
653	226275
654	326605
655	488180
656	265375
657	646342
658	936727
659	607196
660	950089
661	946974
662	520457
663	16162
664	677323
665	47475
666	993664
667	768057
668	652190
669	66269
670	710983
671	633694
672	231306
673	585355
674	716059
675	508081
676	866066
677	285285
678	73091
679	507959
680	359486
681	146324
682	950255
683	707095
684	131863
685	855836
686	518701
687	41897
688	619449
689	162641
690	543296
691	331607
692	330564
693	179828
694	446487
695	251872
696	698276
697	452281
698	288202
699	467984
700	945635
701	235726
702	151943
703	830258
704	848297
705	253064
706	803816
707	73641
708	104656
709	335450
710	622891
711	933058
712	783619
713	557244
714	416441
715	834583
716	317527
717	106870
718	869614
719	333905
720	217551
721	340527
722	444784
723	500080
724	800646
725	94452
726	778593
727	812877
728	553947
729	929590
730	122734
731	53612
732	379479
733	349588
734	58986
735	175859
736	312502
737	413823
738	693313
739	395228
740	882266
741	443631
742	400269
743	360790
744	479130
745	18713
746	925758
747	909213
748	885586
749	443915
750	890858
751	427243
752	181205
753	895103
754	324058
755	866761
756	802747
757	27085
758	797903
759	183920
760	694507
761	472509
762	722039
763	501257
764	948855
765	646926
766	376061
767	157219
768	735993
769	790455
770	120325
771	787451
772	229757
773	410371
774	882730
775	78995
776	165313
777	532839
778	58408
779	124700
780	491149
781	629850
782	931943
783	312256
784	365223
785	959480
786	690890
787	617699
788	736376
789	838551
790	85714
791	809195
792	566073
793	567764
794	153752
795	867453
\.


--
-- Data for Name: serverpod_runtime_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_runtime_settings (id, "logSettings", "logSettingsOverrides", "logServiceCalls", "logMalformedCalls") FROM stdin;
1	{"logLevel":1,"logAllSessions":false,"logAllQueries":false,"logSlowSessions":true,"logStreamingSessionsContinuously":true,"logSlowQueries":true,"logFailedSessions":true,"logFailedQueries":true,"slowSessionDuration":1.0,"slowQueryDuration":1.0}	[]	f	f
\.


--
-- Data for Name: serverpod_session_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_session_log (id, "serverId", "time", module, endpoint, method, duration, "numQueries", slow, error, "stackTrace", "authenticatedUserId", "isOpen", touched) FROM stdin;
\.


--
-- Data for Name: serverpod_user_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_user_image (id, "userId", version, url) FROM stdin;
1	1	1	http://localhost:8080/serverpod_cloud_storage?method=file&path=serverpod%2Fuser_images%2F1-1.jpg
\.


--
-- Data for Name: serverpod_user_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serverpod_user_info (id, "userIdentifier", "userName", "fullName", email, created, "imageUrl", "scopeNames", blocked) FROM stdin;
1	s201968710@kfupm.edu.sa	Ali	\N	s201968710@kfupm.edu.sa	2025-02-12 21:32:56.424025	http://localhost:8080/serverpod_cloud_storage?method=file&path=serverpod%2Fuser_images%2F1-1.jpg	[]	f
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, password, role, location, latitude, longitude) FROM stdin;
\.


--
-- Name: serverpod_auth_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_auth_key_id_seq', 2, true);


--
-- Name: serverpod_cloud_storage_direct_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_cloud_storage_direct_upload_id_seq', 1, false);


--
-- Name: serverpod_cloud_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_cloud_storage_id_seq', 1, true);


--
-- Name: serverpod_email_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_email_auth_id_seq', 1, true);


--
-- Name: serverpod_email_create_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_email_create_request_id_seq', 1, true);


--
-- Name: serverpod_email_failed_sign_in_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_email_failed_sign_in_id_seq', 1, false);


--
-- Name: serverpod_email_reset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_email_reset_id_seq', 1, false);


--
-- Name: serverpod_future_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_future_call_id_seq', 1, false);


--
-- Name: serverpod_google_refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_google_refresh_token_id_seq', 1, false);


--
-- Name: serverpod_health_connection_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_health_connection_info_id_seq', 794, true);


--
-- Name: serverpod_health_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_health_metric_id_seq', 798, true);


--
-- Name: serverpod_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_log_id_seq', 1, false);


--
-- Name: serverpod_message_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_message_log_id_seq', 1, false);


--
-- Name: serverpod_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_method_id_seq', 1, false);


--
-- Name: serverpod_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_migrations_id_seq', 3, true);


--
-- Name: serverpod_query_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_query_log_id_seq', 1, false);


--
-- Name: serverpod_readwrite_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_readwrite_test_id_seq', 795, true);


--
-- Name: serverpod_runtime_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_runtime_settings_id_seq', 1, true);


--
-- Name: serverpod_session_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_session_log_id_seq', 1, false);


--
-- Name: serverpod_user_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_user_image_id_seq', 1, true);


--
-- Name: serverpod_user_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serverpod_user_info_id_seq', 1, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: serverpod_auth_key serverpod_auth_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_auth_key
    ADD CONSTRAINT serverpod_auth_key_pkey PRIMARY KEY (id);


--
-- Name: serverpod_cloud_storage_direct_upload serverpod_cloud_storage_direct_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload
    ADD CONSTRAINT serverpod_cloud_storage_direct_upload_pkey PRIMARY KEY (id);


--
-- Name: serverpod_cloud_storage serverpod_cloud_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_cloud_storage
    ADD CONSTRAINT serverpod_cloud_storage_pkey PRIMARY KEY (id);


--
-- Name: serverpod_email_auth serverpod_email_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_auth
    ADD CONSTRAINT serverpod_email_auth_pkey PRIMARY KEY (id);


--
-- Name: serverpod_email_create_request serverpod_email_create_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_create_request
    ADD CONSTRAINT serverpod_email_create_request_pkey PRIMARY KEY (id);


--
-- Name: serverpod_email_failed_sign_in serverpod_email_failed_sign_in_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_failed_sign_in
    ADD CONSTRAINT serverpod_email_failed_sign_in_pkey PRIMARY KEY (id);


--
-- Name: serverpod_email_reset serverpod_email_reset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_email_reset
    ADD CONSTRAINT serverpod_email_reset_pkey PRIMARY KEY (id);


--
-- Name: serverpod_future_call serverpod_future_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_future_call
    ADD CONSTRAINT serverpod_future_call_pkey PRIMARY KEY (id);


--
-- Name: serverpod_google_refresh_token serverpod_google_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_google_refresh_token
    ADD CONSTRAINT serverpod_google_refresh_token_pkey PRIMARY KEY (id);


--
-- Name: serverpod_health_connection_info serverpod_health_connection_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_connection_info
    ADD CONSTRAINT serverpod_health_connection_info_pkey PRIMARY KEY (id);


--
-- Name: serverpod_health_metric serverpod_health_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_health_metric
    ADD CONSTRAINT serverpod_health_metric_pkey PRIMARY KEY (id);


--
-- Name: serverpod_log serverpod_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_message_log serverpod_message_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_method serverpod_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_method
    ADD CONSTRAINT serverpod_method_pkey PRIMARY KEY (id);


--
-- Name: serverpod_migrations serverpod_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_migrations
    ADD CONSTRAINT serverpod_migrations_pkey PRIMARY KEY (id);


--
-- Name: serverpod_query_log serverpod_query_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_readwrite_test serverpod_readwrite_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_readwrite_test
    ADD CONSTRAINT serverpod_readwrite_test_pkey PRIMARY KEY (id);


--
-- Name: serverpod_runtime_settings serverpod_runtime_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_runtime_settings
    ADD CONSTRAINT serverpod_runtime_settings_pkey PRIMARY KEY (id);


--
-- Name: serverpod_session_log serverpod_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_session_log
    ADD CONSTRAINT serverpod_session_log_pkey PRIMARY KEY (id);


--
-- Name: serverpod_user_image serverpod_user_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_user_image
    ADD CONSTRAINT serverpod_user_image_pkey PRIMARY KEY (id);


--
-- Name: serverpod_user_info serverpod_user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_user_info
    ADD CONSTRAINT serverpod_user_info_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: serverpod_auth_key_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_auth_key_userId_idx" ON public.serverpod_auth_key USING btree ("userId");


--
-- Name: serverpod_cloud_storage_direct_upload_storage_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_cloud_storage_direct_upload_storage_path ON public.serverpod_cloud_storage_direct_upload USING btree ("storageId", path);


--
-- Name: serverpod_cloud_storage_expiration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_cloud_storage_expiration ON public.serverpod_cloud_storage USING btree (expiration);


--
-- Name: serverpod_cloud_storage_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_cloud_storage_path_idx ON public.serverpod_cloud_storage USING btree ("storageId", path);


--
-- Name: serverpod_email_auth_create_account_request_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_email_auth_create_account_request_idx ON public.serverpod_email_create_request USING btree (email);


--
-- Name: serverpod_email_auth_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_email_auth_email ON public.serverpod_email_auth USING btree (email);


--
-- Name: serverpod_email_failed_sign_in_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_email_failed_sign_in_email_idx ON public.serverpod_email_failed_sign_in USING btree (email);


--
-- Name: serverpod_email_failed_sign_in_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_email_failed_sign_in_time_idx ON public.serverpod_email_failed_sign_in USING btree ("time");


--
-- Name: serverpod_email_reset_verification_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_email_reset_verification_idx ON public.serverpod_email_reset USING btree ("verificationCode");


--
-- Name: serverpod_future_call_identifier_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_future_call_identifier_idx ON public.serverpod_future_call USING btree (identifier);


--
-- Name: serverpod_future_call_serverId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_future_call_serverId_idx" ON public.serverpod_future_call USING btree ("serverId");


--
-- Name: serverpod_future_call_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_future_call_time_idx ON public.serverpod_future_call USING btree ("time");


--
-- Name: serverpod_google_refresh_token_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON public.serverpod_google_refresh_token USING btree ("userId");


--
-- Name: serverpod_health_connection_info_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_health_connection_info_timestamp_idx ON public.serverpod_health_connection_info USING btree ("timestamp", "serverId", granularity);


--
-- Name: serverpod_health_metric_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_health_metric_timestamp_idx ON public.serverpod_health_metric USING btree ("timestamp", "serverId", name, granularity);


--
-- Name: serverpod_log_sessionLogId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_log_sessionLogId_idx" ON public.serverpod_log USING btree ("sessionLogId");


--
-- Name: serverpod_method_endpoint_method_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_method_endpoint_method_idx ON public.serverpod_method USING btree (endpoint, method);


--
-- Name: serverpod_migrations_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_migrations_ids ON public.serverpod_migrations USING btree (module);


--
-- Name: serverpod_query_log_sessionLogId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON public.serverpod_query_log USING btree ("sessionLogId");


--
-- Name: serverpod_session_log_isopen_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_isopen_idx ON public.serverpod_session_log USING btree ("isOpen");


--
-- Name: serverpod_session_log_serverid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_serverid_idx ON public.serverpod_session_log USING btree ("serverId");


--
-- Name: serverpod_session_log_touched_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_session_log_touched_idx ON public.serverpod_session_log USING btree (touched);


--
-- Name: serverpod_user_image_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_user_image_user_id ON public.serverpod_user_image USING btree ("userId", version);


--
-- Name: serverpod_user_info_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX serverpod_user_info_email ON public.serverpod_user_info USING btree (email);


--
-- Name: serverpod_user_info_user_identifier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serverpod_user_info_user_identifier ON public.serverpod_user_info USING btree ("userIdentifier");


--
-- Name: serverpod_log serverpod_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- Name: serverpod_message_log serverpod_message_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- Name: serverpod_query_log serverpod_query_log_fk_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

