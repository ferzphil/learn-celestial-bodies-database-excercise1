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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_light_years numeric(12,3)
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean DEFAULT true,
    age_in_millions_of_years integer,
    distance_from_earth_light_years numeric(12,3),
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    age_in_millions_of_years integer,
    distance_from_earth_light_years numeric(12,3),
    star_id integer
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
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean DEFAULT true,
    age_in_millions_of_years integer,
    distance_from_earth_light_years numeric(12,3),
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 4500, 2537000.000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, 13600, 100000.000);
INSERT INTO public.galaxy VALUES (3, 'Condor', NULL, NULL, 212000000.000);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', NULL, NULL, 67000000.000);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', NULL, NULL, 17000000.000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', NULL, NULL, 140000000.000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (4, 'Irregular Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (6, 'Barred Spiral Galaxies', NULL);
INSERT INTO public.galaxy_types VALUES (7, 'Spiral Galaxy Subtypes', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', NULL, true, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, true, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, true, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, true, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', NULL, true, NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, true, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, true, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, true, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Triton', NULL, true, NULL, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Hyperion', NULL, true, NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, true, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (1, 'Mercury', NULL, false, true, 4600, NULL, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1c', NULL, false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1d', NULL, false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1e', NULL, false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1f', NULL, false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1g', NULL, false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1h', NULL, false, true, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Andromeda I', NULL, true, NULL, 2537000.000, 1);
INSERT INTO public.star VALUES (3, 'Andromeda II', NULL, true, NULL, 2537000.000, 1);
INSERT INTO public.star VALUES (4, 'Andromeda III', NULL, true, NULL, 2537000.000, 1);
INSERT INTO public.star VALUES (2, 'Sun', NULL, true, 4603, NULL, 2);
INSERT INTO public.star VALUES (5, 'Sirius', NULL, true, 200, 8.600, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', NULL, true, 6000, 4.370, 2);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', NULL, true, NULL, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: galaxy_types galaxy_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_unique UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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

