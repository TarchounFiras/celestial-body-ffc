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
    name character varying(20),
    age_in_million_of_years integer,
    diameter_light_years integer,
    distance_from_earth numeric(6,3),
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(20),
    age_in_million_of_year integer,
    diameter integer,
    distance_from_earth numeric(6,3),
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL,
    description text
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
    age_in_million_of_year integer,
    diameter integer,
    distance_from_earth numeric(6,3),
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL,
    description text
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(20),
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    age_in_million_of_years integer,
    diameter integer,
    distance_from_earth numeric(6,3),
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL,
    description text
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 13600, 100000, 111.111, false, 'the milkey way is a barred spiral galaxy that contains our solar system.');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 10000, 220000, 222.222, false, 'the androma galaxy is the closest spiral galaxy to the milky way');
INSERT INTO public.galaxy VALUES (3, 'sombrero', 11500, 50000, 333.333, false, 'the sombrero galaxy is known for its bright nucleas');
INSERT INTO public.galaxy VALUES (4, 'triangulum', 11500, 50000, 333.333, false, 'the triangulum galaxy is known for its bright nucleas');
INSERT INTO public.galaxy VALUES (5, 'messier', 11500, 50000, 333.333, false, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.galaxy VALUES (6, 'large cloud', 11500, 50000, 333.333, false, 'the messier galaxy is known for its bright nucleas');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', 11000, 11100, 111.111, true, 3, 'luna es maravillosa');
INSERT INTO public.moon VALUES (2, 'europa', 11000, 11100, 111.111, true, 1, 'luna es maravillosa');
INSERT INTO public.moon VALUES (3, 'ganymede', 11000, 11100, 111.111, true, 2, 'luna es maravillosa');
INSERT INTO public.moon VALUES (4, 'calisto', 11000, 11100, 111.111, true, 4, 'luna es maravillosa');
INSERT INTO public.moon VALUES (5, 'titan', 11000, 11100, 111.111, true, 5, 'luna es maravillosa');
INSERT INTO public.moon VALUES (6, 'enceladus', 11000, 11100, 111.111, true, 6, 'luna es maravillosa');
INSERT INTO public.moon VALUES (7, 'lo', 11000, 11100, 111.111, true, 7, 'luna es maravillosa');
INSERT INTO public.moon VALUES (8, 'jo', 11000, 11100, 111.111, true, 8, 'luna es maravillosa');
INSERT INTO public.moon VALUES (9, 'deimos', 11000, 11100, 111.111, true, 9, 'luna es maravillosa');
INSERT INTO public.moon VALUES (10, 'triton', 11000, 11100, 111.111, true, 10, 'luna es maravillosa');
INSERT INTO public.moon VALUES (11, 'rhea', 11000, 11100, 111.111, true, 11, 'luna es maravillosa');
INSERT INTO public.moon VALUES (12, 'dione', 11000, 11100, 111.111, true, 12, 'luna es maravillosa');
INSERT INTO public.moon VALUES (13, 'mimas', 11000, 11100, 111.111, true, 1, 'luna es maravillosa');
INSERT INTO public.moon VALUES (14, 'oberon', 11000, 11100, 111.111, true, 2, 'luna es maravillosa');
INSERT INTO public.moon VALUES (15, 'miranda', 11000, 11100, 111.111, true, 3, 'luna es maravillosa');
INSERT INTO public.moon VALUES (16, 'ariel', 11000, 11100, 111.111, true, 4, 'luna es maravillosa');
INSERT INTO public.moon VALUES (17, 'charon', 11000, 11100, 111.111, true, 5, 'luna es maravillosa');
INSERT INTO public.moon VALUES (18, 'nereid', 11000, 11100, 111.111, true, 6, 'luna es maravillosa');
INSERT INTO public.moon VALUES (19, 'thyes', 11000, 11100, 111.111, true, 7, 'luna es maravillosa');
INSERT INTO public.moon VALUES (20, 'lapetus', 11000, 11100, 111.111, true, 8, 'luna es maravillosa');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 11500, 50000, 333.333, false, 1, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (2, 'venus', 11500, 50000, 333.333, false, 2, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (3, 'earth', 11500, 50000, 333.333, false, 3, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (4, 'jupiter', 11500, 50000, 333.333, false, 4, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (5, 'saturn', 11500, 50000, 333.333, false, 5, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (6, 'neptune', 11500, 50000, 333.333, false, 6, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (7, 'mars', 11500, 50000, 333.333, false, 5, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (8, 'uranus', 11500, 50000, 333.333, false, 1, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (9, 'plutot', 11500, 50000, 333.333, false, 1, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (11, 'zahra', 11500, 50000, 333.333, false, 4, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (12, 'vulcan', 11500, 50000, 333.333, false, 2, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.planet VALUES (10, 'zomorrouda', 11500, 50000, 333.333, false, 1, 'the messier galaxy is known for its bright nucleas');


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'a', 1);
INSERT INTO public.satellite VALUES (2, 'b', 2);
INSERT INTO public.satellite VALUES (3, 'c', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sirius', 11500, 50000, 333.333, false, 1, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.star VALUES (2, 'betegeuse', 11500, 50000, 333.333, false, 2, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.star VALUES (3, 'proxima', 11500, 50000, 333.333, false, 3, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.star VALUES (4, 'vega', 11500, 50000, 333.333, false, 4, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.star VALUES (5, 'antares', 11500, 50000, 333.333, false, 5, 'the messier galaxy is known for its bright nucleas');
INSERT INTO public.star VALUES (6, 'polaris', 11500, 50000, 333.333, false, 6, 'the messier galaxy is known for its bright nucleas');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

