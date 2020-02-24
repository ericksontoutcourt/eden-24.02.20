--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5244af1e2823d5eaeeffc42c5096d8260';






\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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

--
-- Name: eden_bdd; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE eden_bdd WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_RÈunion.1252' LC_CTYPE = 'French_RÈunion.1252';


ALTER DATABASE eden_bdd OWNER TO postgres;

\connect eden_bdd

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

SET default_with_oids = false;

--
-- Name: article_produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_produits (
    id integer NOT NULL,
    article_id integer,
    produit_id integer,
    quantite integer,
    coef_approche double precision,
    designation character varying,
    prix_achat double precision,
    prix_vente double precision
);


ALTER TABLE public.article_produits OWNER TO postgres;

--
-- Name: article_produits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_produits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_produits_id_seq OWNER TO postgres;

--
-- Name: article_produits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_produits_id_seq OWNED BY public.article_produits.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    designation character varying,
    qte character varying,
    proposition_id integer,
    unite_id integer,
    prix_unitaire double precision
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    code character varying,
    nom character varying
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    nom character varying(100),
    adresse character(150),
    n_tel character varying(100),
    site character varying(100),
    email character varying(150)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produits (
    id integer NOT NULL,
    designation character varying,
    code character varying,
    coef_approche double precision,
    unite_id integer,
    description character varying,
    picture character varying(200),
    categorie_id integer,
    prix_achat double precision,
    prix_vente double precision
);


ALTER TABLE public.produits OWNER TO postgres;

--
-- Name: produits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produits_id_seq OWNER TO postgres;

--
-- Name: produits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produits_id_seq OWNED BY public.produits.id;


--
-- Name: propositions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propositions (
    id integer NOT NULL,
    date_proposition date,
    client_id integer,
    pourcentage_reussite double precision,
    observation text,
    montant_ht double precision
);


ALTER TABLE public.propositions OWNER TO postgres;

--
-- Name: propositions_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propositions_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propositions_client_id_seq OWNER TO postgres;

--
-- Name: propositions_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propositions_client_id_seq OWNED BY public.propositions.client_id;


--
-- Name: propositions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propositions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propositions_id_seq OWNER TO postgres;

--
-- Name: propositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propositions_id_seq OWNED BY public.propositions.id;


--
-- Name: unites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unites (
    id integer NOT NULL,
    code character varying(50),
    nom character varying(200)
);


ALTER TABLE public.unites OWNER TO postgres;

--
-- Name: unites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unites_id_seq OWNER TO postgres;

--
-- Name: unites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unites_id_seq OWNED BY public.unites.id;


--
-- Name: article_produits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_produits ALTER COLUMN id SET DEFAULT nextval('public.article_produits_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: produits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits ALTER COLUMN id SET DEFAULT nextval('public.produits_id_seq'::regclass);


--
-- Name: propositions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propositions ALTER COLUMN id SET DEFAULT nextval('public.propositions_id_seq'::regclass);


--
-- Name: unites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unites ALTER COLUMN id SET DEFAULT nextval('public.unites_id_seq'::regclass);


--
-- Data for Name: article_produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_produits (id, article_id, produit_id, quantite, coef_approche, designation, prix_achat, prix_vente) FROM stdin;
10	55	1	15	459	\N	\N	\N
11	58	1	55	6	\N	\N	\N
12	59	1	151	8	\N	\N	\N
13	60	1	55	6	\N	\N	\N
14	60	1	59	2	\N	\N	\N
15	60	1	4	1	\N	\N	\N
16	61	1	151	8	\N	\N	\N
17	61	1	2	2	\N	\N	\N
18	62	1	55	6	\N	\N	\N
19	62	1	59	2	\N	\N	\N
20	62	1	4	1	\N	\N	\N
24	69	4	1	1	\N	\N	26
25	69	3	1	6	\N	\N	265
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, designation, qte, proposition_id, unite_id, prix_unitaire) FROM stdin;
18	test02	23	\N	\N	\N
23	test02	23	\N	\N	\N
24	test05	96	\N	\N	\N
27	test02	23	\N	\N	\N
28	test02	23	\N	\N	\N
29	test05	96	\N	\N	\N
16	rien	3	\N	\N	\N
17	test	30	\N	\N	\N
20	rien	3	\N	\N	\N
21	test	30	\N	\N	\N
22	rien02	9	\N	\N	\N
34	test10	96	\N	\N	\N
40	test	3	\N	4	\N
55	rien	26	\N	3	\N
56	rien	26	\N	3	\N
57	rien	26	\N	3	\N
58	rien	256	\N	3	\N
59	rien	26	\N	3	\N
60	rien	256	\N	3	\N
61	rien	26	\N	3	\N
62	rien	256	\N	3	\N
65	rien	2	\N	4	456
66	rien02	6	\N	3	64
67	rien	2	58	4	456
68	rien02	6	58	3	64
69	test	3	58	3	216
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, code, nom) FROM stdin;
1	test	test
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, nom, adresse, n_tel, site, email) FROM stdin;
20	Erickson	20 rue coco                                                                                                                                           	0693547895	rien	ericksongravier361@gmail.com
21	Thomas	13 rue la zac                                                                                                                                         	0693205478	rien	thomas@gmail.com
22	Wilson	10 rue palissade                                                                                                                                      	0693547852	rien	wilson@outlook.fr
\.


