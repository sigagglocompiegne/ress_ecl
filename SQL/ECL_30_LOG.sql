
/*ECL V1.0*/
/*Creation de la table de log, de sa fonction et des triggers associés */
/*ECL_30_log.sql */
/*PostGIS*/
/*GeoCompiegnois - http://geo.compiegnois.fr/ */
/*Auteur : Thibaud Billoteau */

/*
SOMMAIRE :
 - DROP
 - CLASSES OBJETS
 - INSERTIONS
 - DOMAINES DE VALEUR
 - CONTRAINTES
 - TRIGGERS
 - SEQUENCES
 - COMMENTAIRES
*/


-- ################################################################ CLASSE LOG ECL ##############################################


-- Table: m_reseau_sec.log_ecl

-- DROP TABLE m_reseau_sec.log_ecl;

CREATE TABLE m_reseau_sec.log_ecl
(
  idlog integer NOT NULL,
  tablename character varying(80) NOT NULL,
  type_ope text NOT NULL,
  dataold character varying(254),
  datanew character varying(254),
  date_maj timestamp without time zone,
  CONSTRAINT log_ecl_pkey PRIMARY KEY (idlog)  
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_sec.log_ecl
  IS 'Table des opérations sur la base de données d''éclairage public';
COMMENT ON COLUMN m_reseau_sec.log_ecl.idlog IS 'Identifiant unique de d''opération';
COMMENT ON COLUMN m_reseau_sec.log_ecl.tablename IS 'Nom de la table concernée par l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.log_ecl.type_ope IS 'Type l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.log_ecl.dataold IS 'Valeur ancienne avant l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.log_ecl.datanew IS 'Valeur nouvelle après l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.log_ecl.date_maj IS 'Horodatage de l''opération sur la base d''éclairage public';

-- #################################################################### FONCTION TRIGGER - LOG_ECL ###################################################

-- Function: m_reseau_sec.ft_m_log_ecl()

-- DROP FUNCTION m_reseau_sec.ft_m_log_ecl();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_log_ecl()
  RETURNS trigger AS
$BODY$
DECLARE v_idlog integer;
DECLARE v_dataold character varying(1000);
DECLARE v_datanew character varying(1000);
DECLARE v_name_table character varying(254);
BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_reseau_sec.ecl_log_seq'::regclass); 
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_reseau_sec.log_ecl (idlog, tablename, type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
  v_idlog := nextval('m_reseau_sec.ecl_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_reseau_sec.log_ecl (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;


-- DELETE
ELSIF (TG_OP = 'DELETE') THEN

 v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
 v_idlog := nextval('m_reseau_sec.ecl_log_seq'::regclass);

---
 
  INSERT INTO m_reseau_sec.log_ecl (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'DELETE',
  v_dataold,
  NULL,
  now();
  RETURN NEW;

END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
COST 100;

CREATE TRIGGER t_t2_log_ouvrage_electrique
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_ouvrage_electrique
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_modele_support
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_modele_support
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_modele_lanterne
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_modele_lanterne
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_modele_lampe
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_modele_lampe
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_cable
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_ecl_cable
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_depart
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_depart
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_foyer
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_foyer
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_intervention
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_intervention
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_point_lumineux
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_point_lumineux
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

CREATE TRIGGER t_t2_log_pi
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_pi
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

