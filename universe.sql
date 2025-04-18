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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: composition; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.composition (
    composition_id integer NOT NULL,
    name character varying NOT NULL,
    value_in_percentage integer
);


ALTER TABLE public.composition OWNER TO freecodecamp;

--
-- Name: composition_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.composition_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.composition_name_seq OWNER TO freecodecamp;

--
-- Name: composition_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.composition_name_seq OWNED BY public.composition.composition_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text,
    radius_in_light_year integer,
    apparent_magnitude_in_v numeric(4,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying,
    surface_gravity_in_meter_per_second_square numeric(6,4),
    eccentricity numeric(6,5)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    star_id integer NOT NULL,
    has_life boolean,
    known_satellites integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    galaxy_id integer NOT NULL,
    age_in_billions_years numeric(4,2),
    is_in_main_sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: composition composition_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.composition ALTER COLUMN composition_id SET DEFAULT nextval('public.composition_name_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: composition; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.composition VALUES (1, 'Dark Energy', 68);
INSERT INTO public.composition VALUES (2, 'Dark Matter', 27);
INSERT INTO public.composition VALUES (3, 'Ordinary Matter', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 52850, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 110000, 3.40);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'elliptical', 60000, 9.60);
INSERT INTO public.galaxy VALUES (4, 'Whirpool Galaxy', 'spiral', 30000, 8.40);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', 'bared-spiral', 325000, 15.81);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'I0', 18500, 8.41);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1.6220, 0.05490);
INSERT INTO public.moon VALUES (2, 4, 'Enceladus', 0.1130, 0.00470);
INSERT INTO public.moon VALUES (3, 2, 'Ganymede', 1.4280, 0.00130);
INSERT INTO public.moon VALUES (4, 2, 'Callisto', 1.2350, 0.00740);
INSERT INTO public.moon VALUES (6, 2, 'Io', 1.7960, 0.00403);
INSERT INTO public.moon VALUES (7, 7, 'Phobos', 0.0057, 0.01510);
INSERT INTO public.moon VALUES (8, 4, 'Mimas', 0.0640, 0.01960);
INSERT INTO public.moon VALUES (9, 8, 'Titania', 0.3710, 0.00110);
INSERT INTO public.moon VALUES (10, 2, 'Amalthea', 0.0200, 0.00319);
INSERT INTO public.moon VALUES (11, 2, 'Europa', 1.3140, 0.00900);
INSERT INTO public.moon VALUES (12, 4, 'Iapetus', 0.2230, 0.02768);
INSERT INTO public.moon VALUES (13, 8, 'Umbriel', 0.1950, 0.00390);
INSERT INTO public.moon VALUES (14, 9, 'Triton', 0.7790, 0.00002);
INSERT INTO public.moon VALUES (15, 4, 'Rhea', 0.2600, 0.00100);
INSERT INTO public.moon VALUES (16, 7, 'Deimos', 0.0030, 0.00033);
INSERT INTO public.moon VALUES (17, 9, 'Larissa', 0.0200, 0.00139);
INSERT INTO public.moon VALUES (18, 9, 'Despina', 0.0060, 0.00038);
INSERT INTO public.moon VALUES (19, 9, 'Thalassa', 0.0100, 0.00176);
INSERT INTO public.moon VALUES (20, 8, 'Rosalind', 0.0050, 0.00011);
INSERT INTO public.moon VALUES (5, 8, 'Miranda', 0.0760, 0.00130);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, false, 95);
INSERT INTO public.planet VALUES (3, 'Proxima b', 7, false, 0);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 274);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, false, 0);
INSERT INTO public.planet VALUES (6, 'Venus', 1, false, 0);
INSERT INTO public.planet VALUES (7, 'Mars', 1, false, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, false, 28);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, false, 16);
INSERT INTO public.planet VALUES (10, 'Keppler-186f', 8, false, 0);
INSERT INTO public.planet VALUES (11, 'HD 209458b', 9, false, 0);
INSERT INTO public.planet VALUES (12, 'TOI-700 d', 10, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.60, true);
INSERT INTO public.star VALUES (2, 'Ross 128', 1, NULL, true);
INSERT INTO public.star VALUES (3, 'M31-RV', 2, NULL, false);
INSERT INTO public.star VALUES (4, 'SN 2014J', 6, NULL, false);
INSERT INTO public.star VALUES (5, 'Wolf 359', 1, 0.80, true);
INSERT INTO public.star VALUES (6, 'Sirius', 1, 0.23, true);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 4.85, true);
INSERT INTO public.star VALUES (8, 'Kepler-186', 1, 4.00, true);
INSERT INTO public.star VALUES (9, 'HD 209458', 1, 3.50, true);
INSERT INTO public.star VALUES (10, 'TOI-700', 1, 2.00, true);


--
-- Name: composition_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.composition_name_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: composition composition_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.composition
    ADD CONSTRAINT composition_name_key UNIQUE (name);


--
-- Name: composition composition_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.composition
    ADD CONSTRAINT composition_pkey PRIMARY KEY (composition_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

