--
-- PostgreSQL database dump
--

\restrict bbeYd3znL43uF9gbyBkbySIHcotV350zb5c5gicXLxXBDtnTFnxRWoa9AG8LMOf

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-21 22:22:48

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
-- TOC entry 5053 (class 0 OID 16470)
-- Dependencies: 232
-- Data for Name: weather_climate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_climate (weather_climate_id, port_call_id, month_number, month_name, port_name, city, country, continent, climate_zone, climate_type, season, temperature_min_c, temperature_max_c, average_temperature_c, rainfall_level, rainfall_pattern, humidity_level, wind_condition, sea_condition, storm_risk, cyclone_risk, weather_condition, cruise_suitability, activity_impact, route_risk, climate_notes, data_source) FROM stdin;
1	1	3	March	Tuticorin	Thoothukudi	India	Asia	Tropical	Tropical Dry	Pre-Monsoon	26.00	34.00	30.00	Low	Hot and mostly dry	High	Light to moderate	Calm to Moderate	Low	Low	Hot and humid	Good	Outdoor activities may be comfortable in morning	Low	Hot coastal climate before monsoon	Climate normals / Project dataset
2	2	3	March	Colombo	Colombo	Sri Lanka	Asia	Tropical	Tropical Rainforest	Inter-Monsoon	25.00	31.00	28.00	Medium	Occasional showers	High	Light to moderate	Moderate	Low	Low	Warm with showers	Good	Short rain interruptions possible	Low	Tropical coastal climate	Climate normals / Project dataset
3	3	3	March	Singapore	Singapore	Singapore	Asia	Tropical	Equatorial	Inter-Monsoon	25.00	32.00	29.00	High	Frequent showers	Very High	Variable	Moderate	Low	Low	Hot and humid with showers	Moderate	Outdoor activities may be interrupted	Low	Equatorial climate with rainfall throughout the year	Climate normals / Project dataset
4	4	3	March	Port Klang	Port Klang	Malaysia	Asia	Tropical	Equatorial	Inter-Monsoon	25.00	33.00	29.00	High	Thunderstorms and showers	High	Variable	Moderate	Low	Low	Hot and humid	Moderate	Rain may affect shore activities	Low	Tropical maritime climate	Climate normals / Project dataset
5	5	4	April	Hamburg	Hamburg	Germany	Europe	Temperate	Oceanic	Spring	5.00	14.00	10.00	Medium	Variable spring rainfall	Medium	Moderate	Moderate	Low	Low	Cool and variable	Moderate	Outdoor activities depend on rain and temperature	Low	Cool maritime spring	Climate normals / Project dataset
6	6	4	April	Rotterdam	Rotterdam	Netherlands	Europe	Temperate	Oceanic	Spring	6.00	15.00	11.00	Medium	Occasional rain	Medium	Moderate	Moderate	Low	Low	Cool with showers	Moderate	Rain may affect sightseeing	Low	North Sea maritime climate	Climate normals / Project dataset
7	7	5	May	Southampton	Southampton	United Kingdom	Europe	Temperate	Oceanic	Spring	8.00	17.00	13.00	Medium	Showers and cloudy periods	Medium	Moderate	Moderate	Low	Low	Mild and cloudy	Good	Outdoor activities generally possible	Low	Cool maritime climate	Climate normals / Project dataset
8	8	5	May	Lisbon	Lisbon	Portugal	Europe	Mediterranean	Mediterranean	Spring	13.00	23.00	18.00	Low	Mostly dry	Medium	Light to moderate	Calm	Low	Low	Mild and mostly dry	Very Good	Good conditions for shore excursions	Low	Mediterranean spring climate	Climate normals / Project dataset
9	9	6	June	New York	New York City	United States	North America	Temperate	Humid Subtropical	Summer	18.00	27.00	23.00	Medium	Thunderstorms possible	Medium	Moderate	Moderate	Medium	Low	Warm and humid	Good	Thunderstorms may affect outdoor activities	Medium	Early summer with occasional storms	Climate normals / Project dataset
10	10	6	June	Miami	Miami	United States	North America	Tropical	Tropical Monsoon	Wet Season	25.00	32.00	29.00	High	Frequent heavy showers	High	Strong tropical winds possible	Moderate to Rough	High	Medium	Hot, humid and rainy	Moderate	Rain and storms may cancel activities	Medium	Wet tropical summer	Climate normals / Project dataset
11	11	6	June	Rio de Janeiro	Rio de Janeiro	Brazil	South America	Tropical	Tropical Savanna	Winter	19.00	26.00	23.00	Medium	Mostly dry with occasional showers	Medium	Moderate	Moderate	Low	Low	Mild and partly dry	Good	Most outdoor activities possible	Low	Southern Hemisphere winter	Climate normals / Project dataset
12	12	7	July	Buenos Aires	Buenos Aires	Argentina	South America	Temperate	Humid Subtropical	Winter	8.00	15.00	11.00	Medium	Cool and occasional rain	Medium	Moderate	Moderate	Low	Low	Cool winter weather	Moderate	Outdoor activities may require warm clothing	Low	Southern Hemisphere winter	Climate normals / Project dataset
13	13	7	July	Cape Town	Cape Town	South Africa	Africa	Mediterranean	Mediterranean	Winter	8.00	18.00	13.00	High	Winter rainfall	Medium	Strong coastal winds	Rough at times	Medium	Low	Cool, rainy and windy	Moderate	Strong winds can affect excursions	Medium	Wet Mediterranean winter	Climate normals / Project dataset
14	14	7	July	Durban	Durban	South Africa	Africa	Subtropical	Humid Subtropical	Winter	13.00	23.00	18.00	Medium	Occasional showers	High	Moderate	Moderate	Low	Low	Mild and humid	Good	Most activities possible	Low	Mild coastal winter	Climate normals / Project dataset
15	15	8	August	Sydney	Sydney	Australia	Oceania	Temperate	Oceanic	Winter	9.00	19.00	14.00	Medium	Occasional rain	Medium	Moderate	Moderate	Low	Low	Cool and partly cloudy	Good	Outdoor activities possible with cool conditions	Low	Southern Hemisphere winter	Climate normals / Project dataset
16	16	8	August	Auckland	Auckland	New Zealand	Oceania	Temperate	Oceanic	Winter	8.00	15.00	12.00	High	Frequent showers	High	Strong westerly winds	Rough at times	Medium	Low	Cool, wet and windy	Moderate	Outdoor activities may be affected	Medium	Maritime winter climate	Climate normals / Project dataset
17	17	9	September	Honolulu	Honolulu	United States	North America	Tropical	Tropical	Late Summer	24.00	30.00	27.00	Medium	Short tropical showers	High	Moderate trade winds	Moderate	Medium	Low	Warm with occasional showers	Good	Short showers may interrupt activities	Medium	Tropical Pacific climate	Climate normals / Project dataset
18	18	9	September	Los Angeles	Los Angeles	United States	North America	Mediterranean	Mediterranean	Late Summer	17.00	27.00	22.00	Low	Mostly dry	Low	Light to moderate	Calm	Low	Low	Warm and dry	Very Good	Excellent conditions for shore activities	Low	Dry Mediterranean-type climate	Climate normals / Project dataset
19	19	10	October	Vancouver	Vancouver	Canada	North America	Temperate	Oceanic	Autumn	7.00	14.00	11.00	High	Frequent rainfall	High	Moderate to strong	Moderate	Low	Low	Cool and rainy	Moderate	Rain may affect outdoor excursions	Low	Wet Pacific coastal autumn	Climate normals / Project dataset
20	20	11	November	Dubai	Dubai	United Arab Emirates	Asia	Desert	Hot Desert	Late Autumn	20.00	31.00	26.00	Very Low	Very dry	Medium	Light to moderate	Calm	Low	Low	Warm and dry	Very Good	Excellent conditions for outdoor activities	Low	Dry desert climate	Climate normals / Project dataset
21	21	8	August	Manaus	Manaus	Brazil	South America	Tropical	Tropical Rainforest	Wet Season	24.00	32.00	28.00	High	Frequent heavy rainfall	Very High	Variable	River conditions variable	Medium	Low	Hot, humid and rainy	Moderate	Rain may affect rainforest excursions	Medium	Amazon rainforest climate with high rainfall	Climate normals / Project dataset
\.


-- Completed on 2026-10-21 22:22:49

--
-- PostgreSQL database dump complete
--

\unrestrict bbeYd3znL43uF9gbyBkbySIHcotV350zb5c5gicXLxXBDtnTFnxRWoa9AG8LMOf

