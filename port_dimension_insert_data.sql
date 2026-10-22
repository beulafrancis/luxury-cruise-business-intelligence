--
-- PostgreSQL database dump
--

\restrict ufYjSKAQtzth2VfNbZbFlC7XJCl2uoXWRXsnmiZExHv5e3ez8vTSnU9e8otSqVn

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-21 22:03:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5051 (class 0 OID 16452)
-- Dependencies: 230
-- Data for Name: port_dimension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.port_dimension (port_id, port_name, city, country, continent, port_type, port_code) FROM stdin;
2	Colombo	Colombo	Sri Lanka	Asia	International Port	LKCMB
3	Singapore	Singapore	Singapore	Asia	International Port	SGSIN
4	Port Klang	Port Klang	Malaysia	Asia	International Port	MYPKG
5	Hamburg	Hamburg	Germany	Europe	International Port	DEHAM
6	Rotterdam	Rotterdam	Netherlands	Europe	International Port	NLRTM
7	Southampton	Southampton	United Kingdom	Europe	International Port	GBSOU
8	Lisbon	Lisbon	Portugal	Europe	International Port	PTLIS
9	New York	New York City	United States	North America	International Port	USNYC
10	Miami	Miami	United States	North America	International Port	USMIA
11	Rio de Janeiro	Rio de Janeiro	Brazil	South America	International Port	BRRIO
12	Buenos Aires	Buenos Aires	Argentina	South America	International Port	ARBUE
13	Cape Town	Cape Town	South Africa	Africa	International Port	ZACPT
14	Durban	Durban	South Africa	Africa	International Port	ZADUR
15	Sydney	Sydney	Australia	Oceania	International Port	AUSYD
16	Auckland	Auckland	New Zealand	Oceania	International Port	NZAKL
17	Honolulu	Honolulu	United States	North America	International Port	USHNL
18	Los Angeles	Los Angeles	United States	North America	International Port	USLAX
19	Vancouver	Vancouver	Canada	North America	International Port	CAVAN
20	Dubai	Dubai	United Arab Emirates	Asia	International Port	AEDXB
21	Manaus	Manaus	Brazil	South America	River Port	BRMAO
1	Mumbai	Thoothukudi	India	Asia	Home Port	INTUT
\.


-- Completed on 2026-10-21 22:03:48

--
-- PostgreSQL database dump complete
--

\unrestrict ufYjSKAQtzth2VfNbZbFlC7XJCl2uoXWRXsnmiZExHv5e3ez8vTSnU9e8otSqVn

