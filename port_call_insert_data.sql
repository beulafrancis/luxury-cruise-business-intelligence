--
-- PostgreSQL database dump
--

\restrict xknEodfJSVmiCKK4PO9RGLehHZ9rJZRAvwh247TLkxG5ffUOYOYJ7LwwSfGUKky

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-21 22:03:07

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
-- TOC entry 5054 (class 0 OID 16444)
-- Dependencies: 229
-- Data for Name: port_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.port_call (port_call_id, port_id, port_name, city, country, continent, port_type, port_code, sequence_no, arrival_time, departure_time, stay_hours, distance_from_previous_nm, distance_to_next_nm, berth_name, berth_status, port_fee, passenger_embarkation, passenger_disembarkation, fuel_bunkering, fresh_water_supply, food_restocking, port_operation_status, weather_condition, weather_delay_hours, port_call_status, latitude, longitude, berth_count, port_accessibility, arrival_date, route_id) FROM stdin;
4	4	Port Klang	Port Klang	Malaysia	Asia	International Port	MYPKG	4	2025-03-19 06:00:00	2025-03-22 18:00:00	82.00	15.00	10200.00	Westport 5	Available	52000.00	12	0	Yes	Yes	Yes	Completed	Heavy Rain	0.00	Completed	3.049700	101.354700	6	Easy	2025-03-19	4
2	2	Colombo	Colombo	Sri Lanka	Asia	International Port	LKCMB	2	2025-03-07 06:00:00	2025-03-07 18:00:00	12.00	165.00	920.00	Berth C3	Available	38000.00	13	0	Yes	Yes	Yes	Completed	Partly Cloudy	0.00	Completed	6.927100	79.861200	5	Easy	2025-03-07	2
3	3	Singapore	Singapore	Singapore	Asia	International Port	SGSIN	3	2025-03-12 08:00:00	2025-03-17 18:00:00	130.00	920.00	15.00	Marina Berth 2	Available	65000.00	5	0	Yes	Yes	Yes	Completed	Thunderstorm	0.00	Completed	1.264400	103.822200	8	Easy	2025-03-12	3
11	11	Rio de Janeiro	Rio de Janeiro	Brazil	South America	International Port	BRRIO	11	2025-06-18 08:00:00	2025-06-22 18:00:00	106.00	2250.00	1200.00	Pier Maua	Available	62000.00	0	0	Yes	Yes	Yes	Completed	Rain	0.00	Completed	-22.902800	-43.172900	8	Moderate	2025-06-18	11
12	12	Buenos Aires	Buenos Aires	Argentina	South America	International Port	ARBUE	12	2025-06-27 08:00:00	2025-07-01 18:00:00	106.00	1200.00	3450.00	Quinquela Martin Terminal	Available	60000.00	0	0	Yes	Yes	Yes	Completed	Clear	1.25	Completed	-34.603700	-58.381600	7	Easy	2025-06-27	12
13	13	Cape Town	Cape Town	South Africa	Africa	International Port	ZACPT	14	2025-08-25 08:00:00	2025-08-29 18:00:00	106.00	3450.00	800.00	Duncan Dock	Available	64000.00	0	0	Yes	Yes	Yes	Completed	Windy	0.00	Completed	-33.918000	18.423300	6	Moderate	2025-08-25	14
14	14	Durban	Durban	South Africa	Africa	International Port	ZADUR	15	2025-09-02 08:00:00	2025-09-06 18:00:00	106.00	800.00	6900.00	N-Shed Cruise Terminal	Available	56000.00	0	0	Yes	Yes	Yes	Completed	Partly Cloudy	0.00	Completed	-29.883300	31.050000	6	Moderate	2025-09-02	15
15	15	Sydney	Sydney	Australia	Oceania	International Port	AUSYD	16	2025-09-18 08:00:00	2025-09-22 18:00:00	106.00	6900.00	1300.00	Overseas Passenger Terminal	Available	75000.00	0	0	Yes	Yes	Yes	Completed	Sunny	0.00	Completed	-33.852300	151.210800	8	Easy	2025-09-18	16
16	16	Auckland	Auckland	New Zealand	Oceania	International Port	NZAKL	17	2025-09-25 08:15:00	2025-09-29 18:00:00	106.00	1300.00	3800.00	Queens Wharf	Available	61000.00	0	0	Yes	Yes	Yes	Completed	Rain	0.00	Completed	-36.841900	174.766100	6	Easy	2025-09-25	17
17	17	Honolulu	Honolulu	United States	North America	International Port	USHNL	18	2025-10-11 10:00:00	2025-10-14 18:15:00	106.00	3800.00	2500.00	Pier 2	Available	67000.00	0	0	Yes	Yes	Yes	Completed	Clear	25.50	Completed	21.306900	-157.858300	5	Easy	2025-10-11	18
5	5	Hamburg	Hamburg	Germany	Europe	International Port	DEHAM	5	2025-04-16 08:00:00	2025-04-20 18:00:00	106.00	10200.00	230.00	Cruise Terminal 1	Available	72000.00	0	0	Yes	Yes	Yes	Completed	Cloudy	0.00	Completed	53.551100	9.993700	10	Moderate	2025-04-16	5
8	8	Lisbon	Lisbon	Portugal	Europe	International Port	PTLIS	8	2025-05-08 08:00:00	2025-05-12 18:00:00	106.00	560.00	2900.00	Cruise Terminal	Available	58000.00	0	0	Yes	Yes	Yes	Completed	Sunny	0.00	Completed	38.722300	-9.139300	7	Easy	2025-05-08	8
9	9	New York	New York City	United States	North America	International Port	USNYC	9	2025-05-25 08:00:00	2025-05-30 18:00:00	130.00	2900.00	1100.00	Manhattan Cruise Terminal	Available	85000.00	0	0	Yes	Yes	Yes	Completed	Partly Cloudy	0.00	Completed	40.678200	-74.044000	8	Moderate	2025-05-25	9
10	10	Miami	Miami	United States	North America	International Port	USMIA	10	2025-06-03 08:00:00	2025-06-07 18:00:00	106.00	1100.00	2250.00	PortMiami Terminal	Available	78000.00	0	0	Yes	Yes	Yes	Completed	Thunderstorm	0.00	Completed	25.774300	-80.170000	7	Easy	2025-06-03	10
21	21	Manaus	Manaus	Brazil	South America	River Port	BRMAO	13	2025-08-10 08:00:00	2025-08-15 18:00:00	130.00	0.00	0.00	Manaus Cruise Terminal	Available	50000.00	0	0	No	Yes	Yes	Completed	Rainforest Rain	0.00	Completed	-3.119000	-60.021700	3	Restricted	2025-08-10	13
20	20	Dubai	Dubai	United Arab Emirates	Asia	International Port	AEDXB	21	2025-11-15 08:00:00	2025-11-19 18:00:00	106.00	7300.00	1850.00	Dubai Harbour	Available	90000.00	0	200	Yes	Yes	Yes	Completed	Clear	0.00	Completed	25.276000	55.296200	7	Easy	2025-11-15	21
18	18	Los Angeles	Los Angeles	United States	North America	International Port	USLAX	19	2025-10-19 08:10:00	2025-10-23 18:20:00	106.00	2500.00	1200.00	World Cruise Center	Available	80000.00	0	0	Yes	Yes	Yes	Completed	Fog	0.00	Completed	33.740500	-118.272500	9	Easy	2025-10-19	19
19	19	Vancouver	Vancouver	Canada	North America	International Port	CAVAN	20	2025-10-30 08:15:00	2025-11-02 18:25:00	106.00	1200.00	7300.00	Canada Place	Available	82000.00	0	0	Yes	Yes	Yes	Completed	Rain	0.00	Completed	49.282700	-123.120700	8	Easy	2025-10-30	20
22	1	Mumbai	Mumbai	India	Asia	Home Port	INTUT	22	2025-11-25 08:00:00	2025-11-25 18:00:00	10.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Planned	\N	\N	\N	\N	2025-11-25	21
6	6	Rotterdam	Rotterdam	Netherlands	Europe	International Port	NLRTM	6	2025-04-22 06:00:00	2025-04-26 18:00:00	106.00	230.00	450.00	Cruise Port Berth 4	Available	68000.00	0	0	Yes	Yes	Yes	Completed	Rain	0.00	Completed	51.947500	4.144500	12	Easy	2025-04-22	6
7	7	Southampton	Southampton	United Kingdom	Europe	International Port	GBSOU	7	2025-05-01 06:00:00	2025-05-05 18:00:00	106.00	450.00	560.00	Mayflower Terminal	Available	70000.00	0	0	Yes	Yes	Yes	Completed	Cloudy	1.50	Completed	50.909700	-1.404400	8	Easy	2025-05-01	7
1	1	Mumbai	Mumbai	India	Asia	Home Port	INTUT	1	2025-03-06 08:00:00	2025-03-06 18:00:00	10.00	0.00	165.00	Berth A1	Available	45000.00	1370	1200	Yes	Yes	Yes	Completed	Clear	0.00	Completed	8.764200	78.134800	6	Easy	2025-03-06	1
\.


-- Completed on 2026-10-21 22:03:08

--
-- PostgreSQL database dump complete
--

\unrestrict xknEodfJSVmiCKK4PO9RGLehHZ9rJZRAvwh247TLkxG5ffUOYOYJ7LwwSfGUKky

