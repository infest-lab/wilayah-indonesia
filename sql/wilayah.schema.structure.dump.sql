--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: wilayah; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA wilayah;


ALTER SCHEMA wilayah OWNER TO postgres;

SET search_path = wilayah, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: desa; Type: TABLE; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE TABLE desa (
    kode_desa character varying(14) NOT NULL,
    nama_desa character varying(255) NOT NULL,
    is_kelurahan integer DEFAULT 0 NOT NULL,
    kode_kecamatan character varying(8) NOT NULL
);


ALTER TABLE wilayah.desa OWNER TO postgres;

--
-- Name: kabupaten; Type: TABLE; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE TABLE kabupaten (
    kode_kabupaten character varying(5) NOT NULL,
    nama_kabupaten character varying(225) NOT NULL,
    kode_provinsi character varying(2) NOT NULL,
    is_kota integer DEFAULT 0 NOT NULL
);


ALTER TABLE wilayah.kabupaten OWNER TO postgres;

--
-- Name: kecamatan; Type: TABLE; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE TABLE kecamatan (
    kode_kecamatan character varying(8) NOT NULL,
    nama_kecamatan character varying(225) NOT NULL,
    kode_kabupaten character varying(5)
);


ALTER TABLE wilayah.kecamatan OWNER TO postgres;

--
-- Name: negara; Type: TABLE; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE TABLE negara (
    kode_negara character varying(5) NOT NULL,
    nama_negara character varying(225) NOT NULL
);


ALTER TABLE wilayah.negara OWNER TO postgres;

--
-- Name: provinsi; Type: TABLE; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE TABLE provinsi (
    kode_provinsi character varying(2) NOT NULL,
    nama_provinsi character varying(225) NOT NULL
);


ALTER TABLE wilayah.provinsi OWNER TO postgres;

--
-- Name: pk_kode_desa; Type: CONSTRAINT; Schema: wilayah; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY desa
    ADD CONSTRAINT pk_kode_desa PRIMARY KEY (kode_desa);


--
-- Name: pk_kode_kabupaten; Type: CONSTRAINT; Schema: wilayah; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kabupaten
    ADD CONSTRAINT pk_kode_kabupaten PRIMARY KEY (kode_kabupaten);


--
-- Name: pk_kode_kecamatan; Type: CONSTRAINT; Schema: wilayah; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kecamatan
    ADD CONSTRAINT pk_kode_kecamatan PRIMARY KEY (kode_kecamatan);


--
-- Name: pk_kode_negara; Type: CONSTRAINT; Schema: wilayah; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY negara
    ADD CONSTRAINT pk_kode_negara PRIMARY KEY (kode_negara);


--
-- Name: pk_kode_provinsi; Type: CONSTRAINT; Schema: wilayah; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY provinsi
    ADD CONSTRAINT pk_kode_provinsi PRIMARY KEY (kode_provinsi);


--
-- Name: fki_desa_kodekecamatan; Type: INDEX; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_desa_kodekecamatan ON desa USING btree (kode_kecamatan);


--
-- Name: fki_kabupaten_kodeprovinsi; Type: INDEX; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_kabupaten_kodeprovinsi ON kabupaten USING btree (kode_provinsi);


--
-- Name: fki_kecamatan_kodekabupaten; Type: INDEX; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_kecamatan_kodekabupaten ON kecamatan USING btree (kode_kabupaten);


--
-- Name: idx_desa_iskelurahan; Type: INDEX; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_desa_iskelurahan ON desa USING btree (is_kelurahan);


--
-- Name: idx_kabupaten_iskota; Type: INDEX; Schema: wilayah; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_kabupaten_iskota ON kabupaten USING btree (is_kota);


--
-- Name: fk_desa_kodekecamatan; Type: FK CONSTRAINT; Schema: wilayah; Owner: postgres
--

ALTER TABLE ONLY desa
    ADD CONSTRAINT fk_desa_kodekecamatan FOREIGN KEY (kode_kecamatan) REFERENCES kecamatan(kode_kecamatan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_kabupaten_kodeprovinsi; Type: FK CONSTRAINT; Schema: wilayah; Owner: postgres
--

ALTER TABLE ONLY kabupaten
    ADD CONSTRAINT fk_kabupaten_kodeprovinsi FOREIGN KEY (kode_provinsi) REFERENCES provinsi(kode_provinsi) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_kecamatan_kodekabupaten; Type: FK CONSTRAINT; Schema: wilayah; Owner: postgres
--

ALTER TABLE ONLY kecamatan
    ADD CONSTRAINT fk_kecamatan_kodekabupaten FOREIGN KEY (kode_kabupaten) REFERENCES kabupaten(kode_kabupaten) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: wilayah; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA wilayah FROM PUBLIC;
REVOKE ALL ON SCHEMA wilayah FROM postgres;
GRANT ALL ON SCHEMA wilayah TO postgres;


--
-- Name: desa; Type: ACL; Schema: wilayah; Owner: postgres
--

REVOKE ALL ON TABLE desa FROM PUBLIC;
REVOKE ALL ON TABLE desa FROM postgres;
GRANT ALL ON TABLE desa TO postgres;


--
-- Name: kabupaten; Type: ACL; Schema: wilayah; Owner: postgres
--

REVOKE ALL ON TABLE kabupaten FROM PUBLIC;
REVOKE ALL ON TABLE kabupaten FROM postgres;
GRANT ALL ON TABLE kabupaten TO postgres;


--
-- Name: kecamatan; Type: ACL; Schema: wilayah; Owner: postgres
--

REVOKE ALL ON TABLE kecamatan FROM PUBLIC;
REVOKE ALL ON TABLE kecamatan FROM postgres;
GRANT ALL ON TABLE kecamatan TO postgres;


--
-- Name: negara; Type: ACL; Schema: wilayah; Owner: postgres
--

REVOKE ALL ON TABLE negara FROM PUBLIC;
REVOKE ALL ON TABLE negara FROM postgres;
GRANT ALL ON TABLE negara TO postgres;


--
-- Name: provinsi; Type: ACL; Schema: wilayah; Owner: postgres
--

REVOKE ALL ON TABLE provinsi FROM PUBLIC;
REVOKE ALL ON TABLE provinsi FROM postgres;
GRANT ALL ON TABLE provinsi TO postgres;


--
-- PostgreSQL database dump complete
--

