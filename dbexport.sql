--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)

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
-- Name: Authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Authentication" (
    id_auth integer NOT NULL,
    access_token character varying,
    auth_password character varying
);


ALTER TABLE public."Authentication" OWNER TO postgres;

--
-- Name: Payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payments" (
    id_payment integer NOT NULL,
    tipe_of_payment character varying,
    card_code character varying,
    "expiration_Date" character varying
);


ALTER TABLE public."Payments" OWNER TO postgres;

--
-- Name: Payments_Services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payments_Services" (
    "Payments_id_payment" integer NOT NULL,
    "Services_id_payment" integer NOT NULL
);


ALTER TABLE public."Payments_Services" OWNER TO postgres;

--
-- Name: Services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Services" (
    id_service integer NOT NULL,
    id_auth integer,
    id_payment integer,
    id_transaction integer,
    "serviceName" character varying,
    "tipeService" character varying,
    montly_payment numeric,
    next_bill character varying,
    open_instances integer
);


ALTER TABLE public."Services" OWNER TO postgres;

--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transactions" (
    id_payment integer,
    id_service integer,
    id_transaction integer NOT NULL,
    transaction_receiver character varying,
    amount numeric
);


ALTER TABLE public."Transactions" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying,
    passwrd character varying
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Data for Name: Authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Authentication" (id_auth, access_token, auth_password) FROM stdin;
1	dummy_token1	dummy_password2
2	dummy_token2	dummy_password2
3	dummy_token3	dummy_password3
\.


--
-- Data for Name: Payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payments" (id_payment, tipe_of_payment, card_code, "expiration_Date") FROM stdin;
1	dummy_payment	dummy_card	00/00
2	dummy_payment2	dummy_card2	00/00
\.


--
-- Data for Name: Payments_Services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payments_Services" ("Payments_id_payment", "Services_id_payment") FROM stdin;
\.


--
-- Data for Name: Services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Services" (id_service, id_auth, id_payment, id_transaction, "serviceName", "tipeService", montly_payment, next_bill, open_instances) FROM stdin;
1	1	1	1	dummy_name	dummy_service	0.00	dummy_bill	0
2	2	2	2	dummy_name2	dummy_service2	0.00	dummy_bill2	0
3	3	3	3	dummy_name3	dummy_service3	0.00	dummy_bill3	0
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transactions" (id_payment, id_service, id_transaction, transaction_receiver, amount) FROM stdin;
1	1	1	dummy_receiver	0.00
2	2	2	dummy_receiver2	0.00
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, passwrd) FROM stdin;
1	Aitor	1234
2	Daniel	1234
3	Minela	1234
\.


--
-- Name: Authentication Authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Authentication"
    ADD CONSTRAINT "Authentication_pkey" PRIMARY KEY (id_auth);


--
-- Name: Payments_Services Payments_Services_Payments_id_payment_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments_Services"
    ADD CONSTRAINT "Payments_Services_Payments_id_payment_key" UNIQUE ("Payments_id_payment");


--
-- Name: Payments_Services Payments_Services_Services_id_payment_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments_Services"
    ADD CONSTRAINT "Payments_Services_Services_id_payment_key" UNIQUE ("Services_id_payment");


--
-- Name: Payments_Services Payments_Services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments_Services"
    ADD CONSTRAINT "Payments_Services_pkey" PRIMARY KEY ("Payments_id_payment", "Services_id_payment");


--
-- Name: Payments Payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_pkey" PRIMARY KEY (id_payment);


--
-- Name: Services Services_id_auth_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_id_auth_key" UNIQUE (id_auth);


--
-- Name: Services Services_id_payment_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_id_payment_key" UNIQUE (id_payment);


--
-- Name: Services Services_id_transaction_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_id_transaction_key" UNIQUE (id_transaction);


--
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (id_service);


--
-- Name: Transactions Transactions_id_payment_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_id_payment_key" UNIQUE (id_payment);


--
-- Name: Transactions Transactions_id_service_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_id_service_key" UNIQUE (id_service);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id_transaction);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Payments_Services Payments_Services_Payments_id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments_Services"
    ADD CONSTRAINT "Payments_Services_Payments_id_payment_fkey" FOREIGN KEY ("Payments_id_payment") REFERENCES public."Payments"(id_payment);


--
-- Name: Payments_Services Payments_Services_Services_id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments_Services"
    ADD CONSTRAINT "Payments_Services_Services_id_payment_fkey" FOREIGN KEY ("Services_id_payment") REFERENCES public."Services"(id_payment);


--
-- Name: Payments Payments_id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_id_payment_fkey" FOREIGN KEY (id_payment) REFERENCES public."Transactions"(id_payment);


--
-- Name: Services Services_id_auth_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_id_auth_fkey" FOREIGN KEY (id_auth) REFERENCES public."Authentication"(id_auth);


--
-- Name: Transactions Transactions_id_service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_id_service_fkey" FOREIGN KEY (id_service) REFERENCES public."Services"(id_service);


--
-- PostgreSQL database dump complete
--

