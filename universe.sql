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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    period_years numeric,
    is_periodic boolean NOT NULL,
    last_seen_year integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type text NOT NULL,
    diameter_light_years numeric,
    has_black_hole boolean NOT NULL,
    age_billion_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    moon_type text NOT NULL,
    orbital_period_days numeric,
    has_atmosphere boolean NOT NULL,
    diameter_km integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    orbital_period_days numeric,
    has_life boolean NOT NULL,
    distance_from_star numeric
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text NOT NULL,
    temperature_kelvin integer,
    mass_solar_mass numeric,
    is_binary boolean NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 76, true, 1986);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2534, true, 1997);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 1, 70000, true, 1996);
INSERT INTO public.comet VALUES (4, 'McNaught', 1, 92600, true, 2007);
INSERT INTO public.comet VALUES (5, 'ISON', 1, 1000, true, 2013);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, 13);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, true, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, false, 8);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 50000, true, 9);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 60000, true, 7);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 170000, true, 11);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Rocky', 27.3, false, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Rocky', 0.3, false, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Rocky', 1.3, false, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic', 1.8, true, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy', 3.5, true, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Icy', 7.2, true, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Icy', 16.7, true, 4821);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 'Icy', 0.9, false, 396);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Icy', 1.3, true, 504);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'Icy', 1.9, false, 1062);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Icy', 2.7, false, 1123);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Icy', 4.5, false, 1528);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 'Icy', 16, true, 5150);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 'Icy', 79, false, 1470);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 'Icy', 1.4, false, 471);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Icy', 2.5, false, 1158);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'Icy', 4.1, false, 1169);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'Icy', 8.7, false, 1578);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 'Icy', 13.5, false, 1523);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Icy', 5.9, true, 2707);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, false, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, false, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365.25, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, false, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333, false, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759, false, 9.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30687, false, 19.2);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60190, false, 30.1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Terrestrial', 11.2, false, 0.0485);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, 'Terrestrial', 130, false, 0.43);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 4, 'Terrestrial', 4.05, false, 0.021);
INSERT INTO public.planet VALUES (12, 'HD 10180 g', 5, 'Gas Giant', 600, false, 1.4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 5778, 1, false);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 'A-type', 9940, 2.063, true);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 2, 'B-type', 13800, 3.5, true);
INSERT INTO public.star VALUES (4, 'Beta Trianguli', 3, 'A-type', 8300, 2.5, true);
INSERT INTO public.star VALUES (5, 'Messier 104 Star', 4, 'K-type', 4500, 0.8, false);
INSERT INTO public.star VALUES (6, 'Messier 51 Star', 5, 'F-type', 6000, 1.2, true);
INSERT INTO public.star VALUES (7, 'Messier 101 Star', 6, 'G-type', 5800, 1, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