--
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produits (id, designation, code, coef_approche, unite_id, description, picture, categorie_id, prix_achat, prix_vente) FROM stdin;
1	test	rien	6	3	et		1	15969	266
3	mk1	1696515	6	4	rien		1	216566	265
4	tu5jp4	55	6	3	test		1	1626	156651
5	xud9	165	1	3	test02		1	15	26
\.


--
-- Data for Name: propositions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propositions (id, date_proposition, client_id, pourcentage_reussite, observation, montant_ht) FROM stdin;
58	2000-01-01	20	10	rien	1944
\.


--
-- Data for Name: unites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unites (id, code, nom) FROM stdin;
3	U	Unit√©
4	m	M√®tre
\.


--
-- Name: article_produits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_produits_id_seq', 25, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 69, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 24, true);


--
-- Name: produits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produits_id_seq', 5, true);


--
-- Name: propositions_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propositions_client_id_seq', 1, false);


--
-- Name: propositions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propositions_id_seq', 58, true);


--
-- Name: unites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unites_id_seq', 5, true);


--
-- Name: articles Pk_article; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT "Pk_article" PRIMARY KEY (id);


--
-- Name: article_produits Pk_article_produits; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_produits
    ADD CONSTRAINT "Pk_article_produits" PRIMARY KEY (id);


--
-- Name: categories Pk_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "Pk_categories" PRIMARY KEY (id);


--
-- Name: clients Pk_client; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT "Pk_client" PRIMARY KEY (id);


--
-- Name: produits Pk_produit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT "Pk_produit" PRIMARY KEY (id);


--
-- Name: propositions Pk_proposition; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propositions
    ADD CONSTRAINT "Pk_proposition" PRIMARY KEY (id);


--
-- Name: unites Pk_unite; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unites
    ADD CONSTRAINT "Pk_unite" PRIMARY KEY (id);


--
-- Name: article_produits Fk_article_produits_articles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_produits
    ADD CONSTRAINT "Fk_article_produits_articles" FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: article_produits Fk_article_produits_produits; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_produits
    ADD CONSTRAINT "Fk_article_produits_produits" FOREIGN KEY (produit_id) REFERENCES public.produits(id);


--
-- Name: articles Fk_article_proposition; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT "Fk_article_proposition" FOREIGN KEY (proposition_id) REFERENCES public.propositions(id) ON DELETE CASCADE;


--
-- Name: articles Fk_article_unite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT "Fk_article_unite" FOREIGN KEY (unite_id) REFERENCES public.unites(id);


--
-- Name: produits Fk_produit_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT "Fk_produit_categorie" FOREIGN KEY (categorie_id) REFERENCES public.categories(id);


--
-- Name: produits Fk_produit_unite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT "Fk_produit_unite" FOREIGN KEY (unite_id) REFERENCES public.unites(id);


--
-- Name: propositions Fk_proposition_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propositions
    ADD CONSTRAINT "Fk_proposition_client" FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

