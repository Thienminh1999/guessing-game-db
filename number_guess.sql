--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: played_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.played_history (
    history_id integer NOT NULL,
    user_id integer,
    score integer
);


ALTER TABLE public.played_history OWNER TO freecodecamp;

--
-- Name: played_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.played_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.played_history_history_id_seq OWNER TO freecodecamp;

--
-- Name: played_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.played_history_history_id_seq OWNED BY public.played_history.history_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: played_history history_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.played_history ALTER COLUMN history_id SET DEFAULT nextval('public.played_history_history_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: played_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.played_history VALUES (1, 1, 2);
INSERT INTO public.played_history VALUES (2, 1, 2);
INSERT INTO public.played_history VALUES (3, 2, 684);
INSERT INTO public.played_history VALUES (4, 2, 999);
INSERT INTO public.played_history VALUES (5, 3, 764);
INSERT INTO public.played_history VALUES (6, 3, 33);
INSERT INTO public.played_history VALUES (7, 2, 82);
INSERT INTO public.played_history VALUES (8, 2, 471);
INSERT INTO public.played_history VALUES (9, 2, 639);
INSERT INTO public.played_history VALUES (10, 4, 630);
INSERT INTO public.played_history VALUES (11, 4, 892);
INSERT INTO public.played_history VALUES (12, 5, 373);
INSERT INTO public.played_history VALUES (13, 5, 846);
INSERT INTO public.played_history VALUES (14, 4, 856);
INSERT INTO public.played_history VALUES (15, 4, 24);
INSERT INTO public.played_history VALUES (16, 4, 938);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Minh');
INSERT INTO public.users VALUES (2, 'user_1715237318908');
INSERT INTO public.users VALUES (3, 'user_1715237318907');
INSERT INTO public.users VALUES (4, 'user_1715237419188');
INSERT INTO public.users VALUES (5, 'user_1715237419187');


--
-- Name: played_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.played_history_history_id_seq', 16, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- Name: played_history played_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.played_history
    ADD CONSTRAINT played_history_pkey PRIMARY KEY (history_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: played_history played_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.played_history
    ADD CONSTRAINT played_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

