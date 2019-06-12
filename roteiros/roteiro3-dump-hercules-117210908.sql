--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
ALTER TABLE ONLY public.perfil DROP CONSTRAINT perfil_id_usuario_key;
ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmarcias_id_farmacia_pkey;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmacias_bairro_key;
ALTER TABLE ONLY public.farmacias DROP CONSTRAINT farmacia_sede_excl;
DROP TABLE public.usuarios;
DROP TABLE public.perfil;
DROP TABLE public.musicas;
DROP TABLE public.funcionarios;
DROP TABLE public.farmacias;
DROP TABLE public.avaliacoes;
DROP TYPE public.estados_nordeste;
DROP EXTENSION btree_gist;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: estados_nordeste; Type: TYPE; Schema: public; Owner: hercules
--

CREATE TYPE public.estados_nordeste AS ENUM (
    'PB',
    'CE',
    'RN',
    'AL',
    'BH',
    'PI',
    'PE',
    'MA',
    'SE'
);


ALTER TYPE public.estados_nordeste OWNER TO hercules;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: avaliacoes; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.avaliacoes (
    nota smallint NOT NULL,
    data_ava date,
    CONSTRAINT avaliacoes_nota_check CHECK (((0 <= nota) AND (nota >= 5)))
);


ALTER TABLE public.avaliacoes OWNER TO hercules;

--
-- Name: farmacias; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.farmacias (
    id_farmacia integer NOT NULL,
    farmacia_sede character(1) NOT NULL,
    cidade character varying(20) NOT NULL,
    bairro character varying(50) NOT NULL,
    estado public.estados_nordeste,
    CONSTRAINT farmacias_farmacia_sede_check CHECK (((farmacia_sede = 'S'::bpchar) OR (farmacia_sede = 'F'::bpchar)))
);


ALTER TABLE public.farmacias OWNER TO hercules;

--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.funcionarios (
    nome character varying(20) NOT NULL,
    idade integer NOT NULL,
    cpf character varying(11) NOT NULL
);


ALTER TABLE public.funcionarios OWNER TO hercules;

--
-- Name: musicas; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.musicas (
    titulo character varying(20) NOT NULL,
    estilo character(1) NOT NULL,
    CONSTRAINT musicas_estilo_check CHECK ((estilo = ANY (ARRAY['R'::bpchar, 'P'::bpchar, 'E'::bpchar, 'S'::bpchar, 'A'::bpchar, 'C'::bpchar])))
);


ALTER TABLE public.musicas OWNER TO hercules;

--
-- Name: perfil; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.perfil (
    id_usuario integer NOT NULL,
    descr_perfil text NOT NULL,
    cadastra_usuario boolean NOT NULL,
    cadastra_musica boolean NOT NULL,
    faz_avaliacao boolean NOT NULL
);


ALTER TABLE public.perfil OWNER TO hercules;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: hercules
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(15) NOT NULL,
    data_nascimento date NOT NULL
);


ALTER TABLE public.usuarios OWNER TO hercules;

--
-- Data for Name: avaliacoes; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Data for Name: farmacias; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Data for Name: musicas; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: hercules
--



--
-- Name: farmacia_sede_excl; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmacia_sede_excl EXCLUDE USING gist (farmacia_sede WITH =) WHERE ((farmacia_sede = 'S'::bpchar));


--
-- Name: farmacias_bairro_key; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmacias_bairro_key UNIQUE (bairro);


--
-- Name: farmarcias_id_farmacia_pkey; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.farmacias
    ADD CONSTRAINT farmarcias_id_farmacia_pkey PRIMARY KEY (id_farmacia);


--
-- Name: funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cpf);


--
-- Name: perfil_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_id_usuario_key UNIQUE (id_usuario);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: hercules
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

