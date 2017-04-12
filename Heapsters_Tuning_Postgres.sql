CREATE SCHEMA public
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public
  IS 'standard public schema';

CREATE TABLE public."Course"
(
  crs_code integer NOT NULL,
  dept_id integer NOT NULL,
  crs_name character varying NOT NULL,
  descry character varying NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Course"
  OWNER TO postgres;

CREATE TABLE public."Professor"
(
  id integer NOT NULL,
  name character varying NOT NULL,
  dept_id integer NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Professor"
  OWNER TO postgres;

CREATE TABLE public."Student"
(
  prof_id integer NOT NULL,
  crs_code integer NOT NULL,
  semester character varying NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Teaching"
  OWNER TO postgres;

CREATE TABLE public."Transcript"
(
  stud_id integer NOT NULL,
  crs_code integer NOT NULL,
  semester character varying NOT NULL,
  grade integer NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Transcript"
  OWNER TO postgres;
