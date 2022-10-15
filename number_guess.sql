--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(30) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (42, 30, 28);
INSERT INTO public.games VALUES (43, 30, 427);
INSERT INTO public.games VALUES (44, 31, 93);
INSERT INTO public.games VALUES (45, 31, 32);
INSERT INTO public.games VALUES (46, 30, 91);
INSERT INTO public.games VALUES (47, 30, 868);
INSERT INTO public.games VALUES (48, 30, 344);
INSERT INTO public.games VALUES (49, 32, 783);
INSERT INTO public.games VALUES (50, 32, 508);
INSERT INTO public.games VALUES (51, 33, 51);
INSERT INTO public.games VALUES (52, 33, 404);
INSERT INTO public.games VALUES (53, 32, 213);
INSERT INTO public.games VALUES (54, 32, 79);
INSERT INTO public.games VALUES (55, 32, 562);
INSERT INTO public.games VALUES (56, 34, 8);
INSERT INTO public.games VALUES (57, 34, 1);
INSERT INTO public.games VALUES (58, 35, 2);
INSERT INTO public.games VALUES (59, 35, 2);
INSERT INTO public.games VALUES (60, 36, 2);
INSERT INTO public.games VALUES (61, 36, 2);
INSERT INTO public.games VALUES (62, 35, 3);
INSERT INTO public.games VALUES (63, 35, 2);
INSERT INTO public.games VALUES (64, 35, 2);
INSERT INTO public.games VALUES (65, 37, 2);
INSERT INTO public.games VALUES (66, 37, 2);
INSERT INTO public.games VALUES (67, 38, 2);
INSERT INTO public.games VALUES (68, 38, 2);
INSERT INTO public.games VALUES (69, 37, 3);
INSERT INTO public.games VALUES (70, 37, 2);
INSERT INTO public.games VALUES (71, 37, 2);
INSERT INTO public.games VALUES (72, 39, 2);
INSERT INTO public.games VALUES (73, 39, 2);
INSERT INTO public.games VALUES (74, 40, 2);
INSERT INTO public.games VALUES (75, 40, 2);
INSERT INTO public.games VALUES (76, 39, 3);
INSERT INTO public.games VALUES (77, 39, 2);
INSERT INTO public.games VALUES (78, 39, 2);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1665870607800', 30);
INSERT INTO public.players VALUES ('user_1665870607799', 31);
INSERT INTO public.players VALUES ('user_1665870668032', 32);
INSERT INTO public.players VALUES ('user_1665870668031', 33);
INSERT INTO public.players VALUES ('Shaun', 34);
INSERT INTO public.players VALUES ('user_1665870902856', 35);
INSERT INTO public.players VALUES ('user_1665870902855', 36);
INSERT INTO public.players VALUES ('user_1665870980078', 37);
INSERT INTO public.players VALUES ('user_1665870980077', 38);
INSERT INTO public.players VALUES ('user_1665871090814', 39);
INSERT INTO public.players VALUES ('user_1665871090813', 40);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 78, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 40, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

