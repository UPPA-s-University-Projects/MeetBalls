PGDMP         6    	            {         	   meetballs    14.5    14.5 9               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16458 	   meetballs    DATABASE     e   CREATE DATABASE meetballs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE meetballs;
                postgres    false                        0    0 	   meetballs    DATABASE PROPERTIES     T   ALTER DATABASE meetballs SET search_path TO '$user', 'public', 'topology', 'tiger';
                     postgres    false                        2615    18306    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                postgres    false                        2615    18562 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                postgres    false                        2615    18063    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                postgres    false            !           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                   postgres    false    12                        3079    18262    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                   false            "           0    0    EXTENSION address_standardizer    COMMENT     ?   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                        false    7                        3079    18269    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                   false            #           0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                        false    8                        3079    18251    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            $           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    6                        3079    16463    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            %           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                        3079    17506    postgis_raster 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;
    DROP EXTENSION postgis_raster;
                   false    2            &           0    0    EXTENSION postgis_raster    COMMENT     M   COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';
                        false    3                        3079    18226    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                   false    2            '           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                        false    5            	            3079    18307    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                   false    2    6    15            (           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                        false    9                        3079    18064    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                   false    12    2            )           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                        false    4            ,           1259    18868    cooktype    TABLE     ?   CREATE TABLE public.cooktype (
    id integer NOT NULL,
    designation character varying(255),
    fk_dish integer,
    fk_favcooktype integer
);
    DROP TABLE public.cooktype;
       public         heap    postgres    false            +           1259    18867    cooktype_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cooktype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cooktype_id_seq;
       public          postgres    false    300            *           0    0    cooktype_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cooktype_id_seq OWNED BY public.cooktype.id;
          public          postgres    false    299            .           1259    18875    diet    TABLE     t   CREATE TABLE public.diet (
    id integer NOT NULL,
    designation character varying(255),
    fk_diets integer
);
    DROP TABLE public.diet;
       public         heap    postgres    false            -           1259    18874    diet_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.diet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.diet_id_seq;
       public          postgres    false    302            +           0    0    diet_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.diet_id_seq OWNED BY public.diet.id;
          public          postgres    false    301            0           1259    18882    dish    TABLE     v   CREATE TABLE public.dish (
    id integer NOT NULL,
    img character varying(255),
    nom character varying(255)
);
    DROP TABLE public.dish;
       public         heap    postgres    false            /           1259    18881    dish_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dish_id_seq;
       public          postgres    false    304            ,           0    0    dish_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;
          public          postgres    false    303            ?           2604    18871    cooktype id    DEFAULT     j   ALTER TABLE ONLY public.cooktype ALTER COLUMN id SET DEFAULT nextval('public.cooktype_id_seq'::regclass);
 :   ALTER TABLE public.cooktype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    299    300    300            ?           2604    18878    diet id    DEFAULT     b   ALTER TABLE ONLY public.diet ALTER COLUMN id SET DEFAULT nextval('public.diet_id_seq'::regclass);
 6   ALTER TABLE public.diet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    301    302    302            ?           2604    18885    dish id    DEFAULT     b   ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);
 6   ALTER TABLE public.dish ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    304    303    304                      0    18868    cooktype 
   TABLE DATA           L   COPY public.cooktype (id, designation, fk_dish, fk_favcooktype) FROM stdin;
    public          postgres    false    300   ?4                 0    18875    diet 
   TABLE DATA           9   COPY public.diet (id, designation, fk_diets) FROM stdin;
    public          postgres    false    302   ?4                 0    18882    dish 
   TABLE DATA           ,   COPY public.dish (id, img, nom) FROM stdin;
    public          postgres    false    304   ?4       ?          0    16775    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    221   ?4       ?          0    18283    us_gaz 
   TABLE DATA           J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    245   ?4       ?          0    18271    us_lex 
   TABLE DATA           J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    243   5       ?          0    18295    us_rules 
   TABLE DATA           7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public          postgres    false    247   15       ?          0    18313    geocode_settings 
   TABLE DATA           T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger          postgres    false    249   N5       ?          0    18645    pagc_gaz 
   TABLE DATA           K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    294   k5       ?          0    18655    pagc_lex 
   TABLE DATA           K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    296   ?5       ?          0    18665 
   pagc_rules 
   TABLE DATA           8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger          postgres    false    298   ?5       ?          0    18066    topology 
   TABLE DATA           G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology          postgres    false    236   ?5       ?          0    18078    layer 
   TABLE DATA           ?   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology          postgres    false    237   ?5       -           0    0    cooktype_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cooktype_id_seq', 1, false);
          public          postgres    false    299            .           0    0    diet_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.diet_id_seq', 1, false);
          public          postgres    false    301            /           0    0    dish_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dish_id_seq', 1, false);
          public          postgres    false    303            |           2606    18873    cooktype cooktype_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cooktype
    ADD CONSTRAINT cooktype_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.cooktype DROP CONSTRAINT cooktype_pkey;
       public            postgres    false    300            ~           2606    18880    diet diet_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.diet
    ADD CONSTRAINT diet_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.diet DROP CONSTRAINT diet_pkey;
       public            postgres    false    302            ?           2606    18889    dish dish_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_pkey;
       public            postgres    false    304            ?           2606    18890    diet fk_diet_fk_diets    FK CONSTRAINT     t   ALTER TABLE ONLY public.diet
    ADD CONSTRAINT fk_diet_fk_diets FOREIGN KEY (fk_diets) REFERENCES public.dish(id);
 ?   ALTER TABLE ONLY public.diet DROP CONSTRAINT fk_diet_fk_diets;
       public          postgres    false    5248    302    304                  x?????? ? ?            x?????? ? ?            x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     