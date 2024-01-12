--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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
-- Name: cart_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_details (
    "userId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    amount numeric,
    quantity integer,
    "createdAt" bigint,
    "updatedAt" bigint
);


ALTER TABLE public.cart_details OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id uuid NOT NULL,
    "sourceId" uuid,
    type character varying(50),
    amount integer,
    "createdAt" bigint NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id uuid NOT NULL,
    "userId" uuid,
    amount numeric,
    meta jsonb,
    "orderStatus" character varying(100),
    "paymentStatus" character varying(100),
    "createdAt" bigint,
    "updatedAt" bigint
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    name character varying(500),
    category character varying(200),
    price numeric,
    meta jsonb,
    "createdAt" bigint,
    "updatedAt" bigint,
    "availableUnits" integer,
    images text[]
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying(100),
    password text,
    "firstName" character varying(100),
    "lastName" character varying(100),
    phone bigint,
    "createdAt" bigint,
    "updatedAt" bigint,
    meta jsonb
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: cart_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_details ("userId", "productId", amount, quantity, "createdAt", "updatedAt") FROM stdin;
fe9abfd0-9baf-11ed-8902-c392bc33b1fb	19b3fc34-9bb8-11ed-a8fc-0242ac120002	210	2	1674808537932	\N
8c7b6950-923a-11ed-95b1-ef2f04811c13	0003ff50-46f3-11e9-b503-ae367286486e	440	4	1674978817674	\N
fe9abfd0-9baf-11ed-8902-c392bc33b1fb	0003ff50-46f3-11e9-b503-ae367286486e	440	4	1674978848115	\N
97a262d0-a12f-11ed-85d6-577e6e031805	000188d0-f2f5-11e8-8455-f8eaa65f090a	100	1	1675278296533	\N
19721150-9be7-11ed-85d6-577e6e031805	19b400b2-9bb8-11ed-a8fc-0242ac120002	105	1	1675188439082	\N
19721150-9be7-11ed-85d6-577e6e031805	19b40c88-9bb8-11ed-a8fc-0242ac120002	1005	1	1675188443689	\N
83c89da0-9fa0-11ed-85d6-577e6e031805	000188d0-f2f5-11e8-8455-f8eaa65f090a	200	2	1675336601406	\N
83c89da0-9fa0-11ed-85d6-577e6e031805	0003ff50-46f3-11e9-b503-ae367286486e	110	1	1675336597585	\N
83c89da0-9fa0-11ed-85d6-577e6e031805	0006b580-1565-11e8-914f-0e4ec8d2b49b	500	5	1675336598527	\N
83c89da0-9fa0-11ed-85d6-577e6e031805	19b40c88-9bb8-11ed-a8fc-0242ac120002	1005	1	1675336612000	\N
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (id, "sourceId", type, amount, "createdAt") FROM stdin;
0003ff50-46f3-11e9-b503-ae367286486e	85897860-9598-11ed-8abe-b1008eaff2cd	debit	1	1673871782701
000188d0-f2f5-11e8-8455-f8eaa65f090a	1381400d-1dd2-11b2-8fba-063d626b945f	credit	20	1673873673137
0006b580-1565-11e8-914f-0e4ec8d2b49b	1381400d-1dd2-11b2-8fba-063d626b945f	credit	20	1673873711039
00487180-4f38-11e7-bd90-6b61ebf25dc3	1381400d-1dd2-11b2-8fba-063d626b945f	credit	20	1673873732089
004e0810-5c25-11e9-98be-e44f7fd90128	1381400d-1dd2-11b2-8fba-063d626b945f	credit	20	1673873754509
003dc160-fc5f-11e8-95eb-f93fb5597073	1381400d-1dd2-11b2-8fba-063d626b945f	credit	20	1673873772135
003dc160-fc5f-11e8-95eb-f93fb5597073	1d33df20-95a3-11ed-8902-c392bc33b1fb	debit	3	1673876332053
0003ff50-46f3-11e9-b503-ae367286486e	1d33df20-95a3-11ed-8902-c392bc33b1fb	debit	4	1673876332055
0006b580-1565-11e8-914f-0e4ec8d2b49b	1381400d-1dd2-11b2-8fba-063d626b945f	credit	1	1673935295211
003dc160-fc5f-11e8-95eb-f93fb5597073	c5f664a0-962c-11ed-8902-c392bc33b1fb	debit	3	1673935456240
0003ff50-46f3-11e9-b503-ae367286486e	c5f664a0-962c-11ed-8902-c392bc33b1fb	debit	4	1673935456242
0003ff50-46f3-11e9-b503-ae367286486e	d482ad40-97fc-11ed-8902-c392bc33b1fb	debit	2	1674134767128
0003ff50-46f3-11e9-b503-ae367286486e	5be25970-9e01-11ed-85d6-577e6e031805	debit	2	1674796419210
0003ff50-46f3-11e9-b503-ae367286486e	bb7200c0-9e01-11ed-85d6-577e6e031805	debit	1	1674796579534
004e0810-5c25-11e9-98be-e44f7fd90128	c74f6ae0-9e01-11ed-85d6-577e6e031805	debit	1	1674796599443
19b3fc34-9bb8-11ed-a8fc-0242ac120002	d52b23c0-9e06-11ed-85d6-577e6e031805	debit	1	1674798770176
19b40594-9bb8-11ed-a8fc-0242ac120002	d52b23c0-9e06-11ed-85d6-577e6e031805	debit	9	1674798770177
19b400b2-9bb8-11ed-a8fc-0242ac120002	16933820-9e07-11ed-85d6-577e6e031805	debit	1	1674798879908
19b40814-9bb8-11ed-a8fc-0242ac120002	39e0d8f0-9e07-11ed-85d6-577e6e031805	debit	1	1674798939138
0003ff50-46f3-11e9-b503-ae367286486e	39e0d8f0-9e07-11ed-85d6-577e6e031805	debit	1	1674798939140
19b3fc34-9bb8-11ed-a8fc-0242ac120002	bf56ca30-9fb0-11ed-85d6-577e6e031805	debit	1	1674981699158
19b40c88-9bb8-11ed-a8fc-0242ac120002	d5cd3790-9fb0-11ed-85d6-577e6e031805	debit	1	1674981736843
004e0810-5c25-11e9-98be-e44f7fd90128	30948160-9fb1-11ed-85d6-577e6e031805	debit	1	1674981889144
004e0810-5c25-11e9-98be-e44f7fd90128	97872e40-9fb1-11ed-85d6-577e6e031805	debit	1	1674982061862
004e0810-5c25-11e9-98be-e44f7fd90128	95921f90-9fb2-11ed-85d6-577e6e031805	debit	1	1674982488075
004e0810-5c25-11e9-98be-e44f7fd90128	d5d4f260-9ff5-11ed-85d6-577e6e031805	debit	8	1675011372168
19b40e7c-9bb8-11ed-a8fc-0242ac120002	e6dab450-9ff5-11ed-85d6-577e6e031805	debit	1	1675011400727
004e0810-5c25-11e9-98be-e44f7fd90128	fc6254e0-9ff5-11ed-85d6-577e6e031805	debit	1	1675011436848
19b40594-9bb8-11ed-a8fc-0242ac120002	01868e00-9ff6-11ed-85d6-577e6e031805	debit	1	1675011445474
19b400b2-9bb8-11ed-a8fc-0242ac120002	165b8060-9ff6-11ed-85d6-577e6e031805	debit	1	1675011480424
19b40814-9bb8-11ed-a8fc-0242ac120002	37425a60-9ff6-11ed-85d6-577e6e031805	debit	1	1675011535629
0003ff50-46f3-11e9-b503-ae367286486e	4ca6bb80-9ff6-11ed-85d6-577e6e031805	debit	1	1675011571515
19b3fc34-9bb8-11ed-a8fc-0242ac120002	6e864d60-9ff6-11ed-85d6-577e6e031805	debit	1	1675011628345
19b40c88-9bb8-11ed-a8fc-0242ac120002	75328610-9ff6-11ed-85d6-577e6e031805	debit	9	1675011639539
19b40594-9bb8-11ed-a8fc-0242ac120002	2d167160-a065-11ed-85d6-577e6e031805	debit	1	1675059192696
19b40e7c-9bb8-11ed-a8fc-0242ac120002	b1b32a80-a06a-11ed-85d6-577e6e031805	debit	1	1675061562666
19b40814-9bb8-11ed-a8fc-0242ac120002	b1b32a80-a06a-11ed-85d6-577e6e031805	debit	1	1675061562667
0003ff50-46f3-11e9-b503-ae367286486e	95817eb0-a06b-11ed-85d6-577e6e031805	debit	1	1675061944864
19b3fc34-9bb8-11ed-a8fc-0242ac120002	95817eb0-a06b-11ed-85d6-577e6e031805	debit	1	1675061944865
19b40c88-9bb8-11ed-a8fc-0242ac120002	95817eb0-a06b-11ed-85d6-577e6e031805	debit	1	1675061944866
004e0810-5c25-11e9-98be-e44f7fd90128	a05d5980-a07a-11ed-85d6-577e6e031805	debit	9	1675068405530
19b3fc34-9bb8-11ed-a8fc-0242ac120002	89442700-a07b-11ed-85d6-577e6e031805	debit	1	1675068796275
19b40c88-9bb8-11ed-a8fc-0242ac120002	89442700-a07b-11ed-85d6-577e6e031805	debit	1	1675068796276
19b400b2-9bb8-11ed-a8fc-0242ac120002	9077b820-a07b-11ed-85d6-577e6e031805	debit	6	1675068808360
000188d0-f2f5-11e8-8455-f8eaa65f090a	eeecc7b0-a07b-11ed-85d6-577e6e031805	debit	1	1675068966830
19b40c88-9bb8-11ed-a8fc-0242ac120002	5352fd50-a07c-11ed-85d6-577e6e031805	debit	1	1675069135272
004e0810-5c25-11e9-98be-e44f7fd90128	6f8d1820-a07c-11ed-85d6-577e6e031805	debit	1	1675069182629
000188d0-f2f5-11e8-8455-f8eaa65f090a	920a70a0-a07c-11ed-85d6-577e6e031805	debit	1	1675069240493
0006b580-1565-11e8-914f-0e4ec8d2b49b	91533920-a07d-11ed-85d6-577e6e031805	debit	1	1675069668789
0003ff50-46f3-11e9-b503-ae367286486e	6e44b6a0-a09d-11ed-85d6-577e6e031805	debit	1	1675083353869
19b40814-9bb8-11ed-a8fc-0242ac120002	6e44b6a0-a09d-11ed-85d6-577e6e031805	debit	2	1675083353870
19b40c88-9bb8-11ed-a8fc-0242ac120002	81ff6e00-a21f-11ed-85d6-577e6e031805	debit	4	1675249172708
19b3fc34-9bb8-11ed-a8fc-0242ac120002	81ff6e00-a21f-11ed-85d6-577e6e031805	debit	4	1675249172709
19b3fc34-9bb8-11ed-a8fc-0242ac120002	acb78e70-a21f-11ed-85d6-577e6e031805	debit	5	1675249244378
19b400b2-9bb8-11ed-a8fc-0242ac120002	1929b3d0-a220-11ed-85d6-577e6e031805	debit	6	1675249426320
000188d0-f2f5-11e8-8455-f8eaa65f090a	1929b3d0-a220-11ed-85d6-577e6e031805	debit	3	1675249426322
19b400b2-9bb8-11ed-a8fc-0242ac120002	29795a40-a222-11ed-85d6-577e6e031805	debit	1	1675250312678
000188d0-f2f5-11e8-8455-f8eaa65f090a	29795a40-a222-11ed-85d6-577e6e031805	debit	1	1675250312680
19b3fc34-9bb8-11ed-a8fc-0242ac120002	29795a40-a222-11ed-85d6-577e6e031805	debit	1	1675250312681
19b400b2-9bb8-11ed-a8fc-0242ac120002	767d4670-a223-11ed-85d6-577e6e031805	debit	1	1675250871385
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (id, "userId", amount, meta, "orderStatus", "paymentStatus", "createdAt", "updatedAt") FROM stdin;
85897860-9598-11ed-8abe-b1008eaff2cd	e9a5cd30-956b-11ed-b625-11fc3acac6a7	110	[{"cartItem": {"amount": "110", "userId": "e9a5cd30-956b-11ed-b625-11fc3acac6a7", "quantity": 1, "createdAt": "1673871775802", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": null, "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 20}}]	delivered	completed	1673871782630	\N
1d33df20-95a3-11ed-8902-c392bc33b1fb	9adb6620-959c-11ed-8902-c392bc33b1fb	1940	[{"cartItem": {"amount": "1500", "userId": "9adb6620-959c-11ed-8902-c392bc33b1fb", "quantity": 3, "createdAt": "1673874167289", "productId": "003dc160-fc5f-11e8-95eb-f93fb5597073", "updatedAt": null}, "productDetails": {"id": "003dc160-fc5f-11e8-95eb-f93fb5597073", "meta": {"description": "faishonable shirt with strips"}, "name": "shirt", "price": "500", "images": null, "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 21}}, {"cartItem": {"amount": "440", "userId": "9adb6620-959c-11ed-8902-c392bc33b1fb", "quantity": 4, "createdAt": "1673874323860", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": null, "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 19}}]	delivered	completed	1673876332050	\N
c5f664a0-962c-11ed-8902-c392bc33b1fb	8c7b6950-923a-11ed-95b1-ef2f04811c13	1940	[{"cartItem": {"amount": "1500", "userId": "8c7b6950-923a-11ed-95b1-ef2f04811c13", "quantity": 3, "createdAt": "1673874130119", "productId": "003dc160-fc5f-11e8-95eb-f93fb5597073", "updatedAt": null}, "productDetails": {"id": "003dc160-fc5f-11e8-95eb-f93fb5597073", "meta": {"description": "faishonable shirt with strips"}, "name": "shirt", "price": "500", "images": null, "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 18}}, {"cartItem": {"amount": "440", "userId": "8c7b6950-923a-11ed-95b1-ef2f04811c13", "quantity": 4, "createdAt": "1673874110969", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": null, "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 15}}]	delivered	completed	1673935456234	\N
d482ad40-97fc-11ed-8902-c392bc33b1fb	8c7b6950-923a-11ed-95b1-ef2f04811c13	220	[{"cartItem": {"amount": "220", "userId": "8c7b6950-923a-11ed-95b1-ef2f04811c13", "quantity": 2, "createdAt": "1674123890086", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": null, "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 11}}]	delivered	completed	1674134767124	\N
5be25970-9e01-11ed-85d6-577e6e031805	8c7b6950-923a-11ed-95b1-ef2f04811c13	220	[{"cartItem": {"amount": "220", "userId": "8c7b6950-923a-11ed-95b1-ef2f04811c13", "quantity": 2, "createdAt": "1674639524759", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 9}}]	delivered	completed	1674796419207	\N
bb7200c0-9e01-11ed-85d6-577e6e031805	fe9abfd0-9baf-11ed-8902-c392bc33b1fb	110	[{"cartItem": {"amount": "110", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674795827888", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 7}}]	delivered	completed	1674796579532	\N
c74f6ae0-9e01-11ed-85d6-577e6e031805	fe9abfd0-9baf-11ed-8902-c392bc33b1fb	500	[{"cartItem": {"amount": "500", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674796596919", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 23}}]	delivered	completed	1674796599438	\N
d52b23c0-9e06-11ed-85d6-577e6e031805	fe9abfd0-9baf-11ed-8902-c392bc33b1fb	1050	[{"cartItem": {"amount": "105", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674798753835", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 16}}, {"cartItem": {"amount": "945", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 9, "createdAt": "1674798704835", "productId": "19b40594-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40594-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 16}}]	delivered	completed	1674798770172	\N
16933820-9e07-11ed-85d6-577e6e031805	fe9abfd0-9baf-11ed-8902-c392bc33b1fb	105	[{"cartItem": {"amount": "105", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674798874230", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 16}}]	delivered	completed	1674798879906	\N
e6dab450-9ff5-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1005	[{"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011397448", "productId": "19b40e7c-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40e7c-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 26}}]	delivered	completed	1675011400725	\N
6e864d60-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011622047", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 14}}]	delivered	completed	1675011628342	\N
75328610-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	9045	[{"cartItem": {"amount": "9045", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 9, "createdAt": "1675011635700", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 25}}]	delivered	completed	1675011639537	\N
95817eb0-a06b-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1220	[{"cartItem": {"amount": "110", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675061926915", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 4}}, {"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675061937566", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 13}}, {"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675061940190", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 16}}]	delivered	completed	1675061944859	\N
a05d5980-a07a-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	4500	[{"cartItem": {"amount": "4500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 9, "createdAt": "1675068397333", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 10}}]	delivered	completed	1675068405528	\N
eeecc7b0-a07b-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	100	[{"cartItem": {"amount": "100", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675068965255", "productId": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "updatedAt": null}, "productDetails": {"id": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "meta": {"description": "rough notebook with 100 pages"}, "name": "rough notebook 1", "price": "100", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 20}}]	delivered	completed	1675068966827	\N
5352fd50-a07c-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1005	[{"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675069133043", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 14}}]	delivered	completed	1675069135269	\N
39e0d8f0-9e07-11ed-85d6-577e6e031805	fe9abfd0-9baf-11ed-8902-c392bc33b1fb	1115	[{"cartItem": {"amount": "1005", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674798914980", "productId": "19b40814-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40814-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 26}}, {"cartItem": {"amount": "110", "userId": "fe9abfd0-9baf-11ed-8902-c392bc33b1fb", "quantity": 1, "createdAt": "1674798924705", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 6}}]	delivered	completed	1674798939135	\N
bf56ca30-9fb0-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1674981696039", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 15}}]	delivered	completed	1674981699155	\N
d5cd3790-9fb0-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1005	[{"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1674981719750", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 26}}]	delivered	completed	1674981736841	\N
30948160-9fb1-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	500	[{"cartItem": {"amount": "500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1674981887421", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 22}}]	delivered	completed	1674981889142	\N
97872e40-9fb1-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	500	[{"cartItem": {"amount": "500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1674982060045", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 21}}]	delivered	completed	1674982061860	\N
95921f90-9fb2-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	500	[{"cartItem": {"amount": "500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1674982485084", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 20}}]	delivered	completed	1674982488073	\N
d5d4f260-9ff5-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	4000	[{"cartItem": {"amount": "4000", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 8, "createdAt": "1675011362820", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 19}}]	delivered	completed	1675011372166	\N
fc6254e0-9ff5-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	500	[{"cartItem": {"amount": "500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011434284", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 11}}]	delivered	completed	1675011436846	\N
01868e00-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011443379", "productId": "19b40594-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40594-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 7}}]	delivered	completed	1675011445472	\N
165b8060-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011475486", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 15}}]	delivered	completed	1675011480422	\N
37425a60-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1005	[{"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011529581", "productId": "19b40814-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40814-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 25}}]	delivered	completed	1675011535622	\N
4ca6bb80-9ff6-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	110	[{"cartItem": {"amount": "110", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675011568265", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 5}}]	delivered	completed	1675011571512	\N
2d167160-a065-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675059161746", "productId": "19b40594-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40594-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 6}}]	delivered	completed	1675059192694	\N
b1b32a80-a06a-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	2010	[{"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675061418453", "productId": "19b40e7c-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40e7c-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 25}}, {"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675061542868", "productId": "19b40814-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40814-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 24}}]	delivered	completed	1675061562664	\N
89442700-a07b-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	1110	[{"cartItem": {"amount": "105", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675068793363", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 12}}, {"cartItem": {"amount": "1005", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675068794079", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 15}}]	delivered	completed	1675068796272	\N
9077b820-a07b-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	630	[{"cartItem": {"amount": "630", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 6, "createdAt": "1675068803902", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 14}}]	delivered	completed	1675068808354	\N
6f8d1820-a07c-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	500	[{"cartItem": {"amount": "500", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675069180739", "productId": "004e0810-5c25-11e9-98be-e44f7fd90128", "updatedAt": null}, "productDetails": {"id": "004e0810-5c25-11e9-98be-e44f7fd90128", "meta": {"description": "skirt"}, "name": "skirt", "price": "500", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 1}}]	delivered	completed	1675069182626	\N
920a70a0-a07c-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	100	[{"cartItem": {"amount": "100", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675069236112", "productId": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "updatedAt": null}, "productDetails": {"id": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "meta": {"description": "rough notebook with 100 pages"}, "name": "rough notebook 1", "price": "100", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 19}}]	delivered	completed	1675069240490	\N
91533920-a07d-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	100	[{"cartItem": {"amount": "100", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675069667034", "productId": "0006b580-1565-11e8-914f-0e4ec8d2b49b", "updatedAt": null}, "productDetails": {"id": "0006b580-1565-11e8-914f-0e4ec8d2b49b", "meta": {"description": "smooth writing pen"}, "name": "parker pen", "price": "100", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 28}}]	delivered	completed	1675069668786	\N
6e44b6a0-a09d-11ed-85d6-577e6e031805	83c89da0-9fa0-11ed-85d6-577e6e031805	2120	[{"cartItem": {"amount": "110", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675083327541", "productId": "0003ff50-46f3-11e9-b503-ae367286486e", "updatedAt": null}, "productDetails": {"id": "0003ff50-46f3-11e9-b503-ae367286486e", "meta": {"description": "rough notebook with 200 pages"}, "name": "rough notebook 2", "price": "110", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png", "https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 3}}, {"cartItem": {"amount": "2010", "userId": "83c89da0-9fa0-11ed-85d6-577e6e031805", "quantity": 2, "createdAt": "1675083326732", "productId": "19b40814-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40814-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 23}}]	delivered	completed	1675083353866	\N
81ff6e00-a21f-11ed-85d6-577e6e031805	116db8b0-a137-11ed-85d6-577e6e031805	4440	[{"cartItem": {"amount": "4020", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 4, "createdAt": "1675247739900", "productId": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b40c88-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "parka jacket mens"}, "name": "jacket", "price": "1005", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 13}}, {"cartItem": {"amount": "420", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 4, "createdAt": "1675247741755", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 11}}]	delivered	completed	1675249172704	\N
acb78e70-a21f-11ed-85d6-577e6e031805	116db8b0-a137-11ed-85d6-577e6e031805	525	[{"cartItem": {"amount": "525", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 5, "createdAt": "1675249224834", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 7}}]	delivered	completed	1675249244375	\N
1929b3d0-a220-11ed-85d6-577e6e031805	116db8b0-a137-11ed-85d6-577e6e031805	930	[{"cartItem": {"amount": "630", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 6, "createdAt": "1675249415577", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 8}}, {"cartItem": {"amount": "300", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 3, "createdAt": "1675249416245", "productId": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "updatedAt": null}, "productDetails": {"id": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "meta": {"description": "rough notebook with 100 pages"}, "name": "rough notebook 1", "price": "100", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 18}}]	delivered	completed	1675249426317	\N
29795a40-a222-11ed-85d6-577e6e031805	116db8b0-a137-11ed-85d6-577e6e031805	310	[{"cartItem": {"amount": "105", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675249442393", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 2}}, {"cartItem": {"amount": "100", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675250256310", "productId": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "updatedAt": null}, "productDetails": {"id": "000188d0-f2f5-11e8-8455-f8eaa65f090a", "meta": {"description": "rough notebook with 100 pages"}, "name": "rough notebook 1", "price": "100", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "stationary", "createdAt": "1665399749619", "updatedAt": null, "availableUnits": 15}}, {"cartItem": {"amount": "105", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675250257107", "productId": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b3fc34-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 2}}]	delivered	completed	1675250312676	\N
767d4670-a223-11ed-85d6-577e6e031805	116db8b0-a137-11ed-85d6-577e6e031805	105	[{"cartItem": {"amount": "105", "userId": "116db8b0-a137-11ed-85d6-577e6e031805", "quantity": 1, "createdAt": "1675250855048", "productId": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "updatedAt": null}, "productDetails": {"id": "19b400b2-9bb8-11ed-a8fc-0242ac120002", "meta": {"description": "faishonable jacket with strips"}, "name": "jacket", "price": "105", "images": ["https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png"], "category": "apparel", "createdAt": "1674545163870", "updatedAt": null, "availableUnits": 1}}]	delivered	completed	1675250871383	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category, price, meta, "createdAt", "updatedAt", "availableUnits", images) FROM stdin;
004e0810-5c25-11e9-98be-e44f7fd90128	skirt	apparel	500	{"description": "skirt"}	1665399749619	\N	0	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
0006b580-1565-11e8-914f-0e4ec8d2b49b	parker pen	stationary	100	{"description": "smooth writing pen"}	1665399749619	\N	27	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
0003ff50-46f3-11e9-b503-ae367286486e	rough notebook 2	stationary	110	{"description": "rough notebook with 200 pages"}	1665399749619	\N	2	{https://gs-post-images.grdp.co/2023/1/product-cover-5-3-img1674543811895-96.png,https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png,https://gs-post-images.grdp.co/2023/1/product-cover-5-img1674544958054-57.png,https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png}
000188d0-f2f5-11e8-8455-f8eaa65f090a	rough notebook 1	stationary	100	{"description": "rough notebook with 100 pages"}	1665399749619	\N	14	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
19b40814-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	1005	{"description": "parka jacket mens"}	1674545163870	\N	21	{https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png}
19b3fc34-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	105	{"description": "faishonable jacket with strips"}	1674545163870	\N	1	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
19b40c88-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	1005	{"description": "parka jacket mens"}	1674545163870	\N	9	{https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png}
19b400b2-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	105	{"description": "faishonable jacket with strips"}	1674545163870	\N	0	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
19b40594-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	105	{"description": "faishonable jacket with strips"}	1674545163870	\N	5	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
19b40e7c-9bb8-11ed-a8fc-0242ac120002	jacket	apparel	1005	{"description": "parka jacket mens"}	1674545163870	\N	24	{https://gs-post-images.grdp.co/2023/1/product-cover-5-4-img1674545784239-82.png}
00487180-4f38-11e7-bd90-6b61ebf25dc3	floral shirt	apparel	660	{"description": "floral shirt for beach trip"}	1665399749619	\N	22	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
003dc160-fc5f-11e8-95eb-f93fb5597073	shirt	apparel	500	{"description": "faishonable shirt with strips"}	1665399749619	\N	15	{https://gs-post-images.grdp.co/2023/1/product-cover-5-1-img1674544600019-76.png}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, "firstName", "lastName", phone, "createdAt", "updatedAt", meta) FROM stdin;
00000000-352a-11ea-80f7-4c31d39a797f	arpit.gupta@gradeup.co	password	Arpit	Gupta	9807566350	1665400254622	1665400254622	{"userpic": "https://gs-post-images.grdp.co/2019/7/bitmap-2x-img1562574145145-58.png-rs-high-webp.png", "addresses": [{"city": "Noida", "name": "Arpit Gupta", "phone": 9807566350, "state": "Uttar Pradesh", "flatNo": "F642", "pincode": 201309, "locality": "6th Avenue, GC1"}], "primaryAddIdx": 0}
00000040-1bc8-11e9-af00-f7cce905c301	unnati@gradeup.co	password	Unnati	Agarwal	9807566350	1665401284540	1665401284540	{"userpic": "https://gs-post-images.grdp.co/2019/7/bitmap-2x-img1562574145145-58.png-rs-high-webp.png", "addresses": [{"city": "Noida", "name": "Arpit Gupta", "phone": 9807566350, "state": "Uttar Pradesh", "flatNo": "F642", "pincode": 201309, "locality": "6th Avenue, GC1"}], "primaryAddIdx": 0}
00000080-4caf-11eb-b4cf-9a5c9a74f998	piyush@gradeup.co	password	Piyush	Singh	9807566350	1665401284540	1665401284540	{"userpic": "https://gs-post-images.grdp.co/2019/7/bitmap-2x-img1562574145145-58.png-rs-high-webp.png", "addresses": [{"city": "Noida", "name": "Arpit Gupta", "phone": 9807566350, "state": "Uttar Pradesh", "flatNo": "F642", "pincode": 201309, "locality": "6th Avenue, GC1"}], "primaryAddIdx": 0}
00000100-452b-11e7-9bc2-90e222143226	yash@gradeup.co	password	Yash	Kesarwani	9807566350	1665401284540	1665401284540	{"userpic": "https://gs-post-images.grdp.co/2019/7/bitmap-2x-img1562574145145-58.png-rs-high-webp.png", "addresses": [{"city": "Noida", "name": "Arpit Gupta", "phone": 9807566350, "state": "Uttar Pradesh", "flatNo": "F642", "pincode": 201309, "locality": "6th Avenue, GC1"}], "primaryAddIdx": 0}
00000130-2c32-11ec-b30a-5d698564f017	ninja@gradeup.co	password	Ninja	Ninja	9807566350	1665401284540	1665401284540	{"userpic": "https://gs-post-images.grdp.co/2019/7/bitmap-2x-img1562574145145-58.png-rs-high-webp.png", "addresses": [{"city": "Noida", "name": "Arpit Gupta", "phone": 9807566350, "state": "Uttar Pradesh", "flatNo": "F642", "pincode": 201309, "locality": "6th Avenue, GC1"}], "primaryAddIdx": 0}
7de09ba0-9234-11ed-b37e-e9d635e2c65c	abcd@gradeup.co	$2b$10$a1Q2Bth74fkEQ1XdDNx6weTj9OTXtWoVdY348M3uyVvnbQBLV1OCO	\N	\N	\N	\N	\N	\N
c9adf910-9234-11ed-b9ac-7fdf1bcfbb4f	abc@gradeup.co	$2b$10$ovymRpLTUYiBclzAs4Ywse/4u2aecKwcECWMGNQlWS4x3RU6zaOSm	\N	\N	\N	\N	\N	\N
f0f4c080-9234-11ed-8ad9-03915efed808	ab@gradeup.co	$2b$10$R6LVSxIdNZr6HSFeYimaJuIETM67ODlTnimAGlVadSOeuDPWs/WV2	\N	\N	\N	\N	\N	\N
c3603740-9238-11ed-9d9d-bf30981f9992	abcde@gradeup.co	$2b$10$z0p5b7fRVhccPs/TN68zVeXJBk4mDnwYfR7dYMMrvMLQRDhTcQ5.C	\N	\N	\N	\N	\N	\N
25d3ebb0-9239-11ed-9726-5394def4d46f	abcdef@gradeup.co	$2b$10$kvqmsnnKy.z.ZT5QdsHJguJlcM1iJPOHrx9WMQLJLFOBS7Q0FaO3a	\N	\N	\N	\N	\N	\N
5e44ed00-9239-11ed-8b22-dbb624fa6028	abcdefg@gradeup.co	$2b$10$oS3129rFSM3erISVUf4Ey.WurChYzsdXVmB9RCtNwWGbPDdpvWwlC	\N	\N	\N	\N	\N	\N
868ef3a0-9239-11ed-8a0d-e970daf76c4b	abcdefgh@gradeup.co	$2b$10$uGHyDi59VSeGm6lT1dqIB.tjq6KnI5rzarHI.GzhPr9uLG5kq1mYK	\N	\N	\N	\N	\N	\N
98bbd070-9239-11ed-b172-c71e32717be6	abcdefghi@gradeup.co	$2b$10$AGGb1H8RUfbgz6f.L2PZEOIG3AR8UmlEM4BlyYI2xMgJaKMp2461u	\N	\N	\N	\N	\N	\N
acb46c90-9239-11ed-86f6-d90e4673e265	abcdefghij@gradeup.co	$2b$10$3NLvSBOFbsaWQGlX9MmHfO.LQrWx.GKk12bSl8XHWK6H2Zp.1wjsy	\N	\N	\N	\N	\N	\N
fa5ea050-9239-11ed-8dd4-0d223059df07	abcdefghijk@gradeup.co	$2b$10$VYe9mxJiPnBLJcu3fed6.uZUpB2ZDlSnNu8svtzlK7BlmiajyCfpC	\N	\N	\N	\N	\N	\N
2ee56f20-923a-11ed-bcae-1ba923821d0a	abcdefghijkl@gradeup.co	$2b$10$J1xavW0mtClaBNBUDcVUpeUn3XqFIYHT96u3dTzY02xjWiLYtqlu.	\N	\N	\N	\N	\N	\N
49415410-923a-11ed-83a4-353a88b53fa6	abcdefghijklm@gradeup.co	$2b$10$CF4KwyTQ6MgUQ15EftDZV.S4wKmLGZdMWnPoFz01W9gAXlS5AWZXW	\N	\N	\N	\N	\N	\N
8c7b6950-923a-11ed-95b1-ef2f04811c13	abcdefghijklmn@gradeup.co	$2b$10$ZGYPBZun6JBV2lrkUoIKBOkXDvvEV87l.lrjULKg8TeQVIn6AXOyu	\N	\N	\N	\N	\N	\N
f51fec30-92fb-11ed-9adc-99bad1cae59a	test1@gradeup.co	$2b$10$8W1hmJrA1uYWqbd5x8Am0eDKtkJFQi9QWQbkuRa0Jx5jwUeDhLGX6	\N	\N	\N	\N	\N	\N
f5697450-9327-11ed-8cc0-3fafcba94102	dep1@gradeup.co	$2b$10$mH4gqkwIssAVbwqSLXDDgemPVKJG7QhO9lzHfrkmy6dFJMbnoYAfu	\N	\N	\N	\N	\N	\N
81b96390-9556-11ed-b44d-37477a761331	dep2@gradeup.co	$2b$10$5lwIN7cSAsoY0N867LdUVOLrVc2geW.6cfmUvNMw6gsWHjhRwHYRW	\N	\N	\N	\N	\N	\N
eceb9ed0-956a-11ed-b44d-37477a761331	dep3@gradeup.co	$2b$10$EwHE.NKqjqLgL7UYIFbqFe9DRgnzzUWhKa.edgMh5lPyyM52D0lve	\N	\N	\N	\N	\N	\N
54f958a0-956b-11ed-b44d-37477a761331	dep4@gradeup.co	$2b$10$rgJ6yP.TDNaZabV4.xm/p.IF27F6ucJcBbeesAA0fyehpxqpTEjmm	\N	\N	\N	\N	\N	\N
613b9f10-956b-11ed-b44d-37477a761331	dep5@gradeup.co	$2b$10$JNWFR5NWgwES4tRUDDYkJOnuu1pK1a6csF/DBmYf0vikYkL2xbhNS	\N	\N	\N	\N	\N	\N
83917260-956b-11ed-b44d-37477a761331	dep6@gradeup.co	$2b$10$c0cpBJYitth8T7FX8V53yeCEUDOoYgK/kcUxqSM.SYWS0Ygq1IK.a	\N	\N	\N	\N	\N	\N
b18fe430-956b-11ed-b44d-37477a761331	dep7@gradeup.co	$2b$10$pGTt8X4MCzFCXUXFQKvAmelT/KGbI1Ru.Yr6lY4376.vrorBX.lJm	\N	\N	\N	\N	\N	\N
e9a5cd30-956b-11ed-b625-11fc3acac6a7	dep8@gradeup.co	$2b$10$syT7.S/ZHIULxKJVEmkU1eMzcp.Eqhrx/JXDhz/sG2Y9rrlF5LfSe	sharad	MEhrotra	235243	1673852623235	\N	\N
828cb650-959c-11ed-8902-c392bc33b1fb	fd1@gradeup.co	$2b$10$Ztjofp1EE8IqJ2f/4JXlWuxWuGSgaANGPy.c7KhqBKRAU/WGPZjuO	\N	\N	\N	1673873495605	\N	\N
9adb6620-959c-11ed-8902-c392bc33b1fb	fd2@gradeup.co	$2b$10$E81RtW8j34qj1kpCCmuJoeBpQchlvP3yTNfjXzlvLFbAxFUZLQMMy	blahh	woahh	567890	1673873536387	\N	\N
cb0a3a60-97ea-11ed-8902-c392bc33b1fb	abcderrrr@gradeup.co	$2b$10$jeR1UGT0WtOzUNgCCI2WSugvC0pVJ7P5b8dZHM4LeBqmvV6YOCKMi	\N	\N	\N	1674127020294	\N	\N
bac78800-9b24-11ed-8902-c392bc33b1fb	abcdsfsdf@gradeup.co	$2b$10$2jGHI1VZ6EmTxsg6HGZi8eLq.89susMuCJEsIpvFVKvxawenSLo9S	\N	\N	\N	1674481757312	\N	\N
a09f61a0-9b42-11ed-8902-c392bc33b1fb	guggbjhbj@gradeup.co	$2b$10$a2U/bBo1Yd28JO.InwGbS.y7AREQMNYmEaEXoSu7rs.e0lucgI5Mi	\N	\N	\N	1674494598331	\N	\N
b082ef70-9baa-11ed-8902-c392bc33b1fb	feeeeee@gradeup.co	$2b$10$py5cP7WAt2dyUds75V82B.885/u.I2CRCF6cAw2pyF5zjl4xZAA1W	\N	\N	\N	1674539292647	\N	\N
db9986c0-9bae-11ed-8902-c392bc33b1fb	abcdsfsddf@gradeup.co	$2b$10$EjCJJscMn8nazEv88dt81uW.1mdIy8dXZBhlf14Xc7L5NMprxY6eq	\N	\N	\N	1674541082924	\N	\N
fe9abfd0-9baf-11ed-8902-c392bc33b1fb	yo@gmail.com	$2b$10$eRZtR4/c38yMDzWNOcd/h.yuJxgGaoOpJUwqrXTfsIvGWmiZ2Z99a	\N	\N	\N	1674541571149	\N	\N
bc4b3c30-9bb0-11ed-abfa-6935a64447f2	dep9@gradeup.co	$2b$10$0/eViQF8WMBYnPrAK7ov3O9DenLNcLyKRmDf42T5za9FcH7L3f5vS	sharad	MEhrotra	235243	1674541889395	\N	\N
4556ed90-9bc9-11ed-8662-73474c8f2796	yosa@gmail.com	$2b$10$AME.C53KajrPxJvoA1tcS.8NbcMxvihKGh6Evhc4uk40qLDcC3WD2	\N	\N	\N	1674552427241	\N	\N
c0af6ff0-9bcc-11ed-a37b-491c775b6df4	abcdsfsddffdf@gradeup.co	$2b$10$Z9Bie7TiKd9yQqIjMeR3j.ykcDpIfpkDIOiQR7pn/oTXbtAamLjfG	\N	\N	\N	1674553922671	\N	\N
fa7cccf0-9bcc-11ed-a37b-491c775b6df4	qp@gmail.com	$2b$10$eaw2BT5LR8DQCxDKV2EgVujatN65.wRsdBlKAJeWHao4oEOVozKxG	\N	\N	\N	1674554019647	\N	\N
19721150-9be7-11ed-85d6-577e6e031805	shivam.bisht@gradeup.co	$2b$10$DHrDytil3wYg/tFhHvqnN.crt/U0PSlio68XEZ7esGq1QJVBEslN6	Shivam	\N	\N	1674565238501	\N	\N
857270a0-9e2d-11ed-85d6-577e6e031805	abfsf@gradeup.co	$2b$10$Jn5st6UHAeNBOJIZO7lMK.4kL3G8kWp3VqsFZ3x7KzullPM.ebfsi	\N	\N	\N	1674815386794	\N	\N
8b425310-9e2d-11ed-85d6-577e6e031805	abfsff@gradeup.co	$2b$10$GowZxLDvww0JHS639eJbduPrdI0Ug.YFy1ZmxARIocepOupQ0zYc2	yo	\N	\N	1674815396545	\N	\N
8f3add70-9e2d-11ed-85d6-577e6e031805	abffsff@gradeup.co	$2b$10$ycy7Hfq4sYC0Sdxfry0bBeimU3MHRb.oKQlzNuHRdGQU7xge./5oa	yo. 	\N	\N	1674815403207	\N	\N
83c89da0-9fa0-11ed-85d6-577e6e031805	y@gmail.com	$2b$10$FkmbwIjw5bLqkMPrC1NYVO480XFi03pm2pWWYqMp.IQmKjuPYUOkC	yogesh	\N	\N	1674974727290	\N	\N
af7293e0-a06b-11ed-85d6-577e6e031805	aaa	$2b$10$0rwFgIurqCBCrTuY4PiXrOHM6yl/.GuqIwrN/YsDWlRRug9c3w7Se	Ankit	\N	\N	1675061988382	\N	\N
36717ef0-a07c-11ed-85d6-577e6e031805	utkarsh.verma@gradeup.co	$2b$10$XU4eMvYmZzziVogZG1DbJ.JGuQ.L0uekzwYRRHSnzmSErw8B2GVLi	Utkarsh	\N	\N	1675069086815	\N	\N
d5060a20-a128-11ed-85d6-577e6e031805	utkarsh.verma@gradup.co	$2b$10$kzodPbutXVteT1Hc6p1Yzuc8PrDxtFVf.4nIqDOGUksNJBuZzZ6DK	Utkarsh	\N	\N	1675143226306	\N	\N
3e2a6410-a129-11ed-85d6-577e6e031805	utkarshverma782@gmail.com	$2b$10$ias7ToYiChbEZ9WZScc/VOi3HiiBwOHPdGagn88tFUqhl8Cyo9nMe	Utkarsh	\N	\N	1675143402705	\N	\N
6bdd3c00-a12b-11ed-85d6-577e6e031805	utkarsh.gradeup.co	$2b$10$UDHyE3vHwXwwOEmu4FenCOZEXfJG9ecpaF8aYSD1x4E7E0L.L2jCe	Utkarsh	\N	\N	1675144338368	\N	\N
ea89cb60-a12e-11ed-85d6-577e6e031805	uaskfjafskl@gmail.com	$2b$10$oxg4xVMQ00ZO8mFjv0jZfO9ViVq7y9WhvJKtnlMv6wQtbgrl8IHlm	Testing	\N	\N	1675145839382	\N	\N
97a262d0-a12f-11ed-85d6-577e6e031805	test@gmail.com	$2b$10$gIQ9SbCB3PXtRmXRFs49renOC4uo9SUTxFa22ovCNiQzi0aJC5Zp2	Test	\N	\N	1675146129789	\N	\N
e7ad9b90-a130-11ed-85d6-577e6e031805	fjdkja@gmail.com	$2b$10$4ZMht7hNQYM3hATR1Ws9HuvhGHzHlQMgkMhHwi5wSB4YSYmsADWnq	fdjfa	\N	\N	1675146693577	\N	\N
6ef73e80-a131-11ed-85d6-577e6e031805	dad@gmail.com	$2b$10$59gviNeHf94ND17/h9L5KeJJNIc1BVsNuRMeGLwcCy332GmG4PyRq	testing	\N	\N	1675146920552	\N	\N
116db8b0-a137-11ed-85d6-577e6e031805	hello@gmail.com	$2b$10$nUieh20.c/Sh2t5E0przP.Xv.NSnAyv618YpxoL5wOomX9ax76752	hello	\N	\N	1675149340603	\N	\N
\.


--
-- Name: cart_details cart_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT cart_details_pkey PRIMARY KEY ("userId", "productId");


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id, "createdAt");


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cart_details cart_details_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT "cart_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: cart_details cart_details_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT "cart_details_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: order_details order_details_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

