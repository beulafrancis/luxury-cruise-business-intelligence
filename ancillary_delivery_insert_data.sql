--
-- PostgreSQL database dump
--

\restrict IG0UiJIWtca0o2WnxekqBmxEaVtaKv25OWCtmyf4lsmLPqH3MUxwygppeHIzkcq

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-21 21:55:24

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
-- TOC entry 5055 (class 0 OID 16595)
-- Dependencies: 233
-- Data for Name: ancillary_delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ancillary_delivery (delivery_id, route_id, port_call_id, product_type, quantity, revenue, delivery_cost, delivery_status, delivery_date) FROM stdin;
1	1	1	Food Supplies	20	40000.00	25000.00	Completed	2025-03-06
2	2	2	Spare Parts	25	55000.00	35000.00	Completed	2025-03-07
3	4	5	Beverage Supplies	15	60000.00	42000.00	Completed	2025-04-16
4	6	7	Luxury Goods	18	65000.00	45000.00	Completed	2025-05-01
5	8	9	Small Consignment	30	90000.00	62000.00	Completed	2025-05-25
6	18	18	Food Supplies	35	120000.00	80000.00	Completed	2025-09-15
7	19	19	Spare Parts	30	110000.00	75000.00	Completed	2025-10-01
8	20	20	Beverage Supplies	20	85000.00	55000.00	Completed	2025-11-15
9	21	20	Luxury Goods	15	50000.00	32000.00	Completed	2025-11-15
100001	1	1	Food Supplies	120	450000.00	280000.00	Delivered	2025-03-06
100002	2	2	Spare Parts	35	320000.00	190000.00	Delivered	2025-03-07
100003	3	3	Beverage Supplies	60	580000.00	350000.00	Delivered	2025-03-12
100004	4	4	Luxury Goods	90	410000.00	250000.00	Delivered	2025-03-19
100005	5	5	Small Consignment	25	180000.00	100000.00	Delivered	2025-04-16
\.


-- Completed on 2026-10-21 21:55:25

--
-- PostgreSQL database dump complete
--

\unrestrict IG0UiJIWtca0o2WnxekqBmxEaVtaKv25OWCtmyf4lsmLPqH3MUxwygppeHIzkcq

