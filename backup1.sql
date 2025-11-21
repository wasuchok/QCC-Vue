--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-21 16:49:09

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
-- TOC entry 244 (class 1259 OID 16720)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16719)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 243
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 284 (class 1259 OID 16951)
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16950)
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 283
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- TOC entry 248 (class 1259 OID 16744)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16743)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO postgres;

--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 247
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 246 (class 1259 OID 16732)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16731)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 245
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 286 (class 1259 OID 16963)
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 16962)
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 285
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- TOC entry 298 (class 1259 OID 17550)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    name character varying(255)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 17549)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 297
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 296 (class 1259 OID 17524)
-- Name: emp_register_qccs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_register_qccs (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    "position" character varying(255)
);


ALTER TABLE public.emp_register_qccs OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 17932)
-- Name: emp_register_qccs_employee_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_register_qccs_employee_lnk (
    id integer NOT NULL,
    emp_register_qcc_id integer,
    employee_id integer,
    emp_register_qcc_ord double precision
);


ALTER TABLE public.emp_register_qccs_employee_lnk OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 17931)
-- Name: emp_register_qccs_employee_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emp_register_qccs_employee_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emp_register_qccs_employee_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 305
-- Name: emp_register_qccs_employee_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emp_register_qccs_employee_lnk_id_seq OWNED BY public.emp_register_qccs_employee_lnk.id;


--
-- TOC entry 295 (class 1259 OID 17523)
-- Name: emp_register_qccs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emp_register_qccs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emp_register_qccs_id_seq OWNER TO postgres;

--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 295
-- Name: emp_register_qccs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emp_register_qccs_id_seq OWNED BY public.emp_register_qccs.id;


--
-- TOC entry 304 (class 1259 OID 17878)
-- Name: emp_register_qccs_register_qcc_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_register_qccs_register_qcc_lnk (
    id integer NOT NULL,
    emp_register_qcc_id integer,
    register_qcc_id integer,
    emp_register_qcc_ord double precision
);


ALTER TABLE public.emp_register_qccs_register_qcc_lnk OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 17877)
-- Name: emp_register_qccs_register_qcc_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emp_register_qccs_register_qcc_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emp_register_qccs_register_qcc_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 303
-- Name: emp_register_qccs_register_qcc_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emp_register_qccs_register_qcc_lnk_id_seq OWNED BY public.emp_register_qccs_register_qcc_lnk.id;


--
-- TOC entry 292 (class 1259 OID 17462)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    document_id character varying(255),
    employee_code character varying(255),
    full_name character varying(255),
    department character varying(255),
    team character varying(255),
    "position" character varying(255),
    activity_history integer,
    training_history character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    type_group character varying(255),
    email character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 17461)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 291
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 224 (class 1259 OID 16590)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16856)
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16855)
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 267
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- TOC entry 223 (class 1259 OID 16589)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 223
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 266 (class 1259 OID 16844)
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16843)
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO postgres;

--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 265
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- TOC entry 228 (class 1259 OID 16624)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16623)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO postgres;

--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 227
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 294 (class 1259 OID 17500)
-- Name: register_qccs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.register_qccs (
    id integer NOT NULL,
    document_id character varying(255),
    registration_date timestamp(6) without time zone,
    group_id character varying(255),
    department character varying(255),
    type_group character varying(255),
    name_team character varying(255),
    team_slogan character varying(255),
    group_advisor character varying(255),
    type_of_routine_work character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    status_qcc character varying(255),
    group_manager_primary character varying(255),
    group_manager_secondary character varying(255)
);


ALTER TABLE public.register_qccs OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 17499)
-- Name: register_qccs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.register_qccs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.register_qccs_id_seq OWNER TO postgres;

--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 293
-- Name: register_qccs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.register_qccs_id_seq OWNED BY public.register_qccs.id;


--
-- TOC entry 252 (class 1259 OID 16768)
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16767)
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 251
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- TOC entry 288 (class 1259 OID 16976)
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 16975)
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 287
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- TOC entry 250 (class 1259 OID 16756)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16755)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 260 (class 1259 OID 16816)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16815)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 259
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 222 (class 1259 OID 16581)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16580)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 221
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 264 (class 1259 OID 16834)
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16833)
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO postgres;

--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 263
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- TOC entry 218 (class 1259 OID 16567)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16566)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 217
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 220 (class 1259 OID 16574)
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16573)
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO postgres;

--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 219
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- TOC entry 232 (class 1259 OID 16648)
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16647)
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO postgres;

--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 231
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- TOC entry 272 (class 1259 OID 16880)
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 16879)
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 271
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- TOC entry 230 (class 1259 OID 16636)
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16635)
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO postgres;

--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 229
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- TOC entry 258 (class 1259 OID 16804)
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_sessions OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16803)
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 257
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- TOC entry 256 (class 1259 OID 16792)
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16791)
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 255
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- TOC entry 290 (class 1259 OID 16988)
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 16987)
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 289
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- TOC entry 254 (class 1259 OID 16780)
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16779)
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 253
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- TOC entry 262 (class 1259 OID 16825)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16824)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 261
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 234 (class 1259 OID 16660)
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16659)
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO postgres;

--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 233
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- TOC entry 274 (class 1259 OID 16892)
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 16891)
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 273
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- TOC entry 236 (class 1259 OID 16672)
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16671)
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO postgres;

--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 235
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- TOC entry 278 (class 1259 OID 16915)
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16914)
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 277
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- TOC entry 276 (class 1259 OID 16903)
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16902)
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 275
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- TOC entry 300 (class 1259 OID 17577)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    type_group character varying(255)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 17601)
-- Name: teams_department_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams_department_lnk (
    id integer NOT NULL,
    team_id integer,
    department_id integer,
    team_ord double precision
);


ALTER TABLE public.teams_department_lnk OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 17600)
-- Name: teams_department_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_department_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_department_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 301
-- Name: teams_department_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_department_lnk_id_seq OWNED BY public.teams_department_lnk.id;


--
-- TOC entry 299 (class 1259 OID 17576)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 299
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 238 (class 1259 OID 16684)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16683)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 280 (class 1259 OID 16927)
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16926)
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 279
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- TOC entry 240 (class 1259 OID 16696)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16695)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO postgres;

--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 239
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 242 (class 1259 OID 16708)
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16707)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO postgres;

--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 241
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 282 (class 1259 OID 16939)
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16938)
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 281
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- TOC entry 226 (class 1259 OID 16608)
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16607)
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO postgres;

--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 225
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- TOC entry 270 (class 1259 OID 16868)
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16867)
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 269
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- TOC entry 4823 (class 2604 OID 16723)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 16954)
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 16747)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 16735)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 16966)
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- TOC entry 4850 (class 2604 OID 17553)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 17527)
-- Name: emp_register_qccs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs ALTER COLUMN id SET DEFAULT nextval('public.emp_register_qccs_id_seq'::regclass);


--
-- TOC entry 4854 (class 2604 OID 17935)
-- Name: emp_register_qccs_employee_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_employee_lnk ALTER COLUMN id SET DEFAULT nextval('public.emp_register_qccs_employee_lnk_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 17881)
-- Name: emp_register_qccs_register_qcc_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_register_qcc_lnk ALTER COLUMN id SET DEFAULT nextval('public.emp_register_qccs_register_qcc_lnk_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 17465)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 16593)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 16859)
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- TOC entry 4834 (class 2604 OID 16847)
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 16627)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 4848 (class 2604 OID 17503)
-- Name: register_qccs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.register_qccs ALTER COLUMN id SET DEFAULT nextval('public.register_qccs_id_seq'::regclass);


--
-- TOC entry 4827 (class 2604 OID 16771)
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 16979)
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 16759)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 16819)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 4812 (class 2604 OID 16584)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 16837)
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 16570)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 16577)
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 16651)
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 16883)
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 16639)
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- TOC entry 4830 (class 2604 OID 16807)
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 16795)
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 16991)
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- TOC entry 4828 (class 2604 OID 16783)
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- TOC entry 4832 (class 2604 OID 16828)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 4818 (class 2604 OID 16663)
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 16895)
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 16675)
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 16918)
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 16906)
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 17580)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 4852 (class 2604 OID 17604)
-- Name: teams_department_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_department_lnk ALTER COLUMN id SET DEFAULT nextval('public.teams_department_lnk_id_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 16687)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 16930)
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- TOC entry 4821 (class 2604 OID 16699)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 16711)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 16942)
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 16611)
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 16871)
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- TOC entry 5353 (class 0 OID 16720)
-- Dependencies: 244
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	gvehykui2c4e1z933l8i9vw8	plugin::upload.read	{}	\N	{}	[]	2025-10-16 09:53:06.05	2025-10-16 09:53:06.05	2025-10-16 09:53:06.05	\N	\N	\N
2	tdrhm5f5k1qflsba55xc3g9e	plugin::upload.configure-view	{}	\N	{}	[]	2025-10-16 09:53:06.064	2025-10-16 09:53:06.064	2025-10-16 09:53:06.064	\N	\N	\N
3	dtzmfqri21rld826yzcnm4ki	plugin::upload.assets.create	{}	\N	{}	[]	2025-10-16 09:53:06.071	2025-10-16 09:53:06.071	2025-10-16 09:53:06.071	\N	\N	\N
4	lsz87tt2mek15xgitm3up9fn	plugin::upload.assets.update	{}	\N	{}	[]	2025-10-16 09:53:06.079	2025-10-16 09:53:06.079	2025-10-16 09:53:06.079	\N	\N	\N
5	mvzqsf3vuddgn1nmmd73o8v4	plugin::upload.assets.download	{}	\N	{}	[]	2025-10-16 09:53:06.087	2025-10-16 09:53:06.087	2025-10-16 09:53:06.087	\N	\N	\N
6	ns49ybxvpd49rhi19rduc78f	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-10-16 09:53:06.094	2025-10-16 09:53:06.094	2025-10-16 09:53:06.095	\N	\N	\N
7	ilrasuj5rp89jw0rxdojzb0a	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2025-10-16 09:53:06.104	2025-10-16 09:53:06.104	2025-10-16 09:53:06.105	\N	\N	\N
8	lq1fe5qzwtegen5jcz7sfhm0	plugin::upload.configure-view	{}	\N	{}	[]	2025-10-16 09:53:06.114	2025-10-16 09:53:06.114	2025-10-16 09:53:06.114	\N	\N	\N
9	iwxea9tbyzs836t4prohmnwl	plugin::upload.assets.create	{}	\N	{}	[]	2025-10-16 09:53:06.121	2025-10-16 09:53:06.121	2025-10-16 09:53:06.121	\N	\N	\N
10	tg0d5oguf1fljyb6d2wl80f5	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2025-10-16 09:53:06.128	2025-10-16 09:53:06.128	2025-10-16 09:53:06.128	\N	\N	\N
11	elomnz3trhdhdd1lt7ei0t7x	plugin::upload.assets.download	{}	\N	{}	[]	2025-10-16 09:53:06.135	2025-10-16 09:53:06.135	2025-10-16 09:53:06.136	\N	\N	\N
12	dfpclxyaj75s2h6aay82t5ng	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-10-16 09:53:06.142	2025-10-16 09:53:06.142	2025-10-16 09:53:06.143	\N	\N	\N
13	qnscb2hxo77kgiu87v5tniae	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-10-16 09:53:06.204	2025-10-16 09:53:06.204	2025-10-16 09:53:06.204	\N	\N	\N
14	qgkx19vc2dzyuzzgxwrtx752	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-10-16 09:53:06.212	2025-10-16 09:53:06.212	2025-10-16 09:53:06.212	\N	\N	\N
15	rrc1atsdqm5wb2k3a8zya71z	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-10-16 09:53:06.218	2025-10-16 09:53:06.218	2025-10-16 09:53:06.219	\N	\N	\N
16	jporondwe0zhdjd0u3p6h1rp	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2025-10-16 09:53:06.225	2025-10-16 09:53:06.225	2025-10-16 09:53:06.226	\N	\N	\N
17	g2b35ljw7ghd3m0g80kaet43	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2025-10-16 09:53:06.232	2025-10-16 09:53:06.232	2025-10-16 09:53:06.233	\N	\N	\N
18	et85cq4cz84tx8ft1pbv59h7	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2025-10-16 09:53:06.24	2025-10-16 09:53:06.24	2025-10-16 09:53:06.24	\N	\N	\N
19	bqx8ifmfoqko3t1n6einafgk	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2025-10-16 09:53:06.294	2025-10-16 09:53:06.294	2025-10-16 09:53:06.295	\N	\N	\N
20	gpl2ipg5rpxv12hnt7p2g967	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2025-10-16 09:53:06.303	2025-10-16 09:53:06.303	2025-10-16 09:53:06.304	\N	\N	\N
21	nbiub42h0dozjgzybo5qh1xl	plugin::content-type-builder.read	{}	\N	{}	[]	2025-10-16 09:53:06.313	2025-10-16 09:53:06.313	2025-10-16 09:53:06.314	\N	\N	\N
22	e670uzx7z5gxlfvro9pxi2uc	plugin::email.settings.read	{}	\N	{}	[]	2025-10-16 09:53:06.322	2025-10-16 09:53:06.322	2025-10-16 09:53:06.323	\N	\N	\N
23	al1qcszuk85nho4k5cat0cqu	plugin::upload.read	{}	\N	{}	[]	2025-10-16 09:53:06.33	2025-10-16 09:53:06.33	2025-10-16 09:53:06.331	\N	\N	\N
24	rh7iwwrerqvcb9cfrioqoar8	plugin::upload.assets.create	{}	\N	{}	[]	2025-10-16 09:53:06.338	2025-10-16 09:53:06.338	2025-10-16 09:53:06.339	\N	\N	\N
25	ahil8qli7rso0xt3zvf4o44d	plugin::upload.assets.update	{}	\N	{}	[]	2025-10-16 09:53:06.346	2025-10-16 09:53:06.346	2025-10-16 09:53:06.346	\N	\N	\N
26	vijrr2gsc48bek18qsafq7sy	plugin::upload.assets.download	{}	\N	{}	[]	2025-10-16 09:53:06.353	2025-10-16 09:53:06.353	2025-10-16 09:53:06.353	\N	\N	\N
27	e053i8l6d93l3jsx61d91vaa	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-10-16 09:53:06.36	2025-10-16 09:53:06.36	2025-10-16 09:53:06.36	\N	\N	\N
28	m6cc31bxx7x2p09uowds2yu1	plugin::upload.configure-view	{}	\N	{}	[]	2025-10-16 09:53:06.367	2025-10-16 09:53:06.367	2025-10-16 09:53:06.367	\N	\N	\N
29	iojqu6d78g2nsva787grt9xp	plugin::upload.settings.read	{}	\N	{}	[]	2025-10-16 09:53:06.374	2025-10-16 09:53:06.374	2025-10-16 09:53:06.374	\N	\N	\N
30	bfanhhcfxsng6y6sta6437bx	plugin::i18n.locale.create	{}	\N	{}	[]	2025-10-16 09:53:06.381	2025-10-16 09:53:06.381	2025-10-16 09:53:06.381	\N	\N	\N
31	j6s49gscjfgbbx6k06zsrvyz	plugin::i18n.locale.read	{}	\N	{}	[]	2025-10-16 09:53:06.387	2025-10-16 09:53:06.387	2025-10-16 09:53:06.387	\N	\N	\N
32	kpj2h218kwkzl83cocw67hnt	plugin::i18n.locale.update	{}	\N	{}	[]	2025-10-16 09:53:06.393	2025-10-16 09:53:06.393	2025-10-16 09:53:06.394	\N	\N	\N
33	ckie2of3n9nej5ashu3tvn3r	plugin::i18n.locale.delete	{}	\N	{}	[]	2025-10-16 09:53:06.401	2025-10-16 09:53:06.401	2025-10-16 09:53:06.401	\N	\N	\N
34	wzm7kz9o6d1q9fzws4e469ms	plugin::users-permissions.roles.create	{}	\N	{}	[]	2025-10-16 09:53:06.407	2025-10-16 09:53:06.407	2025-10-16 09:53:06.407	\N	\N	\N
35	q5ynhe5apvoq24o2x38lpdse	plugin::users-permissions.roles.read	{}	\N	{}	[]	2025-10-16 09:53:06.412	2025-10-16 09:53:06.412	2025-10-16 09:53:06.413	\N	\N	\N
36	xvikn5uzg71hbk1rjf0g4av9	plugin::users-permissions.roles.update	{}	\N	{}	[]	2025-10-16 09:53:06.418	2025-10-16 09:53:06.418	2025-10-16 09:53:06.418	\N	\N	\N
37	wo5q7tm7q6o2rs1wlo3m4nmk	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2025-10-16 09:53:06.424	2025-10-16 09:53:06.424	2025-10-16 09:53:06.424	\N	\N	\N
38	df4jsicydxw609vwja4fd948	plugin::users-permissions.providers.read	{}	\N	{}	[]	2025-10-16 09:53:06.429	2025-10-16 09:53:06.429	2025-10-16 09:53:06.43	\N	\N	\N
39	msrdocnhtsjftnwqhqc471bc	plugin::users-permissions.providers.update	{}	\N	{}	[]	2025-10-16 09:53:06.435	2025-10-16 09:53:06.435	2025-10-16 09:53:06.436	\N	\N	\N
40	ruehfaxkrhh8pxzxrw8lfxww	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2025-10-16 09:53:06.441	2025-10-16 09:53:06.441	2025-10-16 09:53:06.441	\N	\N	\N
41	fgaihnf37211uqzc243wubdf	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2025-10-16 09:53:06.447	2025-10-16 09:53:06.447	2025-10-16 09:53:06.447	\N	\N	\N
42	fb6gmudurcxdyyeuug5jl8u2	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2025-10-16 09:53:06.453	2025-10-16 09:53:06.453	2025-10-16 09:53:06.453	\N	\N	\N
43	twr1o4xtdne8z9x8hy4c9ljs	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2025-10-16 09:53:06.459	2025-10-16 09:53:06.459	2025-10-16 09:53:06.459	\N	\N	\N
44	ou27k9iqx95l9pe35kyanipf	admin::marketplace.read	{}	\N	{}	[]	2025-10-16 09:53:06.465	2025-10-16 09:53:06.465	2025-10-16 09:53:06.465	\N	\N	\N
45	w9eamm2uxwx8o5mel1cw9u3a	admin::webhooks.create	{}	\N	{}	[]	2025-10-16 09:53:06.484	2025-10-16 09:53:06.484	2025-10-16 09:53:06.485	\N	\N	\N
46	e6xumct50vphjnh6nrg5brcz	admin::webhooks.read	{}	\N	{}	[]	2025-10-16 09:53:06.491	2025-10-16 09:53:06.491	2025-10-16 09:53:06.491	\N	\N	\N
47	x8ws5zedx82361jtnen5drrt	admin::webhooks.update	{}	\N	{}	[]	2025-10-16 09:53:06.498	2025-10-16 09:53:06.498	2025-10-16 09:53:06.498	\N	\N	\N
48	kpm5o5ijfulbmi1avrc0xkgd	admin::webhooks.delete	{}	\N	{}	[]	2025-10-16 09:53:06.504	2025-10-16 09:53:06.504	2025-10-16 09:53:06.504	\N	\N	\N
49	jhmxabahsdgu0dazxnby2iyz	admin::users.create	{}	\N	{}	[]	2025-10-16 09:53:06.51	2025-10-16 09:53:06.51	2025-10-16 09:53:06.511	\N	\N	\N
50	piqvqe90362am3x9ix69639a	admin::users.read	{}	\N	{}	[]	2025-10-16 09:53:06.517	2025-10-16 09:53:06.517	2025-10-16 09:53:06.518	\N	\N	\N
51	dxkm2973oqtk1ttq37r6jn34	admin::users.update	{}	\N	{}	[]	2025-10-16 09:53:06.525	2025-10-16 09:53:06.525	2025-10-16 09:53:06.525	\N	\N	\N
52	rnapqqr75bj67hqly86zzd0v	admin::users.delete	{}	\N	{}	[]	2025-10-16 09:53:06.531	2025-10-16 09:53:06.531	2025-10-16 09:53:06.531	\N	\N	\N
53	xocp28abwcussyqdfvsprov8	admin::roles.create	{}	\N	{}	[]	2025-10-16 09:53:06.537	2025-10-16 09:53:06.537	2025-10-16 09:53:06.537	\N	\N	\N
54	y5mf9drcnoqql1pxqal8e365	admin::roles.read	{}	\N	{}	[]	2025-10-16 09:53:06.543	2025-10-16 09:53:06.543	2025-10-16 09:53:06.543	\N	\N	\N
55	eg1wzerdyi4u58qq69e14wrw	admin::roles.update	{}	\N	{}	[]	2025-10-16 09:53:06.55	2025-10-16 09:53:06.55	2025-10-16 09:53:06.551	\N	\N	\N
56	rclbndc6u3gt7a51umyqfgvi	admin::roles.delete	{}	\N	{}	[]	2025-10-16 09:53:06.557	2025-10-16 09:53:06.557	2025-10-16 09:53:06.557	\N	\N	\N
57	sbk9ywhv1j72ksatmelwa63c	admin::api-tokens.access	{}	\N	{}	[]	2025-10-16 09:53:06.563	2025-10-16 09:53:06.563	2025-10-16 09:53:06.564	\N	\N	\N
58	sydryuj96djwgpkwdo4a5noy	admin::api-tokens.create	{}	\N	{}	[]	2025-10-16 09:53:06.569	2025-10-16 09:53:06.569	2025-10-16 09:53:06.57	\N	\N	\N
59	fp9b4d8glbg7ff5y2d2qz9nb	admin::api-tokens.read	{}	\N	{}	[]	2025-10-16 09:53:06.575	2025-10-16 09:53:06.575	2025-10-16 09:53:06.575	\N	\N	\N
60	ca5j3eeqkij0cezb7gx0tmsn	admin::api-tokens.update	{}	\N	{}	[]	2025-10-16 09:53:06.581	2025-10-16 09:53:06.581	2025-10-16 09:53:06.581	\N	\N	\N
61	qds4radmb9zoh92vkkxx0xwo	admin::api-tokens.regenerate	{}	\N	{}	[]	2025-10-16 09:53:06.587	2025-10-16 09:53:06.587	2025-10-16 09:53:06.587	\N	\N	\N
62	l6qfashklvkt7ewcqlf0p4xg	admin::api-tokens.delete	{}	\N	{}	[]	2025-10-16 09:53:06.593	2025-10-16 09:53:06.593	2025-10-16 09:53:06.593	\N	\N	\N
63	c91e7br1ptw7eylbvizc119n	admin::project-settings.update	{}	\N	{}	[]	2025-10-16 09:53:06.598	2025-10-16 09:53:06.598	2025-10-16 09:53:06.598	\N	\N	\N
64	q7mflbmekhwqz62qgjji7ekp	admin::project-settings.read	{}	\N	{}	[]	2025-10-16 09:53:06.604	2025-10-16 09:53:06.604	2025-10-16 09:53:06.604	\N	\N	\N
65	mkrrpfmkbf26sygng922hz5s	admin::transfer.tokens.access	{}	\N	{}	[]	2025-10-16 09:53:06.609	2025-10-16 09:53:06.609	2025-10-16 09:53:06.609	\N	\N	\N
66	r6e24354s5juafi3suiny8oj	admin::transfer.tokens.create	{}	\N	{}	[]	2025-10-16 09:53:06.615	2025-10-16 09:53:06.615	2025-10-16 09:53:06.615	\N	\N	\N
67	j9zdfn4qcnw3njuvobfupu8a	admin::transfer.tokens.read	{}	\N	{}	[]	2025-10-16 09:53:06.621	2025-10-16 09:53:06.621	2025-10-16 09:53:06.621	\N	\N	\N
68	m1ef9fozxxlfezq7lh0yzfjw	admin::transfer.tokens.update	{}	\N	{}	[]	2025-10-16 09:53:06.626	2025-10-16 09:53:06.626	2025-10-16 09:53:06.626	\N	\N	\N
69	jd82rrbt4ug9bq4jpd666qtv	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2025-10-16 09:53:06.632	2025-10-16 09:53:06.632	2025-10-16 09:53:06.632	\N	\N	\N
70	cpnymraj36l4p8x2onhhzujr	admin::transfer.tokens.delete	{}	\N	{}	[]	2025-10-16 09:53:06.638	2025-10-16 09:53:06.638	2025-10-16 09:53:06.638	\N	\N	\N
255	pcb6y45zuluie13dsa8mfj91	plugin::content-manager.explorer.create	{}	api::emp-register-qcc.emp-register-qcc	{"fields": ["position", "register_qcc", "employee"]}	[]	2025-11-21 16:19:40.796	2025-11-21 16:19:40.796	2025-11-21 16:19:40.799	\N	\N	\N
256	s7a2tuketeeo79ilaq3pzgtc	plugin::content-manager.explorer.create	{}	api::employee.employee	{"fields": ["employee_code", "full_name", "department", "team", "position", "activity_history", "training_history", "type_group", "email", "emp_register_qccs"]}	[]	2025-11-21 16:19:40.811	2025-11-21 16:19:40.811	2025-11-21 16:19:40.812	\N	\N	\N
257	tfw936wmvevdd5swdcdce40m	plugin::content-manager.explorer.read	{}	api::emp-register-qcc.emp-register-qcc	{"fields": ["position", "register_qcc", "employee"]}	[]	2025-11-21 16:19:40.817	2025-11-21 16:19:40.817	2025-11-21 16:19:40.818	\N	\N	\N
258	fshvi931le6wpe93ehf2eddg	plugin::content-manager.explorer.read	{}	api::employee.employee	{"fields": ["employee_code", "full_name", "department", "team", "position", "activity_history", "training_history", "type_group", "email", "emp_register_qccs"]}	[]	2025-11-21 16:19:40.823	2025-11-21 16:19:40.823	2025-11-21 16:19:40.824	\N	\N	\N
259	nootvgsaccdz4yn7faudqirp	plugin::content-manager.explorer.update	{}	api::emp-register-qcc.emp-register-qcc	{"fields": ["position", "register_qcc", "employee"]}	[]	2025-11-21 16:19:40.829	2025-11-21 16:19:40.829	2025-11-21 16:19:40.83	\N	\N	\N
260	uubaxm6x7q43py5tj7mcfl3z	plugin::content-manager.explorer.update	{}	api::employee.employee	{"fields": ["employee_code", "full_name", "department", "team", "position", "activity_history", "training_history", "type_group", "email", "emp_register_qccs"]}	[]	2025-11-21 16:19:40.835	2025-11-21 16:19:40.835	2025-11-21 16:19:40.835	\N	\N	\N
97	f80n76ra5y9defwucg8ch5ou	plugin::strapi-import-export.import	{}	\N	{}	[]	2025-10-31 15:00:17.316	2025-10-31 15:00:17.316	2025-10-31 15:00:17.318	\N	\N	\N
98	op32411h02z1edmte82wnxwt	plugin::strapi-import-export.export	{}	\N	{}	[]	2025-10-31 15:00:17.334	2025-10-31 15:00:17.334	2025-10-31 15:00:17.335	\N	\N	\N
102	yw7hp20sk9sf6uc1jbpuxa15	plugin::content-manager.explorer.delete	{}	api::employee.employee	{}	[]	2025-11-04 13:41:41.381	2025-11-04 13:41:41.381	2025-11-04 13:41:41.382	\N	\N	\N
103	xu65xtetryn1hobrtq2yde68	plugin::content-manager.explorer.publish	{}	api::employee.employee	{}	[]	2025-11-04 13:41:41.389	2025-11-04 13:41:41.389	2025-11-04 13:41:41.39	\N	\N	\N
243	antx1u5q0px8ppppohlmo3bw	plugin::content-manager.explorer.create	{}	api::register-qcc.register-qcc	{"fields": ["registration_date", "group_id", "department", "type_group", "name_team", "team_slogan", "group_advisor", "group_manager_primary", "group_manager_secondary", "type_of_routine_work", "status_qcc", "logo", "emp_register_qcc"]}	[]	2025-11-21 16:16:47.143	2025-11-21 16:16:47.143	2025-11-21 16:16:47.146	\N	\N	\N
244	ykx92i3zeo8mtbbqa572qgqs	plugin::content-manager.explorer.read	{}	api::register-qcc.register-qcc	{"fields": ["registration_date", "group_id", "department", "type_group", "name_team", "team_slogan", "group_advisor", "group_manager_primary", "group_manager_secondary", "type_of_routine_work", "status_qcc", "logo", "emp_register_qcc"]}	[]	2025-11-21 16:16:47.158	2025-11-21 16:16:47.158	2025-11-21 16:16:47.159	\N	\N	\N
113	mto7q2l9y5p5pj6f6glruj6u	plugin::content-manager.explorer.delete	{}	api::register-qcc.register-qcc	{}	[]	2025-11-04 14:56:14.346	2025-11-04 14:56:14.346	2025-11-04 14:56:14.347	\N	\N	\N
114	d54jiyl4o92tv0brkx4fxari	plugin::content-manager.explorer.publish	{}	api::register-qcc.register-qcc	{}	[]	2025-11-04 14:56:14.353	2025-11-04 14:56:14.353	2025-11-04 14:56:14.353	\N	\N	\N
245	yue5kjwfm53pa11vcsk7b5gj	plugin::content-manager.explorer.update	{}	api::register-qcc.register-qcc	{"fields": ["registration_date", "group_id", "department", "type_group", "name_team", "team_slogan", "group_advisor", "group_manager_primary", "group_manager_secondary", "type_of_routine_work", "status_qcc", "logo", "emp_register_qcc"]}	[]	2025-11-21 16:16:47.166	2025-11-21 16:16:47.166	2025-11-21 16:16:47.167	\N	\N	\N
118	ymfdaw6dtx3dro1ty4cw19zg	plugin::content-manager.explorer.delete	{}	api::emp-register-qcc.emp-register-qcc	{}	[]	2025-11-04 15:12:13.966	2025-11-04 15:12:13.966	2025-11-04 15:12:13.967	\N	\N	\N
119	vn8ahz8kwxfoc156sj6o65cg	plugin::content-manager.explorer.publish	{}	api::emp-register-qcc.emp-register-qcc	{}	[]	2025-11-04 15:12:13.972	2025-11-04 15:12:13.972	2025-11-04 15:12:13.972	\N	\N	\N
126	eptaq60ilb2zdvrtl59zgs8a	plugin::content-manager.explorer.delete	{}	api::department.department	{}	[]	2025-11-04 15:55:59.579	2025-11-04 15:55:59.579	2025-11-04 15:55:59.579	\N	\N	\N
127	s0ldz7yl0l7r5zqugnwd8bmr	plugin::content-manager.explorer.publish	{}	api::department.department	{}	[]	2025-11-04 15:55:59.585	2025-11-04 15:55:59.585	2025-11-04 15:55:59.586	\N	\N	\N
134	bvx0wbga820dxkfmoa12miya	plugin::content-manager.explorer.delete	{}	api::team.team	{}	[]	2025-11-04 16:14:44.938	2025-11-04 16:14:44.938	2025-11-04 16:14:44.94	\N	\N	\N
135	ctuuinr3tirhsykq4n8h24rp	plugin::content-manager.explorer.publish	{}	api::team.team	{}	[]	2025-11-04 16:14:44.948	2025-11-04 16:14:44.948	2025-11-04 16:14:44.949	\N	\N	\N
168	i3kns9a3a2qxfqz0xqk9rr1l	plugin::content-manager.explorer.create	{}	api::team.team	{"fields": ["name", "department", "type_group"]}	[]	2025-11-05 11:54:39.647	2025-11-05 11:54:39.647	2025-11-05 11:54:39.648	\N	\N	\N
169	n6rqbwe43qdmj2p9j90i4lw6	plugin::content-manager.explorer.read	{}	api::team.team	{"fields": ["name", "department", "type_group"]}	[]	2025-11-05 11:54:39.658	2025-11-05 11:54:39.658	2025-11-05 11:54:39.659	\N	\N	\N
170	r0jhd8coui4ctyxsj1arpacz	plugin::content-manager.explorer.update	{}	api::team.team	{"fields": ["name", "department", "type_group"]}	[]	2025-11-05 11:54:39.665	2025-11-05 11:54:39.665	2025-11-05 11:54:39.665	\N	\N	\N
171	yrfvz1r1ztbe9m676ahwv435	plugin::content-manager.explorer.create	{}	api::department.department	{"fields": ["name", "teams"]}	[]	2025-11-14 13:13:43.719	2025-11-14 13:13:43.719	2025-11-14 13:13:43.72	\N	\N	\N
172	rfptamkdtw0pwovbhnqxeube	plugin::content-manager.explorer.read	{}	api::department.department	{"fields": ["name", "teams"]}	[]	2025-11-14 13:13:43.731	2025-11-14 13:13:43.731	2025-11-14 13:13:43.731	\N	\N	\N
173	eibpfv2n3x947qsysqzfab8r	plugin::content-manager.explorer.update	{}	api::department.department	{"fields": ["name", "teams"]}	[]	2025-11-14 13:13:43.737	2025-11-14 13:13:43.737	2025-11-14 13:13:43.738	\N	\N	\N
\.


--
-- TOC entry 5393 (class 0 OID 16951)
-- Dependencies: 284
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
13	13	1	1
14	14	1	2
15	15	1	3
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
70	70	1	58
255	255	1	163
256	256	1	164
257	257	1	165
258	258	1	166
259	259	1	167
260	260	1	168
97	97	1	72
98	98	1	73
102	102	1	77
103	103	1	78
113	113	1	85
114	114	1	86
118	118	1	90
119	119	1	91
126	126	1	98
127	127	1	99
134	134	1	106
135	135	1	107
243	243	1	160
244	244	1	161
245	245	1	162
168	168	1	132
169	169	1	133
170	170	1	134
171	171	1	135
172	172	1	136
173	173	1	137
\.


--
-- TOC entry 5357 (class 0 OID 16744)
-- Dependencies: 248
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	yathhqj1u9edw3miokoi03xv	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2025-10-16 09:53:06.008	2025-10-16 09:53:06.008	2025-10-16 09:53:06.008	\N	\N	\N
2	okgu3jrrwtaa6la0k4lr89d5	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2025-10-16 09:53:06.035	2025-10-16 09:53:06.035	2025-10-16 09:53:06.035	\N	\N	\N
3	dorxep39lry2nvegtno7k31t	Author	strapi-author	Authors can manage the content they have created.	2025-10-16 09:53:06.041	2025-10-16 09:53:06.041	2025-10-16 09:53:06.041	\N	\N	\N
\.


--
-- TOC entry 5355 (class 0 OID 16732)
-- Dependencies: 246
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	bmuwiuyxu601mgpazoxtztcl	wasuchok	jainam	\N	wasuchokop@gmail.com	$2a$10$trZuTbKvu7wJ.alkbemQZuxTQwsG.fgcO7CJkgWuooizrpiBG4A76	\N	\N	t	f	\N	2025-10-16 09:56:18.386	2025-10-16 09:56:18.386	2025-10-16 09:56:18.389	\N	\N	\N
\.


--
-- TOC entry 5395 (class 0 OID 16963)
-- Dependencies: 286
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
\.


--
-- TOC entry 5407 (class 0 OID 17550)
-- Dependencies: 298
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, name) FROM stdin;
1	vfnnu56lenjc9c4b39jwzh6q	2025-11-04 16:09:03.834	2025-11-04 16:09:03.834	\N	1	1	\N	PDT1
2	vfnnu56lenjc9c4b39jwzh6q	2025-11-04 16:09:03.834	2025-11-04 16:09:03.834	2025-11-04 16:09:03.865	1	1	\N	PDT1
3	eihrlp94qhdpdijyk9hv0xzd	2025-11-04 16:09:42.25	2025-11-04 16:09:42.25	\N	1	1	\N	PDT2
4	eihrlp94qhdpdijyk9hv0xzd	2025-11-04 16:09:42.25	2025-11-04 16:09:42.25	2025-11-04 16:09:42.271	1	1	\N	PDT2
5	s465wjsaosynuprfenfjwc15	2025-11-04 16:09:53.289	2025-11-04 16:09:53.289	\N	1	1	\N	PDT3
6	s465wjsaosynuprfenfjwc15	2025-11-04 16:09:53.289	2025-11-04 16:09:53.289	2025-11-04 16:09:53.308	1	1	\N	PDT3
7	ac8vd732q8agozm1965yv9gc	2025-11-04 16:10:02.778	2025-11-04 16:10:02.778	\N	1	1	\N	PDT4
8	ac8vd732q8agozm1965yv9gc	2025-11-04 16:10:02.778	2025-11-04 16:10:02.778	2025-11-04 16:10:02.797	1	1	\N	PDT4
9	imloqsnzqbjy8jl8vglu7hao	2025-11-04 16:11:03.149	2025-11-04 16:11:03.149	\N	1	1	\N	ENI
10	imloqsnzqbjy8jl8vglu7hao	2025-11-04 16:11:03.149	2025-11-04 16:11:03.149	2025-11-04 16:11:03.17	1	1	\N	ENI
11	mp5al3ho4qtiz1p48hlwefz1	2025-11-04 16:11:14.113	2025-11-04 16:11:14.113	\N	1	1	\N	PDM
12	mp5al3ho4qtiz1p48hlwefz1	2025-11-04 16:11:14.113	2025-11-04 16:11:14.113	2025-11-04 16:11:14.133	1	1	\N	PDM
13	tn64ey0bm7eu9lanmj4zw2md	2025-11-04 16:11:24.661	2025-11-04 16:11:36.642	\N	1	1	\N	QAD
15	tn64ey0bm7eu9lanmj4zw2md	2025-11-04 16:11:24.661	2025-11-04 16:11:36.642	2025-11-04 16:11:36.666	1	1	\N	QAD
16	w5mbd7vatw9p189350f9ev06	2025-11-04 16:11:50.011	2025-11-04 16:12:18.898	\N	1	1	\N	FNC
21	w5mbd7vatw9p189350f9ev06	2025-11-04 16:11:50.011	2025-11-04 16:12:18.898	2025-11-04 16:12:18.92	1	1	\N	FNC
22	u6xkejcsu6prx1c1ihg0r5du	2025-11-04 16:39:22.403	2025-11-04 16:39:22.403	\N	1	1	\N	PCM
23	u6xkejcsu6prx1c1ihg0r5du	2025-11-04 16:39:22.403	2025-11-04 16:39:22.403	2025-11-04 16:39:22.428	1	1	\N	PCM
26	t07zuthii743bhzed6ejv8lp	2025-11-04 16:57:45.329	2025-11-04 16:57:45.329	\N	1	1	\N	SAM
27	t07zuthii743bhzed6ejv8lp	2025-11-04 16:57:45.329	2025-11-04 16:57:45.329	2025-11-04 16:57:45.351	1	1	\N	SAM
29	lxkmqmajugfrtnzc63iwcq5n	2025-11-04 16:58:39.902	2025-11-04 16:58:39.902	\N	1	1	\N	MKT
30	lxkmqmajugfrtnzc63iwcq5n	2025-11-04 16:58:39.902	2025-11-04 16:58:39.902	2025-11-04 16:58:39.922	1	1	\N	MKT
31	jvbmfj2c860x6yq4ums68fmo	2025-11-04 16:58:54.522	2025-11-04 16:58:54.522	\N	1	1	\N	PUD
32	jvbmfj2c860x6yq4ums68fmo	2025-11-04 16:58:54.522	2025-11-04 16:58:54.522	2025-11-04 16:58:54.544	1	1	\N	PUD
33	j79z5llrdlzzk3e8yyhv67jz	2025-11-04 17:02:43.504	2025-11-04 17:02:43.504	\N	1	1	\N	HRD
34	j79z5llrdlzzk3e8yyhv67jz	2025-11-04 17:02:43.504	2025-11-04 17:02:43.504	2025-11-04 17:02:43.528	1	1	\N	HRD
\.


--
-- TOC entry 5405 (class 0 OID 17524)
-- Dependencies: 296
-- Data for Name: emp_register_qccs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emp_register_qccs (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, "position") FROM stdin;
6	nsi3s560ekcockpem83unaj1	2025-11-21 16:11:56.019	2025-11-21 16:19:59.554	\N	1	1	\N	DeputyLeader
8	nsi3s560ekcockpem83unaj1	2025-11-21 16:11:56.019	2025-11-21 16:19:59.554	2025-11-21 16:19:59.608	1	1	\N	DeputyLeader
3	o0btusmsxaz4ewjwbpmp2g7z	2025-11-21 15:54:42.084	2025-11-21 16:20:08.26	\N	1	1	\N	Leader
9	o0btusmsxaz4ewjwbpmp2g7z	2025-11-21 15:54:42.084	2025-11-21 16:20:08.26	2025-11-21 16:20:08.302	1	1	\N	Leader
\.


--
-- TOC entry 5415 (class 0 OID 17932)
-- Dependencies: 306
-- Data for Name: emp_register_qccs_employee_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emp_register_qccs_employee_lnk (id, emp_register_qcc_id, employee_id, emp_register_qcc_ord) FROM stdin;
1	6	5	1
2	8	6	1
3	3	17	1
4	9	18	1
\.


--
-- TOC entry 5413 (class 0 OID 17878)
-- Dependencies: 304
-- Data for Name: emp_register_qccs_register_qcc_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emp_register_qccs_register_qcc_lnk (id, emp_register_qcc_id, register_qcc_id, emp_register_qcc_ord) FROM stdin;
1	3	1	1
3	6	1	2
7	8	4	2
8	9	4	1
\.


--
-- TOC entry 5401 (class 0 OID 17462)
-- Dependencies: 292
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, document_id, employee_code, full_name, department, team, "position", activity_history, training_history, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, type_group, email) FROM stdin;
1	n5q64wuidu2o1id2ngdynszo	310002	นาย นิทัศน์ สอนสุด	QAD	IP	Junior	19		2025-11-04 14:41:36.934	2025-11-04 14:41:36.934	\N	\N	\N	\N	Support	\N
2	n5q64wuidu2o1id2ngdynszo	310002	นาย นิทัศน์ สอนสุด	QAD	IP	Junior	19		2025-11-04 14:41:36.934	2025-11-04 14:41:36.934	2025-11-04 14:41:36.953	\N	\N	\N	Support	\N
3	pccyogmks0q55ul67beg0rcr	310003	นาย ประโยชน์ ธัญญกรรม	PDT1	M8	Expert	19		2025-11-04 14:41:37.005	2025-11-04 14:41:37.005	\N	\N	\N	\N	Production	\N
4	pccyogmks0q55ul67beg0rcr	310003	นาย ประโยชน์ ธัญญกรรม	PDT1	M8	Expert	19		2025-11-04 14:41:37.005	2025-11-04 14:41:37.005	2025-11-04 14:41:37.017	\N	\N	\N	Production	\N
5	fmxzsb228fo3kehfcucjig3b	320004	นาย ยงยุทธ ชินพะวอ	PDT4	UB	Leader	19		2025-11-04 14:41:37.068	2025-11-04 14:41:37.068	\N	\N	\N	\N	Production	\N
6	fmxzsb228fo3kehfcucjig3b	320004	นาย ยงยุทธ ชินพะวอ	PDT4	UB	Leader	19		2025-11-04 14:41:37.068	2025-11-04 14:41:37.068	2025-11-04 14:41:37.079	\N	\N	\N	Production	\N
7	onv1g27t0j36hgvyr93c8i3l	320008	นาย สัมฤทธิ์ เป้งทอง	PDT4	JP	Staff	19		2025-11-04 14:41:37.134	2025-11-04 14:41:37.134	\N	\N	\N	\N	Production	\N
8	onv1g27t0j36hgvyr93c8i3l	320008	นาย สัมฤทธิ์ เป้งทอง	PDT4	JP	Staff	19		2025-11-04 14:41:37.134	2025-11-04 14:41:37.134	2025-11-04 14:41:37.157	\N	\N	\N	Production	\N
9	pkrgsq1ohjnf3kr22w1bnw7o	320014	นาย จามร โม้หมุน	PDT4	JM	Staff	19		2025-11-04 14:41:37.192	2025-11-04 14:41:37.192	\N	\N	\N	\N	Production	\N
10	pkrgsq1ohjnf3kr22w1bnw7o	320014	นาย จามร โม้หมุน	PDT4	JM	Staff	19		2025-11-04 14:41:37.192	2025-11-04 14:41:37.192	2025-11-04 14:41:37.202	\N	\N	\N	Production	\N
13	mzutnro700mfgyc9tc2s12t7	330002	นาย จันทร์ ศรีชำนาญ	PDT4	UB	Staff	19		2025-11-04 14:41:37.338	2025-11-04 14:41:37.338	\N	\N	\N	\N	Production	\N
14	mzutnro700mfgyc9tc2s12t7	330002	นาย จันทร์ ศรีชำนาญ	PDT4	UB	Staff	19		2025-11-04 14:41:37.338	2025-11-04 14:41:37.338	2025-11-04 14:41:37.347	\N	\N	\N	Production	\N
15	uogb7qphvfo8y2hdlusokni8	330005	นาย ยงชัย เขียวไสว	PDT4	UB	Foreman	19		2025-11-04 14:41:37.383	2025-11-04 14:41:37.383	\N	\N	\N	\N	Production	\N
16	uogb7qphvfo8y2hdlusokni8	330005	นาย ยงชัย เขียวไสว	PDT4	UB	Foreman	19		2025-11-04 14:41:37.383	2025-11-04 14:41:37.383	2025-11-04 14:41:37.392	\N	\N	\N	Production	\N
17	gstf8kfndqi5nenpkb3qbsx2	330006	นาย ลำพึง ลัดดาทอง	PDT4	JM	Staff	19		2025-11-04 14:41:37.453	2025-11-04 14:41:37.453	\N	\N	\N	\N	Production	\N
18	gstf8kfndqi5nenpkb3qbsx2	330006	นาย ลำพึง ลัดดาทอง	PDT4	JM	Staff	19		2025-11-04 14:41:37.453	2025-11-04 14:41:37.453	2025-11-04 14:41:37.463	\N	\N	\N	Production	\N
19	p1c75gu6wwxigf0rtlccf0f0	330009	นาย วัชรินทร์ กวนทอง	PDT4	JM	Staff	19		2025-11-04 14:41:37.539	2025-11-04 14:41:37.539	\N	\N	\N	\N	Production	\N
20	p1c75gu6wwxigf0rtlccf0f0	330009	นาย วัชรินทร์ กวนทอง	PDT4	JM	Staff	19		2025-11-04 14:41:37.539	2025-11-04 14:41:37.539	2025-11-04 14:41:37.548	\N	\N	\N	Production	\N
21	lymrkgjy8g3saf437j377a9r	330012	นาย ภาณุพงศ์ เครื่องผง	HRD	GA	Staff	19		2025-11-04 14:41:37.583	2025-11-04 14:41:37.583	\N	\N	\N	\N	Non Production	\N
22	lymrkgjy8g3saf437j377a9r	330012	นาย ภาณุพงศ์ เครื่องผง	HRD	GA	Staff	19		2025-11-04 14:41:37.583	2025-11-04 14:41:37.583	2025-11-04 14:41:37.592	\N	\N	\N	Non Production	\N
23	sk1esqrley27hifrsh89jwdy	330013	นาย สยาม แข็งขัน	HRD	GA	Staff	19		2025-11-04 14:41:37.651	2025-11-04 14:41:37.651	\N	\N	\N	\N	Non Production	\N
24	sk1esqrley27hifrsh89jwdy	330013	นาย สยาม แข็งขัน	HRD	GA	Staff	19		2025-11-04 14:41:37.651	2025-11-04 14:41:37.651	2025-11-04 14:41:37.685	\N	\N	\N	Non Production	\N
25	ol9mpi20rq2yqs746qn2dwko	340001	นาย ศราณุชิต บัวใหญ่รักษา	ENI	FDM	Leader	19	เข้าอบรม	2025-11-04 14:41:37.727	2025-11-04 14:41:37.727	\N	\N	\N	\N	Support	\N
26	ol9mpi20rq2yqs746qn2dwko	340001	นาย ศราณุชิต บัวใหญ่รักษา	ENI	FDM	Leader	19	เข้าอบรม	2025-11-04 14:41:37.727	2025-11-04 14:41:37.727	2025-11-04 14:41:37.749	\N	\N	\N	Support	\N
27	ra20x01gec4oqyvrg0d8qp55	340003	นาย สุพพัต พิมพ์รส	PDT4	JM	Staff	19		2025-11-04 14:41:37.791	2025-11-04 14:41:37.791	\N	\N	\N	\N	Production	\N
28	ra20x01gec4oqyvrg0d8qp55	340003	นาย สุพพัต พิมพ์รส	PDT4	JM	Staff	19		2025-11-04 14:41:37.791	2025-11-04 14:41:37.791	2025-11-04 14:41:37.81	\N	\N	\N	Production	\N
29	h9lor2nkuam0s7qqljb171p9	340006	นาย สมบัติ แขมภูเขียว	PCM	TP	Staff	19		2025-11-04 14:41:37.855	2025-11-04 14:41:37.855	\N	\N	\N	\N	Support	\N
30	h9lor2nkuam0s7qqljb171p9	340006	นาย สมบัติ แขมภูเขียว	PCM	TP	Staff	19		2025-11-04 14:41:37.855	2025-11-04 14:41:37.855	2025-11-04 14:41:37.863	\N	\N	\N	Support	\N
31	m7030lk9shk4d018wokhervr	340007	นาย มานพ เพชรสุวรรณ	PCM	TP	Staff	19		2025-11-04 14:41:37.92	2025-11-04 14:41:37.92	\N	\N	\N	\N	Support	\N
32	m7030lk9shk4d018wokhervr	340007	นาย มานพ เพชรสุวรรณ	PCM	TP	Staff	19		2025-11-04 14:41:37.92	2025-11-04 14:41:37.92	2025-11-04 14:41:37.929	\N	\N	\N	Support	\N
33	myl6e9fyhpdhlrxva8bdcjl3	350002	นาย อดิศักดิ์ มาเจริญ	PDT1	EG	Staff	19		2025-11-04 14:41:37.997	2025-11-04 14:41:37.997	\N	\N	\N	\N	Production	\N
34	myl6e9fyhpdhlrxva8bdcjl3	350002	นาย อดิศักดิ์ มาเจริญ	PDT1	EG	Staff	19		2025-11-04 14:41:37.997	2025-11-04 14:41:37.997	2025-11-04 14:41:38.019	\N	\N	\N	Production	\N
35	mtwrfk4f6quf0eq2zp5197c2	350007	นาย จารุภูมิ ศรีอัครเดช	HRD	GA	Staff	19		2025-11-04 14:41:38.058	2025-11-04 14:41:38.058	\N	\N	\N	\N	Non Production	\N
36	mtwrfk4f6quf0eq2zp5197c2	350007	นาย จารุภูมิ ศรีอัครเดช	HRD	GA	Staff	19		2025-11-04 14:41:38.058	2025-11-04 14:41:38.058	2025-11-04 14:41:38.065	\N	\N	\N	Non Production	\N
37	emn62xkwei73l4gnjz7jor4i	350012	นาย วรวิทย์ สีดา	QAD	IP	Foreman	19	เข้าอบรม	2025-11-04 14:41:38.12	2025-11-04 14:41:38.12	\N	\N	\N	\N	Support	\N
38	emn62xkwei73l4gnjz7jor4i	350012	นาย วรวิทย์ สีดา	QAD	IP	Foreman	19	เข้าอบรม	2025-11-04 14:41:38.12	2025-11-04 14:41:38.12	2025-11-04 14:41:38.127	\N	\N	\N	Support	\N
39	qp7urhyu1h8hycqxe5oxhuoc	350013	นาย สำราญ เถาโต	PCM	TM	Team Manager	19		2025-11-04 14:41:38.173	2025-11-20 14:26:47.456	\N	\N	1	\N	Support	samran@aoyama.co.th
41	ukh8bo3gv75ulid105zlptdp	360002	นาย กิตติพงศ์ เตราชูสงฆ์	ENI	FDM	Foreman	19	เข้าอบรม	2025-11-04 14:41:38.236	2025-11-04 14:41:38.236	\N	\N	\N	\N	Support	\N
42	ukh8bo3gv75ulid105zlptdp	360002	นาย กิตติพงศ์ เตราชูสงฆ์	ENI	FDM	Foreman	19	เข้าอบรม	2025-11-04 14:41:38.236	2025-11-04 14:41:38.236	2025-11-04 14:41:38.245	\N	\N	\N	Support	\N
45	fxmbunhxo791j547u8ffdaba	370007	นาย สมเกียรติ ใจใส	PDT2	OQ	Staff	19		2025-11-04 14:41:38.346	2025-11-04 14:41:38.346	\N	\N	\N	\N	Production	\N
46	fxmbunhxo791j547u8ffdaba	370007	นาย สมเกียรติ ใจใส	PDT2	OQ	Staff	19		2025-11-04 14:41:38.346	2025-11-04 14:41:38.346	2025-11-04 14:41:38.353	\N	\N	\N	Production	\N
53	asegjiqdi5a20higszddhwj3	370015	นาย วันทิพย์ ดีพิจารย์	PDT4	JM	Expert	19	เข้าอบรม	2025-11-04 14:41:38.562	2025-11-04 14:41:38.562	\N	\N	\N	\N	Production	\N
54	asegjiqdi5a20higszddhwj3	370015	นาย วันทิพย์ ดีพิจารย์	PDT4	JM	Expert	19	เข้าอบรม	2025-11-04 14:41:38.562	2025-11-04 14:41:38.562	2025-11-04 14:41:38.589	\N	\N	\N	Production	\N
57	gku6bzm9zoo8plduay3otsvi	370018	นาย สุนทร บัวทิพย์	PCM	CB	Staff	19		2025-11-04 14:41:38.69	2025-11-04 14:41:38.69	\N	\N	\N	\N	Support	\N
58	gku6bzm9zoo8plduay3otsvi	370018	นาย สุนทร บัวทิพย์	PCM	CB	Staff	19		2025-11-04 14:41:38.69	2025-11-04 14:41:38.69	2025-11-04 14:41:38.713	\N	\N	\N	Support	\N
65	e0ierx5mnyun4qjkq4i6tknn	380008	นาย บุญธง เพ็งพินิจ	PDT4	MC	Leader	19		2025-11-04 14:41:38.913	2025-11-04 14:41:38.913	\N	\N	\N	\N	Production	\N
66	e0ierx5mnyun4qjkq4i6tknn	380008	นาย บุญธง เพ็งพินิจ	PDT4	MC	Leader	19		2025-11-04 14:41:38.913	2025-11-04 14:41:38.913	2025-11-04 14:41:38.934	\N	\N	\N	Production	\N
69	ffgg6o8f1mx6r3qv98uzf16m	380013	นาย สนม มัธยมแก้ว	PDT4	MC	Leader	19	เข้าอบรม	2025-11-04 14:41:39.01	2025-11-04 14:41:39.01	\N	\N	\N	\N	Production	\N
70	ffgg6o8f1mx6r3qv98uzf16m	380013	นาย สนม มัธยมแก้ว	PDT4	MC	Leader	19	เข้าอบรม	2025-11-04 14:41:39.01	2025-11-04 14:41:39.01	2025-11-04 14:41:39.017	\N	\N	\N	Production	\N
73	zhkdqkwv6sht76pck58wcou0	380017	นาย กัมพล ธนูแก้ว	PDT1	M8	Staff	19		2025-11-04 14:41:39.099	2025-11-04 14:41:39.099	\N	\N	\N	\N	Production	\N
74	zhkdqkwv6sht76pck58wcou0	380017	นาย กัมพล ธนูแก้ว	PDT1	M8	Staff	19		2025-11-04 14:41:39.099	2025-11-04 14:41:39.099	2025-11-04 14:41:39.115	\N	\N	\N	Production	\N
77	r2bjk47wyxtftyl2zh99ii4h	380024	น.ส. สีนวน หล่านาเสียว	HRD	GA	Staff	19		2025-11-04 14:41:39.21	2025-11-04 14:41:39.21	\N	\N	\N	\N	Non Production	\N
78	r2bjk47wyxtftyl2zh99ii4h	380024	น.ส. สีนวน หล่านาเสียว	HRD	GA	Staff	19		2025-11-04 14:41:39.21	2025-11-04 14:41:39.21	2025-11-04 14:41:39.216	\N	\N	\N	Non Production	\N
81	ybx6810rsi6vca8jasx4f9x8	380030	นาย หนูรักษ์ รัตนวงศ์	PCM	ST	Junior	19		2025-11-04 14:41:39.314	2025-11-04 14:41:39.314	\N	\N	\N	\N	Support	\N
82	ybx6810rsi6vca8jasx4f9x8	380030	นาย หนูรักษ์ รัตนวงศ์	PCM	ST	Junior	19		2025-11-04 14:41:39.314	2025-11-04 14:41:39.314	2025-11-04 14:41:39.323	\N	\N	\N	Support	\N
85	ja1uca20yo7y4phwlgxxmt16	380032	นาย ธวัช สุขจิตต์	PCM	ST	Leader	19	เข้าอบรม	2025-11-04 14:41:39.417	2025-11-04 14:41:39.417	\N	\N	\N	\N	Support	\N
86	ja1uca20yo7y4phwlgxxmt16	380032	นาย ธวัช สุขจิตต์	PCM	ST	Leader	19	เข้าอบรม	2025-11-04 14:41:39.417	2025-11-04 14:41:39.417	2025-11-04 14:41:39.424	\N	\N	\N	Support	\N
89	lz9u3ee9l4y6w41xwh7y5jy1	390007	นาย สมบัติ เวรุตัง	PDT1	M8	Leader	19		2025-11-04 14:41:39.519	2025-11-04 14:41:39.519	\N	\N	\N	\N	Production	\N
90	lz9u3ee9l4y6w41xwh7y5jy1	390007	นาย สมบัติ เวรุตัง	PDT1	M8	Leader	19		2025-11-04 14:41:39.519	2025-11-04 14:41:39.519	2025-11-04 14:41:39.541	\N	\N	\N	Production	\N
93	m2quxplu5a8xasl92yii2vg5	390010	นาย อรรถกร บัวตูม	HRD	GA	Junior	19		2025-11-04 14:41:39.621	2025-11-04 14:41:39.621	\N	\N	\N	\N	Non Production	\N
94	m2quxplu5a8xasl92yii2vg5	390010	นาย อรรถกร บัวตูม	HRD	GA	Junior	19		2025-11-04 14:41:39.621	2025-11-04 14:41:39.621	2025-11-04 14:41:39.629	\N	\N	\N	Non Production	\N
97	t7vktxswgv3hzaq2nqudjs5p	390013	นาย ไชยา แก้วเทียมทอง	PDT4	JM	Staff	19		2025-11-04 14:41:39.722	2025-11-04 14:41:39.722	\N	\N	\N	\N	Production	\N
98	t7vktxswgv3hzaq2nqudjs5p	390013	นาย ไชยา แก้วเทียมทอง	PDT4	JM	Staff	19		2025-11-04 14:41:39.722	2025-11-04 14:41:39.722	2025-11-04 14:41:39.729	\N	\N	\N	Production	\N
109	bgh9bqf5w1agj6f9rz7igwox	420010	นาย วิชิต สีนะองการ	PDM	PC	Staff	19		2025-11-04 14:41:40.019	2025-11-04 14:41:40.019	\N	\N	\N	\N	Support	\N
110	bgh9bqf5w1agj6f9rz7igwox	420010	นาย วิชิต สีนะองการ	PDM	PC	Staff	19		2025-11-04 14:41:40.019	2025-11-04 14:41:40.019	2025-11-04 14:41:40.026	\N	\N	\N	Support	\N
113	iv8vovgq8i4fmft7obubdphf	420012	นาย แสนศักดิ์ เรืองหิรัญ	QAD	IP	Junior	19		2025-11-04 14:41:40.121	2025-11-04 14:41:40.121	\N	\N	\N	\N	Support	\N
114	iv8vovgq8i4fmft7obubdphf	420012	นาย แสนศักดิ์ เรืองหิรัญ	QAD	IP	Junior	19		2025-11-04 14:41:40.121	2025-11-04 14:41:40.121	2025-11-04 14:41:40.128	\N	\N	\N	Support	\N
49	plekji36paz0h18yhomsybmm	370009	นาย เฉลียว ปะตังเวสา	PDT4	TM	Senior Expert	19		2025-11-04 14:41:38.451	2025-11-20 14:26:55.993	\N	\N	1	\N	Production	chaliew@aoyama.co.th
101	o510axic0c6zb4zsqszuva8r	400009	นาย ปัญญา พิทักษ์ชาติ	PDT4	TM	Senior Expert	19		2025-11-04 14:41:39.822	2025-11-20 14:27:08.308	\N	\N	1	\N	Production	panya@aoyama.co.th
105	ycgmlw8a1mj5vy75x7ext43i	420004	นาย สมจิตร บุตรเรียง	PDT1	NT	Superior Expert	19		2025-11-04 14:41:39.921	2025-11-20 14:27:13.181	\N	\N	1	\N	Production	somjit_b@aoyama.co.th
117	outq3eixiledyv0um398r8kt	430003	นาย พิศุทธ์ ปาณชู	PUD	TM	Senior Team Manager	19		2025-11-04 14:41:40.221	2025-11-20 14:27:22.892	\N	\N	1	\N	Non Production	pisuth@aoyama.co.th
43	sjj86sk4y2vnchrhregmppzx	370005	นาย พิชัย ชูศรี	PDT4	JA	Leader	19	เข้าอบรม	2025-11-04 14:41:38.29	2025-11-04 14:41:38.29	\N	\N	\N	\N	Production	\N
44	sjj86sk4y2vnchrhregmppzx	370005	นาย พิชัย ชูศรี	PDT4	JA	Leader	19	เข้าอบรม	2025-11-04 14:41:38.29	2025-11-04 14:41:38.29	2025-11-04 14:41:38.299	\N	\N	\N	Production	\N
47	sjz9qlehir2w6q43wt3opago	370008	นาย ทองคำ สิมหาบุตร	PDT4	JP	Leader	19	เข้าอบรม	2025-11-04 14:41:38.398	2025-11-04 14:41:38.398	\N	\N	\N	\N	Production	\N
48	sjz9qlehir2w6q43wt3opago	370008	นาย ทองคำ สิมหาบุตร	PDT4	JP	Leader	19	เข้าอบรม	2025-11-04 14:41:38.398	2025-11-04 14:41:38.398	2025-11-04 14:41:38.42	\N	\N	\N	Production	\N
51	spgt5sug8a7fyi0d7swoloou	370014	นาย วินัย จันทะบุตร	PDM	PC	Staff	19		2025-11-04 14:41:38.505	2025-11-04 14:41:38.505	\N	\N	\N	\N	Support	\N
52	spgt5sug8a7fyi0d7swoloou	370014	นาย วินัย จันทะบุตร	PDM	PC	Staff	19		2025-11-04 14:41:38.505	2025-11-04 14:41:38.505	2025-11-04 14:41:38.512	\N	\N	\N	Support	\N
55	tlnpzf7cjp3h5svac5esq45w	370017	นาย สายพิน ปิ๊บกลาง	PDM	PC	Staff	19		2025-11-04 14:41:38.626	2025-11-04 14:41:38.626	\N	\N	\N	\N	Support	\N
56	tlnpzf7cjp3h5svac5esq45w	370017	นาย สายพิน ปิ๊บกลาง	PDM	PC	Staff	19		2025-11-04 14:41:38.626	2025-11-04 14:41:38.626	2025-11-04 14:41:38.649	\N	\N	\N	Support	\N
59	tgltdw7l50rfrv5wdptmoc9c	380005	นาย ยรรยง บุญหล้า	PDT4	JM	Leader	19	เข้าอบรม	2025-11-04 14:41:38.778	2025-11-04 14:41:38.778	\N	\N	\N	\N	Production	\N
60	tgltdw7l50rfrv5wdptmoc9c	380005	นาย ยรรยง บุญหล้า	PDT4	JM	Leader	19	เข้าอบรม	2025-11-04 14:41:38.778	2025-11-04 14:41:38.778	2025-11-04 14:41:38.786	\N	\N	\N	Production	\N
63	cfa31mxprvj7k6vo9mbia5xd	380007	น.ส. จำลอง อ้นโต	PDT3	WB	Staff	19		2025-11-04 14:41:38.865	2025-11-04 14:41:38.865	\N	\N	\N	\N	Production	\N
64	cfa31mxprvj7k6vo9mbia5xd	380007	น.ส. จำลอง อ้นโต	PDT3	WB	Staff	19		2025-11-04 14:41:38.865	2025-11-04 14:41:38.865	2025-11-04 14:41:38.886	\N	\N	\N	Production	\N
67	jb0hyn1p7ph50x7dpz5jyuie	380011	นาย วิเฉียบ สอนแก้ว	PDT1	M10	Leader	19		2025-11-04 14:41:38.963	2025-11-04 14:41:38.963	\N	\N	\N	\N	Production	\N
68	jb0hyn1p7ph50x7dpz5jyuie	380011	นาย วิเฉียบ สอนแก้ว	PDT1	M10	Leader	19		2025-11-04 14:41:38.963	2025-11-04 14:41:38.963	2025-11-04 14:41:38.97	\N	\N	\N	Production	\N
71	soqvn453xc5xhrw9dizv6ccw	380014	น.ส. น้ำทิพย์ สุดแต่ใจ	ENI	EN	Staff	19		2025-11-04 14:41:39.057	2025-11-04 14:41:39.057	\N	\N	\N	\N	Support	\N
72	soqvn453xc5xhrw9dizv6ccw	380014	น.ส. น้ำทิพย์ สุดแต่ใจ	ENI	EN	Staff	19		2025-11-04 14:41:39.057	2025-11-04 14:41:39.057	2025-11-04 14:41:39.065	\N	\N	\N	Support	\N
75	a64ert7gm7weqtsluvus3951	380022	นาย สมพร ชำรัมย์	PDT1	NT	Junior	19		2025-11-04 14:41:39.157	2025-11-04 14:41:39.157	\N	\N	\N	\N	Production	\N
76	a64ert7gm7weqtsluvus3951	380022	นาย สมพร ชำรัมย์	PDT1	NT	Junior	19		2025-11-04 14:41:39.157	2025-11-04 14:41:39.157	2025-11-04 14:41:39.167	\N	\N	\N	Production	\N
79	hypvcsrzh3s32oz5n5l84qn7	380029	นาย อนุสรณ์ อินจันทร์	PCM	CB	Staff	19		2025-11-04 14:41:39.262	2025-11-04 14:41:39.262	\N	\N	\N	\N	Support	\N
80	hypvcsrzh3s32oz5n5l84qn7	380029	นาย อนุสรณ์ อินจันทร์	PCM	CB	Staff	19		2025-11-04 14:41:39.262	2025-11-04 14:41:39.262	2025-11-04 14:41:39.285	\N	\N	\N	Support	\N
83	fjq9py3cpvofhqulrqcpu42h	380031	นาย รวม ภู่เพ็ชร์	PCM	ST	Staff	19		2025-11-04 14:41:39.365	2025-11-04 14:41:39.365	\N	\N	\N	\N	Support	\N
84	fjq9py3cpvofhqulrqcpu42h	380031	นาย รวม ภู่เพ็ชร์	PCM	ST	Staff	19		2025-11-04 14:41:39.365	2025-11-04 14:41:39.365	2025-11-04 14:41:39.374	\N	\N	\N	Support	\N
87	bq4ld48d8dv4uoiitnadmjwc	390003	นาย สยาม นฤทัต	ENI	FDM	Junior	19		2025-11-04 14:41:39.466	2025-11-04 14:41:39.466	\N	\N	\N	\N	Support	\N
88	bq4ld48d8dv4uoiitnadmjwc	390003	นาย สยาม นฤทัต	ENI	FDM	Junior	19		2025-11-04 14:41:39.466	2025-11-04 14:41:39.466	2025-11-04 14:41:39.474	\N	\N	\N	Support	\N
91	u20pad6mlrs3dalev9wnhurb	390008	นาง ยมลภัทร อาสนาทิพย์	PUD	PU1	Staff	19		2025-11-04 14:41:39.57	2025-11-04 14:41:39.57	\N	\N	\N	\N	Non Production	\N
92	u20pad6mlrs3dalev9wnhurb	390008	นาง ยมลภัทร อาสนาทิพย์	PUD	PU1	Staff	19		2025-11-04 14:41:39.57	2025-11-04 14:41:39.57	2025-11-04 14:41:39.592	\N	\N	\N	Non Production	\N
95	bokkglefzhwagvudmfa32lri	390011	นาย อมร พรหมดี	PDT3	BZ	Staff	19		2025-11-04 14:41:39.67	2025-11-04 14:41:39.67	\N	\N	\N	\N	Production	\N
96	bokkglefzhwagvudmfa32lri	390011	นาย อมร พรหมดี	PDT3	BZ	Staff	19		2025-11-04 14:41:39.67	2025-11-04 14:41:39.67	2025-11-04 14:41:39.676	\N	\N	\N	Production	\N
99	xhrvny4nfqe24fviyn2h0cka	400007	นาง นวลวรรณ โก๊ะเจริญ	FNC	AC	Foreman	19	เข้าอบรม	2025-11-04 14:41:39.772	2025-11-04 14:41:39.772	\N	\N	\N	\N	Non Production	\N
100	xhrvny4nfqe24fviyn2h0cka	400007	นาง นวลวรรณ โก๊ะเจริญ	FNC	AC	Foreman	19	เข้าอบรม	2025-11-04 14:41:39.772	2025-11-04 14:41:39.772	2025-11-04 14:41:39.778	\N	\N	\N	Non Production	\N
103	z1p8vm54bzi0pnoms75xk845	400012	น.ส. เสวิณีย์ สำราญ	PDT4	UB	Staff	19		2025-11-04 14:41:39.872	2025-11-04 14:41:39.872	\N	\N	\N	\N	Production	\N
104	z1p8vm54bzi0pnoms75xk845	400012	น.ส. เสวิณีย์ สำราญ	PDT4	UB	Staff	19		2025-11-04 14:41:39.872	2025-11-04 14:41:39.872	2025-11-04 14:41:39.893	\N	\N	\N	Production	\N
107	p0iqql6yx2zz8n735ebwo5cn	420008	นาย สุชาติ วันจันทร์	PDT4	JP	Staff	19		2025-11-04 14:41:39.969	2025-11-04 14:41:39.969	\N	\N	\N	\N	Production	\N
108	p0iqql6yx2zz8n735ebwo5cn	420008	นาย สุชาติ วันจันทร์	PDT4	JP	Staff	19		2025-11-04 14:41:39.969	2025-11-04 14:41:39.969	2025-11-04 14:41:39.976	\N	\N	\N	Production	\N
111	gzj9fsbqxnswfueqg4n1enwl	420011	นาย รัชชานนท์ พิกุลขาว	PDT4	JP	Staff	19		2025-11-04 14:41:40.068	2025-11-04 14:41:40.068	\N	\N	\N	\N	Production	\N
112	gzj9fsbqxnswfueqg4n1enwl	420011	นาย รัชชานนท์ พิกุลขาว	PDT4	JP	Staff	19		2025-11-04 14:41:40.068	2025-11-04 14:41:40.068	2025-11-04 14:41:40.076	\N	\N	\N	Production	\N
119	r8u77m6jfnjf1vi7oiheu3nw	430004	นาย นุสนธ์ ชลมูณี	PDT3	TM	Assistant Department Manager	19		2025-11-04 14:41:40.273	2025-11-20 14:27:26.085	\N	\N	1	\N	Production	nuson@aoyama.co.th
121	n4p3jscf28uoz3nkrmyxju47	430006	นาย บุญยืน นนท์ตา	PDT4	JA	Leader	19	เข้าอบรม	2025-11-04 14:41:40.325	2025-11-04 14:41:40.325	\N	\N	\N	\N	Production	\N
122	n4p3jscf28uoz3nkrmyxju47	430006	นาย บุญยืน นนท์ตา	PDT4	JA	Leader	19	เข้าอบรม	2025-11-04 14:41:40.325	2025-11-04 14:41:40.325	2025-11-04 14:41:40.332	\N	\N	\N	Production	\N
125	o02sexkfkb9x33eeo02cadsb	430009	นาย โกญจนาจ โพธิ์ศรี	PCM	CB	Staff	19		2025-11-04 14:41:40.423	2025-11-04 14:41:40.423	\N	\N	\N	\N	Support	\N
126	o02sexkfkb9x33eeo02cadsb	430009	นาย โกญจนาจ โพธิ์ศรี	PCM	CB	Staff	19		2025-11-04 14:41:40.423	2025-11-04 14:41:40.423	2025-11-04 14:41:40.43	\N	\N	\N	Support	\N
129	hvn5is0pawnqfyg29lgrm8kv	430016	นาย สมศักดิ์ โนนทราย	PDT4	JA	Staff	19		2025-11-04 14:41:40.529	2025-11-04 14:41:40.529	\N	\N	\N	\N	Production	\N
130	hvn5is0pawnqfyg29lgrm8kv	430016	นาย สมศักดิ์ โนนทราย	PDT4	JA	Staff	19		2025-11-04 14:41:40.529	2025-11-04 14:41:40.529	2025-11-04 14:41:40.537	\N	\N	\N	Production	\N
133	my663cybm27p6kfisshv017s	430019	นาย จตุพล มีจิตอันสง่า	PDM	PC	Junior	19		2025-11-04 14:41:40.626	2025-11-04 14:41:40.626	\N	\N	\N	\N	Support	\N
134	my663cybm27p6kfisshv017s	430019	นาย จตุพล มีจิตอันสง่า	PDM	PC	Junior	19		2025-11-04 14:41:40.626	2025-11-04 14:41:40.626	2025-11-04 14:41:40.648	\N	\N	\N	Support	\N
137	gjedmk69p7xi9nk08qo6q8h5	430026	นาย นัฐกิจ วิเศษหมื่น	HRD	GA	Staff	19		2025-11-04 14:41:40.726	2025-11-04 14:41:40.726	\N	\N	\N	\N	Non Production	\N
138	gjedmk69p7xi9nk08qo6q8h5	430026	นาย นัฐกิจ วิเศษหมื่น	HRD	GA	Staff	19		2025-11-04 14:41:40.726	2025-11-04 14:41:40.726	2025-11-04 14:41:40.734	\N	\N	\N	Non Production	\N
141	cdo76dyxd3v8fx1lvdutj39b	440002	น.ส. ฐิติมา สุวรรณภูมิ	ENI	EN	Expert	19	เข้าอบรม	2025-11-04 14:41:40.827	2025-11-04 14:41:40.827	\N	\N	\N	\N	Support	\N
142	cdo76dyxd3v8fx1lvdutj39b	440002	น.ส. ฐิติมา สุวรรณภูมิ	ENI	EN	Expert	19	เข้าอบรม	2025-11-04 14:41:40.827	2025-11-04 14:41:40.827	2025-11-04 14:41:40.833	\N	\N	\N	Support	\N
145	uhq3tb8d1crtehfsfkx84dt2	450002	น.ส. นิตยา ธิภาศรี	PCM	OR	Junior	19		2025-11-04 14:41:40.929	2025-11-04 14:41:40.929	\N	\N	\N	\N	Support	\N
146	uhq3tb8d1crtehfsfkx84dt2	450002	น.ส. นิตยา ธิภาศรี	PCM	OR	Junior	19		2025-11-04 14:41:40.929	2025-11-04 14:41:40.929	2025-11-04 14:41:40.937	\N	\N	\N	Support	\N
157	itd7rqts07zaju2kkwpor0fq	450039	น.ส. ลักณ์ เวฬุวนารักษ์	QAD	QC2	Staff	19		2025-11-04 14:41:41.235	2025-11-04 14:41:41.235	\N	\N	\N	\N	Support	\N
158	itd7rqts07zaju2kkwpor0fq	450039	น.ส. ลักณ์ เวฬุวนารักษ์	QAD	QC2	Staff	19		2025-11-04 14:41:41.235	2025-11-04 14:41:41.235	2025-11-04 14:41:41.256	\N	\N	\N	Support	\N
161	la7ycvi3yjmdradupn4gq71n	450050	นาย วิชัย ธนโสม	PCM	Q-GATE	Foreman	19	เข้าอบรม	2025-11-04 14:41:41.335	2025-11-04 14:41:41.335	\N	\N	\N	\N	Support	\N
162	la7ycvi3yjmdradupn4gq71n	450050	นาย วิชัย ธนโสม	PCM	Q-GATE	Foreman	19	เข้าอบรม	2025-11-04 14:41:41.335	2025-11-04 14:41:41.335	2025-11-04 14:41:41.344	\N	\N	\N	Support	\N
165	zhixkmtr22oyitxo4m0nxmro	450053	น.ส. สุดใจ พลายละหาร	PCM	ST	Foreman	19		2025-11-04 14:41:41.437	2025-11-04 14:41:41.437	\N	\N	\N	\N	Support	\N
166	zhixkmtr22oyitxo4m0nxmro	450053	น.ส. สุดใจ พลายละหาร	PCM	ST	Foreman	19		2025-11-04 14:41:41.437	2025-11-04 14:41:41.437	2025-11-04 14:41:41.444	\N	\N	\N	Support	\N
169	t8vcpy5llqziljcxi6estzdu	450057	นาง ปาริชาติ เถาโต	QAD	QC2	Staff	19		2025-11-04 14:41:41.538	2025-11-04 14:41:41.538	\N	\N	\N	\N	Support	\N
170	t8vcpy5llqziljcxi6estzdu	450057	นาง ปาริชาติ เถาโต	QAD	QC2	Staff	19		2025-11-04 14:41:41.538	2025-11-04 14:41:41.538	2025-11-04 14:41:41.548	\N	\N	\N	Support	\N
173	mqgwjimkf6mod44mcp1q9img	450059	นาง ไพรวัลย์ ยาเคน	PUD	PU1	Staff	19		2025-11-04 14:41:41.642	2025-11-04 14:41:41.642	\N	\N	\N	\N	Non Production	\N
174	mqgwjimkf6mod44mcp1q9img	450059	นาง ไพรวัลย์ ยาเคน	PUD	PU1	Staff	19		2025-11-04 14:41:41.642	2025-11-04 14:41:41.642	2025-11-04 14:41:41.649	\N	\N	\N	Non Production	\N
177	dxzu5duho70mdufy53bva7nn	450061	นาง อัมพวัลย์ สร้อยนาค	PDT4	UB	Staff	19		2025-11-04 14:41:41.745	2025-11-04 14:41:41.745	\N	\N	\N	\N	Production	\N
178	dxzu5duho70mdufy53bva7nn	450061	นาง อัมพวัลย์ สร้อยนาค	PDT4	UB	Staff	19		2025-11-04 14:41:41.745	2025-11-04 14:41:41.745	2025-11-04 14:41:41.766	\N	\N	\N	Production	\N
181	g5hrwhd2rrln6ud6z6dasi44	460013	นาย ประสิทธิ์ ป้องกัน	QAD	QC2	Staff	19		2025-11-04 14:41:41.843	2025-11-04 14:41:41.843	\N	\N	\N	\N	Support	\N
182	g5hrwhd2rrln6ud6z6dasi44	460013	นาย ประสิทธิ์ ป้องกัน	QAD	QC2	Staff	19		2025-11-04 14:41:41.843	2025-11-04 14:41:41.843	2025-11-04 14:41:41.85	\N	\N	\N	Support	\N
185	lkztr9lknua13xq0ubd9xert	460019	น.ส. ธัณย์สิตา พงษ์ภักดิ์บุญ	PDM	PC	Foreman	19	เข้าอบรม	2025-11-04 14:41:41.943	2025-11-04 14:41:41.943	\N	\N	\N	\N	Support	\N
186	lkztr9lknua13xq0ubd9xert	460019	น.ส. ธัณย์สิตา พงษ์ภักดิ์บุญ	PDM	PC	Foreman	19	เข้าอบรม	2025-11-04 14:41:41.943	2025-11-04 14:41:41.943	2025-11-04 14:41:41.951	\N	\N	\N	Support	\N
189	k03fcy6efprxudvxmlb8cpmi	460023	นาง เพ็ญนภา รัตนศรี	PDT3	WB	Staff	19		2025-11-04 14:41:42.044	2025-11-04 14:41:42.044	\N	\N	\N	\N	Production	\N
190	k03fcy6efprxudvxmlb8cpmi	460023	นาง เพ็ญนภา รัตนศรี	PDT3	WB	Staff	19		2025-11-04 14:41:42.044	2025-11-04 14:41:42.044	2025-11-04 14:41:42.051	\N	\N	\N	Production	\N
153	kruwr2de88rgp0ddhpjdtz0m	450020	น.ส. อรุณ อินหุ่น	SAM	TM	Assistant Department Manager	19		2025-11-04 14:41:41.131	2025-11-20 14:27:38.438	\N	\N	1	\N	Support	aroon@aoyama.co.th
193	dgorh1q31ofp5jzylk8mcl6f	470007	นาย สุพจน์ สมนาศรี	PDT4	EL	Supervisor	19		2025-11-04 14:41:42.144	2025-11-20 14:28:00.737	\N	\N	1	\N	Production	supoj_s@aoyama.co.th
123	rebpxw9ucw96210cwst7354t	430007	นาง วรารัตน์ ตันชูสีหรักษ์	ENI	MI	Staff	19		2025-11-04 14:41:40.373	2025-11-04 14:41:40.373	\N	\N	\N	\N	Support	\N
124	rebpxw9ucw96210cwst7354t	430007	นาง วรารัตน์ ตันชูสีหรักษ์	ENI	MI	Staff	19		2025-11-04 14:41:40.373	2025-11-04 14:41:40.373	2025-11-04 14:41:40.382	\N	\N	\N	Support	\N
127	jb6pjjsen8m3gqfhrnee89oz	430015	น.ส. สุกัญญา สุขบำรุง	PDM	PC	Foreman	19	เข้าอบรม	2025-11-04 14:41:40.479	2025-11-04 14:41:40.479	\N	\N	\N	\N	Support	\N
128	jb6pjjsen8m3gqfhrnee89oz	430015	น.ส. สุกัญญา สุขบำรุง	PDM	PC	Foreman	19	เข้าอบรม	2025-11-04 14:41:40.479	2025-11-04 14:41:40.479	2025-11-04 14:41:40.501	\N	\N	\N	Support	\N
135	ur4qohhrk90umiwzvlnpcbg4	430025	นาย รัศมี ยาเคน	PCM	PK	Staff	19		2025-11-04 14:41:40.675	2025-11-04 14:41:40.675	\N	\N	\N	\N	Support	\N
136	ur4qohhrk90umiwzvlnpcbg4	430025	นาย รัศมี ยาเคน	PCM	PK	Staff	19		2025-11-04 14:41:40.675	2025-11-04 14:41:40.675	2025-11-04 14:41:40.683	\N	\N	\N	Support	\N
139	qxu0x0gzpbyzddgme2sln17o	440001	น.ส. สมจิตร ชาติงาม	QAD	QA	Leader	19		2025-11-04 14:41:40.778	2025-11-04 14:41:40.778	\N	\N	\N	\N	Support	\N
140	qxu0x0gzpbyzddgme2sln17o	440001	น.ส. สมจิตร ชาติงาม	QAD	QA	Leader	19		2025-11-04 14:41:40.778	2025-11-04 14:41:40.778	2025-11-04 14:41:40.785	\N	\N	\N	Support	\N
143	o1806zc25hj5ndab8veoqolm	440009	นาย รุ่งอรุณ มีจิตอันสง่า	PDM	FC	Foreman	19	เข้าอบรม	2025-11-04 14:41:40.878	2025-11-04 14:41:40.878	\N	\N	\N	\N	Support	\N
144	o1806zc25hj5ndab8veoqolm	440009	นาย รุ่งอรุณ มีจิตอันสง่า	PDM	FC	Foreman	19	เข้าอบรม	2025-11-04 14:41:40.878	2025-11-04 14:41:40.878	2025-11-04 14:41:40.887	\N	\N	\N	Support	\N
147	bbjcizuyaazx7qq9hnoa0h3j	450005	นาย วังเดือน สกุนนา	PDT3	JC	Staff	19		2025-11-04 14:41:40.979	2025-11-04 14:41:40.979	\N	\N	\N	\N	Production	\N
148	bbjcizuyaazx7qq9hnoa0h3j	450005	นาย วังเดือน สกุนนา	PDT3	JC	Staff	19		2025-11-04 14:41:40.979	2025-11-04 14:41:40.979	2025-11-04 14:41:40.985	\N	\N	\N	Production	\N
155	ejtbx1omux2ogazpvdi5kqff	450031	นาง ศิริพร กระแสร์นาค	QAD	QC2	Staff	19		2025-11-04 14:41:41.184	2025-11-04 14:41:41.184	\N	\N	\N	\N	Support	\N
156	ejtbx1omux2ogazpvdi5kqff	450031	นาง ศิริพร กระแสร์นาค	QAD	QC2	Staff	19		2025-11-04 14:41:41.184	2025-11-04 14:41:41.184	2025-11-04 14:41:41.206	\N	\N	\N	Support	\N
159	ps2lj1fajsvielpv970kq3lr	450040	น.ส. กรรณิกา สายสมบูรณ์	PDT1	NT	Staff	19		2025-11-04 14:41:41.284	2025-11-04 14:41:41.284	\N	\N	\N	\N	Production	\N
160	ps2lj1fajsvielpv970kq3lr	450040	น.ส. กรรณิกา สายสมบูรณ์	PDT1	NT	Staff	19		2025-11-04 14:41:41.284	2025-11-04 14:41:41.284	2025-11-04 14:41:41.292	\N	\N	\N	Production	\N
163	r344f48pw8pejcpx6g43u296	450052	นาง ดลยา ธนโสม	PDM	PC	Staff	19		2025-11-04 14:41:41.388	2025-11-04 14:41:41.388	\N	\N	\N	\N	Support	\N
164	r344f48pw8pejcpx6g43u296	450052	นาง ดลยา ธนโสม	PDM	PC	Staff	19		2025-11-04 14:41:41.388	2025-11-04 14:41:41.388	2025-11-04 14:41:41.395	\N	\N	\N	Support	\N
167	i7zpp1e7kut6o8fhgqqhcpek	450056	น.ส. ยุพิน โสโสม	PCM	PK	Staff	19		2025-11-04 14:41:41.489	2025-11-04 14:41:41.489	\N	\N	\N	\N	Support	\N
168	i7zpp1e7kut6o8fhgqqhcpek	450056	น.ส. ยุพิน โสโสม	PCM	PK	Staff	19		2025-11-04 14:41:41.489	2025-11-04 14:41:41.489	2025-11-04 14:41:41.51	\N	\N	\N	Support	\N
171	y6q19cs5cejo9eoo6ivcz4wd	450058	น.ส. อรุณรัตน์ อินทร์สงเคราะห์	PDM	PC	Staff	19		2025-11-04 14:41:41.59	2025-11-04 14:41:41.59	\N	\N	\N	\N	Support	\N
172	y6q19cs5cejo9eoo6ivcz4wd	450058	น.ส. อรุณรัตน์ อินทร์สงเคราะห์	PDM	PC	Staff	19		2025-11-04 14:41:41.59	2025-11-04 14:41:41.59	2025-11-04 14:41:41.598	\N	\N	\N	Support	\N
175	u63t6ybs9gn6fb7c0xjg304z	450060	น.ส. พัณณ์นิภา พีรวิชญ์วรภัค	PDM	FC	Staff	19		2025-11-04 14:41:41.695	2025-11-04 14:41:41.695	\N	\N	\N	\N	Support	\N
176	u63t6ybs9gn6fb7c0xjg304z	450060	น.ส. พัณณ์นิภา พีรวิชญ์วรภัค	PDM	FC	Staff	19		2025-11-04 14:41:41.695	2025-11-04 14:41:41.695	2025-11-04 14:41:41.701	\N	\N	\N	Support	\N
179	zhsjlwb6u5hij6ndkf3nmdgq	460011	นาย โอวาท จอมทอง	PDT2	OQ	Leader	19	เข้าอบรม	2025-11-04 14:41:41.796	2025-11-04 14:41:41.796	\N	\N	\N	\N	Production	\N
180	zhsjlwb6u5hij6ndkf3nmdgq	460011	นาย โอวาท จอมทอง	PDT2	OQ	Leader	19	เข้าอบรม	2025-11-04 14:41:41.796	2025-11-04 14:41:41.796	2025-11-04 14:41:41.817	\N	\N	\N	Production	\N
183	akwrkqo5sgjoveyhfwtfbh9h	460018	นาย สุทิน ตันเป็ง	PDT1	M6	Staff	19		2025-11-04 14:41:41.882	2025-11-04 14:41:41.882	\N	\N	\N	\N	Production	\N
184	akwrkqo5sgjoveyhfwtfbh9h	460018	นาย สุทิน ตันเป็ง	PDT1	M6	Staff	19		2025-11-04 14:41:41.882	2025-11-04 14:41:41.882	2025-11-04 14:41:41.901	\N	\N	\N	Production	\N
191	mha9o4k60tk3pfc8gp5e5brc	460025	น.ส. โสรส ชัยฤทธิ์	PCM	OR	Staff	19		2025-11-04 14:41:42.094	2025-11-04 14:41:42.094	\N	\N	\N	\N	Support	\N
192	mha9o4k60tk3pfc8gp5e5brc	460025	น.ส. โสรส ชัยฤทธิ์	PCM	OR	Staff	19		2025-11-04 14:41:42.094	2025-11-04 14:41:42.094	2025-11-04 14:41:42.101	\N	\N	\N	Support	\N
195	ywzg0kbxe7h4jzn4qxl9yea7	470014	นาย จตุพล บำรุงสิน	PDM	IT	Foreman	19		2025-11-04 14:41:42.194	2025-11-04 14:41:42.194	\N	\N	\N	\N	Support	\N
196	ywzg0kbxe7h4jzn4qxl9yea7	470014	นาย จตุพล บำรุงสิน	PDM	IT	Foreman	19		2025-11-04 14:41:42.194	2025-11-04 14:41:42.194	2025-11-04 14:41:42.215	\N	\N	\N	Support	\N
199	ya7vjjxzon2nurag3dxr0lqj	470016	น.ส. ศิวพร ผัดวงศ์	PDM	PC	Staff	19		2025-11-04 14:41:42.292	2025-11-04 14:41:42.292	\N	\N	\N	\N	Support	\N
200	ya7vjjxzon2nurag3dxr0lqj	470016	น.ส. ศิวพร ผัดวงศ์	PDM	PC	Staff	19		2025-11-04 14:41:42.292	2025-11-04 14:41:42.292	2025-11-04 14:41:42.3	\N	\N	\N	Support	\N
280	pt7kazjuw425ccohcnho8a6b	480092	นาย เสถียร ไชยบัว	PDT4	US	Leader	19		2025-11-04 14:41:44.275	2025-11-04 14:41:44.275	2025-11-04 14:41:44.283	\N	\N	\N	Production	\N
187	r3utxnjlqr8hgtwzkfaxiv28	460020	นาย รชต จันทะแก้ว	PCM	TM	Assistant Department Manager	19		2025-11-04 14:41:41.995	2025-11-20 14:28:03.979	\N	\N	1	\N	Support	rachata@aoyama.co.th
201	nmg87p40h2o7yumnw4k3r4vq	470019	น.ส. นันทนา วงษาพันธ์	FNC	AC	Staff	19		2025-11-04 14:41:42.339	2025-11-04 14:41:42.339	\N	\N	\N	\N	Non Production	\N
202	nmg87p40h2o7yumnw4k3r4vq	470019	น.ส. นันทนา วงษาพันธ์	FNC	AC	Staff	19		2025-11-04 14:41:42.339	2025-11-04 14:41:42.339	2025-11-04 14:41:42.346	\N	\N	\N	Non Production	\N
205	tkxk07jjuwy53a8u622ixkid	470024	นาย สมคิด สมสะอาด	PDT4	MC	Staff	19		2025-11-04 14:41:42.421	2025-11-04 14:41:42.421	\N	\N	\N	\N	Production	\N
206	tkxk07jjuwy53a8u622ixkid	470024	นาย สมคิด สมสะอาด	PDT4	MC	Staff	19		2025-11-04 14:41:42.421	2025-11-04 14:41:42.421	2025-11-04 14:41:42.444	\N	\N	\N	Production	\N
209	ep09axhguuj8dyzecz2cd9rq	470039	นาย ไชยา ศรียอด	PCM	ST	Leader	19	เข้าอบรม	2025-11-04 14:41:42.537	2025-11-04 14:41:42.537	\N	\N	\N	\N	Support	\N
210	ep09axhguuj8dyzecz2cd9rq	470039	นาย ไชยา ศรียอด	PCM	ST	Leader	19	เข้าอบรม	2025-11-04 14:41:42.537	2025-11-04 14:41:42.537	2025-11-04 14:41:42.544	\N	\N	\N	Support	\N
213	v4ymi7x2457p99p1u6lp0dp9	470047	นาย สมพัตสร เสนา	PDT4	MC	Staff	19		2025-11-04 14:41:42.637	2025-11-04 14:41:42.637	\N	\N	\N	\N	Production	\N
214	v4ymi7x2457p99p1u6lp0dp9	470047	นาย สมพัตสร เสนา	PDT4	MC	Staff	19		2025-11-04 14:41:42.637	2025-11-04 14:41:42.637	2025-11-04 14:41:42.643	\N	\N	\N	Production	\N
221	hpcmf2ej1ohbd3yks272fckp	470059	น.ส. สังวาลย์ โคตรปะโค	QAD	QC1	Junior	19		2025-11-04 14:41:42.834	2025-11-04 14:41:42.834	\N	\N	\N	\N	Support	\N
222	hpcmf2ej1ohbd3yks272fckp	470059	น.ส. สังวาลย์ โคตรปะโค	QAD	QC1	Junior	19		2025-11-04 14:41:42.834	2025-11-04 14:41:42.834	2025-11-04 14:41:42.841	\N	\N	\N	Support	\N
237	sgzdmmx5a2gdx1drbb7q1vod	480031	น.ส. เรณู เนตรลัย	PDT1	EG	Staff	19		2025-11-04 14:41:43.235	2025-11-04 14:41:43.235	\N	\N	\N	\N	Production	\N
238	sgzdmmx5a2gdx1drbb7q1vod	480031	น.ส. เรณู เนตรลัย	PDT1	EG	Staff	19		2025-11-04 14:41:43.235	2025-11-04 14:41:43.235	2025-11-04 14:41:43.242	\N	\N	\N	Production	\N
241	am97k6geoo7rprnocmltrgc6	480033	นาย สุพจน์ ใจฮวบ	PDT1	EG	Junior	19		2025-11-04 14:41:43.332	2025-11-04 14:41:43.332	\N	\N	\N	\N	Production	\N
242	am97k6geoo7rprnocmltrgc6	480033	นาย สุพจน์ ใจฮวบ	PDT1	EG	Junior	19		2025-11-04 14:41:43.332	2025-11-04 14:41:43.332	2025-11-04 14:41:43.353	\N	\N	\N	Production	\N
245	kopqxavy3c2jjgw1ab8d5jjh	480042	น.ส. ชลันฎา ศรีไตรรัตน์	PUD	PU1	Junior	19		2025-11-04 14:41:43.431	2025-11-04 14:41:43.431	\N	\N	\N	\N	Non Production	\N
246	kopqxavy3c2jjgw1ab8d5jjh	480042	น.ส. ชลันฎา ศรีไตรรัตน์	PUD	PU1	Junior	19		2025-11-04 14:41:43.431	2025-11-04 14:41:43.431	2025-11-04 14:41:43.439	\N	\N	\N	Non Production	\N
249	hsbsectijm4z7h3sqfu6yuni	480046	นาย ปรินญา สุวรรณศรี	HRD	GA	Foreman	19		2025-11-04 14:41:43.529	2025-11-04 14:41:43.529	\N	\N	\N	\N	Non Production	\N
250	hsbsectijm4z7h3sqfu6yuni	480046	นาย ปรินญา สุวรรณศรี	HRD	GA	Foreman	19		2025-11-04 14:41:43.529	2025-11-04 14:41:43.529	2025-11-04 14:41:43.536	\N	\N	\N	Non Production	\N
253	tfszgaho4u30seq2dr85ucaj	480052	นาย พินิจ ฦาชา	PDT4	MC	Staff	19		2025-11-04 14:41:43.631	2025-11-04 14:41:43.631	\N	\N	\N	\N	Production	\N
254	tfszgaho4u30seq2dr85ucaj	480052	นาย พินิจ ฦาชา	PDT4	MC	Staff	19		2025-11-04 14:41:43.631	2025-11-04 14:41:43.631	2025-11-04 14:41:43.637	\N	\N	\N	Production	\N
257	frb1fdurgy8pbifcmm98fbvo	480056	นาย สมบัติ แพงไธสง	PDT4	JA	Staff	19		2025-11-04 14:41:43.728	2025-11-04 14:41:43.728	\N	\N	\N	\N	Production	\N
258	frb1fdurgy8pbifcmm98fbvo	480056	นาย สมบัติ แพงไธสง	PDT4	JA	Staff	19		2025-11-04 14:41:43.728	2025-11-04 14:41:43.728	2025-11-04 14:41:43.734	\N	\N	\N	Production	\N
261	u98eljegnff0e7b3qnkqt9us	480065	นาย ฉัชวาล เป้าไธสง	PDT2	OQ	Junior	19		2025-11-04 14:41:43.827	2025-11-04 14:41:43.827	\N	\N	\N	\N	Production	\N
262	u98eljegnff0e7b3qnkqt9us	480065	นาย ฉัชวาล เป้าไธสง	PDT2	OQ	Junior	19		2025-11-04 14:41:43.827	2025-11-04 14:41:43.827	2025-11-04 14:41:43.848	\N	\N	\N	Production	\N
265	l30nl0z9b9nb0ciqcu1sfcf6	480072	นาย อมร ภูมิจีน	PDT3	GM	Leader	19	เข้าอบรม	2025-11-04 14:41:43.923	2025-11-04 14:41:43.923	\N	\N	\N	\N	Production	\N
266	l30nl0z9b9nb0ciqcu1sfcf6	480072	นาย อมร ภูมิจีน	PDT3	GM	Leader	19	เข้าอบรม	2025-11-04 14:41:43.923	2025-11-04 14:41:43.923	2025-11-04 14:41:43.944	\N	\N	\N	Production	\N
269	mp6qg8nmfutvske6b1zbv2lf	480078	น.ส. ศิดาพรรณ เกลียวกัน	PDM	PC	Foreman	19		2025-11-04 14:41:44.022	2025-11-04 14:41:44.022	\N	\N	\N	\N	Support	\N
270	mp6qg8nmfutvske6b1zbv2lf	480078	น.ส. ศิดาพรรณ เกลียวกัน	PDM	PC	Foreman	19		2025-11-04 14:41:44.022	2025-11-04 14:41:44.022	2025-11-04 14:41:44.028	\N	\N	\N	Support	\N
273	g1fo2boeb7pao6txoyoxvfdb	480088	นาย สมชาย เพ็งแจ่ม	PDT4	EL	Foreman	19		2025-11-04 14:41:44.116	2025-11-04 14:41:44.116	\N	\N	\N	\N	Production	\N
274	g1fo2boeb7pao6txoyoxvfdb	480088	นาย สมชาย เพ็งแจ่ม	PDT4	EL	Foreman	19		2025-11-04 14:41:44.116	2025-11-04 14:41:44.116	2025-11-04 14:41:44.124	\N	\N	\N	Production	\N
277	t9j2p8fm85bm3p2dqgdpg5a1	480091	นาย วัลลพ คนที	QAD	IP	Foreman	19	เข้าอบรม	2025-11-04 14:41:44.227	2025-11-04 14:41:44.227	\N	\N	\N	\N	Support	\N
233	sibs375nj79qkutay3bk3xyq	480025	นาง กนกกาญจน์ พลูวรรณ์	HRD	TM	Assistant Department Manager	19		2025-11-04 14:41:43.136	2025-11-20 14:28:27.876	\N	\N	1	\N	Non Production	kanokkarn@aoyama.co.th
229	g1d7wfjb8i1lf6eom17g8z6x	480018	นาย พิชัย เกียรติทัศน์	PDT4	TM	Team Manager	19		2025-11-04 14:41:43.035	2025-11-20 14:28:31.296	\N	\N	1	\N	Production	pichai@aoyama.co.th
203	z5o5g4crknv7nzy8ibu3jdqz	470022	นาย ปิยะ โทบุดดี	PDT4	JA	Foreman	19	เข้าอบรม	2025-11-04 14:41:42.387	2025-11-04 14:41:42.387	\N	\N	\N	\N	Production	\N
204	z5o5g4crknv7nzy8ibu3jdqz	470022	นาย ปิยะ โทบุดดี	PDT4	JA	Foreman	19	เข้าอบรม	2025-11-04 14:41:42.387	2025-11-04 14:41:42.387	2025-11-04 14:41:42.394	\N	\N	\N	Production	\N
219	yyojrmgkcuzifwab5dryo6vd	470054	นาย นนทยา อุทัยเรือง	PDT4	JA	Staff	19		2025-11-04 14:41:42.786	2025-11-04 14:41:42.786	\N	\N	\N	\N	Production	\N
220	yyojrmgkcuzifwab5dryo6vd	470054	นาย นนทยา อุทัยเรือง	PDT4	JA	Staff	19		2025-11-04 14:41:42.786	2025-11-04 14:41:42.786	2025-11-04 14:41:42.807	\N	\N	\N	Production	\N
231	g1q7px489d7q7qnvd5aozuip	480020	นาย เรืองเนตร สมานเขตกิจ	PDT4	MC	Staff	19		2025-11-04 14:41:43.083	2025-11-04 14:41:43.083	\N	\N	\N	\N	Production	\N
232	g1q7px489d7q7qnvd5aozuip	480020	นาย เรืองเนตร สมานเขตกิจ	PDT4	MC	Staff	19		2025-11-04 14:41:43.083	2025-11-04 14:41:43.083	2025-11-04 14:41:43.09	\N	\N	\N	Production	\N
235	wymovab14gq9emtrg6y179iu	480030	น.ส. หนึ่งธิดา กล้าหาญ	PCM	ST	Staff	19		2025-11-04 14:41:43.187	2025-11-04 14:41:43.187	\N	\N	\N	\N	Support	\N
236	wymovab14gq9emtrg6y179iu	480030	น.ส. หนึ่งธิดา กล้าหาญ	PCM	ST	Staff	19		2025-11-04 14:41:43.187	2025-11-04 14:41:43.187	2025-11-04 14:41:43.195	\N	\N	\N	Support	\N
239	omk9qyi59b6drjyup8f0g44i	480032	นาย สิทธินันท์ โคตรคำ	PDT1	EG	Foreman	19	เข้าอบรม	2025-11-04 14:41:43.283	2025-11-04 14:41:43.283	\N	\N	\N	\N	Production	\N
240	omk9qyi59b6drjyup8f0g44i	480032	นาย สิทธินันท์ โคตรคำ	PDT1	EG	Foreman	19	เข้าอบรม	2025-11-04 14:41:43.283	2025-11-04 14:41:43.283	2025-11-04 14:41:43.291	\N	\N	\N	Production	\N
243	lby5h9h3xob6zulp8a9ncmd2	480040	นาง วิรินทร์ญา วัตธนเธียรสิน	PDM	PC	Leader	19		2025-11-04 14:41:43.381	2025-11-04 14:41:43.381	\N	\N	\N	\N	Support	\N
244	lby5h9h3xob6zulp8a9ncmd2	480040	นาง วิรินทร์ญา วัตธนเธียรสิน	PDM	PC	Leader	19		2025-11-04 14:41:43.381	2025-11-04 14:41:43.381	2025-11-04 14:41:43.404	\N	\N	\N	Support	\N
247	v04e0a6bbq74tyqyz1agak8i	480045	นาย วิเนตร สุราม	PDT2	OQ	Leader	19		2025-11-04 14:41:43.48	2025-11-04 14:41:43.48	\N	\N	\N	\N	Production	\N
248	v04e0a6bbq74tyqyz1agak8i	480045	นาย วิเนตร สุราม	PDT2	OQ	Leader	19		2025-11-04 14:41:43.48	2025-11-04 14:41:43.48	2025-11-04 14:41:43.488	\N	\N	\N	Production	\N
251	u79fcwthd0h5cwi0gf4xt86p	480049	นาย ต่อศักดิ์ เขียวทอง	PCM	PK	Staff	19		2025-11-04 14:41:43.58	2025-11-04 14:41:43.58	\N	\N	\N	\N	Support	\N
252	u79fcwthd0h5cwi0gf4xt86p	480049	นาย ต่อศักดิ์ เขียวทอง	PCM	PK	Staff	19		2025-11-04 14:41:43.58	2025-11-04 14:41:43.58	2025-11-04 14:41:43.589	\N	\N	\N	Support	\N
255	uenc2gp5hz6pdq41gi1wnvlx	480054	นาย สุรเชษฐ์ บัวผัน	PDT4	UB	Staff	19		2025-11-04 14:41:43.677	2025-11-04 14:41:43.677	\N	\N	\N	\N	Production	\N
256	uenc2gp5hz6pdq41gi1wnvlx	480054	นาย สุรเชษฐ์ บัวผัน	PDT4	UB	Staff	19		2025-11-04 14:41:43.677	2025-11-04 14:41:43.677	2025-11-04 14:41:43.683	\N	\N	\N	Production	\N
259	kje43ovswo5cbjxvli003d6n	480061	นาย ปรีชา ป้องทัพไทย	PCM	TP	Staff	19		2025-11-04 14:41:43.775	2025-11-04 14:41:43.775	\N	\N	\N	\N	Support	\N
260	kje43ovswo5cbjxvli003d6n	480061	นาย ปรีชา ป้องทัพไทย	PCM	TP	Staff	19		2025-11-04 14:41:43.775	2025-11-04 14:41:43.775	2025-11-04 14:41:43.783	\N	\N	\N	Support	\N
263	u839l65xd2akwn1sry67ghx6	480068	นาย วิชณุกรณ์ ธรรมบุตร	PDT2	OQ	Staff	19		2025-11-04 14:41:43.875	2025-11-04 14:41:43.875	\N	\N	\N	\N	Production	\N
264	u839l65xd2akwn1sry67ghx6	480068	นาย วิชณุกรณ์ ธรรมบุตร	PDT2	OQ	Staff	19		2025-11-04 14:41:43.875	2025-11-04 14:41:43.875	2025-11-04 14:41:43.882	\N	\N	\N	Production	\N
267	vx8ob7e2dtvm6b3etqjau4zk	480073	นาย สุพิน พรรณ์ทอง	PDT3	GM	Leader	19	เข้าอบรม	2025-11-04 14:41:43.972	2025-11-04 14:41:43.972	\N	\N	\N	\N	Production	\N
268	vx8ob7e2dtvm6b3etqjau4zk	480073	นาย สุพิน พรรณ์ทอง	PDT3	GM	Leader	19	เข้าอบรม	2025-11-04 14:41:43.972	2025-11-04 14:41:43.972	2025-11-04 14:41:43.982	\N	\N	\N	Production	\N
271	x0aamn0wnqzuzblk84b5bnj5	480082	นาย สามารถ วิบูลย์กูล	PCM	CB	Staff	19		2025-11-04 14:41:44.055	2025-11-04 14:41:44.055	\N	\N	\N	\N	Support	\N
272	x0aamn0wnqzuzblk84b5bnj5	480082	นาย สามารถ วิบูลย์กูล	PCM	CB	Staff	19		2025-11-04 14:41:44.055	2025-11-04 14:41:44.055	2025-11-04 14:41:44.077	\N	\N	\N	Support	\N
275	s688mjfigu7foglbexn7uqxd	480089	นาย สว่าง สมรักษ์	PDT1	EG	Leader	19	เข้าอบรม	2025-11-04 14:41:44.175	2025-11-04 14:41:44.175	\N	\N	\N	\N	Production	\N
276	s688mjfigu7foglbexn7uqxd	480089	นาย สว่าง สมรักษ์	PDT1	EG	Leader	19	เข้าอบรม	2025-11-04 14:41:44.175	2025-11-04 14:41:44.175	2025-11-04 14:41:44.181	\N	\N	\N	Production	\N
279	pt7kazjuw425ccohcnho8a6b	480092	นาย เสถียร ไชยบัว	PDT4	US	Leader	19		2025-11-04 14:41:44.275	2025-11-04 14:41:44.275	\N	\N	\N	\N	Production	\N
215	ngs9hc3m283lfdz3w1nri4bd	470048	นาย สมัย ภูสมพงษ์	PDT1	TM	Team Manager	19		2025-11-04 14:41:42.686	2025-11-20 14:28:15.207	\N	\N	1	\N	Production	samai@aoyama.co.th
211	xezlwzbqv73f4bpcpcod6ka3	470043	น.ส. ศิริญา บรรเทิงจิตร	PDM	TM	Team Manager	19		2025-11-04 14:41:42.587	2025-11-20 14:28:19.106	\N	\N	1	\N	Support	siriya@aoyama.co.th
227	nf1svh4y45it9y378juv19zp	480006	นาย สันติ เหลืองอ่อน	PDT4	TM	Team Manager	19		2025-11-04 14:41:42.983	2025-11-20 14:28:34.109	\N	\N	1	\N	Production	santi@aoyama.co.th
223	hy8qi9pm4ah7ejq52issce2u	480003	นาย ธเนตร ตันนารักษ์	ENI	TM	Team Manager	19		2025-11-04 14:41:42.883	2025-11-20 14:28:40.026	\N	\N	1	\N	Support	thanate@aoyama.co.th
278	t9j2p8fm85bm3p2dqgdpg5a1	480091	นาย วัลลพ คนที	QAD	IP	Foreman	19	เข้าอบรม	2025-11-04 14:41:44.227	2025-11-04 14:41:44.227	2025-11-04 14:41:44.248	\N	\N	\N	Support	\N
281	n9qjlwt9kijbyc89isspi5i8	480095	นาย เทพพิทักษ์ พงค์ไพบูลย์	QAD	IP	Leader	19		2025-11-04 14:41:44.324	2025-11-04 14:41:44.324	\N	\N	\N	\N	Support	\N
282	n9qjlwt9kijbyc89isspi5i8	480095	นาย เทพพิทักษ์ พงค์ไพบูลย์	QAD	IP	Leader	19		2025-11-04 14:41:44.324	2025-11-04 14:41:44.324	2025-11-04 14:41:44.346	\N	\N	\N	Support	\N
285	qrs8gip2h48up7oiw4smsf76	480098	นาย ภิญญู อาสนาทิพย์	PDM	FC	Staff	19		2025-11-04 14:41:44.428	2025-11-04 14:41:44.428	\N	\N	\N	\N	Support	\N
286	qrs8gip2h48up7oiw4smsf76	480098	นาย ภิญญู อาสนาทิพย์	PDM	FC	Staff	19		2025-11-04 14:41:44.428	2025-11-04 14:41:44.428	2025-11-04 14:41:44.434	\N	\N	\N	Support	\N
289	iuy5j8l40ii95tufsahl4s5x	480108	นาย ฉลองชัย ดีใจ	PDT3	BZ	Staff	19		2025-11-04 14:41:44.524	2025-11-04 14:41:44.524	\N	\N	\N	\N	Production	\N
290	iuy5j8l40ii95tufsahl4s5x	480108	นาย ฉลองชัย ดีใจ	PDT3	BZ	Staff	19		2025-11-04 14:41:44.524	2025-11-04 14:41:44.524	2025-11-04 14:41:44.531	\N	\N	\N	Production	\N
293	a8zuz5sqdwv4se4ieq1kw8qm	480114	น.ส. ปัญจนนท์ ประโยครัมย์	PDM	PC	Junior	19		2025-11-04 14:41:44.625	2025-11-04 14:41:44.625	\N	\N	\N	\N	Support	\N
294	a8zuz5sqdwv4se4ieq1kw8qm	480114	น.ส. ปัญจนนท์ ประโยครัมย์	PDM	PC	Junior	19		2025-11-04 14:41:44.625	2025-11-04 14:41:44.625	2025-11-04 14:41:44.644	\N	\N	\N	Support	\N
297	s10hju0kqj93jvu2ymeff5sf	480122	น.ส. สัญญา บุญประภา	PDT3	WB	Staff	19		2025-11-04 14:41:44.722	2025-11-04 14:41:44.722	\N	\N	\N	\N	Production	\N
298	s10hju0kqj93jvu2ymeff5sf	480122	น.ส. สัญญา บุญประภา	PDT3	WB	Staff	19		2025-11-04 14:41:44.722	2025-11-04 14:41:44.722	2025-11-04 14:41:44.729	\N	\N	\N	Production	\N
301	szajk5pcbbju056ygmgaea5v	480125	น.ส. อัญชลี บำรัมย์	QAD	IP	Staff	19		2025-11-04 14:41:44.822	2025-11-04 14:41:44.822	\N	\N	\N	\N	Support	\N
302	szajk5pcbbju056ygmgaea5v	480125	น.ส. อัญชลี บำรัมย์	QAD	IP	Staff	19		2025-11-04 14:41:44.822	2025-11-04 14:41:44.822	2025-11-04 14:41:44.829	\N	\N	\N	Support	\N
305	c39ke7imakwar05y36hmeo23	480132	นาย ทรงยศ ดารุนิกร	PDM	FC	Foreman	19	เข้าอบรม	2025-11-04 14:41:44.915	2025-11-04 14:41:44.915	\N	\N	\N	\N	Support	\N
306	c39ke7imakwar05y36hmeo23	480132	นาย ทรงยศ ดารุนิกร	PDM	FC	Foreman	19	เข้าอบรม	2025-11-04 14:41:44.915	2025-11-04 14:41:44.915	2025-11-04 14:41:44.923	\N	\N	\N	Support	\N
309	pcjtgs9x1d6flg24bredcmje	480141	นาย ปพนทัศน์ วีราพัชร์โภคิน	HRD	GA	Staff	19		2025-11-04 14:41:45.013	2025-11-04 14:41:45.013	\N	\N	\N	\N	Non Production	\N
310	pcjtgs9x1d6flg24bredcmje	480141	นาย ปพนทัศน์ วีราพัชร์โภคิน	HRD	GA	Staff	19		2025-11-04 14:41:45.013	2025-11-04 14:41:45.013	2025-11-04 14:41:45.022	\N	\N	\N	Non Production	\N
313	nfh20kygqplpy7wv0fp6xh6s	480148	นาย สุอัน กงเพ็ชร	PDM	FC	Staff	19		2025-11-04 14:41:45.109	2025-11-04 14:41:45.109	\N	\N	\N	\N	Support	\N
314	nfh20kygqplpy7wv0fp6xh6s	480148	นาย สุอัน กงเพ็ชร	PDM	FC	Staff	19		2025-11-04 14:41:45.109	2025-11-04 14:41:45.109	2025-11-04 14:41:45.131	\N	\N	\N	Support	\N
317	a6mg1iex0og9ulkt7ail8b8a	480153	นาย นิรุตติ์ ชอบใหญ่	PDT1	M8	Foreman	19	เข้าอบรม	2025-11-04 14:41:45.208	2025-11-04 14:41:45.208	\N	\N	\N	\N	Production	\N
318	a6mg1iex0og9ulkt7ail8b8a	480153	นาย นิรุตติ์ ชอบใหญ่	PDT1	M8	Foreman	19	เข้าอบรม	2025-11-04 14:41:45.208	2025-11-04 14:41:45.208	2025-11-04 14:41:45.231	\N	\N	\N	Production	\N
321	wguo8j89ia9iihzpgnbbxc7p	480156	นาย สมพงษ์ สุภาคม	PDT1	M8	Staff	19		2025-11-04 14:41:45.306	2025-11-04 14:41:45.306	\N	\N	\N	\N	Production	\N
322	wguo8j89ia9iihzpgnbbxc7p	480156	นาย สมพงษ์ สุภาคม	PDT1	M8	Staff	19		2025-11-04 14:41:45.306	2025-11-04 14:41:45.306	2025-11-04 14:41:45.313	\N	\N	\N	Production	\N
329	oflrthziku9vm2fb68j4kar5	480169	นาย สมาน ปิยวงค์	PCM	ST	Staff	19		2025-11-04 14:41:45.504	2025-11-04 14:41:45.504	\N	\N	\N	\N	Support	\N
330	oflrthziku9vm2fb68j4kar5	480169	นาย สมาน ปิยวงค์	PCM	ST	Staff	19		2025-11-04 14:41:45.504	2025-11-04 14:41:45.504	2025-11-04 14:41:45.511	\N	\N	\N	Support	\N
333	dfocqeyvzafglssiisb926n7	480175	น.ส. บุญชญา จิตรพล	ENI	MI	Staff	19		2025-11-04 14:41:45.602	2025-11-04 14:41:45.602	\N	\N	\N	\N	Support	\N
334	dfocqeyvzafglssiisb926n7	480175	น.ส. บุญชญา จิตรพล	ENI	MI	Staff	19		2025-11-04 14:41:45.602	2025-11-04 14:41:45.602	2025-11-04 14:41:45.609	\N	\N	\N	Support	\N
337	jwryhzj9hl24n3fy65l3ilfc	480185	นาย เอกสิทธิ์ เป็นเรียบร้อย	PCM	CB	Staff	19		2025-11-04 14:41:45.702	2025-11-04 14:41:45.702	\N	\N	\N	\N	Support	\N
338	jwryhzj9hl24n3fy65l3ilfc	480185	นาย เอกสิทธิ์ เป็นเรียบร้อย	PCM	CB	Staff	19		2025-11-04 14:41:45.702	2025-11-04 14:41:45.702	2025-11-04 14:41:45.709	\N	\N	\N	Support	\N
341	tvtoeuw2ec08svi1vm781lu1	480193	นาย เกรียงศักดิ์ สุขพ่วง	PCM	Q-GATE	Leader	19		2025-11-04 14:41:45.797	2025-11-04 14:41:45.797	\N	\N	\N	\N	Support	\N
342	tvtoeuw2ec08svi1vm781lu1	480193	นาย เกรียงศักดิ์ สุขพ่วง	PCM	Q-GATE	Leader	19		2025-11-04 14:41:45.797	2025-11-04 14:41:45.797	2025-11-04 14:41:45.818	\N	\N	\N	Support	\N
345	uvued18oy463wexre2ly8fey	480208	นาย นิวัฒน์ รัตนโชติ	PDM	FC	Staff	19		2025-11-04 14:41:45.896	2025-11-04 14:41:45.896	\N	\N	\N	\N	Support	\N
346	uvued18oy463wexre2ly8fey	480208	นาย นิวัฒน์ รัตนโชติ	PDM	FC	Staff	19		2025-11-04 14:41:45.896	2025-11-04 14:41:45.896	2025-11-04 14:41:45.917	\N	\N	\N	Support	\N
349	px3exznaypgw42w4cw8bam00	480213	นาย พีรัก พิมภา	QAD	QC2	Leader	19	เข้าอบรม	2025-11-04 14:41:45.994	2025-11-04 14:41:45.994	\N	\N	\N	\N	Support	\N
350	px3exznaypgw42w4cw8bam00	480213	นาย พีรัก พิมภา	QAD	QC2	Leader	19	เข้าอบรม	2025-11-04 14:41:45.994	2025-11-04 14:41:45.994	2025-11-04 14:41:46	\N	\N	\N	Support	\N
353	jtbxgmjl71iyq9mzdo7ampab	480217	นาย มนตรี ชัยทอง	PDT2	OQ	Junior	19		2025-11-04 14:41:46.094	2025-11-04 14:41:46.094	\N	\N	\N	\N	Production	\N
354	jtbxgmjl71iyq9mzdo7ampab	480217	นาย มนตรี ชัยทอง	PDT2	OQ	Junior	19		2025-11-04 14:41:46.094	2025-11-04 14:41:46.094	2025-11-04 14:41:46.1	\N	\N	\N	Production	\N
357	att4fag3gwbp9846gresu1jg	480219	น.ส. มานิตา ศรีจันทร์	QAD	QC2	Foreman	19	เข้าอบรม	2025-11-04 14:41:46.189	2025-11-04 14:41:46.189	\N	\N	\N	\N	Support	\N
283	v80yri5n68ol3yymwwyy7f3p	480097	น.ส. วิภารัตน์ สำราญฤทธิ์	PDM	PC	Staff	19		2025-11-04 14:41:44.375	2025-11-04 14:41:44.375	\N	\N	\N	\N	Support	\N
284	v80yri5n68ol3yymwwyy7f3p	480097	น.ส. วิภารัตน์ สำราญฤทธิ์	PDM	PC	Staff	19		2025-11-04 14:41:44.375	2025-11-04 14:41:44.375	2025-11-04 14:41:44.383	\N	\N	\N	Support	\N
287	ztlb2gb94yrs2byffaq0dsaa	480101	นาย แสงทอง สมภาวะ	QAD	QC2	Staff	19		2025-11-04 14:41:44.476	2025-11-04 14:41:44.476	\N	\N	\N	\N	Support	\N
288	ztlb2gb94yrs2byffaq0dsaa	480101	นาย แสงทอง สมภาวะ	QAD	QC2	Staff	19		2025-11-04 14:41:44.476	2025-11-04 14:41:44.476	2025-11-04 14:41:44.483	\N	\N	\N	Support	\N
291	li8jz86eorwlokm0ferhqgoa	480109	นาย ชอนะรินทร์ เจริญชนม์	PDM	FC	Junior	19		2025-11-04 14:41:44.572	2025-11-04 14:41:44.572	\N	\N	\N	\N	Support	\N
292	li8jz86eorwlokm0ferhqgoa	480109	นาย ชอนะรินทร์ เจริญชนม์	PDM	FC	Junior	19		2025-11-04 14:41:44.572	2025-11-04 14:41:44.572	2025-11-04 14:41:44.579	\N	\N	\N	Support	\N
295	td7enmmo9asemqay0cm47gy7	480120	นาย วิเชียร ไชยศิลป์	QAD	IP	Staff	19		2025-11-04 14:41:44.675	2025-11-04 14:41:44.675	\N	\N	\N	\N	Support	\N
296	td7enmmo9asemqay0cm47gy7	480120	นาย วิเชียร ไชยศิลป์	QAD	IP	Staff	19		2025-11-04 14:41:44.675	2025-11-04 14:41:44.675	2025-11-04 14:41:44.696	\N	\N	\N	Support	\N
299	qt45y2f7aj2xpeechpj04ap9	480123	นาย สามารถ ศรีสวัสดิ์	PDT3	BZ	Staff	19		2025-11-04 14:41:44.773	2025-11-04 14:41:44.773	\N	\N	\N	\N	Production	\N
300	qt45y2f7aj2xpeechpj04ap9	480123	นาย สามารถ ศรีสวัสดิ์	PDT3	BZ	Staff	19		2025-11-04 14:41:44.773	2025-11-04 14:41:44.773	2025-11-04 14:41:44.794	\N	\N	\N	Production	\N
303	org0tj68inqlxfw6af84iv5g	480128	นาย ปีติภัทร ทัศทรง	PDT2	OQ	Staff	19		2025-11-04 14:41:44.868	2025-11-04 14:41:44.868	\N	\N	\N	\N	Production	\N
304	org0tj68inqlxfw6af84iv5g	480128	นาย ปีติภัทร ทัศทรง	PDT2	OQ	Staff	19		2025-11-04 14:41:44.868	2025-11-04 14:41:44.868	2025-11-04 14:41:44.875	\N	\N	\N	Production	\N
307	bbeqoj928x3ncmgccyo4oub8	480133	นาย เอกชัย ยศสุตัน	PDT2	OQ	Leader	19		2025-11-04 14:41:44.963	2025-11-04 14:41:44.963	\N	\N	\N	\N	Production	\N
308	bbeqoj928x3ncmgccyo4oub8	480133	นาย เอกชัย ยศสุตัน	PDT2	OQ	Leader	19		2025-11-04 14:41:44.963	2025-11-04 14:41:44.963	2025-11-04 14:41:44.971	\N	\N	\N	Production	\N
311	b27zh667gn4b9hpj944sq57j	480145	นาย ไพโรจน์ แววดอน	PDM	PC	Staff	19		2025-11-04 14:41:45.061	2025-11-04 14:41:45.061	\N	\N	\N	\N	Support	\N
312	b27zh667gn4b9hpj944sq57j	480145	นาย ไพโรจน์ แววดอน	PDM	PC	Staff	19		2025-11-04 14:41:45.061	2025-11-04 14:41:45.061	2025-11-04 14:41:45.068	\N	\N	\N	Support	\N
315	og033yd93t7gfwnzsk29fauo	480150	นาง อนุลักษณ์ ยาพิลา	HRD	GA	Staff	19		2025-11-04 14:41:45.159	2025-11-04 14:41:45.159	\N	\N	\N	\N	Non Production	\N
316	og033yd93t7gfwnzsk29fauo	480150	นาง อนุลักษณ์ ยาพิลา	HRD	GA	Staff	19		2025-11-04 14:41:45.159	2025-11-04 14:41:45.159	2025-11-04 14:41:45.18	\N	\N	\N	Non Production	\N
319	ukll8va56kl867xamqh789q2	480154	นาย วิเชียร โคประโคน	ENI	MI	Foreman	19	เข้าอบรม	2025-11-04 14:41:45.257	2025-11-04 14:41:45.257	\N	\N	\N	\N	Support	\N
320	ukll8va56kl867xamqh789q2	480154	นาย วิเชียร โคประโคน	ENI	MI	Foreman	19	เข้าอบรม	2025-11-04 14:41:45.257	2025-11-04 14:41:45.257	2025-11-04 14:41:45.263	\N	\N	\N	Support	\N
323	hz5fzjaykwiaof90eb2le6hx	480158	นาย บรรจง ไพยการ	PCM	PK	Staff	19		2025-11-04 14:41:45.355	2025-11-04 14:41:45.355	\N	\N	\N	\N	Support	\N
324	hz5fzjaykwiaof90eb2le6hx	480158	นาย บรรจง ไพยการ	PCM	PK	Staff	19		2025-11-04 14:41:45.355	2025-11-04 14:41:45.355	2025-11-04 14:41:45.363	\N	\N	\N	Support	\N
327	x234sqdajm3wq9qrgfnlccgo	480166	นาย นิยม ภูจอม	PCM	ST	Leader	19		2025-11-04 14:41:45.455	2025-11-04 14:41:45.455	\N	\N	\N	\N	Support	\N
328	x234sqdajm3wq9qrgfnlccgo	480166	นาย นิยม ภูจอม	PCM	ST	Leader	19		2025-11-04 14:41:45.455	2025-11-04 14:41:45.455	2025-11-04 14:41:45.461	\N	\N	\N	Support	\N
331	qd2m7z249fi8t1pyvzban04l	480170	นาย เอกพล วงค์คำ	PDT4	EL	Junior	19		2025-11-04 14:41:45.552	2025-11-04 14:41:45.552	\N	\N	\N	\N	Production	\N
332	qd2m7z249fi8t1pyvzban04l	480170	นาย เอกพล วงค์คำ	PDT4	EL	Junior	19		2025-11-04 14:41:45.552	2025-11-04 14:41:45.552	2025-11-04 14:41:45.558	\N	\N	\N	Production	\N
335	jodr0y4imv2jvq06kdwsuuq6	480177	นาย คมสันต์ อุสาพรหม	PDT1	M8	Junior	19		2025-11-04 14:41:45.654	2025-11-04 14:41:45.654	\N	\N	\N	\N	Production	\N
336	jodr0y4imv2jvq06kdwsuuq6	480177	นาย คมสันต์ อุสาพรหม	PDT1	M8	Junior	19		2025-11-04 14:41:45.654	2025-11-04 14:41:45.654	2025-11-04 14:41:45.675	\N	\N	\N	Production	\N
339	ccmsvklica6avrau1acgydab	480188	นาย บัญชา เพ็ชร์รัตน์	PDT4	US	Expert	19	เข้าอบรม	2025-11-04 14:41:45.749	2025-11-04 14:41:45.749	\N	\N	\N	\N	Production	\N
340	ccmsvklica6avrau1acgydab	480188	นาย บัญชา เพ็ชร์รัตน์	PDT4	US	Expert	19	เข้าอบรม	2025-11-04 14:41:45.749	2025-11-04 14:41:45.749	2025-11-04 14:41:45.756	\N	\N	\N	Production	\N
343	y60r145s7u5siaxxgqwdmnz0	480195	น.ส. จงกลณี เหมะธุลิน	PDT4	UB	Staff	19		2025-11-04 14:41:45.848	2025-11-04 14:41:45.848	\N	\N	\N	\N	Production	\N
344	y60r145s7u5siaxxgqwdmnz0	480195	น.ส. จงกลณี เหมะธุลิน	PDT4	UB	Staff	19		2025-11-04 14:41:45.848	2025-11-04 14:41:45.848	2025-11-04 14:41:45.869	\N	\N	\N	Production	\N
347	tf28c79zt0wodv92v11rdzm7	480209	น.ส. ชิดชนก หาญกล้า	PDT3	WB	Staff	19		2025-11-04 14:41:45.945	2025-11-04 14:41:45.945	\N	\N	\N	\N	Production	\N
348	tf28c79zt0wodv92v11rdzm7	480209	น.ส. ชิดชนก หาญกล้า	PDT3	WB	Staff	19		2025-11-04 14:41:45.945	2025-11-04 14:41:45.945	2025-11-04 14:41:45.953	\N	\N	\N	Production	\N
351	et81yoce9zwai0yg170yebka	480215	น.ส. เพ็ญพักตร์ สุวรรณโน	PDT4	UB	Staff	19		2025-11-04 14:41:46.044	2025-11-04 14:41:46.044	\N	\N	\N	\N	Production	\N
352	et81yoce9zwai0yg170yebka	480215	น.ส. เพ็ญพักตร์ สุวรรณโน	PDT4	UB	Staff	19		2025-11-04 14:41:46.044	2025-11-04 14:41:46.044	2025-11-04 14:41:46.051	\N	\N	\N	Production	\N
355	mbyf3zw2cfgi1s3633qk4p64	480218	น.ส. มะลิวัลย์ สีทา	PDT4	UB	Staff	19		2025-11-04 14:41:46.143	2025-11-04 14:41:46.143	\N	\N	\N	\N	Production	\N
356	mbyf3zw2cfgi1s3633qk4p64	480218	น.ส. มะลิวัลย์ สีทา	PDT4	UB	Staff	19		2025-11-04 14:41:46.143	2025-11-04 14:41:46.143	2025-11-04 14:41:46.149	\N	\N	\N	Production	\N
359	qd5slzywpm02c880pvac5ycr	480220	นาย ยุทธจักร์ ประทุม	QAD	IP	Staff	19		2025-11-04 14:41:46.24	2025-11-04 14:41:46.24	\N	\N	\N	\N	Support	\N
360	qd5slzywpm02c880pvac5ycr	480220	นาย ยุทธจักร์ ประทุม	QAD	IP	Staff	19		2025-11-04 14:41:46.24	2025-11-04 14:41:46.24	2025-11-04 14:41:46.247	\N	\N	\N	Support	\N
363	ib7hlo1atq77m2w5ux0m5xrm	480225	น.ส. วิไลพร นนท์ตา	PDT4	JP	Staff	19		2025-11-04 14:41:46.335	2025-11-04 14:41:46.335	\N	\N	\N	\N	Production	\N
358	att4fag3gwbp9846gresu1jg	480219	น.ส. มานิตา ศรีจันทร์	QAD	QC2	Foreman	19	เข้าอบรม	2025-11-04 14:41:46.189	2025-11-04 14:41:46.189	2025-11-04 14:41:46.196	\N	\N	\N	Support	\N
361	z7im7amh6lbju471p77l7g5a	480224	นาย พันธ์ศักดิ์ ชำนิไกร	PDT2	OQ	Junior	19		2025-11-04 14:41:46.288	2025-11-04 14:41:46.288	\N	\N	\N	\N	Production	\N
362	z7im7amh6lbju471p77l7g5a	480224	นาย พันธ์ศักดิ์ ชำนิไกร	PDT2	OQ	Junior	19		2025-11-04 14:41:46.288	2025-11-04 14:41:46.288	2025-11-04 14:41:46.295	\N	\N	\N	Production	\N
365	zx83n6o2kzt3y09p5wgp7uwv	480227	นาย สมศักดิ์ ศิริชัย	PCM	CB	Staff	19		2025-11-04 14:41:46.381	2025-11-04 14:41:46.381	\N	\N	\N	\N	Support	\N
366	zx83n6o2kzt3y09p5wgp7uwv	480227	นาย สมศักดิ์ ศิริชัย	PCM	CB	Staff	19		2025-11-04 14:41:46.381	2025-11-04 14:41:46.381	2025-11-04 14:41:46.387	\N	\N	\N	Support	\N
369	hj8r41x3hmvw39hzt5pqzav5	480231	นาย ธนพล อุทธวัง	QAD	IP	Staff	19		2025-11-04 14:41:46.479	2025-11-04 14:41:46.479	\N	\N	\N	\N	Support	\N
370	hj8r41x3hmvw39hzt5pqzav5	480231	นาย ธนพล อุทธวัง	QAD	IP	Staff	19		2025-11-04 14:41:46.479	2025-11-04 14:41:46.479	2025-11-04 14:41:46.485	\N	\N	\N	Support	\N
373	o2fgz5skcjdvb4o1ngicwumq	480235	น.ส. สุภัตรา แสงศรี	QAD	QC2	Staff	19		2025-11-04 14:41:46.572	2025-11-04 14:41:46.572	\N	\N	\N	\N	Support	\N
374	o2fgz5skcjdvb4o1ngicwumq	480235	น.ส. สุภัตรา แสงศรี	QAD	QC2	Staff	19		2025-11-04 14:41:46.572	2025-11-04 14:41:46.572	2025-11-04 14:41:46.578	\N	\N	\N	Support	\N
377	gmuawwtx4t7h2v74bs1kjjk9	480240	น.ส. อ้อยใจ เจริญรส	PDT1	EG	Staff	19		2025-11-04 14:41:46.672	2025-11-04 14:41:46.672	\N	\N	\N	\N	Production	\N
378	gmuawwtx4t7h2v74bs1kjjk9	480240	น.ส. อ้อยใจ เจริญรส	PDT1	EG	Staff	19		2025-11-04 14:41:46.672	2025-11-04 14:41:46.672	2025-11-04 14:41:46.678	\N	\N	\N	Production	\N
381	uny9gpjh7ft29qgxnsyl7uta	480242	น.ส. อำนวย แก้วเมืองกลาง	PCM	ST	Staff	19		2025-11-04 14:41:46.765	2025-11-04 14:41:46.765	\N	\N	\N	\N	Support	\N
382	uny9gpjh7ft29qgxnsyl7uta	480242	น.ส. อำนวย แก้วเมืองกลาง	PCM	ST	Staff	19		2025-11-04 14:41:46.765	2025-11-04 14:41:46.765	2025-11-04 14:41:46.772	\N	\N	\N	Support	\N
385	t1gc0rqtsbpz1q8ga4ypypp8	480246	นาย ชัยวัฒน์ มังครัตน์	PDT4	JA	Staff	19		2025-11-04 14:41:46.86	2025-11-04 14:41:46.86	\N	\N	\N	\N	Production	\N
386	t1gc0rqtsbpz1q8ga4ypypp8	480246	นาย ชัยวัฒน์ มังครัตน์	PDT4	JA	Staff	19		2025-11-04 14:41:46.86	2025-11-04 14:41:46.86	2025-11-04 14:41:46.867	\N	\N	\N	Production	\N
393	cruatgfkmonx122wh9v9kkkw	480254	นาย ประมวลชัย เวียนนอก	PDT1	NT	Foreman	19	เข้าอบรม	2025-11-04 14:41:47.044	2025-11-04 14:41:47.044	\N	\N	\N	\N	Production	\N
394	cruatgfkmonx122wh9v9kkkw	480254	นาย ประมวลชัย เวียนนอก	PDT1	NT	Foreman	19	เข้าอบรม	2025-11-04 14:41:47.044	2025-11-04 14:41:47.044	2025-11-04 14:41:47.049	\N	\N	\N	Production	\N
397	cdjwcsx4grtwkit9izfe0t4v	480258	นาย ภาสพิชญ์ ผองขำ	PCM	CB	Staff	19		2025-11-04 14:41:47.137	2025-11-04 14:41:47.137	\N	\N	\N	\N	Support	\N
398	cdjwcsx4grtwkit9izfe0t4v	480258	นาย ภาสพิชญ์ ผองขำ	PCM	CB	Staff	19		2025-11-04 14:41:47.137	2025-11-04 14:41:47.137	2025-11-04 14:41:47.144	\N	\N	\N	Support	\N
401	y7w0nae85zg2us06au0gaeeh	490016	น.ส. ศรีสมเพชร สุวรรณไตรย์	PDM	PC	Staff	19		2025-11-04 14:41:47.235	2025-11-04 14:41:47.235	\N	\N	\N	\N	Support	\N
402	y7w0nae85zg2us06au0gaeeh	490016	น.ส. ศรีสมเพชร สุวรรณไตรย์	PDM	PC	Staff	19		2025-11-04 14:41:47.235	2025-11-04 14:41:47.235	2025-11-04 14:41:47.241	\N	\N	\N	Support	\N
405	izjxjig208vcpvmlngp5rv9b	490024	นาย สมภพ แหยมคง	PDT1	M10	Junior	19		2025-11-04 14:41:47.331	2025-11-04 14:41:47.331	\N	\N	\N	\N	Production	\N
406	izjxjig208vcpvmlngp5rv9b	490024	นาย สมภพ แหยมคง	PDT1	M10	Junior	19		2025-11-04 14:41:47.331	2025-11-04 14:41:47.331	2025-11-04 14:41:47.338	\N	\N	\N	Production	\N
409	ld1xaaotiy0pthg0wot8a4a5	490027	นาย เชิดศักดิ์ เดชขันธ์	PDT1	M8	Staff	19		2025-11-04 14:41:47.426	2025-11-04 14:41:47.426	\N	\N	\N	\N	Production	\N
410	ld1xaaotiy0pthg0wot8a4a5	490027	นาย เชิดศักดิ์ เดชขันธ์	PDT1	M8	Staff	19		2025-11-04 14:41:47.426	2025-11-04 14:41:47.426	2025-11-04 14:41:47.432	\N	\N	\N	Production	\N
413	m1tbjg9isf6hw9qkqsxlxqvl	490029	นาย กิตติพงษ์ พรมดี	PDT1	M8	Leader	19		2025-11-04 14:41:47.518	2025-11-04 14:41:47.518	\N	\N	\N	\N	Production	\N
414	m1tbjg9isf6hw9qkqsxlxqvl	490029	นาย กิตติพงษ์ พรมดี	PDT1	M8	Leader	19		2025-11-04 14:41:47.518	2025-11-04 14:41:47.518	2025-11-04 14:41:47.524	\N	\N	\N	Production	\N
417	mgyl51k39wymmcx3xq7ptnxi	490031	นาย โกศล แตงบุญรอด	PDT3	BZ	Leader	19	เข้าอบรม	2025-11-04 14:41:47.612	2025-11-04 14:41:47.612	\N	\N	\N	\N	Production	\N
418	mgyl51k39wymmcx3xq7ptnxi	490031	นาย โกศล แตงบุญรอด	PDT3	BZ	Leader	19	เข้าอบรม	2025-11-04 14:41:47.612	2025-11-04 14:41:47.612	2025-11-04 14:41:47.619	\N	\N	\N	Production	\N
421	redthljoh28ca2vlu8eue6ol	490036	นาย มานะ ปลื้มสุขใจ	PDT2	OQ	Leader	19		2025-11-04 14:41:47.71	2025-11-04 14:41:47.71	\N	\N	\N	\N	Production	\N
422	redthljoh28ca2vlu8eue6ol	490036	นาย มานะ ปลื้มสุขใจ	PDT2	OQ	Leader	19		2025-11-04 14:41:47.71	2025-11-04 14:41:47.71	2025-11-04 14:41:47.716	\N	\N	\N	Production	\N
425	igykzmrhtcsyok3ode2axt1k	490054	นาย ธงชัย ภาพสิงห์	PDT4	JA	Staff	19		2025-11-04 14:41:47.801	2025-11-04 14:41:47.801	\N	\N	\N	\N	Production	\N
426	igykzmrhtcsyok3ode2axt1k	490054	นาย ธงชัย ภาพสิงห์	PDT4	JA	Staff	19		2025-11-04 14:41:47.801	2025-11-04 14:41:47.801	2025-11-04 14:41:47.808	\N	\N	\N	Production	\N
429	oyfmbpy2vr40oix23y17tt8e	490062	นาย ปิยะ ประวัติวัชรา	PCM	Q-GATE	Staff	19		2025-11-04 14:41:47.895	2025-11-04 14:41:47.895	\N	\N	\N	\N	Support	\N
430	oyfmbpy2vr40oix23y17tt8e	490062	นาย ปิยะ ประวัติวัชรา	PCM	Q-GATE	Staff	19		2025-11-04 14:41:47.895	2025-11-04 14:41:47.895	2025-11-04 14:41:47.916	\N	\N	\N	Support	\N
433	xsysodye8rdsqfi3b3gx0ieu	490064	น.ส. ลิลาพร คำสิงห์	PCM	ST	Staff	19		2025-11-04 14:41:47.989	2025-11-04 14:41:47.989	\N	\N	\N	\N	Support	\N
434	xsysodye8rdsqfi3b3gx0ieu	490064	น.ส. ลิลาพร คำสิงห์	PCM	ST	Staff	19		2025-11-04 14:41:47.989	2025-11-04 14:41:47.989	2025-11-04 14:41:48.013	\N	\N	\N	Support	\N
437	gv14zn3yfdtj6xm7o61myo5t	490071	นาง วนิดา วงศ์คะสุ่ม	FNC	TM	Team Manager	19		2025-11-04 14:41:48.085	2025-11-20 14:29:10.669	\N	\N	1	\N	Non Production	wanida@aoyama.co.th
364	ib7hlo1atq77m2w5ux0m5xrm	480225	น.ส. วิไลพร นนท์ตา	PDT4	JP	Staff	19		2025-11-04 14:41:46.335	2025-11-04 14:41:46.335	2025-11-04 14:41:46.341	\N	\N	\N	Production	\N
367	w08o1imdlediz8sd5dl2vx54	480230	น.ส. ณรัณญา คำโคตร	ENI	FDM	Staff	19		2025-11-04 14:41:46.431	2025-11-04 14:41:46.431	\N	\N	\N	\N	Support	\N
368	w08o1imdlediz8sd5dl2vx54	480230	น.ส. ณรัณญา คำโคตร	ENI	FDM	Staff	19		2025-11-04 14:41:46.431	2025-11-04 14:41:46.431	2025-11-04 14:41:46.437	\N	\N	\N	Support	\N
371	osidg63texghc975im3pqhwn	480232	น.ส. สาคร ดวงเสนา	PDT1	NT	Staff	19		2025-11-04 14:41:46.526	2025-11-04 14:41:46.526	\N	\N	\N	\N	Production	\N
372	osidg63texghc975im3pqhwn	480232	น.ส. สาคร ดวงเสนา	PDT1	NT	Staff	19		2025-11-04 14:41:46.526	2025-11-04 14:41:46.526	2025-11-04 14:41:46.532	\N	\N	\N	Production	\N
375	ldvlwgx5ouy781wzasyni6n7	480239	นาย อนุพงษ์ อ่อนพลึกภูมิ	PCM	Q-GATE	Staff	19		2025-11-04 14:41:46.622	2025-11-04 14:41:46.622	\N	\N	\N	\N	Support	\N
376	ldvlwgx5ouy781wzasyni6n7	480239	นาย อนุพงษ์ อ่อนพลึกภูมิ	PCM	Q-GATE	Staff	19		2025-11-04 14:41:46.622	2025-11-04 14:41:46.622	2025-11-04 14:41:46.631	\N	\N	\N	Support	\N
379	lilsykskg9w4bodv94cwhqwz	480241	นาย อารีพร สีแสด	QAD	IP	Staff	19		2025-11-04 14:41:46.717	2025-11-04 14:41:46.717	\N	\N	\N	\N	Support	\N
380	lilsykskg9w4bodv94cwhqwz	480241	นาย อารีพร สีแสด	QAD	IP	Staff	19		2025-11-04 14:41:46.717	2025-11-04 14:41:46.717	2025-11-04 14:41:46.723	\N	\N	\N	Support	\N
383	zwn9xyhm3hdqngu0jqg8brls	480244	นาย วุฒิพงษ์ มุงขุนการ	PDM	PC	Staff	19		2025-11-04 14:41:46.811	2025-11-04 14:41:46.811	\N	\N	\N	\N	Support	\N
384	zwn9xyhm3hdqngu0jqg8brls	480244	นาย วุฒิพงษ์ มุงขุนการ	PDM	PC	Staff	19		2025-11-04 14:41:46.811	2025-11-04 14:41:46.811	2025-11-04 14:41:46.819	\N	\N	\N	Support	\N
387	isq3262is0lkvunqpxo1vhgf	480248	นาย สมชาย มูลเมือง	PDT4	JA	Junior	19		2025-11-04 14:41:46.905	2025-11-04 14:41:46.905	\N	\N	\N	\N	Production	\N
388	isq3262is0lkvunqpxo1vhgf	480248	นาย สมชาย มูลเมือง	PDT4	JA	Junior	19		2025-11-04 14:41:46.905	2025-11-04 14:41:46.905	2025-11-04 14:41:46.913	\N	\N	\N	Production	\N
391	k0vpvb6el0njykiiy3w5e0n1	480252	นาย นิพนธ์ ฉลาดสุนทรวาที	QAD	IP	Staff	19		2025-11-04 14:41:46.997	2025-11-04 14:41:46.997	\N	\N	\N	\N	Support	\N
392	k0vpvb6el0njykiiy3w5e0n1	480252	นาย นิพนธ์ ฉลาดสุนทรวาที	QAD	IP	Staff	19		2025-11-04 14:41:46.997	2025-11-04 14:41:46.997	2025-11-04 14:41:47.008	\N	\N	\N	Support	\N
395	j492o71mmxpv86pflmh9le10	480256	นาย ธนเดช วีระธรรมธาดา	PDT4	UB	Junior	19		2025-11-04 14:41:47.091	2025-11-04 14:41:47.091	\N	\N	\N	\N	Production	\N
396	j492o71mmxpv86pflmh9le10	480256	นาย ธนเดช วีระธรรมธาดา	PDT4	UB	Junior	19		2025-11-04 14:41:47.091	2025-11-04 14:41:47.091	2025-11-04 14:41:47.097	\N	\N	\N	Production	\N
399	l5o5fjshfxtkimk8rwbeb2ap	490008	นาย วันชัย โพธิจักร์	PDT1	M6	Junior	19	เข้าอบรม	2025-11-04 14:41:47.184	2025-11-04 14:41:47.184	\N	\N	\N	\N	Production	\N
400	l5o5fjshfxtkimk8rwbeb2ap	490008	นาย วันชัย โพธิจักร์	PDT1	M6	Junior	19	เข้าอบรม	2025-11-04 14:41:47.184	2025-11-04 14:41:47.184	2025-11-04 14:41:47.191	\N	\N	\N	Production	\N
403	pyjxpb5kp87ph4if9996m6jm	490021	นาย สมคิด บิลรัมย์	PUD	PU1	Staff	19		2025-11-04 14:41:47.283	2025-11-04 14:41:47.283	\N	\N	\N	\N	Non Production	\N
404	pyjxpb5kp87ph4if9996m6jm	490021	นาย สมคิด บิลรัมย์	PUD	PU1	Staff	19		2025-11-04 14:41:47.283	2025-11-04 14:41:47.283	2025-11-04 14:41:47.289	\N	\N	\N	Non Production	\N
407	z2ej6kp6tg7vikhc3uteg34z	490026	นาย วินิจ ภูมี	PDT1	M6	Leader	19		2025-11-04 14:41:47.378	2025-11-04 14:41:47.378	\N	\N	\N	\N	Production	\N
408	z2ej6kp6tg7vikhc3uteg34z	490026	นาย วินิจ ภูมี	PDT1	M6	Leader	19		2025-11-04 14:41:47.378	2025-11-04 14:41:47.378	2025-11-04 14:41:47.384	\N	\N	\N	Production	\N
411	r86wxjcfi8mq9qjzpgf9jtzw	490028	นาย เกียรติเจริญ แสงจันทร์	ENI	FDM	Junior	19		2025-11-04 14:41:47.471	2025-11-04 14:41:47.471	\N	\N	\N	\N	Support	\N
412	r86wxjcfi8mq9qjzpgf9jtzw	490028	นาย เกียรติเจริญ แสงจันทร์	ENI	FDM	Junior	19		2025-11-04 14:41:47.471	2025-11-04 14:41:47.471	2025-11-04 14:41:47.478	\N	\N	\N	Support	\N
415	ujq8ovv6ie9ot7ywudafhydf	490030	น.ส. แก้ววิภาวัลย์ แสนศรี	PDT4	UB	Staff	19		2025-11-04 14:41:47.563	2025-11-04 14:41:47.563	\N	\N	\N	\N	Production	\N
416	ujq8ovv6ie9ot7ywudafhydf	490030	น.ส. แก้ววิภาวัลย์ แสนศรี	PDT4	UB	Staff	19		2025-11-04 14:41:47.563	2025-11-04 14:41:47.563	2025-11-04 14:41:47.57	\N	\N	\N	Production	\N
419	vo5zuh4drga2b9cxdr0ibitp	490035	นาย ไพศาล แก้วอัคฮาด	PCM	CB	Staff	19		2025-11-04 14:41:47.665	2025-11-04 14:41:47.665	\N	\N	\N	\N	Support	\N
420	vo5zuh4drga2b9cxdr0ibitp	490035	นาย ไพศาล แก้วอัคฮาด	PCM	CB	Staff	19		2025-11-04 14:41:47.665	2025-11-04 14:41:47.665	2025-11-04 14:41:47.671	\N	\N	\N	Support	\N
423	ffo6djv6fjxqj9p7s27w8i1k	490038	นาย ลือชัย แหสูงเนิน	PDM	FC	Junior	19		2025-11-04 14:41:47.754	2025-11-04 14:41:47.754	\N	\N	\N	\N	Support	\N
424	ffo6djv6fjxqj9p7s27w8i1k	490038	นาย ลือชัย แหสูงเนิน	PDM	FC	Junior	19		2025-11-04 14:41:47.754	2025-11-04 14:41:47.754	2025-11-04 14:41:47.761	\N	\N	\N	Support	\N
427	qaauzko0988nhpxepdvy3gxi	490058	นาย องอาจ บุญแจ้ง	PDT4	UB	Leader	19		2025-11-04 14:41:47.847	2025-11-04 14:41:47.847	\N	\N	\N	\N	Production	\N
428	qaauzko0988nhpxepdvy3gxi	490058	นาย องอาจ บุญแจ้ง	PDT4	UB	Leader	19		2025-11-04 14:41:47.847	2025-11-04 14:41:47.847	2025-11-04 14:41:47.854	\N	\N	\N	Production	\N
431	ct4q33ou4dcmuwyqi5oc45yc	490063	น.ส. มายีด๊ะ โต๊ะแซ	PDT3	WB	Staff	19		2025-11-04 14:41:47.941	2025-11-04 14:41:47.941	\N	\N	\N	\N	Production	\N
432	ct4q33ou4dcmuwyqi5oc45yc	490063	น.ส. มายีด๊ะ โต๊ะแซ	PDT3	WB	Staff	19		2025-11-04 14:41:47.941	2025-11-04 14:41:47.941	2025-11-04 14:41:47.947	\N	\N	\N	Production	\N
435	x2s3uiab3oorbjzlxemmf9si	490067	นาย สัญญา กองธรรม	QAD	IP	Staff	19		2025-11-04 14:41:48.037	2025-11-04 14:41:48.037	\N	\N	\N	\N	Support	\N
436	x2s3uiab3oorbjzlxemmf9si	490067	นาย สัญญา กองธรรม	QAD	IP	Staff	19		2025-11-04 14:41:48.037	2025-11-04 14:41:48.037	2025-11-04 14:41:48.043	\N	\N	\N	Support	\N
439	zjp29w1paoo7sd3e4f00ceyz	490072	นาย สมศักดิ์ รักทองสุข	PDM	IT	Foreman	19		2025-11-04 14:41:48.131	2025-11-04 14:41:48.131	\N	\N	\N	\N	Support	\N
440	zjp29w1paoo7sd3e4f00ceyz	490072	นาย สมศักดิ์ รักทองสุข	PDM	IT	Foreman	19		2025-11-04 14:41:48.131	2025-11-04 14:41:48.131	2025-11-04 14:41:48.137	\N	\N	\N	Support	\N
443	m727ee723970i93opvf3fkql	490078	นาง กันทิมา แขมภูเขียว	PCM	PK	Staff	19		2025-11-04 14:41:48.227	2025-11-04 14:41:48.227	\N	\N	\N	\N	Support	\N
444	m727ee723970i93opvf3fkql	490078	นาง กันทิมา แขมภูเขียว	PCM	PK	Staff	19		2025-11-04 14:41:48.227	2025-11-04 14:41:48.227	2025-11-04 14:41:48.233	\N	\N	\N	Support	\N
441	wsft2qoijehv0xic2eot57hp	490077	น.ส. เพชรลดา ไทรย่อย	PCM	ST	Staff	19		2025-11-04 14:41:48.176	2025-11-04 14:41:48.176	\N	\N	\N	\N	Support	\N
442	wsft2qoijehv0xic2eot57hp	490077	น.ส. เพชรลดา ไทรย่อย	PCM	ST	Staff	19		2025-11-04 14:41:48.176	2025-11-04 14:41:48.176	2025-11-04 14:41:48.185	\N	\N	\N	Support	\N
449	rhr7yd5naad2u31z9v6xx8dm	490088	นาย เสริมวิทย์ ชาลีอัน	PDT1	M8	Staff	19		2025-11-04 14:41:48.366	2025-11-04 14:41:48.366	\N	\N	\N	\N	Production	\N
450	rhr7yd5naad2u31z9v6xx8dm	490088	นาย เสริมวิทย์ ชาลีอัน	PDT1	M8	Staff	19		2025-11-04 14:41:48.366	2025-11-04 14:41:48.366	2025-11-04 14:41:48.372	\N	\N	\N	Production	\N
453	u2pdtysc3sc5acmwggucmu28	490094	นาย ประพันธ์ อุตสาห์	PDT2	OQ	Staff	19		2025-11-04 14:41:48.458	2025-11-04 14:41:48.458	\N	\N	\N	\N	Production	\N
454	u2pdtysc3sc5acmwggucmu28	490094	นาย ประพันธ์ อุตสาห์	PDT2	OQ	Staff	19		2025-11-04 14:41:48.458	2025-11-04 14:41:48.458	2025-11-04 14:41:48.465	\N	\N	\N	Production	\N
457	zh0bfqn5kjjq9w3jm3sebe2r	490096	นาย ประสงค์ วุฒิ	PCM	CB	Staff	19		2025-11-04 14:41:48.552	2025-11-04 14:41:48.552	\N	\N	\N	\N	Support	\N
458	zh0bfqn5kjjq9w3jm3sebe2r	490096	นาย ประสงค์ วุฒิ	PCM	CB	Staff	19		2025-11-04 14:41:48.552	2025-11-04 14:41:48.552	2025-11-04 14:41:48.572	\N	\N	\N	Support	\N
461	l59eholanpf8qwxbz2kvs7k1	490105	นาง น้ำผึ้ง วาดวงศ์	HRD	GA	Staff	19		2025-11-04 14:41:48.643	2025-11-04 14:41:48.643	\N	\N	\N	\N	Non Production	\N
462	l59eholanpf8qwxbz2kvs7k1	490105	นาง น้ำผึ้ง วาดวงศ์	HRD	GA	Staff	19		2025-11-04 14:41:48.643	2025-11-04 14:41:48.643	2025-11-04 14:41:48.648	\N	\N	\N	Non Production	\N
465	r9a7gyoq1u2h58h7kb7v6ant	490107	นาย ฉันท์ อาจใจ	PDT2	OQ	Staff	19		2025-11-04 14:41:48.734	2025-11-04 14:41:48.734	\N	\N	\N	\N	Production	\N
466	r9a7gyoq1u2h58h7kb7v6ant	490107	นาย ฉันท์ อาจใจ	PDT2	OQ	Staff	19		2025-11-04 14:41:48.734	2025-11-04 14:41:48.734	2025-11-04 14:41:48.74	\N	\N	\N	Production	\N
469	dzlj7ckeoqdiekddwco8x4al	490115	นาง สารถ้อย วุฒิ	PDM	PC	Staff	19		2025-11-04 14:41:48.823	2025-11-04 14:41:48.823	\N	\N	\N	\N	Support	\N
470	dzlj7ckeoqdiekddwco8x4al	490115	นาง สารถ้อย วุฒิ	PDM	PC	Staff	19		2025-11-04 14:41:48.823	2025-11-04 14:41:48.823	2025-11-04 14:41:48.83	\N	\N	\N	Support	\N
473	r614xl3bd3rnk41eiz4sorlv	490118	นาย ณรงค์ชัย ลวดเงิน	PDM	FC	Staff	19		2025-11-04 14:41:48.913	2025-11-04 14:41:48.913	\N	\N	\N	\N	Support	\N
474	r614xl3bd3rnk41eiz4sorlv	490118	นาย ณรงค์ชัย ลวดเงิน	PDM	FC	Staff	19		2025-11-04 14:41:48.913	2025-11-04 14:41:48.913	2025-11-04 14:41:48.918	\N	\N	\N	Support	\N
477	qhqbmd2zuabwa1qj1267e68d	490129	นาย อาษฎาวุฒิ วุฒิงาม	PCM	Q-GATE	Staff	19		2025-11-04 14:41:49.002	2025-11-04 14:41:49.002	\N	\N	\N	\N	Support	\N
478	qhqbmd2zuabwa1qj1267e68d	490129	นาย อาษฎาวุฒิ วุฒิงาม	PCM	Q-GATE	Staff	19		2025-11-04 14:41:49.002	2025-11-04 14:41:49.002	2025-11-04 14:41:49.009	\N	\N	\N	Support	\N
481	hswo6fghrz7shgoxpamwf491	490132	น.ส. สุริสา ทองหมื่นศรี	PDT3	WB	Staff	19		2025-11-04 14:41:49.092	2025-11-04 14:41:49.092	\N	\N	\N	\N	Production	\N
482	hswo6fghrz7shgoxpamwf491	490132	น.ส. สุริสา ทองหมื่นศรี	PDT3	WB	Staff	19		2025-11-04 14:41:49.092	2025-11-04 14:41:49.092	2025-11-04 14:41:49.097	\N	\N	\N	Production	\N
485	gd3n79rtgtav4v7d2g2g0uzj	490140	นาย ภูริวัช ศรีโคตร	HRD	EF	Staff	19		2025-11-04 14:41:49.18	2025-11-04 14:41:49.18	\N	\N	\N	\N	Non Production	\N
486	gd3n79rtgtav4v7d2g2g0uzj	490140	นาย ภูริวัช ศรีโคตร	HRD	EF	Staff	19		2025-11-04 14:41:49.18	2025-11-04 14:41:49.18	2025-11-04 14:41:49.185	\N	\N	\N	Non Production	\N
489	a6al2x5rcd10nhlq3f29ay36	490143	น.ส. วัชราพร เทียนกระจ่าง	PDT3	BZ	Leader	19	เข้าอบรม	2025-11-04 14:41:49.251	2025-11-04 14:41:49.251	\N	\N	\N	\N	Production	\N
490	a6al2x5rcd10nhlq3f29ay36	490143	น.ส. วัชราพร เทียนกระจ่าง	PDT3	BZ	Leader	19	เข้าอบรม	2025-11-04 14:41:49.251	2025-11-04 14:41:49.251	2025-11-04 14:41:49.256	\N	\N	\N	Production	\N
497	q5lup0x0ycfwx2faxii30c3c	500010	นาย วีรชัย วงค์วันดี	PDT4	EL	Staff	18		2025-11-04 14:41:49.405	2025-11-04 14:41:49.405	\N	\N	\N	\N	Production	\N
498	q5lup0x0ycfwx2faxii30c3c	500010	นาย วีรชัย วงค์วันดี	PDT4	EL	Staff	18		2025-11-04 14:41:49.405	2025-11-04 14:41:49.405	2025-11-04 14:41:49.412	\N	\N	\N	Production	\N
509	v4vch1mr2rl63s195ae58nwn	500037	น.ส. หนึ่งฤทัย คำหนัก	PCM	PK	Staff	18		2025-11-04 14:41:49.652	2025-11-04 14:41:49.652	\N	\N	\N	\N	Support	\N
510	v4vch1mr2rl63s195ae58nwn	500037	น.ส. หนึ่งฤทัย คำหนัก	PCM	PK	Staff	18		2025-11-04 14:41:49.652	2025-11-04 14:41:49.652	2025-11-04 14:41:49.657	\N	\N	\N	Support	\N
513	ot6590fnmvpi70388a99vsh9	500046	นาย สุขสวัสดิ์ ชัยศรี	PDT4	MC	Junior	18		2025-11-04 14:41:49.734	2025-11-04 14:41:49.734	\N	\N	\N	\N	Production	\N
514	ot6590fnmvpi70388a99vsh9	500046	นาย สุขสวัสดิ์ ชัยศรี	PDT4	MC	Junior	18		2025-11-04 14:41:49.734	2025-11-04 14:41:49.734	2025-11-04 14:41:49.738	\N	\N	\N	Production	\N
517	ps23mdskrexj7sf5yh3649se	500063	นาย ธนกฤต แย้มยิ้ม	HRD	GA	Staff	18		2025-11-04 14:41:49.802	2025-11-04 14:41:49.802	\N	\N	\N	\N	Non Production	\N
493	dsmx98wx8qdmkd97aks5fums	490153	นาย ล้อมพงศ์ วิชัย	ENI	TM	Team Manager	18		2025-11-04 14:41:49.334	2025-11-20 14:29:25.056	\N	\N	1	\N	Support	lompong@aoyama.co.th
505	xlgknxjk9pmji4pg3b49yjaj	500026	นาย วัฒนา น้อยหาญ	PDT1	NT	Supervisor	18		2025-11-04 14:41:49.582	2025-11-20 14:29:31.026	\N	\N	1	\N	Production	wattana@aoyama.co.th
501	y5aa9uy5etftl1wpvcz8ytyj	500014	น.ส. กรวรรณ ภิญโญศรี	PCM	TM	Team Manager	18		2025-11-04 14:41:49.495	2025-11-20 14:29:33.91	\N	\N	1	\N	Support	koravan@aoyama.co.th
447	ugpgpd4uqyqr2ssvtiiwyijl	490085	นาย ดำรงค์ จันทรักษ์	PDT4	MC	Staff	19		2025-11-04 14:41:48.32	2025-11-04 14:41:48.32	\N	\N	\N	\N	Production	\N
448	ugpgpd4uqyqr2ssvtiiwyijl	490085	นาย ดำรงค์ จันทรักษ์	PDT4	MC	Staff	19		2025-11-04 14:41:48.32	2025-11-04 14:41:48.32	2025-11-04 14:41:48.327	\N	\N	\N	Production	\N
451	y7z9ctxliyeteovau2hr8t7z	490093	น.ส. เพ็ญพักตร์ อุดมสิน	PCM	ST	Staff	19		2025-11-04 14:41:48.414	2025-11-04 14:41:48.414	\N	\N	\N	\N	Support	\N
452	y7z9ctxliyeteovau2hr8t7z	490093	น.ส. เพ็ญพักตร์ อุดมสิน	PCM	ST	Staff	19		2025-11-04 14:41:48.414	2025-11-04 14:41:48.414	2025-11-04 14:41:48.42	\N	\N	\N	Support	\N
455	c7slj1mfekh16tauv8e41hjf	490095	นาย มานิตย์ ตูบสันเทียะ	PDT2	OQ	Staff	19		2025-11-04 14:41:48.504	2025-11-04 14:41:48.504	\N	\N	\N	\N	Production	\N
456	c7slj1mfekh16tauv8e41hjf	490095	นาย มานิตย์ ตูบสันเทียะ	PDT2	OQ	Staff	19		2025-11-04 14:41:48.504	2025-11-04 14:41:48.504	2025-11-04 14:41:48.525	\N	\N	\N	Production	\N
459	g2zh7jbr6mp4focvg5y9vb72	490103	นาย ทวี แซ่ว่อง	QAD	QC2	Junior	19		2025-11-04 14:41:48.599	2025-11-04 14:41:48.599	\N	\N	\N	\N	Support	\N
460	g2zh7jbr6mp4focvg5y9vb72	490103	นาย ทวี แซ่ว่อง	QAD	QC2	Junior	19		2025-11-04 14:41:48.599	2025-11-04 14:41:48.599	2025-11-04 14:41:48.62	\N	\N	\N	Support	\N
463	mn7otrjsnmujmhg0ak6gi9uy	490106	นาย สุวิทย์ มหาคง	PCM	ST	Junior	19		2025-11-04 14:41:48.689	2025-11-04 14:41:48.689	\N	\N	\N	\N	Support	\N
464	mn7otrjsnmujmhg0ak6gi9uy	490106	นาย สุวิทย์ มหาคง	PCM	ST	Junior	19		2025-11-04 14:41:48.689	2025-11-04 14:41:48.689	2025-11-04 14:41:48.694	\N	\N	\N	Support	\N
467	s1lt3f718kwowopq7ws6to7l	490112	นาย อานนท์ อัครชาติ	PCM	TP	Junior	19		2025-11-04 14:41:48.778	2025-11-04 14:41:48.778	\N	\N	\N	\N	Support	\N
468	s1lt3f718kwowopq7ws6to7l	490112	นาย อานนท์ อัครชาติ	PCM	TP	Junior	19		2025-11-04 14:41:48.778	2025-11-04 14:41:48.778	2025-11-04 14:41:48.785	\N	\N	\N	Support	\N
471	za3xb87364qcs4qbz5a9id7b	490117	นาย พงษ์วิวัฒน์ จอนโพธิ์	PDM	FC	Staff	19		2025-11-04 14:41:48.866	2025-11-04 14:41:48.866	\N	\N	\N	\N	Support	\N
472	za3xb87364qcs4qbz5a9id7b	490117	นาย พงษ์วิวัฒน์ จอนโพธิ์	PDM	FC	Staff	19		2025-11-04 14:41:48.866	2025-11-04 14:41:48.866	2025-11-04 14:41:48.871	\N	\N	\N	Support	\N
475	zlqa2muhprtsalr9yubju2b8	490127	น.ส. อำภา สมภาวะ	PCM	ST	Staff	19		2025-11-04 14:41:48.958	2025-11-04 14:41:48.958	\N	\N	\N	\N	Support	\N
476	zlqa2muhprtsalr9yubju2b8	490127	น.ส. อำภา สมภาวะ	PCM	ST	Staff	19		2025-11-04 14:41:48.958	2025-11-04 14:41:48.958	2025-11-04 14:41:48.964	\N	\N	\N	Support	\N
479	mo8dfim6bodv09o7qmqi0atd	490131	น.ส. สีนวล บานแย้ม	PDT3	WB	Staff	19		2025-11-04 14:41:49.046	2025-11-04 14:41:49.046	\N	\N	\N	\N	Production	\N
480	mo8dfim6bodv09o7qmqi0atd	490131	น.ส. สีนวล บานแย้ม	PDT3	WB	Staff	19		2025-11-04 14:41:49.046	2025-11-04 14:41:49.046	2025-11-04 14:41:49.051	\N	\N	\N	Production	\N
483	z6o5j9rvn7gtlhccpb21dorf	490136	นาง สมร ดาจักร์	PCM	CB	Staff	19		2025-11-04 14:41:49.138	2025-11-04 14:41:49.138	\N	\N	\N	\N	Support	\N
484	z6o5j9rvn7gtlhccpb21dorf	490136	นาง สมร ดาจักร์	PCM	CB	Staff	19		2025-11-04 14:41:49.138	2025-11-04 14:41:49.138	2025-11-04 14:41:49.143	\N	\N	\N	Support	\N
487	db3zy95yb8a5ubh2mox13gtp	490141	นาย ยงยุท เสณีกุล	PDT4	US	Leader	19	เข้าอบรม	2025-11-04 14:41:49.208	2025-11-04 14:41:49.208	\N	\N	\N	\N	Production	\N
488	db3zy95yb8a5ubh2mox13gtp	490141	นาย ยงยุท เสณีกุล	PDT4	US	Leader	19	เข้าอบรม	2025-11-04 14:41:49.208	2025-11-04 14:41:49.208	2025-11-04 14:41:49.228	\N	\N	\N	Production	\N
491	wi3pk8aum1pj0ha92yb8d2eg	490147	นาย ระวิทย์ พลัน	PDT1	M10	Staff	19		2025-11-04 14:41:49.292	2025-11-04 14:41:49.292	\N	\N	\N	\N	Production	\N
492	wi3pk8aum1pj0ha92yb8d2eg	490147	นาย ระวิทย์ พลัน	PDT1	M10	Staff	19		2025-11-04 14:41:49.292	2025-11-04 14:41:49.292	2025-11-04 14:41:49.3	\N	\N	\N	Production	\N
495	j4h99z2sgns6emj3wqaf44dm	490155	นาย สายันต์ วงคำจันทร์	HRD	GA	Staff	18		2025-11-04 14:41:49.361	2025-11-04 14:41:49.361	\N	\N	\N	\N	Non Production	\N
496	j4h99z2sgns6emj3wqaf44dm	490155	นาย สายันต์ วงคำจันทร์	HRD	GA	Staff	18		2025-11-04 14:41:49.361	2025-11-04 14:41:49.361	2025-11-04 14:41:49.366	\N	\N	\N	Non Production	\N
499	nwav83vd99h3q8frjgpuro7t	500013	น.ส. กาญจนา มุงคุล	PCM	ST	Leader	18		2025-11-04 14:41:49.448	2025-11-04 14:41:49.448	\N	\N	\N	\N	Support	\N
500	nwav83vd99h3q8frjgpuro7t	500013	น.ส. กาญจนา มุงคุล	PCM	ST	Leader	18		2025-11-04 14:41:49.448	2025-11-04 14:41:49.448	2025-11-04 14:41:49.456	\N	\N	\N	Support	\N
503	e51abt2y4jkkeadle36b1qwi	500025	นาย สุมัชชา ธะโนรับ	PDT2	OQ	Staff	18		2025-11-04 14:41:49.539	2025-11-04 14:41:49.539	\N	\N	\N	\N	Production	\N
504	e51abt2y4jkkeadle36b1qwi	500025	นาย สุมัชชา ธะโนรับ	PDT2	OQ	Staff	18		2025-11-04 14:41:49.539	2025-11-04 14:41:49.539	2025-11-04 14:41:49.544	\N	\N	\N	Production	\N
507	y5h8zz08g68vnh3zsfid54yv	500028	นาย ขวัญชัย พลแสง	PCM	ST	Staff	18		2025-11-04 14:41:49.624	2025-11-04 14:41:49.624	\N	\N	\N	\N	Support	\N
508	y5h8zz08g68vnh3zsfid54yv	500028	นาย ขวัญชัย พลแสง	PCM	ST	Staff	18		2025-11-04 14:41:49.624	2025-11-04 14:41:49.624	2025-11-04 14:41:49.628	\N	\N	\N	Support	\N
511	xba7ta1zd20hmyn6156thkpk	500039	นาย ไพศาล พงพนัส	ENI	MI	Staff	18		2025-11-04 14:41:49.692	2025-11-04 14:41:49.692	\N	\N	\N	\N	Support	\N
512	xba7ta1zd20hmyn6156thkpk	500039	นาย ไพศาล พงพนัส	ENI	MI	Staff	18		2025-11-04 14:41:49.692	2025-11-04 14:41:49.692	2025-11-04 14:41:49.698	\N	\N	\N	Support	\N
515	yxzt1nn9akcgaz3c5vp7ghm1	500062	น.ส. ศิวนาถ สมนึก	MKT	SL	Leader	18		2025-11-04 14:41:49.773	2025-11-04 14:41:49.773	\N	\N	\N	\N	Non Production	\N
516	yxzt1nn9akcgaz3c5vp7ghm1	500062	น.ส. ศิวนาถ สมนึก	MKT	SL	Leader	18		2025-11-04 14:41:49.773	2025-11-04 14:41:49.773	2025-11-04 14:41:49.778	\N	\N	\N	Non Production	\N
519	fuo728c6zgurg9uw0ynviygt	500071	นาย จาตุรงค์ ทัศน์จันดา	PCM	Q-GATE	Staff	18		2025-11-04 14:41:49.863	2025-11-04 14:41:49.863	\N	\N	\N	\N	Support	\N
520	fuo728c6zgurg9uw0ynviygt	500071	นาย จาตุรงค์ ทัศน์จันดา	PCM	Q-GATE	Staff	18		2025-11-04 14:41:49.863	2025-11-04 14:41:49.863	2025-11-04 14:41:49.868	\N	\N	\N	Support	\N
523	uenl8xp345j1413axt4zej8u	500073	น.ส. ปัทมา มีปัญญา	PDT3	WB	Staff	18		2025-11-04 14:41:49.944	2025-11-04 14:41:49.944	\N	\N	\N	\N	Production	\N
524	uenl8xp345j1413axt4zej8u	500073	น.ส. ปัทมา มีปัญญา	PDT3	WB	Staff	18		2025-11-04 14:41:49.944	2025-11-04 14:41:49.944	2025-11-04 14:41:49.948	\N	\N	\N	Production	\N
527	p1z8uqevkguj4bejtyiffdww	500079	นาย อดิศักดิ์ คำชนะ	PDT3	BZ	Staff	18		2025-11-04 14:41:50.026	2025-11-04 14:41:50.026	\N	\N	\N	\N	Production	\N
528	p1z8uqevkguj4bejtyiffdww	500079	นาย อดิศักดิ์ คำชนะ	PDT3	BZ	Staff	18		2025-11-04 14:41:50.026	2025-11-04 14:41:50.026	2025-11-04 14:41:50.031	\N	\N	\N	Production	\N
518	ps23mdskrexj7sf5yh3649se	500063	นาย ธนกฤต แย้มยิ้ม	HRD	GA	Staff	18		2025-11-04 14:41:49.802	2025-11-04 14:41:49.802	2025-11-04 14:41:49.823	\N	\N	\N	Non Production	\N
521	zyx05xfz37h1mc03r794etmy	500072	นาย ไมตรี พรมหากุล	QAD	QC2	Leader	18		2025-11-04 14:41:49.905	2025-11-04 14:41:49.905	\N	\N	\N	\N	Support	\N
522	zyx05xfz37h1mc03r794etmy	500072	นาย ไมตรี พรมหากุล	QAD	QC2	Leader	18		2025-11-04 14:41:49.905	2025-11-04 14:41:49.905	2025-11-04 14:41:49.91	\N	\N	\N	Support	\N
525	nun36d36rz27slqd4y9dssfv	500076	นาย เรวัตร กองนางอ้ม	HRD	EF	Staff	18		2025-11-04 14:41:49.986	2025-11-04 14:41:49.986	\N	\N	\N	\N	Non Production	\N
526	nun36d36rz27slqd4y9dssfv	500076	นาย เรวัตร กองนางอ้ม	HRD	EF	Staff	18		2025-11-04 14:41:49.986	2025-11-04 14:41:49.986	2025-11-04 14:41:49.991	\N	\N	\N	Non Production	\N
529	mld7wot1py6v2np7oh8zv5pd	500082	น.ส. ธิดารัตน์ ศรีหะดม	PDT3	WB	Staff	18		2025-11-04 14:41:50.067	2025-11-04 14:41:50.067	\N	\N	\N	\N	Production	\N
530	mld7wot1py6v2np7oh8zv5pd	500082	น.ส. ธิดารัตน์ ศรีหะดม	PDT3	WB	Staff	18		2025-11-04 14:41:50.067	2025-11-04 14:41:50.067	2025-11-04 14:41:50.072	\N	\N	\N	Production	\N
533	f5eepzurk62u7nrznkkm98te	500085	นาย ทวี อนุมาตย์	PDT3	GM	Staff	18		2025-11-04 14:41:50.154	2025-11-04 14:41:50.154	\N	\N	\N	\N	Production	\N
534	f5eepzurk62u7nrznkkm98te	500085	นาย ทวี อนุมาตย์	PDT3	GM	Staff	18		2025-11-04 14:41:50.154	2025-11-04 14:41:50.154	2025-11-04 14:41:50.175	\N	\N	\N	Production	\N
537	j7wmwg45mvoyhdw9ghrfifeq	500087	น.ส. จิดาภา ปักสีระเก	PDT3	WB	Staff	18		2025-11-04 14:41:50.278	2025-11-04 14:41:50.278	\N	\N	\N	\N	Production	\N
538	j7wmwg45mvoyhdw9ghrfifeq	500087	น.ส. จิดาภา ปักสีระเก	PDT3	WB	Staff	18		2025-11-04 14:41:50.278	2025-11-04 14:41:50.278	2025-11-04 14:41:50.303	\N	\N	\N	Production	\N
541	fzpwai8vzb0swvhkc6jak8ob	500090	นาย บุญรอด ยิ่งเชิดงาม	PDT2	OQ	Staff	18		2025-11-04 14:41:50.399	2025-11-04 14:41:50.399	\N	\N	\N	\N	Production	\N
542	fzpwai8vzb0swvhkc6jak8ob	500090	นาย บุญรอด ยิ่งเชิดงาม	PDT2	OQ	Staff	18		2025-11-04 14:41:50.399	2025-11-04 14:41:50.399	2025-11-04 14:41:50.403	\N	\N	\N	Production	\N
545	fz3qbj12kdtrk86gagxp5h7d	500102	นาย ธวัชชัย สีถัน	PDT3	GM	Staff	17		2025-11-04 14:41:50.487	2025-11-04 14:41:50.487	\N	\N	\N	\N	Production	\N
546	fz3qbj12kdtrk86gagxp5h7d	500102	นาย ธวัชชัย สีถัน	PDT3	GM	Staff	17		2025-11-04 14:41:50.487	2025-11-04 14:41:50.487	2025-11-04 14:41:50.493	\N	\N	\N	Production	\N
549	mmod35khc0g5y40y975v1kev	510003	นาย บรรเจิด เปอร์เชาว์	PDT4	JP	Junior	17		2025-11-04 14:41:50.573	2025-11-04 14:41:50.573	\N	\N	\N	\N	Production	\N
550	mmod35khc0g5y40y975v1kev	510003	นาย บรรเจิด เปอร์เชาว์	PDT4	JP	Junior	17		2025-11-04 14:41:50.573	2025-11-04 14:41:50.573	2025-11-04 14:41:50.581	\N	\N	\N	Production	\N
553	e0cc540n58i7c7xskmhcnuz4	510012	น.ส. ณัฐชานันท์ พิมพ์ไชย	PDT4	JA	Staff	17		2025-11-04 14:41:50.65	2025-11-04 14:41:50.65	\N	\N	\N	\N	Production	\N
554	e0cc540n58i7c7xskmhcnuz4	510012	น.ส. ณัฐชานันท์ พิมพ์ไชย	PDT4	JA	Staff	17		2025-11-04 14:41:50.65	2025-11-04 14:41:50.65	2025-11-04 14:41:50.67	\N	\N	\N	Production	\N
557	nv1bmpnxgg9fjw3f2j4wi7jk	510019	น.ส. ราตรี ส้มสาย	PDT3	WB	Staff	17		2025-11-04 14:41:50.748	2025-11-04 14:41:50.748	\N	\N	\N	\N	Production	\N
558	nv1bmpnxgg9fjw3f2j4wi7jk	510019	น.ส. ราตรี ส้มสาย	PDT3	WB	Staff	17		2025-11-04 14:41:50.748	2025-11-04 14:41:50.748	2025-11-04 14:41:50.754	\N	\N	\N	Production	\N
561	zwkfcfl1durmjadz5rmmuksn	510025	น.ส. ปานิชาติ ทรงกลิ่นจันทร์	PCM	ST	Staff	17		2025-11-04 14:41:50.831	2025-11-04 14:41:50.831	\N	\N	\N	\N	Support	\N
562	zwkfcfl1durmjadz5rmmuksn	510025	น.ส. ปานิชาติ ทรงกลิ่นจันทร์	PCM	ST	Staff	17		2025-11-04 14:41:50.831	2025-11-04 14:41:50.831	2025-11-04 14:41:50.835	\N	\N	\N	Support	\N
565	hzux5el45a8pflfo30bae130	510031	นาย มนูญ หวลสันเทียะ	PDT3	GM	Leader	17		2025-11-04 14:41:50.914	2025-11-04 14:41:50.914	\N	\N	\N	\N	Production	\N
566	hzux5el45a8pflfo30bae130	510031	นาย มนูญ หวลสันเทียะ	PDT3	GM	Leader	17		2025-11-04 14:41:50.914	2025-11-04 14:41:50.914	2025-11-04 14:41:50.919	\N	\N	\N	Production	\N
569	t2in9qg277g7dvn5v5i9u1kk	510034	น.ส. กัญจนรัตน์ อรบุตร	HRD	GA	Staff	17		2025-11-04 14:41:50.999	2025-11-04 14:41:50.999	\N	\N	\N	\N	Non Production	\N
570	t2in9qg277g7dvn5v5i9u1kk	510034	น.ส. กัญจนรัตน์ อรบุตร	HRD	GA	Staff	17		2025-11-04 14:41:50.999	2025-11-04 14:41:50.999	2025-11-04 14:41:51.003	\N	\N	\N	Non Production	\N
573	a2dqzp9j8wwgrptt8aoo3h0e	510037	น.ส. น้ำผึ้ง พรีพรม	PDT4	UB	Junior	17		2025-11-04 14:41:51.067	2025-11-04 14:41:51.067	\N	\N	\N	\N	Production	\N
574	a2dqzp9j8wwgrptt8aoo3h0e	510037	น.ส. น้ำผึ้ง พรีพรม	PDT4	UB	Junior	17		2025-11-04 14:41:51.067	2025-11-04 14:41:51.067	2025-11-04 14:41:51.087	\N	\N	\N	Production	\N
577	d3fo2m1l0ulmh90sbzppfvs3	510044	นาย อนุรักษ์ ด่านนอก	PDT2	OQ	Junior	17		2025-11-04 14:41:51.146	2025-11-04 14:41:51.146	\N	\N	\N	\N	Production	\N
578	d3fo2m1l0ulmh90sbzppfvs3	510044	นาย อนุรักษ์ ด่านนอก	PDT2	OQ	Junior	17		2025-11-04 14:41:51.146	2025-11-04 14:41:51.146	2025-11-04 14:41:51.152	\N	\N	\N	Production	\N
581	qa8vlka55zma8r9lj1641i44	510049	นาย หมอก ทองสาย	PCM	Q-GATE	Junior	17		2025-11-04 14:41:51.24	2025-11-04 14:41:51.24	\N	\N	\N	\N	Support	\N
582	qa8vlka55zma8r9lj1641i44	510049	นาย หมอก ทองสาย	PCM	Q-GATE	Junior	17		2025-11-04 14:41:51.24	2025-11-04 14:41:51.24	2025-11-04 14:41:51.25	\N	\N	\N	Support	\N
585	bw0f8z0egk6ekbzu2pi4usbs	510053	น.ส. กลิ่นประทุม เกษกุล	PDT3	WB	Staff	17		2025-11-04 14:41:51.324	2025-11-04 14:41:51.324	\N	\N	\N	\N	Production	\N
586	bw0f8z0egk6ekbzu2pi4usbs	510053	น.ส. กลิ่นประทุม เกษกุล	PDT3	WB	Staff	17		2025-11-04 14:41:51.324	2025-11-04 14:41:51.324	2025-11-04 14:41:51.328	\N	\N	\N	Production	\N
589	vn53qgfxn08aab3nqenmi8v2	510056	น.ส. สุธิพา คำเขียว	PDT3	WB	Staff	17		2025-11-04 14:41:51.408	2025-11-04 14:41:51.408	\N	\N	\N	\N	Production	\N
590	vn53qgfxn08aab3nqenmi8v2	510056	น.ส. สุธิพา คำเขียว	PDT3	WB	Staff	17		2025-11-04 14:41:51.408	2025-11-04 14:41:51.408	2025-11-04 14:41:51.415	\N	\N	\N	Production	\N
593	mahn5ts68z2ylctatx96b3bt	510069	นาย รณยุทธ ครุฑสร้อย	PDT3	BZ	Staff	17		2025-11-04 14:41:51.497	2025-11-04 14:41:51.497	\N	\N	\N	\N	Production	\N
594	mahn5ts68z2ylctatx96b3bt	510069	นาย รณยุทธ ครุฑสร้อย	PDT3	BZ	Staff	17		2025-11-04 14:41:51.497	2025-11-04 14:41:51.497	2025-11-04 14:41:51.516	\N	\N	\N	Production	\N
61	vkks8nttb7193lobv6l8uitl	380006	นาง กุลนิษฐ์ พึ่งสามัคคี	HRD	HR	Junior	19	เข้าอบรม	2025-11-04 14:41:38.815	2025-11-05 14:41:26.697	\N	\N	1	\N	Non Production	\N
531	g9ezvhlcwr70kz8yza68avfw	500083	นาย อดิศร นิลสว่าง	PCM	PK	Staff	18		2025-11-04 14:41:50.107	2025-11-04 14:41:50.107	\N	\N	\N	\N	Support	\N
532	g9ezvhlcwr70kz8yza68avfw	500083	นาย อดิศร นิลสว่าง	PCM	PK	Staff	18		2025-11-04 14:41:50.107	2025-11-04 14:41:50.107	2025-11-04 14:41:50.114	\N	\N	\N	Support	\N
535	h84ixmb9v160mge9dcb18xz5	500086	นาย ประจวบ เขือนอก	PDT3	GM	Staff	18		2025-11-04 14:41:50.223	2025-11-04 14:41:50.223	\N	\N	\N	\N	Production	\N
536	h84ixmb9v160mge9dcb18xz5	500086	นาย ประจวบ เขือนอก	PDT3	GM	Staff	18		2025-11-04 14:41:50.223	2025-11-04 14:41:50.223	2025-11-04 14:41:50.234	\N	\N	\N	Production	\N
539	w09mmicd1b4c1p219hqysii4	500089	นาง พรพิศ สารปรัง	QAD	IP	Staff	18		2025-11-04 14:41:50.351	2025-11-04 14:41:50.351	\N	\N	\N	\N	Support	\N
540	w09mmicd1b4c1p219hqysii4	500089	นาง พรพิศ สารปรัง	QAD	IP	Staff	18		2025-11-04 14:41:50.351	2025-11-04 14:41:50.351	2025-11-04 14:41:50.361	\N	\N	\N	Support	\N
543	ap07muv8g7dmyb5j6wohmaef	500096	นาย สุวิทย์ แตงชัยภูมิ	PCM	TP	Junior	18		2025-11-04 14:41:50.425	2025-11-04 14:41:50.425	\N	\N	\N	\N	Support	\N
544	ap07muv8g7dmyb5j6wohmaef	500096	นาย สุวิทย์ แตงชัยภูมิ	PCM	TP	Junior	18		2025-11-04 14:41:50.425	2025-11-04 14:41:50.425	2025-11-04 14:41:50.443	\N	\N	\N	Support	\N
547	ls3j9jxcj3tq64uvlh81zbyr	510001	นาย พุฒิพงศ์ พรทรัพย์สิน	PDT2	OQ	Staff	17		2025-11-04 14:41:50.529	2025-11-04 14:41:50.529	\N	\N	\N	\N	Production	\N
548	ls3j9jxcj3tq64uvlh81zbyr	510001	นาย พุฒิพงศ์ พรทรัพย์สิน	PDT2	OQ	Staff	17		2025-11-04 14:41:50.529	2025-11-04 14:41:50.529	2025-11-04 14:41:50.535	\N	\N	\N	Production	\N
551	mbgs2a6ecjphjvl3lb1vttgm	510010	นาย สายันต์ จันทะแจ่ม	PDT4	JA	Staff	17		2025-11-04 14:41:50.623	2025-11-04 14:41:50.623	\N	\N	\N	\N	Production	\N
552	mbgs2a6ecjphjvl3lb1vttgm	510010	นาย สายันต์ จันทะแจ่ม	PDT4	JA	Staff	17		2025-11-04 14:41:50.623	2025-11-04 14:41:50.623	2025-11-04 14:41:50.628	\N	\N	\N	Production	\N
555	i6gcr825bdypeeqp546f7ufm	510015	น.ส. เกษกนก ศิริวัฒน์	PDT3	WB	Leader	17		2025-11-04 14:41:50.718	2025-11-04 14:41:50.718	\N	\N	\N	\N	Production	\N
556	i6gcr825bdypeeqp546f7ufm	510015	น.ส. เกษกนก ศิริวัฒน์	PDT3	WB	Leader	17		2025-11-04 14:41:50.718	2025-11-04 14:41:50.718	2025-11-04 14:41:50.724	\N	\N	\N	Production	\N
559	tox4kmmjtqjwqoro5jsrt0sw	510021	น.ส. ศศิธร รัตนอาจ	QAD	IP	Staff	17		2025-11-04 14:41:50.793	2025-11-04 14:41:50.793	\N	\N	\N	\N	Support	\N
560	tox4kmmjtqjwqoro5jsrt0sw	510021	น.ส. ศศิธร รัตนอาจ	QAD	IP	Staff	17		2025-11-04 14:41:50.793	2025-11-04 14:41:50.793	2025-11-04 14:41:50.797	\N	\N	\N	Support	\N
563	ngc7skthv1h20783r2nmq0xg	510026	นาย อุดมศักดิ์ ปราบคะเชนทร์	PDM	PC	Leader	17		2025-11-04 14:41:50.855	2025-11-04 14:41:50.855	\N	\N	\N	\N	Support	\N
564	ngc7skthv1h20783r2nmq0xg	510026	นาย อุดมศักดิ์ ปราบคะเชนทร์	PDM	PC	Leader	17		2025-11-04 14:41:50.855	2025-11-04 14:41:50.855	2025-11-04 14:41:50.861	\N	\N	\N	Support	\N
567	ht931nswlcnif8q1ttptg9d9	510033	นาย สุดใจ กันญานัด	PDM	FC	Staff	17		2025-11-04 14:41:50.957	2025-11-04 14:41:50.957	\N	\N	\N	\N	Support	\N
568	ht931nswlcnif8q1ttptg9d9	510033	นาย สุดใจ กันญานัด	PDM	FC	Staff	17		2025-11-04 14:41:50.957	2025-11-04 14:41:50.957	2025-11-04 14:41:50.962	\N	\N	\N	Support	\N
571	icik5jobuvdlrdn6oelzdgxa	510036	นาง จารุวรรณ นระแสน	PDT3	WB	Leader	17		2025-11-04 14:41:51.038	2025-11-04 14:41:51.038	\N	\N	\N	\N	Production	\N
572	icik5jobuvdlrdn6oelzdgxa	510036	นาง จารุวรรณ นระแสน	PDT3	WB	Leader	17		2025-11-04 14:41:51.038	2025-11-04 14:41:51.038	2025-11-04 14:41:51.044	\N	\N	\N	Production	\N
575	jnqy73utkzah8xwbpvgjsmlu	510040	น.ส. วรดา ลาภรัตน์	PDT4	UB	Staff	17		2025-11-04 14:41:51.107	2025-11-04 14:41:51.107	\N	\N	\N	\N	Production	\N
576	jnqy73utkzah8xwbpvgjsmlu	510040	น.ส. วรดา ลาภรัตน์	PDT4	UB	Staff	17		2025-11-04 14:41:51.107	2025-11-04 14:41:51.107	2025-11-04 14:41:51.112	\N	\N	\N	Production	\N
579	shhp26rtixhmh25tqn1f4336	510047	นาย วิคิด จรอนันต์	QAD	QC2	Junior	17		2025-11-04 14:41:51.194	2025-11-04 14:41:51.194	\N	\N	\N	\N	Support	\N
580	shhp26rtixhmh25tqn1f4336	510047	นาย วิคิด จรอนันต์	QAD	QC2	Junior	17		2025-11-04 14:41:51.194	2025-11-04 14:41:51.194	2025-11-04 14:41:51.206	\N	\N	\N	Support	\N
583	xf5bhlrgk97ssvh63hw272o3	510051	นาย สุชาติ อันทะศรี	PCM	ST	Staff	17		2025-11-04 14:41:51.284	2025-11-04 14:41:51.284	\N	\N	\N	\N	Support	\N
584	xf5bhlrgk97ssvh63hw272o3	510051	นาย สุชาติ อันทะศรี	PCM	ST	Staff	17		2025-11-04 14:41:51.284	2025-11-04 14:41:51.284	2025-11-04 14:41:51.289	\N	\N	\N	Support	\N
587	fsp4o7cpht3quk2zylklmxvc	510054	นาง ดาวอำไพ ปะทักขินัง	PDT4	UB	Staff	17		2025-11-04 14:41:51.35	2025-11-04 14:41:51.35	\N	\N	\N	\N	Production	\N
588	fsp4o7cpht3quk2zylklmxvc	510054	นาง ดาวอำไพ ปะทักขินัง	PDT4	UB	Staff	17		2025-11-04 14:41:51.35	2025-11-04 14:41:51.35	2025-11-04 14:41:51.355	\N	\N	\N	Production	\N
591	aiughlum3a2s52x3v3p1m6nf	510063	นาย ชาญชัย กล่อมเกลี้ยง	PDM	IT	Leader	17		2025-11-04 14:41:51.452	2025-11-04 14:41:51.452	\N	\N	\N	\N	Support	\N
592	aiughlum3a2s52x3v3p1m6nf	510063	นาย ชาญชัย กล่อมเกลี้ยง	PDM	IT	Leader	17		2025-11-04 14:41:51.452	2025-11-04 14:41:51.452	2025-11-04 14:41:51.457	\N	\N	\N	Support	\N
595	a2wzgs0214unod6jjsi2y0of	510073	น.ส. อนัญญา ตันยอด	QAD	QC2	Staff	17		2025-11-04 14:41:51.542	2025-11-04 14:41:51.542	\N	\N	\N	\N	Support	\N
596	a2wzgs0214unod6jjsi2y0of	510073	น.ส. อนัญญา ตันยอด	QAD	QC2	Staff	17		2025-11-04 14:41:51.542	2025-11-04 14:41:51.542	2025-11-04 14:41:51.546	\N	\N	\N	Support	\N
597	ytbj883elv1ffhyxd4mqt5ls	510074	นาย วุฒิพงศ์ เดาะขุนทด	PDM	FC	Staff	17		2025-11-04 14:41:51.588	2025-11-04 14:41:51.588	\N	\N	\N	\N	Support	\N
598	ytbj883elv1ffhyxd4mqt5ls	510074	นาย วุฒิพงศ์ เดาะขุนทด	PDM	FC	Staff	17		2025-11-04 14:41:51.588	2025-11-04 14:41:51.588	2025-11-04 14:41:51.597	\N	\N	\N	Support	\N
599	abzkcz92a68zeuy3i79akmj9	510078	นาย พงศ์พิพัฒน์ สิงหนาท	PCM	CB	Staff	17		2025-11-04 14:41:51.645	2025-11-04 14:41:51.645	\N	\N	\N	\N	Support	\N
600	abzkcz92a68zeuy3i79akmj9	510078	นาย พงศ์พิพัฒน์ สิงหนาท	PCM	CB	Staff	17		2025-11-04 14:41:51.645	2025-11-04 14:41:51.645	2025-11-04 14:41:51.652	\N	\N	\N	Support	\N
601	xb24rjh8jz2ssf11iewosrvw	510079	นาย บุญชัย ทวีชาติ	PDT4	US	Staff	17		2025-11-04 14:41:51.688	2025-11-04 14:41:51.688	\N	\N	\N	\N	Production	\N
602	xb24rjh8jz2ssf11iewosrvw	510079	นาย บุญชัย ทวีชาติ	PDT4	US	Staff	17		2025-11-04 14:41:51.688	2025-11-04 14:41:51.688	2025-11-04 14:41:51.694	\N	\N	\N	Production	\N
603	jr18pksyzdu2ccsqxfqkgdmy	510083	น.ส. ดวงจันทร์ สิงห์แก้ว	PCM	ST	Junior	17		2025-11-04 14:41:51.735	2025-11-04 14:41:51.735	\N	\N	\N	\N	Support	\N
604	jr18pksyzdu2ccsqxfqkgdmy	510083	น.ส. ดวงจันทร์ สิงห์แก้ว	PCM	ST	Junior	17		2025-11-04 14:41:51.735	2025-11-04 14:41:51.735	2025-11-04 14:41:51.741	\N	\N	\N	Support	\N
607	k4rpkjydc17w1spmjkiqielj	510085	นาย อาทิตย์ ธรรมโชติ	PCM	ST	Staff	17		2025-11-04 14:41:51.826	2025-11-04 14:41:51.826	\N	\N	\N	\N	Support	\N
608	k4rpkjydc17w1spmjkiqielj	510085	นาย อาทิตย์ ธรรมโชติ	PCM	ST	Staff	17		2025-11-04 14:41:51.826	2025-11-04 14:41:51.826	2025-11-04 14:41:51.833	\N	\N	\N	Support	\N
611	bmq5stvj7yicsx28d1tvcow5	510089	นาย พรชัย อัฐนาค	PDT1	NT	Staff	17		2025-11-04 14:41:51.919	2025-11-04 14:41:51.919	\N	\N	\N	\N	Production	\N
612	bmq5stvj7yicsx28d1tvcow5	510089	นาย พรชัย อัฐนาค	PDT1	NT	Staff	17		2025-11-04 14:41:51.919	2025-11-04 14:41:51.919	2025-11-04 14:41:51.926	\N	\N	\N	Production	\N
615	szcn3kec4lzrxc2xbrc13bot	510095	นาย นิรันดร ภูพิพัฒน์	PDT1	M8	Leader	17		2025-11-04 14:41:52.01	2025-11-04 14:41:52.01	\N	\N	\N	\N	Production	\N
616	szcn3kec4lzrxc2xbrc13bot	510095	นาย นิรันดร ภูพิพัฒน์	PDT1	M8	Leader	17		2025-11-04 14:41:52.01	2025-11-04 14:41:52.01	2025-11-04 14:41:52.017	\N	\N	\N	Production	\N
619	gg4ny1jx3kwwfwycd47j81ur	510101	นาย เดี่ยว สาทอง	PDT4	JM	Leader	17	เข้าอบรม	2025-11-04 14:41:52.1	2025-11-04 14:41:52.1	\N	\N	\N	\N	Production	\N
620	gg4ny1jx3kwwfwycd47j81ur	510101	นาย เดี่ยว สาทอง	PDT4	JM	Leader	17	เข้าอบรม	2025-11-04 14:41:52.1	2025-11-04 14:41:52.1	2025-11-04 14:41:52.105	\N	\N	\N	Production	\N
623	okpwzmmu722fdmox097io8oz	510103	นาง เอมิกา เปอร์เชาว์	PDT4	JA	Staff	17		2025-11-04 14:41:52.199	2025-11-04 14:41:52.199	\N	\N	\N	\N	Production	\N
624	okpwzmmu722fdmox097io8oz	510103	นาง เอมิกา เปอร์เชาว์	PDT4	JA	Staff	17		2025-11-04 14:41:52.199	2025-11-04 14:41:52.199	2025-11-04 14:41:52.205	\N	\N	\N	Production	\N
627	j432grgyg9shkaug2n9gxajl	520007	น.ส. ชุติมา สังข์บัวแก้ว	PDT4	JP	Staff	16		2025-11-04 14:41:52.29	2025-11-04 14:41:52.29	\N	\N	\N	\N	Production	\N
628	j432grgyg9shkaug2n9gxajl	520007	น.ส. ชุติมา สังข์บัวแก้ว	PDT4	JP	Staff	16		2025-11-04 14:41:52.29	2025-11-04 14:41:52.29	2025-11-04 14:41:52.297	\N	\N	\N	Production	\N
631	zje9rchcxzjtlgwj0a5x0crp	520010	น.ส. นัจภาพรรณ จิตรวัฒธัมสกุล	FNC	AC	Staff	16		2025-11-04 14:41:52.37	2025-11-04 14:41:52.37	\N	\N	\N	\N	Non Production	\N
632	zje9rchcxzjtlgwj0a5x0crp	520010	น.ส. นัจภาพรรณ จิตรวัฒธัมสกุล	FNC	AC	Staff	16		2025-11-04 14:41:52.37	2025-11-04 14:41:52.37	2025-11-04 14:41:52.388	\N	\N	\N	Non Production	\N
635	svp81zfcvbn5c4wlgl3k5kjr	520015	นาง กัญญณัช ศรีอัครเดช	PCM	PK	Staff	16		2025-11-04 14:41:52.458	2025-11-04 14:41:52.458	\N	\N	\N	\N	Support	\N
636	svp81zfcvbn5c4wlgl3k5kjr	520015	นาง กัญญณัช ศรีอัครเดช	PCM	PK	Staff	16		2025-11-04 14:41:52.458	2025-11-04 14:41:52.458	2025-11-04 14:41:52.476	\N	\N	\N	Support	\N
639	kn8fwu20yxpf5940dzkim4ca	520017	น.ส. จันทร์ยา ภูยางสิม	PCM	PK	Junior	16		2025-11-04 14:41:52.568	2025-11-04 14:41:52.568	\N	\N	\N	\N	Support	\N
640	kn8fwu20yxpf5940dzkim4ca	520017	น.ส. จันทร์ยา ภูยางสิม	PCM	PK	Junior	16		2025-11-04 14:41:52.568	2025-11-04 14:41:52.568	2025-11-04 14:41:52.574	\N	\N	\N	Support	\N
643	kwstw3e7kc3evehfxg87c6r3	520020	นาย ศักดิ์สุริยา มหาพรหม	HRD	GA	Staff	16		2025-11-04 14:41:52.661	2025-11-04 14:41:52.661	\N	\N	\N	\N	Non Production	\N
644	kwstw3e7kc3evehfxg87c6r3	520020	นาย ศักดิ์สุริยา มหาพรหม	HRD	GA	Staff	16		2025-11-04 14:41:52.661	2025-11-04 14:41:52.661	2025-11-04 14:41:52.667	\N	\N	\N	Non Production	\N
647	v5zh3q3ua0zdtf63l7gvqkho	520025	น.ส. สมยา สูงสันเขต	PCM	ST	Staff	16		2025-11-04 14:41:52.757	2025-11-04 14:41:52.757	\N	\N	\N	\N	Support	\N
648	v5zh3q3ua0zdtf63l7gvqkho	520025	น.ส. สมยา สูงสันเขต	PCM	ST	Staff	16		2025-11-04 14:41:52.757	2025-11-04 14:41:52.757	2025-11-04 14:41:52.764	\N	\N	\N	Support	\N
651	tlh2gkl740eiu221ba32alnb	530017	นาง แหม่ม กระศรี	PDT3	WB	Staff	15		2025-11-04 14:41:52.85	2025-11-04 14:41:52.85	\N	\N	\N	\N	Production	\N
652	tlh2gkl740eiu221ba32alnb	530017	นาง แหม่ม กระศรี	PDT3	WB	Staff	15		2025-11-04 14:41:52.85	2025-11-04 14:41:52.85	2025-11-04 14:41:52.856	\N	\N	\N	Production	\N
655	y3dqfd4ut8z9n6j8i34kmfm5	530020	น.ส. จิราพร เพชรรัตน์	PDT3	WB	Staff	15		2025-11-04 14:41:52.944	2025-11-04 14:41:52.944	\N	\N	\N	\N	Production	\N
656	y3dqfd4ut8z9n6j8i34kmfm5	530020	น.ส. จิราพร เพชรรัตน์	PDT3	WB	Staff	15		2025-11-04 14:41:52.944	2025-11-04 14:41:52.944	2025-11-04 14:41:52.95	\N	\N	\N	Production	\N
659	av30xnkki31rk8r14rb2uikd	530022	น.ส. จินตนา หาญจิตร	PCM	OR	Staff	15		2025-11-04 14:41:53.037	2025-11-04 14:41:53.037	\N	\N	\N	\N	Support	\N
660	av30xnkki31rk8r14rb2uikd	530022	น.ส. จินตนา หาญจิตร	PCM	OR	Staff	15		2025-11-04 14:41:53.037	2025-11-04 14:41:53.037	2025-11-04 14:41:53.045	\N	\N	\N	Support	\N
663	x3d5csd50b8dua9g5zk3y8lz	530028	นาย ไพโรจน์ ทองดี	QAD	QC2	Staff	15		2025-11-04 14:41:53.118	2025-11-04 14:41:53.118	\N	\N	\N	\N	Support	\N
664	x3d5csd50b8dua9g5zk3y8lz	530028	นาย ไพโรจน์ ทองดี	QAD	QC2	Staff	15		2025-11-04 14:41:53.118	2025-11-04 14:41:53.118	2025-11-04 14:41:53.14	\N	\N	\N	Support	\N
667	bvgdfv1fkan59h95k50qwgf1	530031	นาย สุเทพ ผลเจริญ	PDT3	BZ	Junior	15		2025-11-04 14:41:53.211	2025-11-04 14:41:53.211	\N	\N	\N	\N	Production	\N
668	bvgdfv1fkan59h95k50qwgf1	530031	นาย สุเทพ ผลเจริญ	PDT3	BZ	Junior	15		2025-11-04 14:41:53.211	2025-11-04 14:41:53.211	2025-11-04 14:41:53.232	\N	\N	\N	Production	\N
671	xfikzcil9todbqrzun6106ht	540012	นาย วิวัฒน์ สายผึ้ง	PDT1	EG	Junior	14		2025-11-04 14:41:53.319	2025-11-04 14:41:53.319	\N	\N	\N	\N	Production	\N
672	xfikzcil9todbqrzun6106ht	540012	นาย วิวัฒน์ สายผึ้ง	PDT1	EG	Junior	14		2025-11-04 14:41:53.319	2025-11-04 14:41:53.319	2025-11-04 14:41:53.327	\N	\N	\N	Production	\N
675	pme0agsb8129pqqmrthy6evt	540014	นาย ณรงค์ พ่อศรีชา	PDM	FC	Staff	14		2025-11-04 14:41:53.417	2025-11-04 14:41:53.417	\N	\N	\N	\N	Support	\N
676	pme0agsb8129pqqmrthy6evt	540014	นาย ณรงค์ พ่อศรีชา	PDM	FC	Staff	14		2025-11-04 14:41:53.417	2025-11-04 14:41:53.417	2025-11-04 14:41:53.423	\N	\N	\N	Support	\N
679	gqa45t600zbxkyybmhktlbi0	540019	นาง พานิช โทบุดดี	PDT4	JP	Staff	14		2025-11-04 14:41:53.51	2025-11-04 14:41:53.51	\N	\N	\N	\N	Production	\N
680	gqa45t600zbxkyybmhktlbi0	540019	นาง พานิช โทบุดดี	PDT4	JP	Staff	14		2025-11-04 14:41:53.51	2025-11-04 14:41:53.51	2025-11-04 14:41:53.518	\N	\N	\N	Production	\N
683	a1eoiztdxan8smcxb6exi7as	540024	นาย ศุภณัฐ จันทร์ทะวงษ์	PCM	ST	Staff	14		2025-11-04 14:41:53.605	2025-11-04 14:41:53.605	\N	\N	\N	\N	Support	\N
684	a1eoiztdxan8smcxb6exi7as	540024	นาย ศุภณัฐ จันทร์ทะวงษ์	PCM	ST	Staff	14		2025-11-04 14:41:53.605	2025-11-04 14:41:53.605	2025-11-04 14:41:53.612	\N	\N	\N	Support	\N
605	db15hscjekx29y2gtgefk97d	510084	นาย โชคชัย พันธ์จันทร์	PCM	ST	Staff	17		2025-11-04 14:41:51.782	2025-11-04 14:41:51.782	\N	\N	\N	\N	Support	\N
606	db15hscjekx29y2gtgefk97d	510084	นาย โชคชัย พันธ์จันทร์	PCM	ST	Staff	17		2025-11-04 14:41:51.782	2025-11-04 14:41:51.782	2025-11-04 14:41:51.788	\N	\N	\N	Support	\N
609	umgawal2nwgaufh66u07h0uh	510088	น.ส. วันณี จันทร์ทุมมา	QAD	QC2	Staff	17		2025-11-04 14:41:51.872	2025-11-04 14:41:51.872	\N	\N	\N	\N	Support	\N
610	umgawal2nwgaufh66u07h0uh	510088	น.ส. วันณี จันทร์ทุมมา	QAD	QC2	Staff	17		2025-11-04 14:41:51.872	2025-11-04 14:41:51.872	2025-11-04 14:41:51.877	\N	\N	\N	Support	\N
613	w3gmyzpq5dak611eizbkq3ih	510090	นาย สุวาทิน พงษ์ลุน	PDT1	NT	Staff	17		2025-11-04 14:41:51.966	2025-11-04 14:41:51.966	\N	\N	\N	\N	Production	\N
614	w3gmyzpq5dak611eizbkq3ih	510090	นาย สุวาทิน พงษ์ลุน	PDT1	NT	Staff	17		2025-11-04 14:41:51.966	2025-11-04 14:41:51.966	2025-11-04 14:41:51.973	\N	\N	\N	Production	\N
617	e3hoq9i5avpt56ypywhrys5z	510100	นาย สมบูรณ์ เผือกแสง	PDT4	JP	Junior	17		2025-11-04 14:41:52.057	2025-11-04 14:41:52.057	\N	\N	\N	\N	Production	\N
618	e3hoq9i5avpt56ypywhrys5z	510100	นาย สมบูรณ์ เผือกแสง	PDT4	JP	Junior	17		2025-11-04 14:41:52.057	2025-11-04 14:41:52.057	2025-11-04 14:41:52.062	\N	\N	\N	Production	\N
621	u5vcmbzwr75jf3cocj3r74dy	510102	นาย ชาญวิทย์ ปัญญา	PDT4	JM	Staff	17		2025-11-04 14:41:52.15	2025-11-04 14:41:52.15	\N	\N	\N	\N	Production	\N
622	u5vcmbzwr75jf3cocj3r74dy	510102	นาย ชาญวิทย์ ปัญญา	PDT4	JM	Staff	17		2025-11-04 14:41:52.15	2025-11-04 14:41:52.15	2025-11-04 14:41:52.162	\N	\N	\N	Production	\N
625	xx72mf14c9tip4a165724hlc	520003	นาย พงษ์ศักดิ์ สมัยพิมพ์	PDT4	JA	Staff	16		2025-11-04 14:41:52.245	2025-11-04 14:41:52.245	\N	\N	\N	\N	Production	\N
626	xx72mf14c9tip4a165724hlc	520003	นาย พงษ์ศักดิ์ สมัยพิมพ์	PDT4	JA	Staff	16		2025-11-04 14:41:52.245	2025-11-04 14:41:52.245	2025-11-04 14:41:52.25	\N	\N	\N	Production	\N
629	gx8gbsftpyc8igpz3zu7qjgx	520009	นาย ณรงค์ แสบงบาน	PCM	ST	Staff	16		2025-11-04 14:41:52.335	2025-11-04 14:41:52.335	\N	\N	\N	\N	Support	\N
630	gx8gbsftpyc8igpz3zu7qjgx	520009	นาย ณรงค์ แสบงบาน	PCM	ST	Staff	16		2025-11-04 14:41:52.335	2025-11-04 14:41:52.335	2025-11-04 14:41:52.342	\N	\N	\N	Support	\N
633	ogczqf39e0iwlni5v7lg9u6l	520013	นาย พรชัย เคนานันท์	PDM	PC	Leader	16		2025-11-04 14:41:52.427	2025-11-04 14:41:52.427	\N	\N	\N	\N	Support	\N
634	ogczqf39e0iwlni5v7lg9u6l	520013	นาย พรชัย เคนานันท์	PDM	PC	Leader	16		2025-11-04 14:41:52.427	2025-11-04 14:41:52.427	2025-11-04 14:41:52.433	\N	\N	\N	Support	\N
637	rfn62mbu1ozrja8wwxonbnw8	520016	นาง จันทร์เพ็ญ รัตนวงศ์	PCM	OR	Staff	16		2025-11-04 14:41:52.52	2025-11-04 14:41:52.52	\N	\N	\N	\N	Support	\N
638	rfn62mbu1ozrja8wwxonbnw8	520016	นาง จันทร์เพ็ญ รัตนวงศ์	PCM	OR	Staff	16		2025-11-04 14:41:52.52	2025-11-04 14:41:52.52	2025-11-04 14:41:52.526	\N	\N	\N	Support	\N
641	rwfk61fio1p24tm9mliy2ihz	520018	น.ส. ขวัญจิรา แสบงบาน	PCM	PK	Staff	16		2025-11-04 14:41:52.612	2025-11-04 14:41:52.612	\N	\N	\N	\N	Support	\N
642	rwfk61fio1p24tm9mliy2ihz	520018	น.ส. ขวัญจิรา แสบงบาน	PCM	PK	Staff	16		2025-11-04 14:41:52.612	2025-11-04 14:41:52.612	2025-11-04 14:41:52.618	\N	\N	\N	Support	\N
645	so1dft3kcupmd2zgxyy2onqs	520023	นาย ชิตพล เริญไธสง	PCM	ST	Staff	16		2025-11-04 14:41:52.707	2025-11-04 14:41:52.707	\N	\N	\N	\N	Support	\N
646	so1dft3kcupmd2zgxyy2onqs	520023	นาย ชิตพล เริญไธสง	PCM	ST	Staff	16		2025-11-04 14:41:52.707	2025-11-04 14:41:52.707	2025-11-04 14:41:52.713	\N	\N	\N	Support	\N
649	m8m04o5jo93y44ld9zatmlll	520027	นาย พูลทรัพย์ ศุภดี	PDM	FC	Staff	16		2025-11-04 14:41:52.804	2025-11-04 14:41:52.804	\N	\N	\N	\N	Support	\N
650	m8m04o5jo93y44ld9zatmlll	520027	นาย พูลทรัพย์ ศุภดี	PDM	FC	Staff	16		2025-11-04 14:41:52.804	2025-11-04 14:41:52.804	2025-11-04 14:41:52.81	\N	\N	\N	Support	\N
653	rr2ywfgefj2tq33cpyyf03jq	530019	น.ส. ลินดา ตะวังทัน	PDT3	WB	Staff	15		2025-11-04 14:41:52.896	2025-11-04 14:41:52.896	\N	\N	\N	\N	Production	\N
654	rr2ywfgefj2tq33cpyyf03jq	530019	น.ส. ลินดา ตะวังทัน	PDT3	WB	Staff	15		2025-11-04 14:41:52.896	2025-11-04 14:41:52.896	2025-11-04 14:41:52.904	\N	\N	\N	Production	\N
657	w00t16bf7m6coe43j447w3y2	530021	น.ส. อรพินท์ อั้วนา	PCM	OR	Foreman	15		2025-11-04 14:41:52.986	2025-11-04 14:41:52.986	\N	\N	\N	\N	Support	\N
658	w00t16bf7m6coe43j447w3y2	530021	น.ส. อรพินท์ อั้วนา	PCM	OR	Foreman	15		2025-11-04 14:41:52.986	2025-11-04 14:41:52.986	2025-11-04 14:41:52.998	\N	\N	\N	Support	\N
661	bdo9yj9ly98xybwnwec7qt2t	530023	นาง อรทัย สุขอนันต์	PDT3	WB	Staff	15		2025-11-04 14:41:53.084	2025-11-04 14:41:53.084	\N	\N	\N	\N	Production	\N
662	bdo9yj9ly98xybwnwec7qt2t	530023	นาง อรทัย สุขอนันต์	PDT3	WB	Staff	15		2025-11-04 14:41:53.084	2025-11-04 14:41:53.084	2025-11-04 14:41:53.09	\N	\N	\N	Production	\N
665	l1yt9m40yow70ph5hg09rmsl	530029	นาย ไพสานต์ จันทะแสน	PCM	TP	Staff	15		2025-11-04 14:41:53.179	2025-11-04 14:41:53.179	\N	\N	\N	\N	Support	\N
666	l1yt9m40yow70ph5hg09rmsl	530029	นาย ไพสานต์ จันทะแสน	PCM	TP	Staff	15		2025-11-04 14:41:53.179	2025-11-04 14:41:53.179	2025-11-04 14:41:53.186	\N	\N	\N	Support	\N
669	nxm120qlxn63y5hc8w3yjlxn	540011	น.ส. นัฐฐินี บัวดอก	PCM	OR	Staff	14		2025-11-04 14:41:53.275	2025-11-04 14:41:53.275	\N	\N	\N	\N	Support	\N
670	nxm120qlxn63y5hc8w3yjlxn	540011	น.ส. นัฐฐินี บัวดอก	PCM	OR	Staff	14		2025-11-04 14:41:53.275	2025-11-04 14:41:53.275	2025-11-04 14:41:53.29	\N	\N	\N	Support	\N
673	g1nlga7cuhpaqu443yecbem0	540013	นาย ปรีชา สุขดี	PDM	FC	Staff	14		2025-11-04 14:41:53.369	2025-11-04 14:41:53.369	\N	\N	\N	\N	Support	\N
674	g1nlga7cuhpaqu443yecbem0	540013	นาย ปรีชา สุขดี	PDM	FC	Staff	14		2025-11-04 14:41:53.369	2025-11-04 14:41:53.369	2025-11-04 14:41:53.376	\N	\N	\N	Support	\N
677	t8lyu4xc66pagh5ljx6m140c	540017	น.ส. สุทธิมล เจริญราช	PDT4	JP	Staff	14		2025-11-04 14:41:53.462	2025-11-04 14:41:53.462	\N	\N	\N	\N	Production	\N
678	t8lyu4xc66pagh5ljx6m140c	540017	น.ส. สุทธิมล เจริญราช	PDT4	JP	Staff	14		2025-11-04 14:41:53.462	2025-11-04 14:41:53.462	2025-11-04 14:41:53.469	\N	\N	\N	Production	\N
681	renceku3t2atcyk5mai7ia08	540021	น.ส. กัญญรัตน์ ผลมุข	PDT4	JA	Staff	14		2025-11-04 14:41:53.557	2025-11-04 14:41:53.557	\N	\N	\N	\N	Production	\N
682	renceku3t2atcyk5mai7ia08	540021	น.ส. กัญญรัตน์ ผลมุข	PDT4	JA	Staff	14		2025-11-04 14:41:53.557	2025-11-04 14:41:53.557	2025-11-04 14:41:53.563	\N	\N	\N	Production	\N
685	f8uwexs7oevfhjkc3nf9bvfz	540025	นาย วิรัตน์ แก้วลา	PDT1	M10	Staff	14		2025-11-04 14:41:53.651	2025-11-04 14:41:53.651	\N	\N	\N	\N	Production	\N
686	f8uwexs7oevfhjkc3nf9bvfz	540025	นาย วิรัตน์ แก้วลา	PDT1	M10	Staff	14		2025-11-04 14:41:53.651	2025-11-04 14:41:53.651	2025-11-04 14:41:53.657	\N	\N	\N	Production	\N
689	q0qz284u8pgw95l1gt301dwi	540032	นาย ไพรัตน์ สุนทรชัย	PDT1	M8	Staff	14		2025-11-04 14:41:53.74	2025-11-04 14:41:53.74	\N	\N	\N	\N	Production	\N
690	q0qz284u8pgw95l1gt301dwi	540032	นาย ไพรัตน์ สุนทรชัย	PDT1	M8	Staff	14		2025-11-04 14:41:53.74	2025-11-04 14:41:53.74	2025-11-04 14:41:53.746	\N	\N	\N	Production	\N
693	e6kkh1jpxh2cpr3t9e42nbra	550015	นาย มณฑล ขำหริ่ง	PDM	FC	Junior	13	เข้าอบรม	2025-11-04 14:41:53.833	2025-11-04 14:41:53.833	\N	\N	\N	\N	Support	\N
694	e6kkh1jpxh2cpr3t9e42nbra	550015	นาย มณฑล ขำหริ่ง	PDM	FC	Junior	13	เข้าอบรม	2025-11-04 14:41:53.833	2025-11-04 14:41:53.833	2025-11-04 14:41:53.839	\N	\N	\N	Support	\N
697	aq3stpcpv8l9ncyqzgxcqlaw	550028	นาง ต้อม จันทะบุตร	PDT4	JP	Staff	13		2025-11-04 14:41:53.927	2025-11-04 14:41:53.927	\N	\N	\N	\N	Production	\N
698	aq3stpcpv8l9ncyqzgxcqlaw	550028	นาง ต้อม จันทะบุตร	PDT4	JP	Staff	13		2025-11-04 14:41:53.927	2025-11-04 14:41:53.927	2025-11-04 14:41:53.934	\N	\N	\N	Production	\N
701	fo3wi6n4rumhmf8z9ar647vg	550035	น.ส. เอมอร ศรีษะโคตร	PDT3	BZ	Staff	13		2025-11-04 14:41:54.019	2025-11-04 14:41:54.019	\N	\N	\N	\N	Production	\N
702	fo3wi6n4rumhmf8z9ar647vg	550035	น.ส. เอมอร ศรีษะโคตร	PDT3	BZ	Staff	13		2025-11-04 14:41:54.019	2025-11-04 14:41:54.019	2025-11-04 14:41:54.026	\N	\N	\N	Production	\N
705	ydjflgfai4zharv765xwg3at	550042	นาย สุริยัน เตือนสติ	PDT1	NT	Staff	13		2025-11-04 14:41:54.11	2025-11-04 14:41:54.11	\N	\N	\N	\N	Production	\N
706	ydjflgfai4zharv765xwg3at	550042	นาย สุริยัน เตือนสติ	PDT1	NT	Staff	13		2025-11-04 14:41:54.11	2025-11-04 14:41:54.11	2025-11-04 14:41:54.116	\N	\N	\N	Production	\N
713	pfd1c0j356n7cgza1wq9p8f5	550056	นาย ชานนท์ แก้วแกมทอง	PDT1	M10	Junior	13		2025-11-04 14:41:54.293	2025-11-04 14:41:54.293	\N	\N	\N	\N	Production	\N
714	pfd1c0j356n7cgza1wq9p8f5	550056	นาย ชานนท์ แก้วแกมทอง	PDT1	M10	Junior	13		2025-11-04 14:41:54.293	2025-11-04 14:41:54.293	2025-11-04 14:41:54.299	\N	\N	\N	Production	\N
717	km0205tbev5kmpoc3qruhb6l	550059	นาย ฤทธิ์ลือชา ลือคำหาญ	PCM	ST	Staff	13		2025-11-04 14:41:54.383	2025-11-04 14:41:54.383	\N	\N	\N	\N	Support	\N
718	km0205tbev5kmpoc3qruhb6l	550059	นาย ฤทธิ์ลือชา ลือคำหาญ	PCM	ST	Staff	13		2025-11-04 14:41:54.383	2025-11-04 14:41:54.383	2025-11-04 14:41:54.388	\N	\N	\N	Support	\N
721	o2bdjqdg7yq6rw5ygxflu5nb	550067	น.ส. นันทนา มีจิตอันสง่า	PUD	PU1	Staff	13		2025-11-04 14:41:54.478	2025-11-04 14:41:54.478	\N	\N	\N	\N	Non Production	\N
722	o2bdjqdg7yq6rw5ygxflu5nb	550067	น.ส. นันทนา มีจิตอันสง่า	PUD	PU1	Staff	13		2025-11-04 14:41:54.478	2025-11-04 14:41:54.478	2025-11-04 14:41:54.499	\N	\N	\N	Non Production	\N
725	r9uo2ogq6eq5ozyxrmpe0ojg	550069	นาย กีรติ แสงผาด	PDT3	BZ	Staff	13		2025-11-04 14:41:54.566	2025-11-04 14:41:54.566	\N	\N	\N	\N	Production	\N
726	r9uo2ogq6eq5ozyxrmpe0ojg	550069	นาย กีรติ แสงผาด	PDT3	BZ	Staff	13		2025-11-04 14:41:54.566	2025-11-04 14:41:54.566	2025-11-04 14:41:54.571	\N	\N	\N	Production	\N
729	frbrm5yzuyxwvqefdf53pxyp	550081	น.ส. จันทร์เพ็ญ เศียรเขียว	PDT1	NT	Staff	13		2025-11-04 14:41:54.655	2025-11-04 14:41:54.655	\N	\N	\N	\N	Production	\N
730	frbrm5yzuyxwvqefdf53pxyp	550081	น.ส. จันทร์เพ็ญ เศียรเขียว	PDT1	NT	Staff	13		2025-11-04 14:41:54.655	2025-11-04 14:41:54.655	2025-11-04 14:41:54.663	\N	\N	\N	Production	\N
733	xt7fi0u8iktws2rj5nmyncng	560007	นาง ใจยา หมวดจุ้ย	FNC	AC	Staff	12		2025-11-04 14:41:54.729	2025-11-04 14:41:54.729	\N	\N	\N	\N	Non Production	\N
734	xt7fi0u8iktws2rj5nmyncng	560007	นาง ใจยา หมวดจุ้ย	FNC	AC	Staff	12		2025-11-04 14:41:54.729	2025-11-04 14:41:54.729	2025-11-04 14:41:54.735	\N	\N	\N	Non Production	\N
737	fmu2k6nioyfnailkh9eyeoh6	560010	นาย ณัฐวุฒิ ประกอบศรี	PCM	ST	Staff	12		2025-11-04 14:41:54.816	2025-11-04 14:41:54.816	\N	\N	\N	\N	Support	\N
738	fmu2k6nioyfnailkh9eyeoh6	560010	นาย ณัฐวุฒิ ประกอบศรี	PCM	ST	Staff	12		2025-11-04 14:41:54.816	2025-11-04 14:41:54.816	2025-11-04 14:41:54.825	\N	\N	\N	Support	\N
741	spanlovfnsvf68w1u6p6jdik	560014	น.ส. อุทุมพร พรมย้อย	QAD	IP	Junior	12		2025-11-04 14:41:54.89	2025-11-04 14:41:54.89	\N	\N	\N	\N	Support	\N
742	spanlovfnsvf68w1u6p6jdik	560014	น.ส. อุทุมพร พรมย้อย	QAD	IP	Junior	12		2025-11-04 14:41:54.89	2025-11-04 14:41:54.89	2025-11-04 14:41:54.896	\N	\N	\N	Support	\N
745	jdc5ekqdpnt3cvb7tmn7e13r	560026	นาย กฤษฎากร ประการแก้ว	PDT3	WB	Foreman	12		2025-11-04 14:41:54.972	2025-11-04 14:41:54.972	\N	\N	\N	\N	Production	\N
746	jdc5ekqdpnt3cvb7tmn7e13r	560026	นาย กฤษฎากร ประการแก้ว	PDT3	WB	Foreman	12		2025-11-04 14:41:54.972	2025-11-04 14:41:54.972	2025-11-04 14:41:54.983	\N	\N	\N	Production	\N
749	lb7rizxeba3hyh3qzg7wpss0	560029	นาย เทวา แสวงชัย	PCM	PK	Staff	12		2025-11-04 14:41:55.065	2025-11-04 14:41:55.065	\N	\N	\N	\N	Support	\N
750	lb7rizxeba3hyh3qzg7wpss0	560029	นาย เทวา แสวงชัย	PCM	PK	Staff	12		2025-11-04 14:41:55.065	2025-11-04 14:41:55.065	2025-11-04 14:41:55.071	\N	\N	\N	Support	\N
753	zf29hfkssfaowu0rpe1md8eb	560042	นาย อภิเชษฐ์ ปิงใจ	PDM	PC	Junior	12		2025-11-04 14:41:55.15	2025-11-04 14:41:55.15	\N	\N	\N	\N	Support	\N
754	zf29hfkssfaowu0rpe1md8eb	560042	นาย อภิเชษฐ์ ปิงใจ	PDM	PC	Junior	12		2025-11-04 14:41:55.15	2025-11-04 14:41:55.15	2025-11-04 14:41:55.157	\N	\N	\N	Support	\N
757	ue6b0cuot9pl9zz9682knq12	560047	น.ส. ศิริลักษณ์ สินนอก	FNC	AC	Junior	12	เข้าอบรม	2025-11-04 14:41:55.24	2025-11-04 14:41:55.24	\N	\N	\N	\N	Non Production	\N
758	ue6b0cuot9pl9zz9682knq12	560047	น.ส. ศิริลักษณ์ สินนอก	FNC	AC	Junior	12	เข้าอบรม	2025-11-04 14:41:55.24	2025-11-04 14:41:55.24	2025-11-04 14:41:55.245	\N	\N	\N	Non Production	\N
761	wgl8lnuwncmstzhm6blusyg7	560051	นาย อัดชา ทิมินกุล	QAD	IP	Staff	12		2025-11-04 14:41:55.324	2025-11-04 14:41:55.324	\N	\N	\N	\N	Support	\N
762	wgl8lnuwncmstzhm6blusyg7	560051	นาย อัดชา ทิมินกุล	QAD	IP	Staff	12		2025-11-04 14:41:55.324	2025-11-04 14:41:55.324	2025-11-04 14:41:55.329	\N	\N	\N	Support	\N
765	opvgtid42lejc5vjrva1qj3n	560054	นาย ศิริชัย สังคะวัตร	PCM	ST	Staff	12		2025-11-04 14:41:55.396	2025-11-04 14:41:55.396	\N	\N	\N	\N	Support	\N
687	p9uxba8qxk5n7c952o6sze8p	540030	น.ส. ปิยะนัน บุญเทียม	FNC	AC	Staff	14		2025-11-04 14:41:53.695	2025-11-04 14:41:53.695	\N	\N	\N	\N	Non Production	\N
688	p9uxba8qxk5n7c952o6sze8p	540030	น.ส. ปิยะนัน บุญเทียม	FNC	AC	Staff	14		2025-11-04 14:41:53.695	2025-11-04 14:41:53.695	2025-11-04 14:41:53.701	\N	\N	\N	Non Production	\N
691	bnxdr1op0k2906kq9yiplmh7	540033	นาย วิทวัส เสนางคะบุตร	PDT4	JA	Staff	14		2025-11-04 14:41:53.787	2025-11-04 14:41:53.787	\N	\N	\N	\N	Production	\N
692	bnxdr1op0k2906kq9yiplmh7	540033	นาย วิทวัส เสนางคะบุตร	PDT4	JA	Staff	14		2025-11-04 14:41:53.787	2025-11-04 14:41:53.787	2025-11-04 14:41:53.808	\N	\N	\N	Production	\N
695	si834edkdlx3wakezn50jr79	550017	นาย อุทัย แสนลุน	PDM	FC	Staff	13		2025-11-04 14:41:53.878	2025-11-04 14:41:53.878	\N	\N	\N	\N	Support	\N
696	si834edkdlx3wakezn50jr79	550017	นาย อุทัย แสนลุน	PDM	FC	Staff	13		2025-11-04 14:41:53.878	2025-11-04 14:41:53.878	2025-11-04 14:41:53.884	\N	\N	\N	Support	\N
699	g337yzffuslh5m2xs7kuk2m6	550029	น.ส. ศศิพร แน่นอุดร	PDT4	JA	Staff	13		2025-11-04 14:41:53.972	2025-11-04 14:41:53.972	\N	\N	\N	\N	Production	\N
700	g337yzffuslh5m2xs7kuk2m6	550029	น.ส. ศศิพร แน่นอุดร	PDT4	JA	Staff	13		2025-11-04 14:41:53.972	2025-11-04 14:41:53.972	2025-11-04 14:41:53.978	\N	\N	\N	Production	\N
707	pqf0w1wj4xor74g2srw5xhab	550045	นาย วงศกร แจ่มจันทร์	PDT4	EL	Staff	13		2025-11-04 14:41:54.141	2025-11-04 14:41:54.141	\N	\N	\N	\N	Production	\N
708	pqf0w1wj4xor74g2srw5xhab	550045	นาย วงศกร แจ่มจันทร์	PDT4	EL	Staff	13		2025-11-04 14:41:54.141	2025-11-04 14:41:54.141	2025-11-04 14:41:54.161	\N	\N	\N	Production	\N
711	uecfzaf424fl70d4aj4jdd99	550055	นาย ปิยพงษ์ วงษ์จันทอง	PDM	PC	Staff	13		2025-11-04 14:41:54.247	2025-11-04 14:41:54.247	\N	\N	\N	\N	Support	\N
712	uecfzaf424fl70d4aj4jdd99	550055	นาย ปิยพงษ์ วงษ์จันทอง	PDM	PC	Staff	13		2025-11-04 14:41:54.247	2025-11-04 14:41:54.247	2025-11-04 14:41:54.253	\N	\N	\N	Support	\N
715	addv6rsqncuh32e9fzknnsbf	550057	นาย อานนท์ ชูตระกูล	PDT1	M8	Staff	13		2025-11-04 14:41:54.34	2025-11-04 14:41:54.34	\N	\N	\N	\N	Production	\N
716	addv6rsqncuh32e9fzknnsbf	550057	นาย อานนท์ ชูตระกูล	PDT1	M8	Staff	13		2025-11-04 14:41:54.34	2025-11-04 14:41:54.34	2025-11-04 14:41:54.346	\N	\N	\N	Production	\N
719	uvxyz9q2p5u5158ei00jzzna	550065	นาย ชัชวาลย์ ขอกลาง	PDT3	BZ	Leader	13		2025-11-04 14:41:54.413	2025-11-04 14:41:54.413	\N	\N	\N	\N	Production	\N
720	uvxyz9q2p5u5158ei00jzzna	550065	นาย ชัชวาลย์ ขอกลาง	PDT3	BZ	Leader	13		2025-11-04 14:41:54.413	2025-11-04 14:41:54.413	2025-11-04 14:41:54.434	\N	\N	\N	Production	\N
723	keq28o746nesompil7rcmjio	550068	นาย ยอดขวัญ เสมอใจ	PDT3	JC	Staff	13		2025-11-04 14:41:54.523	2025-11-04 14:41:54.523	\N	\N	\N	\N	Production	\N
724	keq28o746nesompil7rcmjio	550068	นาย ยอดขวัญ เสมอใจ	PDT3	JC	Staff	13		2025-11-04 14:41:54.523	2025-11-04 14:41:54.523	2025-11-04 14:41:54.528	\N	\N	\N	Production	\N
727	rmqjoynqmylj4n3tjiniek04	550076	นาย สมคิด สุทธิ	QAD	IP	Junior	13		2025-11-04 14:41:54.612	2025-11-04 14:41:54.612	\N	\N	\N	\N	Support	\N
728	rmqjoynqmylj4n3tjiniek04	550076	นาย สมคิด สุทธิ	QAD	IP	Junior	13		2025-11-04 14:41:54.612	2025-11-04 14:41:54.612	2025-11-04 14:41:54.618	\N	\N	\N	Support	\N
731	dziviqfdsi950nt0gm0sq8qx	560002	นาย ศักดิ์ดา ดีนัก	PDT1	NT	Leader	12		2025-11-04 14:41:54.7	2025-11-04 14:41:54.7	\N	\N	\N	\N	Production	\N
732	dziviqfdsi950nt0gm0sq8qx	560002	นาย ศักดิ์ดา ดีนัก	PDT1	NT	Leader	12		2025-11-04 14:41:54.7	2025-11-04 14:41:54.7	2025-11-04 14:41:54.705	\N	\N	\N	Production	\N
735	r02g85x3jqxafyp8dojhfkw8	560009	นาย วีระศักดิ์ หลุ่งเป้า	PDT1	EG	Leader	12		2025-11-04 14:41:54.775	2025-11-04 14:41:54.775	\N	\N	\N	\N	Production	\N
736	r02g85x3jqxafyp8dojhfkw8	560009	นาย วีระศักดิ์ หลุ่งเป้า	PDT1	EG	Leader	12		2025-11-04 14:41:54.775	2025-11-04 14:41:54.775	2025-11-04 14:41:54.78	\N	\N	\N	Production	\N
739	zf3jqulfjk6mph8azq2reo4a	560013	น.ส. กุสุมา พันธ์โสภา	HRD	HR	Staff	12		2025-11-04 14:41:54.861	2025-11-04 14:41:54.861	\N	\N	\N	\N	Non Production	\N
740	zf3jqulfjk6mph8azq2reo4a	560013	น.ส. กุสุมา พันธ์โสภา	HRD	HR	Staff	12		2025-11-04 14:41:54.861	2025-11-04 14:41:54.861	2025-11-04 14:41:54.866	\N	\N	\N	Non Production	\N
747	gr5ubyu8vklq54phy0xx0y8t	560027	น.ส. ธัญญ์กมน สีหาบง	ENI	MI	Junior	12		2025-11-04 14:41:55.021	2025-11-04 14:41:55.021	\N	\N	\N	\N	Support	\N
748	gr5ubyu8vklq54phy0xx0y8t	560027	น.ส. ธัญญ์กมน สีหาบง	ENI	MI	Junior	12		2025-11-04 14:41:55.021	2025-11-04 14:41:55.021	2025-11-04 14:41:55.026	\N	\N	\N	Support	\N
751	mmb6f3okckigpveqjy6bxbp9	560041	น.ส. สุพัตรา ไสยะหุต	PCM	OR	Staff	12		2025-11-04 14:41:55.108	2025-11-04 14:41:55.108	\N	\N	\N	\N	Support	\N
752	mmb6f3okckigpveqjy6bxbp9	560041	น.ส. สุพัตรา ไสยะหุต	PCM	OR	Staff	12		2025-11-04 14:41:55.108	2025-11-04 14:41:55.108	2025-11-04 14:41:55.113	\N	\N	\N	Support	\N
755	o8ldpttdlt4dz6o24e3c3e05	560043	นาย จรัลวิทย์ สมคำ	QAD	QC1	Foreman	12		2025-11-04 14:41:55.194	2025-11-04 14:41:55.194	\N	\N	\N	\N	Support	\N
756	o8ldpttdlt4dz6o24e3c3e05	560043	นาย จรัลวิทย์ สมคำ	QAD	QC1	Foreman	12		2025-11-04 14:41:55.194	2025-11-04 14:41:55.194	2025-11-04 14:41:55.199	\N	\N	\N	Support	\N
759	m5d1d6obd67shynay3zwtlvn	560050	นาย สนั่น ทิพรักษา	PCM	ST	Junior	12		2025-11-04 14:41:55.282	2025-11-04 14:41:55.282	\N	\N	\N	\N	Support	\N
760	m5d1d6obd67shynay3zwtlvn	560050	นาย สนั่น ทิพรักษา	PCM	ST	Junior	12		2025-11-04 14:41:55.282	2025-11-04 14:41:55.282	2025-11-04 14:41:55.288	\N	\N	\N	Support	\N
763	gw1yiq8yb5s0g5hlam7siukw	560052	น.ส. ประดับ ตำหนินอก	PDT1	EG	Staff	12		2025-11-04 14:41:55.352	2025-11-04 14:41:55.352	\N	\N	\N	\N	Production	\N
764	gw1yiq8yb5s0g5hlam7siukw	560052	น.ส. ประดับ ตำหนินอก	PDT1	EG	Staff	12		2025-11-04 14:41:55.352	2025-11-04 14:41:55.352	2025-11-04 14:41:55.357	\N	\N	\N	Production	\N
767	uvk0n2q55z9jfciuzt8kpw3i	560055	นาย พิเชษฐ อ่อนสิน	PCM	CB	Staff	12		2025-11-04 14:41:55.439	2025-11-04 14:41:55.439	\N	\N	\N	\N	Support	\N
766	opvgtid42lejc5vjrva1qj3n	560054	นาย ศิริชัย สังคะวัตร	PCM	ST	Staff	12		2025-11-04 14:41:55.396	2025-11-04 14:41:55.396	2025-11-04 14:41:55.402	\N	\N	\N	Support	\N
769	nl5v73aosnrs2trtj8ab6mai	560061	นาย นิรุตติ์ ราชโคตร	PDT4	MC	Leader	12		2025-11-04 14:41:55.484	2025-11-04 14:41:55.484	\N	\N	\N	\N	Production	\N
770	nl5v73aosnrs2trtj8ab6mai	560061	นาย นิรุตติ์ ราชโคตร	PDT4	MC	Leader	12		2025-11-04 14:41:55.484	2025-11-04 14:41:55.484	2025-11-04 14:41:55.489	\N	\N	\N	Production	\N
773	f95vw8zjb0yc00cx2l3yp02o	560070	นาย สันติ จันทร์ดวงศรี	PDM	FC	Junior	11		2025-11-04 14:41:55.572	2025-11-04 14:41:55.572	\N	\N	\N	\N	Support	\N
774	f95vw8zjb0yc00cx2l3yp02o	560070	นาย สันติ จันทร์ดวงศรี	PDM	FC	Junior	11		2025-11-04 14:41:55.572	2025-11-04 14:41:55.572	2025-11-04 14:41:55.577	\N	\N	\N	Support	\N
777	h9wuc6a1shvqrrbiarnumt81	570004	น.ส. อลิสา จันทร์เจริญ	MKT	SL	Leader	11		2025-11-04 14:41:55.66	2025-11-04 14:41:55.66	\N	\N	\N	\N	Non Production	\N
778	h9wuc6a1shvqrrbiarnumt81	570004	น.ส. อลิสา จันทร์เจริญ	MKT	SL	Leader	11		2025-11-04 14:41:55.66	2025-11-04 14:41:55.66	2025-11-04 14:41:55.665	\N	\N	\N	Non Production	\N
785	u20dp9kxn4cqmwgbcnehk2ng	570015	นาย สมหมาย เยรัมย์	PDT1	M6	Staff	11		2025-11-04 14:41:55.833	2025-11-04 14:41:55.833	\N	\N	\N	\N	Production	\N
786	u20dp9kxn4cqmwgbcnehk2ng	570015	นาย สมหมาย เยรัมย์	PDT1	M6	Staff	11		2025-11-04 14:41:55.833	2025-11-04 14:41:55.833	2025-11-04 14:41:55.839	\N	\N	\N	Production	\N
789	bg4pothshgsylv2wefs9m3q4	570017	น.ส. รุ่งนภา ขันทา	PDT1	M8	Staff	11		2025-11-04 14:41:55.905	2025-11-04 14:41:55.905	\N	\N	\N	\N	Production	\N
790	bg4pothshgsylv2wefs9m3q4	570017	น.ส. รุ่งนภา ขันทา	PDT1	M8	Staff	11		2025-11-04 14:41:55.905	2025-11-04 14:41:55.905	2025-11-04 14:41:55.926	\N	\N	\N	Production	\N
793	zogxucnem120rzg22at8klg4	570029	นาย กิตติศักดิ์ สุขเกษม	PCM	ST	Staff	11		2025-11-04 14:41:56.004	2025-11-04 14:41:56.004	\N	\N	\N	\N	Support	\N
794	zogxucnem120rzg22at8klg4	570029	นาย กิตติศักดิ์ สุขเกษม	PCM	ST	Staff	11		2025-11-04 14:41:56.004	2025-11-04 14:41:56.004	2025-11-04 14:41:56.01	\N	\N	\N	Support	\N
797	xf0iq6s4ynb5246dbcovlvw4	570042	นาย พงษ์สิทธิ์ พรหมไพร	PDT2	OQ	Staff	11		2025-11-04 14:41:56.094	2025-11-04 14:41:56.094	\N	\N	\N	\N	Production	\N
798	xf0iq6s4ynb5246dbcovlvw4	570042	นาย พงษ์สิทธิ์ พรหมไพร	PDT2	OQ	Staff	11		2025-11-04 14:41:56.094	2025-11-04 14:41:56.094	2025-11-04 14:41:56.1	\N	\N	\N	Production	\N
801	btu9ou1a3yz5d2wx4tjgvnuz	570047	นาย อักขจร ยอดดี	PDT4	US	Staff	11		2025-11-04 14:41:56.185	2025-11-04 14:41:56.185	\N	\N	\N	\N	Production	\N
802	btu9ou1a3yz5d2wx4tjgvnuz	570047	นาย อักขจร ยอดดี	PDT4	US	Staff	11		2025-11-04 14:41:56.185	2025-11-04 14:41:56.185	2025-11-04 14:41:56.19	\N	\N	\N	Production	\N
805	i20qtuobbdzkay0rzzn0k51v	570049	นาย วรรณสิทธิ์ คนไว	PDT3	BZ	Junior	11		2025-11-04 14:41:56.28	2025-11-04 14:41:56.28	\N	\N	\N	\N	Production	\N
806	i20qtuobbdzkay0rzzn0k51v	570049	นาย วรรณสิทธิ์ คนไว	PDT3	BZ	Junior	11		2025-11-04 14:41:56.28	2025-11-04 14:41:56.28	2025-11-04 14:41:56.286	\N	\N	\N	Production	\N
809	a8p7edxurujgh077xwppmpn9	570057	นาย คำภู วาสไธสง	PDT3	BZ	Junior	11		2025-11-04 14:41:56.37	2025-11-04 14:41:56.37	\N	\N	\N	\N	Production	\N
810	a8p7edxurujgh077xwppmpn9	570057	นาย คำภู วาสไธสง	PDT3	BZ	Junior	11		2025-11-04 14:41:56.37	2025-11-04 14:41:56.37	2025-11-04 14:41:56.375	\N	\N	\N	Production	\N
813	mcadg5dadz28cccd3ty7amvz	570069	นาย ชลธิศ แจ้งไธสง	PCM	ST	Staff	11		2025-11-04 14:41:56.46	2025-11-04 14:41:56.46	\N	\N	\N	\N	Support	\N
814	mcadg5dadz28cccd3ty7amvz	570069	นาย ชลธิศ แจ้งไธสง	PCM	ST	Staff	11		2025-11-04 14:41:56.46	2025-11-04 14:41:56.46	2025-11-04 14:41:56.465	\N	\N	\N	Support	\N
817	qmes3utyltabi6tc1n5j6ndc	570074	นาย สรรชัย กล้าหาญ	PCM	ST	Staff	11		2025-11-04 14:41:56.548	2025-11-04 14:41:56.548	\N	\N	\N	\N	Support	\N
818	qmes3utyltabi6tc1n5j6ndc	570074	นาย สรรชัย กล้าหาญ	PCM	ST	Staff	11		2025-11-04 14:41:56.548	2025-11-04 14:41:56.548	2025-11-04 14:41:56.554	\N	\N	\N	Support	\N
821	n2ocngw4lb2lu9cbq2250wto	570083	นาย คมกริช นาจะหมื่น	PDT1	EG	Staff	11		2025-11-04 14:41:56.637	2025-11-04 14:41:56.637	\N	\N	\N	\N	Production	\N
822	n2ocngw4lb2lu9cbq2250wto	570083	นาย คมกริช นาจะหมื่น	PDT1	EG	Staff	11		2025-11-04 14:41:56.637	2025-11-04 14:41:56.637	2025-11-04 14:41:56.642	\N	\N	\N	Production	\N
825	e6hfdcn3858uev8om1xy7uh7	570088	นาย เอกชัย ปินะกาพัง	PDT4	MC	Leader	10		2025-11-04 14:41:56.726	2025-11-04 14:41:56.726	\N	\N	\N	\N	Production	\N
826	e6hfdcn3858uev8om1xy7uh7	570088	นาย เอกชัย ปินะกาพัง	PDT4	MC	Leader	10		2025-11-04 14:41:56.726	2025-11-04 14:41:56.726	2025-11-04 14:41:56.731	\N	\N	\N	Production	\N
833	lgkwwq04yqc5kppyo4e1wond	580011	นาย เกรียงไกร นนฤชา	PDT4	MC	Staff	10		2025-11-04 14:41:56.902	2025-11-04 14:41:56.902	\N	\N	\N	\N	Production	\N
834	lgkwwq04yqc5kppyo4e1wond	580011	นาย เกรียงไกร นนฤชา	PDT4	MC	Staff	10		2025-11-04 14:41:56.902	2025-11-04 14:41:56.902	2025-11-04 14:41:56.907	\N	\N	\N	Production	\N
837	vbrl3mqkd4z45yl4gos513qj	580013	นาย เอกชัย ศรีสุราช	PDT3	GM	Staff	10		2025-11-04 14:41:56.975	2025-11-04 14:41:56.975	\N	\N	\N	\N	Production	\N
838	vbrl3mqkd4z45yl4gos513qj	580013	นาย เอกชัย ศรีสุราช	PDT3	GM	Staff	10		2025-11-04 14:41:56.975	2025-11-04 14:41:56.975	2025-11-04 14:41:56.997	\N	\N	\N	Production	\N
841	q5ft1tptltaq9jmpf271ups3	580022	นาย สิทธิชัย มาศทอง	PDT1	M10	Staff	10		2025-11-04 14:41:57.082	2025-11-04 14:41:57.082	\N	\N	\N	\N	Production	\N
842	q5ft1tptltaq9jmpf271ups3	580022	นาย สิทธิชัย มาศทอง	PDT1	M10	Staff	10		2025-11-04 14:41:57.082	2025-11-04 14:41:57.082	2025-11-04 14:41:57.087	\N	\N	\N	Production	\N
845	l44jmmg8k9cwepgwgprb9ral	580026	นาย วัชระ ศรีธิจู	PDT3	GM	Staff	10		2025-11-04 14:41:57.152	2025-11-04 14:41:57.152	\N	\N	\N	\N	Production	\N
846	l44jmmg8k9cwepgwgprb9ral	580026	นาย วัชระ ศรีธิจู	PDT3	GM	Staff	10		2025-11-04 14:41:57.152	2025-11-04 14:41:57.152	2025-11-04 14:41:57.175	\N	\N	\N	Production	\N
829	xpxvuzecb0jjt03hh3yp4iyi	580006	นาย ธนัช ภักมีคุณธร	PDT4	UB	Supervisor	10		2025-11-04 14:41:56.799	2025-11-20 14:30:21.727	\N	\N	1	\N	Production	thanat@aoyama.co.th
768	uvk0n2q55z9jfciuzt8kpw3i	560055	นาย พิเชษฐ อ่อนสิน	PCM	CB	Staff	12		2025-11-04 14:41:55.439	2025-11-04 14:41:55.439	2025-11-04 14:41:55.445	\N	\N	\N	Support	\N
771	pyn32lxksqastv7kwvrb95sk	560064	นาย ศักรินทร์ แซ่อุ่น	PDT2	OQ	Staff	12		2025-11-04 14:41:55.53	2025-11-04 14:41:55.53	\N	\N	\N	\N	Production	\N
772	pyn32lxksqastv7kwvrb95sk	560064	นาย ศักรินทร์ แซ่อุ่น	PDT2	OQ	Staff	12		2025-11-04 14:41:55.53	2025-11-04 14:41:55.53	2025-11-04 14:41:55.535	\N	\N	\N	Production	\N
775	c9os3erbee7mx1szsprzvgg9	560071	นาย บำรุง แพขันทอง	PDT3	BZ	Staff	11		2025-11-04 14:41:55.601	2025-11-04 14:41:55.601	\N	\N	\N	\N	Production	\N
776	c9os3erbee7mx1szsprzvgg9	560071	นาย บำรุง แพขันทอง	PDT3	BZ	Staff	11		2025-11-04 14:41:55.601	2025-11-04 14:41:55.601	2025-11-04 14:41:55.623	\N	\N	\N	Production	\N
779	cqljg1tmpmzk1scuxf9ssa6z	570007	นาย พรทวี วงษ์ษา	PDT4	US	Staff	11		2025-11-04 14:41:55.703	2025-11-04 14:41:55.703	\N	\N	\N	\N	Production	\N
780	cqljg1tmpmzk1scuxf9ssa6z	570007	นาย พรทวี วงษ์ษา	PDT4	US	Staff	11		2025-11-04 14:41:55.703	2025-11-04 14:41:55.703	2025-11-04 14:41:55.708	\N	\N	\N	Production	\N
783	sblb2j7f87bj7smikmup3u8w	570013	นาย ธีระศักดิ์ จันทโรลุน	PDT3	BZ	Staff	11		2025-11-04 14:41:55.788	2025-11-04 14:41:55.788	\N	\N	\N	\N	Production	\N
784	sblb2j7f87bj7smikmup3u8w	570013	นาย ธีระศักดิ์ จันทโรลุน	PDT3	BZ	Staff	11		2025-11-04 14:41:55.788	2025-11-04 14:41:55.788	2025-11-04 14:41:55.793	\N	\N	\N	Production	\N
787	arjsfgt3r26imtbjsbn9bjl2	570016	นาย ทิวา เมืองกลาง	HRD	EF	Staff	11		2025-11-04 14:41:55.875	2025-11-04 14:41:55.875	\N	\N	\N	\N	Non Production	\N
788	arjsfgt3r26imtbjsbn9bjl2	570016	นาย ทิวา เมืองกลาง	HRD	EF	Staff	11		2025-11-04 14:41:55.875	2025-11-04 14:41:55.875	2025-11-04 14:41:55.882	\N	\N	\N	Non Production	\N
791	brm2037bnfpnoetetp174hec	570028	นาย ศรายุทธ สิงหบุตร	PCM	TP	Staff	11		2025-11-04 14:41:55.963	2025-11-04 14:41:55.963	\N	\N	\N	\N	Support	\N
792	brm2037bnfpnoetetp174hec	570028	นาย ศรายุทธ สิงหบุตร	PCM	TP	Staff	11		2025-11-04 14:41:55.963	2025-11-04 14:41:55.963	2025-11-04 14:41:55.968	\N	\N	\N	Support	\N
795	n7a5yzm0rkm1z8nx15srirm0	570040	นาย สุรศักดิ์ ยันตระพันธุ์	PDT1	M6	Leader	11		2025-11-04 14:41:56.033	2025-11-04 14:41:56.033	\N	\N	\N	\N	Production	\N
796	n7a5yzm0rkm1z8nx15srirm0	570040	นาย สุรศักดิ์ ยันตระพันธุ์	PDT1	M6	Leader	11		2025-11-04 14:41:56.033	2025-11-04 14:41:56.033	2025-11-04 14:41:56.057	\N	\N	\N	Production	\N
799	s7v9545674tfmlkp4k72t374	570043	นาย นัฐพล เชื่อฟัง	PDT1	EG	Staff	11		2025-11-04 14:41:56.141	2025-11-04 14:41:56.141	\N	\N	\N	\N	Production	\N
800	s7v9545674tfmlkp4k72t374	570043	นาย นัฐพล เชื่อฟัง	PDT1	EG	Staff	11		2025-11-04 14:41:56.141	2025-11-04 14:41:56.141	2025-11-04 14:41:56.156	\N	\N	\N	Production	\N
803	kd5a6e1os6twtltibda3z9mf	570048	นาย ไพรัตน์ แววดอน	PDM	PC	Leader	11		2025-11-04 14:41:56.232	2025-11-04 14:41:56.232	\N	\N	\N	\N	Support	\N
804	kd5a6e1os6twtltibda3z9mf	570048	นาย ไพรัตน์ แววดอน	PDM	PC	Leader	11		2025-11-04 14:41:56.232	2025-11-04 14:41:56.232	2025-11-04 14:41:56.238	\N	\N	\N	Support	\N
807	jz80x4nskah4e3eft72bupqn	570053	นาย ฉัตรชัย ไม้น้อย	PCM	ST	Staff	11		2025-11-04 14:41:56.325	2025-11-04 14:41:56.325	\N	\N	\N	\N	Support	\N
808	jz80x4nskah4e3eft72bupqn	570053	นาย ฉัตรชัย ไม้น้อย	PCM	ST	Staff	11		2025-11-04 14:41:56.325	2025-11-04 14:41:56.325	2025-11-04 14:41:56.331	\N	\N	\N	Support	\N
811	b74kcxe5ndn84t9nsv9njnt8	570061	นาย สุจินต์ บาลจบ	PDT3	BZ	Staff	11		2025-11-04 14:41:56.399	2025-11-04 14:41:56.399	\N	\N	\N	\N	Production	\N
812	b74kcxe5ndn84t9nsv9njnt8	570061	นาย สุจินต์ บาลจบ	PDT3	BZ	Staff	11		2025-11-04 14:41:56.399	2025-11-04 14:41:56.399	2025-11-04 14:41:56.421	\N	\N	\N	Production	\N
815	f6oz409x5thgvrwfoxul23gz	570071	นาย อภิสิทธ์ แก้วอมร	PDT1	NT	Staff	11		2025-11-04 14:41:56.506	2025-11-04 14:41:56.506	\N	\N	\N	\N	Production	\N
816	f6oz409x5thgvrwfoxul23gz	570071	นาย อภิสิทธ์ แก้วอมร	PDT1	NT	Staff	11		2025-11-04 14:41:56.506	2025-11-04 14:41:56.506	2025-11-04 14:41:56.511	\N	\N	\N	Production	\N
819	twgc57wgfn8zm4o1vfc5ozzv	570079	นาย อภิชาติ พิศุทธิอนันต์	PDT1	M10	Junior	11		2025-11-04 14:41:56.577	2025-11-04 14:41:56.577	\N	\N	\N	\N	Production	\N
820	twgc57wgfn8zm4o1vfc5ozzv	570079	นาย อภิชาติ พิศุทธิอนันต์	PDT1	M10	Junior	11		2025-11-04 14:41:56.577	2025-11-04 14:41:56.577	2025-11-04 14:41:56.599	\N	\N	\N	Production	\N
823	ya3q8qi78n79si26wlxamocr	570084	นาย ธวัชชัย นันต๊ะวงค์	PDT4	MC	Junior	11		2025-11-04 14:41:56.682	2025-11-04 14:41:56.682	\N	\N	\N	\N	Production	\N
824	ya3q8qi78n79si26wlxamocr	570084	นาย ธวัชชัย นันต๊ะวงค์	PDT4	MC	Junior	11		2025-11-04 14:41:56.682	2025-11-04 14:41:56.682	2025-11-04 14:41:56.688	\N	\N	\N	Production	\N
827	yn16zdmqwr5skkgercc7t21s	570090	นาย อดิศักดิ์ พาคิด	PCM	Q-GATE	Staff	10		2025-11-04 14:41:56.768	2025-11-04 14:41:56.768	\N	\N	\N	\N	Support	\N
828	yn16zdmqwr5skkgercc7t21s	570090	นาย อดิศักดิ์ พาคิด	PCM	Q-GATE	Staff	10		2025-11-04 14:41:56.768	2025-11-04 14:41:56.768	2025-11-04 14:41:56.773	\N	\N	\N	Support	\N
831	wmiqzu72ixtmhayhzjganwfc	580010	นาย จรินทร์ แมงกลาง	PDT1	NT	Staff	10		2025-11-04 14:41:56.859	2025-11-04 14:41:56.859	\N	\N	\N	\N	Production	\N
832	wmiqzu72ixtmhayhzjganwfc	580010	นาย จรินทร์ แมงกลาง	PDT1	NT	Staff	10		2025-11-04 14:41:56.859	2025-11-04 14:41:56.859	2025-11-04 14:41:56.864	\N	\N	\N	Production	\N
835	g5128qwv8q7hkvg1yn287dvl	580012	นาย เจษฎา คำเณร	PDT2	OQ	Junior	10		2025-11-04 14:41:56.943	2025-11-04 14:41:56.943	\N	\N	\N	\N	Production	\N
836	g5128qwv8q7hkvg1yn287dvl	580012	นาย เจษฎา คำเณร	PDT2	OQ	Junior	10		2025-11-04 14:41:56.943	2025-11-04 14:41:56.943	2025-11-04 14:41:56.948	\N	\N	\N	Production	\N
839	zdxjlwdw7sii1bsgt3m3yzif	580021	นาย ขรรค์ชัย กูกขุนทด	HRD	EF	Staff	10		2025-11-04 14:41:57.038	2025-11-04 14:41:57.038	\N	\N	\N	\N	Non Production	\N
840	zdxjlwdw7sii1bsgt3m3yzif	580021	นาย ขรรค์ชัย กูกขุนทด	HRD	EF	Staff	10		2025-11-04 14:41:57.038	2025-11-04 14:41:57.038	2025-11-04 14:41:57.051	\N	\N	\N	Non Production	\N
843	lrkg16yw2pv8424720h964s4	580023	น.ส. เครือทิพย์ สายจำปา	PUD	PU1	Staff	10		2025-11-04 14:41:57.124	2025-11-04 14:41:57.124	\N	\N	\N	\N	Non Production	\N
844	lrkg16yw2pv8424720h964s4	580023	น.ส. เครือทิพย์ สายจำปา	PUD	PU1	Staff	10		2025-11-04 14:41:57.124	2025-11-04 14:41:57.124	2025-11-04 14:41:57.129	\N	\N	\N	Non Production	\N
847	v6l1zkiol65w4pguj0f3y7zt	580028	นาย สุวินัย พวงพลอย	PDT3	BZ	Junior	10		2025-11-04 14:41:57.213	2025-11-04 14:41:57.213	\N	\N	\N	\N	Production	\N
848	v6l1zkiol65w4pguj0f3y7zt	580028	นาย สุวินัย พวงพลอย	PDT3	BZ	Junior	10		2025-11-04 14:41:57.213	2025-11-04 14:41:57.213	2025-11-04 14:41:57.219	\N	\N	\N	Production	\N
851	b708cewcgijpj0vjmqff46zd	580033	นาย สมชาย ศรัทธาธรรม	PDT2	OQ	Staff	10		2025-11-04 14:41:57.304	2025-11-04 14:41:57.304	\N	\N	\N	\N	Production	\N
852	b708cewcgijpj0vjmqff46zd	580033	นาย สมชาย ศรัทธาธรรม	PDT2	OQ	Staff	10		2025-11-04 14:41:57.304	2025-11-04 14:41:57.304	2025-11-04 14:41:57.31	\N	\N	\N	Production	\N
855	mqvaq0tybbeq6zo4ihco2rfg	580042	นาย สมศักดิ์ เขตมนตรี	HRD	GA	Staff	10		2025-11-04 14:41:57.395	2025-11-04 14:41:57.395	\N	\N	\N	\N	Non Production	\N
856	mqvaq0tybbeq6zo4ihco2rfg	580042	นาย สมศักดิ์ เขตมนตรี	HRD	GA	Staff	10		2025-11-04 14:41:57.395	2025-11-04 14:41:57.395	2025-11-04 14:41:57.401	\N	\N	\N	Non Production	\N
859	l80fwzeol7uhfpeaduabdh2f	580044	นาย ศรัณย์พงศ์ จันท์ทะปัน	ENI	EN	Foreman	10		2025-11-04 14:41:57.487	2025-11-04 14:41:57.487	\N	\N	\N	\N	Support	\N
860	l80fwzeol7uhfpeaduabdh2f	580044	นาย ศรัณย์พงศ์ จันท์ทะปัน	ENI	EN	Foreman	10		2025-11-04 14:41:57.487	2025-11-04 14:41:57.487	2025-11-04 14:41:57.509	\N	\N	\N	Support	\N
863	skm5m3ylysx9nl4393mw5gcr	580051	น.ส. ปริศนา ยูเมคะ	HRD	SC	Foreman	10		2025-11-04 14:41:57.58	2025-11-04 14:41:57.58	\N	\N	\N	\N	Non Production	\N
864	skm5m3ylysx9nl4393mw5gcr	580051	น.ส. ปริศนา ยูเมคะ	HRD	SC	Foreman	10		2025-11-04 14:41:57.58	2025-11-04 14:41:57.58	2025-11-04 14:41:57.585	\N	\N	\N	Non Production	\N
867	gyfp4yut659hyl22ep972npg	580056	นาย วิวัฒน์ ทองพะเนาว์	PDT1	M10	Staff	10		2025-11-04 14:41:57.672	2025-11-04 14:41:57.672	\N	\N	\N	\N	Production	\N
868	gyfp4yut659hyl22ep972npg	580056	นาย วิวัฒน์ ทองพะเนาว์	PDT1	M10	Staff	10		2025-11-04 14:41:57.672	2025-11-04 14:41:57.672	2025-11-04 14:41:57.677	\N	\N	\N	Production	\N
871	syt5qbcc09zqmvo06b83gijy	580058	นาย สดายุ ไกรกลาง	PDT4	MC	Staff	10		2025-11-04 14:41:57.761	2025-11-04 14:41:57.761	\N	\N	\N	\N	Production	\N
872	syt5qbcc09zqmvo06b83gijy	580058	นาย สดายุ ไกรกลาง	PDT4	MC	Staff	10		2025-11-04 14:41:57.761	2025-11-04 14:41:57.761	2025-11-04 14:41:57.767	\N	\N	\N	Production	\N
875	f49hln8dpmtlmi0ww90865jh	580068	นาย ศรีสยาม แพงศรี	PCM	ST	Staff	10		2025-11-04 14:41:57.853	2025-11-04 14:41:57.853	\N	\N	\N	\N	Support	\N
876	f49hln8dpmtlmi0ww90865jh	580068	นาย ศรีสยาม แพงศรี	PCM	ST	Staff	10		2025-11-04 14:41:57.853	2025-11-04 14:41:57.853	2025-11-04 14:41:57.858	\N	\N	\N	Support	\N
879	d7ctb795hyapjs0ux80k8i53	580073	นาย ณรงค์ ธิชาญ	PDT3	GM	Staff	10		2025-11-04 14:41:57.946	2025-11-04 14:41:57.946	\N	\N	\N	\N	Production	\N
880	d7ctb795hyapjs0ux80k8i53	580073	นาย ณรงค์ ธิชาญ	PDT3	GM	Staff	10		2025-11-04 14:41:57.946	2025-11-04 14:41:57.946	2025-11-04 14:41:57.952	\N	\N	\N	Production	\N
883	h4bde2jnwg79ljmmv7jypf2y	580076	นาย วิทยา ชัยพรมมา	PDT1	M10	Leader	10		2025-11-04 14:41:58.04	2025-11-04 14:41:58.04	\N	\N	\N	\N	Production	\N
884	h4bde2jnwg79ljmmv7jypf2y	580076	นาย วิทยา ชัยพรมมา	PDT1	M10	Leader	10		2025-11-04 14:41:58.04	2025-11-04 14:41:58.04	2025-11-04 14:41:58.047	\N	\N	\N	Production	\N
887	ukeawtrharl4qu6fdtq3dzvt	580083	นาย อุรัสธรณ์ ทองธรรมรัตน์	PUD	PU2	Leader	10		2025-11-04 14:41:58.134	2025-11-04 14:41:58.134	\N	\N	\N	\N	Non Production	\N
888	ukeawtrharl4qu6fdtq3dzvt	580083	นาย อุรัสธรณ์ ทองธรรมรัตน์	PUD	PU2	Leader	10		2025-11-04 14:41:58.134	2025-11-04 14:41:58.134	2025-11-04 14:41:58.14	\N	\N	\N	Non Production	\N
891	k8hmuahu74id9my3h56ci6jg	590018	นาย ไกรสร ไทยเจริญ	PCM	Q-GATE	Staff	9		2025-11-04 14:41:58.219	2025-11-04 14:41:58.219	\N	\N	\N	\N	Support	\N
892	k8hmuahu74id9my3h56ci6jg	590018	นาย ไกรสร ไทยเจริญ	PCM	Q-GATE	Staff	9		2025-11-04 14:41:58.219	2025-11-04 14:41:58.219	2025-11-04 14:41:58.224	\N	\N	\N	Support	\N
895	c9uqght1lkwinoblgknuld2h	590023	นาย สุรศักดิ์ แสงอุ่น	HRD	EF	Staff	9		2025-11-04 14:41:58.312	2025-11-04 14:41:58.312	\N	\N	\N	\N	Non Production	\N
896	c9uqght1lkwinoblgknuld2h	590023	นาย สุรศักดิ์ แสงอุ่น	HRD	EF	Staff	9		2025-11-04 14:41:58.312	2025-11-04 14:41:58.312	2025-11-04 14:41:58.318	\N	\N	\N	Non Production	\N
899	imc1z025tyyvjwvi63ix013g	590026	น.ส. เกศรินทร์ จันทะนันต์	PCM	OR	Staff	9		2025-11-04 14:41:58.384	2025-11-04 14:41:58.384	\N	\N	\N	\N	Support	\N
900	imc1z025tyyvjwvi63ix013g	590026	น.ส. เกศรินทร์ จันทะนันต์	PCM	OR	Staff	9		2025-11-04 14:41:58.384	2025-11-04 14:41:58.384	2025-11-04 14:41:58.406	\N	\N	\N	Support	\N
903	cvgwt7zg9pe08uhsofnaehgj	590030	น.ส. พิไลวรรณ สุวิชา	PDT4	UB	Staff	9		2025-11-04 14:41:58.488	2025-11-04 14:41:58.488	\N	\N	\N	\N	Production	\N
904	cvgwt7zg9pe08uhsofnaehgj	590030	น.ส. พิไลวรรณ สุวิชา	PDT4	UB	Staff	9		2025-11-04 14:41:58.488	2025-11-04 14:41:58.488	2025-11-04 14:41:58.496	\N	\N	\N	Production	\N
907	u5z7weokl2yb2t0luhhlg9at	590038	น.ส. อารยา คงอนันต์	FNC	AC	Staff	9		2025-11-04 14:41:58.577	2025-11-04 14:41:58.577	\N	\N	\N	\N	Non Production	\N
908	u5z7weokl2yb2t0luhhlg9at	590038	น.ส. อารยา คงอนันต์	FNC	AC	Staff	9		2025-11-04 14:41:58.577	2025-11-04 14:41:58.577	2025-11-04 14:41:58.583	\N	\N	\N	Non Production	\N
911	n1iww0s9o0fvny7f6osh2ce3	590043	นาย อนุวัฒน์ เจริญศรี	PDT3	GM	Staff	9		2025-11-04 14:41:58.663	2025-11-04 14:41:58.663	\N	\N	\N	\N	Production	\N
912	n1iww0s9o0fvny7f6osh2ce3	590043	นาย อนุวัฒน์ เจริญศรี	PDT3	GM	Staff	9		2025-11-04 14:41:58.663	2025-11-04 14:41:58.663	2025-11-04 14:41:58.668	\N	\N	\N	Production	\N
915	g8lbno3c2d4ubsclqf8nxehl	590045	นาย สุวินัย ตู้นอก	QAD	IP	Staff	9		2025-11-04 14:41:58.752	2025-11-04 14:41:58.752	\N	\N	\N	\N	Support	\N
916	g8lbno3c2d4ubsclqf8nxehl	590045	นาย สุวินัย ตู้นอก	QAD	IP	Staff	9		2025-11-04 14:41:58.752	2025-11-04 14:41:58.752	2025-11-04 14:41:58.758	\N	\N	\N	Support	\N
919	xw03k28jkyi9kuim2dsvg6bp	590053	นาย วงษ์ธวัช เพ็ชรพรหม	QAD	IP	Staff	9		2025-11-04 14:41:58.839	2025-11-04 14:41:58.839	\N	\N	\N	\N	Support	\N
920	xw03k28jkyi9kuim2dsvg6bp	590053	นาย วงษ์ธวัช เพ็ชรพรหม	QAD	IP	Staff	9		2025-11-04 14:41:58.839	2025-11-04 14:41:58.839	2025-11-04 14:41:58.844	\N	\N	\N	Support	\N
923	aeihxsjnbtcmsmt4eqrhv9o8	590064	น.ส. พนารัตน์ ตาปราบ	QAD	IP	Staff	9		2025-11-04 14:41:58.932	2025-11-04 14:41:58.932	\N	\N	\N	\N	Support	\N
924	aeihxsjnbtcmsmt4eqrhv9o8	590064	น.ส. พนารัตน์ ตาปราบ	QAD	IP	Staff	9		2025-11-04 14:41:58.932	2025-11-04 14:41:58.932	2025-11-04 14:41:58.939	\N	\N	\N	Support	\N
927	q70gemsalupvbw5m08wh5xhg	590066	น.ส. ดวงจันทร์ ตนัยต่อกุล	PDT4	UB	Staff	9		2025-11-04 14:41:59.025	2025-11-04 14:41:59.025	\N	\N	\N	\N	Production	\N
849	ib7ksc8hai6tn4un29pmxepr	580032	นาย จีรศักดิ์ ปะการะพัง	PDT3	GM	Staff	10		2025-11-04 14:41:57.257	2025-11-04 14:41:57.257	\N	\N	\N	\N	Production	\N
850	ib7ksc8hai6tn4un29pmxepr	580032	นาย จีรศักดิ์ ปะการะพัง	PDT3	GM	Staff	10		2025-11-04 14:41:57.257	2025-11-04 14:41:57.257	2025-11-04 14:41:57.262	\N	\N	\N	Production	\N
853	ypra87lhoboq8sg2a39kq8fy	580034	นาย ไกรสร ธูปเทียนรัตน์	PDT2	OQ	Junior	10		2025-11-04 14:41:57.351	2025-11-04 14:41:57.351	\N	\N	\N	\N	Production	\N
854	ypra87lhoboq8sg2a39kq8fy	580034	นาย ไกรสร ธูปเทียนรัตน์	PDT2	OQ	Junior	10		2025-11-04 14:41:57.351	2025-11-04 14:41:57.351	2025-11-04 14:41:57.358	\N	\N	\N	Production	\N
857	lv0n39in725zmtdaf4ygzp4o	580043	นาย อภิวัฒน์ เจนนา	HRD	EF	Staff	10		2025-11-04 14:41:57.438	2025-11-04 14:41:57.438	\N	\N	\N	\N	Non Production	\N
858	lv0n39in725zmtdaf4ygzp4o	580043	นาย อภิวัฒน์ เจนนา	HRD	EF	Staff	10		2025-11-04 14:41:57.438	2025-11-04 14:41:57.438	2025-11-04 14:41:57.444	\N	\N	\N	Non Production	\N
861	zwi0diw93hdvmvwn7hmu29oo	580046	น.ส. อุทุมพร มาสีดา	QAD	IP	Staff	10		2025-11-04 14:41:57.536	2025-11-04 14:41:57.536	\N	\N	\N	\N	Support	\N
862	zwi0diw93hdvmvwn7hmu29oo	580046	น.ส. อุทุมพร มาสีดา	QAD	IP	Staff	10		2025-11-04 14:41:57.536	2025-11-04 14:41:57.536	2025-11-04 14:41:57.556	\N	\N	\N	Support	\N
865	gi6b6vegd6hd5u285lkd7uai	580055	น.ส. วิลาวรรณ บุญเฮ้า	PCM	ST	Staff	10		2025-11-04 14:41:57.627	2025-11-04 14:41:57.627	\N	\N	\N	\N	Support	\N
866	gi6b6vegd6hd5u285lkd7uai	580055	น.ส. วิลาวรรณ บุญเฮ้า	PCM	ST	Staff	10		2025-11-04 14:41:57.627	2025-11-04 14:41:57.627	2025-11-04 14:41:57.634	\N	\N	\N	Support	\N
869	ubtwznkfsfisx0u0xnk0jmkv	580057	น.ส. สุนิสา ชิยางคะบุตร	PDT4	UB	Staff	10		2025-11-04 14:41:57.716	2025-11-04 14:41:57.716	\N	\N	\N	\N	Production	\N
870	ubtwznkfsfisx0u0xnk0jmkv	580057	น.ส. สุนิสา ชิยางคะบุตร	PDT4	UB	Staff	10		2025-11-04 14:41:57.716	2025-11-04 14:41:57.716	2025-11-04 14:41:57.723	\N	\N	\N	Production	\N
877	exzo5nc4n8l6kycyvk8x15lb	580072	นาย สุระสิทธิ์ ธรรมปัญญาร์	PDT1	M6	Staff	10		2025-11-04 14:41:57.9	2025-11-04 14:41:57.9	\N	\N	\N	\N	Production	\N
878	exzo5nc4n8l6kycyvk8x15lb	580072	นาย สุระสิทธิ์ ธรรมปัญญาร์	PDT1	M6	Staff	10		2025-11-04 14:41:57.9	2025-11-04 14:41:57.9	2025-11-04 14:41:57.906	\N	\N	\N	Production	\N
881	on185tfcujh6b28axmt54kum	580074	นาย วัชรา ยาสาร	PDT3	GM	Leader	10		2025-11-04 14:41:57.993	2025-11-04 14:41:57.993	\N	\N	\N	\N	Production	\N
882	on185tfcujh6b28axmt54kum	580074	นาย วัชรา ยาสาร	PDT3	GM	Leader	10		2025-11-04 14:41:57.993	2025-11-04 14:41:57.993	2025-11-04 14:41:57.999	\N	\N	\N	Production	\N
885	r95ouhxczug4zwgk53xhpzj3	580077	นาย วรวิทย์ บับพิบูลย์	QAD	IP	Staff	10		2025-11-04 14:41:58.086	2025-11-04 14:41:58.086	\N	\N	\N	\N	Support	\N
886	r95ouhxczug4zwgk53xhpzj3	580077	นาย วรวิทย์ บับพิบูลย์	QAD	IP	Staff	10		2025-11-04 14:41:58.086	2025-11-04 14:41:58.086	2025-11-04 14:41:58.093	\N	\N	\N	Support	\N
889	syrdmmj57m829gxenvcvgags	590015	นาย สิทธิ์ชัย กุลชริด	PDT1	NT	Staff	9		2025-11-04 14:41:58.175	2025-11-04 14:41:58.175	\N	\N	\N	\N	Production	\N
890	syrdmmj57m829gxenvcvgags	590015	นาย สิทธิ์ชัย กุลชริด	PDT1	NT	Staff	9		2025-11-04 14:41:58.175	2025-11-04 14:41:58.175	2025-11-04 14:41:58.179	\N	\N	\N	Production	\N
897	f20szgtc0jefct4y2zhhj6gk	590025	นาย อภิวัฒน์ เกษสุดาภรณ์ศักดิ์	PDT1	M8	Staff	9		2025-11-04 14:41:58.356	2025-11-04 14:41:58.356	\N	\N	\N	\N	Production	\N
898	f20szgtc0jefct4y2zhhj6gk	590025	นาย อภิวัฒน์ เกษสุดาภรณ์ศักดิ์	PDT1	M8	Staff	9		2025-11-04 14:41:58.356	2025-11-04 14:41:58.356	2025-11-04 14:41:58.361	\N	\N	\N	Production	\N
901	ncrlmtv3bx3tc9ez8h2ttwbj	590029	น.ส. แก้วตา เฉลิมศักดิ์	QAD	QC2	Staff	9		2025-11-04 14:41:58.445	2025-11-04 14:41:58.445	\N	\N	\N	\N	Support	\N
902	ncrlmtv3bx3tc9ez8h2ttwbj	590029	น.ส. แก้วตา เฉลิมศักดิ์	QAD	QC2	Staff	9		2025-11-04 14:41:58.445	2025-11-04 14:41:58.445	2025-11-04 14:41:58.45	\N	\N	\N	Support	\N
905	l63rxy9v3drbi53wlm5c7df1	590035	นาย ไตรรงค์ มีสง่า	HRD	GA	Staff	9		2025-11-04 14:41:58.534	2025-11-04 14:41:58.534	\N	\N	\N	\N	Non Production	\N
906	l63rxy9v3drbi53wlm5c7df1	590035	นาย ไตรรงค์ มีสง่า	HRD	GA	Staff	9		2025-11-04 14:41:58.534	2025-11-04 14:41:58.534	2025-11-04 14:41:58.54	\N	\N	\N	Non Production	\N
909	ogurmfxq10th3walf8bzoekk	590042	นาย สุบิน กาเตื่อย	QAD	QC2	Junior	9		2025-11-04 14:41:58.62	2025-11-04 14:41:58.62	\N	\N	\N	\N	Support	\N
910	ogurmfxq10th3walf8bzoekk	590042	นาย สุบิน กาเตื่อย	QAD	QC2	Junior	9		2025-11-04 14:41:58.62	2025-11-04 14:41:58.62	2025-11-04 14:41:58.626	\N	\N	\N	Support	\N
913	tf514albygww2sizphmbhueg	590044	นาย จันทร์ทา จันทะบูรณ์	PCM	ST	Staff	9		2025-11-04 14:41:58.71	2025-11-04 14:41:58.71	\N	\N	\N	\N	Support	\N
914	tf514albygww2sizphmbhueg	590044	นาย จันทร์ทา จันทะบูรณ์	PCM	ST	Staff	9		2025-11-04 14:41:58.71	2025-11-04 14:41:58.71	2025-11-04 14:41:58.716	\N	\N	\N	Support	\N
917	pqk9roielmjcs1pwzthyhz78	590047	นาย อนุสรณ์ ชวดพงษ์	QAD	IP	Staff	9		2025-11-04 14:41:58.797	2025-11-04 14:41:58.797	\N	\N	\N	\N	Support	\N
918	pqk9roielmjcs1pwzthyhz78	590047	นาย อนุสรณ์ ชวดพงษ์	QAD	IP	Staff	9		2025-11-04 14:41:58.797	2025-11-04 14:41:58.797	2025-11-04 14:41:58.802	\N	\N	\N	Support	\N
921	gbbzsmpw7cp57ht6u6mwkj4v	590063	นาย วุฒินันต์ ตะวัน	PCM	ST	Staff	9		2025-11-04 14:41:58.888	2025-11-04 14:41:58.888	\N	\N	\N	\N	Support	\N
922	gbbzsmpw7cp57ht6u6mwkj4v	590063	นาย วุฒินันต์ ตะวัน	PCM	ST	Staff	9		2025-11-04 14:41:58.888	2025-11-04 14:41:58.888	2025-11-04 14:41:58.894	\N	\N	\N	Support	\N
925	g6erteaz15a50dmx2wlmnacc	590065	นาย สัญญา หกขุนทด	PCM	Q-GATE	Staff	9		2025-11-04 14:41:58.979	2025-11-04 14:41:58.979	\N	\N	\N	\N	Support	\N
926	g6erteaz15a50dmx2wlmnacc	590065	นาย สัญญา หกขุนทด	PCM	Q-GATE	Staff	9		2025-11-04 14:41:58.979	2025-11-04 14:41:58.979	2025-11-04 14:41:58.987	\N	\N	\N	Support	\N
873	opi3sgzodk2ye1552ilwumps	580062	น.ส. อัญชลี หมั่นหาทรัพย์	HRD	TM	Team Manager	10		2025-11-04 14:41:57.807	2025-11-20 14:30:29.082	\N	\N	1	\N	Non Production	anchalee@aoyama.co.th
928	q70gemsalupvbw5m08wh5xhg	590066	น.ส. ดวงจันทร์ ตนัยต่อกุล	PDT4	UB	Staff	9		2025-11-04 14:41:59.025	2025-11-04 14:41:59.025	2025-11-04 14:41:59.032	\N	\N	\N	Production	\N
935	z4zjij2zmdsqugid4j0i7lna	590072	นาย สมควร มะโนสิน	PDT1	M6	Leader	9		2025-11-04 14:41:59.205	2025-11-04 14:41:59.205	\N	\N	\N	\N	Production	\N
936	z4zjij2zmdsqugid4j0i7lna	590072	นาย สมควร มะโนสิน	PDT1	M6	Leader	9		2025-11-04 14:41:59.205	2025-11-04 14:41:59.205	2025-11-04 14:41:59.212	\N	\N	\N	Production	\N
939	jblawv3cuznll0hhi11ibefo	590076	นาย วิชัย ปานทะยักษ์	PDM	FC	Staff	9		2025-11-04 14:41:59.289	2025-11-04 14:41:59.289	\N	\N	\N	\N	Support	\N
940	jblawv3cuznll0hhi11ibefo	590076	นาย วิชัย ปานทะยักษ์	PDM	FC	Staff	9		2025-11-04 14:41:59.289	2025-11-04 14:41:59.289	2025-11-04 14:41:59.294	\N	\N	\N	Support	\N
947	r6pxkle6xppvhjs3kg0bbrf0	590084	น.ส. ลัดดาวัลย์ เหล่าบุตรศรี	QAD	IP	Staff	8		2025-11-04 14:41:59.465	2025-11-04 14:41:59.465	\N	\N	\N	\N	Support	\N
948	r6pxkle6xppvhjs3kg0bbrf0	590084	น.ส. ลัดดาวัลย์ เหล่าบุตรศรี	QAD	IP	Staff	8		2025-11-04 14:41:59.465	2025-11-04 14:41:59.465	2025-11-04 14:41:59.472	\N	\N	\N	Support	\N
951	coo7b5m9mpemkd9keukpt3xz	600013	นาย อดุลย์เดช เศษหน้าเวศ	PDT3	GM	Foreman	8	เข้าอบรม	2025-11-04 14:41:59.55	2025-11-04 14:41:59.55	\N	\N	\N	\N	Production	\N
952	coo7b5m9mpemkd9keukpt3xz	600013	นาย อดุลย์เดช เศษหน้าเวศ	PDT3	GM	Foreman	8	เข้าอบรม	2025-11-04 14:41:59.55	2025-11-04 14:41:59.55	2025-11-04 14:41:59.555	\N	\N	\N	Production	\N
955	p8yrxsatxkcn67ffhvu3vyjz	600022	นาย วุฒิชัย นุชชาวนา	PDM	FC	Staff	8		2025-11-04 14:41:59.642	2025-11-04 14:41:59.642	\N	\N	\N	\N	Support	\N
956	p8yrxsatxkcn67ffhvu3vyjz	600022	นาย วุฒิชัย นุชชาวนา	PDM	FC	Staff	8		2025-11-04 14:41:59.642	2025-11-04 14:41:59.642	2025-11-04 14:41:59.647	\N	\N	\N	Support	\N
959	sjhgtqms96bnoq78kpy5jx9n	600027	นาย พิทยาธร สุดาปัน	PDM	FC	Staff	8		2025-11-04 14:41:59.729	2025-11-04 14:41:59.729	\N	\N	\N	\N	Support	\N
960	sjhgtqms96bnoq78kpy5jx9n	600027	นาย พิทยาธร สุดาปัน	PDM	FC	Staff	8		2025-11-04 14:41:59.729	2025-11-04 14:41:59.729	2025-11-04 14:41:59.735	\N	\N	\N	Support	\N
963	jvbascmwi50ho2gz1rue18rr	600032	นาง บัวเรียน พรมวัน	QAD	QC2	Leader	8		2025-11-04 14:41:59.823	2025-11-04 14:41:59.823	\N	\N	\N	\N	Support	\N
964	jvbascmwi50ho2gz1rue18rr	600032	นาง บัวเรียน พรมวัน	QAD	QC2	Leader	8		2025-11-04 14:41:59.823	2025-11-04 14:41:59.823	2025-11-04 14:41:59.829	\N	\N	\N	Support	\N
971	jvezevmerfg81cj4ob076cg1	600045	นาย บุญชอบ สอนผักแว่น	PDT1	EG	Staff	8		2025-11-04 14:42:00.001	2025-11-04 14:42:00.001	\N	\N	\N	\N	Production	\N
972	jvezevmerfg81cj4ob076cg1	600045	นาย บุญชอบ สอนผักแว่น	PDT1	EG	Staff	8		2025-11-04 14:42:00.001	2025-11-04 14:42:00.001	2025-11-04 14:42:00.023	\N	\N	\N	Production	\N
975	u2nhjqrrqnaffqb9cmgm3xtl	600047	นาย วีรยุทธ วันแสวง	PDT2	OQ	Staff	8		2025-11-04 14:42:00.093	2025-11-04 14:42:00.093	\N	\N	\N	\N	Production	\N
976	u2nhjqrrqnaffqb9cmgm3xtl	600047	นาย วีรยุทธ วันแสวง	PDT2	OQ	Staff	8		2025-11-04 14:42:00.093	2025-11-04 14:42:00.093	2025-11-04 14:42:00.099	\N	\N	\N	Production	\N
979	j8d3vo6tw3uefy3fe5err8yd	600050	นาย พิชิต บุญชัย	PDM	FC	Staff	8		2025-11-04 14:42:00.171	2025-11-04 14:42:00.171	\N	\N	\N	\N	Support	\N
980	j8d3vo6tw3uefy3fe5err8yd	600050	นาย พิชิต บุญชัย	PDM	FC	Staff	8		2025-11-04 14:42:00.171	2025-11-04 14:42:00.171	2025-11-04 14:42:00.187	\N	\N	\N	Support	\N
983	ewm12lfaxgwhrydwa2yheqf6	600054	นาย ปัญญา ทองสุข	QAD	QC2	Staff	8		2025-11-04 14:42:00.267	2025-11-04 14:42:00.267	\N	\N	\N	\N	Support	\N
984	ewm12lfaxgwhrydwa2yheqf6	600054	นาย ปัญญา ทองสุข	QAD	QC2	Staff	8		2025-11-04 14:42:00.267	2025-11-04 14:42:00.267	2025-11-04 14:42:00.272	\N	\N	\N	Support	\N
987	wtpzko8k73y8ysziha0s5dk4	600056	น.ส. อรสา เซิ้งสูงเนิน	QAD	IP	Staff	8		2025-11-04 14:42:00.357	2025-11-04 14:42:00.357	\N	\N	\N	\N	Support	\N
988	wtpzko8k73y8ysziha0s5dk4	600056	น.ส. อรสา เซิ้งสูงเนิน	QAD	IP	Staff	8		2025-11-04 14:42:00.357	2025-11-04 14:42:00.357	2025-11-04 14:42:00.362	\N	\N	\N	Support	\N
991	l3ow11pgv8led8hwvsfgxrgu	600063	น.ส. อภิญญา รุ่งเรือง	QAD	QC1	Leader	8		2025-11-04 14:42:00.425	2025-11-04 14:42:00.425	\N	\N	\N	\N	Support	\N
992	l3ow11pgv8led8hwvsfgxrgu	600063	น.ส. อภิญญา รุ่งเรือง	QAD	QC1	Leader	8		2025-11-04 14:42:00.425	2025-11-04 14:42:00.425	2025-11-04 14:42:00.43	\N	\N	\N	Support	\N
995	gtq9jvhidhl2o0a5xz8x6syf	600072	น.ส. พรพรรณ พิลามาตร์	QAD	IP	Staff	8		2025-11-04 14:42:00.514	2025-11-04 14:42:00.514	\N	\N	\N	\N	Support	\N
996	gtq9jvhidhl2o0a5xz8x6syf	600072	น.ส. พรพรรณ พิลามาตร์	QAD	IP	Staff	8		2025-11-04 14:42:00.514	2025-11-04 14:42:00.514	2025-11-04 14:42:00.529	\N	\N	\N	Support	\N
999	t6wray7dou47goke05udirky	600078	นาย วุฒิไกร ลักษณะจันทร์	PCM	PK	Leader	8		2025-11-04 14:42:00.581	2025-11-04 14:42:00.581	\N	\N	\N	\N	Support	\N
1000	t6wray7dou47goke05udirky	600078	นาย วุฒิไกร ลักษณะจันทร์	PCM	PK	Leader	8		2025-11-04 14:42:00.581	2025-11-04 14:42:00.581	2025-11-04 14:42:00.602	\N	\N	\N	Support	\N
1003	o62b4yhpdr85do49nuam8k8y	600087	นาย กีรติ กันทาหาญ	PDT4	UB	Staff	8		2025-11-04 14:42:00.69	2025-11-04 14:42:00.69	\N	\N	\N	\N	Production	\N
1004	o62b4yhpdr85do49nuam8k8y	600087	นาย กีรติ กันทาหาญ	PDT4	UB	Staff	8		2025-11-04 14:42:00.69	2025-11-04 14:42:00.69	2025-11-04 14:42:00.697	\N	\N	\N	Production	\N
1007	ghak5ubkndgqrd4boif1ftx4	600095	นาย อมร แก้วเกิด	PDT4	UB	Junior	7		2025-11-04 14:42:00.783	2025-11-04 14:42:00.783	\N	\N	\N	\N	Production	\N
931	k6tyoy2s7vco68yu3v0l1km7	590068	นาย ประจักษ์ ท่อทอง	PDT1	TM	Assistant Department Manager	9		2025-11-04 14:41:59.116	2025-11-20 14:31:10.151	\N	\N	1	\N	Production	prajak@aoyama.co.th
943	jz2sxvuzd64spkvdd0ryuwii	590078	นาย เอกชัย ใจปันธิ	PDT3	TM	Team Manager	9		2025-11-04 14:41:59.362	2025-11-20 14:31:18.763	\N	\N	1	\N	Production	eakachai_j@aoyama.co.th
929	vpiha2wtfplxwy0p5s4xs049	590067	นาย อดิเรก น้อยสิงห์	PDT1	NT	Junior	9		2025-11-04 14:41:59.072	2025-11-04 14:41:59.072	\N	\N	\N	\N	Production	\N
930	vpiha2wtfplxwy0p5s4xs049	590067	นาย อดิเรก น้อยสิงห์	PDT1	NT	Junior	9		2025-11-04 14:41:59.072	2025-11-04 14:41:59.072	2025-11-04 14:41:59.082	\N	\N	\N	Production	\N
937	gpe62wrb6hx60u1wk4kws0st	590074	นาย ธัชยา ดอนเปตรง	HRD	HR	Staff	9		2025-11-04 14:41:59.246	2025-11-04 14:41:59.246	\N	\N	\N	\N	Non Production	\N
938	gpe62wrb6hx60u1wk4kws0st	590074	นาย ธัชยา ดอนเปตรง	HRD	HR	Staff	9		2025-11-04 14:41:59.246	2025-11-04 14:41:59.246	2025-11-04 14:41:59.251	\N	\N	\N	Non Production	\N
941	blw0vbse0ag1atvif44hf3gf	590077	นาย ศุภฤกษ์ หอมเลิศ	PDM	FC	Staff	9		2025-11-04 14:41:59.33	2025-11-04 14:41:59.33	\N	\N	\N	\N	Support	\N
942	blw0vbse0ag1atvif44hf3gf	590077	นาย ศุภฤกษ์ หอมเลิศ	PDM	FC	Staff	9		2025-11-04 14:41:59.33	2025-11-04 14:41:59.33	2025-11-04 14:41:59.335	\N	\N	\N	Support	\N
945	aci2pmlexma1hld3twah1yha	590079	นาย ณัฐวุฒิ บุญฤทธิ์	PCM	ST	Staff	9		2025-11-04 14:41:59.422	2025-11-04 14:41:59.422	\N	\N	\N	\N	Support	\N
946	aci2pmlexma1hld3twah1yha	590079	นาย ณัฐวุฒิ บุญฤทธิ์	PCM	ST	Staff	9		2025-11-04 14:41:59.422	2025-11-04 14:41:59.422	2025-11-04 14:41:59.427	\N	\N	\N	Support	\N
949	r2tlptfkdbdfuk3yhsmfsjii	600011	นาย ไชยยันต์ อินทร์ชื่น	PDT4	JP	Staff	8		2025-11-04 14:41:59.509	2025-11-04 14:41:59.509	\N	\N	\N	\N	Production	\N
950	r2tlptfkdbdfuk3yhsmfsjii	600011	นาย ไชยยันต์ อินทร์ชื่น	PDT4	JP	Staff	8		2025-11-04 14:41:59.509	2025-11-04 14:41:59.509	2025-11-04 14:41:59.516	\N	\N	\N	Production	\N
953	k6bbm8yte9lsikno398fyyzm	600021	นาย เพิ่มพล ออสันเทียะ	PDT2	OQ	Staff	8		2025-11-04 14:41:59.593	2025-11-04 14:41:59.593	\N	\N	\N	\N	Production	\N
954	k6bbm8yte9lsikno398fyyzm	600021	นาย เพิ่มพล ออสันเทียะ	PDT2	OQ	Staff	8		2025-11-04 14:41:59.593	2025-11-04 14:41:59.593	2025-11-04 14:41:59.602	\N	\N	\N	Production	\N
961	aj23hhbhp9i6w0c8tt6e12ci	600031	นาย วีรภัทร แก้วแวว	PDT3	BZ	Staff	8		2025-11-04 14:41:59.776	2025-11-04 14:41:59.776	\N	\N	\N	\N	Production	\N
962	aj23hhbhp9i6w0c8tt6e12ci	600031	นาย วีรภัทร แก้วแวว	PDT3	BZ	Staff	8		2025-11-04 14:41:59.776	2025-11-04 14:41:59.776	2025-11-04 14:41:59.798	\N	\N	\N	Production	\N
965	kudsn314duvz1wxbnuvanro0	600033	น.ส. ผกามาศ โคตะถา	FNC	AC	Leader	8		2025-11-04 14:41:59.868	2025-11-04 14:41:59.868	\N	\N	\N	\N	Non Production	\N
966	kudsn314duvz1wxbnuvanro0	600033	น.ส. ผกามาศ โคตะถา	FNC	AC	Leader	8		2025-11-04 14:41:59.868	2025-11-04 14:41:59.868	2025-11-04 14:41:59.873	\N	\N	\N	Non Production	\N
969	a3womaeb6akttagavjljunmi	600044	นาย สมชาย โพธิ์ไชย	PDT1	M6	Leader	8		2025-11-04 14:41:59.952	2025-11-04 14:41:59.952	\N	\N	\N	\N	Production	\N
970	a3womaeb6akttagavjljunmi	600044	นาย สมชาย โพธิ์ไชย	PDT1	M6	Leader	8		2025-11-04 14:41:59.952	2025-11-04 14:41:59.952	2025-11-04 14:41:59.957	\N	\N	\N	Production	\N
973	itdrux4ld8ayy3xi4wmrgj9p	600046	นาย สิทธิพล แสนนา	PDT1	EG	Staff	8		2025-11-04 14:42:00.047	2025-11-04 14:42:00.047	\N	\N	\N	\N	Production	\N
974	itdrux4ld8ayy3xi4wmrgj9p	600046	นาย สิทธิพล แสนนา	PDT1	EG	Staff	8		2025-11-04 14:42:00.047	2025-11-04 14:42:00.047	2025-11-04 14:42:00.054	\N	\N	\N	Production	\N
977	h2aky5wh6y5triqaf2u9hjm6	600048	นาย กฤตนัย นามอาษา	PDT2	OQ	Staff	8		2025-11-04 14:42:00.138	2025-11-04 14:42:00.138	\N	\N	\N	\N	Production	\N
978	h2aky5wh6y5triqaf2u9hjm6	600048	นาย กฤตนัย นามอาษา	PDT2	OQ	Staff	8		2025-11-04 14:42:00.138	2025-11-04 14:42:00.138	2025-11-04 14:42:00.142	\N	\N	\N	Production	\N
981	h6p0ehfwziwgeovod7ubp6ub	600052	นาย ธนกฤต จันทะคุณ	PDM	FC	Staff	8		2025-11-04 14:42:00.225	2025-11-04 14:42:00.225	\N	\N	\N	\N	Support	\N
982	h6p0ehfwziwgeovod7ubp6ub	600052	นาย ธนกฤต จันทะคุณ	PDM	FC	Staff	8		2025-11-04 14:42:00.225	2025-11-04 14:42:00.225	2025-11-04 14:42:00.241	\N	\N	\N	Support	\N
985	exdgjnb3h9in5pf7kmtxsy74	600055	น.ส. พรรณณิภา บัวคำนิล	QAD	IP	Junior	8		2025-11-04 14:42:00.314	2025-11-04 14:42:00.314	\N	\N	\N	\N	Support	\N
986	exdgjnb3h9in5pf7kmtxsy74	600055	น.ส. พรรณณิภา บัวคำนิล	QAD	IP	Junior	8		2025-11-04 14:42:00.314	2025-11-04 14:42:00.314	2025-11-04 14:42:00.319	\N	\N	\N	Support	\N
989	qouy01soxhxevgb7hp46znpd	600062	นาย ภานุเดช เดชพร	PDT1	M8	Staff	8		2025-11-04 14:42:00.384	2025-11-04 14:42:00.384	\N	\N	\N	\N	Production	\N
990	qouy01soxhxevgb7hp46znpd	600062	นาย ภานุเดช เดชพร	PDT1	M8	Staff	8		2025-11-04 14:42:00.384	2025-11-04 14:42:00.384	2025-11-04 14:42:00.389	\N	\N	\N	Production	\N
993	ofbyykik5xd9bhtlwwxp81pi	600071	นาย นเรศ ศรีบุญ	PCM	ST	Junior	8		2025-11-04 14:42:00.468	2025-11-04 14:42:00.468	\N	\N	\N	\N	Support	\N
994	ofbyykik5xd9bhtlwwxp81pi	600071	นาย นเรศ ศรีบุญ	PCM	ST	Junior	8		2025-11-04 14:42:00.468	2025-11-04 14:42:00.468	2025-11-04 14:42:00.475	\N	\N	\N	Support	\N
997	nghy2eruq7euxbppqlytkib2	600074	นาย สิทธิโชค ปล่อยทุม	PDT1	EG	Staff	8		2025-11-04 14:42:00.554	2025-11-04 14:42:00.554	\N	\N	\N	\N	Production	\N
998	nghy2eruq7euxbppqlytkib2	600074	นาย สิทธิโชค ปล่อยทุม	PDT1	EG	Staff	8		2025-11-04 14:42:00.554	2025-11-04 14:42:00.554	2025-11-04 14:42:00.559	\N	\N	\N	Production	\N
1001	nauhr8wos8aynqwg63wuuf1m	600079	นาย สุวิทย์ บุญเที่ยง	PDT3	GM	Staff	8		2025-11-04 14:42:00.64	2025-11-04 14:42:00.64	\N	\N	\N	\N	Production	\N
1002	nauhr8wos8aynqwg63wuuf1m	600079	นาย สุวิทย์ บุญเที่ยง	PDT3	GM	Staff	8		2025-11-04 14:42:00.64	2025-11-04 14:42:00.64	2025-11-04 14:42:00.65	\N	\N	\N	Production	\N
1005	st948dfbgztbyeyfrxx7ka53	600091	นาย ที่รัก มาวงค์	PDT3	BZ	Leader	7	เข้าอบรม	2025-11-04 14:42:00.737	2025-11-04 14:42:00.737	\N	\N	\N	\N	Production	\N
1006	st948dfbgztbyeyfrxx7ka53	600091	นาย ที่รัก มาวงค์	PDT3	BZ	Leader	7	เข้าอบรม	2025-11-04 14:42:00.737	2025-11-04 14:42:00.737	2025-11-04 14:42:00.742	\N	\N	\N	Production	\N
1009	kfipvlkzvnocgil6yi1nz9wp	600097	นาย วุจา โรปรัมย์	QAD	IP	Staff	7		2025-11-04 14:42:00.828	2025-11-04 14:42:00.828	\N	\N	\N	\N	Support	\N
957	owajmobhk1vairzy970p1cub	600026	นาย อนุชา เที่ยงธรรม	PDT2	TM	Team Manager	8		2025-11-04 14:41:59.685	2025-11-20 14:31:15.259	\N	\N	1	\N	Production	anucha@aoyama.co.th
1008	ghak5ubkndgqrd4boif1ftx4	600095	นาย อมร แก้วเกิด	PDT4	UB	Junior	7		2025-11-04 14:42:00.783	2025-11-04 14:42:00.783	2025-11-04 14:42:00.789	\N	\N	\N	Production	\N
1011	pm2dha2pdfc2ss4k97ptkoty	60K251	น.ส. จิตรานุช ยิ่งยง	QAD	QC2	Staff	8		2025-11-04 14:42:00.872	2025-11-04 14:42:00.872	\N	\N	\N	\N	Support	\N
1012	pm2dha2pdfc2ss4k97ptkoty	60K251	น.ส. จิตรานุช ยิ่งยง	QAD	QC2	Staff	8		2025-11-04 14:42:00.872	2025-11-04 14:42:00.872	2025-11-04 14:42:00.879	\N	\N	\N	Support	\N
1015	maasdowqy55n6i90d7eklg25	610004	น.ส. อรพรรณ อินทำ	HRD	TC	Staff	7		2025-11-04 14:42:00.964	2025-11-04 14:42:00.964	\N	\N	\N	\N	Non Production	\N
1016	maasdowqy55n6i90d7eklg25	610004	น.ส. อรพรรณ อินทำ	HRD	TC	Staff	7		2025-11-04 14:42:00.964	2025-11-04 14:42:00.964	2025-11-04 14:42:00.97	\N	\N	\N	Non Production	\N
1019	uskgsl47a1u2hlxbnllfuh3s	610008	นาย ภานุพงษ์ รักษาภักดี	PDT1	M8	Staff	7		2025-11-04 14:42:01.056	2025-11-04 14:42:01.056	\N	\N	\N	\N	Production	\N
1020	uskgsl47a1u2hlxbnllfuh3s	610008	นาย ภานุพงษ์ รักษาภักดี	PDT1	M8	Staff	7		2025-11-04 14:42:01.056	2025-11-04 14:42:01.056	2025-11-04 14:42:01.062	\N	\N	\N	Production	\N
1023	ehnttvvlyn3dt9niig448zyc	610012	นาย บุญทวี จุรารม	PDT3	BZ	Staff	7		2025-11-04 14:42:01.151	2025-11-04 14:42:01.151	\N	\N	\N	\N	Production	\N
1024	ehnttvvlyn3dt9niig448zyc	610012	นาย บุญทวี จุรารม	PDT3	BZ	Staff	7		2025-11-04 14:42:01.151	2025-11-04 14:42:01.151	2025-11-04 14:42:01.156	\N	\N	\N	Production	\N
1027	ap9ojpjjc8bl20gxrnc1kutn	610016	น.ส. นิยากร ถาวรโสม	SAM	SF	Staff	7		2025-11-04 14:42:01.244	2025-11-04 14:42:01.244	\N	\N	\N	\N	Support	\N
1028	ap9ojpjjc8bl20gxrnc1kutn	610016	น.ส. นิยากร ถาวรโสม	SAM	SF	Staff	7		2025-11-04 14:42:01.244	2025-11-04 14:42:01.244	2025-11-04 14:42:01.25	\N	\N	\N	Support	\N
1031	rlftpjn0kdxqyyvkkupapvff	610020	นาย ณัฐวัฒน์ เชื้อคำ	PCM	ST	Junior	7		2025-11-04 14:42:01.338	2025-11-04 14:42:01.338	\N	\N	\N	\N	Support	\N
1032	rlftpjn0kdxqyyvkkupapvff	610020	นาย ณัฐวัฒน์ เชื้อคำ	PCM	ST	Junior	7		2025-11-04 14:42:01.338	2025-11-04 14:42:01.338	2025-11-04 14:42:01.344	\N	\N	\N	Support	\N
1035	v4dohakofqskz2bitghysio3	610023	น.ส. สุพรรษา ทรพับ	HRD	SC	Staff	7		2025-11-04 14:42:01.418	2025-11-04 14:42:01.418	\N	\N	\N	\N	Non Production	\N
1036	v4dohakofqskz2bitghysio3	610023	น.ส. สุพรรษา ทรพับ	HRD	SC	Staff	7		2025-11-04 14:42:01.418	2025-11-04 14:42:01.418	2025-11-04 14:42:01.437	\N	\N	\N	Non Production	\N
1039	tsmvqrra4au10hw1a8aamee4	610028	นาย วิทยา วิรัชชัย	PCM	TP	Junior	7		2025-11-04 14:42:01.522	2025-11-04 14:42:01.522	\N	\N	\N	\N	Support	\N
1040	tsmvqrra4au10hw1a8aamee4	610028	นาย วิทยา วิรัชชัย	PCM	TP	Junior	7		2025-11-04 14:42:01.522	2025-11-04 14:42:01.522	2025-11-04 14:42:01.529	\N	\N	\N	Support	\N
1043	fy8zuygzqscpprieesqr54aa	610033	น.ส. ณัฐสิมา วงค์ชัยยา	MKT	SL	Staff	7		2025-11-04 14:42:01.619	2025-11-04 14:42:01.619	\N	\N	\N	\N	Non Production	\N
1044	fy8zuygzqscpprieesqr54aa	610033	น.ส. ณัฐสิมา วงค์ชัยยา	MKT	SL	Staff	7		2025-11-04 14:42:01.619	2025-11-04 14:42:01.619	2025-11-04 14:42:01.64	\N	\N	\N	Non Production	\N
1047	hdwlfdp69qj592qk3zw9xycd	610038	น.ส. สณียา สุดสัมฤทธิ์	QAD	IP	Staff	6		2025-11-04 14:42:01.714	2025-11-04 14:42:01.714	\N	\N	\N	\N	Support	\N
1048	hdwlfdp69qj592qk3zw9xycd	610038	น.ส. สณียา สุดสัมฤทธิ์	QAD	IP	Staff	6		2025-11-04 14:42:01.714	2025-11-04 14:42:01.714	2025-11-04 14:42:01.735	\N	\N	\N	Support	\N
1051	cmvck7jxnq3009giob13s2bz	610040	นาย ศุภวัตร สมจิตร	PDT1	NT	Staff	6		2025-11-04 14:42:01.804	2025-11-04 14:42:01.804	\N	\N	\N	\N	Production	\N
1052	cmvck7jxnq3009giob13s2bz	610040	นาย ศุภวัตร สมจิตร	PDT1	NT	Staff	6		2025-11-04 14:42:01.804	2025-11-04 14:42:01.804	2025-11-04 14:42:01.81	\N	\N	\N	Production	\N
1055	sff629bpvotdrfrvps6kmgml	620003	นาย จีรพันธ์ อินทวงศ์	PDT1	M10	Leader	6		2025-11-04 14:42:01.898	2025-11-04 14:42:01.898	\N	\N	\N	\N	Production	\N
1056	sff629bpvotdrfrvps6kmgml	620003	นาย จีรพันธ์ อินทวงศ์	PDT1	M10	Leader	6		2025-11-04 14:42:01.898	2025-11-04 14:42:01.898	2025-11-04 14:42:01.904	\N	\N	\N	Production	\N
1059	mdodj2x4nywrmjq2n8gxn57m	620007	นาย วัชระ ศรีคำ	PDT2	OQ	Staff	6		2025-11-04 14:42:01.989	2025-11-04 14:42:01.989	\N	\N	\N	\N	Production	\N
1060	mdodj2x4nywrmjq2n8gxn57m	620007	นาย วัชระ ศรีคำ	PDT2	OQ	Staff	6		2025-11-04 14:42:01.989	2025-11-04 14:42:01.989	2025-11-04 14:42:01.996	\N	\N	\N	Production	\N
1063	s33mfb6nnkozdta54p9abv7v	620010	น.ส. สุลักขณา สุดโสม	PDM	PC	Staff	6		2025-11-04 14:42:02.082	2025-11-04 14:42:02.082	\N	\N	\N	\N	Support	\N
1064	s33mfb6nnkozdta54p9abv7v	620010	น.ส. สุลักขณา สุดโสม	PDM	PC	Staff	6		2025-11-04 14:42:02.082	2025-11-04 14:42:02.082	2025-11-04 14:42:02.1	\N	\N	\N	Support	\N
1067	wfbns12jxoa6bw9o6w9xmhpc	620013	นาย นิรุจน์ เจริญสุข	PDT1	M6	Staff	6		2025-11-04 14:42:02.172	2025-11-04 14:42:02.172	\N	\N	\N	\N	Production	\N
1068	wfbns12jxoa6bw9o6w9xmhpc	620013	นาย นิรุจน์ เจริญสุข	PDT1	M6	Staff	6		2025-11-04 14:42:02.172	2025-11-04 14:42:02.172	2025-11-04 14:42:02.178	\N	\N	\N	Production	\N
1071	cxx08ye5l32adplf17ld16us	620019	นาย สรศักดิ์ สง่าเนตร์	PCM	ST	Staff	6		2025-11-04 14:42:02.267	2025-11-04 14:42:02.267	\N	\N	\N	\N	Support	\N
1072	cxx08ye5l32adplf17ld16us	620019	นาย สรศักดิ์ สง่าเนตร์	PCM	ST	Staff	6		2025-11-04 14:42:02.267	2025-11-04 14:42:02.267	2025-11-04 14:42:02.273	\N	\N	\N	Support	\N
1075	trjpnbg2rw7cwy6hqd4hgkaa	620023	น.ส. อธิฏฐาน ชัยศรี	HRD	SC	Staff	6		2025-11-04 14:42:02.356	2025-11-04 14:42:02.356	\N	\N	\N	\N	Non Production	\N
1076	trjpnbg2rw7cwy6hqd4hgkaa	620023	น.ส. อธิฏฐาน ชัยศรี	HRD	SC	Staff	6		2025-11-04 14:42:02.356	2025-11-04 14:42:02.356	2025-11-04 14:42:02.363	\N	\N	\N	Non Production	\N
1079	y5877xnn5hkbvqlle44qsn91	620027	นาย ไมตรี จันยุคันโท	PDT3	GM	Staff	6		2025-11-04 14:42:02.448	2025-11-04 14:42:02.448	\N	\N	\N	\N	Production	\N
1080	y5877xnn5hkbvqlle44qsn91	620027	นาย ไมตรี จันยุคันโท	PDT3	GM	Staff	6		2025-11-04 14:42:02.448	2025-11-04 14:42:02.448	2025-11-04 14:42:02.454	\N	\N	\N	Production	\N
1083	c92jkrf5u23ofi8upnb5h7ky	620029	นาย ณัฐวุฒิ บุญมี	QAD	IP	Staff	6		2025-11-04 14:42:02.532	2025-11-04 14:42:02.532	\N	\N	\N	\N	Support	\N
1084	c92jkrf5u23ofi8upnb5h7ky	620029	นาย ณัฐวุฒิ บุญมี	QAD	IP	Staff	6		2025-11-04 14:42:02.532	2025-11-04 14:42:02.532	2025-11-04 14:42:02.538	\N	\N	\N	Support	\N
1087	tqrinjl1pvgh7ldsifoxsvp5	620034	นาย พงศกร บูระพันธ์	PDT2	OQ	Staff	6		2025-11-04 14:42:02.625	2025-11-04 14:42:02.625	\N	\N	\N	\N	Production	\N
1088	tqrinjl1pvgh7ldsifoxsvp5	620034	นาย พงศกร บูระพันธ์	PDT2	OQ	Staff	6		2025-11-04 14:42:02.625	2025-11-04 14:42:02.625	2025-11-04 14:42:02.631	\N	\N	\N	Production	\N
1010	kfipvlkzvnocgil6yi1nz9wp	600097	นาย วุจา โรปรัมย์	QAD	IP	Staff	7		2025-11-04 14:42:00.828	2025-11-04 14:42:00.828	2025-11-04 14:42:00.834	\N	\N	\N	Support	\N
1013	ueprwmldj8wq5kmu1za3xhue	610002	นาย ชาญณรงค์ ไชยศิลป์	PDT4	JA	Staff	7		2025-11-04 14:42:00.919	2025-11-04 14:42:00.919	\N	\N	\N	\N	Production	\N
1014	ueprwmldj8wq5kmu1za3xhue	610002	นาย ชาญณรงค์ ไชยศิลป์	PDT4	JA	Staff	7		2025-11-04 14:42:00.919	2025-11-04 14:42:00.919	2025-11-04 14:42:00.926	\N	\N	\N	Production	\N
1017	t25caumtpiidxvbb647utqx6	610007	นาย วีระศักดิ์ ผกาศรี	PDT1	M8	Junior	7		2025-11-04 14:42:01.01	2025-11-04 14:42:01.01	\N	\N	\N	\N	Production	\N
1018	t25caumtpiidxvbb647utqx6	610007	นาย วีระศักดิ์ ผกาศรี	PDT1	M8	Junior	7		2025-11-04 14:42:01.01	2025-11-04 14:42:01.01	2025-11-04 14:42:01.031	\N	\N	\N	Production	\N
1021	nt9hslt145vk5ecol097fc54	610011	นาย ยงยุทธ ฉลูศรี	PDT1	NT	Leader	7		2025-11-04 14:42:01.104	2025-11-04 14:42:01.104	\N	\N	\N	\N	Production	\N
1022	nt9hslt145vk5ecol097fc54	610011	นาย ยงยุทธ ฉลูศรี	PDT1	NT	Leader	7		2025-11-04 14:42:01.104	2025-11-04 14:42:01.104	2025-11-04 14:42:01.11	\N	\N	\N	Production	\N
1033	aam2qppcf9zsraxjqf284vpn	610021	นาย อรรถากร ดู่ป้อง	PDM	FC	Staff	7		2025-11-04 14:42:01.384	2025-11-04 14:42:01.384	\N	\N	\N	\N	Support	\N
1034	aam2qppcf9zsraxjqf284vpn	610021	นาย อรรถากร ดู่ป้อง	PDM	FC	Staff	7		2025-11-04 14:42:01.384	2025-11-04 14:42:01.384	2025-11-04 14:42:01.389	\N	\N	\N	Support	\N
1037	cm3ivj8mevhdyl7a0noobdd8	610026	น.ส. ชฎาชา ศรีสังข์	HRD	GA	Staff	7		2025-11-04 14:42:01.477	2025-11-04 14:42:01.477	\N	\N	\N	\N	Non Production	\N
1038	cm3ivj8mevhdyl7a0noobdd8	610026	น.ส. ชฎาชา ศรีสังข์	HRD	GA	Staff	7		2025-11-04 14:42:01.477	2025-11-04 14:42:01.477	2025-11-04 14:42:01.484	\N	\N	\N	Non Production	\N
1041	yg4eqaa6zv2d3a4ilf1is7zd	610032	นาย สถาพร ศรีสำราญ	PDT3	BZ	Staff	7		2025-11-04 14:42:01.57	2025-11-04 14:42:01.57	\N	\N	\N	\N	Production	\N
1042	yg4eqaa6zv2d3a4ilf1is7zd	610032	นาย สถาพร ศรีสำราญ	PDT3	BZ	Staff	7		2025-11-04 14:42:01.57	2025-11-04 14:42:01.57	2025-11-04 14:42:01.591	\N	\N	\N	Production	\N
1045	grdm7rpwfc8xje6tc8js3p3a	610036	นาย ธนารีย์ มณไฑวงศ์	HRD	SC	Staff	7		2025-11-04 14:42:01.666	2025-11-04 14:42:01.666	\N	\N	\N	\N	Non Production	\N
1046	grdm7rpwfc8xje6tc8js3p3a	610036	นาย ธนารีย์ มณไฑวงศ์	HRD	SC	Staff	7		2025-11-04 14:42:01.666	2025-11-04 14:42:01.666	2025-11-04 14:42:01.673	\N	\N	\N	Non Production	\N
1049	tfdxk37w2ttjlemk2jrd65gl	610039	นาย จีระศักดิ์ ปรีกมล	QAD	IP	Staff	6		2025-11-04 14:42:01.758	2025-11-04 14:42:01.758	\N	\N	\N	\N	Support	\N
1050	tfdxk37w2ttjlemk2jrd65gl	610039	นาย จีระศักดิ์ ปรีกมล	QAD	IP	Staff	6		2025-11-04 14:42:01.758	2025-11-04 14:42:01.758	2025-11-04 14:42:01.764	\N	\N	\N	Support	\N
1053	p4jqqbggsa5upycpyueamdt2	61T039	นาย สมชาย ราชวงศ์	PCM	ST	Staff	7		2025-11-04 14:42:01.85	2025-11-04 14:42:01.85	\N	\N	\N	\N	Support	\N
1054	p4jqqbggsa5upycpyueamdt2	61T039	นาย สมชาย ราชวงศ์	PCM	ST	Staff	7		2025-11-04 14:42:01.85	2025-11-04 14:42:01.85	2025-11-04 14:42:01.859	\N	\N	\N	Support	\N
1057	zngrqu09fgkshrnn9kwbhtnq	620006	นาย วิกรม แก้วคำ	PDT2	OQ	Staff	6		2025-11-04 14:42:01.943	2025-11-04 14:42:01.943	\N	\N	\N	\N	Production	\N
1058	zngrqu09fgkshrnn9kwbhtnq	620006	นาย วิกรม แก้วคำ	PDT2	OQ	Staff	6		2025-11-04 14:42:01.943	2025-11-04 14:42:01.943	2025-11-04 14:42:01.95	\N	\N	\N	Production	\N
1061	lp30oxzacstuw4l3nb44aya7	620009	น.ส. เบญจวรรณ บำรุงเอื้อ	PUD	PU2	Junior	6		2025-11-04 14:42:02.033	2025-11-04 14:42:02.033	\N	\N	\N	\N	Non Production	\N
1062	lp30oxzacstuw4l3nb44aya7	620009	น.ส. เบญจวรรณ บำรุงเอื้อ	PUD	PU2	Junior	6		2025-11-04 14:42:02.033	2025-11-04 14:42:02.033	2025-11-04 14:42:02.039	\N	\N	\N	Non Production	\N
1065	xzwly5c5ws0f8alwmi63k9wp	620012	นาย ภานุเดช ราชถา	PDT1	NT	Staff	6		2025-11-04 14:42:02.127	2025-11-04 14:42:02.127	\N	\N	\N	\N	Production	\N
1066	xzwly5c5ws0f8alwmi63k9wp	620012	นาย ภานุเดช ราชถา	PDT1	NT	Staff	6		2025-11-04 14:42:02.127	2025-11-04 14:42:02.127	2025-11-04 14:42:02.132	\N	\N	\N	Production	\N
1069	gcgcqfq45z7m3hqkdet0m514	620014	น.ส. สายฝน ดวงประโคน	QAD	QA	Junior	6		2025-11-04 14:42:02.217	2025-11-04 14:42:02.217	\N	\N	\N	\N	Support	\N
1070	gcgcqfq45z7m3hqkdet0m514	620014	น.ส. สายฝน ดวงประโคน	QAD	QA	Junior	6		2025-11-04 14:42:02.217	2025-11-04 14:42:02.217	2025-11-04 14:42:02.222	\N	\N	\N	Support	\N
1073	j8t9wz8ctui5uu2778feojlc	620020	นาย อำพล มายนอก	PDT1	NT	Junior	6		2025-11-04 14:42:02.311	2025-11-04 14:42:02.311	\N	\N	\N	\N	Production	\N
1074	j8t9wz8ctui5uu2778feojlc	620020	นาย อำพล มายนอก	PDT1	NT	Junior	6		2025-11-04 14:42:02.311	2025-11-04 14:42:02.311	2025-11-04 14:42:02.317	\N	\N	\N	Production	\N
1077	d16qvq2uyri0cjy7vlahlt93	620026	นาย เดชาธร มาวงค์	PCM	ST	Staff	6		2025-11-04 14:42:02.401	2025-11-04 14:42:02.401	\N	\N	\N	\N	Support	\N
1078	d16qvq2uyri0cjy7vlahlt93	620026	นาย เดชาธร มาวงค์	PCM	ST	Staff	6		2025-11-04 14:42:02.401	2025-11-04 14:42:02.401	2025-11-04 14:42:02.406	\N	\N	\N	Support	\N
1081	kk2uj6j451eviidu493sxdbj	620028	นาย ทรัพย์เจริญ มีคำแสน	PDT3	JC	Leader	6		2025-11-04 14:42:02.492	2025-11-04 14:42:02.492	\N	\N	\N	\N	Production	\N
1082	kk2uj6j451eviidu493sxdbj	620028	นาย ทรัพย์เจริญ มีคำแสน	PDT3	JC	Leader	6		2025-11-04 14:42:02.492	2025-11-04 14:42:02.492	2025-11-04 14:42:02.497	\N	\N	\N	Production	\N
1085	jqvdef1gyc0bdz0xcm0ze0op	620030	นาย ธีรวัฒน์ พิเดช	QAD	QC2	Staff	6		2025-11-04 14:42:02.578	2025-11-04 14:42:02.578	\N	\N	\N	\N	Support	\N
1086	jqvdef1gyc0bdz0xcm0ze0op	620030	นาย ธีรวัฒน์ พิเดช	QAD	QC2	Staff	6		2025-11-04 14:42:02.578	2025-11-04 14:42:02.578	2025-11-04 14:42:02.59	\N	\N	\N	Support	\N
1089	gl5n180yo1f6f00xuw8h79a2	620038	นาย มงคล สิงห์มักหม้อ	PDT3	BZ	Staff	6		2025-11-04 14:42:02.669	2025-11-04 14:42:02.669	\N	\N	\N	\N	Production	\N
1090	gl5n180yo1f6f00xuw8h79a2	620038	นาย มงคล สิงห์มักหม้อ	PDT3	BZ	Staff	6		2025-11-04 14:42:02.669	2025-11-04 14:42:02.669	2025-11-04 14:42:02.675	\N	\N	\N	Production	\N
1025	dyi6xq2mw6b3e8fqzw1bwx3o	610014	น.ส. รัชนีวรรณ แซ่ลี้	PCM	TP	Supervisor	7		2025-11-04 14:42:01.198	2025-11-20 14:31:32.041	\N	\N	1	\N	Support	ratchaneewan@aoyama.co.th
1091	g7cn6mzde33egjfl94o41v9d	620039	นาย วันชัย บุตรสอน	PDT3	BZ	Junior	6		2025-11-04 14:42:02.713	2025-11-04 14:42:02.713	\N	\N	\N	\N	Production	\N
1092	g7cn6mzde33egjfl94o41v9d	620039	นาย วันชัย บุตรสอน	PDT3	BZ	Junior	6		2025-11-04 14:42:02.713	2025-11-04 14:42:02.713	2025-11-04 14:42:02.718	\N	\N	\N	Production	\N
1095	eph0nuehlpkwtsy3miupjmnq	620041	นาย เสน่ห์ คุณวงค์	PDT1	NT	Staff	5		2025-11-04 14:42:02.804	2025-11-04 14:42:02.804	\N	\N	\N	\N	Production	\N
1096	eph0nuehlpkwtsy3miupjmnq	620041	นาย เสน่ห์ คุณวงค์	PDT1	NT	Staff	5		2025-11-04 14:42:02.804	2025-11-04 14:42:02.804	2025-11-04 14:42:02.813	\N	\N	\N	Production	\N
1099	x3v64z5g88eoaiablc1u07yc	62K042	น.ส. วรรณิดา คำผา	QAD	QC2	Staff	6		2025-11-04 14:42:02.894	2025-11-04 14:42:02.894	\N	\N	\N	\N	Support	\N
1100	x3v64z5g88eoaiablc1u07yc	62K042	น.ส. วรรณิดา คำผา	QAD	QC2	Staff	6		2025-11-04 14:42:02.894	2025-11-04 14:42:02.894	2025-11-04 14:42:02.9	\N	\N	\N	Support	\N
1103	xhk835zz4nyr3iahjeqfnadw	630001	นาย ธรรมสรณ์ นูมหันต์	PDM	IT	Staff	5		2025-11-04 14:42:02.999	2025-11-04 14:42:02.999	\N	\N	\N	\N	Support	\N
1104	xhk835zz4nyr3iahjeqfnadw	630001	นาย ธรรมสรณ์ นูมหันต์	PDM	IT	Staff	5		2025-11-04 14:42:02.999	2025-11-04 14:42:02.999	2025-11-04 14:42:03.011	\N	\N	\N	Support	\N
1107	tge9i48003fm34lxbi94dq2d	630003	นาย นภดล ศรีอิ่นแก้ว	ENI	EN	Junior	5		2025-11-04 14:42:03.125	2025-11-04 14:42:03.125	\N	\N	\N	\N	Support	\N
1108	tge9i48003fm34lxbi94dq2d	630003	นาย นภดล ศรีอิ่นแก้ว	ENI	EN	Junior	5		2025-11-04 14:42:03.125	2025-11-04 14:42:03.125	2025-11-04 14:42:03.13	\N	\N	\N	Support	\N
1111	hg3vfwobomoao5t26iv6xqr6	630006	นาย กิติศักดิ์ บุญเชิญ	PDT2	OQ	Staff	5		2025-11-04 14:42:03.214	2025-11-04 14:42:03.214	\N	\N	\N	\N	Production	\N
1112	hg3vfwobomoao5t26iv6xqr6	630006	นาย กิติศักดิ์ บุญเชิญ	PDT2	OQ	Staff	5		2025-11-04 14:42:03.214	2025-11-04 14:42:03.214	2025-11-04 14:42:03.221	\N	\N	\N	Production	\N
1115	drekjmln32osy44pbbp59vj6	630008	นาย เขษมศักดิ์ สุขอนันต์	PDT1	NT	Staff	5		2025-11-04 14:42:03.306	2025-11-04 14:42:03.306	\N	\N	\N	\N	Production	\N
1116	drekjmln32osy44pbbp59vj6	630008	นาย เขษมศักดิ์ สุขอนันต์	PDT1	NT	Staff	5		2025-11-04 14:42:03.306	2025-11-04 14:42:03.306	2025-11-04 14:42:03.313	\N	\N	\N	Production	\N
1119	l40thk641tk1i5v3qxre0i90	630011	นาย วงศกร พูลแก้ว	PDT1	M10	Junior	5		2025-11-04 14:42:03.395	2025-11-04 14:42:03.395	\N	\N	\N	\N	Production	\N
1120	l40thk641tk1i5v3qxre0i90	630011	นาย วงศกร พูลแก้ว	PDT1	M10	Junior	5		2025-11-04 14:42:03.395	2025-11-04 14:42:03.395	2025-11-04 14:42:03.401	\N	\N	\N	Production	\N
1123	akh4dalxy73zvgvte6a2mkdc	630015	ว่าที่ร.ต. ฉัตรพล สิงหาทิพย์	PDT4	EL	Foreman	5		2025-11-04 14:42:03.489	2025-11-04 14:42:03.489	\N	\N	\N	\N	Production	\N
1124	akh4dalxy73zvgvte6a2mkdc	630015	ว่าที่ร.ต. ฉัตรพล สิงหาทิพย์	PDT4	EL	Foreman	5		2025-11-04 14:42:03.489	2025-11-04 14:42:03.489	2025-11-04 14:42:03.495	\N	\N	\N	Production	\N
1127	e53xkac632krtjneo3gkea22	630032	นาย ลิขิต สัจจะ	PDT2	OQ	Leader	5		2025-11-04 14:42:03.579	2025-11-04 14:42:03.579	\N	\N	\N	\N	Production	\N
1128	e53xkac632krtjneo3gkea22	630032	นาย ลิขิต สัจจะ	PDT2	OQ	Leader	5		2025-11-04 14:42:03.579	2025-11-04 14:42:03.579	2025-11-04 14:42:03.585	\N	\N	\N	Production	\N
1131	ikqu5z78e3xx8kmqi6mxuoav	63K019	นาย ชัยพฤกษ์ พิมแพงรัก	PDM	FC	Staff	4		2025-11-04 14:42:03.671	2025-11-04 14:42:03.671	\N	\N	\N	\N	Support	\N
1132	ikqu5z78e3xx8kmqi6mxuoav	63K019	นาย ชัยพฤกษ์ พิมแพงรัก	PDM	FC	Staff	4		2025-11-04 14:42:03.671	2025-11-04 14:42:03.671	2025-11-04 14:42:03.677	\N	\N	\N	Support	\N
1135	cvi38qtx4hl8tk9mfkrr83li	640004	นาย ทศพล เพียรไทสงค์	PDT4	EL	Staff	4		2025-11-04 14:42:03.761	2025-11-04 14:42:03.761	\N	\N	\N	\N	Production	\N
1136	cvi38qtx4hl8tk9mfkrr83li	640004	นาย ทศพล เพียรไทสงค์	PDT4	EL	Staff	4		2025-11-04 14:42:03.761	2025-11-04 14:42:03.761	2025-11-04 14:42:03.766	\N	\N	\N	Production	\N
1139	o9cns1qk8cgm2el8jwai8s9v	640008	น.ส. พัชราภรณ์ มุ่งดี	PDT3	BZ	Staff	4		2025-11-04 14:42:03.848	2025-11-04 14:42:03.848	\N	\N	\N	\N	Production	\N
1140	o9cns1qk8cgm2el8jwai8s9v	640008	น.ส. พัชราภรณ์ มุ่งดี	PDT3	BZ	Staff	4		2025-11-04 14:42:03.848	2025-11-04 14:42:03.848	2025-11-04 14:42:03.855	\N	\N	\N	Production	\N
1143	av2vp2lt9aihtpln22g0bjkl	640014	นาย เชษฐกร เตศิริ	PCM	ST	Staff	4		2025-11-04 14:42:03.92	2025-11-04 14:42:03.92	\N	\N	\N	\N	Support	\N
1144	av2vp2lt9aihtpln22g0bjkl	640014	นาย เชษฐกร เตศิริ	PCM	ST	Staff	4		2025-11-04 14:42:03.92	2025-11-04 14:42:03.92	2025-11-04 14:42:03.926	\N	\N	\N	Support	\N
1147	x5dthe83cmffar0m2y01ki12	640018	นาย ณัฐพล พัดไธสง	MKT	SL	Staff	4		2025-11-04 14:42:04.027	2025-11-04 14:42:04.027	\N	\N	\N	\N	Non Production	\N
1148	x5dthe83cmffar0m2y01ki12	640018	นาย ณัฐพล พัดไธสง	MKT	SL	Staff	4		2025-11-04 14:42:04.027	2025-11-04 14:42:04.027	2025-11-04 14:42:04.033	\N	\N	\N	Non Production	\N
1151	jjxgjqoqjm2c6l99zm5g3sjp	640020	นาย อนุกุล ศักดิ์อุบล	PDT2	OQ	Staff	4		2025-11-04 14:42:04.116	2025-11-04 14:42:04.116	\N	\N	\N	\N	Production	\N
1152	jjxgjqoqjm2c6l99zm5g3sjp	640020	นาย อนุกุล ศักดิ์อุบล	PDT2	OQ	Staff	4		2025-11-04 14:42:04.116	2025-11-04 14:42:04.116	2025-11-04 14:42:04.137	\N	\N	\N	Production	\N
1155	vmzrvs8ba8abv2a215xw7y5k	640026	นาย บวรภัค เต่สกุล	HRD	SC	Staff	4		2025-11-04 14:42:04.203	2025-11-04 14:42:04.203	\N	\N	\N	\N	Non Production	\N
1156	vmzrvs8ba8abv2a215xw7y5k	640026	นาย บวรภัค เต่สกุล	HRD	SC	Staff	4		2025-11-04 14:42:04.203	2025-11-04 14:42:04.203	2025-11-04 14:42:04.211	\N	\N	\N	Non Production	\N
1159	ol5lrb37f2qlp0smphekdef4	640028	น.ส. วัลนิภา ถานผดุง	QAD	IP	Staff	4		2025-11-04 14:42:04.291	2025-11-04 14:42:04.291	\N	\N	\N	\N	Support	\N
1160	ol5lrb37f2qlp0smphekdef4	640028	น.ส. วัลนิภา ถานผดุง	QAD	IP	Staff	4		2025-11-04 14:42:04.291	2025-11-04 14:42:04.291	2025-11-04 14:42:04.296	\N	\N	\N	Support	\N
1163	icswx3k0u9rr4hyor0umqwdx	640031	นาย อนันต์ กล้าหาญ	PDM	FC	Staff	4		2025-11-04 14:42:04.376	2025-11-04 14:42:04.376	\N	\N	\N	\N	Support	\N
1164	icswx3k0u9rr4hyor0umqwdx	640031	นาย อนันต์ กล้าหาญ	PDM	FC	Staff	4		2025-11-04 14:42:04.376	2025-11-04 14:42:04.376	2025-11-04 14:42:04.384	\N	\N	\N	Support	\N
1167	swnckbccsm6zcg4t1dy7gkzm	640033	นาย ยอดชาย สุดหา	PDT3	BZ	Staff	4		2025-11-04 14:42:04.465	2025-11-04 14:42:04.465	\N	\N	\N	\N	Production	\N
1168	swnckbccsm6zcg4t1dy7gkzm	640033	นาย ยอดชาย สุดหา	PDT3	BZ	Staff	4		2025-11-04 14:42:04.465	2025-11-04 14:42:04.465	2025-11-04 14:42:04.47	\N	\N	\N	Production	\N
1171	i5on9s2g5agkw5szdry9ew3g	640035	นาย พลกฤต ทันใจ	PDM	PC	Staff	4		2025-11-04 14:42:04.535	2025-11-04 14:42:04.535	\N	\N	\N	\N	Support	\N
1097	p7q3038qeg494yso0k212z58	620042	นาย อรรคชัย สีสัน	QAD	QC2	Staff	5		2025-11-04 14:42:02.849	2025-11-04 14:42:02.849	\N	\N	\N	\N	Support	\N
1098	p7q3038qeg494yso0k212z58	620042	นาย อรรคชัย สีสัน	QAD	QC2	Staff	5		2025-11-04 14:42:02.849	2025-11-04 14:42:02.849	2025-11-04 14:42:02.855	\N	\N	\N	Support	\N
1101	fvxdosfdi5bofhyzh9x06vsm	62T043	น.ส. สาวิตตรี แดนศิริ	QAD	QC2	Staff	6		2025-11-04 14:42:02.947	2025-11-04 14:42:02.947	\N	\N	\N	\N	Support	\N
1102	fvxdosfdi5bofhyzh9x06vsm	62T043	น.ส. สาวิตตรี แดนศิริ	QAD	QC2	Staff	6		2025-11-04 14:42:02.947	2025-11-04 14:42:02.947	2025-11-04 14:42:02.969	\N	\N	\N	Support	\N
1105	h050wox1u8pzzl35iab952w5	630002	นาย ทักษ์ พลงาม	PDT1	M10	Staff	5		2025-11-04 14:42:03.096	2025-11-04 14:42:03.096	\N	\N	\N	\N	Production	\N
1106	h050wox1u8pzzl35iab952w5	630002	นาย ทักษ์ พลงาม	PDT1	M10	Staff	5		2025-11-04 14:42:03.096	2025-11-04 14:42:03.096	2025-11-04 14:42:03.102	\N	\N	\N	Production	\N
1113	q3xbmid0cx4te4i5zteumjua	630007	นาย ธนวัต แสงโชติ	PDT2	OQ	Staff	5		2025-11-04 14:42:03.258	2025-11-04 14:42:03.258	\N	\N	\N	\N	Production	\N
1114	q3xbmid0cx4te4i5zteumjua	630007	นาย ธนวัต แสงโชติ	PDT2	OQ	Staff	5		2025-11-04 14:42:03.258	2025-11-04 14:42:03.258	2025-11-04 14:42:03.266	\N	\N	\N	Production	\N
1117	ayvtt307oe00u8mxnknwawu8	630009	นาย วรวิทย์ วาเล็กบุตร	PDT1	M10	Staff	5		2025-11-04 14:42:03.351	2025-11-04 14:42:03.351	\N	\N	\N	\N	Production	\N
1118	ayvtt307oe00u8mxnknwawu8	630009	นาย วรวิทย์ วาเล็กบุตร	PDT1	M10	Staff	5		2025-11-04 14:42:03.351	2025-11-04 14:42:03.351	2025-11-04 14:42:03.358	\N	\N	\N	Production	\N
1121	eg4dzyo38yxwkfnbad9gzd9v	630013	นาย คมสัณห์ หมัดแม่น	PDT1	M10	Staff	5		2025-11-04 14:42:03.442	2025-11-04 14:42:03.442	\N	\N	\N	\N	Production	\N
1122	eg4dzyo38yxwkfnbad9gzd9v	630013	นาย คมสัณห์ หมัดแม่น	PDT1	M10	Staff	5		2025-11-04 14:42:03.442	2025-11-04 14:42:03.442	2025-11-04 14:42:03.447	\N	\N	\N	Production	\N
1125	qobru97ir8ibhkskg0ds0y1o	630031	น.ส. ปิยะพร กางเกตุ	QAD	QC2	Leader	5		2025-11-04 14:42:03.535	2025-11-04 14:42:03.535	\N	\N	\N	\N	Support	\N
1126	qobru97ir8ibhkskg0ds0y1o	630031	น.ส. ปิยะพร กางเกตุ	QAD	QC2	Leader	5		2025-11-04 14:42:03.535	2025-11-04 14:42:03.535	2025-11-04 14:42:03.541	\N	\N	\N	Support	\N
1129	eotzcxxtfkfmlf0yfzuv1n12	630034	นาย สนธยา ดวงศรี	PCM	ST	Staff	4		2025-11-04 14:42:03.625	2025-11-04 14:42:03.625	\N	\N	\N	\N	Support	\N
1130	eotzcxxtfkfmlf0yfzuv1n12	630034	นาย สนธยา ดวงศรี	PCM	ST	Staff	4		2025-11-04 14:42:03.625	2025-11-04 14:42:03.625	2025-11-04 14:42:03.631	\N	\N	\N	Support	\N
1133	xgic5yg2694869gtlzsbh636	640002	นาย รัตนพล ชมมี	PDT1	M6	Junior	4		2025-11-04 14:42:03.716	2025-11-04 14:42:03.716	\N	\N	\N	\N	Production	\N
1134	xgic5yg2694869gtlzsbh636	640002	นาย รัตนพล ชมมี	PDT1	M6	Junior	4		2025-11-04 14:42:03.716	2025-11-04 14:42:03.716	2025-11-04 14:42:03.736	\N	\N	\N	Production	\N
1137	td5ar2oxy42jui32d1nh3pbv	640007	นาย จรูญศักดิ์ วงค์เจริญ	PCM	ST	Staff	4		2025-11-04 14:42:03.804	2025-11-04 14:42:03.804	\N	\N	\N	\N	Support	\N
1138	td5ar2oxy42jui32d1nh3pbv	640007	นาย จรูญศักดิ์ วงค์เจริญ	PCM	ST	Staff	4		2025-11-04 14:42:03.804	2025-11-04 14:42:03.804	2025-11-04 14:42:03.81	\N	\N	\N	Support	\N
1141	jsterr87p61hf8rom13ffvp0	640013	นาย ศักดิ์ติพงษ์ ภูตา	QAD	IP	Staff	4		2025-11-04 14:42:03.891	2025-11-04 14:42:03.891	\N	\N	\N	\N	Support	\N
1142	jsterr87p61hf8rom13ffvp0	640013	นาย ศักดิ์ติพงษ์ ภูตา	QAD	IP	Staff	4		2025-11-04 14:42:03.891	2025-11-04 14:42:03.891	2025-11-04 14:42:03.896	\N	\N	\N	Support	\N
1145	fmo7wenu5zug0jinz1jpqf96	640017	น.ส. สุธาทินี บัวทอง	PDM	PC	Staff	4		2025-11-04 14:42:03.98	2025-11-04 14:42:03.98	\N	\N	\N	\N	Support	\N
1146	fmo7wenu5zug0jinz1jpqf96	640017	น.ส. สุธาทินี บัวทอง	PDM	PC	Staff	4		2025-11-04 14:42:03.98	2025-11-04 14:42:03.98	2025-11-04 14:42:03.986	\N	\N	\N	Support	\N
1149	rnouclfxyoz76qidyxhd3ltm	640019	น.ส. พัชราภรณ์ ทองวงค์	HRD	SC	Staff	4		2025-11-04 14:42:04.07	2025-11-04 14:42:04.07	\N	\N	\N	\N	Non Production	\N
1150	rnouclfxyoz76qidyxhd3ltm	640019	น.ส. พัชราภรณ์ ทองวงค์	HRD	SC	Staff	4		2025-11-04 14:42:04.07	2025-11-04 14:42:04.07	2025-11-04 14:42:04.075	\N	\N	\N	Non Production	\N
1153	t30n9zetbwdzkmjy04psxe9o	640021	นาย สุพร สุขชื่น	PDT2	OQ	Staff	4		2025-11-04 14:42:04.159	2025-11-04 14:42:04.159	\N	\N	\N	\N	Production	\N
1154	t30n9zetbwdzkmjy04psxe9o	640021	นาย สุพร สุขชื่น	PDT2	OQ	Staff	4		2025-11-04 14:42:04.159	2025-11-04 14:42:04.159	2025-11-04 14:42:04.164	\N	\N	\N	Production	\N
1157	oj8wb61je61lmfg9v041yjuu	640027	น.ส. กนกวรรณ กลิ่นภิรมย์	PDT4	UB	Staff	4		2025-11-04 14:42:04.248	2025-11-04 14:42:04.248	\N	\N	\N	\N	Production	\N
1158	oj8wb61je61lmfg9v041yjuu	640027	น.ส. กนกวรรณ กลิ่นภิรมย์	PDT4	UB	Staff	4		2025-11-04 14:42:04.248	2025-11-04 14:42:04.248	2025-11-04 14:42:04.254	\N	\N	\N	Production	\N
1161	s4h51vxcpgpkweak3ynwg10r	640029	นาย เอกพันธ์ ติ๊บสาย	QAD	QC2	Staff	4		2025-11-04 14:42:04.334	2025-11-04 14:42:04.334	\N	\N	\N	\N	Support	\N
1162	s4h51vxcpgpkweak3ynwg10r	640029	นาย เอกพันธ์ ติ๊บสาย	QAD	QC2	Staff	4		2025-11-04 14:42:04.334	2025-11-04 14:42:04.334	2025-11-04 14:42:04.34	\N	\N	\N	Support	\N
1165	jbbac35pr97uq511m0irs5s9	640032	น.ส. พูนสิริ มูลธิยะ	PDT3	JC	Staff	4		2025-11-04 14:42:04.406	2025-11-04 14:42:04.406	\N	\N	\N	\N	Production	\N
1166	jbbac35pr97uq511m0irs5s9	640032	น.ส. พูนสิริ มูลธิยะ	PDT3	JC	Staff	4		2025-11-04 14:42:04.406	2025-11-04 14:42:04.406	2025-11-04 14:42:04.426	\N	\N	\N	Production	\N
1169	jrvetg45oz0gqmapwc1jmlpb	640034	นาย ฐิติวัสส์ ดัดถุยาวัตร	PDT1	NT	Staff	4		2025-11-04 14:42:04.506	2025-11-04 14:42:04.506	\N	\N	\N	\N	Production	\N
1170	jrvetg45oz0gqmapwc1jmlpb	640034	นาย ฐิติวัสส์ ดัดถุยาวัตร	PDT1	NT	Staff	4		2025-11-04 14:42:04.506	2025-11-04 14:42:04.506	2025-11-04 14:42:04.511	\N	\N	\N	Production	\N
1173	disjhff5uqnamirzc92a79dn	640036	น.ส. จตุพร เหมรานนท์	PDM	IT	Staff	4		2025-11-04 14:42:04.596	2025-11-04 14:42:04.596	\N	\N	\N	\N	Support	\N
1093	fw236jx99xktc31l3yzcomtc	620040	นาย วรุฒน์ เกตุแก้ว	PDT3	JC	Supervisor	6		2025-11-04 14:42:02.76	2025-11-20 14:31:43.386	\N	\N	1	\N	Production	warut@aoyama.co.th
1172	i5on9s2g5agkw5szdry9ew3g	640035	นาย พลกฤต ทันใจ	PDM	PC	Staff	4		2025-11-04 14:42:04.535	2025-11-04 14:42:04.535	2025-11-04 14:42:04.556	\N	\N	\N	Support	\N
1175	vmjio2drln1bxv527rq2nyaf	640037	นาย ณัฐพล ตะวงษา	PDT1	NT	Staff	4		2025-11-04 14:42:04.639	2025-11-04 14:42:04.639	\N	\N	\N	\N	Production	\N
1176	vmjio2drln1bxv527rq2nyaf	640037	นาย ณัฐพล ตะวงษา	PDT1	NT	Staff	4		2025-11-04 14:42:04.639	2025-11-04 14:42:04.639	2025-11-04 14:42:04.643	\N	\N	\N	Production	\N
1179	or3mv7wya4rc9jghpnd314wk	640039	นาย อนุชา ยะภักดี	PDT1	M8	Staff	4		2025-11-04 14:42:04.724	2025-11-04 14:42:04.724	\N	\N	\N	\N	Production	\N
1180	or3mv7wya4rc9jghpnd314wk	640039	นาย อนุชา ยะภักดี	PDT1	M8	Staff	4		2025-11-04 14:42:04.724	2025-11-04 14:42:04.724	2025-11-04 14:42:04.729	\N	\N	\N	Production	\N
1183	ojeteeyqarvoamnr3jhhw3iq	640044	นาย สถิตย์ พันธ์วิชัย	PDM	FC	Staff	4		2025-11-04 14:42:04.809	2025-11-04 14:42:04.809	\N	\N	\N	\N	Support	\N
1184	ojeteeyqarvoamnr3jhhw3iq	640044	นาย สถิตย์ พันธ์วิชัย	PDM	FC	Staff	4		2025-11-04 14:42:04.809	2025-11-04 14:42:04.809	2025-11-04 14:42:04.815	\N	\N	\N	Support	\N
1187	epij4urcbjcv2hwybq6qs6a9	640046	นาย ผดุงเกียรติ ภวภูตานนท์	PDT4	MC	Staff	4		2025-11-04 14:42:04.894	2025-11-04 14:42:04.894	\N	\N	\N	\N	Production	\N
1188	epij4urcbjcv2hwybq6qs6a9	640046	นาย ผดุงเกียรติ ภวภูตานนท์	PDT4	MC	Staff	4		2025-11-04 14:42:04.894	2025-11-04 14:42:04.894	2025-11-04 14:42:04.9	\N	\N	\N	Production	\N
1191	pfv3s34l2dqb7ea706h74bka	640049	นาย มนตรี เสอุดม	PDT2	OQ	Staff	4		2025-11-04 14:42:04.966	2025-11-04 14:42:04.966	\N	\N	\N	\N	Production	\N
1192	pfv3s34l2dqb7ea706h74bka	640049	นาย มนตรี เสอุดม	PDT2	OQ	Staff	4		2025-11-04 14:42:04.966	2025-11-04 14:42:04.966	2025-11-04 14:42:04.985	\N	\N	\N	Production	\N
1195	pykymimpckc5j9vxtahgmiq0	640051	นาย กิตติพรรณ อุปานันท์	PCM	ST	Staff	4		2025-11-04 14:42:05.066	2025-11-04 14:42:05.066	\N	\N	\N	\N	Support	\N
1196	pykymimpckc5j9vxtahgmiq0	640051	นาย กิตติพรรณ อุปานันท์	PCM	ST	Staff	4		2025-11-04 14:42:05.066	2025-11-04 14:42:05.066	2025-11-04 14:42:05.071	\N	\N	\N	Support	\N
1199	ghguprkasuqapjy0ezrnqaly	640055	นาย กัมพล บุญทศ	PDM	FC	Staff	4		2025-11-04 14:42:05.14	2025-11-04 14:42:05.14	\N	\N	\N	\N	Support	\N
1200	ghguprkasuqapjy0ezrnqaly	640055	นาย กัมพล บุญทศ	PDM	FC	Staff	4		2025-11-04 14:42:05.14	2025-11-04 14:42:05.14	2025-11-04 14:42:05.145	\N	\N	\N	Support	\N
1203	wvwdcdrs0gy1id92kez9wdew	640057	นาย อนุสรณ์ ทองวัน	PCM	TP	Staff	4		2025-11-04 14:42:05.208	2025-11-04 14:42:05.208	\N	\N	\N	\N	Support	\N
1204	wvwdcdrs0gy1id92kez9wdew	640057	นาย อนุสรณ์ ทองวัน	PCM	TP	Staff	4		2025-11-04 14:42:05.208	2025-11-04 14:42:05.208	2025-11-04 14:42:05.228	\N	\N	\N	Support	\N
1207	ul2b27qrgbwcz4rbkz54drig	640060	นาย โยธิน ใจกล้า	PDM	PC	Staff	4		2025-11-04 14:42:05.31	2025-11-04 14:42:05.31	\N	\N	\N	\N	Support	\N
1208	ul2b27qrgbwcz4rbkz54drig	640060	นาย โยธิน ใจกล้า	PDM	PC	Staff	4		2025-11-04 14:42:05.31	2025-11-04 14:42:05.31	2025-11-04 14:42:05.315	\N	\N	\N	Support	\N
1211	clwwy3opowzd0geipdpxict2	640063	นาย สุรชาติ เสาชัย	PCM	ST	Staff	4		2025-11-04 14:42:05.396	2025-11-04 14:42:05.396	\N	\N	\N	\N	Support	\N
1212	clwwy3opowzd0geipdpxict2	640063	นาย สุรชาติ เสาชัย	PCM	ST	Staff	4		2025-11-04 14:42:05.396	2025-11-04 14:42:05.396	2025-11-04 14:42:05.4	\N	\N	\N	Support	\N
1215	xat39jlcq5qye39sn0wp68ii	640065	นาย ธีรภัทร ปันสา	PDT4	MC	Staff	4		2025-11-04 14:42:05.48	2025-11-04 14:42:05.48	\N	\N	\N	\N	Production	\N
1216	xat39jlcq5qye39sn0wp68ii	640065	นาย ธีรภัทร ปันสา	PDT4	MC	Staff	4		2025-11-04 14:42:05.48	2025-11-04 14:42:05.48	2025-11-04 14:42:05.486	\N	\N	\N	Production	\N
1219	l6c59asyvvbu8tabkmkslpo7	640067	นาย อานนท์ แป้นแก้ว	PDM	FC	Staff	3		2025-11-04 14:42:05.562	2025-11-04 14:42:05.562	\N	\N	\N	\N	Support	\N
1220	l6c59asyvvbu8tabkmkslpo7	640067	นาย อานนท์ แป้นแก้ว	PDM	FC	Staff	3		2025-11-04 14:42:05.562	2025-11-04 14:42:05.562	2025-11-04 14:42:05.567	\N	\N	\N	Support	\N
1223	qoehvs9qb3wc0639ascw7zin	640071	ว่าที่ร.ต. นวพล บางทับ	QAD	QC1	Staff	3		2025-11-04 14:42:05.631	2025-11-04 14:42:05.631	\N	\N	\N	\N	Support	\N
1224	qoehvs9qb3wc0639ascw7zin	640071	ว่าที่ร.ต. นวพล บางทับ	QAD	QC1	Staff	3		2025-11-04 14:42:05.631	2025-11-04 14:42:05.631	2025-11-04 14:42:05.636	\N	\N	\N	Support	\N
1227	oxqn0d4o0ksxxfzwr5g12rck	640073	น.ส. ญาดา สวัสดี	PDT3	WB	Staff	3		2025-11-04 14:42:05.717	2025-11-04 14:42:05.717	\N	\N	\N	\N	Production	\N
1228	oxqn0d4o0ksxxfzwr5g12rck	640073	น.ส. ญาดา สวัสดี	PDT3	WB	Staff	3		2025-11-04 14:42:05.717	2025-11-04 14:42:05.717	2025-11-04 14:42:05.732	\N	\N	\N	Production	\N
1231	i8fi51w4e63wq0yo6a9jh633	640075	น.ส. อรทัย มะโนระกร	PDT3	WB	Staff	3		2025-11-04 14:42:05.785	2025-11-04 14:42:05.785	\N	\N	\N	\N	Production	\N
1232	i8fi51w4e63wq0yo6a9jh633	640075	น.ส. อรทัย มะโนระกร	PDT3	WB	Staff	3		2025-11-04 14:42:05.785	2025-11-04 14:42:05.785	2025-11-04 14:42:05.806	\N	\N	\N	Production	\N
1235	li6je0fqfdmgp3ofhomb056v	640077	น.ส. สุชานันท์ สีสุก	PDT3	BZ	Staff	3		2025-11-04 14:42:05.865	2025-11-04 14:42:05.865	\N	\N	\N	\N	Production	\N
1236	li6je0fqfdmgp3ofhomb056v	640077	น.ส. สุชานันท์ สีสุก	PDT3	BZ	Staff	3		2025-11-04 14:42:05.865	2025-11-04 14:42:05.865	2025-11-04 14:42:05.869	\N	\N	\N	Production	\N
1239	fhg0pnggmu4cmd9jt50ennjy	64K016	น.ส. ศิริพร ขอดคำ	QAD	IP	Staff	4		2025-11-04 14:42:05.928	2025-11-04 14:42:05.928	\N	\N	\N	\N	Support	\N
1240	fhg0pnggmu4cmd9jt50ennjy	64K016	น.ส. ศิริพร ขอดคำ	QAD	IP	Staff	4		2025-11-04 14:42:05.928	2025-11-04 14:42:05.928	2025-11-04 14:42:05.936	\N	\N	\N	Support	\N
1243	i5blemkri0x0boy2f3y8q7x0	64K018	น.ส. นันทา รักร่วม	QAD	QC2	Staff	4		2025-11-04 14:42:06.01	2025-11-04 14:42:06.01	\N	\N	\N	\N	Support	\N
1244	i5blemkri0x0boy2f3y8q7x0	64K018	น.ส. นันทา รักร่วม	QAD	QC2	Staff	4		2025-11-04 14:42:06.01	2025-11-04 14:42:06.01	2025-11-04 14:42:06.016	\N	\N	\N	Support	\N
1247	t9559pbfxn0u2iwrej1b9u9n	64K107	นาย ศราวัฒน์ สุโพธิ์	PCM	ST	Staff	4		2025-11-04 14:42:06.089	2025-11-04 14:42:06.089	\N	\N	\N	\N	Support	\N
1248	t9559pbfxn0u2iwrej1b9u9n	64K107	นาย ศราวัฒน์ สุโพธิ์	PCM	ST	Staff	4		2025-11-04 14:42:06.089	2025-11-04 14:42:06.089	2025-11-04 14:42:06.094	\N	\N	\N	Support	\N
1251	dh9pggknollcsa6f233kuxpk	64K130	นาย สิทธินนท์ นาดมั้น	PCM	ST	Staff	4		2025-11-04 14:42:06.177	2025-11-04 14:42:06.177	\N	\N	\N	\N	Support	\N
1252	dh9pggknollcsa6f233kuxpk	64K130	นาย สิทธินนท์ นาดมั้น	PCM	ST	Staff	4		2025-11-04 14:42:06.177	2025-11-04 14:42:06.177	2025-11-04 14:42:06.182	\N	\N	\N	Support	\N
1255	q0yf058ex0z8wuyk1yu44k91	64K134	นาย จีระศักดิ์ ดวงจันทร์	PCM	ST	Staff	4		2025-11-04 14:42:06.26	2025-11-04 14:42:06.26	\N	\N	\N	\N	Support	\N
1174	disjhff5uqnamirzc92a79dn	640036	น.ส. จตุพร เหมรานนท์	PDM	IT	Staff	4		2025-11-04 14:42:04.596	2025-11-04 14:42:04.596	2025-11-04 14:42:04.617	\N	\N	\N	Support	\N
1177	ldo2qgc8ppiod8fmzb0gmfz8	640038	นาย พลากร เทพรินทร์	PDM	IT	Junior	4		2025-11-04 14:42:04.683	2025-11-04 14:42:04.683	\N	\N	\N	\N	Support	\N
1178	ldo2qgc8ppiod8fmzb0gmfz8	640038	นาย พลากร เทพรินทร์	PDM	IT	Junior	4		2025-11-04 14:42:04.683	2025-11-04 14:42:04.683	2025-11-04 14:42:04.689	\N	\N	\N	Support	\N
1181	sc3tifmdtzv7n0n5g5540g9z	640040	นาย สราวุฒิ แสนดี	PDT1	NT	Staff	4		2025-11-04 14:42:04.768	2025-11-04 14:42:04.768	\N	\N	\N	\N	Production	\N
1182	sc3tifmdtzv7n0n5g5540g9z	640040	นาย สราวุฒิ แสนดี	PDT1	NT	Staff	4		2025-11-04 14:42:04.768	2025-11-04 14:42:04.768	2025-11-04 14:42:04.773	\N	\N	\N	Production	\N
1185	weswndq9ni7rwx2fb0uvvapx	640045	น.ส. ธัญญารัตน์ จันต๊ะวัน	PDM	FC	Junior	4		2025-11-04 14:42:04.852	2025-11-04 14:42:04.852	\N	\N	\N	\N	Support	\N
1186	weswndq9ni7rwx2fb0uvvapx	640045	น.ส. ธัญญารัตน์ จันต๊ะวัน	PDM	FC	Junior	4		2025-11-04 14:42:04.852	2025-11-04 14:42:04.852	2025-11-04 14:42:04.857	\N	\N	\N	Support	\N
1189	tapv7g0fg8lnhp2ig75hb5qe	640047	น.ส. สิริกร คนตรง	FNC	AC	Foreman	4		2025-11-04 14:42:04.938	2025-11-04 14:42:04.938	\N	\N	\N	\N	Non Production	\N
1190	tapv7g0fg8lnhp2ig75hb5qe	640047	น.ส. สิริกร คนตรง	FNC	AC	Foreman	4		2025-11-04 14:42:04.938	2025-11-04 14:42:04.938	2025-11-04 14:42:04.943	\N	\N	\N	Non Production	\N
1193	wxl9ulf7a1jlbj4l3wf0oywk	640050	นาย นิพนธ์ กลิ่นสุคนธ์	PCM	TP	Staff	4		2025-11-04 14:42:05.024	2025-11-04 14:42:05.024	\N	\N	\N	\N	Support	\N
1194	wxl9ulf7a1jlbj4l3wf0oywk	640050	นาย นิพนธ์ กลิ่นสุคนธ์	PCM	TP	Staff	4		2025-11-04 14:42:05.024	2025-11-04 14:42:05.024	2025-11-04 14:42:05.03	\N	\N	\N	Support	\N
1197	wlsrnwcka6hae6nqbhulb9zw	640053	นาย กิตติศักดิ์ ยางนอก	PDM	FC	Staff	4		2025-11-04 14:42:05.094	2025-11-04 14:42:05.094	\N	\N	\N	\N	Support	\N
1198	wlsrnwcka6hae6nqbhulb9zw	640053	นาย กิตติศักดิ์ ยางนอก	PDM	FC	Staff	4		2025-11-04 14:42:05.094	2025-11-04 14:42:05.094	2025-11-04 14:42:05.117	\N	\N	\N	Support	\N
1201	x7rlyxxlu378r5lj2w6n9mtr	640056	นาย วรพรรณ คำเมือง	QAD	QC2	Staff	4		2025-11-04 14:42:05.181	2025-11-04 14:42:05.181	\N	\N	\N	\N	Support	\N
1202	x7rlyxxlu378r5lj2w6n9mtr	640056	นาย วรพรรณ คำเมือง	QAD	QC2	Staff	4		2025-11-04 14:42:05.181	2025-11-04 14:42:05.181	2025-11-04 14:42:05.186	\N	\N	\N	Support	\N
1205	pp4z6tcbunephicc0ae7p6ij	640058	นาย ยศศักดิ์ คำเนาว์	PCM	TP	Staff	4		2025-11-04 14:42:05.267	2025-11-04 14:42:05.267	\N	\N	\N	\N	Support	\N
1206	pp4z6tcbunephicc0ae7p6ij	640058	นาย ยศศักดิ์ คำเนาว์	PCM	TP	Staff	4		2025-11-04 14:42:05.267	2025-11-04 14:42:05.267	2025-11-04 14:42:05.272	\N	\N	\N	Support	\N
1209	ei1i2hcno6c4bl72lfmam5gl	640061	นาย สุชาติ สมานพันธุ์	PDT4	MC	Staff	4		2025-11-04 14:42:05.346	2025-11-04 14:42:05.346	\N	\N	\N	\N	Production	\N
1210	ei1i2hcno6c4bl72lfmam5gl	640061	นาย สุชาติ สมานพันธุ์	PDT4	MC	Staff	4		2025-11-04 14:42:05.346	2025-11-04 14:42:05.346	2025-11-04 14:42:05.359	\N	\N	\N	Production	\N
1213	onbstikl3o3yjz6ciqhrkl6y	640064	นาย สฤษฎิ์ กรุงษาศรี	PDM	FC	Staff	4		2025-11-04 14:42:05.437	2025-11-04 14:42:05.437	\N	\N	\N	\N	Support	\N
1214	onbstikl3o3yjz6ciqhrkl6y	640064	นาย สฤษฎิ์ กรุงษาศรี	PDM	FC	Staff	4		2025-11-04 14:42:05.437	2025-11-04 14:42:05.437	2025-11-04 14:42:05.442	\N	\N	\N	Support	\N
1217	nwid6hf4u8tskavc28ojr0x8	640066	นาย พงศ์ธร จันทะบุตร	PDM	FC	Staff	3		2025-11-04 14:42:05.522	2025-11-04 14:42:05.522	\N	\N	\N	\N	Support	\N
1218	nwid6hf4u8tskavc28ojr0x8	640066	นาย พงศ์ธร จันทะบุตร	PDM	FC	Staff	3		2025-11-04 14:42:05.522	2025-11-04 14:42:05.522	2025-11-04 14:42:05.527	\N	\N	\N	Support	\N
1221	dettibedo2e1y9imetpxidjq	640068	นาย พิพัฒน์ชัย ไกรยะโส	PDT2	OQ	Staff	3		2025-11-04 14:42:05.589	2025-11-04 14:42:05.589	\N	\N	\N	\N	Production	\N
1222	dettibedo2e1y9imetpxidjq	640068	นาย พิพัฒน์ชัย ไกรยะโส	PDT2	OQ	Staff	3		2025-11-04 14:42:05.589	2025-11-04 14:42:05.589	2025-11-04 14:42:05.599	\N	\N	\N	Production	\N
1225	rxd4p3m6lyhctnqfvzzywg7i	640072	นาย สุทธิลักษณ์ ผลเหม	ENI	FDM	Staff	3		2025-11-04 14:42:05.673	2025-11-04 14:42:05.673	\N	\N	\N	\N	Support	\N
1226	rxd4p3m6lyhctnqfvzzywg7i	640072	นาย สุทธิลักษณ์ ผลเหม	ENI	FDM	Staff	3		2025-11-04 14:42:05.673	2025-11-04 14:42:05.673	2025-11-04 14:42:05.679	\N	\N	\N	Support	\N
1229	l53ehgb7jid8wq6qcboq2djx	640074	น.ส. วีระยา คงภู	PDT3	JC	Staff	3		2025-11-04 14:42:05.756	2025-11-04 14:42:05.756	\N	\N	\N	\N	Production	\N
1230	l53ehgb7jid8wq6qcboq2djx	640074	น.ส. วีระยา คงภู	PDT3	JC	Staff	3		2025-11-04 14:42:05.756	2025-11-04 14:42:05.756	2025-11-04 14:42:05.761	\N	\N	\N	Production	\N
1233	znxoxno79w0upik1nox02yqx	640076	นาง วิยะดา ดงบัง	PDT3	BZ	Staff	3		2025-11-04 14:42:05.827	2025-11-04 14:42:05.827	\N	\N	\N	\N	Production	\N
1234	znxoxno79w0upik1nox02yqx	640076	นาง วิยะดา ดงบัง	PDT3	BZ	Staff	3		2025-11-04 14:42:05.827	2025-11-04 14:42:05.827	2025-11-04 14:42:05.831	\N	\N	\N	Production	\N
1237	xy7ykvdq03dshfept9b5kn7p	64K014	น.ส. อรอุมา ทองวิเศษ	QAD	IP	Staff	4		2025-11-04 14:42:05.89	2025-11-04 14:42:05.89	\N	\N	\N	\N	Support	\N
1238	xy7ykvdq03dshfept9b5kn7p	64K014	น.ส. อรอุมา ทองวิเศษ	QAD	IP	Staff	4		2025-11-04 14:42:05.89	2025-11-04 14:42:05.89	2025-11-04 14:42:05.894	\N	\N	\N	Support	\N
1241	ymairikuclg5nc51dtkeyz6y	64K017	น.ส. อรุณรัตน์ ใหมคำ	QAD	QC2	Staff	4		2025-11-04 14:42:05.972	2025-11-04 14:42:05.972	\N	\N	\N	\N	Support	\N
1242	ymairikuclg5nc51dtkeyz6y	64K017	น.ส. อรุณรัตน์ ใหมคำ	QAD	QC2	Staff	4		2025-11-04 14:42:05.972	2025-11-04 14:42:05.972	2025-11-04 14:42:05.977	\N	\N	\N	Support	\N
1245	iv3niur0g49iurlimv9la9u6	64K068	นาย เชิดชัย คล้ายคลาดภัย	PCM	TP	Staff	4		2025-11-04 14:42:06.051	2025-11-04 14:42:06.051	\N	\N	\N	\N	Support	\N
1246	iv3niur0g49iurlimv9la9u6	64K068	นาย เชิดชัย คล้ายคลาดภัย	PCM	TP	Staff	4		2025-11-04 14:42:06.051	2025-11-04 14:42:06.051	2025-11-04 14:42:06.055	\N	\N	\N	Support	\N
1249	r5ac59ogzuc9y2d1kpimowo9	64K118	นาย จักรกฤษณ์ พัดฉา	PCM	Q-GATE	Staff	4		2025-11-04 14:42:06.118	2025-11-04 14:42:06.118	\N	\N	\N	\N	Support	\N
1250	r5ac59ogzuc9y2d1kpimowo9	64K118	นาย จักรกฤษณ์ พัดฉา	PCM	Q-GATE	Staff	4		2025-11-04 14:42:06.118	2025-11-04 14:42:06.118	2025-11-04 14:42:06.139	\N	\N	\N	Support	\N
1253	fnwioe91xa1r2sv1pekr9h13	64K131	นาย สมหมาย นามโคตร	PCM	TP	Staff	4		2025-11-04 14:42:06.218	2025-11-04 14:42:06.218	\N	\N	\N	\N	Support	\N
1254	fnwioe91xa1r2sv1pekr9h13	64K131	นาย สมหมาย นามโคตร	PCM	TP	Staff	4		2025-11-04 14:42:06.218	2025-11-04 14:42:06.218	2025-11-04 14:42:06.224	\N	\N	\N	Support	\N
1256	q0yf058ex0z8wuyk1yu44k91	64K134	นาย จีระศักดิ์ ดวงจันทร์	PCM	ST	Staff	4		2025-11-04 14:42:06.26	2025-11-04 14:42:06.26	2025-11-04 14:42:06.264	\N	\N	\N	Support	\N
1259	wlpirlm8g3ycdokb9r4zq4wu	64K143	น.ส. สุกัลยา อำภาพร	QAD	QC2	Staff	4		2025-11-04 14:42:06.339	2025-11-04 14:42:06.339	\N	\N	\N	\N	Support	\N
1260	wlpirlm8g3ycdokb9r4zq4wu	64K143	น.ส. สุกัลยา อำภาพร	QAD	QC2	Staff	4		2025-11-04 14:42:06.339	2025-11-04 14:42:06.339	2025-11-04 14:42:06.343	\N	\N	\N	Support	\N
1263	ywd5w74eaf09pzdbh2r87g8t	64K177	นาย ไกรวิทย์ หงษ์เวหา	PCM	ST	Staff	3		2025-11-04 14:42:06.419	2025-11-04 14:42:06.419	\N	\N	\N	\N	Support	\N
1264	ywd5w74eaf09pzdbh2r87g8t	64K177	นาย ไกรวิทย์ หงษ์เวหา	PCM	ST	Staff	3		2025-11-04 14:42:06.419	2025-11-04 14:42:06.419	2025-11-04 14:42:06.423	\N	\N	\N	Support	\N
1267	knvdmzqq5hwu8m7e0ldn20zm	64T002	น.ส. เบญจวรรณ สีหาพล	QAD	QC2	Staff	4		2025-11-04 14:42:06.5	2025-11-04 14:42:06.5	\N	\N	\N	\N	Support	\N
1268	knvdmzqq5hwu8m7e0ldn20zm	64T002	น.ส. เบญจวรรณ สีหาพล	QAD	QC2	Staff	4		2025-11-04 14:42:06.5	2025-11-04 14:42:06.5	2025-11-04 14:42:06.504	\N	\N	\N	Support	\N
1271	xtvpgr2f6odl1c8rhbothrkd	64T056	นาย รัตนชัย บัวศรี	PCM	ST	Staff	4		2025-11-04 14:42:06.58	2025-11-04 14:42:06.58	\N	\N	\N	\N	Support	\N
1272	xtvpgr2f6odl1c8rhbothrkd	64T056	นาย รัตนชัย บัวศรี	PCM	ST	Staff	4		2025-11-04 14:42:06.58	2025-11-04 14:42:06.58	2025-11-04 14:42:06.585	\N	\N	\N	Support	\N
1275	jl6wq4wrwnmn8rgprptc1khz	64T086	น.ส. ยุวดี ศรีทิม	QAD	QC2	Staff	4		2025-11-04 14:42:06.644	2025-11-04 14:42:06.644	\N	\N	\N	\N	Support	\N
1276	jl6wq4wrwnmn8rgprptc1khz	64T086	น.ส. ยุวดี ศรีทิม	QAD	QC2	Staff	4		2025-11-04 14:42:06.644	2025-11-04 14:42:06.644	2025-11-04 14:42:06.648	\N	\N	\N	Support	\N
1279	xfm6zyo3hkwz9nvy0yfo3ndv	64T092	น.ส. พรทิพย์ สีเครือดง	QAD	QC2	Staff	4		2025-11-04 14:42:06.74	2025-11-04 14:42:06.74	\N	\N	\N	\N	Support	\N
1280	xfm6zyo3hkwz9nvy0yfo3ndv	64T092	น.ส. พรทิพย์ สีเครือดง	QAD	QC2	Staff	4		2025-11-04 14:42:06.74	2025-11-04 14:42:06.74	2025-11-04 14:42:06.744	\N	\N	\N	Support	\N
1283	rmmsmhp0ycvp8mh3156pag80	64T101	น.ส. ปิยะพร สายขุน	QAD	QC2	Staff	4		2025-11-04 14:42:06.819	2025-11-04 14:42:06.819	\N	\N	\N	\N	Support	\N
1284	rmmsmhp0ycvp8mh3156pag80	64T101	น.ส. ปิยะพร สายขุน	QAD	QC2	Staff	4		2025-11-04 14:42:06.819	2025-11-04 14:42:06.819	2025-11-04 14:42:06.823	\N	\N	\N	Support	\N
1287	ky7w6wfynjysw817bo7ep6tl	64T109	น.ส. สกาวใจ ไชยเม็ง	QAD	QC2	Staff	3		2025-11-04 14:42:06.9	2025-11-04 14:42:06.9	\N	\N	\N	\N	Support	\N
1288	ky7w6wfynjysw817bo7ep6tl	64T109	น.ส. สกาวใจ ไชยเม็ง	QAD	QC2	Staff	3		2025-11-04 14:42:06.9	2025-11-04 14:42:06.9	2025-11-04 14:42:06.904	\N	\N	\N	Support	\N
1291	okve32ejflcbtklh4rsocic6	650002	น.ส. ภัทราภรณ์ ทองสุวรรณ	MKT	SL	Staff	3		2025-11-04 14:42:06.979	2025-11-04 14:42:06.979	\N	\N	\N	\N	Non Production	\N
1292	okve32ejflcbtklh4rsocic6	650002	น.ส. ภัทราภรณ์ ทองสุวรรณ	MKT	SL	Staff	3		2025-11-04 14:42:06.979	2025-11-04 14:42:06.979	2025-11-04 14:42:06.983	\N	\N	\N	Non Production	\N
1295	qskw1zzfrgyf864cajijmzog	650004	นาย อนุวัฒน์ กองอาษา	PDT4	MC	Staff	3		2025-11-04 14:42:07.06	2025-11-04 14:42:07.06	\N	\N	\N	\N	Production	\N
1296	qskw1zzfrgyf864cajijmzog	650004	นาย อนุวัฒน์ กองอาษา	PDT4	MC	Staff	3		2025-11-04 14:42:07.06	2025-11-04 14:42:07.06	2025-11-04 14:42:07.064	\N	\N	\N	Production	\N
1299	d7v9xzbh5v1smaolbd3ewnp5	650010	น.ส. ขนิษฐา มาลาล้ำ	PDM	FC	Staff	3		2025-11-04 14:42:07.144	2025-11-04 14:42:07.144	\N	\N	\N	\N	Support	\N
1300	d7v9xzbh5v1smaolbd3ewnp5	650010	น.ส. ขนิษฐา มาลาล้ำ	PDM	FC	Staff	3		2025-11-04 14:42:07.144	2025-11-04 14:42:07.144	2025-11-04 14:42:07.149	\N	\N	\N	Support	\N
1303	iigetviagqszb4tmaswbrh7c	650012	น.ส. กรรณิการ์ ชีวาจร	ENI	MI	Staff	3		2025-11-04 14:42:07.228	2025-11-04 14:42:07.228	\N	\N	\N	\N	Support	\N
1304	iigetviagqszb4tmaswbrh7c	650012	น.ส. กรรณิการ์ ชีวาจร	ENI	MI	Staff	3		2025-11-04 14:42:07.228	2025-11-04 14:42:07.228	2025-11-04 14:42:07.233	\N	\N	\N	Support	\N
1307	htssean57iszhzgm8rhcxina	650017	น.ส. ชนาธิป ปลื้มสระชัย	ENI	MI	Staff	3		2025-11-04 14:42:07.296	2025-11-04 14:42:07.296	\N	\N	\N	\N	Support	\N
1308	htssean57iszhzgm8rhcxina	650017	น.ส. ชนาธิป ปลื้มสระชัย	ENI	MI	Staff	3		2025-11-04 14:42:07.296	2025-11-04 14:42:07.296	2025-11-04 14:42:07.301	\N	\N	\N	Support	\N
1311	cjy0q6xyeq92k96keqy5azb4	650019	นาย ธณกร คงทรัพย์	PDT1	M8	Junior	3		2025-11-04 14:42:07.356	2025-11-04 14:42:07.356	\N	\N	\N	\N	Production	\N
1312	cjy0q6xyeq92k96keqy5azb4	650019	นาย ธณกร คงทรัพย์	PDT1	M8	Junior	3		2025-11-04 14:42:07.356	2025-11-04 14:42:07.356	2025-11-04 14:42:07.361	\N	\N	\N	Production	\N
1315	cvummbauol6yy9qla02u4wno	650023	น.ส. ศุภิสรา ทันบุญ	PDT3	BZ	Staff	3		2025-11-04 14:42:07.435	2025-11-04 14:42:07.435	\N	\N	\N	\N	Production	\N
1316	cvummbauol6yy9qla02u4wno	650023	น.ส. ศุภิสรา ทันบุญ	PDT3	BZ	Staff	3		2025-11-04 14:42:07.435	2025-11-04 14:42:07.435	2025-11-04 14:42:07.441	\N	\N	\N	Production	\N
1319	av1c91s6lakj5mvpf4dmo5pa	650026	นาย ธนาธิป เป็นตามวา	PDT1	M6	Staff	3		2025-11-04 14:42:07.514	2025-11-04 14:42:07.514	\N	\N	\N	\N	Production	\N
1320	av1c91s6lakj5mvpf4dmo5pa	650026	นาย ธนาธิป เป็นตามวา	PDT1	M6	Staff	3		2025-11-04 14:42:07.514	2025-11-04 14:42:07.514	2025-11-04 14:42:07.52	\N	\N	\N	Production	\N
1323	kca2nihl0apthts2vp0ruav9	650028	นาย นันทพงษ์ บุตรชานนท์	PCM	ST	Staff	3		2025-11-04 14:42:07.593	2025-11-04 14:42:07.593	\N	\N	\N	\N	Support	\N
1324	kca2nihl0apthts2vp0ruav9	650028	นาย นันทพงษ์ บุตรชานนท์	PCM	ST	Staff	3		2025-11-04 14:42:07.593	2025-11-04 14:42:07.593	2025-11-04 14:42:07.601	\N	\N	\N	Support	\N
1327	jplzkaho8qwodkpnxsd6q01y	650031	น.ส. อรุณี สานคล่อง	PDT3	BZ	Staff	3		2025-11-04 14:42:07.676	2025-11-04 14:42:07.676	\N	\N	\N	\N	Production	\N
1328	jplzkaho8qwodkpnxsd6q01y	650031	น.ส. อรุณี สานคล่อง	PDT3	BZ	Staff	3		2025-11-04 14:42:07.676	2025-11-04 14:42:07.676	2025-11-04 14:42:07.681	\N	\N	\N	Production	\N
1331	rrpc5t1dh1ejkcev5gbbdekp	650035	นาย รัชพล รัตตานนท์	ENI	EN	Staff	3		2025-11-04 14:42:07.754	2025-11-04 14:42:07.754	\N	\N	\N	\N	Support	\N
1332	rrpc5t1dh1ejkcev5gbbdekp	650035	นาย รัชพล รัตตานนท์	ENI	EN	Staff	3		2025-11-04 14:42:07.754	2025-11-04 14:42:07.754	2025-11-04 14:42:07.758	\N	\N	\N	Support	\N
1335	xt54it0lqgz6l32871mrig17	650037	นาย ธนชัย เมฆขลา	PCM	ST	Staff	3		2025-11-04 14:42:07.816	2025-11-04 14:42:07.816	\N	\N	\N	\N	Support	\N
1336	xt54it0lqgz6l32871mrig17	650037	นาย ธนชัย เมฆขลา	PCM	ST	Staff	3		2025-11-04 14:42:07.816	2025-11-04 14:42:07.816	2025-11-04 14:42:07.82	\N	\N	\N	Support	\N
1339	xdpiycesyqygv1pohdj6q0yn	650039	นาย พีระพัฒน์ เหล็กแข็ง	PDT2	OQ	Staff	3		2025-11-04 14:42:07.881	2025-11-04 14:42:07.881	\N	\N	\N	\N	Production	\N
1257	a3xy5i7wd6fqrfrc670k28o7	64K135	นาย ชัชวาล พรมจารึก	PCM	ST	Staff	4		2025-11-04 14:42:06.299	2025-11-04 14:42:06.299	\N	\N	\N	\N	Support	\N
1258	a3xy5i7wd6fqrfrc670k28o7	64K135	นาย ชัชวาล พรมจารึก	PCM	ST	Staff	4		2025-11-04 14:42:06.299	2025-11-04 14:42:06.299	2025-11-04 14:42:06.305	\N	\N	\N	Support	\N
1261	x4le6u8eawyg0xumt9odmnue	64K152	นาย นพชัย ชอบเสียง	PDT2	OQ	Staff	4		2025-11-04 14:42:06.379	2025-11-04 14:42:06.379	\N	\N	\N	\N	Production	\N
1262	x4le6u8eawyg0xumt9odmnue	64K152	นาย นพชัย ชอบเสียง	PDT2	OQ	Staff	4		2025-11-04 14:42:06.379	2025-11-04 14:42:06.379	2025-11-04 14:42:06.385	\N	\N	\N	Production	\N
1265	byjl7ew8697vtwidjbadqpvw	64K188	น.ส. อัญชลี ลีรัตน์	QAD	QC2	Staff	3		2025-11-04 14:42:06.461	2025-11-04 14:42:06.461	\N	\N	\N	\N	Support	\N
1266	byjl7ew8697vtwidjbadqpvw	64K188	น.ส. อัญชลี ลีรัตน์	QAD	QC2	Staff	3		2025-11-04 14:42:06.461	2025-11-04 14:42:06.461	2025-11-04 14:42:06.466	\N	\N	\N	Support	\N
1269	ayw5jmwpyyj9c9b38tjgoegu	64T019	น.ส. ทรรศนีย์ ศรีคำภา	QAD	QC2	Staff	4		2025-11-04 14:42:06.539	2025-11-04 14:42:06.539	\N	\N	\N	\N	Support	\N
1270	ayw5jmwpyyj9c9b38tjgoegu	64T019	น.ส. ทรรศนีย์ ศรีคำภา	QAD	QC2	Staff	4		2025-11-04 14:42:06.539	2025-11-04 14:42:06.539	2025-11-04 14:42:06.544	\N	\N	\N	Support	\N
1273	tb5rnb7nnrgxufgm6dksf63l	64T058	นาย อดิศร ศรีจันทร์	PCM	ST	Staff	4		2025-11-04 14:42:06.62	2025-11-04 14:42:06.62	\N	\N	\N	\N	Support	\N
1274	tb5rnb7nnrgxufgm6dksf63l	64T058	นาย อดิศร ศรีจันทร์	PCM	ST	Staff	4		2025-11-04 14:42:06.62	2025-11-04 14:42:06.62	2025-11-04 14:42:06.625	\N	\N	\N	Support	\N
1277	ri8gog74e8kkoykjnh66d5j2	64T089	นาย ธนพงษ์ ราชซุย	PDT1	M8	Staff	4		2025-11-04 14:42:06.699	2025-11-04 14:42:06.699	\N	\N	\N	\N	Production	\N
1278	ri8gog74e8kkoykjnh66d5j2	64T089	นาย ธนพงษ์ ราชซุย	PDT1	M8	Staff	4		2025-11-04 14:42:06.699	2025-11-04 14:42:06.699	2025-11-04 14:42:06.705	\N	\N	\N	Production	\N
1281	nvcij1dnxkq1xgfovk6yapr7	64T096	นาย ศราวุธ ราชประโคน	PDM	FC	Staff	4		2025-11-04 14:42:06.777	2025-11-04 14:42:06.777	\N	\N	\N	\N	Support	\N
1282	nvcij1dnxkq1xgfovk6yapr7	64T096	นาย ศราวุธ ราชประโคน	PDM	FC	Staff	4		2025-11-04 14:42:06.777	2025-11-04 14:42:06.777	2025-11-04 14:42:06.784	\N	\N	\N	Support	\N
1285	khqrpoz3ri7zzh6t7eqgg1po	64T102	น.ส. ธิติมา ประดับศรี	QAD	QC2	Staff	4		2025-11-04 14:42:06.856	2025-11-04 14:42:06.856	\N	\N	\N	\N	Support	\N
1286	khqrpoz3ri7zzh6t7eqgg1po	64T102	น.ส. ธิติมา ประดับศรี	QAD	QC2	Staff	4		2025-11-04 14:42:06.856	2025-11-04 14:42:06.856	2025-11-04 14:42:06.861	\N	\N	\N	Support	\N
1289	h8b7bykopppweu6q77sje1ui	650001	นาย ธนภัทร อินทร์สว่าง	PCM	ST	Staff	3		2025-11-04 14:42:06.937	2025-11-04 14:42:06.937	\N	\N	\N	\N	Support	\N
1290	h8b7bykopppweu6q77sje1ui	650001	นาย ธนภัทร อินทร์สว่าง	PCM	ST	Staff	3		2025-11-04 14:42:06.937	2025-11-04 14:42:06.937	2025-11-04 14:42:06.943	\N	\N	\N	Support	\N
1293	m51wm7z12xyjs0zpjtnpbccp	650003	น.ส. บังอร สีมันลาภ	PCM	PK	Staff	3		2025-11-04 14:42:07.02	2025-11-04 14:42:07.02	\N	\N	\N	\N	Support	\N
1294	m51wm7z12xyjs0zpjtnpbccp	650003	น.ส. บังอร สีมันลาภ	PCM	PK	Staff	3		2025-11-04 14:42:07.02	2025-11-04 14:42:07.02	2025-11-04 14:42:07.026	\N	\N	\N	Support	\N
1297	dsugz3e4prwqahnz3fa6ohid	650005	น.ส. ชาลินี ทองดี	QAD	QC1	Staff	3		2025-11-04 14:42:07.1	2025-11-04 14:42:07.1	\N	\N	\N	\N	Support	\N
1298	dsugz3e4prwqahnz3fa6ohid	650005	น.ส. ชาลินี ทองดี	QAD	QC1	Staff	3		2025-11-04 14:42:07.1	2025-11-04 14:42:07.1	2025-11-04 14:42:07.107	\N	\N	\N	Support	\N
1301	wg7fg6ofgf0h1ejf6ya9g94r	650011	น.ส. จารุวรรณ บุญสิทธิ์	ENI	MI	Staff	3		2025-11-04 14:42:07.185	2025-11-04 14:42:07.185	\N	\N	\N	\N	Support	\N
1302	wg7fg6ofgf0h1ejf6ya9g94r	650011	น.ส. จารุวรรณ บุญสิทธิ์	ENI	MI	Staff	3		2025-11-04 14:42:07.185	2025-11-04 14:42:07.185	2025-11-04 14:42:07.19	\N	\N	\N	Support	\N
1305	hww0osqn6ypazzc0ob4j6hjp	650013	นาย ปัญญา อิติวุตตา	HRD	EF	Staff	3		2025-11-04 14:42:07.254	2025-11-04 14:42:07.254	\N	\N	\N	\N	Non Production	\N
1306	hww0osqn6ypazzc0ob4j6hjp	650013	นาย ปัญญา อิติวุตตา	HRD	EF	Staff	3		2025-11-04 14:42:07.254	2025-11-04 14:42:07.254	2025-11-04 14:42:07.259	\N	\N	\N	Non Production	\N
1309	w0wmcccpyku70wkwyiy5rk4i	650018	น.ส. จุติพร ทามูล	MKT	SL	Staff	3		2025-11-04 14:42:07.334	2025-11-04 14:42:07.334	\N	\N	\N	\N	Non Production	\N
1310	w0wmcccpyku70wkwyiy5rk4i	650018	น.ส. จุติพร ทามูล	MKT	SL	Staff	3		2025-11-04 14:42:07.334	2025-11-04 14:42:07.334	2025-11-04 14:42:07.338	\N	\N	\N	Non Production	\N
1313	p0i6waiqjq8ddx74gjruj7q1	650020	นาย ณัฐวุฒิ บึงโบก	PDT1	M8	Staff	3		2025-11-04 14:42:07.397	2025-11-04 14:42:07.397	\N	\N	\N	\N	Production	\N
1314	p0i6waiqjq8ddx74gjruj7q1	650020	นาย ณัฐวุฒิ บึงโบก	PDT1	M8	Staff	3		2025-11-04 14:42:07.397	2025-11-04 14:42:07.397	2025-11-04 14:42:07.401	\N	\N	\N	Production	\N
1317	swq235hsq8idcwjvuk2mkyux	650024	น.ส. มินตรา แซ่ตั้ง	PCM	PK	Staff	3		2025-11-04 14:42:07.475	2025-11-04 14:42:07.475	\N	\N	\N	\N	Support	\N
1318	swq235hsq8idcwjvuk2mkyux	650024	น.ส. มินตรา แซ่ตั้ง	PCM	PK	Staff	3		2025-11-04 14:42:07.475	2025-11-04 14:42:07.475	2025-11-04 14:42:07.481	\N	\N	\N	Support	\N
1321	yokomonr0xfahpoh6f0u8u2i	650027	น.ส. ปนัดดา ไพรเขต	PDT3	BZ	Staff	3		2025-11-04 14:42:07.555	2025-11-04 14:42:07.555	\N	\N	\N	\N	Production	\N
1322	yokomonr0xfahpoh6f0u8u2i	650027	น.ส. ปนัดดา ไพรเขต	PDT3	BZ	Staff	3		2025-11-04 14:42:07.555	2025-11-04 14:42:07.555	2025-11-04 14:42:07.559	\N	\N	\N	Production	\N
1325	u1uos6nyqlt265tnlft3zxiv	650030	นาย สหรัฐ ศรีทอง	PDM	IT	Staff	3		2025-11-04 14:42:07.638	2025-11-04 14:42:07.638	\N	\N	\N	\N	Support	\N
1326	u1uos6nyqlt265tnlft3zxiv	650030	นาย สหรัฐ ศรีทอง	PDM	IT	Staff	3		2025-11-04 14:42:07.638	2025-11-04 14:42:07.638	2025-11-04 14:42:07.643	\N	\N	\N	Support	\N
1329	oh7wdh0gbt7onwi37tkvluxf	650032	น.ส. นนธิญา พลยา	PCM	PK	Staff	3		2025-11-04 14:42:07.717	2025-11-04 14:42:07.717	\N	\N	\N	\N	Support	\N
1330	oh7wdh0gbt7onwi37tkvluxf	650032	น.ส. นนธิญา พลยา	PCM	PK	Staff	3		2025-11-04 14:42:07.717	2025-11-04 14:42:07.717	2025-11-04 14:42:07.722	\N	\N	\N	Support	\N
1333	mjhqdm9a70te2tjst3lywi1p	650036	นาย ภัทรพงศ์ กลิ่นสุคนธ์	PDT1	M8	Staff	3		2025-11-04 14:42:07.779	2025-11-04 14:42:07.779	\N	\N	\N	\N	Production	\N
1334	mjhqdm9a70te2tjst3lywi1p	650036	นาย ภัทรพงศ์ กลิ่นสุคนธ์	PDT1	M8	Staff	3		2025-11-04 14:42:07.779	2025-11-04 14:42:07.779	2025-11-04 14:42:07.783	\N	\N	\N	Production	\N
1337	s1v2vr670v13tx0zqqv8myq9	650038	นาย ณรงค์ศักดิ์ ศรีขวัญ	PCM	ST	Staff	3		2025-11-04 14:42:07.839	2025-11-04 14:42:07.839	\N	\N	\N	\N	Support	\N
1338	s1v2vr670v13tx0zqqv8myq9	650038	นาย ณรงค์ศักดิ์ ศรีขวัญ	PCM	ST	Staff	3		2025-11-04 14:42:07.839	2025-11-04 14:42:07.839	2025-11-04 14:42:07.843	\N	\N	\N	Support	\N
1340	xdpiycesyqygv1pohdj6q0yn	650039	นาย พีระพัฒน์ เหล็กแข็ง	PDT2	OQ	Staff	3		2025-11-04 14:42:07.881	2025-11-04 14:42:07.881	2025-11-04 14:42:07.901	\N	\N	\N	Production	\N
1343	j9opyo25561tobnzbjc52efi	650045	นาย สิทธิพร โพธิ์วงค์	PCM	ST	Staff	3		2025-11-04 14:42:07.943	2025-11-04 14:42:07.943	\N	\N	\N	\N	Support	\N
1344	j9opyo25561tobnzbjc52efi	650045	นาย สิทธิพร โพธิ์วงค์	PCM	ST	Staff	3		2025-11-04 14:42:07.943	2025-11-04 14:42:07.943	2025-11-04 14:42:07.947	\N	\N	\N	Support	\N
1347	txujslzowuukyxii6frrjzcj	650047	น.ส. เยาวมาลย์ คำตะลบ	PCM	TP	Staff	3		2025-11-04 14:42:08.021	2025-11-04 14:42:08.021	\N	\N	\N	\N	Support	\N
1348	txujslzowuukyxii6frrjzcj	650047	น.ส. เยาวมาลย์ คำตะลบ	PCM	TP	Staff	3		2025-11-04 14:42:08.021	2025-11-04 14:42:08.021	2025-11-04 14:42:08.026	\N	\N	\N	Support	\N
1351	axvfi0m8rtitcrcih8hpltsf	650049	นาย อนุชา กองทอง	PCM	TP	Staff	3		2025-11-04 14:42:08.099	2025-11-04 14:42:08.099	\N	\N	\N	\N	Support	\N
1352	axvfi0m8rtitcrcih8hpltsf	650049	นาย อนุชา กองทอง	PCM	TP	Staff	3		2025-11-04 14:42:08.099	2025-11-04 14:42:08.099	2025-11-04 14:42:08.104	\N	\N	\N	Support	\N
1355	gsydgoi7idodqcu5b095o4yr	650051	น.ส. นันธิยา กุลวงค์	PDM	FC	Staff	3		2025-11-04 14:42:08.183	2025-11-04 14:42:08.183	\N	\N	\N	\N	Support	\N
1356	gsydgoi7idodqcu5b095o4yr	650051	น.ส. นันธิยา กุลวงค์	PDM	FC	Staff	3		2025-11-04 14:42:08.183	2025-11-04 14:42:08.183	2025-11-04 14:42:08.187	\N	\N	\N	Support	\N
1359	qdrzgf8vym5ckh0a0pm841pb	650053	นาย บุญมา มาลี	PCM	ST	Staff	3		2025-11-04 14:42:08.249	2025-11-04 14:42:08.249	\N	\N	\N	\N	Support	\N
1360	qdrzgf8vym5ckh0a0pm841pb	650053	นาย บุญมา มาลี	PCM	ST	Staff	3		2025-11-04 14:42:08.249	2025-11-04 14:42:08.249	2025-11-04 14:42:08.269	\N	\N	\N	Support	\N
1363	siudmwrxwy6hra3tif3dzftf	650061	น.ส. รุ่งทิวา ปินตาวนา	PUD	PU2	Staff	3		2025-11-04 14:42:08.355	2025-11-04 14:42:08.355	\N	\N	\N	\N	Non Production	\N
1364	siudmwrxwy6hra3tif3dzftf	650061	น.ส. รุ่งทิวา ปินตาวนา	PUD	PU2	Staff	3		2025-11-04 14:42:08.355	2025-11-04 14:42:08.355	2025-11-04 14:42:08.359	\N	\N	\N	Non Production	\N
1367	ujr3l30so9csgsq50e9360hw	650065	นาย กิตติศักดิ์ เพ็งศรี	ENI	EN	Staff	3		2025-11-04 14:42:08.437	2025-11-04 14:42:08.437	\N	\N	\N	\N	Support	\N
1368	ujr3l30so9csgsq50e9360hw	650065	นาย กิตติศักดิ์ เพ็งศรี	ENI	EN	Staff	3		2025-11-04 14:42:08.437	2025-11-04 14:42:08.437	2025-11-04 14:42:08.441	\N	\N	\N	Support	\N
1371	ewiqbiqzv3whkeky7fyd874e	650067	นาย อนันต์ ชัยบิน	PDM	FC	Staff	2		2025-11-04 14:42:08.519	2025-11-04 14:42:08.519	\N	\N	\N	\N	Support	\N
1372	ewiqbiqzv3whkeky7fyd874e	650067	นาย อนันต์ ชัยบิน	PDM	FC	Staff	2		2025-11-04 14:42:08.519	2025-11-04 14:42:08.519	2025-11-04 14:42:08.524	\N	\N	\N	Support	\N
1375	vlep9rb9ez36zk1hbwi1ge3x	650069	นาย อริญชวิทย์ ทองงามดี	QAD	IP	Staff	2		2025-11-04 14:42:08.585	2025-11-04 14:42:08.585	\N	\N	\N	\N	Support	\N
1376	vlep9rb9ez36zk1hbwi1ge3x	650069	นาย อริญชวิทย์ ทองงามดี	QAD	IP	Staff	2		2025-11-04 14:42:08.585	2025-11-04 14:42:08.585	2025-11-04 14:42:08.603	\N	\N	\N	Support	\N
1379	sijyvoa7hnfe4hm6v1aetbin	650071	น.ส. กัลยารัตน์ เรืองคำ	FNC	AC	Staff	2		2025-11-04 14:42:08.687	2025-11-04 14:42:08.687	\N	\N	\N	\N	Non Production	\N
1380	sijyvoa7hnfe4hm6v1aetbin	650071	น.ส. กัลยารัตน์ เรืองคำ	FNC	AC	Staff	2		2025-11-04 14:42:08.687	2025-11-04 14:42:08.687	2025-11-04 14:42:08.694	\N	\N	\N	Non Production	\N
1387	a48nq25i4z51y3wwilylxj45	650076	นาย ธนากร นกไทย	QAD	QA	Staff	2		2025-11-04 14:42:08.858	2025-11-04 14:42:08.858	\N	\N	\N	\N	Support	\N
1388	a48nq25i4z51y3wwilylxj45	650076	นาย ธนากร นกไทย	QAD	QA	Staff	2		2025-11-04 14:42:08.858	2025-11-04 14:42:08.858	2025-11-04 14:42:08.862	\N	\N	\N	Support	\N
1391	hdwjlvzlz15f4y6xg3tx0cpv	650078	นาย วีระยุทธ โพธิเยีย	PDM	FC	Staff	2		2025-11-04 14:42:08.93	2025-11-04 14:42:08.93	\N	\N	\N	\N	Support	\N
1392	hdwjlvzlz15f4y6xg3tx0cpv	650078	นาย วีระยุทธ โพธิเยีย	PDM	FC	Staff	2		2025-11-04 14:42:08.93	2025-11-04 14:42:08.93	2025-11-04 14:42:08.946	\N	\N	\N	Support	\N
1395	hefh10uptzq20qvawtgp77pz	65K007	นาย วัชริ สุนทร	PCM	Q-GATE	Staff	3		2025-11-04 14:42:09.018	2025-11-04 14:42:09.018	\N	\N	\N	\N	Support	\N
1396	hefh10uptzq20qvawtgp77pz	65K007	นาย วัชริ สุนทร	PCM	Q-GATE	Staff	3		2025-11-04 14:42:09.018	2025-11-04 14:42:09.018	2025-11-04 14:42:09.024	\N	\N	\N	Support	\N
1399	euygqomx3b4lbn8cjy1y7p0e	65K016	น.ส. ศิริพร การริน	QAD	QC2	Staff	3		2025-11-04 14:42:09.101	2025-11-04 14:42:09.101	\N	\N	\N	\N	Support	\N
1400	euygqomx3b4lbn8cjy1y7p0e	65K016	น.ส. ศิริพร การริน	QAD	QC2	Staff	3		2025-11-04 14:42:09.101	2025-11-04 14:42:09.101	2025-11-04 14:42:09.107	\N	\N	\N	Support	\N
1403	m1s3kjmspv4z1l39faawa3it	65K028	น.ส. วิภาดา ศรีวาปี	QAD	QC2	Staff	3		2025-11-04 14:42:09.18	2025-11-04 14:42:09.18	\N	\N	\N	\N	Support	\N
1404	m1s3kjmspv4z1l39faawa3it	65K028	น.ส. วิภาดา ศรีวาปี	QAD	QC2	Staff	3		2025-11-04 14:42:09.18	2025-11-04 14:42:09.18	2025-11-04 14:42:09.184	\N	\N	\N	Support	\N
1407	xvqqxoec7e5m8ok8go6vl7qy	65K036	นาย จักรพงษ์ ทับทิมอ่อน	PDT3	BZ	Staff	3		2025-11-04 14:42:09.244	2025-11-04 14:42:09.244	\N	\N	\N	\N	Production	\N
1408	xvqqxoec7e5m8ok8go6vl7qy	65K036	นาย จักรพงษ์ ทับทิมอ่อน	PDT3	BZ	Staff	3		2025-11-04 14:42:09.244	2025-11-04 14:42:09.244	2025-11-04 14:42:09.265	\N	\N	\N	Production	\N
1411	m6hqbos1olhvu5ib3pxnouvb	65K050	นาย ปุรเชษฐ์ ประโพทานัง	QAD	QC2	Staff	3		2025-11-04 14:42:09.344	2025-11-04 14:42:09.344	\N	\N	\N	\N	Support	\N
1412	m6hqbos1olhvu5ib3pxnouvb	65K050	นาย ปุรเชษฐ์ ประโพทานัง	QAD	QC2	Staff	3		2025-11-04 14:42:09.344	2025-11-04 14:42:09.344	2025-11-04 14:42:09.35	\N	\N	\N	Support	\N
1415	yo22bxz4ook4kpod20zohvno	65K059	น.ส. ณิชาภัทร ภูมิสุข	PDT3	BZ	Staff	3		2025-11-04 14:42:09.431	2025-11-04 14:42:09.431	\N	\N	\N	\N	Production	\N
1416	yo22bxz4ook4kpod20zohvno	65K059	น.ส. ณิชาภัทร ภูมิสุข	PDT3	BZ	Staff	3		2025-11-04 14:42:09.431	2025-11-04 14:42:09.431	2025-11-04 14:42:09.436	\N	\N	\N	Production	\N
1419	q4s6d1zbfpttg13dow40gari	65K112	นาย นิพัทธ์ มูลเอตร์	PDT1	NT	Staff	3		2025-11-04 14:42:09.496	2025-11-04 14:42:09.496	\N	\N	\N	\N	Production	\N
1420	q4s6d1zbfpttg13dow40gari	65K112	นาย นิพัทธ์ มูลเอตร์	PDT1	NT	Staff	3		2025-11-04 14:42:09.496	2025-11-04 14:42:09.496	2025-11-04 14:42:09.501	\N	\N	\N	Production	\N
1423	tsae4xh6p63w87k0mdsturvl	65K114	น.ส. ดวงฤทัย ทองหลาง	PDM	FC	Staff	3		2025-11-04 14:42:09.594	2025-11-04 14:42:09.594	\N	\N	\N	\N	Support	\N
1345	j5jwbv4ss5kbibfrau40jn9o	650046	นาย สิทธิโชค กองทรัพย์	PCM	ST	Staff	3		2025-11-04 14:42:07.983	2025-11-04 14:42:07.983	\N	\N	\N	\N	Support	\N
1346	j5jwbv4ss5kbibfrau40jn9o	650046	นาย สิทธิโชค กองทรัพย์	PCM	ST	Staff	3		2025-11-04 14:42:07.983	2025-11-04 14:42:07.983	2025-11-04 14:42:07.987	\N	\N	\N	Support	\N
1349	sc7g3ok1msqb4bgwnkwduyd9	650048	นาย ณพล มิ่งไชย	PCM	TP	Staff	3		2025-11-04 14:42:08.057	2025-11-04 14:42:08.057	\N	\N	\N	\N	Support	\N
1350	sc7g3ok1msqb4bgwnkwduyd9	650048	นาย ณพล มิ่งไชย	PCM	TP	Staff	3		2025-11-04 14:42:08.057	2025-11-04 14:42:08.057	2025-11-04 14:42:08.062	\N	\N	\N	Support	\N
1353	hxj8o03r5f1g3sndxb7h0e9w	650050	นาย คมกริช ฤทธิ์จรูญ	PDM	FC	Staff	3		2025-11-04 14:42:08.14	2025-11-04 14:42:08.14	\N	\N	\N	\N	Support	\N
1354	hxj8o03r5f1g3sndxb7h0e9w	650050	นาย คมกริช ฤทธิ์จรูญ	PDM	FC	Staff	3		2025-11-04 14:42:08.14	2025-11-04 14:42:08.14	2025-11-04 14:42:08.146	\N	\N	\N	Support	\N
1357	ul144kkiqutbw0qa8a5wsfs5	650052	น.ส. กัญญารัตน์ ทองทา	MKT	SL	Staff	3		2025-11-04 14:42:08.223	2025-11-04 14:42:08.223	\N	\N	\N	\N	Non Production	\N
1358	ul144kkiqutbw0qa8a5wsfs5	650052	น.ส. กัญญารัตน์ ทองทา	MKT	SL	Staff	3		2025-11-04 14:42:08.223	2025-11-04 14:42:08.223	2025-11-04 14:42:08.227	\N	\N	\N	Non Production	\N
1361	xysk4my06265hs8y4wgnhr55	650054	นาย ธวินทร์ ประทุม	PCM	ST	Staff	3		2025-11-04 14:42:08.316	2025-11-04 14:42:08.316	\N	\N	\N	\N	Support	\N
1362	xysk4my06265hs8y4wgnhr55	650054	นาย ธวินทร์ ประทุม	PCM	ST	Staff	3		2025-11-04 14:42:08.316	2025-11-04 14:42:08.316	2025-11-04 14:42:08.335	\N	\N	\N	Support	\N
1365	g11zgkusqgs4syksb7q23wop	650064	นาย ชนะ ทิพย์โอสถ	PDT4	MC	Staff	3		2025-11-04 14:42:08.393	2025-11-04 14:42:08.393	\N	\N	\N	\N	Production	\N
1366	g11zgkusqgs4syksb7q23wop	650064	นาย ชนะ ทิพย์โอสถ	PDT4	MC	Staff	3		2025-11-04 14:42:08.393	2025-11-04 14:42:08.393	2025-11-04 14:42:08.4	\N	\N	\N	Production	\N
1369	eynh8hp0chusliwaxxbp4ds7	650066	นาย อนุชา ขึ้นนกขุ้ม	PDM	PC	Staff	2		2025-11-04 14:42:08.475	2025-11-04 14:42:08.475	\N	\N	\N	\N	Support	\N
1370	eynh8hp0chusliwaxxbp4ds7	650066	นาย อนุชา ขึ้นนกขุ้ม	PDM	PC	Staff	2		2025-11-04 14:42:08.475	2025-11-04 14:42:08.475	2025-11-04 14:42:08.481	\N	\N	\N	Support	\N
1373	ieh0ob04xa5ljj5zlnrnf5kc	650068	นาย ชูชัย จารัตน์	PDM	FC	Staff	2		2025-11-04 14:42:08.559	2025-11-04 14:42:08.559	\N	\N	\N	\N	Support	\N
1374	ieh0ob04xa5ljj5zlnrnf5kc	650068	นาย ชูชัย จารัตน์	PDM	FC	Staff	2		2025-11-04 14:42:08.559	2025-11-04 14:42:08.559	2025-11-04 14:42:08.563	\N	\N	\N	Support	\N
1377	mrrnxivyzhew9kd6waa6p14q	650070	น.ส. สุพรรณี กุลดวงสี	QAD	IP	Staff	2		2025-11-04 14:42:08.644	2025-11-04 14:42:08.644	\N	\N	\N	\N	Support	\N
1378	mrrnxivyzhew9kd6waa6p14q	650070	น.ส. สุพรรณี กุลดวงสี	QAD	IP	Staff	2		2025-11-04 14:42:08.644	2025-11-04 14:42:08.644	2025-11-04 14:42:08.649	\N	\N	\N	Support	\N
1381	zhk5j2aga7rqiflf73hqy1z8	650072	น.ส. รัชนีภรณ์ คณะพูล	FNC	AC	Staff	2		2025-11-04 14:42:08.729	2025-11-04 14:42:08.729	\N	\N	\N	\N	Non Production	\N
1382	zhk5j2aga7rqiflf73hqy1z8	650072	น.ส. รัชนีภรณ์ คณะพูล	FNC	AC	Staff	2		2025-11-04 14:42:08.729	2025-11-04 14:42:08.729	2025-11-04 14:42:08.735	\N	\N	\N	Non Production	\N
1385	ce62h462qrenhzqi90zgh7wt	650075	น.ส. มยุรา บัวสระ	PDT2	OQ	Staff	2		2025-11-04 14:42:08.816	2025-11-04 14:42:08.816	\N	\N	\N	\N	Production	\N
1386	ce62h462qrenhzqi90zgh7wt	650075	น.ส. มยุรา บัวสระ	PDT2	OQ	Staff	2		2025-11-04 14:42:08.816	2025-11-04 14:42:08.816	2025-11-04 14:42:08.822	\N	\N	\N	Production	\N
1389	smlqunim3oeded9mi0oewxr5	650077	น.ส. ชลนิชา เทพขันธ์	HRD	GA	Staff	2		2025-11-04 14:42:08.884	2025-11-04 14:42:08.884	\N	\N	\N	\N	Non Production	\N
1390	smlqunim3oeded9mi0oewxr5	650077	น.ส. ชลนิชา เทพขันธ์	HRD	GA	Staff	2		2025-11-04 14:42:08.884	2025-11-04 14:42:08.884	2025-11-04 14:42:08.889	\N	\N	\N	Non Production	\N
1393	t6uspvvog4dsync7hhsutmk8	65K006	นาย ณัฐวุฒิ เสาวพันธ์	PCM	Q-GATE	Staff	3		2025-11-04 14:42:08.98	2025-11-04 14:42:08.98	\N	\N	\N	\N	Support	\N
1394	t6uspvvog4dsync7hhsutmk8	65K006	นาย ณัฐวุฒิ เสาวพันธ์	PCM	Q-GATE	Staff	3		2025-11-04 14:42:08.98	2025-11-04 14:42:08.98	2025-11-04 14:42:08.985	\N	\N	\N	Support	\N
1397	vydggusv8nrof76sdpor8e3v	65K010	นาย บัลลังก์ ทรัพย์ปลี	PCM	ST	Staff	3		2025-11-04 14:42:09.062	2025-11-04 14:42:09.062	\N	\N	\N	\N	Support	\N
1398	vydggusv8nrof76sdpor8e3v	65K010	นาย บัลลังก์ ทรัพย์ปลี	PCM	ST	Staff	3		2025-11-04 14:42:09.062	2025-11-04 14:42:09.062	2025-11-04 14:42:09.066	\N	\N	\N	Support	\N
1401	reg1xhkalwkx81zuxxocz0do	65K027	น.ส. อารีรัตน์ ใจสูงเนิน	PDT3	WB	Staff	3		2025-11-04 14:42:09.142	2025-11-04 14:42:09.142	\N	\N	\N	\N	Production	\N
1402	reg1xhkalwkx81zuxxocz0do	65K027	น.ส. อารีรัตน์ ใจสูงเนิน	PDT3	WB	Staff	3		2025-11-04 14:42:09.142	2025-11-04 14:42:09.142	2025-11-04 14:42:09.146	\N	\N	\N	Production	\N
1405	znwtmj4tta56fa37h7fwf95k	65K029	นาย ณัฐพล ไชยมนตรี	PCM	ST	Staff	3		2025-11-04 14:42:09.205	2025-11-04 14:42:09.205	\N	\N	\N	\N	Support	\N
1406	znwtmj4tta56fa37h7fwf95k	65K029	นาย ณัฐพล ไชยมนตรี	PCM	ST	Staff	3		2025-11-04 14:42:09.205	2025-11-04 14:42:09.205	2025-11-04 14:42:09.209	\N	\N	\N	Support	\N
1409	vhbf1s4ppfd4okyguumyeno5	65K049	นาย ณัฐพล สารบรรณ์	PDT3	BZ	Staff	3		2025-11-04 14:42:09.303	2025-11-04 14:42:09.303	\N	\N	\N	\N	Production	\N
1410	vhbf1s4ppfd4okyguumyeno5	65K049	นาย ณัฐพล สารบรรณ์	PDT3	BZ	Staff	3		2025-11-04 14:42:09.303	2025-11-04 14:42:09.303	2025-11-04 14:42:09.308	\N	\N	\N	Production	\N
1413	js0qmsy9bxs61j28bim56ayr	65K057	นาย บุรินทร์ พิเภก	PDT4	JA	Staff	3		2025-11-04 14:42:09.387	2025-11-04 14:42:09.387	\N	\N	\N	\N	Production	\N
1414	js0qmsy9bxs61j28bim56ayr	65K057	นาย บุรินทร์ พิเภก	PDT4	JA	Staff	3		2025-11-04 14:42:09.387	2025-11-04 14:42:09.387	2025-11-04 14:42:09.393	\N	\N	\N	Production	\N
1417	o638npvar0lntytrw9ht8c3i	65K072	นาย ออมสิน ทองมาตย์	PDM	FC	Staff	3		2025-11-04 14:42:09.473	2025-11-04 14:42:09.473	\N	\N	\N	\N	Support	\N
1418	o638npvar0lntytrw9ht8c3i	65K072	นาย ออมสิน ทองมาตย์	PDM	FC	Staff	3		2025-11-04 14:42:09.473	2025-11-04 14:42:09.473	2025-11-04 14:42:09.477	\N	\N	\N	Support	\N
1421	tarx5cuzd811mnoump5vo2sd	65K113	น.ส. พิมพ์สุภัค ไพรสวรรค์	PDT3	WB	Staff	3		2025-11-04 14:42:09.552	2025-11-04 14:42:09.552	\N	\N	\N	\N	Production	\N
1422	tarx5cuzd811mnoump5vo2sd	65K113	น.ส. พิมพ์สุภัค ไพรสวรรค์	PDT3	WB	Staff	3		2025-11-04 14:42:09.552	2025-11-04 14:42:09.552	2025-11-04 14:42:09.557	\N	\N	\N	Production	\N
1425	x6oc8xkgvd5raufyqfoh3if5	65K118	นาย ทานตะวัน โตดประโคน	PCM	Q-GATE	Staff	3		2025-11-04 14:42:09.638	2025-11-04 14:42:09.638	\N	\N	\N	\N	Support	\N
1426	x6oc8xkgvd5raufyqfoh3if5	65K118	นาย ทานตะวัน โตดประโคน	PCM	Q-GATE	Staff	3		2025-11-04 14:42:09.638	2025-11-04 14:42:09.638	2025-11-04 14:42:09.642	\N	\N	\N	Support	\N
1429	h3mjm4136i1etlia4ih4dvbg	65K129	น.ส. รัชนี อินทพรม	QAD	QC2	Staff	3		2025-11-04 14:42:09.719	2025-11-04 14:42:09.719	\N	\N	\N	\N	Support	\N
1430	h3mjm4136i1etlia4ih4dvbg	65K129	น.ส. รัชนี อินทพรม	QAD	QC2	Staff	3		2025-11-04 14:42:09.719	2025-11-04 14:42:09.719	2025-11-04 14:42:09.723	\N	\N	\N	Support	\N
1433	bcbvzyyppsggm47c9iiu20t3	65T024	นาย เกียรติศักดิ์ ลอยเมืองกลาง	PCM	ST	Staff	3		2025-11-04 14:42:09.782	2025-11-04 14:42:09.782	\N	\N	\N	\N	Support	\N
1434	bcbvzyyppsggm47c9iiu20t3	65T024	นาย เกียรติศักดิ์ ลอยเมืองกลาง	PCM	ST	Staff	3		2025-11-04 14:42:09.782	2025-11-04 14:42:09.782	2025-11-04 14:42:09.787	\N	\N	\N	Support	\N
1437	t7n21kq89hksrvgo0bhj0xmc	65T034	นาย วัชรินทร์ ผากงคำ	PDM	FC	Staff	3		2025-11-04 14:42:09.846	2025-11-04 14:42:09.846	\N	\N	\N	\N	Support	\N
1438	t7n21kq89hksrvgo0bhj0xmc	65T034	นาย วัชรินทร์ ผากงคำ	PDM	FC	Staff	3		2025-11-04 14:42:09.846	2025-11-04 14:42:09.846	2025-11-04 14:42:09.851	\N	\N	\N	Support	\N
1441	qrl9mi9zgeqb2dhr8ufxpbls	65T046	น.ส. อาภรณ์ พุทธสอน	PDT3	WB	Staff	3		2025-11-04 14:42:09.928	2025-11-04 14:42:09.928	\N	\N	\N	\N	Production	\N
1442	qrl9mi9zgeqb2dhr8ufxpbls	65T046	น.ส. อาภรณ์ พุทธสอน	PDT3	WB	Staff	3		2025-11-04 14:42:09.928	2025-11-04 14:42:09.928	2025-11-04 14:42:09.933	\N	\N	\N	Production	\N
1445	hqnbxxr8gdkfia59bl1rnf51	65T051	น.ส. นันญกาญจน์ พะสุรัมย์	PDT3	WB	Staff	3		2025-11-04 14:42:10.007	2025-11-04 14:42:10.007	\N	\N	\N	\N	Production	\N
1446	hqnbxxr8gdkfia59bl1rnf51	65T051	น.ส. นันญกาญจน์ พะสุรัมย์	PDT3	WB	Staff	3		2025-11-04 14:42:10.007	2025-11-04 14:42:10.007	2025-11-04 14:42:10.012	\N	\N	\N	Production	\N
1449	kgjpldqim1mg33ibzeti1tcz	65T069	น.ส. สุพรรณี แย้มกลิ่น	QAD	IP	Staff	3		2025-11-04 14:42:10.086	2025-11-04 14:42:10.086	\N	\N	\N	\N	Support	\N
1450	kgjpldqim1mg33ibzeti1tcz	65T069	น.ส. สุพรรณี แย้มกลิ่น	QAD	IP	Staff	3		2025-11-04 14:42:10.086	2025-11-04 14:42:10.086	2025-11-04 14:42:10.092	\N	\N	\N	Support	\N
1453	odpdq2vzi2kqfsu2a5hfe0z7	65T079	น.ส. ปิ่นลดา ภิรมย์	QAD	QC2	Staff	3		2025-11-04 14:42:10.166	2025-11-04 14:42:10.166	\N	\N	\N	\N	Support	\N
1454	odpdq2vzi2kqfsu2a5hfe0z7	65T079	น.ส. ปิ่นลดา ภิรมย์	QAD	QC2	Staff	3		2025-11-04 14:42:10.166	2025-11-04 14:42:10.166	2025-11-04 14:42:10.17	\N	\N	\N	Support	\N
1457	x0nras0l3hwrzf4m0ewtcm4c	65T083	นาย ประยุทธ พวงพี่	PDT3	GM	Staff	3		2025-11-04 14:42:10.245	2025-11-04 14:42:10.245	\N	\N	\N	\N	Production	\N
1458	x0nras0l3hwrzf4m0ewtcm4c	65T083	นาย ประยุทธ พวงพี่	PDT3	GM	Staff	3		2025-11-04 14:42:10.245	2025-11-04 14:42:10.245	2025-11-04 14:42:10.25	\N	\N	\N	Production	\N
1461	trcefmgn1nq7t4h4d2lfmbxv	65T090	นาย เอกรัตน์ เทียนแก้ว	PCM	TP	Staff	3		2025-11-04 14:42:10.324	2025-11-04 14:42:10.324	\N	\N	\N	\N	Support	\N
1462	trcefmgn1nq7t4h4d2lfmbxv	65T090	นาย เอกรัตน์ เทียนแก้ว	PCM	TP	Staff	3		2025-11-04 14:42:10.324	2025-11-04 14:42:10.324	2025-11-04 14:42:10.328	\N	\N	\N	Support	\N
1465	atr14a0avdu6hgz0ngdivmgb	65T106	น.ส. สุธิดา ระยาย้อย	QAD	QC2	Staff	3		2025-11-04 14:42:10.405	2025-11-04 14:42:10.405	\N	\N	\N	\N	Support	\N
1466	atr14a0avdu6hgz0ngdivmgb	65T106	น.ส. สุธิดา ระยาย้อย	QAD	QC2	Staff	3		2025-11-04 14:42:10.405	2025-11-04 14:42:10.405	2025-11-04 14:42:10.411	\N	\N	\N	Support	\N
1469	znqtcv95f4lhh5nt8zrseqin	660004	นาย อดิพงษ์ อาษานอก	PDT3	JC	Staff	2		2025-11-04 14:42:10.485	2025-11-04 14:42:10.485	\N	\N	\N	\N	Production	\N
1470	znqtcv95f4lhh5nt8zrseqin	660004	นาย อดิพงษ์ อาษานอก	PDT3	JC	Staff	2		2025-11-04 14:42:10.485	2025-11-04 14:42:10.485	2025-11-04 14:42:10.49	\N	\N	\N	Production	\N
1473	mwh8rjuer476c3ovzvdy7rpm	660007	นาย ณัฐวุฒิ พ่วงกลาง	PDT4	MC	Staff	2		2025-11-04 14:42:10.546	2025-11-04 14:42:10.546	\N	\N	\N	\N	Production	\N
1474	mwh8rjuer476c3ovzvdy7rpm	660007	นาย ณัฐวุฒิ พ่วงกลาง	PDT4	MC	Staff	2		2025-11-04 14:42:10.546	2025-11-04 14:42:10.546	2025-11-04 14:42:10.551	\N	\N	\N	Production	\N
1477	lap8nznay18p3ltxqwwublz3	660009	นาย รัฐศาสตร์ ญานเพิ่ม	PDT4	JA	Staff	2		2025-11-04 14:42:10.627	2025-11-04 14:42:10.627	\N	\N	\N	\N	Production	\N
1478	lap8nznay18p3ltxqwwublz3	660009	นาย รัฐศาสตร์ ญานเพิ่ม	PDT4	JA	Staff	2		2025-11-04 14:42:10.627	2025-11-04 14:42:10.627	2025-11-04 14:42:10.632	\N	\N	\N	Production	\N
1481	njwpnzxbg6burepene96mgzg	660011	น.ส. เมรินทร์ กระจ่างถิ่น	PDT3	WB	Staff	2		2025-11-04 14:42:10.709	2025-11-04 14:42:10.709	\N	\N	\N	\N	Production	\N
1482	njwpnzxbg6burepene96mgzg	660011	น.ส. เมรินทร์ กระจ่างถิ่น	PDT3	WB	Staff	2		2025-11-04 14:42:10.709	2025-11-04 14:42:10.709	2025-11-04 14:42:10.713	\N	\N	\N	Production	\N
1485	xtkkzfalkvyh6dbhb77rm6a7	660016	นาย พีรพัฒน์ นามยงค์	PDT4	EL	Staff	2		2025-11-04 14:42:10.789	2025-11-04 14:42:10.789	\N	\N	\N	\N	Production	\N
1486	xtkkzfalkvyh6dbhb77rm6a7	660016	นาย พีรพัฒน์ นามยงค์	PDT4	EL	Staff	2		2025-11-04 14:42:10.789	2025-11-04 14:42:10.789	2025-11-04 14:42:10.793	\N	\N	\N	Production	\N
1489	my5r86l3l24130mrj9z2vv32	660018	น.ส. วาสนา เถาะพูน	HRD	HR	Staff	2		2025-11-04 14:42:10.868	2025-11-04 14:42:10.868	\N	\N	\N	\N	Non Production	\N
1490	my5r86l3l24130mrj9z2vv32	660018	น.ส. วาสนา เถาะพูน	HRD	HR	Staff	2		2025-11-04 14:42:10.868	2025-11-04 14:42:10.868	2025-11-04 14:42:10.873	\N	\N	\N	Non Production	\N
1493	icmuxvnqt4zuofcce23h5187	660021	นาย กฤษดา คลอยกิ่ง	QAD	IP	Junior	2		2025-11-04 14:42:10.951	2025-11-04 14:42:10.951	\N	\N	\N	\N	Support	\N
1494	icmuxvnqt4zuofcce23h5187	660021	นาย กฤษดา คลอยกิ่ง	QAD	IP	Junior	2		2025-11-04 14:42:10.951	2025-11-04 14:42:10.951	2025-11-04 14:42:10.955	\N	\N	\N	Support	\N
1497	rr1b86gdzf03ak31puxqxkv9	660023	น.ส. กาญจนา คำนึงครวญ	QAD	QA	Staff	2		2025-11-04 14:42:11.013	2025-11-04 14:42:11.013	\N	\N	\N	\N	Support	\N
1498	rr1b86gdzf03ak31puxqxkv9	660023	น.ส. กาญจนา คำนึงครวญ	QAD	QA	Staff	2		2025-11-04 14:42:11.013	2025-11-04 14:42:11.013	2025-11-04 14:42:11.018	\N	\N	\N	Support	\N
1501	agqf4i5t9g8zc0m3zxvsgokw	660026	นาย กฤษฎา โปต๊ะ	PDT4	MC	Staff	2		2025-11-04 14:42:11.079	2025-11-04 14:42:11.079	\N	\N	\N	\N	Production	\N
1502	agqf4i5t9g8zc0m3zxvsgokw	660026	นาย กฤษฎา โปต๊ะ	PDT4	MC	Staff	2		2025-11-04 14:42:11.079	2025-11-04 14:42:11.079	2025-11-04 14:42:11.083	\N	\N	\N	Production	\N
1424	tsae4xh6p63w87k0mdsturvl	65K114	น.ส. ดวงฤทัย ทองหลาง	PDM	FC	Staff	3		2025-11-04 14:42:09.594	2025-11-04 14:42:09.594	2025-11-04 14:42:09.6	\N	\N	\N	Support	\N
1427	cnf2gq34h2kojlu1astac1l4	65K125	นาย จอมพล สายโยธา	PCM	ST	Staff	3		2025-11-04 14:42:09.676	2025-11-04 14:42:09.676	\N	\N	\N	\N	Support	\N
1428	cnf2gq34h2kojlu1astac1l4	65K125	นาย จอมพล สายโยธา	PCM	ST	Staff	3		2025-11-04 14:42:09.676	2025-11-04 14:42:09.676	2025-11-04 14:42:09.682	\N	\N	\N	Support	\N
1431	g7ug1vji5plskdfs42uboyka	65T023	นาย ปรีชา เหลา	PCM	ST	Staff	3		2025-11-04 14:42:09.758	2025-11-04 14:42:09.758	\N	\N	\N	\N	Support	\N
1432	g7ug1vji5plskdfs42uboyka	65T023	นาย ปรีชา เหลา	PCM	ST	Staff	3		2025-11-04 14:42:09.758	2025-11-04 14:42:09.758	2025-11-04 14:42:09.762	\N	\N	\N	Support	\N
1435	a5yj65gyp7o1lltprn1wb1jd	65T030	นาย ศรายุทธ สอนสุข	PCM	ST	Staff	3		2025-11-04 14:42:09.822	2025-11-04 14:42:09.822	\N	\N	\N	\N	Support	\N
1436	a5yj65gyp7o1lltprn1wb1jd	65T030	นาย ศรายุทธ สอนสุข	PCM	ST	Staff	3		2025-11-04 14:42:09.822	2025-11-04 14:42:09.822	2025-11-04 14:42:09.826	\N	\N	\N	Support	\N
1439	hs6n7mdhmxnu1juwpncr8wst	65T042	นาย นัฐพงศ์ พรรณา	PDT3	BZ	Staff	3		2025-11-04 14:42:09.886	2025-11-04 14:42:09.886	\N	\N	\N	\N	Production	\N
1440	hs6n7mdhmxnu1juwpncr8wst	65T042	นาย นัฐพงศ์ พรรณา	PDT3	BZ	Staff	3		2025-11-04 14:42:09.886	2025-11-04 14:42:09.886	2025-11-04 14:42:09.892	\N	\N	\N	Production	\N
1443	jisgbgex502k5a9bda1xsq6k	65T047	นาย มาหามะรอกิ กะนางอ	PDT4	JP	Staff	3		2025-11-04 14:42:09.968	2025-11-04 14:42:09.968	\N	\N	\N	\N	Production	\N
1444	jisgbgex502k5a9bda1xsq6k	65T047	นาย มาหามะรอกิ กะนางอ	PDT4	JP	Staff	3		2025-11-04 14:42:09.968	2025-11-04 14:42:09.968	2025-11-04 14:42:09.973	\N	\N	\N	Production	\N
1447	enxqfkzosoi0hul5pxetvg9c	65T052	น.ส. มาริสา พิมพ์ชัย	PDT3	WB	Staff	3		2025-11-04 14:42:10.046	2025-11-04 14:42:10.046	\N	\N	\N	\N	Production	\N
1448	enxqfkzosoi0hul5pxetvg9c	65T052	น.ส. มาริสา พิมพ์ชัย	PDT3	WB	Staff	3		2025-11-04 14:42:10.046	2025-11-04 14:42:10.046	2025-11-04 14:42:10.052	\N	\N	\N	Production	\N
1451	jzo10bl6jyp32wknqkknwrmo	65T075	นาย กฤษฎา ราภูมี	PDT2	OQ	Staff	3		2025-11-04 14:42:10.128	2025-11-04 14:42:10.128	\N	\N	\N	\N	Production	\N
1452	jzo10bl6jyp32wknqkknwrmo	65T075	นาย กฤษฎา ราภูมี	PDT2	OQ	Staff	3		2025-11-04 14:42:10.128	2025-11-04 14:42:10.128	2025-11-04 14:42:10.133	\N	\N	\N	Production	\N
1455	o0ka5azbr49t2htb1o0wmkm8	65T080	น.ส. ลลิตา จันทร์ภิรมย์	QAD	QC2	Staff	3		2025-11-04 14:42:10.204	2025-11-04 14:42:10.204	\N	\N	\N	\N	Support	\N
1456	o0ka5azbr49t2htb1o0wmkm8	65T080	น.ส. ลลิตา จันทร์ภิรมย์	QAD	QC2	Staff	3		2025-11-04 14:42:10.204	2025-11-04 14:42:10.204	2025-11-04 14:42:10.209	\N	\N	\N	Support	\N
1459	s0o9t40hi04c29jba0oxqhbz	65T084	น.ส. ยุพาภรณ์ สมมากรณ์	QAD	IP	Staff	3		2025-11-04 14:42:10.284	2025-11-04 14:42:10.284	\N	\N	\N	\N	Support	\N
1460	s0o9t40hi04c29jba0oxqhbz	65T084	น.ส. ยุพาภรณ์ สมมากรณ์	QAD	IP	Staff	3		2025-11-04 14:42:10.284	2025-11-04 14:42:10.284	2025-11-04 14:42:10.289	\N	\N	\N	Support	\N
1463	ctfaef6hia4zz0nvvw4e284l	65T102	นาย ณัฐวุฒิ ดิษจันทึก	PDT3	BZ	Staff	3		2025-11-04 14:42:10.361	2025-11-04 14:42:10.361	\N	\N	\N	\N	Production	\N
1464	ctfaef6hia4zz0nvvw4e284l	65T102	นาย ณัฐวุฒิ ดิษจันทึก	PDT3	BZ	Staff	3		2025-11-04 14:42:10.361	2025-11-04 14:42:10.361	2025-11-04 14:42:10.367	\N	\N	\N	Production	\N
1471	s1gwduj9yutytg4ykm8lqxh3	660005	นาย พิสิษฐ เพชรคอน	PDM	IT	Staff	2		2025-11-04 14:42:10.523	2025-11-04 14:42:10.523	\N	\N	\N	\N	Support	\N
1472	s1gwduj9yutytg4ykm8lqxh3	660005	นาย พิสิษฐ เพชรคอน	PDM	IT	Staff	2		2025-11-04 14:42:10.523	2025-11-04 14:42:10.523	2025-11-04 14:42:10.527	\N	\N	\N	Support	\N
1475	z8tth1unskkgfojaqirheimg	660008	นาย วรพล หาญกล้า	PDT2	OQ	Staff	2		2025-11-04 14:42:10.584	2025-11-04 14:42:10.584	\N	\N	\N	\N	Production	\N
1476	z8tth1unskkgfojaqirheimg	660008	นาย วรพล หาญกล้า	PDT2	OQ	Staff	2		2025-11-04 14:42:10.584	2025-11-04 14:42:10.584	2025-11-04 14:42:10.588	\N	\N	\N	Production	\N
1479	g100l7oyn9se358cgyh95p0j	660010	นาย ศตวรรษ สังข์ทอง	PDT4	JM	Staff	2		2025-11-04 14:42:10.668	2025-11-04 14:42:10.668	\N	\N	\N	\N	Production	\N
1480	g100l7oyn9se358cgyh95p0j	660010	นาย ศตวรรษ สังข์ทอง	PDT4	JM	Staff	2		2025-11-04 14:42:10.668	2025-11-04 14:42:10.668	2025-11-04 14:42:10.673	\N	\N	\N	Production	\N
1487	yfyrwghfttb1c5bqgk2ajk69	660017	น.ส. ลวิตรา ยั่งยืนปิยรัตน์	HRD	SC	Staff	2		2025-11-04 14:42:10.827	2025-11-04 14:42:10.827	\N	\N	\N	\N	Non Production	\N
1488	yfyrwghfttb1c5bqgk2ajk69	660017	น.ส. ลวิตรา ยั่งยืนปิยรัตน์	HRD	SC	Staff	2		2025-11-04 14:42:10.827	2025-11-04 14:42:10.827	2025-11-04 14:42:10.831	\N	\N	\N	Non Production	\N
1491	v0ki9brqwzpbpp4cqaiuh80e	660019	นาย ศราวุฒิ เชิดฉาย	HRD	EF	Staff	2		2025-11-04 14:42:10.907	2025-11-04 14:42:10.907	\N	\N	\N	\N	Non Production	\N
1492	v0ki9brqwzpbpp4cqaiuh80e	660019	นาย ศราวุฒิ เชิดฉาย	HRD	EF	Staff	2		2025-11-04 14:42:10.907	2025-11-04 14:42:10.907	2025-11-04 14:42:10.912	\N	\N	\N	Non Production	\N
1495	yif8dwr83ua7hmc77wet9l6l	660022	นาย พิชัยภูษิต หลักโคตร	PDT3	BZ	Junior	2		2025-11-04 14:42:10.989	2025-11-04 14:42:10.989	\N	\N	\N	\N	Production	\N
1496	yif8dwr83ua7hmc77wet9l6l	660022	นาย พิชัยภูษิต หลักโคตร	PDT3	BZ	Junior	2		2025-11-04 14:42:10.989	2025-11-04 14:42:10.989	2025-11-04 14:42:10.993	\N	\N	\N	Production	\N
1503	pz3nfz702jdrn389gde7k2dq	660027	น.ส. กนกวรรณ กิ่งไทร	PDM	IT	Staff	2		2025-11-04 14:42:11.135	2025-11-04 14:42:11.135	\N	\N	\N	\N	Support	\N
1504	pz3nfz702jdrn389gde7k2dq	660027	น.ส. กนกวรรณ กิ่งไทร	PDM	IT	Staff	2		2025-11-04 14:42:11.135	2025-11-04 14:42:11.135	2025-11-04 14:42:11.141	\N	\N	\N	Support	\N
1467	ees8pqaissue11qf2cfdv5a6	660001	นาย วรา สาคร	HRD	HR	Staff	2		2025-11-04 14:42:10.446	2025-11-20 14:32:30.654	\N	\N	1	\N	Non Production	wara_s@aoyama.co.th
1499	eqkhc72gqilxzetvvsd0yaub	660024	น.ส. พัชราลัย ฤทธิ์ประเสริฐ	MKT	TM	Senior Team Manager	2		2025-11-04 14:42:11.052	2025-11-20 14:32:35.668	\N	\N	1	\N	Non Production	patcharalai_r@aoyama.co.th
1505	f2zp9g4wnm7l6anaxgh0j7wv	660029	นาย อิทธิพล ไหว้พรหม	PDT4	EL	Staff	2		2025-11-04 14:42:11.178	2025-11-04 14:42:11.178	\N	\N	\N	\N	Production	\N
1506	f2zp9g4wnm7l6anaxgh0j7wv	660029	นาย อิทธิพล ไหว้พรหม	PDT4	EL	Staff	2		2025-11-04 14:42:11.178	2025-11-04 14:42:11.178	2025-11-04 14:42:11.186	\N	\N	\N	Production	\N
1509	zvnqpqm8u5gwlgt8ih9vj8m3	660031	นาย ทวิภัทร ยะสีดา	HRD	EF	Staff	2		2025-11-04 14:42:11.245	2025-11-04 14:42:11.245	\N	\N	\N	\N	Non Production	\N
1510	zvnqpqm8u5gwlgt8ih9vj8m3	660031	นาย ทวิภัทร ยะสีดา	HRD	EF	Staff	2		2025-11-04 14:42:11.245	2025-11-04 14:42:11.245	2025-11-04 14:42:11.267	\N	\N	\N	Non Production	\N
1517	z0wx53hhrxz0wzodnksyiane	660035	นาย สุชาติ สีสุภา	PDT1	M6	Staff	2		2025-11-04 14:42:11.418	2025-11-04 14:42:11.418	\N	\N	\N	\N	Production	\N
1518	z0wx53hhrxz0wzodnksyiane	660035	นาย สุชาติ สีสุภา	PDT1	M6	Staff	2		2025-11-04 14:42:11.418	2025-11-04 14:42:11.418	2025-11-04 14:42:11.422	\N	\N	\N	Production	\N
1521	blgit6078tthdoegzy33fkxp	660037	นาย นันทวุฒิ ใสสด	PDT1	M8	Staff	2		2025-11-04 14:42:11.496	2025-11-04 14:42:11.496	\N	\N	\N	\N	Production	\N
1522	blgit6078tthdoegzy33fkxp	660037	นาย นันทวุฒิ ใสสด	PDT1	M8	Staff	2		2025-11-04 14:42:11.496	2025-11-04 14:42:11.496	2025-11-04 14:42:11.5	\N	\N	\N	Production	\N
1525	xyz75tyfiowpcfwx81v7xcxq	660039	นาย สันติ สมสีแก้ว	PDT1	M8	Staff	2		2025-11-04 14:42:11.574	2025-11-04 14:42:11.574	\N	\N	\N	\N	Production	\N
1526	xyz75tyfiowpcfwx81v7xcxq	660039	นาย สันติ สมสีแก้ว	PDT1	M8	Staff	2		2025-11-04 14:42:11.574	2025-11-04 14:42:11.574	2025-11-04 14:42:11.579	\N	\N	\N	Production	\N
1533	mrqll65j9wdvyyuqpmefi8mc	660048	น.ส. กัญญารัตน์ บุญหาราช	QAD	QA	Staff	2		2025-11-04 14:42:11.733	2025-11-04 14:42:11.733	\N	\N	\N	\N	Support	\N
1534	mrqll65j9wdvyyuqpmefi8mc	660048	น.ส. กัญญารัตน์ บุญหาราช	QAD	QA	Staff	2		2025-11-04 14:42:11.733	2025-11-04 14:42:11.733	2025-11-04 14:42:11.737	\N	\N	\N	Support	\N
1537	c7ghfkb2btflpi5eyqmyhaya	660050	นาย จิรยุทธ นนท์เข็มพรม	PDT3	BZ	Staff	2		2025-11-04 14:42:11.812	2025-11-04 14:42:11.812	\N	\N	\N	\N	Production	\N
1538	c7ghfkb2btflpi5eyqmyhaya	660050	นาย จิรยุทธ นนท์เข็มพรม	PDT3	BZ	Staff	2		2025-11-04 14:42:11.812	2025-11-04 14:42:11.812	2025-11-04 14:42:11.816	\N	\N	\N	Production	\N
1541	rd87og12knybw8fi7gt6o6hk	660053	น.ส. เพ็ญพิสุทธิ์ สร้อยหิน	QAD	IP	Staff	2		2025-11-04 14:42:11.894	2025-11-04 14:42:11.894	\N	\N	\N	\N	Support	\N
1542	rd87og12knybw8fi7gt6o6hk	660053	น.ส. เพ็ญพิสุทธิ์ สร้อยหิน	QAD	IP	Staff	2		2025-11-04 14:42:11.894	2025-11-04 14:42:11.894	2025-11-04 14:42:11.899	\N	\N	\N	Support	\N
1545	l4u2ki2pcpy5l6pghhkpt9mx	660055	นาย คมกฤษ คำมาลา	PCM	ST	Staff	2		2025-11-04 14:42:11.975	2025-11-04 14:42:11.975	\N	\N	\N	\N	Support	\N
1546	l4u2ki2pcpy5l6pghhkpt9mx	660055	นาย คมกฤษ คำมาลา	PCM	ST	Staff	2		2025-11-04 14:42:11.975	2025-11-04 14:42:11.975	2025-11-04 14:42:11.979	\N	\N	\N	Support	\N
1549	d9m63msrzq53zo8iv3h367y7	660057	น.ส. สุภัสสรา แดงบุญเรือง	MKT	SL	Staff	2		2025-11-04 14:42:12.053	2025-11-04 14:42:12.053	\N	\N	\N	\N	Non Production	\N
1550	d9m63msrzq53zo8iv3h367y7	660057	น.ส. สุภัสสรา แดงบุญเรือง	MKT	SL	Staff	2		2025-11-04 14:42:12.053	2025-11-04 14:42:12.053	2025-11-04 14:42:12.058	\N	\N	\N	Non Production	\N
1553	tn8k1llvfonp9ysvbs9ynwcw	660059	น.ส. ฤทัยรัตน์ โคสาสุ	QAD	IP	Staff	1		2025-11-04 14:42:12.13	2025-11-04 14:42:12.13	\N	\N	\N	\N	Support	\N
1554	tn8k1llvfonp9ysvbs9ynwcw	660059	น.ส. ฤทัยรัตน์ โคสาสุ	QAD	IP	Staff	1		2025-11-04 14:42:12.13	2025-11-04 14:42:12.13	2025-11-04 14:42:12.136	\N	\N	\N	Support	\N
1557	v9zw8hupwb2iq7ju7o0hwhc8	66K004	น.ส. ขนิษฐา ศรัทธา	QAD	QC2	Staff	2		2025-11-04 14:42:12.214	2025-11-04 14:42:12.214	\N	\N	\N	\N	Support	\N
1558	v9zw8hupwb2iq7ju7o0hwhc8	66K004	น.ส. ขนิษฐา ศรัทธา	QAD	QC2	Staff	2		2025-11-04 14:42:12.214	2025-11-04 14:42:12.214	2025-11-04 14:42:12.219	\N	\N	\N	Support	\N
1561	ymq1gmflnbs23ikqfxzl2hi3	66K007	นาย ภาณุวัฒน์ งามจำรัส	PDT1	NT	Staff	2		2025-11-04 14:42:12.294	2025-11-04 14:42:12.294	\N	\N	\N	\N	Production	\N
1562	ymq1gmflnbs23ikqfxzl2hi3	66K007	นาย ภาณุวัฒน์ งามจำรัส	PDT1	NT	Staff	2		2025-11-04 14:42:12.294	2025-11-04 14:42:12.294	2025-11-04 14:42:12.299	\N	\N	\N	Production	\N
1565	gnoevk77v6zqyntdwc5mj56h	66K010	น.ส. สุกัญญา ทิศกระโทก	PDT4	JM	Staff	2		2025-11-04 14:42:12.376	2025-11-04 14:42:12.376	\N	\N	\N	\N	Production	\N
1566	gnoevk77v6zqyntdwc5mj56h	66K010	น.ส. สุกัญญา ทิศกระโทก	PDT4	JM	Staff	2		2025-11-04 14:42:12.376	2025-11-04 14:42:12.376	2025-11-04 14:42:12.381	\N	\N	\N	Production	\N
1569	qxcmgcfi69sw71b3x7hjacs9	66K022	นาย ปรเมธ แดงโสภา	PDT3	GM	Staff	2		2025-11-04 14:42:12.456	2025-11-04 14:42:12.456	\N	\N	\N	\N	Production	\N
1570	qxcmgcfi69sw71b3x7hjacs9	66K022	นาย ปรเมธ แดงโสภา	PDT3	GM	Staff	2		2025-11-04 14:42:12.456	2025-11-04 14:42:12.456	2025-11-04 14:42:12.459	\N	\N	\N	Production	\N
1573	fwrge8as0rpvf7pn27jg35on	66K027	นาย ทรงภพ แสงแก้ว	PCM	ST	Staff	2		2025-11-04 14:42:12.533	2025-11-04 14:42:12.533	\N	\N	\N	\N	Support	\N
1574	fwrge8as0rpvf7pn27jg35on	66K027	นาย ทรงภพ แสงแก้ว	PCM	ST	Staff	2		2025-11-04 14:42:12.533	2025-11-04 14:42:12.533	2025-11-04 14:42:12.537	\N	\N	\N	Support	\N
1577	g4c40xqyxjcpt4jhoab5i2nj	66K031	นาย จิรวัฒน์ ทองประศรี	PDM	FC	Staff	2		2025-11-04 14:42:12.608	2025-11-04 14:42:12.608	\N	\N	\N	\N	Support	\N
1578	g4c40xqyxjcpt4jhoab5i2nj	66K031	นาย จิรวัฒน์ ทองประศรี	PDM	FC	Staff	2		2025-11-04 14:42:12.608	2025-11-04 14:42:12.608	2025-11-04 14:42:12.614	\N	\N	\N	Support	\N
1581	cgkoj7n1icc0zmcmrc8qvkem	66K037	น.ส. สิริญญา อุปัญญ์	QAD	IP	Staff	2		2025-11-04 14:42:12.684	2025-11-04 14:42:12.684	\N	\N	\N	\N	Support	\N
1582	cgkoj7n1icc0zmcmrc8qvkem	66K037	น.ส. สิริญญา อุปัญญ์	QAD	IP	Staff	2		2025-11-04 14:42:12.684	2025-11-04 14:42:12.684	2025-11-04 14:42:12.688	\N	\N	\N	Support	\N
1585	iclq82xeji86b8jzm3tegglm	66K041	น.ส. สุพัฒตรา สายแวว	QAD	QC2	Staff	2		2025-11-04 14:42:12.748	2025-11-04 14:42:12.748	\N	\N	\N	\N	Support	\N
1529	eqtxkm6yyajherx5xmmdyd53	660044	นาย อัษฎาวุฒิ วงศ์ทอง	SAM	TM	Team Manager	2		2025-11-04 14:42:11.638	2025-11-20 14:32:45.696	\N	\N	1	\N	Support	assadawut_w@aoyama.co.th
1507	ptn8ba1pgqsfft1didsuhkbk	660030	นาย สงกรานต์ สายทากุล	PDT2	OQ	Staff	2		2025-11-04 14:42:11.219	2025-11-04 14:42:11.219	\N	\N	\N	\N	Production	\N
1508	ptn8ba1pgqsfft1didsuhkbk	660030	นาย สงกรานต์ สายทากุล	PDT2	OQ	Staff	2		2025-11-04 14:42:11.219	2025-11-04 14:42:11.219	2025-11-04 14:42:11.223	\N	\N	\N	Production	\N
1511	xu6gm73jxowxtdfmq8w2kdon	660032	น.ส. ลัดดาวัลย์ สาระเนตร	PUD	PU1	Staff	2		2025-11-04 14:42:11.301	2025-11-04 14:42:11.301	\N	\N	\N	\N	Non Production	\N
1512	xu6gm73jxowxtdfmq8w2kdon	660032	น.ส. ลัดดาวัลย์ สาระเนตร	PUD	PU1	Staff	2		2025-11-04 14:42:11.301	2025-11-04 14:42:11.301	2025-11-04 14:42:11.306	\N	\N	\N	Non Production	\N
1515	pm25xxh1vhbs9m9fyuv5i28u	660034	น.ส. จุฑารัตน์ พรมรินทร์	ENI	EN	Staff	2		2025-11-04 14:42:11.378	2025-11-04 14:42:11.378	\N	\N	\N	\N	Support	\N
1516	pm25xxh1vhbs9m9fyuv5i28u	660034	น.ส. จุฑารัตน์ พรมรินทร์	ENI	EN	Staff	2		2025-11-04 14:42:11.378	2025-11-04 14:42:11.378	2025-11-04 14:42:11.383	\N	\N	\N	Support	\N
1519	h1ojpgr3fb4aqs6uengs7ayb	660036	นาย นิรัตน์ สวัสดี	PDT3	JC	Staff	2		2025-11-04 14:42:11.457	2025-11-04 14:42:11.457	\N	\N	\N	\N	Production	\N
1520	h1ojpgr3fb4aqs6uengs7ayb	660036	นาย นิรัตน์ สวัสดี	PDT3	JC	Staff	2		2025-11-04 14:42:11.457	2025-11-04 14:42:11.457	2025-11-04 14:42:11.463	\N	\N	\N	Production	\N
1523	e2n3s8ca2viz1enz87zybw83	660038	นาย ธงศักดิ์ ชะวูรัมย์	PDT1	M8	Staff	2		2025-11-04 14:42:11.533	2025-11-04 14:42:11.533	\N	\N	\N	\N	Production	\N
1524	e2n3s8ca2viz1enz87zybw83	660038	นาย ธงศักดิ์ ชะวูรัมย์	PDT1	M8	Staff	2		2025-11-04 14:42:11.533	2025-11-04 14:42:11.533	2025-11-04 14:42:11.54	\N	\N	\N	Production	\N
1527	r66od2a9yk60e9xi765c8elq	660040	นาย ยุทธนา นามวิชา	PDT3	BZ	Staff	2		2025-11-04 14:42:11.614	2025-11-04 14:42:11.614	\N	\N	\N	\N	Production	\N
1528	r66od2a9yk60e9xi765c8elq	660040	นาย ยุทธนา นามวิชา	PDT3	BZ	Staff	2		2025-11-04 14:42:11.614	2025-11-04 14:42:11.614	2025-11-04 14:42:11.618	\N	\N	\N	Production	\N
1531	phrluqyaimemczvp25bdibfg	660046	นาย พีรภัทร พูนทรัพย์	PDT1	M6	Staff	2		2025-11-04 14:42:11.677	2025-11-04 14:42:11.677	\N	\N	\N	\N	Production	\N
1532	phrluqyaimemczvp25bdibfg	660046	นาย พีรภัทร พูนทรัพย์	PDT1	M6	Staff	2		2025-11-04 14:42:11.677	2025-11-04 14:42:11.677	2025-11-04 14:42:11.697	\N	\N	\N	Production	\N
1535	f3dn53oe7gdnzs3ly2ig9m1r	660049	นาย สุรศักดิ์ ศรีสะอาด	PDM	FC	Staff	2		2025-11-04 14:42:11.771	2025-11-04 14:42:11.771	\N	\N	\N	\N	Support	\N
1536	f3dn53oe7gdnzs3ly2ig9m1r	660049	นาย สุรศักดิ์ ศรีสะอาด	PDM	FC	Staff	2		2025-11-04 14:42:11.771	2025-11-04 14:42:11.771	2025-11-04 14:42:11.775	\N	\N	\N	Support	\N
1539	ksxp6qc0x60wdge0l9wbiwod	660052	นาย กิตติศักดิ์ เสมอใจ	PDT1	NT	Staff	2		2025-11-04 14:42:11.851	2025-11-04 14:42:11.851	\N	\N	\N	\N	Production	\N
1540	ksxp6qc0x60wdge0l9wbiwod	660052	นาย กิตติศักดิ์ เสมอใจ	PDT1	NT	Staff	2		2025-11-04 14:42:11.851	2025-11-04 14:42:11.851	2025-11-04 14:42:11.869	\N	\N	\N	Production	\N
1543	ufw6tsubxi20p6uyg6bwr9jp	660054	นาย ปฏินันท์ ขันแก้ว	PCM	CB	Staff	2		2025-11-04 14:42:11.935	2025-11-04 14:42:11.935	\N	\N	\N	\N	Support	\N
1544	ufw6tsubxi20p6uyg6bwr9jp	660054	นาย ปฏินันท์ ขันแก้ว	PCM	CB	Staff	2		2025-11-04 14:42:11.935	2025-11-04 14:42:11.935	2025-11-04 14:42:11.94	\N	\N	\N	Support	\N
1547	phozflopjiw3eclwdnf9yurr	660056	นาย จุฑา วงศ์คำ	PCM	ST	Staff	2		2025-11-04 14:42:12.012	2025-11-04 14:42:12.012	\N	\N	\N	\N	Support	\N
1548	phozflopjiw3eclwdnf9yurr	660056	นาย จุฑา วงศ์คำ	PCM	ST	Staff	2		2025-11-04 14:42:12.012	2025-11-04 14:42:12.012	2025-11-04 14:42:12.017	\N	\N	\N	Support	\N
1551	qlsiq7n503tlzud8971kk9am	660058	นาย ศราวุธ เวชกามา	PDT1	M6	Staff	1		2025-11-04 14:42:12.09	2025-11-04 14:42:12.09	\N	\N	\N	\N	Production	\N
1552	qlsiq7n503tlzud8971kk9am	660058	นาย ศราวุธ เวชกามา	PDT1	M6	Staff	1		2025-11-04 14:42:12.09	2025-11-04 14:42:12.09	2025-11-04 14:42:12.094	\N	\N	\N	Production	\N
1555	nfgrp6f20l9eqbutxwjjxht7	660060	นาย นันทวุฒิ กาญจนพัฒน์	PDT3	GM	Staff	1		2025-11-04 14:42:12.173	2025-11-04 14:42:12.173	\N	\N	\N	\N	Production	\N
1556	nfgrp6f20l9eqbutxwjjxht7	660060	นาย นันทวุฒิ กาญจนพัฒน์	PDT3	GM	Staff	1		2025-11-04 14:42:12.173	2025-11-04 14:42:12.173	2025-11-04 14:42:12.178	\N	\N	\N	Production	\N
1559	p3ketvojzm5b3vsn939o2f2z	66K005	น.ส. ระพีพร แสงมาศ	QAD	QC2	Staff	2		2025-11-04 14:42:12.254	2025-11-04 14:42:12.254	\N	\N	\N	\N	Support	\N
1560	p3ketvojzm5b3vsn939o2f2z	66K005	น.ส. ระพีพร แสงมาศ	QAD	QC2	Staff	2		2025-11-04 14:42:12.254	2025-11-04 14:42:12.254	2025-11-04 14:42:12.259	\N	\N	\N	Support	\N
1563	xpinatyyga03qqcnxlxolwrt	66K008	นาย พัฒนสันต์ ศรีสุวรรณ	PDT1	M6	Staff	2		2025-11-04 14:42:12.333	2025-11-04 14:42:12.333	\N	\N	\N	\N	Production	\N
1564	xpinatyyga03qqcnxlxolwrt	66K008	นาย พัฒนสันต์ ศรีสุวรรณ	PDT1	M6	Staff	2		2025-11-04 14:42:12.333	2025-11-04 14:42:12.333	2025-11-04 14:42:12.337	\N	\N	\N	Production	\N
1567	tkmpn884m2sxblh6b6e9zq3x	66K014	นาย สุริยา สวนงาม	PDT2	OQ	Staff	2		2025-11-04 14:42:12.417	2025-11-04 14:42:12.417	\N	\N	\N	\N	Production	\N
1568	tkmpn884m2sxblh6b6e9zq3x	66K014	นาย สุริยา สวนงาม	PDT2	OQ	Staff	2		2025-11-04 14:42:12.417	2025-11-04 14:42:12.417	2025-11-04 14:42:12.424	\N	\N	\N	Production	\N
1571	kc03cj85lzlmke655fmb3zrk	66K025	นาย ธนพล มูลชาติ	PCM	ST	Staff	2		2025-11-04 14:42:12.479	2025-11-04 14:42:12.479	\N	\N	\N	\N	Support	\N
1572	kc03cj85lzlmke655fmb3zrk	66K025	นาย ธนพล มูลชาติ	PCM	ST	Staff	2		2025-11-04 14:42:12.479	2025-11-04 14:42:12.479	2025-11-04 14:42:12.499	\N	\N	\N	Support	\N
1575	pvfdcvez4zn6ykldk0wflibz	66K028	นาย ศิริพงค์ ไชยคำ	PCM	ST	Staff	2		2025-11-04 14:42:12.569	2025-11-04 14:42:12.569	\N	\N	\N	\N	Support	\N
1576	pvfdcvez4zn6ykldk0wflibz	66K028	นาย ศิริพงค์ ไชยคำ	PCM	ST	Staff	2		2025-11-04 14:42:12.569	2025-11-04 14:42:12.569	2025-11-04 14:42:12.573	\N	\N	\N	Support	\N
1579	wk5nadmm622ls5bew18mfele	66K035	นาย รติพงษ์ สายเพชร	QAD	QC2	Staff	2		2025-11-04 14:42:12.648	2025-11-04 14:42:12.648	\N	\N	\N	\N	Support	\N
1580	wk5nadmm622ls5bew18mfele	66K035	นาย รติพงษ์ สายเพชร	QAD	QC2	Staff	2		2025-11-04 14:42:12.648	2025-11-04 14:42:12.648	2025-11-04 14:42:12.652	\N	\N	\N	Support	\N
1583	dy5twqksn8u1cg9574iuy1kg	66K039	นาย สุรศักดิ์ ปานทอง	PDT3	GM	Staff	2		2025-11-04 14:42:12.707	2025-11-04 14:42:12.707	\N	\N	\N	\N	Production	\N
1584	dy5twqksn8u1cg9574iuy1kg	66K039	นาย สุรศักดิ์ ปานทอง	PDT3	GM	Staff	2		2025-11-04 14:42:12.707	2025-11-04 14:42:12.707	2025-11-04 14:42:12.714	\N	\N	\N	Production	\N
1587	r0wy1jih24509asrvpdkdkng	66K045	น.ส. ประกายกาญจน์ พาจันทร์	QAD	IP	Staff	2		2025-11-04 14:42:12.772	2025-11-04 14:42:12.772	\N	\N	\N	\N	Support	\N
1586	iclq82xeji86b8jzm3tegglm	66K041	น.ส. สุพัฒตรา สายแวว	QAD	QC2	Staff	2		2025-11-04 14:42:12.748	2025-11-04 14:42:12.748	2025-11-04 14:42:12.752	\N	\N	\N	Support	\N
1589	qvkcj7p2dnnyukiplltfkml9	66K047	นาย จักรภพ ผุยศรี	PDM	FC	Staff	2		2025-11-04 14:42:12.809	2025-11-04 14:42:12.809	\N	\N	\N	\N	Support	\N
1590	qvkcj7p2dnnyukiplltfkml9	66K047	นาย จักรภพ ผุยศรี	PDM	FC	Staff	2		2025-11-04 14:42:12.809	2025-11-04 14:42:12.809	2025-11-04 14:42:12.814	\N	\N	\N	Support	\N
1593	lcd3vm0sq007a5g23lhwf2m1	66T005	น.ส. จิรานันท์ พรหมโสภา	QAD	QC2	Staff	2		2025-11-04 14:42:12.887	2025-11-04 14:42:12.887	\N	\N	\N	\N	Support	\N
1594	lcd3vm0sq007a5g23lhwf2m1	66T005	น.ส. จิรานันท์ พรหมโสภา	QAD	QC2	Staff	2		2025-11-04 14:42:12.887	2025-11-04 14:42:12.887	2025-11-04 14:42:12.891	\N	\N	\N	Support	\N
1597	kg42y4fngei734g1vwduqt0n	66T025	นาย ประสพโชค ปักกะสีลัง	PDT1	EG	Staff	2		2025-11-04 14:42:12.946	2025-11-04 14:42:12.946	\N	\N	\N	\N	Production	\N
1598	kg42y4fngei734g1vwduqt0n	66T025	นาย ประสพโชค ปักกะสีลัง	PDT1	EG	Staff	2		2025-11-04 14:42:12.946	2025-11-04 14:42:12.946	2025-11-04 14:42:12.951	\N	\N	\N	Production	\N
1601	x7y93a6uv5wwwzk7j0pq9i0c	66T031	นาย มหัทธน กิจกุศล	PDT4	UB	Staff	2		2025-11-04 14:42:13.025	2025-11-04 14:42:13.025	\N	\N	\N	\N	Production	\N
1602	x7y93a6uv5wwwzk7j0pq9i0c	66T031	นาย มหัทธน กิจกุศล	PDT4	UB	Staff	2		2025-11-04 14:42:13.025	2025-11-04 14:42:13.025	2025-11-04 14:42:13.031	\N	\N	\N	Production	\N
1605	nbkgnjpnsddsbem9uvadwu7k	66T033	นาย สุพจน์ ศรีเพชร	PDT1	EG	Staff	2		2025-11-04 14:42:13.101	2025-11-04 14:42:13.101	\N	\N	\N	\N	Production	\N
1606	nbkgnjpnsddsbem9uvadwu7k	66T033	นาย สุพจน์ ศรีเพชร	PDT1	EG	Staff	2		2025-11-04 14:42:13.101	2025-11-04 14:42:13.101	2025-11-04 14:42:13.104	\N	\N	\N	Production	\N
1609	dd34ulmkldh7fvi3efe03eb9	66T036	นาย ชิดณรงค์ ทวีมาก	PCM	ST	Staff	2		2025-11-04 14:42:13.181	2025-11-04 14:42:13.181	\N	\N	\N	\N	Support	\N
1610	dd34ulmkldh7fvi3efe03eb9	66T036	นาย ชิดณรงค์ ทวีมาก	PCM	ST	Staff	2		2025-11-04 14:42:13.181	2025-11-04 14:42:13.181	2025-11-04 14:42:13.186	\N	\N	\N	Support	\N
1613	uobokj1n6clxrmdvhh27ciez	66T038	นาย อำนาจ สิงห์คำ	PCM	TP	Staff	2		2025-11-04 14:42:13.261	2025-11-04 14:42:13.261	\N	\N	\N	\N	Support	\N
1614	uobokj1n6clxrmdvhh27ciez	66T038	นาย อำนาจ สิงห์คำ	PCM	TP	Staff	2		2025-11-04 14:42:13.261	2025-11-04 14:42:13.261	2025-11-04 14:42:13.265	\N	\N	\N	Support	\N
1617	wlwez1ag7ywgt6azclrl9nh0	66T049	น.ส. ยุวดี ธนคำดี	QAD	QC2	Staff	2		2025-11-04 14:42:13.337	2025-11-04 14:42:13.337	\N	\N	\N	\N	Support	\N
1618	wlwez1ag7ywgt6azclrl9nh0	66T049	น.ส. ยุวดี ธนคำดี	QAD	QC2	Staff	2		2025-11-04 14:42:13.337	2025-11-04 14:42:13.337	2025-11-04 14:42:13.34	\N	\N	\N	Support	\N
1621	ngy30qzz8yct78civn3tj7s0	66T051	นาย กฤษดา ศรีบุญเรือง	PCM	ST	Staff	2		2025-11-04 14:42:13.413	2025-11-04 14:42:13.413	\N	\N	\N	\N	Support	\N
1622	ngy30qzz8yct78civn3tj7s0	66T051	นาย กฤษดา ศรีบุญเรือง	PCM	ST	Staff	2		2025-11-04 14:42:13.413	2025-11-04 14:42:13.413	2025-11-04 14:42:13.417	\N	\N	\N	Support	\N
1625	z4f2s8kiengj04xcqcav4hta	670003	นาย วารสิทธิ์ สีหัวโทน	PDT1	M10	Staff	1		2025-11-04 14:42:13.491	2025-11-04 14:42:13.491	\N	\N	\N	\N	Production	\N
1626	z4f2s8kiengj04xcqcav4hta	670003	นาย วารสิทธิ์ สีหัวโทน	PDT1	M10	Staff	1		2025-11-04 14:42:13.491	2025-11-04 14:42:13.491	2025-11-04 14:42:13.495	\N	\N	\N	Production	\N
1629	pgrlx8xoqvnaoua87fga30z7	670007	นาย เบญจามินทร์ พลายสุวรรณ์	PDT2	OQ	Staff	1		2025-11-04 14:42:13.567	2025-11-04 14:42:13.567	\N	\N	\N	\N	Production	\N
1630	pgrlx8xoqvnaoua87fga30z7	670007	นาย เบญจามินทร์ พลายสุวรรณ์	PDT2	OQ	Staff	1		2025-11-04 14:42:13.567	2025-11-04 14:42:13.567	2025-11-04 14:42:13.572	\N	\N	\N	Production	\N
1633	lznyq0p7uy8plmx22iu8xt7f	670009	นาย เผด็จ ภัยวงค์	PDT3	BZ	Staff	1		2025-11-04 14:42:13.647	2025-11-04 14:42:13.647	\N	\N	\N	\N	Production	\N
1634	lznyq0p7uy8plmx22iu8xt7f	670009	นาย เผด็จ ภัยวงค์	PDT3	BZ	Staff	1		2025-11-04 14:42:13.647	2025-11-04 14:42:13.647	2025-11-04 14:42:13.652	\N	\N	\N	Production	\N
1637	xb5x6rr9e4nvxb4yslrsz1q5	670011	นาย ศักดิ์ชัย พรหมเสนา	PDT1	M10	Staff	1		2025-11-04 14:42:13.726	2025-11-04 14:42:13.726	\N	\N	\N	\N	Production	\N
1638	xb5x6rr9e4nvxb4yslrsz1q5	670011	นาย ศักดิ์ชัย พรหมเสนา	PDT1	M10	Staff	1		2025-11-04 14:42:13.726	2025-11-04 14:42:13.726	2025-11-04 14:42:13.73	\N	\N	\N	Production	\N
1641	ari0unsp98uf7nrjsmsfzjo0	670013	นาย ธีรศักดิ์ เที่ยงศักดิ์	PDT4	JA	Staff	1		2025-11-04 14:42:13.786	2025-11-04 14:42:13.786	\N	\N	\N	\N	Production	\N
1642	ari0unsp98uf7nrjsmsfzjo0	670013	นาย ธีรศักดิ์ เที่ยงศักดิ์	PDT4	JA	Staff	1		2025-11-04 14:42:13.786	2025-11-04 14:42:13.786	2025-11-04 14:42:13.79	\N	\N	\N	Production	\N
1645	qdeniyeqz2axaxnhsk7zi1jn	670015	น.ส. ธมนวรรณ เจริญสิงห์	FNC	AC	Staff	1		2025-11-04 14:42:13.848	2025-11-04 14:42:13.848	\N	\N	\N	\N	Non Production	\N
1646	qdeniyeqz2axaxnhsk7zi1jn	670015	น.ส. ธมนวรรณ เจริญสิงห์	FNC	AC	Staff	1		2025-11-04 14:42:13.848	2025-11-04 14:42:13.848	2025-11-04 14:42:13.852	\N	\N	\N	Non Production	\N
1649	bcilzb75rmqyka1d00zl4tps	670017	นาย ณัฏฐวุฒิ พบเกาะ	HRD	EF	Staff	1		2025-11-04 14:42:13.92	2025-11-04 14:42:13.92	\N	\N	\N	\N	Non Production	\N
1650	bcilzb75rmqyka1d00zl4tps	670017	นาย ณัฏฐวุฒิ พบเกาะ	HRD	EF	Staff	1		2025-11-04 14:42:13.92	2025-11-04 14:42:13.92	2025-11-04 14:42:13.94	\N	\N	\N	Non Production	\N
1653	dovs4hj4vu2mnuip3g6zxpxk	670019	นาย อดิศร หงอกขาว	PDT3	BZ	Staff	1		2025-11-04 14:42:14.012	2025-11-04 14:42:14.012	\N	\N	\N	\N	Production	\N
1654	dovs4hj4vu2mnuip3g6zxpxk	670019	นาย อดิศร หงอกขาว	PDT3	BZ	Staff	1		2025-11-04 14:42:14.012	2025-11-04 14:42:14.012	2025-11-04 14:42:14.017	\N	\N	\N	Production	\N
1657	u8pjrp8cmns1nvimbo1f2i4f	670021	นาย รพิพัฒน์ จันทร์ต๊ะคำ	PDT4	JP	Staff	1		2025-11-04 14:42:14.094	2025-11-04 14:42:14.094	\N	\N	\N	\N	Production	\N
1658	u8pjrp8cmns1nvimbo1f2i4f	670021	นาย รพิพัฒน์ จันทร์ต๊ะคำ	PDT4	JP	Staff	1		2025-11-04 14:42:14.094	2025-11-04 14:42:14.094	2025-11-04 14:42:14.097	\N	\N	\N	Production	\N
1661	fe7d4n7u3710rjpkswmeszfl	670023	นาย ณัชพล ชูจำปา	QAD	QC1	Staff	1		2025-11-04 14:42:14.173	2025-11-04 14:42:14.173	\N	\N	\N	\N	Support	\N
1662	fe7d4n7u3710rjpkswmeszfl	670023	นาย ณัชพล ชูจำปา	QAD	QC1	Staff	1		2025-11-04 14:42:14.173	2025-11-04 14:42:14.173	2025-11-04 14:42:14.176	\N	\N	\N	Support	\N
1665	u1sijpvju0oouyu4sl17g15y	670026	นาย อมเรศ กุลาวงศ์	PDT4	EL	Staff	1		2025-11-04 14:42:14.247	2025-11-04 14:42:14.247	\N	\N	\N	\N	Production	\N
1588	r0wy1jih24509asrvpdkdkng	66K045	น.ส. ประกายกาญจน์ พาจันทร์	QAD	IP	Staff	2		2025-11-04 14:42:12.772	2025-11-04 14:42:12.772	2025-11-04 14:42:12.777	\N	\N	\N	Support	\N
1591	vnayurmkzoraxylih2jrv47q	66K048	นาย ชิษณุพงศ์ ยุงประโคน	PDM	FC	Staff	2		2025-11-04 14:42:12.841	2025-11-04 14:42:12.841	\N	\N	\N	\N	Support	\N
1592	vnayurmkzoraxylih2jrv47q	66K048	นาย ชิษณุพงศ์ ยุงประโคน	PDM	FC	Staff	2		2025-11-04 14:42:12.841	2025-11-04 14:42:12.841	2025-11-04 14:42:12.853	\N	\N	\N	Support	\N
1595	sky5susr8ym4z8qdze2wt36l	66T007	นาย อุดมศักดิ์ อินตา	PCM	ST	Staff	2		2025-11-04 14:42:12.923	2025-11-04 14:42:12.923	\N	\N	\N	\N	Support	\N
1596	sky5susr8ym4z8qdze2wt36l	66T007	นาย อุดมศักดิ์ อินตา	PCM	ST	Staff	2		2025-11-04 14:42:12.923	2025-11-04 14:42:12.923	2025-11-04 14:42:12.927	\N	\N	\N	Support	\N
1599	omuexvdw4bzypt2r7iqg4gt2	66T027	นาย ภูวดล มาตด้วง	PDT2	OQ	Staff	2		2025-11-04 14:42:12.985	2025-11-04 14:42:12.985	\N	\N	\N	\N	Production	\N
1600	omuexvdw4bzypt2r7iqg4gt2	66T027	นาย ภูวดล มาตด้วง	PDT2	OQ	Staff	2		2025-11-04 14:42:12.985	2025-11-04 14:42:12.985	2025-11-04 14:42:12.989	\N	\N	\N	Production	\N
1603	rsumffscjmzpug0oas54yn2f	66T032	นาย วีระ ชัยเสนา	PDT1	M6	Staff	2		2025-11-04 14:42:13.064	2025-11-04 14:42:13.064	\N	\N	\N	\N	Production	\N
1604	rsumffscjmzpug0oas54yn2f	66T032	นาย วีระ ชัยเสนา	PDT1	M6	Staff	2		2025-11-04 14:42:13.064	2025-11-04 14:42:13.064	2025-11-04 14:42:13.068	\N	\N	\N	Production	\N
1607	j8qupmd03235bbnhic0i040q	66T034	นาย ปรีดา ปรีชาพูด	QAD	QC2	Staff	2		2025-11-04 14:42:13.144	2025-11-04 14:42:13.144	\N	\N	\N	\N	Support	\N
1608	j8qupmd03235bbnhic0i040q	66T034	นาย ปรีดา ปรีชาพูด	QAD	QC2	Staff	2		2025-11-04 14:42:13.144	2025-11-04 14:42:13.144	2025-11-04 14:42:13.148	\N	\N	\N	Support	\N
1611	uejfxbjt54x0tv7lutrf11v3	66T037	นาย เกริกเกียรติ วรรณสัมผัด	PCM	Q-GATE	Staff	2		2025-11-04 14:42:13.223	2025-11-04 14:42:13.223	\N	\N	\N	\N	Support	\N
1612	uejfxbjt54x0tv7lutrf11v3	66T037	นาย เกริกเกียรติ วรรณสัมผัด	PCM	Q-GATE	Staff	2		2025-11-04 14:42:13.223	2025-11-04 14:42:13.223	2025-11-04 14:42:13.227	\N	\N	\N	Support	\N
1615	mltdn72clv4sxopc22hkvckf	66T042	นาย อนุพงษ์ ขุนธาตุ	PDT3	GM	Staff	2		2025-11-04 14:42:13.301	2025-11-04 14:42:13.301	\N	\N	\N	\N	Production	\N
1616	mltdn72clv4sxopc22hkvckf	66T042	นาย อนุพงษ์ ขุนธาตุ	PDT3	GM	Staff	2		2025-11-04 14:42:13.301	2025-11-04 14:42:13.301	2025-11-04 14:42:13.306	\N	\N	\N	Production	\N
1619	sodj4yg5pgcat11r5vddxsnb	66T050	น.ส. ณัฏฐณิชา สุทธิธรรม	QAD	QC2	Staff	2		2025-11-04 14:42:13.36	2025-11-04 14:42:13.36	\N	\N	\N	\N	Support	\N
1620	sodj4yg5pgcat11r5vddxsnb	66T050	น.ส. ณัฏฐณิชา สุทธิธรรม	QAD	QC2	Staff	2		2025-11-04 14:42:13.36	2025-11-04 14:42:13.36	2025-11-04 14:42:13.38	\N	\N	\N	Support	\N
1623	furvbjtrav089ts5nzny4qjy	670002	นาย ธนวรรธน์ ขุนทอง	PDT3	GM	Staff	1		2025-11-04 14:42:13.452	2025-11-04 14:42:13.452	\N	\N	\N	\N	Production	\N
1624	furvbjtrav089ts5nzny4qjy	670002	นาย ธนวรรธน์ ขุนทอง	PDT3	GM	Staff	1		2025-11-04 14:42:13.452	2025-11-04 14:42:13.452	2025-11-04 14:42:13.457	\N	\N	\N	Production	\N
1627	n5xuu97vr4iv5gfqq4jqy1ii	670004	นาย บดินทร์ จรรยาศิริ	PDT1	M6	Staff	1		2025-11-04 14:42:13.53	2025-11-04 14:42:13.53	\N	\N	\N	\N	Production	\N
1628	n5xuu97vr4iv5gfqq4jqy1ii	670004	นาย บดินทร์ จรรยาศิริ	PDT1	M6	Staff	1		2025-11-04 14:42:13.53	2025-11-04 14:42:13.53	2025-11-04 14:42:13.534	\N	\N	\N	Production	\N
1631	upfbn81g03rrh06vz5bfvscl	670008	นาย ภานุวัฒน์ มาศวรรณา	PDT1	NT	Staff	1		2025-11-04 14:42:13.609	2025-11-04 14:42:13.609	\N	\N	\N	\N	Production	\N
1632	upfbn81g03rrh06vz5bfvscl	670008	นาย ภานุวัฒน์ มาศวรรณา	PDT1	NT	Staff	1		2025-11-04 14:42:13.609	2025-11-04 14:42:13.609	2025-11-04 14:42:13.613	\N	\N	\N	Production	\N
1635	ade40nnhaiwxqqqlrf7t7e3i	670010	นาย พลวัฒน์ แสงแก้ว	PDT1	M10	Staff	1		2025-11-04 14:42:13.689	2025-11-04 14:42:13.689	\N	\N	\N	\N	Production	\N
1636	ade40nnhaiwxqqqlrf7t7e3i	670010	นาย พลวัฒน์ แสงแก้ว	PDT1	M10	Staff	1		2025-11-04 14:42:13.689	2025-11-04 14:42:13.689	2025-11-04 14:42:13.694	\N	\N	\N	Production	\N
1639	mkmc5tbz4awvdz1ay6w72kz9	670012	น.ส. คณิตา บุดดางาม	PDT1	M8	Staff	1		2025-11-04 14:42:13.748	2025-11-04 14:42:13.748	\N	\N	\N	\N	Production	\N
1640	mkmc5tbz4awvdz1ay6w72kz9	670012	น.ส. คณิตา บุดดางาม	PDT1	M8	Staff	1		2025-11-04 14:42:13.748	2025-11-04 14:42:13.748	2025-11-04 14:42:13.753	\N	\N	\N	Production	\N
1643	z81jffvs8uncvtkj74mlitlx	670014	นาย ศรชัย สุขเพิ่ม	PDT2	OQ	Staff	1		2025-11-04 14:42:13.825	2025-11-04 14:42:13.825	\N	\N	\N	\N	Production	\N
1644	z81jffvs8uncvtkj74mlitlx	670014	นาย ศรชัย สุขเพิ่ม	PDT2	OQ	Staff	1		2025-11-04 14:42:13.825	2025-11-04 14:42:13.825	2025-11-04 14:42:13.829	\N	\N	\N	Production	\N
1647	el3nvqo5yujuor5jc9rq1sug	670016	น.ส. ธนิศร แพงโนนทอง	HRD	EF	Staff	1		2025-11-04 14:42:13.884	2025-11-04 14:42:13.884	\N	\N	\N	\N	Non Production	\N
1648	el3nvqo5yujuor5jc9rq1sug	670016	น.ส. ธนิศร แพงโนนทอง	HRD	EF	Staff	1		2025-11-04 14:42:13.884	2025-11-04 14:42:13.884	2025-11-04 14:42:13.888	\N	\N	\N	Non Production	\N
1651	nc1zgwyfoljlamiical1unw3	670018	นาย ณัฐวิชญ์ สุรรัตน์	QAD	QC1	Staff	1		2025-11-04 14:42:13.974	2025-11-04 14:42:13.974	\N	\N	\N	\N	Support	\N
1652	nc1zgwyfoljlamiical1unw3	670018	นาย ณัฐวิชญ์ สุรรัตน์	QAD	QC1	Staff	1		2025-11-04 14:42:13.974	2025-11-04 14:42:13.974	2025-11-04 14:42:13.979	\N	\N	\N	Support	\N
1655	h4d2fo291t6u9d89gvzp84h0	670020	นาย ธนวัฒน์ แพรงาม	PDT1	M6	Staff	1		2025-11-04 14:42:14.056	2025-11-04 14:42:14.056	\N	\N	\N	\N	Production	\N
1656	h4d2fo291t6u9d89gvzp84h0	670020	นาย ธนวัฒน์ แพรงาม	PDT1	M6	Staff	1		2025-11-04 14:42:14.056	2025-11-04 14:42:14.056	2025-11-04 14:42:14.06	\N	\N	\N	Production	\N
1659	acw5v9fxk2c5qzsoz7epif4j	670022	น.ส. อมรรัตร์ จันทะเกษ	PDT3	WB	Staff	1		2025-11-04 14:42:14.135	2025-11-04 14:42:14.135	\N	\N	\N	\N	Production	\N
1660	acw5v9fxk2c5qzsoz7epif4j	670022	น.ส. อมรรัตร์ จันทะเกษ	PDT3	WB	Staff	1		2025-11-04 14:42:14.135	2025-11-04 14:42:14.135	2025-11-04 14:42:14.139	\N	\N	\N	Production	\N
1663	b4ugmhukdvck055ik89sgtoo	670025	นาย ณัฐนันท์ ธุระทำ	PDT4	EL	Staff	1		2025-11-04 14:42:14.199	2025-11-04 14:42:14.199	\N	\N	\N	\N	Production	\N
1664	b4ugmhukdvck055ik89sgtoo	670025	นาย ณัฐนันท์ ธุระทำ	PDT4	EL	Staff	1		2025-11-04 14:42:14.199	2025-11-04 14:42:14.199	2025-11-04 14:42:14.214	\N	\N	\N	Production	\N
1667	mhgw90lcafiz2ulaownun9iu	670028	นาย ณัฐพล ทองย่อย	PDT1	M10	Staff	1		2025-11-04 14:42:14.285	2025-11-04 14:42:14.285	\N	\N	\N	\N	Production	\N
1666	u1sijpvju0oouyu4sl17g15y	670026	นาย อมเรศ กุลาวงศ์	PDT4	EL	Staff	1		2025-11-04 14:42:14.247	2025-11-04 14:42:14.247	2025-11-04 14:42:14.252	\N	\N	\N	Production	\N
1669	tv3exe6aavnlft0itzetbnv1	670029	น.ส. กวินภรณ์ ไทยเจริญ	MKT	SL	Staff	1		2025-11-04 14:42:14.329	2025-11-04 14:42:14.329	\N	\N	\N	\N	Non Production	\N
1670	tv3exe6aavnlft0itzetbnv1	670029	น.ส. กวินภรณ์ ไทยเจริญ	MKT	SL	Staff	1		2025-11-04 14:42:14.329	2025-11-04 14:42:14.329	2025-11-04 14:42:14.333	\N	\N	\N	Non Production	\N
1673	kgmtb8rbbg11hll1e4mtvu79	670032	นาย นรเศรษฐ์ อุปรัง	PDT4	UB	Staff	1		2025-11-04 14:42:14.406	2025-11-04 14:42:14.406	\N	\N	\N	\N	Production	\N
1674	kgmtb8rbbg11hll1e4mtvu79	670032	นาย นรเศรษฐ์ อุปรัง	PDT4	UB	Staff	1		2025-11-04 14:42:14.406	2025-11-04 14:42:14.406	2025-11-04 14:42:14.411	\N	\N	\N	Production	\N
1677	em3ltycz2rlmg0w1adfqcpoc	670036	น.ส. กนกกร เมยดง	QAD	QC2	Staff	1		2025-11-04 14:42:14.473	2025-11-04 14:42:14.473	\N	\N	\N	\N	Support	\N
1678	em3ltycz2rlmg0w1adfqcpoc	670036	น.ส. กนกกร เมยดง	QAD	QC2	Staff	1		2025-11-04 14:42:14.473	2025-11-04 14:42:14.473	2025-11-04 14:42:14.486	\N	\N	\N	Support	\N
1681	jqynxxrhu2nucythj8w9t2bp	670039	นาย สุจินดา สารภาค	QAD	QC2	Staff	1		2025-11-04 14:42:14.559	2025-11-04 14:42:14.559	\N	\N	\N	\N	Support	\N
1682	jqynxxrhu2nucythj8w9t2bp	670039	นาย สุจินดา สารภาค	QAD	QC2	Staff	1		2025-11-04 14:42:14.559	2025-11-04 14:42:14.559	2025-11-04 14:42:14.563	\N	\N	\N	Support	\N
1685	uyvhh8ukbkjd0f2j3tp69xkj	670042	นาย ธีรภัทร ดาจักร์	PDT4	UB	Staff	1		2025-11-04 14:42:14.62	2025-11-04 14:42:14.62	\N	\N	\N	\N	Production	\N
1686	uyvhh8ukbkjd0f2j3tp69xkj	670042	นาย ธีรภัทร ดาจักร์	PDT4	UB	Staff	1		2025-11-04 14:42:14.62	2025-11-04 14:42:14.62	2025-11-04 14:42:14.624	\N	\N	\N	Production	\N
1689	jngz2qlvr4sja89pk83lk5le	670046	นาย ศุภวิชญ์ สีนาสันต์	PDT4	UB	Staff	1		2025-11-04 14:42:14.683	2025-11-04 14:42:14.683	\N	\N	\N	\N	Production	\N
1690	jngz2qlvr4sja89pk83lk5le	670046	นาย ศุภวิชญ์ สีนาสันต์	PDT4	UB	Staff	1		2025-11-04 14:42:14.683	2025-11-04 14:42:14.683	2025-11-04 14:42:14.687	\N	\N	\N	Production	\N
1693	ffvvqpnfkqo0h9wkropilllm	670048	นาย คงเดช โนรู	HRD	EF	Staff	1		2025-11-04 14:42:14.74	2025-11-04 14:42:14.74	\N	\N	\N	\N	Non Production	\N
1694	ffvvqpnfkqo0h9wkropilllm	670048	นาย คงเดช โนรู	HRD	EF	Staff	1		2025-11-04 14:42:14.74	2025-11-04 14:42:14.74	2025-11-04 14:42:14.746	\N	\N	\N	Non Production	\N
1697	rexli8puk8f003q53v7ysqpn	670054	นาย อิทธิพล มังกร	PCM	ST	Staff	0		2025-11-04 14:42:14.816	2025-11-04 14:42:14.816	\N	\N	\N	\N	Support	\N
1698	rexli8puk8f003q53v7ysqpn	670054	นาย อิทธิพล มังกร	PCM	ST	Staff	0		2025-11-04 14:42:14.816	2025-11-04 14:42:14.816	2025-11-04 14:42:14.821	\N	\N	\N	Support	\N
1701	vbrba5u4kfdyl4zi6osmldhl	67K003	นาย กิตติธัช เสงี่ยมดี	PDT1	M10	Staff	1		2025-11-04 14:42:14.893	2025-11-04 14:42:14.893	\N	\N	\N	\N	Production	\N
1702	vbrba5u4kfdyl4zi6osmldhl	67K003	นาย กิตติธัช เสงี่ยมดี	PDT1	M10	Staff	1		2025-11-04 14:42:14.893	2025-11-04 14:42:14.893	2025-11-04 14:42:14.897	\N	\N	\N	Production	\N
1705	z138kn5mbzgle1v8pt95k5pu	67K005	นาย อนันตชัย วุฒิธรรม	PDT1	M8	Staff	1		2025-11-04 14:42:14.973	2025-11-04 14:42:14.973	\N	\N	\N	\N	Production	\N
1706	z138kn5mbzgle1v8pt95k5pu	67K005	นาย อนันตชัย วุฒิธรรม	PDT1	M8	Staff	1		2025-11-04 14:42:14.973	2025-11-04 14:42:14.973	2025-11-04 14:42:14.982	\N	\N	\N	Production	\N
1709	kcub81h10sqld4nxijmsdus4	67K007	น.ส. ชวนฝัน มาพิบูลย์	PDT3	WB	Staff	1		2025-11-04 14:42:15.05	2025-11-04 14:42:15.05	\N	\N	\N	\N	Production	\N
1710	kcub81h10sqld4nxijmsdus4	67K007	น.ส. ชวนฝัน มาพิบูลย์	PDT3	WB	Staff	1		2025-11-04 14:42:15.05	2025-11-04 14:42:15.05	2025-11-04 14:42:15.053	\N	\N	\N	Production	\N
1713	ax146i62bvhnt3qtfiu1d53b	67K010	นาย ธีรภัทร์ รอดประทับ	ENI	FDM	Staff	1		2025-11-04 14:42:15.111	2025-11-04 14:42:15.111	\N	\N	\N	\N	Support	\N
1714	ax146i62bvhnt3qtfiu1d53b	67K010	นาย ธีรภัทร์ รอดประทับ	ENI	FDM	Staff	1		2025-11-04 14:42:15.111	2025-11-04 14:42:15.111	2025-11-04 14:42:15.115	\N	\N	\N	Support	\N
1717	adbqxx2kj185nizphw1xodvx	67K012	นาย ปฐวี ทองนอก	ENI	FDM	Staff	1		2025-11-04 14:42:15.189	2025-11-04 14:42:15.189	\N	\N	\N	\N	Support	\N
1718	adbqxx2kj185nizphw1xodvx	67K012	นาย ปฐวี ทองนอก	ENI	FDM	Staff	1		2025-11-04 14:42:15.189	2025-11-04 14:42:15.189	2025-11-04 14:42:15.193	\N	\N	\N	Support	\N
1721	mc3ek8wyu2cu3mz129g0d4ft	67K018	นาย ณัฐวุฒิ สมิน	PDT4	UB	Staff	1		2025-11-04 14:42:15.267	2025-11-04 14:42:15.267	\N	\N	\N	\N	Production	\N
1722	mc3ek8wyu2cu3mz129g0d4ft	67K018	นาย ณัฐวุฒิ สมิน	PDT4	UB	Staff	1		2025-11-04 14:42:15.267	2025-11-04 14:42:15.267	2025-11-04 14:42:15.273	\N	\N	\N	Production	\N
1725	smzi2a2x7af2dte5c6h3xe77	67K021	นาย ธนชัย แก้วศรี	PDT1	M10	Staff	1		2025-11-04 14:42:15.347	2025-11-04 14:42:15.347	\N	\N	\N	\N	Production	\N
1726	smzi2a2x7af2dte5c6h3xe77	67K021	นาย ธนชัย แก้วศรี	PDT1	M10	Staff	1		2025-11-04 14:42:15.347	2025-11-04 14:42:15.347	2025-11-04 14:42:15.352	\N	\N	\N	Production	\N
1729	x0qh4atb8m0e4ltqna8qnl77	67T001	น.ส. สุวลี ขันโนนเขวา	QAD	QC2	Staff	1		2025-11-04 14:42:15.431	2025-11-04 14:42:15.431	\N	\N	\N	\N	Support	\N
1730	x0qh4atb8m0e4ltqna8qnl77	67T001	น.ส. สุวลี ขันโนนเขวา	QAD	QC2	Staff	1		2025-11-04 14:42:15.431	2025-11-04 14:42:15.431	2025-11-04 14:42:15.435	\N	\N	\N	Support	\N
1733	s268hheg0zbn036vfou3jxg5	67T006	นาย กฤษณะ มะวัน	PDM	FC	Staff	1		2025-11-04 14:42:15.491	2025-11-04 14:42:15.491	\N	\N	\N	\N	Support	\N
1734	s268hheg0zbn036vfou3jxg5	67T006	นาย กฤษณะ มะวัน	PDM	FC	Staff	1		2025-11-04 14:42:15.491	2025-11-04 14:42:15.491	2025-11-04 14:42:15.496	\N	\N	\N	Support	\N
1737	lg54324gl6io99vuqbptq2su	67T012	นาย มงคล สีจันทร์	PDT1	M8	Staff	1		2025-11-04 14:42:15.571	2025-11-04 14:42:15.571	\N	\N	\N	\N	Production	\N
1738	lg54324gl6io99vuqbptq2su	67T012	นาย มงคล สีจันทร์	PDT1	M8	Staff	1		2025-11-04 14:42:15.571	2025-11-04 14:42:15.571	2025-11-04 14:42:15.575	\N	\N	\N	Production	\N
1741	pqxjh89kixdxy6riwivmw93o	67T016	นาย อนุพันธ์ จันดารักษ์	QAD	QC2	Staff	1		2025-11-04 14:42:15.636	2025-11-04 14:42:15.636	\N	\N	\N	\N	Support	\N
1742	pqxjh89kixdxy6riwivmw93o	67T016	นาย อนุพันธ์ จันดารักษ์	QAD	QC2	Staff	1		2025-11-04 14:42:15.636	2025-11-04 14:42:15.636	2025-11-04 14:42:15.642	\N	\N	\N	Support	\N
1745	eb6j7eyppiezf4b70sapk0vu	67T018	นาย เอราวัตร จันทะคูณ	PDT1	NT	Staff	0		2025-11-04 14:42:15.699	2025-11-04 14:42:15.699	\N	\N	\N	\N	Production	\N
1746	eb6j7eyppiezf4b70sapk0vu	67T018	นาย เอราวัตร จันทะคูณ	PDT1	NT	Staff	0		2025-11-04 14:42:15.699	2025-11-04 14:42:15.699	2025-11-04 14:42:15.706	\N	\N	\N	Production	\N
1668	mhgw90lcafiz2ulaownun9iu	670028	นาย ณัฐพล ทองย่อย	PDT1	M10	Staff	1		2025-11-04 14:42:14.285	2025-11-04 14:42:14.285	2025-11-04 14:42:14.289	\N	\N	\N	Production	\N
1671	iqpw7m5pl3rq8xf5jwwvyg14	670030	นาย ณัฐวัฒน์ โสสุทธิ์	PDT4	EL	Staff	1		2025-11-04 14:42:14.365	2025-11-04 14:42:14.365	\N	\N	\N	\N	Production	\N
1672	iqpw7m5pl3rq8xf5jwwvyg14	670030	นาย ณัฐวัฒน์ โสสุทธิ์	PDT4	EL	Staff	1		2025-11-04 14:42:14.365	2025-11-04 14:42:14.365	2025-11-04 14:42:14.369	\N	\N	\N	Production	\N
1675	t39n5pg6h6b19iyo5vbt45ul	670033	นาย ภูริทัต พรหมรักษา	PDT1	M8	Staff	1		2025-11-04 14:42:14.441	2025-11-04 14:42:14.441	\N	\N	\N	\N	Production	\N
1676	t39n5pg6h6b19iyo5vbt45ul	670033	นาย ภูริทัต พรหมรักษา	PDT1	M8	Staff	1		2025-11-04 14:42:14.441	2025-11-04 14:42:14.441	2025-11-04 14:42:14.445	\N	\N	\N	Production	\N
1679	vp2zvumjj3v85g9yck9b174f	670037	นาย นัทวัฒน์ คำมูล	HRD	HR	Staff	1		2025-11-04 14:42:14.521	2025-11-04 14:42:14.521	\N	\N	\N	\N	Non Production	\N
1680	vp2zvumjj3v85g9yck9b174f	670037	นาย นัทวัฒน์ คำมูล	HRD	HR	Staff	1		2025-11-04 14:42:14.521	2025-11-04 14:42:14.521	2025-11-04 14:42:14.527	\N	\N	\N	Non Production	\N
1683	ehg4q7t9wra7dnaeklastows	670040	นาย สุรพงษ์ ประทุมทอง	PDT4	US	Staff	1		2025-11-04 14:42:14.583	2025-11-04 14:42:14.583	\N	\N	\N	\N	Production	\N
1684	ehg4q7t9wra7dnaeklastows	670040	นาย สุรพงษ์ ประทุมทอง	PDT4	US	Staff	1		2025-11-04 14:42:14.583	2025-11-04 14:42:14.583	2025-11-04 14:42:14.588	\N	\N	\N	Production	\N
1687	ni2w3ra8hjh7qle9m694a7sj	670045	นาย ธีรพัฒน์ พินโย	PDT1	M10	Staff	1		2025-11-04 14:42:14.642	2025-11-04 14:42:14.642	\N	\N	\N	\N	Production	\N
1688	ni2w3ra8hjh7qle9m694a7sj	670045	นาย ธีรพัฒน์ พินโย	PDT1	M10	Staff	1		2025-11-04 14:42:14.642	2025-11-04 14:42:14.642	2025-11-04 14:42:14.648	\N	\N	\N	Production	\N
1691	u66tzfj0weiagjiwvbsh8pah	670047	นาย จารุพงษ์ พรมสุรินทร์	PDM	PC	Staff	1		2025-11-04 14:42:14.719	2025-11-04 14:42:14.719	\N	\N	\N	\N	Support	\N
1692	u66tzfj0weiagjiwvbsh8pah	670047	นาย จารุพงษ์ พรมสุรินทร์	PDM	PC	Staff	1		2025-11-04 14:42:14.719	2025-11-04 14:42:14.719	2025-11-04 14:42:14.723	\N	\N	\N	Support	\N
1695	f9emnpkbccaskznu23igbfwy	670053	นาย ชลธร กีรติวงศ์ประภา	QAD	QC2	Staff	0		2025-11-04 14:42:14.78	2025-11-04 14:42:14.78	\N	\N	\N	\N	Support	\N
1696	f9emnpkbccaskznu23igbfwy	670053	นาย ชลธร กีรติวงศ์ประภา	QAD	QC2	Staff	0		2025-11-04 14:42:14.78	2025-11-04 14:42:14.78	2025-11-04 14:42:14.784	\N	\N	\N	Support	\N
1699	v4qwn44heg1stpl76t68ollq	670055	นาย ประไพร สีลาน	PCM	ST	Staff	0		2025-11-04 14:42:14.856	2025-11-04 14:42:14.856	\N	\N	\N	\N	Support	\N
1700	v4qwn44heg1stpl76t68ollq	670055	นาย ประไพร สีลาน	PCM	ST	Staff	0		2025-11-04 14:42:14.856	2025-11-04 14:42:14.856	2025-11-04 14:42:14.86	\N	\N	\N	Support	\N
1703	c011ytu9xjn13j8k3bowgdp9	67K004	นาย เอกรินทร์ ทองคำ	PDT1	NT	Staff	1		2025-11-04 14:42:14.932	2025-11-04 14:42:14.932	\N	\N	\N	\N	Production	\N
1704	c011ytu9xjn13j8k3bowgdp9	67K004	นาย เอกรินทร์ ทองคำ	PDT1	NT	Staff	1		2025-11-04 14:42:14.932	2025-11-04 14:42:14.932	2025-11-04 14:42:14.937	\N	\N	\N	Production	\N
1707	uktzoq9cnrby4tip2p4w8hp4	67K006	น.ส. ลินดา นาบำรุง	PDT3	WB	Staff	1		2025-11-04 14:42:15.011	2025-11-04 14:42:15.011	\N	\N	\N	\N	Production	\N
1708	uktzoq9cnrby4tip2p4w8hp4	67K006	น.ส. ลินดา นาบำรุง	PDT3	WB	Staff	1		2025-11-04 14:42:15.011	2025-11-04 14:42:15.011	2025-11-04 14:42:15.016	\N	\N	\N	Production	\N
1711	bimreewrzg408su4j8kjg1ss	67K008	นาย ทวีโชค แก้วพิลา	PDT3	JC	Staff	1		2025-11-04 14:42:15.087	2025-11-04 14:42:15.087	\N	\N	\N	\N	Production	\N
1712	bimreewrzg408su4j8kjg1ss	67K008	นาย ทวีโชค แก้วพิลา	PDT3	JC	Staff	1		2025-11-04 14:42:15.087	2025-11-04 14:42:15.087	2025-11-04 14:42:15.091	\N	\N	\N	Production	\N
1715	vi1a6rkdw432trbvsd6acwu7	67K011	น.ส. มณีรัตน์ ผกาศรี	PDT1	NT	Staff	1		2025-11-04 14:42:15.149	2025-11-04 14:42:15.149	\N	\N	\N	\N	Production	\N
1716	vi1a6rkdw432trbvsd6acwu7	67K011	น.ส. มณีรัตน์ ผกาศรี	PDT1	NT	Staff	1		2025-11-04 14:42:15.149	2025-11-04 14:42:15.149	2025-11-04 14:42:15.153	\N	\N	\N	Production	\N
1719	vf548zpkr7wrwqmvdm9yz97x	67K017	น.ส. สุวรรณี น่าบำรุงไทย	PDT4	UB	Staff	1		2025-11-04 14:42:15.227	2025-11-04 14:42:15.227	\N	\N	\N	\N	Production	\N
1720	vf548zpkr7wrwqmvdm9yz97x	67K017	น.ส. สุวรรณี น่าบำรุงไทย	PDT4	UB	Staff	1		2025-11-04 14:42:15.227	2025-11-04 14:42:15.227	2025-11-04 14:42:15.231	\N	\N	\N	Production	\N
1723	r2miw9z6zt7xt0jw36lsz8ce	67K020	นาย ปิยะพงษ์ แสนศรี	PDT1	NT	Staff	1		2025-11-04 14:42:15.31	2025-11-04 14:42:15.31	\N	\N	\N	\N	Production	\N
1724	r2miw9z6zt7xt0jw36lsz8ce	67K020	นาย ปิยะพงษ์ แสนศรี	PDT1	NT	Staff	1		2025-11-04 14:42:15.31	2025-11-04 14:42:15.31	2025-11-04 14:42:15.317	\N	\N	\N	Production	\N
1727	jpboc3qfop13ckri4ugw7e59	67K022	นาย นครินทร์ พละเดช	PDT3	JC	Staff	1		2025-11-04 14:42:15.394	2025-11-04 14:42:15.394	\N	\N	\N	\N	Production	\N
1728	jpboc3qfop13ckri4ugw7e59	67K022	นาย นครินทร์ พละเดช	PDT3	JC	Staff	1		2025-11-04 14:42:15.394	2025-11-04 14:42:15.394	2025-11-04 14:42:15.413	\N	\N	\N	Production	\N
1731	z4uaiyeaon5c5c6iez8lucxd	67T005	นาย เจตรินทร์ กันหาชาติ	PDM	FC	Staff	1		2025-11-04 14:42:15.453	2025-11-04 14:42:15.453	\N	\N	\N	\N	Support	\N
1732	z4uaiyeaon5c5c6iez8lucxd	67T005	นาย เจตรินทร์ กันหาชาติ	PDM	FC	Staff	1		2025-11-04 14:42:15.453	2025-11-04 14:42:15.453	2025-11-04 14:42:15.457	\N	\N	\N	Support	\N
1735	l29fpizwa72t167z9ixen124	67T011	นาย ปฏิภาณ ดวงแก้ว	PDT4	UB	Staff	1		2025-11-04 14:42:15.53	2025-11-04 14:42:15.53	\N	\N	\N	\N	Production	\N
1736	l29fpizwa72t167z9ixen124	67T011	นาย ปฏิภาณ ดวงแก้ว	PDT4	UB	Staff	1		2025-11-04 14:42:15.53	2025-11-04 14:42:15.53	2025-11-04 14:42:15.536	\N	\N	\N	Production	\N
1739	xhua2zjv3sx4bti5c4e7r06h	67T014	นาย กิตินันท์ นารินทร์	PDT1	NT	Staff	1		2025-11-04 14:42:15.597	2025-11-04 14:42:15.597	\N	\N	\N	\N	Production	\N
1740	xhua2zjv3sx4bti5c4e7r06h	67T014	นาย กิตินันท์ นารินทร์	PDT1	NT	Staff	1		2025-11-04 14:42:15.597	2025-11-04 14:42:15.597	2025-11-04 14:42:15.601	\N	\N	\N	Production	\N
1743	r5hbz0pzw79czg8t2cioafys	67T017	นาย โชติธนา คุณแสน	QAD	QC2	Staff	1		2025-11-04 14:42:15.676	2025-11-04 14:42:15.676	\N	\N	\N	\N	Support	\N
1744	r5hbz0pzw79czg8t2cioafys	67T017	นาย โชติธนา คุณแสน	QAD	QC2	Staff	1		2025-11-04 14:42:15.676	2025-11-04 14:42:15.676	2025-11-04 14:42:15.68	\N	\N	\N	Support	\N
1747	bwh95kfnhsmkvoy8vci2411j	67T019	นาย ศักดินนท์ ไพคำนาม	PDT3	BZ	Staff	0		2025-11-04 14:42:15.741	2025-11-04 14:42:15.741	\N	\N	\N	\N	Production	\N
1748	bwh95kfnhsmkvoy8vci2411j	67T019	นาย ศักดินนท์ ไพคำนาม	PDT3	BZ	Staff	0		2025-11-04 14:42:15.741	2025-11-04 14:42:15.741	2025-11-04 14:42:15.746	\N	\N	\N	Production	\N
1751	ggrg0maatydho37hd3owlka8	67T021	นาย ชวลิต ทีฆายุภักดิ์	QAD	QC2	Staff	0		2025-11-04 14:42:15.82	2025-11-04 14:42:15.82	\N	\N	\N	\N	Support	\N
1752	ggrg0maatydho37hd3owlka8	67T021	นาย ชวลิต ทีฆายุภักดิ์	QAD	QC2	Staff	0		2025-11-04 14:42:15.82	2025-11-04 14:42:15.82	2025-11-04 14:42:15.824	\N	\N	\N	Support	\N
1755	rpmcs6wlsbuqd7w2vgh3zo1k	680003	นาย ไพรวัลย์ ชัยบุตร	PCM	Q-GATE	Staff	0		2025-11-04 14:42:15.904	2025-11-04 14:42:15.904	\N	\N	\N	\N	Support	\N
1756	rpmcs6wlsbuqd7w2vgh3zo1k	680003	นาย ไพรวัลย์ ชัยบุตร	PCM	Q-GATE	Staff	0		2025-11-04 14:42:15.904	2025-11-04 14:42:15.904	2025-11-04 14:42:15.923	\N	\N	\N	Support	\N
1759	lj6744gbnazhxkcp6lwngsx6	680005	น.ส. ธัญญารัตน์ เกิดโสม	QAD	QC2	Staff	0		2025-11-04 14:42:15.965	2025-11-04 14:42:15.965	\N	\N	\N	\N	Support	\N
1760	lj6744gbnazhxkcp6lwngsx6	680005	น.ส. ธัญญารัตน์ เกิดโสม	QAD	QC2	Staff	0		2025-11-04 14:42:15.965	2025-11-04 14:42:15.965	2025-11-04 14:42:15.969	\N	\N	\N	Support	\N
1763	wocz7cq6v8qfc8kgi5rcej9o	680007	นาย กมล แสนมนตรี	PDT3	BZ	Staff	0		2025-11-04 14:42:16.043	2025-11-04 14:42:16.043	\N	\N	\N	\N	Production	\N
1764	wocz7cq6v8qfc8kgi5rcej9o	680007	นาย กมล แสนมนตรี	PDT3	BZ	Staff	0		2025-11-04 14:42:16.043	2025-11-04 14:42:16.043	2025-11-04 14:42:16.047	\N	\N	\N	Production	\N
1767	vqoxuuqh3k9biscio6xbnt9l	680009	นาย ณัฐวุฒิ มีภักดี	PDT1	M8	Staff	0		2025-11-04 14:42:16.105	2025-11-04 14:42:16.105	\N	\N	\N	\N	Production	\N
1768	vqoxuuqh3k9biscio6xbnt9l	680009	นาย ณัฐวุฒิ มีภักดี	PDT1	M8	Staff	0		2025-11-04 14:42:16.105	2025-11-04 14:42:16.105	2025-11-04 14:42:16.111	\N	\N	\N	Production	\N
1771	n7qvbcbjr4htlbqp6prno2kx	680011	นาย วรวุฒิ คำหาญ	PDT3	BZ	Staff	0		2025-11-04 14:42:16.202	2025-11-04 14:42:16.202	\N	\N	\N	\N	Production	\N
1772	n7qvbcbjr4htlbqp6prno2kx	680011	นาย วรวุฒิ คำหาญ	PDT3	BZ	Staff	0		2025-11-04 14:42:16.202	2025-11-04 14:42:16.202	2025-11-04 14:42:16.206	\N	\N	\N	Production	\N
1775	gz5ysy2t429m2qlo01upwy56	680014	นาย ณัฐวุฒิ แคว้นคอนฉิม	PCM	TP	Staff	0		2025-11-04 14:42:16.281	2025-11-04 14:42:16.281	\N	\N	\N	\N	Support	\N
1776	gz5ysy2t429m2qlo01upwy56	680014	นาย ณัฐวุฒิ แคว้นคอนฉิม	PCM	TP	Staff	0		2025-11-04 14:42:16.281	2025-11-04 14:42:16.281	2025-11-04 14:42:16.285	\N	\N	\N	Support	\N
1779	ma4dcjg6uucoc9kix229iqas	680016	นาย เศรษฐพงษ์ สุขขี	HRD	SC	Staff	0		2025-11-04 14:42:16.356	2025-11-04 14:42:16.356	\N	\N	\N	\N	Non Production	\N
1780	ma4dcjg6uucoc9kix229iqas	680016	นาย เศรษฐพงษ์ สุขขี	HRD	SC	Staff	0		2025-11-04 14:42:16.356	2025-11-04 14:42:16.356	2025-11-04 14:42:16.361	\N	\N	\N	Non Production	\N
1783	gavpyok0o5v7it3fw6vs5lhy	680018	นาย เลิศชาย ติยะบุตร	PDM	IT	Staff	0		2025-11-04 14:42:16.434	2025-11-04 14:42:16.434	\N	\N	\N	\N	Support	\N
1784	gavpyok0o5v7it3fw6vs5lhy	680018	นาย เลิศชาย ติยะบุตร	PDM	IT	Staff	0		2025-11-04 14:42:16.434	2025-11-04 14:42:16.434	2025-11-04 14:42:16.44	\N	\N	\N	Support	\N
1787	uupot4vnw7l22vccytg584l6	680021	นาย สุธิชัย คำจันทร์ลา	PDT4	JM	Leader	0		2025-11-04 14:42:16.517	2025-11-04 14:42:16.517	\N	\N	\N	\N	Production	\N
1788	uupot4vnw7l22vccytg584l6	680021	นาย สุธิชัย คำจันทร์ลา	PDT4	JM	Leader	0		2025-11-04 14:42:16.517	2025-11-04 14:42:16.517	2025-11-04 14:42:16.521	\N	\N	\N	Production	\N
1791	mh9o20y1l6dyvt58jakfpy3s	680023	นาย มนัสชา หมื่นเดช	PDT3	GM	Staff	0		2025-11-04 14:42:16.587	2025-11-04 14:42:16.587	\N	\N	\N	\N	Production	\N
1792	mh9o20y1l6dyvt58jakfpy3s	680023	นาย มนัสชา หมื่นเดช	PDT3	GM	Staff	0		2025-11-04 14:42:16.587	2025-11-04 14:42:16.587	2025-11-04 14:42:16.6	\N	\N	\N	Production	\N
1795	fq9hao2704njodijl5dgfsbm	680025	นาย ชิตพล เพื่อนรัมย์	PDT4	UB	Staff	0		2025-11-04 14:42:16.674	2025-11-04 14:42:16.674	\N	\N	\N	\N	Production	\N
1796	fq9hao2704njodijl5dgfsbm	680025	นาย ชิตพล เพื่อนรัมย์	PDT4	UB	Staff	0		2025-11-04 14:42:16.674	2025-11-04 14:42:16.674	2025-11-04 14:42:16.678	\N	\N	\N	Production	\N
1799	kc3fz94ww44f53jogfoehyhl	680028	น.ส. ชลนิภา สีสวย	QAD	QC2	Staff	0		2025-11-04 14:42:16.746	2025-11-04 14:42:16.746	\N	\N	\N	\N	Support	\N
1800	kc3fz94ww44f53jogfoehyhl	680028	น.ส. ชลนิภา สีสวย	QAD	QC2	Staff	0		2025-11-04 14:42:16.746	2025-11-04 14:42:16.746	2025-11-04 14:42:16.751	\N	\N	\N	Support	\N
1803	ymhodxh7gvvn5bhbbon9cclb	680030	นาย สมพร เสียงเพราะ	PDT1	M10	Staff	0		2025-11-04 14:42:16.811	2025-11-04 14:42:16.811	\N	\N	\N	\N	Production	\N
1804	ymhodxh7gvvn5bhbbon9cclb	680030	นาย สมพร เสียงเพราะ	PDT1	M10	Staff	0		2025-11-04 14:42:16.811	2025-11-04 14:42:16.811	2025-11-04 14:42:16.824	\N	\N	\N	Production	\N
1807	oufkgbdo2jiv8v4zhutn3akv	680032	นาย อนุชิต สุวะมาตย์	PDT1	M8	Staff	0		2025-11-04 14:42:16.896	2025-11-04 14:42:16.896	\N	\N	\N	\N	Production	\N
1808	oufkgbdo2jiv8v4zhutn3akv	680032	นาย อนุชิต สุวะมาตย์	PDT1	M8	Staff	0		2025-11-04 14:42:16.896	2025-11-04 14:42:16.896	2025-11-04 14:42:16.9	\N	\N	\N	Production	\N
1811	uw7frpe120j8kd6aws4nn60t	680034	น.ส. กนิษฐา กระสังข์	FNC	AC	Staff	0		2025-11-04 14:42:16.971	2025-11-04 14:42:16.971	\N	\N	\N	\N	Non Production	\N
1812	uw7frpe120j8kd6aws4nn60t	680034	น.ส. กนิษฐา กระสังข์	FNC	AC	Staff	0		2025-11-04 14:42:16.971	2025-11-04 14:42:16.971	2025-11-04 14:42:16.976	\N	\N	\N	Non Production	\N
1815	g98wcpmaon9zk6t1w6yg08oa	680036	น.ส. สุภาภรณ์ จารุวัน	QAD	QC2	Staff	0		2025-11-04 14:42:17.047	2025-11-04 14:42:17.047	\N	\N	\N	\N	Support	\N
1816	g98wcpmaon9zk6t1w6yg08oa	680036	น.ส. สุภาภรณ์ จารุวัน	QAD	QC2	Staff	0		2025-11-04 14:42:17.047	2025-11-04 14:42:17.047	2025-11-04 14:42:17.051	\N	\N	\N	Support	\N
1819	hbgf9jw2rk2urn2e7tz8hqpa	680038	นาย อนุสิทธิ์ โยธี	MKT	SL	Staff	0		2025-11-04 14:42:17.12	2025-11-04 14:42:17.12	\N	\N	\N	\N	Non Production	\N
1820	hbgf9jw2rk2urn2e7tz8hqpa	680038	นาย อนุสิทธิ์ โยธี	MKT	SL	Staff	0		2025-11-04 14:42:17.12	2025-11-04 14:42:17.12	2025-11-04 14:42:17.124	\N	\N	\N	Non Production	\N
1823	mkdjtwc8v7crzfeue187zi1d	680040	นาย ศักรินทร์ จันทร์วันรักษ์	PDT4	EL	Staff	0		2025-11-04 14:42:17.179	2025-11-04 14:42:17.179	\N	\N	\N	\N	Production	\N
1824	mkdjtwc8v7crzfeue187zi1d	680040	นาย ศักรินทร์ จันทร์วันรักษ์	PDT4	EL	Staff	0		2025-11-04 14:42:17.179	2025-11-04 14:42:17.179	2025-11-04 14:42:17.184	\N	\N	\N	Production	\N
1827	z49w6x5p8r55nkau6ucywtb9	680042	นาย วสุโชค ใจน้ำ	PDM	IT	Staff	0		2025-11-04 14:42:17.245	2025-11-04 14:42:17.245	\N	\N	\N	\N	Support	\N
1828	z49w6x5p8r55nkau6ucywtb9	680042	นาย วสุโชค ใจน้ำ	PDM	IT	Staff	0		2025-11-04 14:42:17.245	2025-11-04 14:42:17.245	2025-11-04 14:42:17.258	\N	\N	\N	Support	\N
1749	aglikxg2walgwhz5cityb6on	67T020	นาย ธนันชัย โชติรัตน์	PDT4	US	Staff	0		2025-11-04 14:42:15.779	2025-11-04 14:42:15.779	\N	\N	\N	\N	Production	\N
1750	aglikxg2walgwhz5cityb6on	67T020	นาย ธนันชัย โชติรัตน์	PDT4	US	Staff	0		2025-11-04 14:42:15.779	2025-11-04 14:42:15.779	2025-11-04 14:42:15.785	\N	\N	\N	Production	\N
1753	ba3z24ebiy9qqq8d54gf6uwz	680002	นาย อรุณทิพย์ ธงสิน	QAD	QC2	Staff	0		2025-11-04 14:42:15.859	2025-11-04 14:42:15.859	\N	\N	\N	\N	Support	\N
1754	ba3z24ebiy9qqq8d54gf6uwz	680002	นาย อรุณทิพย์ ธงสิน	QAD	QC2	Staff	0		2025-11-04 14:42:15.859	2025-11-04 14:42:15.859	2025-11-04 14:42:15.864	\N	\N	\N	Support	\N
1757	tfth1flkkdm6vckx4mzh9uag	680004	นาย ทศพล บรรลุ	PDM	FC	Staff	0		2025-11-04 14:42:15.941	2025-11-04 14:42:15.941	\N	\N	\N	\N	Support	\N
1758	tfth1flkkdm6vckx4mzh9uag	680004	นาย ทศพล บรรลุ	PDM	FC	Staff	0		2025-11-04 14:42:15.941	2025-11-04 14:42:15.941	2025-11-04 14:42:15.945	\N	\N	\N	Support	\N
1761	ynj9euug1fo5ljevxarlovni	680006	น.ส. วัชรี มิ่งสมร	QAD	QC1	Staff	0		2025-11-04 14:42:16.001	2025-11-04 14:42:16.001	\N	\N	\N	\N	Support	\N
1762	ynj9euug1fo5ljevxarlovni	680006	น.ส. วัชรี มิ่งสมร	QAD	QC1	Staff	0		2025-11-04 14:42:16.001	2025-11-04 14:42:16.001	2025-11-04 14:42:16.007	\N	\N	\N	Support	\N
1765	cw5623kmd9c6jqeyvbvvkbfl	680008	นาย วุฒิชัย ธรรมงาม	HRD	HR	Staff	0		2025-11-04 14:42:16.08	2025-11-04 14:42:16.08	\N	\N	\N	\N	Non Production	\N
1766	cw5623kmd9c6jqeyvbvvkbfl	680008	นาย วุฒิชัย ธรรมงาม	HRD	HR	Staff	0		2025-11-04 14:42:16.08	2025-11-04 14:42:16.08	2025-11-04 14:42:16.084	\N	\N	\N	Non Production	\N
1769	wzhiev1izecsoz6kzr2yyx7d	680010	นาย ธวัชชัย ศิริวงษ์	PDT1	M6	Staff	0		2025-11-04 14:42:16.152	2025-11-04 14:42:16.152	\N	\N	\N	\N	Production	\N
1770	wzhiev1izecsoz6kzr2yyx7d	680010	นาย ธวัชชัย ศิริวงษ์	PDT1	M6	Staff	0		2025-11-04 14:42:16.152	2025-11-04 14:42:16.152	2025-11-04 14:42:16.167	\N	\N	\N	Production	\N
1773	f9x57k5dowr2mixyeel8rw55	680013	นาย กัมพล เจียมรัมย์	PCM	Q-GATE	Staff	0		2025-11-04 14:42:16.24	2025-11-04 14:42:16.24	\N	\N	\N	\N	Support	\N
1774	f9x57k5dowr2mixyeel8rw55	680013	นาย กัมพล เจียมรัมย์	PCM	Q-GATE	Staff	0		2025-11-04 14:42:16.24	2025-11-04 14:42:16.24	2025-11-04 14:42:16.245	\N	\N	\N	Support	\N
1777	aimhfs3ojycevyqey8je23qg	680015	นาย นิตุพงษ์ เสอี่ยมอาด	PDT4	JM	Staff	0		2025-11-04 14:42:16.315	2025-11-04 14:42:16.315	\N	\N	\N	\N	Production	\N
1778	aimhfs3ojycevyqey8je23qg	680015	นาย นิตุพงษ์ เสอี่ยมอาด	PDT4	JM	Staff	0		2025-11-04 14:42:16.315	2025-11-04 14:42:16.315	2025-11-04 14:42:16.321	\N	\N	\N	Production	\N
1781	qys6c0pa65ekzhizglgtnuyp	680017	นาย กฤษณพันธ์ บุญกัณฑ์	QAD	QA	Staff	0		2025-11-04 14:42:16.397	2025-11-04 14:42:16.397	\N	\N	\N	\N	Support	\N
1782	qys6c0pa65ekzhizglgtnuyp	680017	นาย กฤษณพันธ์ บุญกัณฑ์	QAD	QA	Staff	0		2025-11-04 14:42:16.397	2025-11-04 14:42:16.397	2025-11-04 14:42:16.401	\N	\N	\N	Support	\N
1785	mzkoq0sq3w6wz67fv50gwdv5	680020	นาย นพพล พรมเทพ	PCM	ST	Staff	0		2025-11-04 14:42:16.476	2025-11-04 14:42:16.476	\N	\N	\N	\N	Support	\N
1786	mzkoq0sq3w6wz67fv50gwdv5	680020	นาย นพพล พรมเทพ	PCM	ST	Staff	0		2025-11-04 14:42:16.476	2025-11-04 14:42:16.476	2025-11-04 14:42:16.48	\N	\N	\N	Support	\N
1789	khfi3em6zvdlo60u7wn2y963	680022	น.ส. พรธิดา สิงห์ทอง	HRD	EF	Staff	0		2025-11-04 14:42:16.541	2025-11-04 14:42:16.541	\N	\N	\N	\N	Non Production	\N
1790	khfi3em6zvdlo60u7wn2y963	680022	น.ส. พรธิดา สิงห์ทอง	HRD	EF	Staff	0		2025-11-04 14:42:16.541	2025-11-04 14:42:16.541	2025-11-04 14:42:16.545	\N	\N	\N	Non Production	\N
1793	p6swo20dqy7niu59m6l2u7sl	680024	นาย ณัฐวุฒิ เหมืองหม้อ	PDT1	M10	Staff	0		2025-11-04 14:42:16.635	2025-11-04 14:42:16.635	\N	\N	\N	\N	Production	\N
1794	p6swo20dqy7niu59m6l2u7sl	680024	นาย ณัฐวุฒิ เหมืองหม้อ	PDT1	M10	Staff	0		2025-11-04 14:42:16.635	2025-11-04 14:42:16.635	2025-11-04 14:42:16.639	\N	\N	\N	Production	\N
1797	uo55mguwsrz5zmnnvbf9cv71	680026	นาย จิรวัฒน์ ทาศิริ	PDT4	UB	Staff	0		2025-11-04 14:42:16.7	2025-11-04 14:42:16.7	\N	\N	\N	\N	Production	\N
1798	uo55mguwsrz5zmnnvbf9cv71	680026	นาย จิรวัฒน์ ทาศิริ	PDT4	UB	Staff	0		2025-11-04 14:42:16.7	2025-11-04 14:42:16.7	2025-11-04 14:42:16.707	\N	\N	\N	Production	\N
1801	g1o598pfge4j26ov7gozl0li	680029	นาย จักรกฤษณ์ บุตรงาม	PDT1	M10	Staff	0		2025-11-04 14:42:16.783	2025-11-04 14:42:16.783	\N	\N	\N	\N	Production	\N
1802	g1o598pfge4j26ov7gozl0li	680029	นาย จักรกฤษณ์ บุตรงาม	PDT1	M10	Staff	0		2025-11-04 14:42:16.783	2025-11-04 14:42:16.783	2025-11-04 14:42:16.787	\N	\N	\N	Production	\N
1805	vjaix16uld7p82zrqe4d5d06	680031	นาย เกียรติศักดิ์ พร้อมวงค์	PDT1	M10	Staff	0		2025-11-04 14:42:16.858	2025-11-04 14:42:16.858	\N	\N	\N	\N	Production	\N
1806	vjaix16uld7p82zrqe4d5d06	680031	นาย เกียรติศักดิ์ พร้อมวงค์	PDT1	M10	Staff	0		2025-11-04 14:42:16.858	2025-11-04 14:42:16.858	2025-11-04 14:42:16.863	\N	\N	\N	Production	\N
1809	nqrviokvfmq2xbhvcut3dnq7	680033	น.ส. สุกัลยา ยอดไธสง	FNC	AC	Staff	0		2025-11-04 14:42:16.934	2025-11-04 14:42:16.934	\N	\N	\N	\N	Non Production	\N
1810	nqrviokvfmq2xbhvcut3dnq7	680033	น.ส. สุกัลยา ยอดไธสง	FNC	AC	Staff	0		2025-11-04 14:42:16.934	2025-11-04 14:42:16.934	2025-11-04 14:42:16.939	\N	\N	\N	Non Production	\N
1813	t284go2p24in1r40avz0810b	680035	นาง ภัสสร ชาลีอัน	QAD	QC2	Staff	0		2025-11-04 14:42:17.007	2025-11-04 14:42:17.007	\N	\N	\N	\N	Support	\N
1814	t284go2p24in1r40avz0810b	680035	นาง ภัสสร ชาลีอัน	QAD	QC2	Staff	0		2025-11-04 14:42:17.007	2025-11-04 14:42:17.007	2025-11-04 14:42:17.011	\N	\N	\N	Support	\N
1817	zba9y05wlaripjpr8cqhuhd5	680037	นาย เอกสิทธิ์ ทองเหลือง	PDT1	M6	Staff	0		2025-11-04 14:42:17.083	2025-11-04 14:42:17.083	\N	\N	\N	\N	Production	\N
1818	zba9y05wlaripjpr8cqhuhd5	680037	นาย เอกสิทธิ์ ทองเหลือง	PDT1	M6	Staff	0		2025-11-04 14:42:17.083	2025-11-04 14:42:17.083	2025-11-04 14:42:17.089	\N	\N	\N	Production	\N
1821	zv3szlbbdjpzfzt7e8qpnmeh	680039	นาย วรปรัชญ์ เจริญพงษ์	ENI	EN	Staff	0		2025-11-04 14:42:17.142	2025-11-04 14:42:17.142	\N	\N	\N	\N	Support	\N
1822	zv3szlbbdjpzfzt7e8qpnmeh	680039	นาย วรปรัชญ์ เจริญพงษ์	ENI	EN	Staff	0		2025-11-04 14:42:17.142	2025-11-04 14:42:17.142	2025-11-04 14:42:17.146	\N	\N	\N	Support	\N
1825	blkdzxp9j1u9kcv914982vs2	680041	นาย ไพโรจน์ เนียมหอม	QAD	QC1	Staff	0		2025-11-04 14:42:17.215	2025-11-04 14:42:17.215	\N	\N	\N	\N	Support	\N
1826	blkdzxp9j1u9kcv914982vs2	680041	นาย ไพโรจน์ เนียมหอม	QAD	QC1	Staff	0		2025-11-04 14:42:17.215	2025-11-04 14:42:17.215	2025-11-04 14:42:17.218	\N	\N	\N	Support	\N
1829	ubzqul1rmleorpjskvj45739	68K001	น.ส. นภัสนันท์ สุขกำปัง	QAD	QC2	Staff	0		2025-11-04 14:42:17.292	2025-11-04 14:42:17.292	\N	\N	\N	\N	Support	\N
1830	ubzqul1rmleorpjskvj45739	68K001	น.ส. นภัสนันท์ สุขกำปัง	QAD	QC2	Staff	0		2025-11-04 14:42:17.292	2025-11-04 14:42:17.292	2025-11-04 14:42:17.297	\N	\N	\N	Support	\N
1833	dhbhzdpmbw2x0bt87oymv88v	68K003	น.ส. วิภาดา บุญชู	QAD	QC2	Staff	0		2025-11-04 14:42:17.348	2025-11-04 14:42:17.348	\N	\N	\N	\N	Support	\N
1834	dhbhzdpmbw2x0bt87oymv88v	68K003	น.ส. วิภาดา บุญชู	QAD	QC2	Staff	0		2025-11-04 14:42:17.348	2025-11-04 14:42:17.348	2025-11-04 14:42:17.353	\N	\N	\N	Support	\N
1837	gr5x6ksxi2pgkv3903i6sodn	68K005	น.ส. วงเดือน จำรองพันธ์	QAD	QC2	Staff	0		2025-11-04 14:42:17.424	2025-11-04 14:42:17.424	\N	\N	\N	\N	Support	\N
1838	gr5x6ksxi2pgkv3903i6sodn	68K005	น.ส. วงเดือน จำรองพันธ์	QAD	QC2	Staff	0		2025-11-04 14:42:17.424	2025-11-04 14:42:17.424	2025-11-04 14:42:17.429	\N	\N	\N	Support	\N
1841	hfb9tt3tnqh21aidmh70g8u8	68K007	นาย มนัญชัย มานะกุล	PCM	ST	Staff	0		2025-11-04 14:42:17.505	2025-11-04 14:42:17.505	\N	\N	\N	\N	Support	\N
1842	hfb9tt3tnqh21aidmh70g8u8	68K007	นาย มนัญชัย มานะกุล	PCM	ST	Staff	0		2025-11-04 14:42:17.505	2025-11-04 14:42:17.505	2025-11-04 14:42:17.509	\N	\N	\N	Support	\N
1845	x3nohaj45w0czqjr7wxm0knw	68K011	น.ส. ศิริพร ศรีสว่าง	QAD	QC2	Staff	0		2025-11-04 14:42:17.563	2025-11-04 14:42:17.563	\N	\N	\N	\N	Support	\N
1846	x3nohaj45w0czqjr7wxm0knw	68K011	น.ส. ศิริพร ศรีสว่าง	QAD	QC2	Staff	0		2025-11-04 14:42:17.563	2025-11-04 14:42:17.563	2025-11-04 14:42:17.567	\N	\N	\N	Support	\N
1849	bxd765op0z8j49ei99wrwvlo	68K013	น.ส. ธนัชชา ศิริดี	PCM	ST	Staff	0		2025-11-04 14:42:17.618	2025-11-04 14:42:17.618	\N	\N	\N	\N	Support	\N
1850	bxd765op0z8j49ei99wrwvlo	68K013	น.ส. ธนัชชา ศิริดี	PCM	ST	Staff	0		2025-11-04 14:42:17.618	2025-11-04 14:42:17.618	2025-11-04 14:42:17.623	\N	\N	\N	Support	\N
1853	mk3zmzroyeie0748ttmrqj95	68K017	น.ส. วรรณวิษา สุริวงศ์	QAD	IP	Staff	0		2025-11-04 14:42:17.694	2025-11-04 14:42:17.694	\N	\N	\N	\N	Support	\N
1854	mk3zmzroyeie0748ttmrqj95	68K017	น.ส. วรรณวิษา สุริวงศ์	QAD	IP	Staff	0		2025-11-04 14:42:17.694	2025-11-04 14:42:17.694	2025-11-04 14:42:17.699	\N	\N	\N	Support	\N
1857	z1mafog8ji5z9b1ekav7qmoz	68K020	นาย ศราวุฒิ น้อยหาญ	PDT4	JM	Staff	0		2025-11-04 14:42:17.771	2025-11-04 14:42:17.771	\N	\N	\N	\N	Production	\N
1858	z1mafog8ji5z9b1ekav7qmoz	68K020	นาย ศราวุฒิ น้อยหาญ	PDT4	JM	Staff	0		2025-11-04 14:42:17.771	2025-11-04 14:42:17.771	2025-11-04 14:42:17.775	\N	\N	\N	Production	\N
1861	dxovaesf2bqcweyrmlg1jxcq	68K022	น.ส. ศิรินทิพย์ พวงจันทร์	PCM	OR	Staff	0		2025-11-04 14:42:17.847	2025-11-04 14:42:17.847	\N	\N	\N	\N	Support	\N
1862	dxovaesf2bqcweyrmlg1jxcq	68K022	น.ส. ศิรินทิพย์ พวงจันทร์	PCM	OR	Staff	0		2025-11-04 14:42:17.847	2025-11-04 14:42:17.847	2025-11-04 14:42:17.851	\N	\N	\N	Support	\N
1865	nw3eyvm1wct7a473ztsgine3	68K025	นาย มานะชัย อัคลา	PDM	FC	Staff	0		2025-11-04 14:42:17.922	2025-11-04 14:42:17.922	\N	\N	\N	\N	Support	\N
1866	nw3eyvm1wct7a473ztsgine3	68K025	นาย มานะชัย อัคลา	PDM	FC	Staff	0		2025-11-04 14:42:17.922	2025-11-04 14:42:17.922	2025-11-04 14:42:17.926	\N	\N	\N	Support	\N
1869	n3llxgt4myi7l6av6ezmngrr	68K028	นาย รัตนพล ศรีกัณหา	QAD	QC2	Staff	0		2025-11-04 14:42:17.98	2025-11-04 14:42:17.98	\N	\N	\N	\N	Support	\N
1870	n3llxgt4myi7l6av6ezmngrr	68K028	นาย รัตนพล ศรีกัณหา	QAD	QC2	Staff	0		2025-11-04 14:42:17.98	2025-11-04 14:42:17.98	2025-11-04 14:42:17.986	\N	\N	\N	Support	\N
1873	sozsqp3ydr4hr9qyomjjx8hq	68K031	น.ส. วาสนา จอมพล	QAD	QC2	Staff	0		2025-11-04 14:42:18.062	2025-11-04 14:42:18.062	\N	\N	\N	\N	Support	\N
1874	sozsqp3ydr4hr9qyomjjx8hq	68K031	น.ส. วาสนา จอมพล	QAD	QC2	Staff	0		2025-11-04 14:42:18.062	2025-11-04 14:42:18.062	2025-11-04 14:42:18.067	\N	\N	\N	Support	\N
1877	lkq4kekw67xywp08o0wdfxm4	68K034	นาย วิทวัส กันจันทึก	PDM	FC	Staff	0		2025-11-04 14:42:18.125	2025-11-04 14:42:18.125	\N	\N	\N	\N	Support	\N
1878	lkq4kekw67xywp08o0wdfxm4	68K034	นาย วิทวัส กันจันทึก	PDM	FC	Staff	0		2025-11-04 14:42:18.125	2025-11-04 14:42:18.125	2025-11-04 14:42:18.131	\N	\N	\N	Support	\N
1881	iyqpc4gx7ligsrfzv7t6jm1h	68K036	นาย ธนาวุฒิ คำใบ	QAD	QC2	Staff	0		2025-11-04 14:42:18.22	2025-11-04 14:42:18.22	\N	\N	\N	\N	Support	\N
1882	iyqpc4gx7ligsrfzv7t6jm1h	68K036	นาย ธนาวุฒิ คำใบ	QAD	QC2	Staff	0		2025-11-04 14:42:18.22	2025-11-04 14:42:18.22	2025-11-04 14:42:18.225	\N	\N	\N	Support	\N
1885	uevoteru3eqi5dp90dsezl9n	68T003	นาย รวิช คุ้มโพน	PCM	TP	Staff	0		2025-11-04 14:42:18.295	2025-11-04 14:42:18.295	\N	\N	\N	\N	Support	\N
1886	uevoteru3eqi5dp90dsezl9n	68T003	นาย รวิช คุ้มโพน	PCM	TP	Staff	0		2025-11-04 14:42:18.295	2025-11-04 14:42:18.295	2025-11-04 14:42:18.3	\N	\N	\N	Support	\N
1889	bcrortvy1p2ywnqlttemdzjq	68T005	น.ส. สุพรรณี จำปาเทศ	QAD	QC2	Staff	0		2025-11-04 14:42:18.369	2025-11-04 14:42:18.369	\N	\N	\N	\N	Support	\N
1890	bcrortvy1p2ywnqlttemdzjq	68T005	น.ส. สุพรรณี จำปาเทศ	QAD	QC2	Staff	0		2025-11-04 14:42:18.369	2025-11-04 14:42:18.369	2025-11-04 14:42:18.373	\N	\N	\N	Support	\N
1893	q8kjlmvarlhavb4z2teo312y	68T010	นาย วิศรุต สันประภา	QAD	QC2	Staff	0		2025-11-04 14:42:18.444	2025-11-04 14:42:18.444	\N	\N	\N	\N	Support	\N
1894	q8kjlmvarlhavb4z2teo312y	68T010	นาย วิศรุต สันประภา	QAD	QC2	Staff	0		2025-11-04 14:42:18.444	2025-11-04 14:42:18.444	2025-11-04 14:42:18.448	\N	\N	\N	Support	\N
1897	gkh0ui766x5kzn0ywzo4hbcz	68T013	นาย ธาดา ไอยรา	PCM	ST	Staff	0		2025-11-04 14:42:18.506	2025-11-04 14:42:18.506	\N	\N	\N	\N	Support	\N
1898	gkh0ui766x5kzn0ywzo4hbcz	68T013	นาย ธาดา ไอยรา	PCM	ST	Staff	0		2025-11-04 14:42:18.506	2025-11-04 14:42:18.506	2025-11-04 14:42:18.512	\N	\N	\N	Support	\N
1901	inkf8ew9qs2lo7wtpszjsowz	68T015	นาย วัฒนา สมญา	PCM	ST	Staff	0		2025-11-04 14:42:18.586	2025-11-04 14:42:18.586	\N	\N	\N	\N	Support	\N
1902	inkf8ew9qs2lo7wtpszjsowz	68T015	นาย วัฒนา สมญา	PCM	ST	Staff	0		2025-11-04 14:42:18.586	2025-11-04 14:42:18.586	2025-11-04 14:42:18.591	\N	\N	\N	Support	\N
1905	drfknfi2tkpb02xca5vkcnyb	68T017	นาย วรวุฒิ ศรีเมือง	PDT1	M8	Staff	0		2025-11-04 14:42:18.646	2025-11-04 14:42:18.646	\N	\N	\N	\N	Production	\N
1906	drfknfi2tkpb02xca5vkcnyb	68T017	นาย วรวุฒิ ศรีเมือง	PDT1	M8	Staff	0		2025-11-04 14:42:18.646	2025-11-04 14:42:18.646	2025-11-04 14:42:18.651	\N	\N	\N	Production	\N
1909	cavvvuqqk5g9f0fnrj7n9qy6	68T019	นาย ธนากร นิลโคตร	QAD	QC2	Staff	0		2025-11-04 14:42:18.722	2025-11-04 14:42:18.722	\N	\N	\N	\N	Support	\N
1910	cavvvuqqk5g9f0fnrj7n9qy6	68T019	นาย ธนากร นิลโคตร	QAD	QC2	Staff	0		2025-11-04 14:42:18.722	2025-11-04 14:42:18.722	2025-11-04 14:42:18.726	\N	\N	\N	Support	\N
1913	jhka7m9cv2vrsbfb4dbe96ha	68T021	นาย จักรสิน หงษ์ทอง	PCM	ST	Staff	0		2025-11-04 14:42:18.797	2025-11-04 14:42:18.797	\N	\N	\N	\N	Support	\N
1914	jhka7m9cv2vrsbfb4dbe96ha	68T021	นาย จักรสิน หงษ์ทอง	PCM	ST	Staff	0		2025-11-04 14:42:18.797	2025-11-04 14:42:18.797	2025-11-04 14:42:18.801	\N	\N	\N	Support	\N
1831	z2jm2y4nrr74yd46rghmzg0d	68K002	น.ส. อภิญญา สมสีแก้ว	QAD	QC2	Staff	0		2025-11-04 14:42:17.328	2025-11-04 14:42:17.328	\N	\N	\N	\N	Support	\N
1832	z2jm2y4nrr74yd46rghmzg0d	68K002	น.ส. อภิญญา สมสีแก้ว	QAD	QC2	Staff	0		2025-11-04 14:42:17.328	2025-11-04 14:42:17.328	2025-11-04 14:42:17.332	\N	\N	\N	Support	\N
1835	c3rf1zsvtihvwry9ezby4g77	68K004	น.ส. เบ็ญจมาศ ภิมา	QAD	QC2	Staff	0		2025-11-04 14:42:17.387	2025-11-04 14:42:17.387	\N	\N	\N	\N	Support	\N
1836	c3rf1zsvtihvwry9ezby4g77	68K004	น.ส. เบ็ญจมาศ ภิมา	QAD	QC2	Staff	0		2025-11-04 14:42:17.387	2025-11-04 14:42:17.387	2025-11-04 14:42:17.391	\N	\N	\N	Support	\N
1839	w4zmhyez8xlq8z4l2s66ni64	68K006	น.ส. สุชัญญา สมบูรณ์	QAD	QC2	Staff	0		2025-11-04 14:42:17.467	2025-11-04 14:42:17.467	\N	\N	\N	\N	Support	\N
1840	w4zmhyez8xlq8z4l2s66ni64	68K006	น.ส. สุชัญญา สมบูรณ์	QAD	QC2	Staff	0		2025-11-04 14:42:17.467	2025-11-04 14:42:17.467	2025-11-04 14:42:17.471	\N	\N	\N	Support	\N
1843	rqerxthhphb0sjnidhsvmk7m	68K009	นาย อภิเชษฐ์ มุภาษา	PCM	TP	Staff	0		2025-11-04 14:42:17.525	2025-11-04 14:42:17.525	\N	\N	\N	\N	Support	\N
1844	rqerxthhphb0sjnidhsvmk7m	68K009	นาย อภิเชษฐ์ มุภาษา	PCM	TP	Staff	0		2025-11-04 14:42:17.525	2025-11-04 14:42:17.525	2025-11-04 14:42:17.53	\N	\N	\N	Support	\N
1847	ni8m3vdtgiwn44pdfnso1tg0	68K012	น.ส. ราณี พูลทา	QAD	QC2	Staff	0		2025-11-04 14:42:17.597	2025-11-04 14:42:17.597	\N	\N	\N	\N	Support	\N
1848	ni8m3vdtgiwn44pdfnso1tg0	68K012	น.ส. ราณี พูลทา	QAD	QC2	Staff	0		2025-11-04 14:42:17.597	2025-11-04 14:42:17.597	2025-11-04 14:42:17.601	\N	\N	\N	Support	\N
1851	lkxmhex55pak23zsjmvdw70c	68K016	น.ส. พรธิดา รถทอง	PUD	PU1	Staff	0		2025-11-04 14:42:17.658	2025-11-04 14:42:17.658	\N	\N	\N	\N	Non Production	\N
1852	lkxmhex55pak23zsjmvdw70c	68K016	น.ส. พรธิดา รถทอง	PUD	PU1	Staff	0		2025-11-04 14:42:17.658	2025-11-04 14:42:17.658	2025-11-04 14:42:17.662	\N	\N	\N	Non Production	\N
1855	dtgsm365yu5w2l9b8pus2yvp	68K018	น.ส. ศิริอรษา นิเวชกูล	QAD	QC2	Staff	0		2025-11-04 14:42:17.735	2025-11-04 14:42:17.735	\N	\N	\N	\N	Support	\N
1856	dtgsm365yu5w2l9b8pus2yvp	68K018	น.ส. ศิริอรษา นิเวชกูล	QAD	QC2	Staff	0		2025-11-04 14:42:17.735	2025-11-04 14:42:17.735	2025-11-04 14:42:17.741	\N	\N	\N	Support	\N
1859	qcdaroxmcd00e9twst2l7ex6	68K021	นาย บัญญัติ สารัญ	PCM	ST	Staff	0		2025-11-04 14:42:17.793	2025-11-04 14:42:17.793	\N	\N	\N	\N	Support	\N
1860	qcdaroxmcd00e9twst2l7ex6	68K021	นาย บัญญัติ สารัญ	PCM	ST	Staff	0		2025-11-04 14:42:17.793	2025-11-04 14:42:17.793	2025-11-04 14:42:17.81	\N	\N	\N	Support	\N
1863	cknezn9pyya2dmw648izwjr0	68K023	นาย รัฐพงษ์ เจริญศรี	PDT4	EL	Staff	0		2025-11-04 14:42:17.884	2025-11-04 14:42:17.884	\N	\N	\N	\N	Production	\N
1864	cknezn9pyya2dmw648izwjr0	68K023	นาย รัฐพงษ์ เจริญศรี	PDT4	EL	Staff	0		2025-11-04 14:42:17.884	2025-11-04 14:42:17.884	2025-11-04 14:42:17.888	\N	\N	\N	Production	\N
1867	u8wyrq77t84exb999fw4egu8	68K026	นาย สราวุฒิ วงษ์ชาลี	QAD	QC2	Staff	0		2025-11-04 14:42:17.944	2025-11-04 14:42:17.944	\N	\N	\N	\N	Support	\N
1868	u8wyrq77t84exb999fw4egu8	68K026	นาย สราวุฒิ วงษ์ชาลี	QAD	QC2	Staff	0		2025-11-04 14:42:17.944	2025-11-04 14:42:17.944	2025-11-04 14:42:17.949	\N	\N	\N	Support	\N
1871	b8rbaczbuzqrjk2v0b7gwpyq	68K029	นาย ธีรพงษ์ สุทธะโส	PDT1	M6	Staff	0		2025-11-04 14:42:18.02	2025-11-04 14:42:18.02	\N	\N	\N	\N	Production	\N
1872	b8rbaczbuzqrjk2v0b7gwpyq	68K029	นาย ธีรพงษ์ สุทธะโส	PDT1	M6	Staff	0		2025-11-04 14:42:18.02	2025-11-04 14:42:18.02	2025-11-04 14:42:18.025	\N	\N	\N	Production	\N
1875	qt7uui7y9rv0qzeeiq3y6ucf	68K032	นาย นันทพงศ์ กุลวงษ์	PDM	FC	Staff	0		2025-11-04 14:42:18.099	2025-11-04 14:42:18.099	\N	\N	\N	\N	Support	\N
1876	qt7uui7y9rv0qzeeiq3y6ucf	68K032	นาย นันทพงศ์ กุลวงษ์	PDM	FC	Staff	0		2025-11-04 14:42:18.099	2025-11-04 14:42:18.099	2025-11-04 14:42:18.103	\N	\N	\N	Support	\N
1879	dqtg4ek8dmjzqaprxero53ao	68K035	นาย ชินกร ปัญญาบุตร	PDT1	M8	Staff	0		2025-11-04 14:42:18.163	2025-11-04 14:42:18.163	\N	\N	\N	\N	Production	\N
1880	dqtg4ek8dmjzqaprxero53ao	68K035	นาย ชินกร ปัญญาบุตร	PDT1	M8	Staff	0		2025-11-04 14:42:18.163	2025-11-04 14:42:18.163	2025-11-04 14:42:18.182	\N	\N	\N	Production	\N
1883	j6p1scjy7q82kplrb1vrtlit	68T002	น.ส. วรัญญา จันทร์นาม	QAD	QC2	Staff	0		2025-11-04 14:42:18.257	2025-11-04 14:42:18.257	\N	\N	\N	\N	Support	\N
1884	j6p1scjy7q82kplrb1vrtlit	68T002	น.ส. วรัญญา จันทร์นาม	QAD	QC2	Staff	0		2025-11-04 14:42:18.257	2025-11-04 14:42:18.257	2025-11-04 14:42:18.261	\N	\N	\N	Support	\N
1887	aduokbn20u6pkhafb501d7xy	68T004	น.ส. ปิ่นมณี บุญทัน	QAD	QC2	Staff	0		2025-11-04 14:42:18.333	2025-11-04 14:42:18.333	\N	\N	\N	\N	Support	\N
1888	aduokbn20u6pkhafb501d7xy	68T004	น.ส. ปิ่นมณี บุญทัน	QAD	QC2	Staff	0		2025-11-04 14:42:18.333	2025-11-04 14:42:18.333	2025-11-04 14:42:18.337	\N	\N	\N	Support	\N
1891	zmuudsua9exap65afkemslcf	68T006	นาย ธนทการณ์ บัลลังก์	PDT4	US	Staff	0		2025-11-04 14:42:18.41	2025-11-04 14:42:18.41	\N	\N	\N	\N	Production	\N
1892	zmuudsua9exap65afkemslcf	68T006	นาย ธนทการณ์ บัลลังก์	PDT4	US	Staff	0		2025-11-04 14:42:18.41	2025-11-04 14:42:18.41	2025-11-04 14:42:18.415	\N	\N	\N	Production	\N
1895	iggj04j85iztbuv7odsouxcq	68T012	น.ส. สิริญา พันธ์ขาว	PDT3	BZ	Staff	0		2025-11-04 14:42:18.464	2025-11-04 14:42:18.464	\N	\N	\N	\N	Production	\N
1896	iggj04j85iztbuv7odsouxcq	68T012	น.ส. สิริญา พันธ์ขาว	PDT3	BZ	Staff	0		2025-11-04 14:42:18.464	2025-11-04 14:42:18.464	2025-11-04 14:42:18.469	\N	\N	\N	Production	\N
1899	tmoukmrwgnxjyjhp3434x25l	68T014	นาย วินัย จันบัวลา	PCM	ST	Staff	0		2025-11-04 14:42:18.547	2025-11-04 14:42:18.547	\N	\N	\N	\N	Support	\N
1900	tmoukmrwgnxjyjhp3434x25l	68T014	นาย วินัย จันบัวลา	PCM	ST	Staff	0		2025-11-04 14:42:18.547	2025-11-04 14:42:18.547	2025-11-04 14:42:18.553	\N	\N	\N	Support	\N
1903	esn8h8cqb3o0xj0z51ai1sr3	68T016	นาย เอกพล ประหยัด	PDT1	M8	Staff	0		2025-11-04 14:42:18.625	2025-11-04 14:42:18.625	\N	\N	\N	\N	Production	\N
1904	esn8h8cqb3o0xj0z51ai1sr3	68T016	นาย เอกพล ประหยัด	PDT1	M8	Staff	0		2025-11-04 14:42:18.625	2025-11-04 14:42:18.625	2025-11-04 14:42:18.629	\N	\N	\N	Production	\N
1907	u75nma4ak5znltik1zxcth8e	68T018	น.ส. พนิตพิชา กัณหา	PDT1	M10	Staff	0		2025-11-04 14:42:18.685	2025-11-04 14:42:18.685	\N	\N	\N	\N	Production	\N
1908	u75nma4ak5znltik1zxcth8e	68T018	น.ส. พนิตพิชา กัณหา	PDT1	M10	Staff	0		2025-11-04 14:42:18.685	2025-11-04 14:42:18.685	2025-11-04 14:42:18.69	\N	\N	\N	Production	\N
1911	vkgk95sca1mgv0vba6oc5su6	68T020	นาย อภิเดช ดาวเรือง	QAD	QC2	Staff	0		2025-11-04 14:42:18.762	2025-11-04 14:42:18.762	\N	\N	\N	\N	Support	\N
1912	vkgk95sca1mgv0vba6oc5su6	68T020	นาย อภิเดช ดาวเรือง	QAD	QC2	Staff	0		2025-11-04 14:42:18.762	2025-11-04 14:42:18.762	2025-11-04 14:42:18.766	\N	\N	\N	Support	\N
1915	vwwdftxmc9az9ugdswes0bzr	68T022	นาย นาถวัฒน์ ต๊ะศิริ	PDT3	BZ	Staff	0		2025-11-04 14:42:18.817	2025-11-04 14:42:18.817	\N	\N	\N	\N	Production	\N
1916	vwwdftxmc9az9ugdswes0bzr	68T022	นาย นาถวัฒน์ ต๊ะศิริ	PDT3	BZ	Staff	0		2025-11-04 14:42:18.817	2025-11-04 14:42:18.817	2025-11-04 14:42:18.821	\N	\N	\N	Production	\N
1919	rgxntmf1at84ye7xbddmay3u	68T025	นาย นคร เทพสกุล	PDT1	M10	Staff	0		2025-11-04 14:42:18.893	2025-11-04 14:42:18.893	\N	\N	\N	\N	Production	\N
1920	rgxntmf1at84ye7xbddmay3u	68T025	นาย นคร เทพสกุล	PDT1	M10	Staff	0		2025-11-04 14:42:18.893	2025-11-04 14:42:18.893	2025-11-04 14:42:18.898	\N	\N	\N	Production	\N
1923	dyoxiowrux2x8uau5j4kv4td	68T028	นาย พงศธร ระดาเขต	ENI	FDM	Staff	0		2025-11-04 14:42:18.953	2025-11-04 14:42:18.953	\N	\N	\N	\N	Support	\N
1924	dyoxiowrux2x8uau5j4kv4td	68T028	นาย พงศธร ระดาเขต	ENI	FDM	Staff	0		2025-11-04 14:42:18.953	2025-11-04 14:42:18.953	2025-11-04 14:42:18.958	\N	\N	\N	Support	\N
1925	vkks8nttb7193lobv6l8uitl	380006	นาง กุลนิษฐ์ พึ่งสามัคคี	HRD	HR	Junior	19	เข้าอบรม	2025-11-04 14:41:38.815	2025-11-05 14:41:26.697	2025-11-05 14:41:26.72	\N	1	\N	Non Production	\N
11	qtzzdgv589vrjs6disfgpiie	330001	นาย ไพสนธ์ ติยะบุตร	PDT4	TM	Assistant Department Manager	19		2025-11-04 14:41:37.254	2025-11-20 14:21:40.619	\N	\N	1	\N	Production	phaison@aoyama.co.th
1929	qtzzdgv589vrjs6disfgpiie	330001	นาย ไพสนธ์ ติยะบุตร	PDT4	TM	Assistant Department Manager	19		2025-11-04 14:41:37.254	2025-11-20 14:21:40.619	2025-11-20 14:21:40.648	\N	1	\N	Production	phaison@aoyama.co.th
1931	plekji36paz0h18yhomsybmm	370009	นาย เฉลียว ปะตังเวสา	PDT4	TM	Senior Expert	19		2025-11-04 14:41:38.451	2025-11-20 14:26:55.993	2025-11-20 14:26:56.012	\N	1	\N	Production	chaliew@aoyama.co.th
1933	ycgmlw8a1mj5vy75x7ext43i	420004	นาย สมจิตร บุตรเรียง	PDT1	NT	Superior Expert	19		2025-11-04 14:41:39.921	2025-11-20 14:27:13.181	2025-11-20 14:27:13.2	\N	1	\N	Production	somjit_b@aoyama.co.th
1935	outq3eixiledyv0um398r8kt	430003	นาย พิศุทธ์ ปาณชู	PUD	TM	Senior Team Manager	19		2025-11-04 14:41:40.221	2025-11-20 14:27:22.892	2025-11-20 14:27:22.909	\N	1	\N	Non Production	pisuth@aoyama.co.th
1937	cjtavyxjwfqe4708fdnyzj04	430018	นาย เอกชัย บุญทัน	QAD	TM	Senior Team Manager	19		2025-11-04 14:41:40.577	2025-11-20 14:27:32.753	2025-11-20 14:27:32.771	\N	1	\N	Support	ekkachai@aoyama.co.th
151	i5rvrcowebbh5f1j0ipf80kk	450019	นาย ปรีชา ภาชนะกาญจน์	PCM	TM	Team Manager	19		2025-11-04 14:41:41.079	2025-11-20 14:27:46.749	\N	\N	1	\N	Support	preecha@aoyama.co.th
1942	dgorh1q31ofp5jzylk8mcl6f	470007	นาย สุพจน์ สมนาศรี	PDT4	EL	Supervisor	19		2025-11-04 14:41:42.144	2025-11-20 14:28:00.737	2025-11-20 14:28:00.755	\N	1	\N	Production	supoj_s@aoyama.co.th
1944	m89cibp4lq0ah7092g763ygg	470052	ว่าที่ร.ต. วสุพล เพียรเพ็ชร	HRD	TM	Senior Expert	19		2025-11-04 14:41:42.734	2025-11-20 14:28:11.111	2025-11-20 14:28:11.127	\N	1	\N	Non Production	wasuphol@aoyama.co.th
1948	sibs375nj79qkutay3bk3xyq	480025	นาง กนกกาญจน์ พลูวรรณ์	HRD	TM	Assistant Department Manager	19		2025-11-04 14:41:43.136	2025-11-20 14:28:27.876	2025-11-20 14:28:27.892	\N	1	\N	Non Production	kanokkarn@aoyama.co.th
1950	nf1svh4y45it9y378juv19zp	480006	นาย สันติ เหลืองอ่อน	PDT4	TM	Team Manager	19		2025-11-04 14:41:42.983	2025-11-20 14:28:34.109	2025-11-20 14:28:34.125	\N	1	\N	Production	santi@aoyama.co.th
1951	l9pzr7zvs01r2734wfx0k99g	480005	นาย ภีมญ์วัจน์ วงศ์ศิริ	QAD	QC1	Supervisor	19		2025-11-04 14:41:42.932	2025-11-20 14:28:36.893	2025-11-20 14:28:36.909	\N	1	\N	Support	phimawat@aoyama.co.th
1952	hy8qi9pm4ah7ejq52issce2u	480003	นาย ธเนตร ตันนารักษ์	ENI	TM	Team Manager	19		2025-11-04 14:41:42.883	2025-11-20 14:28:40.026	2025-11-20 14:28:40.042	\N	1	\N	Support	thanate@aoyama.co.th
1953	wj93nsp6yjpj9hbfcec4qhs5	480163	นาง ณัชชา ลือตาล	PUD	TM	Team Manager	19		2025-11-04 14:41:45.405	2025-11-20 14:28:53.383	2025-11-20 14:28:53.399	\N	1	\N	Non Production	natcha@aoyama.co.th
389	zowqbwzyx12td6pxktysaau2	480250	นาย ไกรสร ปะทักขินัง	PDT1	M8	Supervisor	19		2025-11-04 14:41:46.95	2025-11-20 14:29:02.8	\N	\N	1	\N	Production	kraisorn@aoyama.co.th
1954	zowqbwzyx12td6pxktysaau2	480250	นาย ไกรสร ปะทักขินัง	PDT1	M8	Supervisor	19		2025-11-04 14:41:46.95	2025-11-20 14:29:02.8	2025-11-20 14:29:02.819	\N	1	\N	Production	kraisorn@aoyama.co.th
1955	gv14zn3yfdtj6xm7o61myo5t	490071	นาง วนิดา วงศ์คะสุ่ม	FNC	TM	Team Manager	19		2025-11-04 14:41:48.085	2025-11-20 14:29:10.669	2025-11-20 14:29:10.686	\N	1	\N	Non Production	wanida@aoyama.co.th
1956	t839di3ef6p0v2hq5qlxrxdg	490083	นาย ชยังกูร ดวงแก้ว	PDT1	M10	Superior Expert	19		2025-11-04 14:41:48.273	2025-11-20 14:29:16.475	2025-11-20 14:29:16.491	\N	1	\N	Production	chayangkoon@aoyama.co.th
1957	dsmx98wx8qdmkd97aks5fums	490153	นาย ล้อมพงศ์ วิชัย	ENI	TM	Team Manager	18		2025-11-04 14:41:49.334	2025-11-20 14:29:25.056	2025-11-20 14:29:25.072	\N	1	\N	Support	lompong@aoyama.co.th
1958	xlgknxjk9pmji4pg3b49yjaj	500026	นาย วัฒนา น้อยหาญ	PDT1	NT	Supervisor	18		2025-11-04 14:41:49.582	2025-11-20 14:29:31.026	2025-11-20 14:29:31.043	\N	1	\N	Production	wattana@aoyama.co.th
1959	y5aa9uy5etftl1wpvcz8ytyj	500014	น.ส. กรวรรณ ภิญโญศรี	PCM	TM	Team Manager	18		2025-11-04 14:41:49.495	2025-11-20 14:29:33.91	2025-11-20 14:29:33.926	\N	1	\N	Support	koravan@aoyama.co.th
1960	ws3n6n6rw11663hi9pi43pkp	550050	นาย อรรถวิทย์ นิจวิภาอัคริมา	QAD	TM	Assistant Department Manager	13		2025-11-04 14:41:54.202	2025-11-20 14:29:56.247	2025-11-20 14:29:56.263	\N	1	\N	Support	atthawit@aoyama.co.th
1961	r5rwj011eb3k9cwvifwsuu3i	550040	น.ส. กาญจนาพร รงรอง	SAM	SF	Supervisor	13		2025-11-04 14:41:54.065	2025-11-20 14:29:59.133	2025-11-20 14:29:59.148	\N	1	\N	Support	kanjanaporn@aoyama.co.th
1962	vjgauj03k5obchi96cpyl8zd	560019	น.ส. พิชามญชุ์ โชติอัครธนลาภิศ	MKT	SL	Supervisor	12		2025-11-04 14:41:54.932	2025-11-20 14:30:06.341	2025-11-20 14:30:06.357	\N	1	\N	Non Production	pichamon@aoyama.co.th
1965	opi3sgzodk2ye1552ilwumps	580062	น.ส. อัญชลี หมั่นหาทรัพย์	HRD	TM	Team Manager	10		2025-11-04 14:41:57.807	2025-11-20 14:30:29.082	2025-11-20 14:30:29.098	\N	1	\N	Non Production	anchalee@aoyama.co.th
1029	ov8ttw9v8m53v3nwwsyyoukn	610017	นาย ไชยยา ยะระสิทธิ์	QAD	IP	Supervisor	7		2025-11-04 14:42:01.291	2025-11-20 14:31:35.035	\N	\N	1	\N	Support	chaiya_y@aoyama.co.th
1341	qj79yqn6i9mv09lnmeffesnn	650044	นาย เอกพงศ์ ชาญชญานนท์	QAD	QC2	Supervisor	3		2025-11-04 14:42:07.92	2025-11-20 14:32:13.067	\N	\N	1	\N	Support	ekapong@aoyama.co.th
1383	rl1oxwb6jh6d8t0dhnvfjvf2	650074	น.ส. ศิริพร บุญมี	PUD	PU1	Supervisor	2		2025-11-04 14:42:08.776	2025-11-20 14:32:20.346	\N	\N	1	\N	Non Production	siriporn_b@aoyama.co.th
1980	yieya8ua6ubcr8q7x8yn2dd3	660033	นาย ชยาวุฒิ จันทภูมิ	HRD	EF	Supervisor	2		2025-11-04 14:42:11.339	2025-11-20 14:32:40.054	2025-11-20 14:32:40.069	\N	1	\N	Non Production	chayawut_c@aoyama.co.th
1917	eufefek8g27d0nd8hnyebdix	68T024	นาย จิระพงษ์ ทองอ้ม	PDT1	NT	Staff	0		2025-11-04 14:42:18.859	2025-11-04 14:42:18.859	\N	\N	\N	\N	Production	\N
1918	eufefek8g27d0nd8hnyebdix	68T024	นาย จิระพงษ์ ทองอ้ม	PDT1	NT	Staff	0		2025-11-04 14:42:18.859	2025-11-04 14:42:18.859	2025-11-04 14:42:18.863	\N	\N	\N	Production	\N
1921	w2hhzlqaxdr51p0gh6fp5ayx	68T026	นาย ชัชวิน แรงการนา	PDT1	M10	Staff	0		2025-11-04 14:42:18.914	2025-11-04 14:42:18.914	\N	\N	\N	\N	Production	\N
1922	w2hhzlqaxdr51p0gh6fp5ayx	68T026	นาย ชัชวิน แรงการนา	PDT1	M10	Staff	0		2025-11-04 14:42:18.914	2025-11-04 14:42:18.914	2025-11-04 14:42:18.918	\N	\N	\N	Production	\N
1940	i5rvrcowebbh5f1j0ipf80kk	450019	นาย ปรีชา ภาชนะกาญจน์	PCM	TM	Team Manager	19		2025-11-04 14:41:41.079	2025-11-20 14:27:46.749	2025-11-20 14:27:46.766	\N	1	\N	Support	preecha@aoyama.co.th
1483	mlx67rofptdo5cgs2b314wyi	660012	นาย อธิพงษ์ วงหาแก้ว	HRD	TC	Foreman	2	เข้าอบรม	2025-11-04 14:42:10.747	2025-11-06 11:06:47.903	\N	\N	1	\N	Non Production	\N
1928	mlx67rofptdo5cgs2b314wyi	660012	นาย อธิพงษ์ วงหาแก้ว	HRD	TC	Foreman	2	เข้าอบรม	2025-11-04 14:42:10.747	2025-11-06 11:06:47.903	2025-11-06 11:06:47.918	\N	1	\N	Non Production	\N
1930	qp7urhyu1h8hycqxe5oxhuoc	350013	นาย สำราญ เถาโต	PCM	TM	Team Manager	19		2025-11-04 14:41:38.173	2025-11-20 14:26:47.456	2025-11-20 14:26:47.476	\N	1	\N	Support	samran@aoyama.co.th
1932	o510axic0c6zb4zsqszuva8r	400009	นาย ปัญญา พิทักษ์ชาติ	PDT4	TM	Senior Expert	19		2025-11-04 14:41:39.822	2025-11-20 14:27:08.308	2025-11-20 14:27:08.327	\N	1	\N	Production	panya@aoyama.co.th
115	hthsawuv8hu1n5g5wkjlxk4g	430002	นาย ภานุรักษ์ ตันชูสีหรักษ์	PDT2	OQ	Superior Expert	19		2025-11-04 14:41:40.17	2025-11-20 14:27:18.813	\N	\N	1	\N	Production	panurak@aoyama.co.th
1934	hthsawuv8hu1n5g5wkjlxk4g	430002	นาย ภานุรักษ์ ตันชูสีหรักษ์	PDT2	OQ	Superior Expert	19		2025-11-04 14:41:40.17	2025-11-20 14:27:18.813	2025-11-20 14:27:18.831	\N	1	\N	Production	panurak@aoyama.co.th
1936	r8u77m6jfnjf1vi7oiheu3nw	430004	นาย นุสนธ์ ชลมูณี	PDT3	TM	Assistant Department Manager	19		2025-11-04 14:41:40.273	2025-11-20 14:27:26.085	2025-11-20 14:27:26.102	\N	1	\N	Production	nuson@aoyama.co.th
131	cjtavyxjwfqe4708fdnyzj04	430018	นาย เอกชัย บุญทัน	QAD	TM	Senior Team Manager	19		2025-11-04 14:41:40.577	2025-11-20 14:27:32.753	\N	\N	1	\N	Support	ekkachai@aoyama.co.th
1938	kruwr2de88rgp0ddhpjdtz0m	450020	น.ส. อรุณ อินหุ่น	SAM	TM	Assistant Department Manager	19		2025-11-04 14:41:41.131	2025-11-20 14:27:38.438	2025-11-20 14:27:38.457	\N	1	\N	Support	aroon@aoyama.co.th
149	ckbrrtr58eg8u6ofvyra2dbq	450010	นาย จรัญ อ่างชัย	PDT1	EG	Supervisor	19		2025-11-04 14:41:41.013	2025-11-20 14:27:41.734	\N	\N	1	\N	Production	jaran@aoyama.co.th
1939	ckbrrtr58eg8u6ofvyra2dbq	450010	นาย จรัญ อ่างชัย	PDT1	EG	Supervisor	19		2025-11-04 14:41:41.013	2025-11-20 14:27:41.734	2025-11-20 14:27:41.751	\N	1	\N	Production	jaran@aoyama.co.th
197	nnz4owtazsha0lzfh9hsugce	470015	นาย สมคิด หอมประสิทธิ์	MKT	SL	Supervisor	19		2025-11-04 14:41:42.243	2025-11-20 14:27:56.577	\N	\N	1	\N	Non Production	hsomkid@aoyama.co.th
1941	nnz4owtazsha0lzfh9hsugce	470015	นาย สมคิด หอมประสิทธิ์	MKT	SL	Supervisor	19		2025-11-04 14:41:42.243	2025-11-20 14:27:56.577	2025-11-20 14:27:56.594	\N	1	\N	Non Production	hsomkid@aoyama.co.th
1943	r3utxnjlqr8hgtwzkfaxiv28	460020	นาย รชต จันทะแก้ว	PCM	TM	Assistant Department Manager	19		2025-11-04 14:41:41.995	2025-11-20 14:28:03.979	2025-11-20 14:28:03.995	\N	1	\N	Support	rachata@aoyama.co.th
217	m89cibp4lq0ah7092g763ygg	470052	ว่าที่ร.ต. วสุพล เพียรเพ็ชร	HRD	TM	Senior Expert	19		2025-11-04 14:41:42.734	2025-11-20 14:28:11.111	\N	\N	1	\N	Non Production	wasuphol@aoyama.co.th
1945	ngs9hc3m283lfdz3w1nri4bd	470048	นาย สมัย ภูสมพงษ์	PDT1	TM	Team Manager	19		2025-11-04 14:41:42.686	2025-11-20 14:28:15.207	2025-11-20 14:28:15.224	\N	1	\N	Production	samai@aoyama.co.th
1946	xezlwzbqv73f4bpcpcod6ka3	470043	น.ส. ศิริญา บรรเทิงจิตร	PDM	TM	Team Manager	19		2025-11-04 14:41:42.587	2025-11-20 14:28:19.106	2025-11-20 14:28:19.123	\N	1	\N	Support	siriya@aoyama.co.th
207	xibk18ramyvz0ol5wqym3bwf	470025	นาย รังสรรค์ บูระทิศ	PDM	TM	Assistant Department Manager	19		2025-11-04 14:41:42.486	2025-11-20 14:28:22.142	\N	\N	1	\N	Support	rangsan@aoyama.co.th
1947	xibk18ramyvz0ol5wqym3bwf	470025	นาย รังสรรค์ บูระทิศ	PDM	TM	Assistant Department Manager	19		2025-11-04 14:41:42.486	2025-11-20 14:28:22.142	2025-11-20 14:28:22.158	\N	1	\N	Support	rangsan@aoyama.co.th
1949	g1d7wfjb8i1lf6eom17g8z6x	480018	นาย พิชัย เกียรติทัศน์	PDT4	TM	Team Manager	19		2025-11-04 14:41:43.035	2025-11-20 14:28:31.296	2025-11-20 14:28:31.313	\N	1	\N	Production	pichai@aoyama.co.th
225	l9pzr7zvs01r2734wfx0k99g	480005	นาย ภีมญ์วัจน์ วงศ์ศิริ	QAD	QC1	Supervisor	19		2025-11-04 14:41:42.932	2025-11-20 14:28:36.893	\N	\N	1	\N	Support	phimawat@aoyama.co.th
325	wj93nsp6yjpj9hbfcec4qhs5	480163	นาง ณัชชา ลือตาล	PUD	TM	Team Manager	19		2025-11-04 14:41:45.405	2025-11-20 14:28:53.383	\N	\N	1	\N	Non Production	natcha@aoyama.co.th
445	t839di3ef6p0v2hq5qlxrxdg	490083	นาย ชยังกูร ดวงแก้ว	PDT1	M10	Superior Expert	19		2025-11-04 14:41:48.273	2025-11-20 14:29:16.475	\N	\N	1	\N	Production	chayangkoon@aoyama.co.th
709	ws3n6n6rw11663hi9pi43pkp	550050	นาย อรรถวิทย์ นิจวิภาอัคริมา	QAD	TM	Assistant Department Manager	13		2025-11-04 14:41:54.202	2025-11-20 14:29:56.247	\N	\N	1	\N	Support	atthawit@aoyama.co.th
703	r5rwj011eb3k9cwvifwsuu3i	550040	น.ส. กาญจนาพร รงรอง	SAM	SF	Supervisor	13		2025-11-04 14:41:54.065	2025-11-20 14:29:59.133	\N	\N	1	\N	Support	kanjanaporn@aoyama.co.th
743	vjgauj03k5obchi96cpyl8zd	560019	น.ส. พิชามญชุ์ โชติอัครธนลาภิศ	MKT	SL	Supervisor	12		2025-11-04 14:41:54.932	2025-11-20 14:30:06.341	\N	\N	1	\N	Non Production	pichamon@aoyama.co.th
893	zity27ehh038zldlu9o5kqem	590020	นาย ยุทธภูมิ จันทรนิกร	PDT3	GM	Supervisor	9		2025-11-04 14:41:58.262	2025-11-20 14:30:39.018	\N	\N	1	\N	Production	yuttapoom@aoyama.co.th
933	wbkectfjnay4bec2jjz3lny7	590069	นาย เอกพล สว่างเกษมสุข	PDT1	M6	Supervisor	9		2025-11-04 14:41:59.163	2025-11-20 14:30:46.734	\N	\N	1	\N	Production	ekapon_s@aoyama.co.th
1109	j15bcdenbu26gjfsvfe39dpd	630004	น.ส. วันเพ็ญ วรรณกูล	HRD	GA	Supervisor	5		2025-11-04 14:42:03.154	2025-11-20 14:31:48.85	\N	\N	1	\N	Non Production	wanpen@aoyama.co.th
1513	yieya8ua6ubcr8q7x8yn2dd3	660033	นาย ชยาวุฒิ จันทภูมิ	HRD	EF	Supervisor	2		2025-11-04 14:42:11.339	2025-11-20 14:32:40.054	\N	\N	1	\N	Non Production	chayawut_c@aoyama.co.th
781	ril1lilsoyz1etkp3tgiqpoi	570011	น.ส. วรรษมล แมลงภู่	HRD	HR	Supervisor	11		2025-11-04 14:41:55.748	2025-11-20 14:30:14.699	\N	\N	1	\N	Non Production	wasamol@aoyama.co.th
1963	ril1lilsoyz1etkp3tgiqpoi	570011	น.ส. วรรษมล แมลงภู่	HRD	HR	Supervisor	11		2025-11-04 14:41:55.748	2025-11-20 14:30:14.699	2025-11-20 14:30:14.716	\N	1	\N	Non Production	wasamol@aoyama.co.th
1964	xpxvuzecb0jjt03hh3yp4iyi	580006	นาย ธนัช ภักมีคุณธร	PDT4	UB	Supervisor	10		2025-11-04 14:41:56.799	2025-11-20 14:30:21.727	2025-11-20 14:30:21.744	\N	1	\N	Production	thanat@aoyama.co.th
1966	zity27ehh038zldlu9o5kqem	590020	นาย ยุทธภูมิ จันทรนิกร	PDT3	GM	Supervisor	9		2025-11-04 14:41:58.262	2025-11-20 14:30:39.018	2025-11-20 14:30:39.033	\N	1	\N	Production	yuttapoom@aoyama.co.th
1967	wbkectfjnay4bec2jjz3lny7	590069	นาย เอกพล สว่างเกษมสุข	PDT1	M6	Supervisor	9		2025-11-04 14:41:59.163	2025-11-20 14:30:46.734	2025-11-20 14:30:46.749	\N	1	\N	Production	ekapon_s@aoyama.co.th
1968	k6tyoy2s7vco68yu3v0l1km7	590068	นาย ประจักษ์ ท่อทอง	PDT1	TM	Assistant Department Manager	9		2025-11-04 14:41:59.116	2025-11-20 14:31:10.151	2025-11-20 14:31:10.168	\N	1	\N	Production	prajak@aoyama.co.th
1975	j15bcdenbu26gjfsvfe39dpd	630004	น.ส. วันเพ็ญ วรรณกูล	HRD	GA	Supervisor	5		2025-11-04 14:42:03.154	2025-11-20 14:31:48.85	2025-11-20 14:31:48.865	\N	1	\N	Non Production	wanpen@aoyama.co.th
1981	eqtxkm6yyajherx5xmmdyd53	660044	นาย อัษฎาวุฒิ วงศ์ทอง	SAM	TM	Team Manager	2		2025-11-04 14:42:11.638	2025-11-20 14:32:45.696	2025-11-20 14:32:45.711	\N	1	\N	Support	assadawut_w@aoyama.co.th
1969	owajmobhk1vairzy970p1cub	600026	นาย อนุชา เที่ยงธรรม	PDT2	TM	Team Manager	8		2025-11-04 14:41:59.685	2025-11-20 14:31:15.259	2025-11-20 14:31:15.275	\N	1	\N	Production	anucha@aoyama.co.th
1970	jz2sxvuzd64spkvdd0ryuwii	590078	นาย เอกชัย ใจปันธิ	PDT3	TM	Team Manager	9		2025-11-04 14:41:59.362	2025-11-20 14:31:18.763	2025-11-20 14:31:18.78	\N	1	\N	Production	eakachai_j@aoyama.co.th
1973	ov8ttw9v8m53v3nwwsyyoukn	610017	นาย ไชยยา ยะระสิทธิ์	QAD	IP	Supervisor	7		2025-11-04 14:42:01.291	2025-11-20 14:31:35.035	2025-11-20 14:31:35.051	\N	1	\N	Support	chaiya_y@aoyama.co.th
1974	fw236jx99xktc31l3yzcomtc	620040	นาย วรุฒน์ เกตุแก้ว	PDT3	JC	Supervisor	6		2025-11-04 14:42:02.76	2025-11-20 14:31:43.386	2025-11-20 14:31:43.402	\N	1	\N	Production	warut@aoyama.co.th
1979	eqkhc72gqilxzetvvsd0yaub	660024	น.ส. พัชราลัย ฤทธิ์ประเสริฐ	MKT	TM	Senior Team Manager	2		2025-11-04 14:42:11.052	2025-11-20 14:32:35.668	2025-11-20 14:32:35.683	\N	1	\N	Non Production	patcharalai_r@aoyama.co.th
967	k3lpvsbjp92jr1djghsh3thm	600038	นาย ธีระพงษ์ จรรยานะ	PDT3	BZ	Supervisor	8		2025-11-04 14:41:59.911	2025-11-20 14:31:23.885	\N	\N	1	\N	Production	teerapong@aoyama.co.th
1971	k3lpvsbjp92jr1djghsh3thm	600038	นาย ธีระพงษ์ จรรยานะ	PDT3	BZ	Supervisor	8		2025-11-04 14:41:59.911	2025-11-20 14:31:23.885	2025-11-20 14:31:23.901	\N	1	\N	Production	teerapong@aoyama.co.th
1972	dyi6xq2mw6b3e8fqzw1bwx3o	610014	น.ส. รัชนีวรรณ แซ่ลี้	PCM	TP	Supervisor	7		2025-11-04 14:42:01.198	2025-11-20 14:31:32.041	2025-11-20 14:31:32.057	\N	1	\N	Support	ratchaneewan@aoyama.co.th
1976	qj79yqn6i9mv09lnmeffesnn	650044	นาย เอกพงศ์ ชาญชญานนท์	QAD	QC2	Supervisor	3		2025-11-04 14:42:07.92	2025-11-20 14:32:13.067	2025-11-20 14:32:13.083	\N	1	\N	Support	ekapong@aoyama.co.th
1977	rl1oxwb6jh6d8t0dhnvfjvf2	650074	น.ส. ศิริพร บุญมี	PUD	PU1	Supervisor	2		2025-11-04 14:42:08.776	2025-11-20 14:32:20.346	2025-11-20 14:32:20.361	\N	1	\N	Non Production	siriporn_b@aoyama.co.th
1978	ees8pqaissue11qf2cfdv5a6	660001	นาย วรา สาคร	HRD	HR	Staff	2		2025-11-04 14:42:10.446	2025-11-20 14:32:30.654	2025-11-20 14:32:30.67	\N	1	\N	Non Production	wara_s@aoyama.co.th
\.


--
-- TOC entry 5333 (class 0 OID 16590)
-- Dependencies: 224
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	nnpcp9unr3y7pkgtkgbhxr4d	Irekeka-LOGO.png	\N	\N	1024	1024	{"large": {"ext": ".png", "url": "/uploads/large_Irekeka_LOGO_1267e3dcd0.png", "hash": "large_Irekeka_LOGO_1267e3dcd0", "mime": "image/png", "name": "large_Irekeka-LOGO.png", "path": null, "size": 937.91, "width": 1000, "height": 1000, "sizeInBytes": 937913}, "small": {"ext": ".png", "url": "/uploads/small_Irekeka_LOGO_1267e3dcd0.png", "hash": "small_Irekeka_LOGO_1267e3dcd0", "mime": "image/png", "name": "small_Irekeka-LOGO.png", "path": null, "size": 272.85, "width": 500, "height": 500, "sizeInBytes": 272849}, "medium": {"ext": ".png", "url": "/uploads/medium_Irekeka_LOGO_1267e3dcd0.png", "hash": "medium_Irekeka_LOGO_1267e3dcd0", "mime": "image/png", "name": "medium_Irekeka-LOGO.png", "path": null, "size": 587.32, "width": 750, "height": 750, "sizeInBytes": 587324}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Irekeka_LOGO_1267e3dcd0.png", "hash": "thumbnail_Irekeka_LOGO_1267e3dcd0", "mime": "image/png", "name": "thumbnail_Irekeka-LOGO.png", "path": null, "size": 46.82, "width": 156, "height": 156, "sizeInBytes": 46815}}	Irekeka_LOGO_1267e3dcd0	.png	image/png	232.23	/uploads/Irekeka_LOGO_1267e3dcd0.png	\N	local	\N	/	2025-11-21 15:49:02.563	2025-11-21 15:49:02.563	2025-11-21 15:49:02.564	1	1	\N
\.


--
-- TOC entry 5377 (class 0 OID 16856)
-- Dependencies: 268
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- TOC entry 5375 (class 0 OID 16844)
-- Dependencies: 266
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
2	1	2	api::register-qcc.register-qcc	logo	1
7	1	1	api::register-qcc.register-qcc	logo	1
8	1	4	api::register-qcc.register-qcc	logo	1
\.


--
-- TOC entry 5337 (class 0 OID 16624)
-- Dependencies: 228
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	m5dj3qfvus7yz6s12tfecavy	English (en)	en	2025-10-16 09:53:05.79	2025-10-16 09:53:05.79	2025-10-16 09:53:05.792	\N	\N	\N
\.


--
-- TOC entry 5403 (class 0 OID 17500)
-- Dependencies: 294
-- Data for Name: register_qccs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.register_qccs (id, document_id, registration_date, group_id, department, type_group, name_team, team_slogan, group_advisor, type_of_routine_work, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, status_qcc, group_manager_primary, group_manager_secondary) FROM stdin;
1	pw47clzqqhc1ffc7dhoccmau	2025-11-21 00:00:00	N2619001	PDM	Non	IT	IT Overdie	470025	Tee	2025-11-21 15:49:20.849	2025-11-21 16:12:05.921	\N	1	1	\N	IN_PROGRESS	430019	\N
4	pw47clzqqhc1ffc7dhoccmau	2025-11-21 00:00:00	N2619001	PDM	Non	IT	IT Overdie	470025	Tee	2025-11-21 15:49:20.849	2025-11-21 16:12:05.921	2025-11-21 16:12:05.978	1	1	\N	IN_PROGRESS	430019	\N
\.


--
-- TOC entry 5361 (class 0 OID 16768)
-- Dependencies: 252
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5397 (class 0 OID 16976)
-- Dependencies: 288
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- TOC entry 5359 (class 0 OID 16756)
-- Dependencies: 250
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	r88wj7ivheq8cl7zok73y9jf	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	66d5e469f3af73e9488d91724fb8e3244003878d69579b47aa45629ff46cebf903d9da4e39c69881db4e23aa4e58e467fb9d7db2fb00bd11b8893f992bd5e79c	v1:9dd48532d41d55a97e126d48736256ec:ed26d5be8a6ad26c75cb0516ec594f3b21aaa801e92e97f7b8ea0f3cfddad42cff9810af141ebf3b17d961ef0c3c0bbd5e013b9b6d1a21095f5359b84ca036af2a50ea3e022236dd00aba09c678c149308952492c9c611c2c21bad6c0b12e6f7e05deacff665a5baffcf051ad11cd807d347cc8bcbf3425b18a1f306c922c01d2c140f7d8d0abc0375ab6a8d06563459e4902d4bb696a388d7d67721e0f0ed85961e3ab14bbba80de6d0dec1bb67c2f205e7152c2d3ef4bb585a447696c32004ca98388ed313b97124976e9e6457ff5198c5aa9ed9a5efda0f3c1d405249aa76513b4f1995987894a9394b89f9938a28fcb3bdb086bb74f48bd1e29ea3406011:802e993d3a4a5b6bfbde0da83bcec048	\N	\N	\N	2025-10-16 09:53:06.729	2025-10-16 09:53:06.729	2025-10-16 09:53:06.729	\N	\N	\N
2	rmiy3n8ednda3yejjkm7xv16	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	cde860c00449b4668a7e0cddf1ad93bedca2db734418e0a1024bdd13b98ad3f813ab822e0dc9f8972aa5a062b78e6fd7c837e553d41285b02309528b1f62f0ee	v1:63a5b3d46aa08f8cec9693d973128074:e6e604fde867a57d5dad1870b7a1ba9d619863adabbc7be613dae0d1f9f4a68ef9d108a72485eeec1a3e3113a384f2c2b4dbe16c333f1682ae38a0870f3f6d8720c145bfab09b64faeb865f307f03206e1b4664edad85084e189c3722f4d6c75b261767a486a1e0638b33e7d314002fa094718aa9d73f968cc9ff3f9d8419de62b14d70309eed104dd0fb12529f3c8378df7e970d871a51c9b271939228f52c24c7b3d4727bea07f7c64e0f88f044ea6d16c9e60b4b5dfd68da4450afd1162cb3c45919942c416899cf1293cfc0e433cb6c2714cb62ca00f1ef379fd63dbe602d8dcc137f40c985d36e203d5db8bcc5a442076a42826cbe21c2568172c535b60:491c5d2960a104bffc1345c46a1ac066	\N	\N	\N	2025-10-16 09:53:06.76	2025-10-16 09:53:06.76	2025-10-16 09:53:06.761	\N	\N	\N
\.


--
-- TOC entry 5369 (class 0 OID 16816)
-- Dependencies: 260
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
3	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
27	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
1	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::department.department":{"kind":"collectionType","collectionName":"departments","info":{"singularName":"department","pluralName":"departments","displayName":"department"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"teams":{"type":"relation","relation":"oneToMany","target":"api::team.team","mappedBy":"department"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::department.department","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"departments"}}},"apiName":"department","globalId":"Department","uid":"api::department.department","modelType":"contentType","__schema__":{"collectionName":"departments","info":{"singularName":"department","pluralName":"departments","displayName":"department"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"teams":{"type":"relation","relation":"oneToMany","target":"api::team.team","mappedBy":"department"}},"kind":"collectionType"},"modelName":"department","actions":{},"lifecycles":{}},"api::emp-register-qcc.emp-register-qcc":{"kind":"collectionType","collectionName":"emp_register_qccs","info":{"singularName":"emp-register-qcc","pluralName":"emp-register-qccs","displayName":"emp_register_qcc"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"position":{"type":"enumeration","enum":["Leader","DeputyLeader","Secretary","Member"]},"register_qcc":{"type":"relation","relation":"manyToOne","target":"api::register-qcc.register-qcc","inversedBy":"emp_register_qcc"},"employee":{"type":"relation","relation":"manyToOne","target":"api::employee.employee","inversedBy":"emp_register_qccs"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::emp-register-qcc.emp-register-qcc","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"emp_register_qccs"}}},"apiName":"emp-register-qcc","globalId":"EmpRegisterQcc","uid":"api::emp-register-qcc.emp-register-qcc","modelType":"contentType","__schema__":{"collectionName":"emp_register_qccs","info":{"singularName":"emp-register-qcc","pluralName":"emp-register-qccs","displayName":"emp_register_qcc"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"position":{"type":"enumeration","enum":["Leader","DeputyLeader","Secretary","Member"]},"register_qcc":{"type":"relation","relation":"manyToOne","target":"api::register-qcc.register-qcc","inversedBy":"emp_register_qcc"},"employee":{"type":"relation","relation":"manyToOne","target":"api::employee.employee","inversedBy":"emp_register_qccs"}},"kind":"collectionType"},"modelName":"emp-register-qcc","actions":{},"lifecycles":{}},"api::employee.employee":{"kind":"collectionType","collectionName":"employees","info":{"singularName":"employee","pluralName":"employees","displayName":"employee"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"employee_code":{"type":"string"},"full_name":{"type":"string"},"department":{"type":"string"},"team":{"type":"string"},"position":{"type":"string"},"activity_history":{"type":"integer"},"training_history":{"type":"string"},"type_group":{"type":"string"},"email":{"type":"email"},"emp_register_qccs":{"type":"relation","relation":"oneToMany","target":"api::emp-register-qcc.emp-register-qcc","mappedBy":"employee"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::employee.employee","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"employees"}}},"apiName":"employee","globalId":"Employee","uid":"api::employee.employee","modelType":"contentType","__schema__":{"collectionName":"employees","info":{"singularName":"employee","pluralName":"employees","displayName":"employee"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"employee_code":{"type":"string"},"full_name":{"type":"string"},"department":{"type":"string"},"team":{"type":"string"},"position":{"type":"string"},"activity_history":{"type":"integer"},"training_history":{"type":"string"},"type_group":{"type":"string"},"email":{"type":"email"},"emp_register_qccs":{"type":"relation","relation":"oneToMany","target":"api::emp-register-qcc.emp-register-qcc","mappedBy":"employee"}},"kind":"collectionType"},"modelName":"employee","actions":{},"lifecycles":{}},"api::register-qcc.register-qcc":{"kind":"collectionType","collectionName":"register_qccs","info":{"singularName":"register-qcc","pluralName":"register-qccs","displayName":"register-qcc"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"registration_date":{"type":"datetime"},"group_id":{"type":"string"},"department":{"type":"string"},"type_group":{"type":"string"},"name_team":{"type":"string"},"team_slogan":{"type":"string"},"group_advisor":{"type":"string"},"group_manager_primary":{"type":"string"},"group_manager_secondary":{"type":"string"},"type_of_routine_work":{"type":"string"},"status_qcc":{"type":"enumeration","enum":["IN_PROGRESS","SUBMITTED","APPROVED"]},"logo":{"type":"media","multiple":false,"allowedTypes":["images","files","videos","audios"]},"emp_register_qcc":{"type":"relation","relation":"oneToMany","target":"api::emp-register-qcc.emp-register-qcc","mappedBy":"register_qcc"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::register-qcc.register-qcc","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"register_qccs"}}},"apiName":"register-qcc","globalId":"RegisterQcc","uid":"api::register-qcc.register-qcc","modelType":"contentType","__schema__":{"collectionName":"register_qccs","info":{"singularName":"register-qcc","pluralName":"register-qccs","displayName":"register-qcc"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"registration_date":{"type":"datetime"},"group_id":{"type":"string"},"department":{"type":"string"},"type_group":{"type":"string"},"name_team":{"type":"string"},"team_slogan":{"type":"string"},"group_advisor":{"type":"string"},"group_manager_primary":{"type":"string"},"group_manager_secondary":{"type":"string"},"type_of_routine_work":{"type":"string"},"status_qcc":{"type":"enumeration","enum":["IN_PROGRESS","SUBMITTED","APPROVED"]},"logo":{"type":"media","multiple":false,"allowedTypes":["images","files","videos","audios"]},"emp_register_qcc":{"type":"relation","relation":"oneToMany","target":"api::emp-register-qcc.emp-register-qcc","mappedBy":"register_qcc"}},"kind":"collectionType"},"modelName":"register-qcc","actions":{},"lifecycles":{}},"api::team.team":{"kind":"collectionType","collectionName":"teams","info":{"singularName":"team","pluralName":"teams","displayName":"team"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"department":{"type":"relation","relation":"manyToOne","target":"api::department.department","inversedBy":"teams"},"type_group":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::team.team","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"teams"}}},"apiName":"team","globalId":"Team","uid":"api::team.team","modelType":"contentType","__schema__":{"collectionName":"teams","info":{"singularName":"team","pluralName":"teams","displayName":"team"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"department":{"type":"relation","relation":"manyToOne","target":"api::department.department","inversedBy":"teams"},"type_group":{"type":"string"}},"kind":"collectionType"},"modelName":"team","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
20	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
21	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
22	plugin_upload_metrics	{"weeklySchedule":"58 13 13 * * 5","lastWeeklyUpdate":1763705638060}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}]]},"uid":"admin::session"}	object	\N	\N
23	plugin_i18n_default_locale	"en"	string	\N	\N
24	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
25	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
26	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
28	ee_information	{"lastCheckAt":1761808474203,"license":"SS9Xc2NRTTd0WUFwUGpDdGxlQzVVNnFyb3AzUUU5ejBwY1FkUklGQm9QUVNndkFyaFpIUVN5QURaUHEza0psNGpsTUxwVXkxMENONlV3bDlDQU91K0pFV05DZ2MwZFRJQStwU0RtaCtMM01jVk90cS9NSGlodVB1MWpWN1E5ejRKSHFUSUJnd1l2RS9Nd1YvQ3doM084WExUQ2NYeU1YNTFZM1NkMGdkTnhtbzhBeHAxSGVmNGFrUDFrZzhxeFhTN2tPREt1L3ZBcG5IaHl3bG15TnFqSmQwZ3RHa1M0Tmt4ZmJNNW9mQnBJcWp0OXA1ZHgzc1RWUy9LRkZWMmsxem9BcVVUaXVESFhIaE5vZmswdVhzaEF2V3U4VHFWbXArcWczZ2I0R3RNc1ZIcDNseXZkVnZjUnAzckhYam5LWGN1c1ArRUdRb2ZkNXZ0cWZrTzVweTdnPT0KZXlKc2FXTmxibk5sUzJWNUlqb2laamhpWWprd1pUZ3RaVE00T1MwMFltUm1MV0psTTJNdFlUSTFZekF4TjJSbFlqSTNJaXdpZEhsd1pTSTZJbk5wYkhabGNpSXNJbWx6VkhKcFlXd2lPblJ5ZFdVc0ltVjRjR2x5WlVGMElqb3hOell4T1RneE1qYzRNVEkzTENKelpXRjBjeUk2TVRBd01Dd2labVZoZEhWeVpYTWlPbHQ3SW01aGJXVWlPaUp6YzI4aWZTeDdJbTVoYldVaU9pSmpiWE10WVdraUxDSnZjSFJwYjI1eklqcDdJbU55WldScGRITkNZWE5sSWpveE1Dd2lZM0psWkdsMGMwMWhlRlZ6WVdkbElqb3hNSDE5TEhzaWJtRnRaU0k2SW1OdGN5MWpiMjUwWlc1MExXaHBjM1J2Y25raUxDSnZjSFJwYjI1eklqcDdJbkpsZEdWdWRHbHZia1JoZVhNaU9qTXdmWDBzZXlKdVlXMWxJam9pWTIxekxXRmtkbUZ1WTJWa0xYQnlaWFpwWlhjaWZTeDdJbTVoYldVaU9pSmpiWE10WTI5dWRHVnVkQzF5Wld4bFlYTmxjeUlzSW05d2RHbHZibk1pT25zaWJXRjRhVzExYlZKbGJHVmhjMlZ6SWpvNU9UazVPVGw5ZlYwc0ltTjFjM1J2YldWeVNXUWlPaUpCZWxwU2NVZFdNVFZvYTJaclpIcFJJaXdpYzNWaWMyTnlhWEIwYVc5dVNXUWlPaUpCZWxwTE9XNVdNVFZwUjA5alpWTktJaXdpY0d4aGJsQnlhV05sU1dRaU9pSm5jbTkzZEdndGMzTnZMV05zYVMxMk1pMVZVMFF0VFc5dWRHaHNlU0o5"}	\N	\N	\N
30	core_persisted_tables	[{"name":"strapi_history_versions"}]	object	\N	\N
31	ee_disabled_users	[]	object	\N	\N
35	plugin_content_manager_configuration_content_types::api::register-qcc.register-qcc	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"group_id","defaultSortBy":"group_id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"registration_date":{"edit":{"label":"registration_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registration_date","searchable":true,"sortable":true}},"group_id":{"edit":{"label":"group_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"group_id","searchable":true,"sortable":true}},"department":{"edit":{"label":"department","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"department","searchable":true,"sortable":true}},"type_group":{"edit":{"label":"type_group","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type_group","searchable":true,"sortable":true}},"name_team":{"edit":{"label":"name_team","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name_team","searchable":true,"sortable":true}},"team_slogan":{"edit":{"label":"team_slogan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"team_slogan","searchable":true,"sortable":true}},"group_advisor":{"edit":{"label":"group_advisor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"group_advisor","searchable":true,"sortable":true}},"group_manager_primary":{"edit":{"label":"group_manager_primary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"group_manager_primary","searchable":true,"sortable":true}},"group_manager_secondary":{"edit":{"label":"group_manager_secondary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"group_manager_secondary","searchable":true,"sortable":true}},"type_of_routine_work":{"edit":{"label":"type_of_routine_work","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type_of_routine_work","searchable":true,"sortable":true}},"status_qcc":{"edit":{"label":"status_qcc","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status_qcc","searchable":true,"sortable":true}},"logo":{"edit":{"label":"logo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logo","searchable":false,"sortable":false}},"emp_register_qcc":{"edit":{"label":"emp_register_qcc","description":"","placeholder":"","visible":true,"editable":true,"mainField":"documentId"},"list":{"label":"emp_register_qcc","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","registration_date","group_id","department"],"edit":[[{"name":"registration_date","size":6},{"name":"group_id","size":6}],[{"name":"department","size":6},{"name":"type_group","size":6}],[{"name":"name_team","size":6},{"name":"team_slogan","size":6}],[{"name":"group_advisor","size":6}],[{"name":"type_of_routine_work","size":6}],[{"name":"status_qcc","size":6},{"name":"group_manager_primary","size":6}],[{"name":"group_manager_secondary","size":6}],[{"name":"logo","size":6}],[{"name":"emp_register_qcc","size":6}]]},"uid":"api::register-qcc.register-qcc"}	object	\N	\N
34	plugin_content_manager_configuration_content_types::api::employee.employee	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"employee_code","defaultSortBy":"employee_code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"employee_code":{"edit":{"label":"employee_code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"employee_code","searchable":true,"sortable":true}},"full_name":{"edit":{"label":"full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"full_name","searchable":true,"sortable":true}},"department":{"edit":{"label":"department","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"department","searchable":true,"sortable":true}},"team":{"edit":{"label":"team","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"team","searchable":true,"sortable":true}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"activity_history":{"edit":{"label":"activity_history","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"activity_history","searchable":true,"sortable":true}},"training_history":{"edit":{"label":"training_history","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"training_history","searchable":true,"sortable":true}},"type_group":{"edit":{"label":"type_group","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type_group","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"emp_register_qccs":{"edit":{"label":"emp_register_qccs","description":"","placeholder":"","visible":true,"editable":true,"mainField":"documentId"},"list":{"label":"emp_register_qccs","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","employee_code","full_name","department"],"edit":[[{"name":"employee_code","size":6},{"name":"full_name","size":6}],[{"name":"department","size":6},{"name":"team","size":6}],[{"name":"position","size":6}],[{"name":"activity_history","size":4},{"name":"training_history","size":6}],[{"name":"type_group","size":6},{"name":"email","size":6}],[{"name":"emp_register_qccs","size":6}]]},"uid":"api::employee.employee"}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::team.team	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"department":{"edit":{"label":"department","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"department","searchable":true,"sortable":true}},"type_group":{"edit":{"label":"type_group","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type_group","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["name","department","type_group"],"edit":[[{"name":"name","size":6}],[{"name":"department","size":6},{"name":"type_group","size":6}]]},"uid":"api::team.team"}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::department.department	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortOrder":"ASC","defaultSortBy":"name"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"teams":{"edit":{"label":"teams","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"teams","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["name","teams"],"edit":[[{"name":"name","size":6},{"name":"teams","size":6}]]},"uid":"api::department.department"}	object	\N	\N
36	plugin_content_manager_configuration_content_types::api::emp-register-qcc.emp-register-qcc	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"register_qcc":{"edit":{"label":"register_qcc","description":"","placeholder":"","visible":true,"editable":true,"mainField":"group_id"},"list":{"label":"register_qcc","searchable":true,"sortable":true}},"employee":{"edit":{"label":"employee","description":"","placeholder":"","visible":true,"editable":true,"mainField":"employee_code"},"list":{"label":"employee","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"position","size":6},{"name":"register_qcc","size":6}],[{"name":"employee","size":6}]]},"uid":"api::emp-register-qcc.emp-register-qcc"}	object	\N	\N
\.


--
-- TOC entry 5331 (class 0 OID 16581)
-- Dependencies: 222
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
44	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"departments","indexes":[{"name":"departments_documents_idx","columns":["document_id","locale","published_at"]},{"name":"departments_created_by_id_fk","columns":["created_by_id"]},{"name":"departments_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"departments_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"departments_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"emp_register_qccs","indexes":[{"name":"emp_register_qccs_documents_idx","columns":["document_id","locale","published_at"]},{"name":"emp_register_qccs_created_by_id_fk","columns":["created_by_id"]},{"name":"emp_register_qccs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"emp_register_qccs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"emp_register_qccs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"employees","indexes":[{"name":"employees_documents_idx","columns":["document_id","locale","published_at"]},{"name":"employees_created_by_id_fk","columns":["created_by_id"]},{"name":"employees_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"employees_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"employees_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"employee_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"department","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"team","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"activity_history","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"training_history","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type_group","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"register_qccs","indexes":[{"name":"register_qccs_documents_idx","columns":["document_id","locale","published_at"]},{"name":"register_qccs_created_by_id_fk","columns":["created_by_id"]},{"name":"register_qccs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"register_qccs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"register_qccs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"department","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type_group","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name_team","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"team_slogan","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group_advisor","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group_manager_primary","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"group_manager_secondary","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type_of_routine_work","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status_qcc","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"teams","indexes":[{"name":"teams_documents_idx","columns":["document_id","locale","published_at"]},{"name":"teams_created_by_id_fk","columns":["created_by_id"]},{"name":"teams_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"teams_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"teams_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type_group","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"emp_register_qccs_register_qcc_lnk","indexes":[{"name":"emp_register_qccs_register_qcc_lnk_fk","columns":["emp_register_qcc_id"]},{"name":"emp_register_qccs_register_qcc_lnk_ifk","columns":["register_qcc_id"]},{"name":"emp_register_qccs_register_qcc_lnk_uq","columns":["emp_register_qcc_id","register_qcc_id"],"type":"unique"},{"name":"emp_register_qccs_register_qcc_lnk_oifk","columns":["emp_register_qcc_ord"]}],"foreignKeys":[{"name":"emp_register_qccs_register_qcc_lnk_fk","columns":["emp_register_qcc_id"],"referencedColumns":["id"],"referencedTable":"emp_register_qccs","onDelete":"CASCADE"},{"name":"emp_register_qccs_register_qcc_lnk_ifk","columns":["register_qcc_id"],"referencedColumns":["id"],"referencedTable":"register_qccs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"emp_register_qcc_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"register_qcc_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"emp_register_qcc_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"emp_register_qccs_employee_lnk","indexes":[{"name":"emp_register_qccs_employee_lnk_fk","columns":["emp_register_qcc_id"]},{"name":"emp_register_qccs_employee_lnk_ifk","columns":["employee_id"]},{"name":"emp_register_qccs_employee_lnk_uq","columns":["emp_register_qcc_id","employee_id"],"type":"unique"},{"name":"emp_register_qccs_employee_lnk_oifk","columns":["emp_register_qcc_ord"]}],"foreignKeys":[{"name":"emp_register_qccs_employee_lnk_fk","columns":["emp_register_qcc_id"],"referencedColumns":["id"],"referencedTable":"emp_register_qccs","onDelete":"CASCADE"},{"name":"emp_register_qccs_employee_lnk_ifk","columns":["employee_id"],"referencedColumns":["id"],"referencedTable":"employees","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"emp_register_qcc_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"employee_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"emp_register_qcc_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"teams_department_lnk","indexes":[{"name":"teams_department_lnk_fk","columns":["team_id"]},{"name":"teams_department_lnk_ifk","columns":["department_id"]},{"name":"teams_department_lnk_uq","columns":["team_id","department_id"],"type":"unique"},{"name":"teams_department_lnk_oifk","columns":["team_ord"]}],"foreignKeys":[{"name":"teams_department_lnk_fk","columns":["team_id"],"referencedColumns":["id"],"referencedTable":"teams","onDelete":"CASCADE"},{"name":"teams_department_lnk_ifk","columns":["department_id"],"referencedColumns":["id"],"referencedTable":"departments","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"team_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"department_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"team_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2025-11-21 16:19:39.532	169428a05c4fecb91a59e8623679a0903109d51168f25f15e0c8a86c8b08cc13
\.


--
-- TOC entry 5373 (class 0 OID 16834)
-- Dependencies: 264
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- TOC entry 5327 (class 0 OID 16567)
-- Dependencies: 218
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- TOC entry 5329 (class 0 OID 16574)
-- Dependencies: 220
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2025-10-16 09:53:03.187
2	5.0.0-02-created-document-id	2025-10-16 09:53:03.258
3	5.0.0-03-created-locale	2025-10-16 09:53:03.327
4	5.0.0-04-created-published-at	2025-10-16 09:53:03.397
5	5.0.0-05-drop-slug-fields-index	2025-10-16 09:53:03.468
6	core::5.0.0-discard-drafts	2025-10-16 09:53:03.54
7	content-releases::5.0.0-add-entry-document-id-to-release-actions	2025-10-30 14:14:33.485
\.


--
-- TOC entry 5341 (class 0 OID 16648)
-- Dependencies: 232
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 5381 (class 0 OID 16880)
-- Dependencies: 272
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- TOC entry 5339 (class 0 OID 16636)
-- Dependencies: 230
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5367 (class 0 OID 16804)
-- Dependencies: 258
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	s3h9ewsqkrntykgsg1da9mhf	1	b65e5e1b738acb8b9d1e19022f3a4159	\N	aa134194-7f54-4a46-b6a1-6f6e7905bf4d	admin	2025-10-16 11:56:18.426	2025-11-15 09:56:18.426	active	session	2025-10-16 09:56:18.427	2025-10-16 09:56:18.427	2025-10-16 09:56:18.428	\N	\N	\N
2	chnbsnhw4vattrr8el18hk2m	1	b7afdcd25272540a1bf714cd72dbc1f5	\N	ca4be7c9-33f6-4e7c-a44c-9a5d8fbe1c13	admin	2025-10-16 11:58:32.392	2025-11-15 09:58:32.392	active	session	2025-10-16 09:58:32.393	2025-10-16 09:58:32.393	2025-10-16 09:58:32.395	\N	\N	\N
3	lu1qjrooeld491tzv6gs8ndy	1	dc00f5b67e20af1898b8bb9e946279eb	3a318b2cc41fec548fdc156a4174e22e	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-13 14:22:33.853	2025-11-29 14:22:33.853	rotated	refresh	2025-10-30 14:22:33.854	2025-10-30 14:53:27.549	2025-10-30 14:22:33.856	\N	\N	\N
5	lxi4wm7ll46a3k4uyt5vj697	1	3a318b2cc41fec548fdc156a4174e22e	2d3f8c6659d6b92f48f1fe1b161830a2	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-13 14:53:27.54	2025-11-29 14:22:33.853	rotated	refresh	2025-10-30 14:53:27.54	2025-10-31 13:35:21.05	2025-10-30 14:53:27.542	\N	\N	\N
4	n1jc3gz862r205taurf506yz	1	3a30794cb90e9a5ecbe0c5bd6651d9a6	17325279ed5dcb102b4f91a1450a5a4f	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-13 14:46:29.55	2025-11-29 14:46:29.55	rotated	refresh	2025-10-30 14:46:29.55	2025-10-31 14:12:31.83	2025-10-30 14:46:29.551	\N	\N	\N
6	e922jnjxhv1mipcuawiv90jv	1	2d3f8c6659d6b92f48f1fe1b161830a2	b87293864e91b0dfce1e078c59fafcb4	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-14 13:35:21.041	2025-11-29 14:22:33.853	rotated	refresh	2025-10-31 13:35:21.041	2025-10-31 14:17:46.899	2025-10-31 13:35:21.042	\N	\N	\N
7	lpr7st623q4p9pbfbyjqi6fh	1	17325279ed5dcb102b4f91a1450a5a4f	9918f2e0d297839018945815367cc938	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-14 14:12:31.822	2025-11-29 14:46:29.55	rotated	refresh	2025-10-31 14:12:31.822	2025-10-31 14:44:18.993	2025-10-31 14:12:31.823	\N	\N	\N
9	zmvi05btv20pmfj88fo9j7f7	1	9918f2e0d297839018945815367cc938	d1e55291d632478aaec03f2ed13bcce4	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-14 14:44:18.927	2025-11-29 14:46:29.55	rotated	refresh	2025-10-31 14:44:18.928	2025-10-31 15:14:46.512	2025-10-31 14:44:18.934	\N	\N	\N
8	u1858fk7kp2a39t2t9qd1u56	1	b87293864e91b0dfce1e078c59fafcb4	6ab7ef93e3ce2eabaa4d75524d439122	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-14 14:17:46.885	2025-11-29 14:22:33.853	rotated	refresh	2025-10-31 14:17:46.886	2025-10-31 15:39:20.484	2025-10-31 14:17:46.889	\N	\N	\N
11	q9us3xms6hlus2tcn2bbj13n	1	6ab7ef93e3ce2eabaa4d75524d439122	ab5d5baea51aebc4e499d322a1ad50a8	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-14 15:39:20.46	2025-11-29 14:22:33.853	rotated	refresh	2025-10-31 15:39:20.461	2025-10-31 16:22:41.452	2025-10-31 15:39:20.461	\N	\N	\N
10	uj3bo6bddmoaompdfr5y192a	1	d1e55291d632478aaec03f2ed13bcce4	d183e523b5dbd7a90ee752ba9fd3d7de	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-14 15:14:46.454	2025-11-29 14:46:29.55	rotated	refresh	2025-10-31 15:14:46.455	2025-11-04 13:26:22.277	2025-10-31 15:14:46.459	\N	\N	\N
12	xaam8ud9pgkci4u3wdmd0rau	1	ab5d5baea51aebc4e499d322a1ad50a8	543ddd293911cac10ca2e5136f834966	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-14 16:22:41.438	2025-11-29 14:22:33.853	rotated	refresh	2025-10-31 16:22:41.439	2025-11-04 14:27:55.824	2025-10-31 16:22:41.439	\N	\N	\N
14	qan97i8cgcq3r06rdqp0gu14	1	543ddd293911cac10ca2e5136f834966	df405c975aeb2e71890f1631f0f11106	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 14:27:55.808	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 14:27:55.809	2025-11-04 15:00:28.174	2025-11-04 14:27:55.813	\N	\N	\N
13	ni8mabg1cr82u1ubc3caiwfi	1	d183e523b5dbd7a90ee752ba9fd3d7de	e8cc48cfa5febfff1148241cae1e3509	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-18 13:26:22.27	2025-11-29 14:46:29.55	rotated	refresh	2025-11-04 13:26:22.27	2025-11-04 15:11:05.748	2025-11-04 13:26:22.271	\N	\N	\N
15	rab0hm5pus6rjnfkwhszewyl	1	df405c975aeb2e71890f1631f0f11106	4693b26fdf1e793f4e48e1bb529b152e	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 15:00:28.159	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 15:00:28.16	2025-11-04 15:55:17.269	2025-11-04 15:00:28.164	\N	\N	\N
16	u4qejhq3jo6xjkdsr263ep0g	1	e8cc48cfa5febfff1148241cae1e3509	a1abf2422cc25b66921c6ef44b705adb	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-18 15:11:05.734	2025-11-29 14:46:29.55	rotated	refresh	2025-11-04 15:11:05.734	2025-11-04 16:19:00.883	2025-11-04 15:11:05.736	\N	\N	\N
17	fa6lvui38ui7tpqlr5go1ewb	1	4693b26fdf1e793f4e48e1bb529b152e	e7ff9980d9fc40166e5cd9843833dee8	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 15:55:17.251	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 15:55:17.252	2025-11-04 16:25:49.037	2025-11-04 15:55:17.257	\N	\N	\N
19	mwzz03bjiexlezvoj70co8qm	1	e7ff9980d9fc40166e5cd9843833dee8	61f80926c5cc7e7a57293ae15626023c	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 16:25:49.013	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 16:25:49.014	2025-11-04 16:55:53.498	2025-11-04 16:25:49.017	\N	\N	\N
20	m7bwmpj6bhmk31mhusanrb3w	1	61f80926c5cc7e7a57293ae15626023c	d60df7bfdbabfbc682c2b08abfe7c758	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 16:55:53.487	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 16:55:53.487	2025-11-04 17:26:45.414	2025-11-04 16:55:53.488	\N	\N	\N
21	h0ov6stf73ms0agvtdlvai1t	1	d60df7bfdbabfbc682c2b08abfe7c758	33c77846c2c35bb94e4bb34e379d4c8d	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 17:26:45.4	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 17:26:45.401	2025-11-04 18:20:05.004	2025-11-04 17:26:45.402	\N	\N	\N
22	lhwct5rx2kamlqf5ax4ucpfi	1	33c77846c2c35bb94e4bb34e379d4c8d	7c8de48219dd0c32a47fa6e4cf89eb10	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 18:20:04.993	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 18:20:04.993	2025-11-04 19:09:29.693	2025-11-04 18:20:04.993	\N	\N	\N
23	v705wgnpm9myldop2ey3vxd8	1	7c8de48219dd0c32a47fa6e4cf89eb10	82315bb631c20ac531ccaad2307c3362	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-18 19:09:29.68	2025-11-29 14:22:33.853	rotated	refresh	2025-11-04 19:09:29.681	2025-11-05 11:50:18.735	2025-11-04 19:09:29.682	\N	\N	\N
18	nza9s9px8y5kg3sk3wgbi324	1	a1abf2422cc25b66921c6ef44b705adb	94f97019c208372cd15a5aa546c8f18a	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-18 16:19:00.848	2025-11-29 14:46:29.55	rotated	refresh	2025-11-04 16:19:00.848	2025-11-05 11:51:10.404	2025-11-04 16:19:00.852	\N	\N	\N
24	weg7nw8sfjhcaiho37h0vmy4	1	82315bb631c20ac531ccaad2307c3362	ce28b4e58c015d9c2c3c1cbde3507672	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-19 11:50:18.725	2025-11-29 14:22:33.853	rotated	refresh	2025-11-05 11:50:18.725	2025-11-05 12:33:46.837	2025-11-05 11:50:18.727	\N	\N	\N
26	anq45vd150a7085cn6yq8ku5	1	ce28b4e58c015d9c2c3c1cbde3507672	6ab82cc5cb0d5ff6077e4249c0c1e4f7	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-19 12:33:46.827	2025-11-29 14:22:33.853	rotated	refresh	2025-11-05 12:33:46.827	2025-11-05 13:34:35.009	2025-11-05 12:33:46.829	\N	\N	\N
27	pwbpterzcvrwv6y25iuas8w5	1	6ab82cc5cb0d5ff6077e4249c0c1e4f7	056828976c7d24627e4509066d051823	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-19 13:34:34.998	2025-11-29 14:22:33.853	rotated	refresh	2025-11-05 13:34:34.999	2025-11-05 14:18:44.496	2025-11-05 13:34:35	\N	\N	\N
25	g7bvgwuuc03rrdtcjjmtts55	1	94f97019c208372cd15a5aa546c8f18a	d57140b1fe5f249815de7adc00148e88	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-19 11:51:10.395	2025-11-29 14:46:29.55	rotated	refresh	2025-11-05 11:51:10.395	2025-11-05 14:25:19.962	2025-11-05 11:51:10.396	\N	\N	\N
28	ldug0wsjwk8wj5ik0dnoak3l	1	056828976c7d24627e4509066d051823	3414b934a59c09496509ea5ace32ed77	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-19 14:18:44.488	2025-11-29 14:22:33.853	rotated	refresh	2025-11-05 14:18:44.489	2025-11-05 15:06:49.316	2025-11-05 14:18:44.49	\N	\N	\N
30	hfp8qxpe07d44p5m2cqhv48l	1	3414b934a59c09496509ea5ace32ed77	c5558bb30fec1347c3e5c6a860c3fefc	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-19 15:06:49.306	2025-11-29 14:22:33.853	rotated	refresh	2025-11-05 15:06:49.306	2025-11-06 09:29:18.425	2025-11-05 15:06:49.307	\N	\N	\N
31	cl8rkhwd45egmd8dg30m4oa6	1	c5558bb30fec1347c3e5c6a860c3fefc	036b55213ee64ead983226b8be3812a4	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-20 09:29:18.408	2025-11-29 14:22:33.853	rotated	refresh	2025-11-06 09:29:18.408	2025-11-06 10:03:24.671	2025-11-06 09:29:18.409	\N	\N	\N
32	rey4k9srezhqhcwsr2i96y99	1	036b55213ee64ead983226b8be3812a4	5002d053249329fce95862d8b3d113a3	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-20 10:03:24.657	2025-11-29 14:22:33.853	rotated	refresh	2025-11-06 10:03:24.657	2025-11-06 10:38:15.208	2025-11-06 10:03:24.658	\N	\N	\N
29	yxx7yrwfh1sewn0uohis325a	1	d57140b1fe5f249815de7adc00148e88	1157b39d2da3ff2b68ae72d81969a8ad	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-19 14:25:19.95	2025-11-29 14:46:29.55	rotated	refresh	2025-11-05 14:25:19.95	2025-11-07 10:43:18.429	2025-11-05 14:25:19.951	\N	\N	\N
34	is8suv8rj3pzph969chd1vhl	1	7e9fae920f021e288dbd2ce0c5982dc0	3d50b8d2d7201f304cc1f6f4cd77e1bc	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-20 11:30:35.659	2025-11-29 14:22:33.853	rotated	refresh	2025-11-06 11:30:35.659	2025-11-14 13:37:36.145	2025-11-06 11:30:35.66	\N	\N	\N
33	qe7w26nqno03p1tsfadw38dr	1	5002d053249329fce95862d8b3d113a3	7e9fae920f021e288dbd2ce0c5982dc0	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-20 10:38:15.197	2025-11-29 14:22:33.853	rotated	refresh	2025-11-06 10:38:15.197	2025-11-06 11:30:35.671	2025-11-06 10:38:15.198	\N	\N	\N
35	wf0deurjtl7m3ksmg9ghj73b	1	1157b39d2da3ff2b68ae72d81969a8ad	cbb6166b3a35399ef8461d13b7569cc6	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-21 10:43:18.41	2025-11-29 14:46:29.55	rotated	refresh	2025-11-07 10:43:18.411	2025-11-14 13:14:06.739	2025-11-07 10:43:18.412	\N	\N	\N
36	i9hq8kt5qpnok8vxgq3zt39s	1	cbb6166b3a35399ef8461d13b7569cc6	e7eb40e8241982269a3d85624470ec7e	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-28 13:14:06.701	2025-11-29 14:46:29.55	rotated	refresh	2025-11-14 13:14:06.701	2025-11-14 13:53:27.988	2025-11-14 13:14:06.705	\N	\N	\N
38	ifa32u5wy0fnu2tc4v7op1ou	1	e7eb40e8241982269a3d85624470ec7e	bd9573af9400d1b4ff22c97d89b85830	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-28 13:53:27.957	2025-11-29 14:46:29.55	rotated	refresh	2025-11-14 13:53:27.957	2025-11-14 15:36:31.058	2025-11-14 13:53:27.961	\N	\N	\N
37	rvxt2dm93tjnyvn3678ahq1v	1	3d50b8d2d7201f304cc1f6f4cd77e1bc	1c6ad65ab4c3d5400ee811dbe9e9891b	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-11-28 13:37:36.128	2025-11-29 14:22:33.853	rotated	refresh	2025-11-14 13:37:36.128	2025-11-17 10:48:22.009	2025-11-14 13:37:36.134	\N	\N	\N
39	gsao5zw1839ir3wjpec20j70	1	bd9573af9400d1b4ff22c97d89b85830	80c54316c2e7abda8bf8a44810d62041	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-11-28 15:36:31	2025-11-29 14:46:29.55	rotated	refresh	2025-11-14 15:36:31.001	2025-11-18 15:52:23.188	2025-11-14 15:36:31.009	\N	\N	\N
40	drjpw23yyhxcu9gdx5aq6j73	1	1c6ad65ab4c3d5400ee811dbe9e9891b	8eacf30417cdbeb128163ea4114bfdd2	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-01 10:48:21.988	2025-11-29 14:22:33.853	rotated	refresh	2025-11-17 10:48:21.989	2025-11-19 10:19:36.939	2025-11-17 10:48:21.995	\N	\N	\N
42	f312h4azpj15yl4cvnxwimgy	1	8eacf30417cdbeb128163ea4114bfdd2	168dbea630ffb9a80af2dd863428370b	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-03 10:19:36.925	2025-11-29 14:22:33.853	rotated	refresh	2025-11-19 10:19:36.926	2025-11-19 10:51:05.148	2025-11-19 10:19:36.928	\N	\N	\N
43	xjqdjg916dhv9trvguln4faz	1	168dbea630ffb9a80af2dd863428370b	a0746e6b52e9d9473c68fe821a2324c2	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-03 10:51:05.133	2025-11-29 14:22:33.853	rotated	refresh	2025-11-19 10:51:05.133	2025-11-19 11:48:27.648	2025-11-19 10:51:05.138	\N	\N	\N
41	bsfj4n1mdvik0r3f3e5nkcpg	1	80c54316c2e7abda8bf8a44810d62041	2edeb482121fbc185382df9953f78fc5	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-02 15:52:23.167	2025-11-29 14:46:29.55	rotated	refresh	2025-11-18 15:52:23.167	2025-11-19 16:50:15.356	2025-11-18 15:52:23.173	\N	\N	\N
45	j95rpefrt8h7tb6edo5213w0	1	2edeb482121fbc185382df9953f78fc5	65a61dc46927cba6488c6b43b42f1f4d	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-03 16:50:15.345	2025-11-29 14:46:29.55	rotated	refresh	2025-11-19 16:50:15.345	2025-11-20 14:12:23.568	2025-11-19 16:50:15.346	\N	\N	\N
44	ohl7j8vbtvpa550y7rjeuhxe	1	a0746e6b52e9d9473c68fe821a2324c2	e5a76d9c0054ba7794c8d4ee2f93bfe4	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-03 11:48:27.629	2025-11-29 14:22:33.853	rotated	refresh	2025-11-19 11:48:27.63	2025-11-20 14:26:30.374	2025-11-19 11:48:27.631	\N	\N	\N
47	m82ukz2gcze6xnnbis0meset	1	e5a76d9c0054ba7794c8d4ee2f93bfe4	3a3ee1bc95bf4598d15bab0a9208f182	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-04 14:26:30.363	2025-11-29 14:22:33.853	rotated	refresh	2025-11-20 14:26:30.363	2025-11-20 14:58:51.818	2025-11-20 14:26:30.365	\N	\N	\N
49	mmz93oc8dums1blx5kl6h4lg	1	33cfd3f2dec2cf6e8f2efbe5c4557d30	\N	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-04 15:45:15.413	2025-11-29 14:22:33.853	active	refresh	2025-11-20 15:45:15.414	2025-11-20 15:45:15.414	2025-11-20 15:45:15.415	\N	\N	\N
48	whplypwn3yozwb4ypmv29jtw	1	3a3ee1bc95bf4598d15bab0a9208f182	33cfd3f2dec2cf6e8f2efbe5c4557d30	e7dc2af6-cbd7-4796-9c51-fc632e39c7a4	admin	2025-12-04 14:58:51.803	2025-11-29 14:22:33.853	rotated	refresh	2025-11-20 14:58:51.804	2025-11-20 15:45:15.424	2025-11-20 14:58:51.806	\N	\N	\N
46	ye74pr1z3hwfw2vagd7d57kx	1	65a61dc46927cba6488c6b43b42f1f4d	534156a00a815bd21ef084f80c405148	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-04 14:12:23.529	2025-11-29 14:46:29.55	rotated	refresh	2025-11-20 14:12:23.53	2025-11-21 10:24:44.403	2025-11-20 14:12:23.537	\N	\N	\N
50	rh2yc6leioa9q55k1iomhf2y	1	534156a00a815bd21ef084f80c405148	a2ba0cd846366e1eff62edeceeb8b938	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 10:24:44.392	2025-11-29 14:46:29.55	rotated	refresh	2025-11-21 10:24:44.392	2025-11-21 11:06:50.654	2025-11-21 10:24:44.393	\N	\N	\N
51	e3qlpi9dn0w272rad630ipr5	1	a2ba0cd846366e1eff62edeceeb8b938	2b4fd87b8ab84d8081ddb52aceb0b28e	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 11:06:50.636	2025-11-29 14:46:29.55	rotated	refresh	2025-11-21 11:06:50.637	2025-11-21 11:48:58.873	2025-11-21 11:06:50.641	\N	\N	\N
52	k7qbgn86h8l9kiy2kjo3mnec	1	2b4fd87b8ab84d8081ddb52aceb0b28e	206c941730d3847a5dfe256d24829903	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 11:48:58.854	2025-11-29 14:46:29.55	rotated	refresh	2025-11-21 11:48:58.855	2025-11-21 13:04:07.869	2025-11-21 11:48:58.859	\N	\N	\N
53	kctja3hzqja4lxex6yc5cecq	1	206c941730d3847a5dfe256d24829903	358f71179e8e6adb3cf1de1d01b65fbb	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 13:04:07.855	2025-11-29 14:46:29.55	rotated	refresh	2025-11-21 13:04:07.855	2025-11-21 15:42:32.226	2025-11-21 13:04:07.856	\N	\N	\N
55	ys9yu2hwcdu3oxrnlr8ytq4y	1	12821441a84b452698e6294ea0acf94a	\N	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 16:16:19.74	2025-11-29 14:46:29.55	active	refresh	2025-11-21 16:16:19.741	2025-11-21 16:16:19.741	2025-11-21 16:16:19.742	\N	\N	\N
54	h7ljd8yfsun8yayrxy5k4quy	1	358f71179e8e6adb3cf1de1d01b65fbb	12821441a84b452698e6294ea0acf94a	bd6e058c-0758-4b2f-b316-6e6f4c743fb5	admin	2025-12-05 15:42:32.19	2025-11-29 14:46:29.55	rotated	refresh	2025-11-21 15:42:32.191	2025-11-21 16:16:19.769	2025-11-21 15:42:32.195	\N	\N	\N
\.


--
-- TOC entry 5365 (class 0 OID 16792)
-- Dependencies: 256
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5399 (class 0 OID 16988)
-- Dependencies: 290
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- TOC entry 5363 (class 0 OID 16780)
-- Dependencies: 254
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5371 (class 0 OID 16825)
-- Dependencies: 262
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- TOC entry 5343 (class 0 OID 16660)
-- Dependencies: 234
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5383 (class 0 OID 16892)
-- Dependencies: 274
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- TOC entry 5345 (class 0 OID 16672)
-- Dependencies: 236
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5387 (class 0 OID 16915)
-- Dependencies: 278
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- TOC entry 5385 (class 0 OID 16903)
-- Dependencies: 276
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- TOC entry 5409 (class 0 OID 17577)
-- Dependencies: 300
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, document_id, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, type_group) FROM stdin;
56	yks85dccmrlvs6cxfrkxyhzu	PC	2025-11-04 16:44:59.206	2025-11-05 13:36:42.411	\N	1	1	\N	Sup
153	yks85dccmrlvs6cxfrkxyhzu	PC	2025-11-04 16:44:59.206	2025-11-05 13:36:42.411	2025-11-05 13:36:42.448	1	1	\N	Sup
72	cflkexj3252s8qp2quu3ssdj	PK	2025-11-04 16:48:32.63	2025-11-05 13:36:53.461	\N	1	1	\N	Sup
105	nm0ggmv7zc6sl6q8hsudluxi	PU1	2025-11-04 16:59:14.38	2025-11-05 13:37:12.049	\N	1	1	\N	Non
155	nm0ggmv7zc6sl6q8hsudluxi	PU1	2025-11-04 16:59:14.38	2025-11-05 13:37:12.049	2025-11-05 13:37:12.076	1	1	\N	Non
107	d9zhffje21congukstdnnf8o	PU2	2025-11-04 16:59:37.821	2025-11-05 13:37:24.889	\N	1	1	\N	Non
156	d9zhffje21congukstdnnf8o	PU2	2025-11-04 16:59:37.821	2025-11-05 13:37:24.889	2025-11-05 13:37:24.911	1	1	\N	Non
61	c4bf6ysgrdh42dpkom73bx9a	Q-Gate	2025-11-04 16:46:13.842	2025-11-05 13:37:51.136	\N	1	1	\N	Sup
85	bn4b6bf1f4qvwz0z7jkpivm2	QA	2025-11-04 16:51:20.677	2025-11-05 13:38:03.155	\N	1	1	\N	Sup
159	bn4b6bf1f4qvwz0z7jkpivm2	QA	2025-11-04 16:51:20.677	2025-11-05 13:38:03.155	2025-11-05 13:38:03.176	1	1	\N	Sup
87	qfe4uvzjl041997tf9uocrts	QC1	2025-11-04 16:51:43.168	2025-11-05 13:38:13.47	\N	1	1	\N	Sup
99	zuasmf13ggljdjotov2kopln	EL	2025-11-04 16:56:09.848	2025-11-05 12:51:00.779	\N	1	1	\N	Sup
89	e9yozpo5jlx9044rtr1a3v92	QC2	2025-11-04 16:52:10.986	2025-11-05 13:38:24.364	\N	1	1	\N	Sup
161	e9yozpo5jlx9044rtr1a3v92	QC2	2025-11-04 16:52:10.986	2025-11-05 13:38:24.364	2025-11-05 13:38:24.402	1	1	\N	Sup
119	gs7i165ric7grc61tddx1rdm	SC	2025-11-04 17:03:49.397	2025-11-05 13:38:34.514	\N	1	1	\N	Non
115	xw5gx4urwtvvkuxzlga4ml7i	SF	2025-11-04 17:01:32.697	2025-11-05 13:38:51.743	\N	1	1	\N	Sup
22	bc0om4305uu49gsa1tz9jbhz	M8	2025-11-04 16:35:22.301	2025-11-05 13:35:28.114	\N	1	1	\N	Pro
163	xw5gx4urwtvvkuxzlga4ml7i	SF	2025-11-04 17:01:32.697	2025-11-05 13:38:51.743	2025-11-05 13:38:51.766	1	1	\N	Sup
109	z205urvhb3ktm0l2cnns9ogd	SL1	2025-11-04 17:00:01.486	2025-11-05 13:39:02.951	\N	1	1	\N	Non
164	z205urvhb3ktm0l2cnns9ogd	SL1	2025-11-04 17:00:01.486	2025-11-05 13:39:02.951	2025-11-05 13:39:02.989	1	1	\N	Non
111	dmnudn97l55u54uhpu6kk60r	SL2	2025-11-04 17:00:25.122	2025-11-05 13:39:16.359	\N	1	1	\N	Non
165	dmnudn97l55u54uhpu6kk60r	SL2	2025-11-04 17:00:25.122	2025-11-05 13:39:16.359	2025-11-05 13:39:16.38	1	1	\N	Non
78	rrp957ft47dqwo471l31gb71	ST	2025-11-04 16:50:06.805	2025-11-05 13:39:30.889	\N	1	1	\N	Sup
70	mi92ez08k8awm7whhgz8jwc1	TP	2025-11-04 16:48:10.045	2025-11-05 13:39:43.667	\N	1	1	\N	Sup
91	wx5pzi62r5361zdbexvjewl2	UB	2025-11-04 16:53:21.89	2025-11-05 13:39:54.622	\N	1	1	\N	Pro
103	eg90q4f2z8y1vffaba72w14h	US	2025-11-04 16:56:57.787	2025-11-05 13:40:06.82	\N	1	1	\N	Sup
42	qsrb9b3h8002oefe1w8ca9v3	WB	2025-11-04 16:40:17.841	2025-11-05 13:40:17.769	\N	1	1	\N	Pro
170	qsrb9b3h8002oefe1w8ca9v3	WB	2025-11-04 16:40:17.841	2025-11-05 13:40:17.769	2025-11-05 13:40:17.801	1	1	\N	Pro
93	sq0yij35kuud1gw1j0owp13v	JM	2025-11-04 16:53:47.633	2025-11-05 12:55:45.057	\N	1	1	\N	Pro
101	y8ltitqw95u861jae7qosjw9	MC	2025-11-04 16:56:38.591	2025-11-05 13:35:39.508	\N	1	1	\N	Sup
95	hnobxih5m3lr3cm6sf1oyexq	JA	2025-11-04 16:55:07.946	2025-11-05 12:53:06.97	\N	1	1	\N	Pro
6	yp5abinmcne47xnmbgy170y0	BZ	2025-11-04 16:26:25.058	2025-11-05 12:50:06.072	\N	1	1	\N	Pro
68	qabwruyqsn0jqxce4npieet3	CB	2025-11-04 16:47:45.91	2025-11-05 12:50:21.152	\N	1	1	\N	Sup
13	ohkvo07g6ov77f422mkhj2ux	EG	2025-11-04 16:33:10.466	2025-11-05 12:50:47.11	\N	1	1	\N	Pro
54	uiapamzvco0poylfqu9txb3n	EN	2025-11-04 16:44:09.98	2025-11-05 12:51:11.951	\N	1	1	\N	Sup
59	f1rqmngjygh0jnqbbgf9yu4j	FC	2025-11-04 16:45:42.49	2025-11-05 12:51:23.598	\N	1	1	\N	Sup
52	c52cijavehy8b7843wnlgwuc	FDM	2025-11-04 16:43:46.936	2025-11-05 12:51:36.677	\N	1	1	\N	Sup
8	hydpgl47ggb5ne1qqvrcgo06	GM	2025-11-04 16:27:12.236	2025-11-05 12:52:14.208	\N	1	1	\N	Pro
117	n4bxr0ysm4jxh5jmtf90bwb0	HR	2025-11-04 17:03:12.496	2025-11-05 12:52:26.72	\N	1	1	\N	Non
80	yro6125h31s75bcrp4fcz13j	IP	2025-11-04 16:50:31.608	2025-11-05 12:52:39.593	\N	1	1	\N	Sup
26	hbgsnt7xjao8yebrveyx88l4	IT	2025-11-04 16:36:08.315	2025-11-05 12:52:54.233	\N	1	1	\N	Non
45	xndevm88xuvh3i3n2265683d	JC	2025-11-04 16:41:17.323	2025-11-05 12:53:21.519	\N	1	1	\N	Pro
97	dem9zkd9y5uttlyzqan99taa	JP	2025-11-04 16:55:40.7	2025-11-05 13:34:45.683	\N	1	1	\N	Pro
16	i3y9gkp6okoofbq3gcnub3wv	M10	2025-11-04 16:33:46.745	2025-11-05 13:34:58.336	\N	1	1	\N	Pro
20	ww6g6rj8ai60pczuhqbesefi	M6	2025-11-04 16:35:04.947	2025-11-05 13:35:12.913	\N	1	1	\N	Pro
48	gek15er1ik0k0tx5rftym91s	MI	2025-11-04 16:42:53.269	2025-11-05 13:35:50.539	\N	1	1	\N	Sup
10	zx1waecj4mqv07yuzyjbiopo	NT	2025-11-04 16:32:10.787	2025-11-05 13:36:02.123	\N	1	1	\N	Pro
24	w7p4j1u5wa9wvdfgr00nvx01	OQ	2025-11-04 16:35:46.395	2025-11-05 13:36:14.969	\N	1	1	\N	Pro
76	xtapyqqi0kxmcmwk0h4haqn5	OR	2025-11-04 16:49:32.674	2025-11-05 13:36:28.286	\N	1	1	\N	Non
154	cflkexj3252s8qp2quu3ssdj	PK	2025-11-04 16:48:32.63	2025-11-05 13:36:53.461	2025-11-05 13:36:53.48	1	1	\N	Sup
125	yf5wzzl7ybp5highv4p5lgd2	TC	2025-11-04 17:04:54.205	2025-11-05 13:37:38.443	\N	1	1	\N	Non
113	isr6lsvcp100vln7xuvyc1pb	AC	2025-11-04 17:00:49.703	2025-11-05 11:55:56.509	\N	1	1	\N	Non
127	isr6lsvcp100vln7xuvyc1pb	AC	2025-11-04 17:00:49.703	2025-11-05 11:55:56.509	2025-11-05 11:55:56.548	1	1	\N	Non
128	yp5abinmcne47xnmbgy170y0	BZ	2025-11-04 16:26:25.058	2025-11-05 12:50:06.072	2025-11-05 12:50:06.102	1	1	\N	Pro
129	qabwruyqsn0jqxce4npieet3	CB	2025-11-04 16:47:45.91	2025-11-05 12:50:21.152	2025-11-05 12:50:21.173	1	1	\N	Sup
121	nurn2ix40xwptkjgcg0m2rm1	EF	2025-11-04 17:04:10.923	2025-11-05 12:50:33.447	\N	1	1	\N	Sup
130	nurn2ix40xwptkjgcg0m2rm1	EF	2025-11-04 17:04:10.923	2025-11-05 12:50:33.447	2025-11-05 12:50:33.471	1	1	\N	Sup
131	ohkvo07g6ov77f422mkhj2ux	EG	2025-11-04 16:33:10.466	2025-11-05 12:50:47.11	2025-11-05 12:50:47.132	1	1	\N	Pro
132	zuasmf13ggljdjotov2kopln	EL	2025-11-04 16:56:09.848	2025-11-05 12:51:00.779	2025-11-05 12:51:00.8	1	1	\N	Sup
133	uiapamzvco0poylfqu9txb3n	EN	2025-11-04 16:44:09.98	2025-11-05 12:51:11.951	2025-11-05 12:51:11.973	1	1	\N	Sup
134	f1rqmngjygh0jnqbbgf9yu4j	FC	2025-11-04 16:45:42.49	2025-11-05 12:51:23.598	2025-11-05 12:51:23.618	1	1	\N	Sup
135	c52cijavehy8b7843wnlgwuc	FDM	2025-11-04 16:43:46.936	2025-11-05 12:51:36.677	2025-11-05 12:51:36.698	1	1	\N	Sup
123	tnzacejomyvyfwegqqtr224y	GA	2025-11-04 17:04:31.285	2025-11-05 12:51:57.068	\N	1	1	\N	Non
136	tnzacejomyvyfwegqqtr224y	GA	2025-11-04 17:04:31.285	2025-11-05 12:51:57.068	2025-11-05 12:51:57.091	1	1	\N	Non
137	hydpgl47ggb5ne1qqvrcgo06	GM	2025-11-04 16:27:12.236	2025-11-05 12:52:14.208	2025-11-05 12:52:14.232	1	1	\N	Pro
138	n4bxr0ysm4jxh5jmtf90bwb0	HR	2025-11-04 17:03:12.496	2025-11-05 12:52:26.72	2025-11-05 12:52:26.741	1	1	\N	Non
139	yro6125h31s75bcrp4fcz13j	IP	2025-11-04 16:50:31.608	2025-11-05 12:52:39.593	2025-11-05 12:52:39.614	1	1	\N	Sup
140	hbgsnt7xjao8yebrveyx88l4	IT	2025-11-04 16:36:08.315	2025-11-05 12:52:54.233	2025-11-05 12:52:54.253	1	1	\N	Non
141	hnobxih5m3lr3cm6sf1oyexq	JA	2025-11-04 16:55:07.946	2025-11-05 12:53:06.97	2025-11-05 12:53:06.998	1	1	\N	Pro
142	xndevm88xuvh3i3n2265683d	JC	2025-11-04 16:41:17.323	2025-11-05 12:53:21.519	2025-11-05 12:53:21.54	1	1	\N	Pro
143	sq0yij35kuud1gw1j0owp13v	JM	2025-11-04 16:53:47.633	2025-11-05 12:55:45.057	2025-11-05 12:55:45.08	1	1	\N	Pro
144	dem9zkd9y5uttlyzqan99taa	JP	2025-11-04 16:55:40.7	2025-11-05 13:34:45.683	2025-11-05 13:34:45.708	1	1	\N	Pro
145	i3y9gkp6okoofbq3gcnub3wv	M10	2025-11-04 16:33:46.745	2025-11-05 13:34:58.336	2025-11-05 13:34:58.358	1	1	\N	Pro
146	ww6g6rj8ai60pczuhqbesefi	M6	2025-11-04 16:35:04.947	2025-11-05 13:35:12.913	2025-11-05 13:35:12.933	1	1	\N	Pro
147	bc0om4305uu49gsa1tz9jbhz	M8	2025-11-04 16:35:22.301	2025-11-05 13:35:28.114	2025-11-05 13:35:28.136	1	1	\N	Pro
148	y8ltitqw95u861jae7qosjw9	MC	2025-11-04 16:56:38.591	2025-11-05 13:35:39.508	2025-11-05 13:35:39.527	1	1	\N	Sup
149	gek15er1ik0k0tx5rftym91s	MI	2025-11-04 16:42:53.269	2025-11-05 13:35:50.539	2025-11-05 13:35:50.558	1	1	\N	Sup
150	zx1waecj4mqv07yuzyjbiopo	NT	2025-11-04 16:32:10.787	2025-11-05 13:36:02.123	2025-11-05 13:36:02.144	1	1	\N	Pro
151	w7p4j1u5wa9wvdfgr00nvx01	OQ	2025-11-04 16:35:46.395	2025-11-05 13:36:14.969	2025-11-05 13:36:14.988	1	1	\N	Pro
152	xtapyqqi0kxmcmwk0h4haqn5	OR	2025-11-04 16:49:32.674	2025-11-05 13:36:28.286	2025-11-05 13:36:28.306	1	1	\N	Non
157	yf5wzzl7ybp5highv4p5lgd2	TC	2025-11-04 17:04:54.205	2025-11-05 13:37:38.443	2025-11-05 13:37:38.473	1	1	\N	Non
158	c4bf6ysgrdh42dpkom73bx9a	Q-Gate	2025-11-04 16:46:13.842	2025-11-05 13:37:51.136	2025-11-05 13:37:51.155	1	1	\N	Sup
160	qfe4uvzjl041997tf9uocrts	QC1	2025-11-04 16:51:43.168	2025-11-05 13:38:13.47	2025-11-05 13:38:13.491	1	1	\N	Sup
162	gs7i165ric7grc61tddx1rdm	SC	2025-11-04 17:03:49.397	2025-11-05 13:38:34.514	2025-11-05 13:38:34.534	1	1	\N	Non
166	rrp957ft47dqwo471l31gb71	ST	2025-11-04 16:50:06.805	2025-11-05 13:39:30.889	2025-11-05 13:39:30.908	1	1	\N	Sup
167	mi92ez08k8awm7whhgz8jwc1	TP	2025-11-04 16:48:10.045	2025-11-05 13:39:43.667	2025-11-05 13:39:43.707	1	1	\N	Sup
168	wx5pzi62r5361zdbexvjewl2	UB	2025-11-04 16:53:21.89	2025-11-05 13:39:54.622	2025-11-05 13:39:54.641	1	1	\N	Pro
169	eg90q4f2z8y1vffaba72w14h	US	2025-11-04 16:56:57.787	2025-11-05 13:40:06.82	2025-11-05 13:40:06.858	1	1	\N	Sup
\.


--
-- TOC entry 5411 (class 0 OID 17601)
-- Dependencies: 302
-- Data for Name: teams_department_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams_department_lnk (id, team_id, department_id, team_ord) FROM stdin;
163	162	34	2
164	163	27	1
7	10	1	1
165	164	30	1
9	13	1	2
69	68	22	2
148	147	2	5
12	16	1	3
166	165	30	2
71	70	22	3
167	166	23	6
16	20	1	4
18	22	1	5
168	167	23	3
73	72	22	4
169	168	8	1
149	148	8	6
1	6	5	1
3	8	5	2
170	169	8	7
77	76	22	5
171	170	6	3
79	78	22	6
81	80	13	1
150	149	10	1
86	85	13	2
88	87	13	3
90	89	13	4
37	26	11	1
92	91	7	1
94	93	7	2
151	150	2	1
96	95	7	3
43	42	5	3
98	97	7	4
20	24	3	1
47	45	5	4
49	48	9	1
100	99	7	5
102	101	7	6
53	52	9	2
55	54	9	3
57	56	11	2
60	59	11	3
62	61	22	1
104	103	7	7
106	105	31	1
108	107	31	2
110	109	29	1
112	111	29	2
114	113	16	1
116	115	26	1
118	117	33	1
120	119	33	2
122	121	33	3
124	123	33	4
126	125	33	5
128	127	21	1
129	128	6	1
130	129	23	2
131	130	34	3
132	131	2	2
133	132	8	5
134	133	10	3
135	134	12	3
136	135	10	2
137	136	34	4
138	137	6	2
139	138	34	1
140	139	15	1
141	140	12	1
142	141	8	3
143	142	6	4
144	143	8	2
145	144	8	4
146	145	2	3
147	146	2	4
152	151	4	1
153	152	23	5
154	153	12	2
155	154	23	4
156	155	32	1
157	156	32	2
158	157	34	5
159	158	23	1
160	159	15	2
161	160	15	3
162	161	15	4
\.


--
-- TOC entry 5347 (class 0 OID 16684)
-- Dependencies: 238
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	vu8gjo108dh8d7au090wcxm4	plugin::users-permissions.user.me	2025-10-16 09:53:05.889	2025-10-16 09:53:05.889	2025-10-16 09:53:05.891	\N	\N	\N
2	iu7h89h2h0qmzyhdtxxooj9b	plugin::users-permissions.auth.changePassword	2025-10-16 09:53:05.889	2025-10-16 09:53:05.889	2025-10-16 09:53:05.892	\N	\N	\N
3	aua8a65n5n58zvq3zxfacnlj	plugin::users-permissions.auth.callback	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	\N	\N	\N
4	pk5v2tlc2r5vf5kpqasxbpss	plugin::users-permissions.auth.connect	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.918	\N	\N	\N
5	hfk1bhs5iwqwjcw7cw4brl9d	plugin::users-permissions.auth.resetPassword	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.919	\N	\N	\N
6	b2m0wkv9kr8zrf8ai5ukb9tp	plugin::users-permissions.auth.forgotPassword	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.918	\N	\N	\N
7	g34s5zvyl4dw5478at8nppsk	plugin::users-permissions.auth.register	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.919	\N	\N	\N
8	p3kq1x6h3573npbaqh2opz0j	plugin::users-permissions.auth.emailConfirmation	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.919	\N	\N	\N
9	qycj29ohfujqpwnvyqvnbqhw	plugin::users-permissions.auth.sendEmailConfirmation	2025-10-16 09:53:05.917	2025-10-16 09:53:05.917	2025-10-16 09:53:05.92	\N	\N	\N
19	qw2hkfjv56p6dg5jwh34h1ze	api::employee.employee.find	2025-11-04 14:41:30.12	2025-11-04 14:41:30.12	2025-11-04 14:41:30.122	\N	\N	\N
20	m7e7kdsqapcfepsjtccvmi6q	api::employee.employee.findOne	2025-11-04 14:41:30.12	2025-11-04 14:41:30.12	2025-11-04 14:41:30.124	\N	\N	\N
21	dbujqovfugdsw72u23jixhpk	api::employee.employee.create	2025-11-04 14:41:30.12	2025-11-04 14:41:30.12	2025-11-04 14:41:30.125	\N	\N	\N
22	jdquf90yeykiktyzbnv8lw53	api::department.department.find	2025-11-04 16:19:15.561	2025-11-04 16:19:15.561	2025-11-04 16:19:15.563	\N	\N	\N
23	dvlg06l6ezkc0odobfs31afz	api::department.department.findOne	2025-11-04 16:19:15.561	2025-11-04 16:19:15.561	2025-11-04 16:19:15.564	\N	\N	\N
24	a5aysfe1n3kfhk7stl0se9tl	api::department.department.create	2025-11-04 16:19:15.561	2025-11-04 16:19:15.561	2025-11-04 16:19:15.565	\N	\N	\N
25	avrphy4uuzjukx2aukja8puw	api::team.team.find	2025-11-04 16:19:24.069	2025-11-04 16:19:24.069	2025-11-04 16:19:24.07	\N	\N	\N
26	ha265lw5nomrfbom8rxzwzwv	api::team.team.findOne	2025-11-04 16:19:24.069	2025-11-04 16:19:24.069	2025-11-04 16:19:24.071	\N	\N	\N
27	iepvqyiwowovaf51zmi6n76c	api::team.team.create	2025-11-04 16:19:27.531	2025-11-04 16:19:27.531	2025-11-04 16:19:27.532	\N	\N	\N
28	dswsl03g55lpx7hlnzkwpxh4	api::emp-register-qcc.emp-register-qcc.find	2025-11-21 15:50:31.72	2025-11-21 15:50:31.72	2025-11-21 15:50:31.721	\N	\N	\N
29	uykkpq1k72yfvnxlqv3cftg7	api::emp-register-qcc.emp-register-qcc.findOne	2025-11-21 15:50:31.72	2025-11-21 15:50:31.72	2025-11-21 15:50:31.721	\N	\N	\N
30	oishhe75mbpb4ax82x23pfta	api::register-qcc.register-qcc.find	2025-11-21 15:50:31.72	2025-11-21 15:50:31.72	2025-11-21 15:50:31.722	\N	\N	\N
31	qv37altlqybijh9eay9braiy	api::register-qcc.register-qcc.findOne	2025-11-21 15:50:31.72	2025-11-21 15:50:31.72	2025-11-21 15:50:31.722	\N	\N	\N
\.


--
-- TOC entry 5389 (class 0 OID 16927)
-- Dependencies: 280
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	1	1
2	2	1	1
3	3	2	1
4	4	2	1
5	5	2	1
6	7	2	1
7	6	2	1
8	8	2	2
9	9	2	2
19	19	2	3
20	20	2	3
21	21	2	3
22	22	2	4
23	23	2	4
24	24	2	4
25	25	2	5
26	26	2	5
27	27	2	6
28	28	2	7
29	29	2	7
30	30	2	7
31	31	2	8
\.


--
-- TOC entry 5349 (class 0 OID 16696)
-- Dependencies: 240
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	tpo0nmy8yb322dyeaf7b0ob3	Authenticated	Default role given to authenticated user.	authenticated	2025-10-16 09:53:05.865	2025-10-16 09:53:05.865	2025-10-16 09:53:05.867	\N	\N	\N
2	ky07szofb9cpct45z1r7dlgd	Public	Default role given to unauthenticated user.	public	2025-10-16 09:53:05.873	2025-11-21 15:51:21.939	2025-10-16 09:53:05.874	\N	\N	\N
\.


--
-- TOC entry 5351 (class 0 OID 16708)
-- Dependencies: 242
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5391 (class 0 OID 16939)
-- Dependencies: 282
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
\.


--
-- TOC entry 5335 (class 0 OID 16608)
-- Dependencies: 226
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 5379 (class 0 OID 16868)
-- Dependencies: 270
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 243
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 260, true);


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 283
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 260, true);


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 247
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 245
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 285
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 297
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 34, true);


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 305
-- Name: emp_register_qccs_employee_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emp_register_qccs_employee_lnk_id_seq', 4, true);


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 295
-- Name: emp_register_qccs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emp_register_qccs_id_seq', 9, true);


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 303
-- Name: emp_register_qccs_register_qcc_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emp_register_qccs_register_qcc_lnk_id_seq', 8, true);


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 291
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 1981, true);


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 267
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 223
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 1, true);


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 265
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 8, true);


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 227
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 293
-- Name: register_qccs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.register_qccs_id_seq', 4, true);


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 251
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 287
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 259
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 39, true);


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 221
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 44, true);


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 263
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 217
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 219
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 7, true);


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 231
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 271
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 229
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 257
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 55, true);


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 255
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 289
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 253
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 261
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 233
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 273
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 235
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 277
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 275
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 301
-- Name: teams_department_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_department_lnk_id_seq', 171, true);


--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 299
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 170, true);


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 31, true);


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 279
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 31, true);


--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 239
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 241
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 281
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);


--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 225
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 269
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- TOC entry 4924 (class 2606 OID 16727)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5032 (class 2606 OID 16956)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5034 (class 2606 OID 16960)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- TOC entry 4934 (class 2606 OID 16751)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4929 (class 2606 OID 16739)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 5040 (class 2606 OID 16968)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5042 (class 2606 OID 16972)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- TOC entry 5075 (class 2606 OID 17557)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 5100 (class 2606 OID 17937)
-- Name: emp_register_qccs_employee_lnk emp_register_qccs_employee_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_employee_lnk
    ADD CONSTRAINT emp_register_qccs_employee_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5102 (class 2606 OID 17941)
-- Name: emp_register_qccs_employee_lnk emp_register_qccs_employee_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_employee_lnk
    ADD CONSTRAINT emp_register_qccs_employee_lnk_uq UNIQUE (emp_register_qcc_id, employee_id);


--
-- TOC entry 5070 (class 2606 OID 17531)
-- Name: emp_register_qccs emp_register_qccs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs
    ADD CONSTRAINT emp_register_qccs_pkey PRIMARY KEY (id);


--
-- TOC entry 5093 (class 2606 OID 17883)
-- Name: emp_register_qccs_register_qcc_lnk emp_register_qccs_register_qcc_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_register_qcc_lnk
    ADD CONSTRAINT emp_register_qccs_register_qcc_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5095 (class 2606 OID 17887)
-- Name: emp_register_qccs_register_qcc_lnk emp_register_qccs_register_qcc_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_register_qcc_lnk
    ADD CONSTRAINT emp_register_qccs_register_qcc_lnk_uq UNIQUE (emp_register_qcc_id, register_qcc_id);


--
-- TOC entry 5060 (class 2606 OID 17469)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 4977 (class 2606 OID 16861)
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 16865)
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- TOC entry 4864 (class 2606 OID 16597)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 4972 (class 2606 OID 16851)
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 16631)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 17507)
-- Name: register_qccs register_qccs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.register_qccs
    ADD CONSTRAINT register_qccs_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 16775)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 16981)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5049 (class 2606 OID 16985)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- TOC entry 4939 (class 2606 OID 16763)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4962 (class 2606 OID 16823)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 16588)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 4967 (class 2606 OID 16841)
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 4858 (class 2606 OID 16579)
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- TOC entry 4856 (class 2606 OID 16572)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4894 (class 2606 OID 16655)
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 16885)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 16889)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- TOC entry 4889 (class 2606 OID 16643)
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 16811)
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4954 (class 2606 OID 16799)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5054 (class 2606 OID 16993)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5056 (class 2606 OID 16997)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- TOC entry 4949 (class 2606 OID 16787)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 16832)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 16667)
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 16897)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4999 (class 2606 OID 16901)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- TOC entry 5011 (class 2606 OID 16920)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5013 (class 2606 OID 16924)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- TOC entry 4904 (class 2606 OID 16679)
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- TOC entry 5004 (class 2606 OID 16908)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5006 (class 2606 OID 16912)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- TOC entry 5086 (class 2606 OID 17606)
-- Name: teams_department_lnk teams_department_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_department_lnk
    ADD CONSTRAINT teams_department_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5088 (class 2606 OID 17610)
-- Name: teams_department_lnk teams_department_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_department_lnk
    ADD CONSTRAINT teams_department_lnk_uq UNIQUE (team_id, department_id);


--
-- TOC entry 5080 (class 2606 OID 17584)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 4909 (class 2606 OID 16691)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5018 (class 2606 OID 16932)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5020 (class 2606 OID 16936)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- TOC entry 4914 (class 2606 OID 16703)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4919 (class 2606 OID 16715)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 5025 (class 2606 OID 16944)
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 5027 (class 2606 OID 16948)
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- TOC entry 4984 (class 2606 OID 16873)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 2606 OID 16877)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- TOC entry 4875 (class 2606 OID 16617)
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- TOC entry 4877 (class 2606 OID 16619)
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- TOC entry 4879 (class 2606 OID 16615)
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 4921 (class 1259 OID 16729)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 4922 (class 1259 OID 16728)
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 5028 (class 1259 OID 16957)
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- TOC entry 5029 (class 1259 OID 16958)
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- TOC entry 5030 (class 1259 OID 16961)
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- TOC entry 4925 (class 1259 OID 16730)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 4931 (class 1259 OID 16753)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 4932 (class 1259 OID 16752)
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- TOC entry 4935 (class 1259 OID 16754)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 4926 (class 1259 OID 16741)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 4927 (class 1259 OID 16740)
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- TOC entry 5035 (class 1259 OID 16969)
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- TOC entry 5036 (class 1259 OID 16970)
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- TOC entry 5037 (class 1259 OID 16973)
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- TOC entry 5038 (class 1259 OID 16974)
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- TOC entry 4930 (class 1259 OID 16742)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 5072 (class 1259 OID 17559)
-- Name: departments_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX departments_created_by_id_fk ON public.departments USING btree (created_by_id);


--
-- TOC entry 5073 (class 1259 OID 17558)
-- Name: departments_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX departments_documents_idx ON public.departments USING btree (document_id, locale, published_at);


--
-- TOC entry 5076 (class 1259 OID 17560)
-- Name: departments_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX departments_updated_by_id_fk ON public.departments USING btree (updated_by_id);


--
-- TOC entry 5067 (class 1259 OID 17533)
-- Name: emp_register_qccs_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_created_by_id_fk ON public.emp_register_qccs USING btree (created_by_id);


--
-- TOC entry 5068 (class 1259 OID 17532)
-- Name: emp_register_qccs_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_documents_idx ON public.emp_register_qccs USING btree (document_id, locale, published_at);


--
-- TOC entry 5096 (class 1259 OID 17938)
-- Name: emp_register_qccs_employee_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_employee_lnk_fk ON public.emp_register_qccs_employee_lnk USING btree (emp_register_qcc_id);


--
-- TOC entry 5097 (class 1259 OID 17939)
-- Name: emp_register_qccs_employee_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_employee_lnk_ifk ON public.emp_register_qccs_employee_lnk USING btree (employee_id);


--
-- TOC entry 5098 (class 1259 OID 17942)
-- Name: emp_register_qccs_employee_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_employee_lnk_oifk ON public.emp_register_qccs_employee_lnk USING btree (emp_register_qcc_ord);


--
-- TOC entry 5089 (class 1259 OID 17884)
-- Name: emp_register_qccs_register_qcc_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_register_qcc_lnk_fk ON public.emp_register_qccs_register_qcc_lnk USING btree (emp_register_qcc_id);


--
-- TOC entry 5090 (class 1259 OID 17885)
-- Name: emp_register_qccs_register_qcc_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_register_qcc_lnk_ifk ON public.emp_register_qccs_register_qcc_lnk USING btree (register_qcc_id);


--
-- TOC entry 5091 (class 1259 OID 17888)
-- Name: emp_register_qccs_register_qcc_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_register_qcc_lnk_oifk ON public.emp_register_qccs_register_qcc_lnk USING btree (emp_register_qcc_ord);


--
-- TOC entry 5071 (class 1259 OID 17534)
-- Name: emp_register_qccs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_register_qccs_updated_by_id_fk ON public.emp_register_qccs USING btree (updated_by_id);


--
-- TOC entry 5057 (class 1259 OID 17471)
-- Name: employees_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX employees_created_by_id_fk ON public.employees USING btree (created_by_id);


--
-- TOC entry 5058 (class 1259 OID 17470)
-- Name: employees_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX employees_documents_idx ON public.employees USING btree (document_id, locale, published_at);


--
-- TOC entry 5061 (class 1259 OID 17472)
-- Name: employees_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX employees_updated_by_id_fk ON public.employees USING btree (updated_by_id);


--
-- TOC entry 4861 (class 1259 OID 16605)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 4862 (class 1259 OID 16604)
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- TOC entry 4973 (class 1259 OID 16862)
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- TOC entry 4974 (class 1259 OID 16863)
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- TOC entry 4975 (class 1259 OID 16866)
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- TOC entry 4968 (class 1259 OID 16852)
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- TOC entry 4969 (class 1259 OID 16854)
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- TOC entry 4970 (class 1259 OID 16853)
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- TOC entry 4865 (class 1259 OID 16606)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 4881 (class 1259 OID 16633)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 4882 (class 1259 OID 16632)
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- TOC entry 4885 (class 1259 OID 16634)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 5062 (class 1259 OID 17509)
-- Name: register_qccs_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX register_qccs_created_by_id_fk ON public.register_qccs USING btree (created_by_id);


--
-- TOC entry 5063 (class 1259 OID 17508)
-- Name: register_qccs_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX register_qccs_documents_idx ON public.register_qccs USING btree (document_id, locale, published_at);


--
-- TOC entry 5066 (class 1259 OID 17510)
-- Name: register_qccs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX register_qccs_updated_by_id_fk ON public.register_qccs USING btree (updated_by_id);


--
-- TOC entry 4941 (class 1259 OID 16777)
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- TOC entry 4942 (class 1259 OID 16776)
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 5043 (class 1259 OID 16982)
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- TOC entry 5044 (class 1259 OID 16983)
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- TOC entry 5045 (class 1259 OID 16986)
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- TOC entry 4945 (class 1259 OID 16778)
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- TOC entry 4936 (class 1259 OID 16765)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 4937 (class 1259 OID 16764)
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- TOC entry 4940 (class 1259 OID 16766)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 4965 (class 1259 OID 16842)
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- TOC entry 4891 (class 1259 OID 16657)
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- TOC entry 4892 (class 1259 OID 16656)
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- TOC entry 4987 (class 1259 OID 16886)
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- TOC entry 4988 (class 1259 OID 16887)
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- TOC entry 4989 (class 1259 OID 16890)
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- TOC entry 4895 (class 1259 OID 16658)
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- TOC entry 4886 (class 1259 OID 16645)
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- TOC entry 4887 (class 1259 OID 16644)
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- TOC entry 4890 (class 1259 OID 16646)
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- TOC entry 4956 (class 1259 OID 16813)
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- TOC entry 4957 (class 1259 OID 16812)
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- TOC entry 4960 (class 1259 OID 16814)
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- TOC entry 4951 (class 1259 OID 16801)
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- TOC entry 4952 (class 1259 OID 16800)
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 5050 (class 1259 OID 16994)
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- TOC entry 5051 (class 1259 OID 16995)
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- TOC entry 5052 (class 1259 OID 16998)
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- TOC entry 4955 (class 1259 OID 16802)
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- TOC entry 4946 (class 1259 OID 16789)
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- TOC entry 4947 (class 1259 OID 16788)
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- TOC entry 4950 (class 1259 OID 16790)
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- TOC entry 4896 (class 1259 OID 16669)
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- TOC entry 4897 (class 1259 OID 16668)
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- TOC entry 4994 (class 1259 OID 16898)
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- TOC entry 4995 (class 1259 OID 16899)
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- TOC entry 4901 (class 1259 OID 16681)
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- TOC entry 4902 (class 1259 OID 16680)
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- TOC entry 5007 (class 1259 OID 16921)
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- TOC entry 5008 (class 1259 OID 16922)
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- TOC entry 5009 (class 1259 OID 16925)
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- TOC entry 4905 (class 1259 OID 16682)
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- TOC entry 5000 (class 1259 OID 16909)
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- TOC entry 5001 (class 1259 OID 16910)
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- TOC entry 5002 (class 1259 OID 16913)
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- TOC entry 4900 (class 1259 OID 16670)
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- TOC entry 5077 (class 1259 OID 17586)
-- Name: teams_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_created_by_id_fk ON public.teams USING btree (created_by_id);


--
-- TOC entry 5082 (class 1259 OID 17607)
-- Name: teams_department_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_department_lnk_fk ON public.teams_department_lnk USING btree (team_id);


--
-- TOC entry 5083 (class 1259 OID 17608)
-- Name: teams_department_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_department_lnk_ifk ON public.teams_department_lnk USING btree (department_id);


--
-- TOC entry 5084 (class 1259 OID 17611)
-- Name: teams_department_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_department_lnk_oifk ON public.teams_department_lnk USING btree (team_ord);


--
-- TOC entry 5078 (class 1259 OID 17585)
-- Name: teams_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_documents_idx ON public.teams USING btree (document_id, locale, published_at);


--
-- TOC entry 5081 (class 1259 OID 17587)
-- Name: teams_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_updated_by_id_fk ON public.teams USING btree (updated_by_id);


--
-- TOC entry 4906 (class 1259 OID 16693)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 4907 (class 1259 OID 16692)
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 5014 (class 1259 OID 16933)
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- TOC entry 5015 (class 1259 OID 16934)
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- TOC entry 5016 (class 1259 OID 16937)
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- TOC entry 4910 (class 1259 OID 16694)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 4911 (class 1259 OID 16705)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 4912 (class 1259 OID 16704)
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- TOC entry 4915 (class 1259 OID 16706)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 4916 (class 1259 OID 16717)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 4917 (class 1259 OID 16716)
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- TOC entry 5021 (class 1259 OID 16945)
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- TOC entry 5022 (class 1259 OID 16946)
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- TOC entry 5023 (class 1259 OID 16949)
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- TOC entry 4920 (class 1259 OID 16718)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 4866 (class 1259 OID 16599)
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- TOC entry 4867 (class 1259 OID 16603)
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- TOC entry 4868 (class 1259 OID 16598)
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- TOC entry 4869 (class 1259 OID 16601)
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- TOC entry 4870 (class 1259 OID 16602)
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- TOC entry 4871 (class 1259 OID 16600)
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- TOC entry 4872 (class 1259 OID 16621)
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- TOC entry 4873 (class 1259 OID 16620)
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- TOC entry 4980 (class 1259 OID 16874)
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- TOC entry 4981 (class 1259 OID 16875)
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- TOC entry 4982 (class 1259 OID 16878)
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- TOC entry 4880 (class 1259 OID 16622)
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- TOC entry 5123 (class 2606 OID 17099)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5157 (class 2606 OID 17269)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5158 (class 2606 OID 17274)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5124 (class 2606 OID 17104)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5127 (class 2606 OID 17119)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5128 (class 2606 OID 17124)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5125 (class 2606 OID 17109)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5159 (class 2606 OID 17279)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 5160 (class 2606 OID 17284)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5126 (class 2606 OID 17114)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5171 (class 2606 OID 17561)
-- Name: departments departments_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5172 (class 2606 OID 17566)
-- Name: departments departments_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5169 (class 2606 OID 17535)
-- Name: emp_register_qccs emp_register_qccs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs
    ADD CONSTRAINT emp_register_qccs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5179 (class 2606 OID 17943)
-- Name: emp_register_qccs_employee_lnk emp_register_qccs_employee_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_employee_lnk
    ADD CONSTRAINT emp_register_qccs_employee_lnk_fk FOREIGN KEY (emp_register_qcc_id) REFERENCES public.emp_register_qccs(id) ON DELETE CASCADE;


--
-- TOC entry 5180 (class 2606 OID 17948)
-- Name: emp_register_qccs_employee_lnk emp_register_qccs_employee_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_employee_lnk
    ADD CONSTRAINT emp_register_qccs_employee_lnk_ifk FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 5177 (class 2606 OID 17889)
-- Name: emp_register_qccs_register_qcc_lnk emp_register_qccs_register_qcc_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_register_qcc_lnk
    ADD CONSTRAINT emp_register_qccs_register_qcc_lnk_fk FOREIGN KEY (emp_register_qcc_id) REFERENCES public.emp_register_qccs(id) ON DELETE CASCADE;


--
-- TOC entry 5178 (class 2606 OID 17894)
-- Name: emp_register_qccs_register_qcc_lnk emp_register_qccs_register_qcc_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs_register_qcc_lnk
    ADD CONSTRAINT emp_register_qccs_register_qcc_lnk_ifk FOREIGN KEY (register_qcc_id) REFERENCES public.register_qccs(id) ON DELETE CASCADE;


--
-- TOC entry 5170 (class 2606 OID 17540)
-- Name: emp_register_qccs emp_register_qccs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_register_qccs
    ADD CONSTRAINT emp_register_qccs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5165 (class 2606 OID 17473)
-- Name: employees employees_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5166 (class 2606 OID 17478)
-- Name: employees employees_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5103 (class 2606 OID 16999)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5141 (class 2606 OID 17189)
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 5142 (class 2606 OID 17194)
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 5140 (class 2606 OID 17184)
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 5104 (class 2606 OID 17004)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5107 (class 2606 OID 17019)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5108 (class 2606 OID 17024)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5167 (class 2606 OID 17511)
-- Name: register_qccs register_qccs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.register_qccs
    ADD CONSTRAINT register_qccs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5168 (class 2606 OID 17516)
-- Name: register_qccs register_qccs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.register_qccs
    ADD CONSTRAINT register_qccs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5131 (class 2606 OID 17139)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5161 (class 2606 OID 17289)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5162 (class 2606 OID 17294)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 5132 (class 2606 OID 17144)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5129 (class 2606 OID 17129)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5130 (class 2606 OID 17134)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5139 (class 2606 OID 17179)
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5111 (class 2606 OID 17039)
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5145 (class 2606 OID 17209)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- TOC entry 5146 (class 2606 OID 17214)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- TOC entry 5112 (class 2606 OID 17044)
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5109 (class 2606 OID 17029)
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5110 (class 2606 OID 17034)
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5137 (class 2606 OID 17169)
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5138 (class 2606 OID 17174)
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5135 (class 2606 OID 17159)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5163 (class 2606 OID 17299)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5164 (class 2606 OID 17304)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 5136 (class 2606 OID 17164)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5133 (class 2606 OID 17149)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5134 (class 2606 OID 17154)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5113 (class 2606 OID 17049)
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5147 (class 2606 OID 17219)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- TOC entry 5148 (class 2606 OID 17224)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 5115 (class 2606 OID 17059)
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5151 (class 2606 OID 17239)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 5152 (class 2606 OID 17244)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5116 (class 2606 OID 17064)
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5149 (class 2606 OID 17229)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 5150 (class 2606 OID 17234)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- TOC entry 5114 (class 2606 OID 17054)
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5173 (class 2606 OID 17588)
-- Name: teams teams_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5175 (class 2606 OID 17612)
-- Name: teams_department_lnk teams_department_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_department_lnk
    ADD CONSTRAINT teams_department_lnk_fk FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- TOC entry 5176 (class 2606 OID 17617)
-- Name: teams_department_lnk teams_department_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_department_lnk
    ADD CONSTRAINT teams_department_lnk_ifk FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE CASCADE;


--
-- TOC entry 5174 (class 2606 OID 17593)
-- Name: teams teams_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5117 (class 2606 OID 17069)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5153 (class 2606 OID 17249)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5154 (class 2606 OID 17254)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5118 (class 2606 OID 17074)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5119 (class 2606 OID 17079)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5120 (class 2606 OID 17084)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5121 (class 2606 OID 17089)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5155 (class 2606 OID 17259)
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 5156 (class 2606 OID 17264)
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 5122 (class 2606 OID 17094)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5105 (class 2606 OID 17009)
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 5143 (class 2606 OID 17199)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 5144 (class 2606 OID 17204)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 5106 (class 2606 OID 17014)
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


-- Completed on 2025-11-21 16:49:09

--
-- PostgreSQL database dump complete
--

