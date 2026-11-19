--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth_mly numeric,
    description text,
    radius_light_years integer
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    planet_id integer,
    name character varying(100) NOT NULL,
    launch_year integer,
    is_active boolean DEFAULT false,
    notes text
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(100) NOT NULL,
    distance_from_planet_km numeric(12,2),
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    is_habitable boolean DEFAULT false,
    mass_earth numeric(10,4)
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
    galaxy_id integer,
    name character varying(100) NOT NULL,
    temperature_k integer,
    is_binary_system boolean DEFAULT false
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Barred Spiral', 0.00, NULL, 52850);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral', 2.54, NULL, 110000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Spiral', 2.73, NULL, 30000);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 'Lenticular', 29.30, NULL, 25000);
INSERT INTO public.galaxy VALUES ('Whirlpool', 5, 'Spiral', 23.16, NULL, 38000);
INSERT INTO public.galaxy VALUES ('Messier 87', 6, 'Elliptical', 53.49, NULL, 120000);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 5, 'Voyager 1', 1977, true, 'Flew past Jupiter and Saturn; now in interstellar space.');
INSERT INTO public.mission VALUES (2, 6, 'Cassini', 1997, false, 'Orbited Saturn for 13 years and deployed the Huygens probe to Titan.');
INSERT INTO public.mission VALUES (3, 5, 'Juno', 2011, true, 'Studying Jupiter''s composition, gravity field, and magnetic poles.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 384400.00, 'Earth''s only natural satellite and the fifth-largest moon in the Solar System.');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 9376.00, 'Larger and closer inner moon of Mars with a heavily cratered surface.');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 23463.00, 'Smaller, smoother outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 5, 'Io', 421700.00, 'Most volcanically active body in the Solar System, orbiting Jupiter.');
INSERT INTO public.moon VALUES (5, 5, 'Europa', 671034.00, 'Icy Jovian moon believed to hide a subsurface liquid water ocean.');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 1070412.00, 'Largest moon in the Solar System, bigger than Mercury.');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 1882709.00, 'Ancient, heavily cratered outer Galilean moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 181366.00, 'Irregularly shaped inner moon of Jupiter with a reddish tint.');
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 11460000.00, 'Largest member of the prograde irregular moons orbiting Jupiter.');
INSERT INTO public.moon VALUES (10, 5, 'Thebe', 221895.00, 'Fourth of Jupiter''s inner moons by distance from the planet.');
INSERT INTO public.moon VALUES (11, 6, 'Titan', 1221870.00, 'Saturn''s largest moon, featuring a dense nitrogen atmosphere and liquid lakes.');
INSERT INTO public.moon VALUES (12, 6, 'Enceladus', 237948.00, 'Icy moon of Saturn famous for cryovolcanic water plumes.');
INSERT INTO public.moon VALUES (13, 6, 'Mimas', 185539.00, 'Small moon of Saturn dominated by the giant Herschel crater.');
INSERT INTO public.moon VALUES (14, 6, 'Rhea', 527108.00, 'Second-largest moon of Saturn, composed mostly of ice and rock.');
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', 3560820.00, 'Saturnian moon known for its dramatic two-tone coloration.');
INSERT INTO public.moon VALUES (16, 6, 'Dione', 377396.00, 'Dense icy moon of Saturn with prominent ice cliffs.');
INSERT INTO public.moon VALUES (17, 6, 'Tethys', 294619.00, 'Icy moon of Saturn featuring the vast Odysseus impact crater.');
INSERT INTO public.moon VALUES (18, 7, 'Titania', 435910.00, 'Largest moon of Uranus, made of roughly equal parts ice and rock.');
INSERT INTO public.moon VALUES (19, 7, 'Oberon', 583520.00, 'Outermost major moon of Uranus with heavily cratered icy terrain.');
INSERT INTO public.moon VALUES (20, 8, 'Triton', 354759.00, 'Largest moon of Neptune and the only major moon with a retrograde orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, false, 0.0553);
INSERT INTO public.planet VALUES ('Venus', 2, 1, false, 0.8150);
INSERT INTO public.planet VALUES ('Earth', 3, 1, true, 1.0000);
INSERT INTO public.planet VALUES ('Mars', 4, 1, false, 0.1070);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, false, 317.8000);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, false, 95.1600);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, false, 14.5400);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, false, 17.1500);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, 2, true, 1.0700);
INSERT INTO public.planet VALUES ('Kepler-90b', 10, 4, false, 2.5000);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 11, 5, true, 0.6920);
INSERT INTO public.planet VALUES ('TRAPPIST-1f', 12, 5, true, 1.0390);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 5778, false);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 3042, true);
INSERT INTO public.star VALUES (3, 1, 'Sirius A', 9940, true);
INSERT INTO public.star VALUES (4, 1, 'Kepler-90', 6080, false);
INSERT INTO public.star VALUES (5, 1, 'TRAPPIST-1', 2566, false);
INSERT INTO public.star VALUES (6, 2, 'Alpheratz', 13800, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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
-- Name: mission mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

