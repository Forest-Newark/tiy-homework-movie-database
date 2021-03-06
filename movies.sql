--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiy_movies; Type: DATABASE; Schema: -; Owner: forestnewark
--

CREATE DATABASE tiy_movies WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE tiy_movies OWNER TO forestnewark;

\connect tiy_movies

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE genre (
    genreid integer NOT NULL,
    genre character varying(20) NOT NULL
);


ALTER TABLE genre OWNER TO forestnewark;

--
-- Name: genre_genreid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE genre_genreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_genreid_seq OWNER TO forestnewark;

--
-- Name: genre_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE genre_genreid_seq OWNED BY genre.genreid;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE movie (
    movieid integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE movie OWNER TO forestnewark;

--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE movie_genre (
    moviegenreid integer NOT NULL,
    movieid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE movie_genre OWNER TO forestnewark;

--
-- Name: movie_genre_moviegenreid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE movie_genre_moviegenreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movie_genre_moviegenreid_seq OWNER TO forestnewark;

--
-- Name: movie_genre_moviegenreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE movie_genre_moviegenreid_seq OWNED BY movie_genre.moviegenreid;


--
-- Name: movie_movieid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE movie_movieid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movie_movieid_seq OWNER TO forestnewark;

--
-- Name: movie_movieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE movie_movieid_seq OWNED BY movie.movieid;


--
-- Name: person; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE person (
    personid integer NOT NULL,
    firstname character varying(20),
    lastname character varying(20)
);


ALTER TABLE person OWNER TO forestnewark;

--
-- Name: person_personid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE person_personid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_personid_seq OWNER TO forestnewark;

--
-- Name: person_personid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE person_personid_seq OWNED BY person.personid;


--
-- Name: person_role; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE person_role (
    person_roleid integer NOT NULL,
    personid integer NOT NULL,
    roleid integer NOT NULL,
    movieid integer NOT NULL
);


ALTER TABLE person_role OWNER TO forestnewark;

--
-- Name: person_role_person_roleid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE person_role_person_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_role_person_roleid_seq OWNER TO forestnewark;

--
-- Name: person_role_person_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE person_role_person_roleid_seq OWNED BY person_role.person_roleid;


--
-- Name: review; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE review (
    reviewid integer NOT NULL,
    movieid integer NOT NULL,
    score double precision NOT NULL
);


ALTER TABLE review OWNER TO forestnewark;

--
-- Name: review_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE review_reviewid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_reviewid_seq OWNER TO forestnewark;

--
-- Name: review_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE review_reviewid_seq OWNED BY review.reviewid;


--
-- Name: role; Type: TABLE; Schema: public; Owner: forestnewark
--

CREATE TABLE role (
    roleid integer NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE role OWNER TO forestnewark;

--
-- Name: role_roleid_seq; Type: SEQUENCE; Schema: public; Owner: forestnewark
--

CREATE SEQUENCE role_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_roleid_seq OWNER TO forestnewark;

--
-- Name: role_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forestnewark
--

ALTER SEQUENCE role_roleid_seq OWNED BY role.roleid;


--
-- Name: genre genreid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY genre ALTER COLUMN genreid SET DEFAULT nextval('genre_genreid_seq'::regclass);


--
-- Name: movie movieid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie ALTER COLUMN movieid SET DEFAULT nextval('movie_movieid_seq'::regclass);


--
-- Name: movie_genre moviegenreid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie_genre ALTER COLUMN moviegenreid SET DEFAULT nextval('movie_genre_moviegenreid_seq'::regclass);


--
-- Name: person personid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person ALTER COLUMN personid SET DEFAULT nextval('person_personid_seq'::regclass);


--
-- Name: person_role person_roleid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person_role ALTER COLUMN person_roleid SET DEFAULT nextval('person_role_person_roleid_seq'::regclass);


--
-- Name: review reviewid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY review ALTER COLUMN reviewid SET DEFAULT nextval('review_reviewid_seq'::regclass);


--
-- Name: role roleid; Type: DEFAULT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY role ALTER COLUMN roleid SET DEFAULT nextval('role_roleid_seq'::regclass);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY genre (genreid, genre) FROM stdin;
1	Comedy
2	Horror
3	Sci-Fi
4	Fantasy
5	Drama
6	Action
7	Thriller
\.


--
-- Name: genre_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('genre_genreid_seq', 7, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY movie (movieid, name) FROM stdin;
1	Sharknado
3	Sharknado 2
4	Sharknado 3
5	Sharknado 4
6	Rubber
7	The FP
8	The Room
9	3-Headed Shark Attack
10	Snow Sharks
11	MechaShark vs. MegaShark
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY movie_genre (moviegenreid, movieid, genreid) FROM stdin;
1	1	1
2	1	2
3	1	3
4	3	2
5	3	3
6	4	2
7	4	3
8	5	1
9	5	2
10	5	3
14	6	1
15	6	2
16	6	4
17	7	1
18	8	5
20	9	6
21	9	2
22	9	3
23	10	2
24	10	3
25	11	6
26	11	7
27	11	3
\.


--
-- Name: movie_genre_moviegenreid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('movie_genre_moviegenreid_seq', 27, true);


--
-- Name: movie_movieid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('movie_movieid_seq', 11, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY person (personid, firstname, lastname) FROM stdin;
1	Anthony	Ferrante
2	Thunder	Levin
3	Ian	Ziering
4	Tara	Reid
5	Vivica	Fox
6	David 	Hasselhoff
7	Gary	Busey
8	Quentin	Dupieu
9	Stephen	Spinella
10	Roxane	Mesquida
11	Wings	Hauser
12	Brandon	Trost
13	Jason	Trost
14	Lee	Valmassy
15	Tommy	Wiseau
16	Greg	Sestero
17	Christopher	Ray
18	Jacob	Cooney
19	Karrueche	Tran
20	Rob	Van Damn
21	Danny	Trejo
22	Sam	Qualiana
23	Michael	O'Hear
24	Emile 	Smith
25	H. Perry	Horton
26	Christopher	Judge
27	Elisabeth	Rohm
\.


--
-- Name: person_personid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('person_personid_seq', 27, true);


--
-- Data for Name: person_role; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY person_role (person_roleid, personid, roleid, movieid) FROM stdin;
1	1	1	1
2	2	2	1
3	3	3	1
4	4	3	1
5	5	3	3
6	1	1	3
7	2	2	3
8	3	3	3
9	4	3	3
10	1	1	4
11	2	2	4
12	3	3	4
13	4	3	4
19	1	1	5
20	2	2	5
21	3	3	5
22	4	3	5
23	6	3	5
24	7	3	5
25	8	1	6
26	8	2	6
27	9	3	6
28	10	3	6
29	11	3	6
30	12	1	7
31	12	2	7
32	13	1	7
33	13	2	7
34	13	3	7
35	14	3	7
36	15	1	8
37	15	2	8
38	15	3	8
39	16	3	8
40	17	1	9
41	18	2	9
42	19	3	9
43	20	3	9
44	21	3	9
45	22	1	10
46	22	2	10
47	22	3	10
48	23	3	10
49	24	1	11
50	25	2	11
51	26	3	11
52	27	3	11
\.


--
-- Name: person_role_person_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('person_role_person_roleid_seq', 52, true);


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY review (reviewid, movieid, score) FROM stdin;
1	1	4.20000000000000018
2	3	6.5
3	4	2.20000000000000018
4	5	3.29999999999999982
5	6	4.29999999999999982
6	7	5
7	8	5.5
8	9	6.20000000000000018
9	11	1.80000000000000004
10	10	1.10000000000000009
\.


--
-- Name: review_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('review_reviewid_seq', 10, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: forestnewark
--

COPY role (roleid, role) FROM stdin;
1	Director
2	Writer
3	Actor
\.


--
-- Name: role_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: forestnewark
--

SELECT pg_catalog.setval('role_roleid_seq', 3, true);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genreid);


--
-- Name: movie_genre movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (moviegenreid);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movieid);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personid);


--
-- Name: person_role person_role_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_pkey PRIMARY KEY (person_roleid);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_pkey PRIMARY KEY (reviewid);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);


--
-- Name: genre_genre_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX genre_genre_uindex ON genre USING btree (genre);


--
-- Name: genre_genreid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX genre_genreid_uindex ON genre USING btree (genreid);


--
-- Name: movie_genre_moviegenreid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX movie_genre_moviegenreid_uindex ON movie_genre USING btree (moviegenreid);


--
-- Name: movie_movieid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX movie_movieid_uindex ON movie USING btree (movieid);


--
-- Name: person_personid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX person_personid_uindex ON person USING btree (personid);


--
-- Name: person_role_person_roleid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX person_role_person_roleid_uindex ON person_role USING btree (person_roleid);


--
-- Name: review_reviewid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX review_reviewid_uindex ON review USING btree (reviewid);


--
-- Name: role_roleid_uindex; Type: INDEX; Schema: public; Owner: forestnewark
--

CREATE UNIQUE INDEX role_roleid_uindex ON role USING btree (roleid);


--
-- Name: movie_genre movie_genre_genre_genreid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT movie_genre_genre_genreid_fk FOREIGN KEY (genreid) REFERENCES genre(genreid);


--
-- Name: movie_genre movie_genre_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT movie_genre_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: person_role person_role_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: person_role person_role_person_personid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_person_personid_fk FOREIGN KEY (personid) REFERENCES person(personid);


--
-- Name: person_role person_role_role_roleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_role_roleid_fk FOREIGN KEY (roleid) REFERENCES role(roleid);


--
-- Name: review review_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: forestnewark
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- PostgreSQL database dump complete
--

