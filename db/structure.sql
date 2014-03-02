--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: ghstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore;


--
-- Name: ghstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_in(cstring) RETURNS ghstore
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'ghstore_in';


--
-- Name: ghstore_out(ghstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_out(ghstore) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'ghstore_out';


--
-- Name: ghstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore (
    INTERNALLENGTH = variable,
    INPUT = ghstore_in,
    OUTPUT = ghstore_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- Name: hstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore;


--
-- Name: hstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_in(cstring) RETURNS hstore
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'hstore_in';


--
-- Name: hstore_out(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_out(hstore) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/hstore', 'hstore_out';


--
-- Name: hstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore (
    INTERNALLENGTH = variable,
    INPUT = hstore_in,
    OUTPUT = hstore_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- Name: akeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION akeys(hstore) RETURNS text[]
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'akeys';


--
-- Name: avals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION avals(hstore) RETURNS text[]
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'avals';


--
-- Name: defined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION defined(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'defined';


--
-- Name: delete(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete(hstore, text) RETURNS hstore
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'delete';


--
-- Name: each(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION each(hs hstore, OUT key text, OUT value text) RETURNS SETOF record
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'each';


--
-- Name: exist(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exist(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'exists';


--
-- Name: fetchval(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fetchval(hstore, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'fetchval';


--
-- Name: ghstore_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_compress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_compress';


--
-- Name: ghstore_consistent(internal, internal, integer, oid, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_consistent(internal, internal, integer, oid, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_consistent';


--
-- Name: ghstore_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_decompress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_decompress';


--
-- Name: ghstore_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_penalty';


--
-- Name: ghstore_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_picksplit(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_picksplit';


--
-- Name: ghstore_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_same(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_same';


--
-- Name: ghstore_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_union(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'ghstore_union';


--
-- Name: gin_consistent_hstore(internal, smallint, internal, integer, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_consistent_hstore(internal, smallint, internal, integer, internal, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_consistent_hstore';


--
-- Name: gin_extract_hstore(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_hstore(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_extract_hstore';


--
-- Name: gin_extract_hstore_query(internal, internal, smallint, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_hstore_query(internal, internal, smallint, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'gin_extract_hstore_query';


--
-- Name: hs_concat(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_concat(hstore, hstore) RETURNS hstore
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_concat';


--
-- Name: hs_contained(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contained(hstore, hstore) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_contained';


--
-- Name: hs_contains(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contains(hstore, hstore) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'hs_contains';


--
-- Name: isdefined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isdefined(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'defined';


--
-- Name: isexists(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isexists(hstore, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'exists';


--
-- Name: skeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION skeys(hstore) RETURNS SETOF text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'skeys';


--
-- Name: svals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION svals(hstore) RETURNS SETOF text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/hstore', 'svals';


--
-- Name: tconvert(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tconvert(text, text) RETURNS hstore
    LANGUAGE c IMMUTABLE
    AS '$libdir/hstore', 'tconvert';


--
-- Name: ->; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR -> (
    PROCEDURE = fetchval,
    LEFTARG = hstore,
    RIGHTARG = text
);


--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR => (
    PROCEDURE = tconvert,
    LEFTARG = text,
    RIGHTARG = text
);


--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = exist,
    LEFTARG = hstore,
    RIGHTARG = text,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = hs_concat,
    LEFTARG = hstore,
    RIGHTARG = hstore
);


--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: gin_hstore_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gin_hstore_ops
    DEFAULT FOR TYPE hstore USING gin AS
    STORAGE text ,
    OPERATOR 7 @>(hstore,hstore) ,
    OPERATOR 9 ?(hstore,text) ,
    FUNCTION 1 bttextcmp(text,text) ,
    FUNCTION 2 gin_extract_hstore(internal,internal) ,
    FUNCTION 3 gin_extract_hstore_query(internal,internal,smallint,internal,internal) ,
    FUNCTION 4 gin_consistent_hstore(internal,smallint,internal,integer,internal,internal);


--
-- Name: gist_hstore_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_hstore_ops
    DEFAULT FOR TYPE hstore USING gist AS
    STORAGE ghstore ,
    OPERATOR 7 @>(hstore,hstore) ,
    OPERATOR 9 ?(hstore,text) ,
    OPERATOR 13 @(hstore,hstore) ,
    FUNCTION 1 ghstore_consistent(internal,internal,integer,oid,internal) ,
    FUNCTION 2 ghstore_union(internal,internal) ,
    FUNCTION 3 ghstore_compress(internal) ,
    FUNCTION 4 ghstore_decompress(internal) ,
    FUNCTION 5 ghstore_penalty(internal,internal,internal) ,
    FUNCTION 6 ghstore_picksplit(internal,internal) ,
    FUNCTION 7 ghstore_same(internal,internal,internal);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying(255),
    body text,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: blacklists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blacklists (
    id integer NOT NULL,
    phone character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    info text
);


--
-- Name: blacklists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blacklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blacklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blacklists_id_seq OWNED BY blacklists.id;


--
-- Name: call_center_phone_calls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_phone_calls (
    id integer NOT NULL,
    status character varying(255),
    number character varying(255),
    report_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    all_params hstore
);


--
-- Name: call_center_phone_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_phone_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_phone_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_phone_calls_id_seq OWNED BY call_center_phone_calls.id;


--
-- Name: call_center_redirection_phones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_redirection_phones (
    id integer NOT NULL,
    name character varying(255),
    number character varying(255)
);


--
-- Name: call_center_redirection_phones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_redirection_phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_redirection_phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_redirection_phones_id_seq OWNED BY call_center_redirection_phones.id;


--
-- Name: call_center_reporters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_reporters (
    id integer NOT NULL,
    user_id integer,
    uic_id integer,
    adm_region_id integer,
    mobile_group_id integer,
    phone character varying(255),
    first_name character varying(255),
    patronymic character varying(255),
    last_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    current_role_id integer
);


--
-- Name: call_center_reporters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_reporters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_reporters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_reporters_id_seq OWNED BY call_center_reporters.id;


--
-- Name: call_center_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_reports (
    id integer NOT NULL,
    text text,
    url character varying(255),
    reporter_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    violation_id integer,
    approved boolean,
    reviewer_id integer,
    needs_mobile_group boolean
);


--
-- Name: call_center_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_reports_id_seq OWNED BY call_center_reports.id;


--
-- Name: call_center_reports_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_reports_relations (
    id integer NOT NULL,
    parent_report_id integer,
    child_report_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: call_center_reports_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_reports_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_reports_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_reports_relations_id_seq OWNED BY call_center_reports_relations.id;


--
-- Name: call_center_violation_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_violation_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: call_center_violation_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_violation_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_violation_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_violation_categories_id_seq OWNED BY call_center_violation_categories.id;


--
-- Name: call_center_violation_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_violation_types (
    id integer NOT NULL,
    name character varying(255),
    violation_category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: call_center_violation_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_violation_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_violation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_violation_types_id_seq OWNED BY call_center_violation_types.id;


--
-- Name: call_center_violations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE call_center_violations (
    id integer NOT NULL,
    violation_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: call_center_violations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE call_center_violations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_center_violations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE call_center_violations_id_seq OWNED BY call_center_violations.id;


--
-- Name: current_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE current_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    short_name character varying(255)
);


--
-- Name: current_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE current_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: current_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE current_roles_id_seq OWNED BY current_roles.id;


--
-- Name: mobile_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mobile_groups (
    id integer NOT NULL,
    organisation_id integer,
    name character varying(255),
    adm_region_id integer,
    region_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: mobile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mobile_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mobile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mobile_groups_id_seq OWNED BY mobile_groups.id;


--
-- Name: nomination_sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nomination_sources (
    id integer NOT NULL,
    name character varying(255),
    variant character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nomination_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nomination_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nomination_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nomination_sources_id_seq OWNED BY nomination_sources.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organisations_id_seq OWNED BY organisations.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    kind integer,
    parent_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    has_tic boolean DEFAULT false,
    lft integer,
    rgt integer,
    adm_region_id integer
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    short_name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: uics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE uics (
    id integer NOT NULL,
    region_id integer NOT NULL,
    number integer,
    is_temporary boolean DEFAULT false NOT NULL,
    has_koib character varying(255) DEFAULT 'f'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    kind integer,
    name character varying(255),
    parent_id integer,
    participants_count integer
);


--
-- Name: uics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE uics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE uics_id_seq OWNED BY uics.id;


--
-- Name: user_app_current_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_app_current_roles (
    id integer NOT NULL,
    user_app_id integer NOT NULL,
    current_role_id integer NOT NULL,
    value character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_app_current_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_app_current_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_app_current_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_app_current_roles_id_seq OWNED BY user_app_current_roles.id;


--
-- Name: user_apps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_apps (
    id integer NOT NULL,
    last_name character varying(255),
    first_name character varying(255),
    patronymic character varying(255),
    phone character varying(255),
    email character varying(255),
    uic character varying(255),
    current_statuses integer DEFAULT 0,
    experience_count integer DEFAULT 0,
    previous_statuses integer DEFAULT 0,
    has_car boolean,
    social_accounts text,
    extra text,
    legal_status integer,
    desired_statuses integer DEFAULT 0,
    app_code character varying(255),
    app_status integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    region_id integer,
    ip character varying(255),
    year_born integer,
    sex_male boolean,
    useragent text,
    adm_region_id integer,
    state character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    phone_verified boolean DEFAULT false NOT NULL,
    has_video boolean,
    forwarded_for character varying(255),
    organisation_id integer,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    full_name character varying(767)
);


--
-- Name: user_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_apps_id_seq OWNED BY user_apps.id;


--
-- Name: user_current_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_current_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    current_role_id integer NOT NULL,
    uic_id integer,
    region_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nomination_source_id integer,
    got_docs boolean DEFAULT false
);


--
-- Name: user_current_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_current_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_current_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_current_roles_id_seq OWNED BY user_current_roles.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT NULL::character varying,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    region_id integer,
    organisation_id integer,
    phone character varying(255),
    adm_region_id integer,
    user_app_id integer,
    mobile_group_id integer,
    year_born integer,
    place_of_birth text,
    passport text,
    work text,
    work_position text,
    last_name character varying(255),
    first_name character varying(255),
    patronymic character varying(255),
    address text,
    full_name character varying(767),
    wrong_phone boolean DEFAULT false NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: verifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE verifications (
    id integer NOT NULL,
    phone_number character varying(255),
    code character varying(255),
    confirmed boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE verifications_id_seq OWNED BY verifications.id;


--
-- Name: work_logs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE work_logs (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    params text,
    state character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    results text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: work_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE work_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE work_logs_id_seq OWNED BY work_logs.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blacklists ALTER COLUMN id SET DEFAULT nextval('blacklists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_phone_calls ALTER COLUMN id SET DEFAULT nextval('call_center_phone_calls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_redirection_phones ALTER COLUMN id SET DEFAULT nextval('call_center_redirection_phones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_reporters ALTER COLUMN id SET DEFAULT nextval('call_center_reporters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_reports ALTER COLUMN id SET DEFAULT nextval('call_center_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_reports_relations ALTER COLUMN id SET DEFAULT nextval('call_center_reports_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_violation_categories ALTER COLUMN id SET DEFAULT nextval('call_center_violation_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_violation_types ALTER COLUMN id SET DEFAULT nextval('call_center_violation_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY call_center_violations ALTER COLUMN id SET DEFAULT nextval('call_center_violations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY current_roles ALTER COLUMN id SET DEFAULT nextval('current_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mobile_groups ALTER COLUMN id SET DEFAULT nextval('mobile_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nomination_sources ALTER COLUMN id SET DEFAULT nextval('nomination_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisations ALTER COLUMN id SET DEFAULT nextval('organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY uics ALTER COLUMN id SET DEFAULT nextval('uics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_app_current_roles ALTER COLUMN id SET DEFAULT nextval('user_app_current_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_apps ALTER COLUMN id SET DEFAULT nextval('user_apps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_current_roles ALTER COLUMN id SET DEFAULT nextval('user_current_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY verifications ALTER COLUMN id SET DEFAULT nextval('verifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY work_logs ALTER COLUMN id SET DEFAULT nextval('work_logs_id_seq'::regclass);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: blacklists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blacklists
    ADD CONSTRAINT blacklists_pkey PRIMARY KEY (id);


--
-- Name: call_center_phone_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_phone_calls
    ADD CONSTRAINT call_center_phone_calls_pkey PRIMARY KEY (id);


--
-- Name: call_center_redirection_phones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_redirection_phones
    ADD CONSTRAINT call_center_redirection_phones_pkey PRIMARY KEY (id);


--
-- Name: call_center_reporters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_reporters
    ADD CONSTRAINT call_center_reporters_pkey PRIMARY KEY (id);


--
-- Name: call_center_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_reports
    ADD CONSTRAINT call_center_reports_pkey PRIMARY KEY (id);


--
-- Name: call_center_reports_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_reports_relations
    ADD CONSTRAINT call_center_reports_relations_pkey PRIMARY KEY (id);


--
-- Name: call_center_violation_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_violation_categories
    ADD CONSTRAINT call_center_violation_categories_pkey PRIMARY KEY (id);


--
-- Name: call_center_violation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_violation_types
    ADD CONSTRAINT call_center_violation_types_pkey PRIMARY KEY (id);


--
-- Name: call_center_violations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY call_center_violations
    ADD CONSTRAINT call_center_violations_pkey PRIMARY KEY (id);


--
-- Name: current_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY current_roles
    ADD CONSTRAINT current_roles_pkey PRIMARY KEY (id);


--
-- Name: mobile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mobile_groups
    ADD CONSTRAINT mobile_groups_pkey PRIMARY KEY (id);


--
-- Name: nomination_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nomination_sources
    ADD CONSTRAINT nomination_sources_pkey PRIMARY KEY (id);


--
-- Name: organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: uics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY uics
    ADD CONSTRAINT uics_pkey PRIMARY KEY (id);


--
-- Name: user_app_current_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_app_current_roles
    ADD CONSTRAINT user_app_current_roles_pkey PRIMARY KEY (id);


--
-- Name: user_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_apps
    ADD CONSTRAINT user_apps_pkey PRIMARY KEY (id);


--
-- Name: user_current_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_current_roles
    ADD CONSTRAINT user_current_roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


--
-- Name: work_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY work_logs
    ADD CONSTRAINT work_logs_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_blacklists_on_phone; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_blacklists_on_phone ON blacklists USING btree (phone);


--
-- Name: index_call_center_reports_relations_on_child_report_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_call_center_reports_relations_on_child_report_id ON call_center_reports_relations USING btree (child_report_id);


--
-- Name: index_call_center_reports_relations_on_parent_report_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_call_center_reports_relations_on_parent_report_id ON call_center_reports_relations USING btree (parent_report_id);


--
-- Name: index_mobile_groups_on_organisation_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_mobile_groups_on_organisation_id ON mobile_groups USING btree (organisation_id);


--
-- Name: index_regions_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_regions_on_name ON regions USING btree (name);


--
-- Name: index_regions_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_regions_on_parent_id ON regions USING btree (parent_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_short_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_on_short_name ON roles USING btree (short_name);


--
-- Name: index_roles_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_on_slug ON roles USING btree (slug);


--
-- Name: index_uics_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_uics_on_number ON uics USING btree (number);


--
-- Name: index_uics_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_uics_on_parent_id ON uics USING btree (parent_id);


--
-- Name: index_uics_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_uics_on_region_id ON uics USING btree (region_id);


--
-- Name: index_user_app_current_roles_on_current_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_app_current_roles_on_current_role_id ON user_app_current_roles USING btree (current_role_id);


--
-- Name: index_user_app_current_roles_on_user_app_id_and_current_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_user_app_current_roles_on_user_app_id_and_current_role_id ON user_app_current_roles USING btree (user_app_id, current_role_id);


--
-- Name: index_user_apps_on_adm_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_apps_on_adm_region_id ON user_apps USING btree (adm_region_id);


--
-- Name: index_user_apps_on_organisation_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_apps_on_organisation_id ON user_apps USING btree (organisation_id);


--
-- Name: index_user_apps_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_apps_on_region_id ON user_apps USING btree (region_id);


--
-- Name: index_user_current_roles_on_current_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_current_roles_on_current_role_id ON user_current_roles USING btree (current_role_id);


--
-- Name: index_user_current_roles_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_current_roles_on_region_id ON user_current_roles USING btree (region_id);


--
-- Name: index_user_current_roles_on_uic_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_current_roles_on_uic_id ON user_current_roles USING btree (uic_id);


--
-- Name: index_user_current_roles_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_current_roles_on_user_id ON user_current_roles USING btree (user_id);


--
-- Name: index_user_roles_on_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_roles_on_role_id ON user_roles USING btree (role_id);


--
-- Name: index_user_roles_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_roles_on_user_id ON user_roles USING btree (user_id);


--
-- Name: index_user_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_user_roles_on_user_id_and_role_id ON user_roles USING btree (user_id, role_id);


--
-- Name: index_users_on_adm_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_adm_region_id ON users USING btree (adm_region_id);


--
-- Name: index_users_on_mobile_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_mobile_group_id ON users USING btree (mobile_group_id);


--
-- Name: index_users_on_organisation_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_organisation_id ON users USING btree (organisation_id);


--
-- Name: index_users_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_region_id ON users USING btree (region_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130726114822');

INSERT INTO schema_migrations (version) VALUES ('20130726221346');

INSERT INTO schema_migrations (version) VALUES ('20130726223510');

INSERT INTO schema_migrations (version) VALUES ('20130727131036');

INSERT INTO schema_migrations (version) VALUES ('20130727132534');

INSERT INTO schema_migrations (version) VALUES ('20130727132537');

INSERT INTO schema_migrations (version) VALUES ('20130730173403');

INSERT INTO schema_migrations (version) VALUES ('20130730180425');

INSERT INTO schema_migrations (version) VALUES ('20130730203354');

INSERT INTO schema_migrations (version) VALUES ('20130811121459');

INSERT INTO schema_migrations (version) VALUES ('20130811160415');

INSERT INTO schema_migrations (version) VALUES ('20130811165302');

INSERT INTO schema_migrations (version) VALUES ('20130811171141');

INSERT INTO schema_migrations (version) VALUES ('20130811220924');

INSERT INTO schema_migrations (version) VALUES ('20130811221939');

INSERT INTO schema_migrations (version) VALUES ('20130813105919');

INSERT INTO schema_migrations (version) VALUES ('20130813113924');

INSERT INTO schema_migrations (version) VALUES ('20130813122234');

INSERT INTO schema_migrations (version) VALUES ('20130813151901');

INSERT INTO schema_migrations (version) VALUES ('20130813170848');

INSERT INTO schema_migrations (version) VALUES ('20130813193341');

INSERT INTO schema_migrations (version) VALUES ('20130813193950');

INSERT INTO schema_migrations (version) VALUES ('20130813200539');

INSERT INTO schema_migrations (version) VALUES ('20130814101046');

INSERT INTO schema_migrations (version) VALUES ('20130815202632');

INSERT INTO schema_migrations (version) VALUES ('20130815210223');

INSERT INTO schema_migrations (version) VALUES ('20130815210417');

INSERT INTO schema_migrations (version) VALUES ('20130815211402');

INSERT INTO schema_migrations (version) VALUES ('20130815211619');

INSERT INTO schema_migrations (version) VALUES ('20130816160517');

INSERT INTO schema_migrations (version) VALUES ('20130816191659');

INSERT INTO schema_migrations (version) VALUES ('20130816220301');

INSERT INTO schema_migrations (version) VALUES ('20130817174402');

INSERT INTO schema_migrations (version) VALUES ('20130817175839');

INSERT INTO schema_migrations (version) VALUES ('20130817194218');

INSERT INTO schema_migrations (version) VALUES ('20130817204644');

INSERT INTO schema_migrations (version) VALUES ('20130817223022');

INSERT INTO schema_migrations (version) VALUES ('20130818091534');

INSERT INTO schema_migrations (version) VALUES ('20130818091535');

INSERT INTO schema_migrations (version) VALUES ('20130818214757');

INSERT INTO schema_migrations (version) VALUES ('20130819170952');

INSERT INTO schema_migrations (version) VALUES ('20130820192419');

INSERT INTO schema_migrations (version) VALUES ('20130822094843');

INSERT INTO schema_migrations (version) VALUES ('20130823202746');

INSERT INTO schema_migrations (version) VALUES ('20130826082649');

INSERT INTO schema_migrations (version) VALUES ('20130826151025');

INSERT INTO schema_migrations (version) VALUES ('20130827091430');

INSERT INTO schema_migrations (version) VALUES ('20130827171940');

INSERT INTO schema_migrations (version) VALUES ('20130827180623');

INSERT INTO schema_migrations (version) VALUES ('20130827214152');

INSERT INTO schema_migrations (version) VALUES ('20130828121339');

INSERT INTO schema_migrations (version) VALUES ('20130829072618');

INSERT INTO schema_migrations (version) VALUES ('20130829193839');

INSERT INTO schema_migrations (version) VALUES ('20130829194229');

INSERT INTO schema_migrations (version) VALUES ('20130830162405');

INSERT INTO schema_migrations (version) VALUES ('20130830191309');

INSERT INTO schema_migrations (version) VALUES ('20130831054421');

INSERT INTO schema_migrations (version) VALUES ('20130831111228');

INSERT INTO schema_migrations (version) VALUES ('20130831111344');

INSERT INTO schema_migrations (version) VALUES ('20130831113622');

INSERT INTO schema_migrations (version) VALUES ('20130831113656');

INSERT INTO schema_migrations (version) VALUES ('20130831163826');

INSERT INTO schema_migrations (version) VALUES ('20130831164236');

INSERT INTO schema_migrations (version) VALUES ('20130901092232');

INSERT INTO schema_migrations (version) VALUES ('20130901092258');

INSERT INTO schema_migrations (version) VALUES ('20130901092321');

INSERT INTO schema_migrations (version) VALUES ('20130901100509');

INSERT INTO schema_migrations (version) VALUES ('20130902101754');

INSERT INTO schema_migrations (version) VALUES ('20130902133030');

INSERT INTO schema_migrations (version) VALUES ('20130902155954');

INSERT INTO schema_migrations (version) VALUES ('20130903085753');

INSERT INTO schema_migrations (version) VALUES ('20130903142245');

INSERT INTO schema_migrations (version) VALUES ('20130903153558');

INSERT INTO schema_migrations (version) VALUES ('20130904105003');

INSERT INTO schema_migrations (version) VALUES ('20130904120404');

INSERT INTO schema_migrations (version) VALUES ('20130904134307');

INSERT INTO schema_migrations (version) VALUES ('20130904142329');

INSERT INTO schema_migrations (version) VALUES ('20130904142702');

INSERT INTO schema_migrations (version) VALUES ('20130905121332');

INSERT INTO schema_migrations (version) VALUES ('20130905161538');

INSERT INTO schema_migrations (version) VALUES ('20130905162113');

INSERT INTO schema_migrations (version) VALUES ('20130905183026');

INSERT INTO schema_migrations (version) VALUES ('20130905183345');

INSERT INTO schema_migrations (version) VALUES ('20130906062649');

INSERT INTO schema_migrations (version) VALUES ('20130906200032');

INSERT INTO schema_migrations (version) VALUES ('20130907102430');

INSERT INTO schema_migrations (version) VALUES ('20130907121354');

INSERT INTO schema_migrations (version) VALUES ('20130907171411');

INSERT INTO schema_migrations (version) VALUES ('20130907221736');

INSERT INTO schema_migrations (version) VALUES ('20131014160456');
