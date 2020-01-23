                                                                          
/*ECL V1.0*/
/*Creation du squelette de la structure des données (tables, séquences, triggers,...) */
/*ECL_10_SQUELETTE.sql */
/*PostGIS*/
/*GeoCompiegnois - http://geo.compiegnois.fr/ */
/*Auteur : Thibaud Billoteau */

/*
SOMMAIRE :
 - DROP
 - SEQUENCES
 - DOMAINES DE VALEUR
 - CLASSES OBJETS
 - CONTRAINTES
*/


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           DROP                                                          ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


-- VUES 

DROP VIEW IF EXISTS m_reseau_sec.geo_v_ouvrage_electrique;
DROP VIEW IF EXISTS m_reseau_sec.geo_v_point_lumineux;
DROP VIEW IF EXISTS m_reseau_sec.geo_v_pi;
DROP MATERIALIZED VIEW IF EXISTS x_apps.an_v_ecl_materialisee_noeud_armoire;
DROP VIEW IF EXISTS x_apps.geo_v_depart;
DROP VIEW IF EXISTS x_apps.an_v_stat_intervention;
DROP VIEW IF EXISTS x_apps.an_v_patrimoine;
DROP VIEW IF EXISTS x_apps.an_v_tension_cable;
DROP VIEW IF EXISTS x_apps.geo_v_intervention_liste_affichage;
DROP VIEW IF EXISTS x_apps.geo_v_support_par_armoire;

-- CLASSES

DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_lanterne CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_ouvrage_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_depart CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_pi CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.geo_ecl_noeud CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.geo_ecl_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_fourreau CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_foyer CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_intervention CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_media CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_erreur CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.log_ecl CASCADE;


-- DOMAINES DE VALEUR

DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_etat CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_etat_signalement_affichage CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_ouvrage_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_commande CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_pi CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_noeud CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_parasurtenseur CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_disjoncteur CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_fusible CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_lanterne CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_ballast CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_amorceur CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_auto_transformateur CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_emplacement CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_qualite_date CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_materiaux_supports CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_situation_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_classe_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_culot_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_presence CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_couleur_eclairage CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_ouvrage CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_depart CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_foyer CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_pi CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_point_lumineux CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_moyen_intervention CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_options_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_puissance_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_qualite_geolocalisation CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_section_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_signalement_intervention CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_situation CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_source_defaillance CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_defaillance CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_intervention_cables CASCADE;


--SEQUENCES

DROP SEQUENCE m_reseau_sec.objet_seq ;
DROP SEQUENCE m_reseau_sec.ecl_log_seq ;
DROP SEQUENCE m_reseau_sec.an_ecl_media_gid_seq ;
DROP SEQUENCE m_reseau_sec.an_ecl_erreur_id_erreur_seq ;
DROP SEQUENCE m_reseau_sec.an_ecl_intervention_seq ;

--TRIGGERS

DROP TRIGGER IF EXISTS t_t1_depart_insert_update ON m_reseau_sec.an_ecl_depart ;
DROP TRIGGER IF EXISTS t_t2_log_depart ON m_reseau_sec.an_ecl_depart ;
DROP TRIGGER IF EXISTS t_t3_depart_delete ON m_reseau_sec.an_ecl_depart ;
DROP TRIGGER IF EXISTS t_t1_foyer ON m_reseau_sec.an_ecl_foyer ;
DROP TRIGGER IF EXISTS t_t2_log_foyer ON m_reseau_sec.an_ecl_foyer ;
DROP TRIGGER IF EXISTS t_t3_foyer_after ON m_reseau_sec.an_ecl_foyer ;
DROP TRIGGER IF EXISTS t_t4_foyer_delete ON m_reseau_sec.an_ecl_foyer ;
DROP TRIGGER IF EXISTS t_t1_intervention ON m_reseau_sec.an_ecl_intervention ;
DROP TRIGGER IF EXISTS t_t2_log_intervention ON m_reseau_sec.an_ecl_intervention ;
DROP TRIGGER IF EXISTS t_t2_log_intervention ON m_reseau_sec.an_ecl_modele_lampe ;
DROP TRIGGER IF EXISTS t_t1_modele_lampe ON m_reseau_sec.an_ecl_modele_lampe ;
DROP TRIGGER IF EXISTS t_t2_log_modele_lampe ON m_reseau_sec.an_ecl_modele_lampe ;
DROP TRIGGER IF EXISTS t_t1_modele_lanterne ON m_reseau_sec.an_ecl_modele_lanterne ;
DROP TRIGGER IF EXISTS t_t2_log_modele_lanterne ON m_reseau_sec.an_ecl_modele_lanterne ;
DROP TRIGGER IF EXISTS t_t1_modele_support ON m_reseau_sec.an_ecl_modele_support ;
DROP TRIGGER IF EXISTS t_t2_log_modele_support ON m_reseau_sec.an_ecl_modele_support ;
DROP TRIGGER IF EXISTS t_t1_cable ON m_reseau_sec.geo_ecl_cable ;
DROP TRIGGER IF EXISTS t_t2_cable ON m_reseau_sec.geo_ecl_cable ;
DROP TRIGGER IF EXISTS t_t2_log_cable ON m_reseau_sec.geo_ecl_cable ;
DROP TRIGGER IF EXISTS t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ouvrage_electrique;
DROP TRIGGER IF EXISTS t_t1_lk_point_lumineux ON m_reseau_sec.geo_v_point_lumineux;
DROP TRIGGER IF EXISTS t_t1_point_interet ON m_reseau_sec.geo_v_pi;


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                         SEQUENCE                                                        ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--############################################################ OBJETS ##################################################


--Même séquence car GEO ne permet pas d'avoir plusieurs médias dans l'application, tous les objets avec des photos doivent dnc avoir des id différents. 
--Exception faîte des 2x3 modèles (lanterne, lampe, support) insérés à la création de la base (id =1 et id=2). 

--DROP SEQUENCE m_reseau_sec.ecl_objet_seq;

CREATE SEQUENCE m_reseau_sec.ecl_objet_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 3 ---- Car modèles id = 1 et modèle id = 2 existent pour les modèles de lampes / lanternes/ supports.
  CACHE 1;
  
COMMENT ON SEQUENCE m_reseau_sec.ecl_objet_seq
  IS 'Séquence unique pour tous les objets de l''éclairage public (sauf log et erreur)';
  
--############################################################ LOG ##################################################


--DROP SEQUENCE m_reseau_sec.ecl_log_idlog_seq;

CREATE SEQUENCE m_reseau_sec.an_ecl_log_idlog_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

 COMMENT ON SEQUENCE m_reseau_sec.an_ecl_log_idlog_seq
  IS 'Séquence unique pour les logs liées à l''éclairage public'; 

--############################################################ MEDIA OBJET##################################################

CREATE SEQUENCE TEST.an_ecl_media_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

 COMMENT ON SEQUENCE m_reseau_sec.an_ecl_media_gid_seq
  IS 'Séquence unique pour les médias liées à l''éclairage public';

--############################################################ MEDIA MODELES##################################################

CREATE SEQUENCE m_reseau_sec.an_ecl_media_modeles_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

COMMENT ON SEQUENCE m_reseau_sec.an_ecl_media_modeles_gid_seq
  IS 'Séquence unique pour les médias liées aux différents modèles de l''éclairage public (lampe,lanterne et support)';


--############################################################ ERREUR ##################################################

CREATE SEQUENCE m_reseau_sec.an_ecl_erreur_id_erreur_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

COMMENT ON SEQUENCE m_reseau_sec.an_ecl_erreur_id_erreur_seq
  IS 'Séquence unique pour les erreurs liées à la saisie de l''éclairage public';

--############################################################ MODELE DE LAMPE ##################################################


CREATE SEQUENCE m_reseau_sec.an_ecl_modele_lampe_id_mod_lm_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 3
  CACHE 1;

COMMENT ON SEQUENCE m_reseau_sec.an_ecl_modele_lampe_id_mod_lm_seq
  IS 'Séquence unique pour les médias liées au modèle de lampe';

--############################################################ MODELE DE LANTERNE ##################################################  

CREATE SEQUENCE m_reseau_sec.an_ecl_modele_lanterne_id_mod_ln_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 40
  CACHE 1;

COMMENT ON SEQUENCE m_reseau_sec.an_ecl_modele_lanterne_id_mod_ln_seq
  IS 'Séquence unique pour les médias liées au modèle de lanterne';

--############################################################ MODELE DE SUPPORT ##################################################  

CREATE SEQUENCE m_reseau_sec.an_ecl_modele_support_id_mod_sup_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 16
  CACHE 1;

COMMENT ON SEQUENCE m_reseau_sec.an_ecl_modele_support_id_mod_sup_seq
  IS 'Séquence unique pour les médias liées au modèle de support';

--############################################################ INTERVENTION ##################################################  


-- Sequence: m_reseau_sec.an_ecl_intervention_seq

-- DROP SEQUENCE m_reseau_sec.an_ecl_intervention_seq;

CREATE SEQUENCE m_reseau_sec.an_ecl_intervention_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7050
  CACHE 1;
ALTER TABLE m_reseau_sec.an_ecl_intervention_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_reseau_sec.an_ecl_intervention_seq TO sig_create;
GRANT ALL ON SEQUENCE m_reseau_sec.an_ecl_intervention_seq TO public;
GRANT ALL ON SEQUENCE m_reseau_sec.an_ecl_intervention_seq TO create_sig;
COMMENT ON SEQUENCE m_reseau_sec.an_ecl_intervention_seq
  IS 'Séquence unique pour toutes les interventions';


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                    DOMAINES DE VALEURS                                                  ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--############################################################ SITUATION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_situation
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_situation_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_situation(code, valeur)
    VALUES
	('10','Actif'),
	('11','Inactif'),
	('12','Supprimé');

COMMENT ON TABLE m_reseau_sec.lt_ecl_situation
  IS 'Code permettant de décrire la situation réelle de l''objet';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_situation.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_situation.valeur IS 'Valeur de la liste';

	
--############################################################ QUALITE DE GEOLOCALISATION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_qualite_geolocalisation_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_qualite_geolocalisation(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Classe A'),
	('20','Classe B'),
	('30','Classe C');

COMMENT ON TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation
  IS 'Code permettant de décrire la qualité de la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_qualite_geolocalisation.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_qualite_geolocalisation.valeur IS 'Valeur de la liste';

--############################################################ COULEUR ECLAIRAGE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_couleur_eclairage
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_couleur_eclairage_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_couleur_eclairage(code, valeur)
    VALUES
	('00','Non-renseigné'),
	('10','803'),
	('20','942'),
	('ZZ', 'Non-concerné'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_couleur_eclairage
  IS 'Code permettant de décrire la couleur d''éclairage de la lampe';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_couleur_eclairage.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_couleur_eclairage.valeur IS 'Valeur de la liste';

--############################################################ PRESENCE ##################################################


CREATE TABLE m_reseau_sec.lt_ecl_presence --- à remplacer par un oui/non s'il existe déjà dans la base.
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_presence_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_presence(code, valeur)
    VALUES
	('00','Non-renseigné'),
	('10','Oui'),
	('20','Non');

COMMENT ON TABLE m_reseau_sec.lt_ecl_presence
  IS 'Code permettant de décrire la présence, ou non, d''un élément.';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_presence.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_presence.valeur IS 'Valeur de la liste';

--############################################################ CULOT LAMPE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_culot_lampe
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_culot_lampe_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_culot_lampe(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','E27'),
	('20','E40'),
	('30','G12'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_culot_lampe
  IS 'Code permettant de décrire le culot de la lampe';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_culot_lampe.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_culot_lampe.valeur IS 'Valeur de la liste';

--############################################################ TYPE LAMPE ##################################################


CREATE TABLE m_reseau_sec.lt_ecl_type_lampe
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_lampe_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_lampe(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Iodure Métallique – IM'),
	('20','Sodium Haute Pression – SHP'),
	('30','Sodium Basse Pression – SBP'),
	('40','Ballon Fluorescent – BF'),
	('50','LED'),
	('60','Fluo Compact – FC'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_lampe
  IS 'Code permettant de décrire le type de la lampe';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_lampe.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_lampe.valeur IS 'Valeur de la liste';

--############################################################ AUTO TRANSFORMATEUR ##################################################


CREATE TABLE m_reseau_sec.lt_ecl_type_auto_transformateur
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_auto_transformateur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_auto_transformateur(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','300V/250V 130VA'),
	('11','300V/250V 200VA'),
	('12','300V/250V 510VA'),
	('20','300V/230V 130VA'),
	('21','300V/230V 200VA'),
	('22','300V/230V 510VA'),
	('30','380V/250V 130VA'),
	('31','380V/250V 200VA'),
	('32','380V/250V 510VA'),
	('33','380V/250V 600VA'),
	('34','380V/250V 1260VA'),
	('40','380V/230V 200VA'),
	('41','380V/230V 510VA'),
	('42','380V/230V 600VA'),
	('43','380V/230V 1260VA'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_auto_transformateur
  IS 'Code permettant de décrire le type d''auto-transformateur';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_auto_transformateur.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_auto_transformateur.valeur IS 'Valeur de la liste';

--############################################################ AMORCEUR ##################################################


CREATE TABLE m_reseau_sec.lt_ecl_type_amorceur
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_amorceur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_amorceur(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Abel ATR'),
	('20','STAR A50 48'),
	('30','TRIDONIC ZRM 2-ES/C'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_amorceur
  IS 'Code permettant de décrire le type d''amorceur';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_amorceur.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_amorceur.valeur IS 'Valeur de la liste';


--############################################################ TYPE BALLAST ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_ballast
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_ballast_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_ballast(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Ferromagnétique' ),
	('20','Electronique'),
	('30','Driver'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_ballast
  IS 'Code permettant de décrire le type de ballast';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_ballast.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_ballast.valeur IS 'Valeur de la liste';

--############################################################ CLASSE ELECTRIQUE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_classe_electrique
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_classe_electrique_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_classe_electrique(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Classe I'),
	('20','Classe II'),
	('30','Classe III');
	
COMMENT ON TABLE m_reseau_sec.lt_ecl_classe_electrique
  IS 'Code permettant de décrire la classe électrique de la lanterne';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_classe_electrique.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_classe_electrique.valeur IS 'Valeur de la liste';

--############################################################ QUALITE DATE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_qualite_date
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_qualite_date_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_qualite_date(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Certaine'),
	('20','Récolement'),
	('30','Projet'),
	('40','Mémoire'),
	('50','Déduite');

COMMENT ON TABLE m_reseau_sec.lt_ecl_qualite_date
  IS 'Code permettant de décrire la qualité de la date indiquée';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_qualite_date.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_qualite_date.valeur IS 'Valeur de la liste';

--############################################################ EMPLACEMENT ##################################################
CREATE TABLE m_reseau_sec.lt_ecl_emplacement
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_emplacement_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_emplacement(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Pied du support'),
	('20','Lanterne'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_emplacement
  IS 'Code permettant de décrire l''emplacement de la platine du foyer';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_emplacement.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_emplacement.valeur IS 'Valeur de la liste';

--############################################################ TYPE PARASURTENSEUR ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_parasurtenseur
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_parasurtenseur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_parasurtenseur(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Pas de parasurtenseur'),
	('20','Vario Var15EP25MR'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_parasurtenseur
  IS 'Code permettant de décrire le type de parasurtenseur';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_parasurtenseur.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_parasurtenseur.valeur IS 'Valeur de la liste';

--############################################################ TYPE LANTERNE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_lanterne
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_lanterne_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_lanterne(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Piéton'),
	('20','Routier'),
	('30','Projecteur'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_lanterne
  IS 'Code permettant de décrire le type de lanterne';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_lanterne.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_lanterne.valeur IS 'Valeur de la liste';

--############################################################ DISJONCTEUR ##################################################
--DROP TABLE m_reseau_sec.lt_ecl_type_disjoncteur CASCADE;
CREATE TABLE m_reseau_sec.lt_ecl_type_disjoncteur
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_disjoncteur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_disjoncteur(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Pas de disjoncteur'),
	('20','40A 500Ma'),
	('30','63A 500Ma'),
	('31','63A 1000Ma'),
	('40','Disjoncteur principal'),
	('50','10/30A'),
	('51','30/60A'),
	('60','10A 30Ma'),
	('61','16A 30Ma'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_disjoncteur
  IS 'Code permettant de décrire le type de disjoncteur';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_disjoncteur.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_disjoncteur.valeur IS 'Valeur de la liste';

--############################################################ FUSIBLE ##################################################

--DROP TABLE m_reseau_sec.lt_ecl_type_fusible CASCADE;
CREATE TABLE m_reseau_sec.lt_ecl_type_fusible
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_fusible_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_fusible(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Pas de fusible'),
	('20','8,5x31,5 4A'),
	('21','8,5x31,5 6A'),
	('22','8,5x31,5 8A'),
	('23','8,5x31,5 10A'),
	('30','10x38 4A'),
	('31','10x38 6A'),
	('32','10x38 8A'),
	('33','10x38 10A'),
	('34','10x38 16A'),
	('40','14x51 10A'),
	('41','14x51 16A'),
	('42','14x51 20A'),
	('43','14x51 25A'),
	('44','14x51 32A'),
	('45','14x51 50A'),
	('50','22x58 32A'),
	('51','22x58 60A'),
	('52','22x58 80A'),
	('53','22x58 100A'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_fusible
  IS 'Code permettant de décrire le type de fusible';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_fusible.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_fusible.valeur IS 'Valeur de la liste';

--############################################################ MATERIAUX SUPPORTS ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_materiaux_supports
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_materiaux_supports_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_materiaux_supports(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Acier'),
	('20','Béton'),
	('30','Bois'),
	('40','Aluminium'),
	('50','Fonte'),
	('60','Fibre de verre'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_materiaux_supports
  IS 'Code permettant de décrire le matériaux du support';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_materiaux_supports.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_materiaux_supports.valeur IS 'Valeur de la liste';

--############################################################ ETAT ##################################################
--DROP TABLE m_reseau_sec.lt_ecl_etat;
CREATE TABLE m_reseau_sec.lt_ecl_etat
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_etat_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_etat(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Neuf'),
	('20','Bon etat'),
	('30','Etat moyen (dégradation partielle)'),
	('40','Vétuste'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_etat
  IS 'Code permettant de décrire l''état du support';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_etat.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_etat.valeur IS 'Valeur de la liste';

	
--############################################################ OPTION DU SUPPORT ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_options_support
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_option_support_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_options_support(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Caméra'),
	('20','Oriflamme'),
	('30','wi-fi'),
	('40','Radar'),
	('50','Panneau signalisation'),
	('60','Prise guirlande festive'),
	('70','Bluetooth'),
	('80','Jardinière'),
	('11','Détecteur de mouvement'),
	('12','Feu tricolore'),
	('13','Boîte piéton'),
	('14','Traversée piétonne'),
	('15','Miroir'),
	('16','Projecteur'),
	('17','Appel piéton'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_options_support
  IS 'Code permettant de décrire les options du support';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_options_support.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_options_support.valeur IS 'Valeur de la liste';

--############################################################ TYPE SUPPORT ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_support
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_support_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_support(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Mât'),
	('20','Façade'),
	('30','Poteau réseau électrique BT'),
	('40','Sol'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_support
  IS 'Code permettant de décrire le type de support';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_support.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_support.valeur IS 'Valeur de la liste';

--############################################################ TYPE OUVRAGE ELECTRIQUE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_ouvrage_electrique_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_ouvrage_electrique(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Armoire'),
	('11','Sous-armoire'),
	('20','Transformateur'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique
  IS 'Code permettant de décrire le type d''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_ouvrage_electrique.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_ouvrage_electrique.valeur IS 'Valeur de la liste';

--############################################################ MODE POSE OUVRAGE ELECTRIQUE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_mode_pose_ouvrage_electrique_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Encastrée'),
	('20','Saillie sur poste distribution publique'),
	('30','Sur façade autre'),
	('40','Sur socle'),
	('50','Dans fosse'),
	('60','Enterré'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique
  IS 'Code permettant de décrire le mode de pose de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique.valeur IS 'Valeur de la liste';

--############################################################ TYPE DE COMMANDE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_commande
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_commande_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_commande(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Cellule photo-électrique'),
	('20','Horloge astronomique'),
	('30','Horloge standard'),
	('40','Télégestion'),
	('50','Radio BH-T'),
	('60','SOGEME GSM'),
	('71','Radiolite xp 410'),
	('72','Radiolite xp 420'),
	('73','Radiolite xp 430'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_commande
  IS 'Code permettant de décrire le type de commande de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_commande.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_commande.valeur IS 'Valeur de la liste';

--############################################################ Puissance de lampe ##################################################

-- liste de valeurs plus utilisé, saisie de l'utilisateur préférée
CREATE TABLE m_reseau_sec.lt_ecl_puissance_lampe
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_puissance_lampe_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_puissance_lampe(code, valeur)
VALUES
	('00','Non renseigné'),
	('05','30'),
	('10','35'),
	('15','40'),
	('20','60'),
	('30','70'),
	('40','100'),
	('50','150'),
	('60','250'),
	('70','400'),
	('80','1000'),
	('99','Autre'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_puissance_lampe
  IS 'Code permettant de décrire la puissance de la lampe';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_puissance_lampe.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_puissance_lampe.valeur IS 'Valeur de la liste';

--############################################################ TYPE DE POINT D'INTERET ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_pi
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_pi_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_pi(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Chambre de tirage'),
	('20','Tangente'),
	('30','Remontée aérosouterraine'),
	('40','Descente aérosouterraine'),
	('50','Borne'),
	('60','Panneau publicitaire'),
	('70','Sous-marin'),
	('80','Arrêt de bus'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_pi
  IS 'Code permettant de décrire le type de point d''interet';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_pi.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_pi.valeur IS 'Valeur de la liste';

--############################################################ SITUATION CABLE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_situation_cable
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_situation_cable_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_situation_cable(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Aérien'),
	('11','Aérien nu'),
	('12','Aérien torsade EP'),
	('20','Souterrain'),
	('21','Souterrain blindé'),
	('22','Souterrain R02'),
	('30','Mural'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_situation_cable
  IS 'Code permettant de décrire la situation du câble';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_situation_cable.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_situation_cable.valeur IS 'Valeur de la liste';

--############################################################ SECTION DE CABLE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_section_cable
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_section_cable_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_section_cable(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','35'),
	('11','25'),
	('12','16'),
	('20','10'),
	('21','6'),
	('22','4'),
	('30','2,5'),
	('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_section_cable
  IS 'Code permettant de décrire la section du câble';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_section_cable.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_section_cable.valeur IS 'Valeur de la liste';
	
--############################################################ HAUTEUR TRAPPE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_hauteur_trappe
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_hauteur_trappe_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_hauteur_trappe(code, valeur)
VALUES
	('00','Non renseigné'),
	('10','Standard'),
	('20','En hauteur'),
	('ZZ','Non concerné');

COMMENT ON TABLE m_reseau_sec.lt_ecl_hauteur_trappe
  IS 'Code permettant de décrire la section du câble';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_hauteur_trappe.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_hauteur_trappe.valeur IS 'Valeur de la liste';

--############################################################ TYPE INTERVENTION ##################################################

-- cette première liste ne sert pas dans l'application, permet juste de lister tous les codes dans les listes de valeurs nommées par matériel ci-après)

CREATE TABLE m_reseau_sec.lt_ecl_type_intervention
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_intervention_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
--DELETE FROM m_reseau_sec.lt_ecl_type_intervention WHERE code ='00'
INSERT INTO m_reseau_sec.lt_ecl_type_intervention(code, valeur)   
    VALUES
			('00','-->'),
			('10','Changement de disjoncteur'),
			('11','Changement de fusible'),
			('22','Réenclenchement du disjoncteur'),
			('20','Changement de type de commande'),
			('21','Changement de récepteur'),
			('30','Contrôle électrique'),
			('40','Nettoyage'),
			('50','Réparation'),
			('60','Ajout d''un départ'),
			('80','Suppression de l''objet'),
			('81','Désactivation de l''objet'),
			('82','Réactivation de l'objet'),
			('83','Dépose / repose identique (accident)'),
			('99','Autre'),
			('12','Changement de lanterne'),
			('13','Changement de lampe'),
			('15','Changement de ballast/driver'),
			('16','Changement d''amorce'),
			('17','Changement d''auto-transformateur'),
			('70','Repositionnement lanterne/crosse'),
			('31','Contrôle mécanique'),
			('18','Ajout d''une option'),
			('19','Changement de parasurtenseur'),
			('90','Suppression d''une option');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention
				IS 'Code permettant de décrire le type d''intervention';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention ouvrage---------------------------------------

			-- Pour GEO, on créé un type d'intervention destiné uniquement aux ouvrages
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_ouvrage_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);
			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_ouvrage(code, valeur)
			    VALUES
			('10','Changement de disjoncteur'),
			('11','Changement de fusible'),
			('22','Réenclenchement disjoncteur'),
			('20','Changement de type de commande'),
			('30','Contrôle électrique'),
			('40','Nettoyage'),
			('50','Réparation'),
			('60','Ajout d''un départ'),
			('80','Suppression de l''objet'),
			('81','Désactivation de l''objet'),
			('82','Réactivation de l''objet'),
			('21','Changement de récepteur'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage
				IS 'Code permettant de décrire le type d''intervention des ouvrages';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_ouvrage.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_ouvrage.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention Depart---------------------------------------

			-- Pour GEO, on créé un type d'intervention destiné uniquement aux departs
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_depart
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_depart_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);

			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_depart(code, valeur)
			    VALUES
			('10','Changement de disjoncteur'),
			('11','Changement de fusible'),
			('22','Réenclenchement disjoncteur'),
			('50','Réparation'),
			('80','Suppression de l''objet'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_depart
				IS 'Code permettant de décrire le type d''intervention des départs';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_depart.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_depart.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention foyer---------------------------------------
			
			-- Pour GEO, on créé un type d'intervention destiné uniquement aux foyers
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_foyer
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_foyer_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);

			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_foyer(code, valeur)
			    VALUES
			('12','Changement de lanterne'),
			('13','Changement de lampe'),
			('15','Changement de ballast/driver'),
			('16','Changement d''amorce'),
			('17','Changement d''auto-transformateur'),
			('40','Nettoyage'),
			('50','Réparation'),
			('70','Repositionnement lanterne/crosse'),
			('80','Suppression de l''objet'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_foyer
				IS 'Code permettant de décrire le type d''intervention des foyers';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_foyer.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_foyer.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention point d'intérêt---------------------------------------

			-- Pour GEO, on créé un type d'intervention destiné uniquement aux points d'intérêts
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_pi
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_pi_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);
			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_pi(code, valeur)
			    VALUES
			('30','Contrôle électrique'),
			('31','Contrôle mécanique'),
			('40','Nettoyage'),
			('50','Réparation'),
			('80','Suppression de l''objet'),
			('81','Désactivation de l''objet'),
			('82','Réactivation de l''objet'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_pi
				IS 'Code permettant de décrire le type d''intervention des point-d''intérets';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_pi.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_pi.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention point lumineux---------------------------------------
			
			-- Pour GEO, on créé un type d'intervention destiné uniquement aux points lumineux
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_point_lumineux_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);

			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_point_lumineux(code, valeur)
			    VALUES
			('10','Changement de disjoncteur'),
			('11','Changement de fusible'),
			('22','Réenclenchement disjoncteur'),
			('18','Ajout d''une option'),
			('90','Suppression d''une option'),
			('19','Changement de parasurtenseur'),
			('31','Contrôle mécanique'),
			('40','Nettoyage'),
			('50','Réparation'),
			('80','Suppression de l''objet'),
			('81','Désactivation de l''objet'),
			('82','Réactivation de l''objet'),
			('83','Dépose / repose identique (accident)'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux
				IS 'Code permettant de décrire le type d''intervention des point lumineux';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_point_lumineux.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_point_lumineux.valeur IS 'Valeur de la liste';

			----------------------------------Type intervention Câble---------------------------------------
			
			-- Pour GEO, on créé un type d'intervention destiné uniquement aux câbles
			CREATE TABLE m_reseau_sec.lt_ecl_type_intervention_cables
			(
			  code character varying(2) NOT NULL,
			  valeur character varying(80) NOT NULL,
			  CONSTRAINT lt_ecl_type_intervention_cable_pkey PRIMARY KEY (code)
			)
			WITH (
			  OIDS=FALSE
			);

			INSERT INTO m_reseau_sec.lt_ecl_type_intervention_cables(code, valeur)
			    VALUES
			('50','Réparation'),
			('80','Suppression de l''objet'),
			('81','Désactivation de l''objet'),
			('82','Réactivation de l''objet'),
			('99','Autre');

			COMMENT ON TABLE m_reseau_sec.lt_ecl_type_intervention_cables
				IS 'Code permettant de décrire le type d''intervention des câbles';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_cables.code IS 'Code de la liste';
			COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_intervention_cables.valeur IS 'Valeur de la liste';




--############################################################ ETAT SIGNALEMENT - Affichage ##################################################

--- Afin que le ST ne puisse pas choisir ''Réglé par une intervention sur foyer / départ''

CREATE TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_etat_signalement_affichage_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_etat_signalement_affichage(code, valeur)
    VALUES
('10','Soumis'),
('30','Réglé'),
('40','Classé sans suite'),
('50','Pour information'),
('60','Réglé par une intervention sur foyer / départ') ;

COMMENT ON TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage
	IS 'Code permettant de décrire l''etat du signalement pour affichage dans GEO';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_etat_signalement_affichage.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_etat_signalement_affichage.valeur IS 'Valeur de la liste';


--############################################################ SOURCE DE DEFAILLANCE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_source_defaillance
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_source_defaillance_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_source_defaillance(code, valeur)
    VALUES
('00','Non renseigné'),
('10','Vandalisme'),
('30','Catastrophe naturelle'),
('40','Accident'),
('50','Inconnue'),
('99','Autre') ;

COMMENT ON TABLE m_reseau_sec.lt_ecl_source_defaillance
	IS 'Code permettant de décrire la source de la déaillance repérée';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_source_defaillance.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_source_defaillance.valeur IS 'Valeur de la liste';

--############################################################ MOYEN D'INTERVENTION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_moyen_intervention
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_moyen_intervention_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_moyen_intervention(code, valeur)
    VALUES
('00','Non renseigné'),
('10','Avec nacelle'),
('20','Sans nacelle');

COMMENT ON TABLE m_reseau_sec.lt_ecl_moyen_intervention
	IS 'Code permettant de décrire si l''intervention se fait avec ou sans nacelle';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_moyen_intervention.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_moyen_intervention.valeur IS 'Valeur de la liste';

--############################################################ SIGNALEMENT OU INTERVENTION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_signalement_intervention
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_signalement_intervention_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_signalement_intervention(code, valeur)
    VALUES
('10','Signalement'),
('20','Intervention');

COMMENT ON TABLE m_reseau_sec.lt_ecl_moyen_intervention
	IS 'Code permettant de décrire si c''est un signalement ou une intervention';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_moyen_intervention.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_moyen_intervention.valeur IS 'Valeur de la liste';


--############################################################ TYPE DEFAILLANCE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_defaillance
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_defaillance_pkey PRIMARY KEY (code)
)

WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_defaillance(code, valeur)
    VALUES
('00','Non renseigné'),
('10','Foyer éteint'),
('20','Lanterne tournée'),
('30','Vasque cassée'),
('40','Trappe abîmée'), 
('50','Problème d''allumage'),
('60','Phase ouverte'),
('99','Autre');

COMMENT ON TABLE m_reseau_sec.lt_ecl_type_defaillance
	IS 'Code permettant de décrire le type de défaillane';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_defaillance.code IS 'Code de la liste';
COMMENT ON COLUMN m_reseau_sec.lt_ecl_type_defaillance.valeur IS 'Valeur de la liste';



--############################################################ MODELE DE SUPPORT ##################################################

CREATE TABLE m_reseau_sec.an_ecl_modele_support ------------------------------------ Modèle des différents supports          
	(
	id_mod_sup  integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Nom métier du modèle
	nom_mod_su  character varying (254) UNIQUE,--------------------------------- Numéro du modèle de support, interne à l''ARC
	mat_supp    character varying (2) NOT NULL DEFAULT '00',-------------------- Matériau du support
	cod_ral_s   character varying (20) ,---------------------------------------- Code RAL du support
	ik_supp     integer ,------------------------------------------------------- Indice de protection face aux influences extérieures
	ip_supp     integer ,------------------------------------------------------- Indice de protection aux chocs mécaniques
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone, ----------------------------------- Date de dernière mise à jour de la donnée
	op_sai      character varying(80) ------------------------------------------ Opérateur de la saisie de la donnée
	);
---
ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_pkey PRIMARY KEY(id_mod_sup);

---

--- GEO retourne '' au lieu de NULL, on force donc la valeur null pour éviter la contrainte UNIQUE
--- SUPPRESSION DES MESSAGES D'ERREUR
--- GESTION DES CONTRAINTES DE SAISIE avec génération de message d'erreur
--- On update la date maj si UPDATE.
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_modele_support()
  RETURNS trigger AS
$BODY$
BEGIN

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

	IF (new.nom_mod_su = '') THEN ---- On corrige le '' renvoyer par GEO eu lieu de NULL, car ce la pose des problèmes avec les noms UNIQUE

		new.nom_mod_su=NULL;

	END IF;

	---

	IF (NEW.ik_supp > 10::integer) THEN ---- On surcorrige et on met un message d'erreur si ik est supérieur à 10. le messages apparaît dans la fiche GEO
			NEW.ik_supp=NULL;
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_mod_sup, 'L''IK ne peut pas être supérieur à 10 ', now() );
	END IF;

	---

	IF (NEW.ip_supp > 69::integer) THEN ---- On surcorrige et on met un message d'erreur si ip est supérieur à 69. le messages apparaît dans la fiche GEO
			NEW.ip_supp=NULL;
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_mod_sup, 'L''IP ne peut pas être supérieur à 69', now() );		
	END IF;

	---

IF (TG_OP ='UPDATE') THEN

	NEW.date_maj = now(); ---------- On attribue la date actuelle à la date de dernière mis à jour
	
END IF; 

	---

	RETURN NEW;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t1_modele_support
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_modele_support
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_modele_support(); 

INSERT INTO m_reseau_sec.an_ecl_modele_support  
VALUES 
('1','Modèle par défaut','00',NULL,00,00, NULL ,now(),NULL,'geo1'),  --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
('2','Même modèle','00',NULL,00,00, NULL ,now(),NULL,'geo1');

---
  
COMMENT ON TABLE m_reseau_sec.an_ecl_modele_support IS 'Modèles des différents mâts';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.nom_mod_su IS 'Nom métier du modèle';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.id_mod_sup IS 'Numéro du modèle de support, interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.mat_supp IS 'Matériau du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.cod_ral_s IS 'Code RAL du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.ik_supp IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.ip_supp IS 'Indice de protection aux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.op_sai IS 'Opérateur de la saisie de la donnée';
 
--############################################################ MODELE DE LANTERNE ##################################################

CREATE TABLE m_reseau_sec.an_ecl_modele_lanterne ----------------------------------- Modèles de lanternes existants ou ayant existés à Compiègne
	(
	id_mod_ln   integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du modèle de lanterne interne à l''ARC
	nom_mod_ln  character varying (254) UNIQUE,--------------------------------- Nom métier du modèle
	gar_lant    smallint ,------------------------------------------------------ Durée de garantie de la lanterne, en années
	cod_ral_ln  character varying (20) ,---------------------------------------- Code RAL de la lanterne
	clas_el_ln  character varying (2) NOT NULL DEFAULT '00',-------------------- Classe électrique de la lanterne
	ik_lant     integer ,------------------------------------------------------- Indice de protection face aux influences extérieures
	ip_lant     integer ,------------------------------------------------------- Indice de protection aux chocs mécaniques
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	op_sai      character varying(80)  ----------------------------------------- Opérateur de la saisie de la donnée
	);
---
ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_pkey PRIMARY KEY(id_mod_ln);

---

--- GEO retourne '' au lieu de NULL, on force donc la valeur null pour éviter la contrainte UNIQUE
--- SUPPRESSION DES MESSAGES D'ERREUR
--- GESTION DES CONTRAINTES DE SAISIE avec génération de message d'erreur
--- On update la date maj si UPDATE.
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_modele_lanterne()
  RETURNS trigger AS
$BODY$
BEGIN

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

	IF (new.nom_mod_ln = '') THEN ---- On corrige le '' renvoyer par GEO eu lieu de NULL, car ce la pose des problèmes avec les noms UNIQUE

		new.nom_mod_ln=NULL;

	END IF;

	---

	IF (NEW.ik_lant > 10::integer) THEN ---- On surcorrige et on met un message d'erreur si ik est supérieur à 10. le messages apparaît dans la fiche GEO
		NEW.ik_lant=NULL;
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_mod_ln, 'L''IK ne peut pas être supérieur à 10 ', now() );	
	END IF;

	---

	IF (NEW.ip_lant > 69::integer) THEN  ---- On surcorrige et on met un message d'erreur si ip est supérieur à 69. le messages apparaît dans la fiche GEO
		NEW.ip_lant=NULL;
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_mod_ln, 'L''IP ne peut pas être supérieur à 69', now() );	
	END IF;

	---

IF (TG_OP ='UPDATE') THEN

	NEW.date_maj = now(); ---------- On attribue la date actuelle à la date de dernière mis à jour
	
END IF; 

	---

	RETURN NEW;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t1_modele_lanterne
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_modele_lanterne
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_modele_lanterne(); 

---

INSERT INTO m_reseau_sec.an_ecl_modele_lanterne 
VALUES 
('1','Modèle par défaut',NULL,NULL,'00',NULL,NULL, NULL ,now(),NULL,'geo1'), --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
('2','Même modèle',NULL,NULL,'00',NULL,NULL, NULL ,now(),NULL,'geo1');

---

COMMENT ON TABLE m_reseau_sec.an_ecl_modele_lanterne IS 'Modèles de lanternes existants ou ayant existés à Compiègne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.id_mod_ln IS 'Numéro du modèle de lanterne interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.nom_mod_ln IS 'Nom métier du modèle ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.gar_lant IS 'Durée de garantie de la lanterne, en années';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.cod_ral_ln IS 'Code RAL de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.clas_el_ln IS 'Classe électrique de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.ik_lant IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.ip_lant IS 'Indice de protection aux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.op_sai IS 'Opérateur de la saisie de la donnée';


--############################################################ MODELE DE LAMPE ##################################################

CREATE TABLE m_reseau_sec.an_ecl_modele_lampe--------------------------------------- Modèles de lampe existants ou ayant existés à Compiègne
	(
	id_mod_lm   integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du modèle de la lampe, interne à l''ARC
	nom_mod_lm  character varying (254) UNIQUE,--------------------------------- Nom métier du modèle
	ty_lampe    character varying (2) NOT NULL DEFAULT '00',-------------------- Type de lampe
	puis_lam    character varying (2) NOT NULL DEFAULT '00' ,------------------- Puissance de la lampe en Watt
	cul_lamp    character varying(2) NOT NULL DEFAULT '00',--------------------- Culot de la lampe
	telgest     character varying (2) NOT NULL DEFAULT '00',-------------------- Présence d''une télégestion
	cou_ecl     character varying (2) NOT NULL DEFAULT '00',-------------------- Couleur d''éclairage de la lampe
	gar_lamp    smallint ,------------------------------------------------------ Garantie de la lampe en années
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	op_sai      character varying(80)  ----------------------------------------- Opérateur de la saisie de la donnée
	);
---
ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_pkey PRIMARY KEY(id_mod_lm);

---
--- GEO retourne '' au lieu de NULL, on force donc la valeur null pour éviter la contrainte UNIQUE
--- SUPPRESSION DES MESSAGES D'ERREUR
--- GESTION DES CONTRAINTES DE SAISIE 
--- On update la date maj si UPDATE.
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_modele_lampe()
  RETURNS trigger AS
$BODY$
BEGIN

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	IF (new.nom_mod_lm = '') THEN ---- On corrige le '' renvoyer par GEO eu lieu de NULL, car ce la pose des problèmes avec les noms UNIQUE
		new.nom_mod_lm=NULL;
	END IF;

	IF (NEW.ty_lampe <> '10' OR NEW.cul_lamp <> '30') THEN --- La couleur d'éclairage ne peut changer qu'avec les lampes IM (code = 10) culot G12 (code=  30).
		NEW.cou_ecl='ZZ';
	END IF;

	IF (NEW.ty_lampe <> '50') THEN --- Seule une lampe LED (code = 50) peut avoir un télégestion.
		NEW.telgest='00';
	END IF;

	IF (NEW.ty_lampe = '50' AND (NEW.cul_lamp = '30')) THEN --- Les LED ne peuvent pas avoir de culot G12
		NEW.cul_lamp='00';
	END IF;

	IF (NEW.ty_lampe = '50' AND (NEW.puis_lam <> '05' AND NEW.puis_lam <> '15' AND NEW.puis_lam <> '20')) THEN --- Les LED (code = 50) ne peuvent avoir comme puissance que les code = 05, 15 ou 20.
		NEW.puis_lam='00';
	END IF;

	IF (NEW.ty_lampe = '10' AND (NEW.puis_lam <> '10' AND NEW.puis_lam <> '30' AND NEW.puis_lam <> '40' AND NEW.puis_lam <> '50' AND NEW.puis_lam <> '60' AND NEW.puis_lam <> '70')) THEN
		NEW.puis_lam='00';
	END IF;

	IF (NEW.ty_lampe = '20' AND (NEW.puis_lam <> '40' AND NEW.puis_lam <> '50' AND NEW.puis_lam <> '60' AND NEW.puis_lam <> '70' AND NEW.puis_lam <> '80' )) THEN
		NEW.puis_lam='00';
	END IF;


IF (TG_OP ='UPDATE') THEN

	NEW.date_maj = now(); ---------- On attribue la date actuelle à la date de dernière mise à jour
	
END IF; 

	---

	RETURN NEW;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t1_modele_lampe
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_modele_lampe
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_modele_lampe(); 

---

INSERT INTO m_reseau_sec.an_ecl_modele_lanterne 
VALUES 
('1','Modèle par défaut',NULL,NULL,'00',NULL,NULL, NULL ,now(),NULL,'geo1'), --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
('2','Même modèle',NULL,NULL,'00',NULL,NULL, NULL ,now(),NULL,'geo1');

--############################################################ MODELE DE LAMPE ##################################################

INSERT INTO m_reseau_sec.an_ecl_modele_lampe 
VALUES 
('1','Modèle par défaut','00','00','00','00','00',NULL, NULL,now(),NULL,'geo1'), --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
('2','Même modèle','00','00','00','00','00',NULL, NULL,now(),NULL,'geo1');

---

COMMENT ON TABLE m_reseau_sec.an_ecl_modele_lampe IS 'Modèles de lampe existants ou ayant existés à Compiègne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.id_mod_lm IS 'Numéro du modèle de la lampe, interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.nom_mod_lm IS 'Nom métier du modèle';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.ty_lampe IS 'Type de lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.puis_lam IS 'Puissance de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.cul_lamp IS 'Culot de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.telgest IS 'Présence d''une télégestion';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.cou_ecl IS 'Couleur d''éclairage de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.gar_lamp IS 'Garantie de la lampe en années';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.op_sai IS 'Opérateur de la saisie de la donnée';




-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                        CLASSES OBJETS                                                   ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--################################################################# NOEUD #######################################################

CREATE TABLE m_reseau_sec.geo_ecl_noeud--------------------------------------------- Noeud ponctuel du réseau
	(
	id_noeud    integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du noeud interne à l''ARC
	depart      integer,-------------------------------------------------------- Départ auquel est relié le noeud
	exploit_nd  character varying (254) ,--------------------------------------- Exploitant du nœud
	presta_nd   character varying (254) ,--------------------------------------- Prestataire des travaux sur le nœud
	commune     character varying (254) ,--------------------------------------- Commune sur laquelle est situé le nœud
	insee       character varying (5),------------------------------------------ Code insee de la commune sur laquelle est situé le nœud
	ent_pose    character varying (254),---------------------------------------- Entreprise ayant posé l''ouvrage électrique
	dat_pos     timestamp without time zone ,----------------------------------- Date de la pose
	qua_dat     character varying(2) NOT NULL DEFAULT '00',--------------------- Qualité de date de la pose
	src_geom    varchar(2) NOT NULL DEFAULT '00',-------------------------------- Source du référentiel géographique pour le positionnement du nœud
	src_date    varchar(4),----------------------------------------------------- Année du millésime du référentiel géographique de saisie
	op_sai      character varying(80) ,----------------------------------------- Opérateur de la saisie attributaire de la donnée nœud
	geom        geometry(Point,2154),-------------------------------------------- Géométrie du noeud
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	observ      character varying(254),------------------------------------------ Commentaires divers
	qua_geo_XY  character varying (2) NOT NULL DEFAULT '00',-------------------- Qualité de la géolocalisation planimétrique
	qua_geo_Z   character varying (2) NOT NULL DEFAULT '00', ------------------- Qualité de la géolocalisation altimétrique
	op_sai_geo  character varying (254), ---------------------------------------- Opérateur de la géolocalisation
	date_donne  timestamp without time zone, ------------------------------------ Horodatage de la production initiale de la donnée
	situation   character varying (2) NOT NULL DEFAULT '10' ------------------- Situation générale : plus utilisé mais encore là ou utilisé ou supprimé
	id_contrat character varying(2) DEFAULT '00'::character varying, -- Identifiant du contrat de maintenance et d'entretien de l'éclairage public (lien vers la table des contrats r_objet_lt_contrat)
	);
---
ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_pkey PRIMARY KEY(id_noeud);

COMMENT ON TABLE m_reseau_sec.geo_ecl_noeud IS 'Noeud ponctuel du réseau.';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.id_noeud IS 'Numéro du noeud interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.depart IS 'Depart auquel est relié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.exploit_nd IS 'Exploitant du nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.presta_nd IS 'Prestataire des travaux sur le nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.commune IS 'Commune sur laquelle est situé le nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.insee IS 'Code insee de la commune sur laquelle est situé le nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.ent_pose IS 'Entreprise ayant posé l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.dat_pos IS 'Date de la pose';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.qua_dat IS 'Qualité de date de la pose';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.src_geom IS 'Source du référentiel géographique pour le positionnement du nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.src_date IS 'Année du millésime du référentiel géographique de saisie';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.op_sai IS 'Opérateur de la saisie attributaire de la donnée nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.geom IS 'Géométrie du noeud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.qua_geo_XY IS 'Qualité de la géolocalisation planimétrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.qua_geo_Z IS 'Qualité de la géolocalisation altimétrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.op_sai_geo IS 'Opérateur de la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.date_donne IS 'Horodatage de la production initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.situation IS 'Situation générale : Actif / Inactif / supprimé'; 
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.id_contrat IS 'Identifiant du contrat de maintenance et d''entretien de l''éclairage public (lien vers la table des contrats r_objet_lt_contrat)';


--################################################################# CABLE #######################################################

CREATE TABLE m_reseau_sec.geo_ecl_cable -------------------------------------------- Objet linéaire allant d''un nœud à un autre. Transporte l''électricité lorsque le réseau est sous tension
	(
	id_cab      integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du câble interne à l''ARC
	id_nd_ini   integer ,------------------------------------------------------- Lien vers l''identifiant du nœud initial du câble
	id_nd_fin   integer ,------------------------------------------------------- Lien vers l''identifiant du nœud final du câble
	exploi_cab  character varying (254) ,--------------------------------------- Exploitant du câble
	presta_cab  character varying (254) ,--------------------------------------- Prestataire des travaux sur le câble
	etat_cable  character varying (2) NOT NULL DEFAULT '00',-------------------- Etat du câble
	situ_cab    character varying (2) NOT NULL DEFAULT '00',-------------------- Situation physique du câble
	dat_pos_ca  timestamp without time zone ,----------------------------------- Date de pose du câble
	qua_dat     character varying(2) NOT NULL DEFAULT '00',--------------------- Qualité de date de la pose
	sect_cab    character varying (2) NOT NULL DEFAULT '00',-------------------- Section du câble
	ent_pose    character varying (254) ,--------------------------------------- Entreprise ayant posé le cable
	insee1	    character varying(5), ------------------------------------------ Code insee de la commune
	commune1    character varying (50) ,---------------------------------------- Commune sur laquelle est située le câble
	insee2	    character varying(5), ------------------------------------------ Code insee de la commune
	commune2    character varying (50) ,---------------------------------------- Commune sur laquelle est située le câble
	src_geom    varchar(2) NOT NULL DEFAULT '00' ,------------------------------ Source du référentiel géographique pour le positionnement du nœud
	src_date    varchar(4) ,---------------------------------------------------- Année du millésime du référentiel géographique de saisie
	observ      varchar(254),--------------------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	op_sai      character varying(80), ----------------------------------------- Opérateur de la saisie de la donnée
	geom        geometry(LineString,2154), ------------------------------------- Géométrie du câble
	qua_geo_XY  character varying (2) NOT NULL DEFAULT '00',-------------------- Qualité de la géolocalisation planimétrique
	qua_geo_Z   character varying (2) NOT NULL DEFAULT '00', ------------------- Qualité de la géolocalisation altimétrique
	op_sai_geo  character varying (254), ---------------------------------------- Opérateur de la géolocalisation
	date_donne  timestamp without time zone, ------------------------------------ Horodatage de la donnée
	situation   character varying (2) NOT NULL DEFAULT '10' ------------------- Situation générale : plus utilisé mais encore là ou utilisé ou supprimé
	id_contrat character varying(2) DEFAULT '00'::character varying, -- Identifiant du contrat de maintenance et d'entretien de l'éclairage public (lien vers la table des contrats r_objet_lt_contrat)
	);
---
ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_pkey PRIMARY KEY(id_cab);

---

--- On force la valeur de certains attributs à l'insertion
--- On actualise la dae de maj à l'update
--- SUPPRESSION DES MESSAGES D'ERREUR
--- GESTION DES CONTRAINTES DE SAISIE avec génération de message d'erreur
--- On force une valeur aux attributs noeud initial et noeud final du câble. --> lien avec table noeud.
--- On force une valeur pour les attributs commune, insee, gestionnaire, prestataire, en fonction d'autres tables.

-- Function: m_reseau_sec.ft_m_cable_before()

-- DROP FUNCTION m_reseau_sec.ft_m_cable_before();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_cable_before()
  RETURNS trigger AS
$BODY$
BEGIN

	IF (TG_OP ='INSERT') THEN

		NEW.date_donne = now();
		NEW.qua_geo_Z = '30'; --- Classe C
		NEW.qua_geo_XY = '30';--- Classe C
		NEW.src_geom = '20'; ---- Orthophotographie
		NEW.src_date = '2013';--- 
		NEW.situation = '10';---- Actif
		NEW.presta_cab = CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END;
		NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom));
	
	END IF; 

---

	IF (TG_OP ='UPDATE') THEN

	DELETE FROM m_reseau_sec.an_ecl_erreur WHERE id_objet IN (SELECT id_cab FROM m_reseau_sec.geo_ecl_cable); ------ On efface les messages d'erreurs existants

	IF ST_equals(new.geom,old.geom) is false AND new.qua_geo_xy = '10' THEN
	  

	   INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)----------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_cab, 'Vous ne pouvez pas modifier la géométrie d''un objet en classe A', now() );--- Ce message, qui apparaît dans GEO sur la fiche départ

		new.geom = old.geom;
	ELSE
	NEW.date_maj = now(); ---------------------------------- On attribue la date actuelle à la date de dernière mise à jour.
	END IF;

	
	END IF; 




	

	--- CORRECTION DES ERREURS DE SAISIE, affichage message d'erreur

	IF (NEW.date_donne > now()::timestamp) THEN --------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
		NEW.date_donne=NULL;-------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)----------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_cab, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );--- Ce message, qui apparaît dans GEO sur la fiche départ
	END IF;

        ---- Sélection d'un seul noeud s'il y en a plusieurs avec count(*) --> on ne prend pas les PI, il est impossible qu'il y ait d'autres noeuds superposés qu'un pi et autre chose

	IF ((SELECT count(*) --------------------------------------------------------------------------------------------------------------------------------- Si le nombre de ...
	     FROM m_reseau_sec.geo_ecl_noeud nd -------------------------------------------------------------------------------------------------------------- Noeuds
	     WHERE ST_equals(nd.geom,ST_StartPoint(NEW.geom)) AND situation <> '12') < 2  ) THEN ------------------------------------------------------------- Dont la géométrie est égale au point de départ du câble et dont la situation n'est pas 'supprimé' (code='12') est strictement inférieur à 2
	     
		new.id_nd_ini= (SELECT id_noeud ----------------------------------------------------------------------------------------------------------------- On attribue au noeud initial du câble l'identifiant du noeud
				FROM m_reseau_sec.geo_ecl_noeud nd 
				WHERE ST_equals(nd.geom,ST_StartPoint(NEW.geom)) AND situation <> '12');--------------------------------------------------------- dont la géométrie est égale (ou valeur null s'il n'y en a pas).
		
	ELSE ---------------------------------------------------------------------------------------------------------------------------------------------------- Sinon (Donc s'il y a 2 noeuds, puisque plus ce n'est pas permis).
	
		new.id_nd_ini= (SELECT id_noeud ----------------------------------------------------------------------------------------------------------------- On attribue au noeud initial du câble l'identifiant du noeud...
				FROM m_reseau_sec.geo_ecl_noeud nd 
				WHERE ST_equals(nd.geom,ST_StartPoint(NEW.geom)) AND situation <> '12' ---------------------------------------------------------- Dont la géométrie est égale au point de départ du câble et dont la situation n'est pas 'supprimé' (code='12') 
											 AND id_noeud NOT IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi)---------- ET qui n'est pas un point d'intérêt --> effectivement, seuls les points lumineux et les points d'intérêt peuvent être superposés, OR le lien câble / point lumineux est important pour certaines VUES contrairement au lien câble / Poibnt d'intérêt.
			       );
	END IF;

	IF ((SELECT count(*) ------------------------------------------------------------------------------------------------------------------------------------ Voir commentaire ci-dessus, même fonctionnement ici pour le noeud de fin
	     FROM m_reseau_sec.geo_ecl_noeud nd 
	     WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)) AND situation <> '12') < 2  ) THEN 
	     
		new.id_nd_fin= (SELECT id_noeud 
				FROM m_reseau_sec.geo_ecl_noeud nd 
				WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)) AND situation <> '12');
		
	ELSE 
	
		new.id_nd_fin= (SELECT id_noeud 
				FROM m_reseau_sec.geo_ecl_noeud nd 
				WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)) AND situation <> '12' 
											 AND id_noeud NOT IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi)
			       );
	END IF;

	---

	IF (NEW.id_nd_ini = NEW.id_nd_fin) THEN -----------On supprime les câble qui ont le même noeud final et initial

		NEW.situation = '12'; -------------------- Situation = '12' équivaut à ''supprimé'' dans la liste de domaine lt_ecl_situation

		
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_cab, 'Un câble ne peut pas être relié deux fois au même nœud.', now() );

	END IF;


	---- Un câble ne peut pas être relié à une armoire principale comme noeud final, donc si c'est le cas, on inverse le noeud final et le noeud initial
	IF ((SELECT count(*) 
	     FROM m_reseau_sec.geo_ecl_noeud nd 
	     WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)) AND situation <> '12') < 2  ) THEN ------------------ S'il y a au plus un noeud avec la même géométrie que le noeud final
	     
		IF ((SELECT id_noeud 
		     FROM m_reseau_sec.geo_ecl_noeud nd 
		     WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom))AND situation <> '12' ) IN (SELECT id_ouvelec 
											       FROM m_reseau_sec.an_ecl_ouvrage_electrique 
											       WHERE ty_ouvelec = '10')) THEN --------------- Si le noeud final est une armoire
											 				      --------------- ON ECHANGE LES DEUX NOEUDS 
			new.id_nd_ini= (SELECT id_noeud 
					FROM m_reseau_sec.geo_ecl_noeud nd 
					WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)) AND situation <> '12'); ---- Noeud initial = noeud final
					
			new.id_nd_fin= (SELECT id_noeud 
					FROM m_reseau_sec.geo_ecl_noeud nd 
					WHERE ST_equals(nd.geom,ST_StartPoint(NEW.geom))AND situation <> '12');---- Noeud final = noeud initial


		END IF ;
		
	ELSE	------------------------------------------------------------------------------------------------ S'il y a deux noeud avec la même géométrie que le noeud final
	
		
	END IF ;

	NEW.insee1 = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,ST_StartPoint(NEW.geom))); ------ Remplissage automatique de l'insee
	NEW.insee2 = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,ST_EndPoint(NEW.geom)));
	NEW.commune1 = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,ST_StartPoint(NEW.geom)));
	NEW.commune2 = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,ST_EndPoint(NEW.geom)));

---

		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Intersects(gestion.geom,NEW.geom)) = 1) THEN
	

			NEW.exploi_cab= (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Intersects(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.presta_cab = (SELECT presta_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Intersects(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee


		ELSIF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Intersects(gestion.geom,NEW.geom)) > 1) THEN

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_cab, 'L''objet se situe dans plusieurs zones de gestion. Merci de renseigner le prestataire et l''exploitant dans les métadonnées de ce câble.', now() );
		
		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_cab, 'L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.', now() );
			RETURN OLD ;

		END IF;

	NEW.presta_cab = CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END;
	NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom));

---




---

	
RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_sec.ft_m_cable_before()
  OWNER TO sig_create;


---

-- A LA SUPPRESSION DU CABLE, attribut à SUPPRIMER (pas de supression géométrique de l'objet)
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_cable_delete()
  RETURNS trigger AS
$BODY$
DECLARE produit integer;
BEGIN
-- On empêche que ce soit supprimé, à la place on change la valeur de la situation vers ''Supprimé''

UPDATE m_reseau_sec.geo_ecl_cable
SET
situation = '12' -------------------- Situation = '12' équivaut à ''supprimé'' dans la liste de domaine lt_ecl_situation
WHERE OLD.id_cab=id_cab;--------- On utilise OLD puisque c'est un trigger DELETE
RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t3_cable_delete
  BEFORE DELETE
  ON m_reseau_sec.geo_ecl_cable
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_cable_delete();

---log

CREATE TRIGGER t_t4_log_cable
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_ecl_cable
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

---
  
COMMENT ON TABLE m_reseau_sec.geo_ecl_cable IS 'Objet linéaire allant d''un nœud à un autre.';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_cab IS 'Numéro du câble interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_nd_ini IS 'Lien vers l''identifiant du nœud initial du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_nd_fin IS 'Lien vers l''identifiant du nœud final du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.exploi_cab IS 'Exploitant du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.presta_cab IS 'Prestataire des travaux sur le câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.etat_cable IS 'Etat du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.situ_cab IS 'Situation physique du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.dat_pos_ca IS 'Date de pose du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.sect_cab IS 'Section du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.ent_pose IS 'Entreprise ayant posé le cable';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.insee1 IS 'Code insee de la commune sur laquelle est située le câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.commune1 IS 'Commune sur laquelle est située le câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.insee2 IS 'Code insee de la commune sur laquelle est située le câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.commune2 IS 'Commune sur laquelle est située le câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.src_geom IS 'Source du référentiel géographique pour le positionnement du nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.src_date IS 'Année du millésime du référentiel géographique de saisie';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.geom IS 'Géométrie du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.op_sai IS 'Opérateur de la saisie attributaire de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.qua_geo_XY IS 'Qualité de la géolocalisation planimétrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.qua_geo_Z IS 'Qualité de la géolocalisation altimétrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.op_sai_geo IS 'Opérateur de la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.date_donne IS 'Horodatage de la production initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.situation IS 'Situation générale : Actif / Inactif / supprimé'; 
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.qua_dat IS 'Qualité de date de la pose';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_contrat IS 'Identifiant du contrat de maintenance et d''entretien de l''éclairage public (lien vers la table des contrats r_objet_lt_contrat)';


--################################################################# SUPPORT #####################################################


CREATE TABLE m_reseau_sec.an_ecl_support ------------------------------------------- Table des supports de foyer
	(
	id_supp     integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié au support
	id_mod_sup  integer NOT NULL DEFAULT '1',  --------------------------------- Lien vers table modèle support
	ty_supp     character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de support : mat, facade…etc.
	opt_supp    varchar (80),  ------------------------------------------------- Option(s) du support, sous forme de liste déroulante dans GEO
	ty_parasu   character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de parasurtenseur
	etat_supp   character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du support
	haut_trap   character varying (2) NOT NULL DEFAULT '00',  ------------------ Hauteur de la trappe de visite : Standard ou En hauteur
	ty_disjonc  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du disjoncteur
	ty_fusible  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du fusible
	haut_supp   integer ,  ----------------------------------------------------- Hauteur du support
	nbr_foyer   integer
	);

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_pkey PRIMARY KEY(id_supp);

COMMENT ON TABLE m_reseau_sec.an_ecl_support IS 'Supports des foyers (sol, façade, mât...)';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.id_supp IS 'Identifiant du nœud lié au support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.id_mod_sup IS 'Lien vers table modèle de support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_supp IS 'Type de support : mat, facade…etc.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.opt_supp IS 'Option(s) du support, sous forme de liste déroulante dans l''application';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_parasu IS 'Type de parasurtenseur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.etat_supp IS 'Etat du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.haut_trap IS 'Hauteur de la trappe de visite : Standard ou En hauteur';;
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.haut_supp IS 'Hauteur du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.nbr_foyer IS 'Nombre de foyer, calculé automatiquement via trigger';

--############################################################# POINT D'INTERET ##################################################

CREATE TABLE m_reseau_sec.an_ecl_pi ------------------------------------------------ Objet réel ou abstrait indiquant un point d'importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''Eclairage Public.
	(
	id_pi       integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié au point d''interet
	ty_pi       character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de point d''intérêt
	etat_pi     character varying (2) NOT NULL DEFAULT '00'  ------------------ Etat du point d''intérêt
	);
---
ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_pkey PRIMARY KEY(id_pi);

COMMENT ON TABLE m_reseau_sec.an_ecl_pi IS 'Objet réel ou abstrait indiquant un point d''importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''Eclairage Public.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.id_pi IS 'Identifiant du nœud lié au point d''interet';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.ty_pi IS 'Type de point d''intérêt';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.etat_pi IS 'Etat du point d''intérêt ';

--############################################################ OUVRAGE ELECTRIQUE ##################################################

CREATE TABLE m_reseau_sec.an_ecl_ouvrage_electrique -------------------------------- Objet avec une arrivée d''électricité et un ou plusieurs départs
	(
	id_ouvelec  integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié à l''ouvrage
	nom_ouv     character varying (254), --------------------------------------- Nom métier de l'ouvrage -- pas unique car il y a plusieurs communes qui peuvent avoir le même numéro d'armoire
	pdl_edf     character varying (4) ,  --------------------------------------- Numéro de référence EDF
	n_com_edf   character varying (10) ,  -------------------------------------- Numéro du compteur EDF
	ty_ouvelec  character varying (2)  DEFAULT '00',---------------------------- Type d''ouvrage électrique
	etat_ouvel  character varying (2)  DEFAULT '00',---------------------------- Etat de l''ouvrage électrique
	mod_pos_ou  character varying (2)  DEFAULT '00',  -------------------------- Mode de pose de l''ouvrage électrique
	val_terre   bigint ,  ------------------------------------------------------ Valeur globale de la terre
	ik_ouvelec  integer ,   ---------------------------------------------------- Indice de protection face aux influences extérieures
	ip_ouvelec  integer ,   ---------------------------------------------------- Indice de protection eux chocs mécaniques
	puis_mes    integer ,  ----------------------------------------------------- Puissance mesurée
	puis_sous   integer ,  ----------------------------------------------------- Puissance souscrite
	ty_comm     character varying (2)  DEFAULT '00',  -------------------------- Type de commande
	pres_var    character varying (2)  DEFAULT '00',  -------------------------- Présence d''un variateur
	ty_disjonc  character varying (2)  DEFAULT '00',  -------------------------- Type du disjoncteur
	ty_fusible  character varying (2)  DEFAULT '00'  -------------------------- Type du fusible
	);
--- 
ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_pkey PRIMARY KEY(id_ouvelec);


COMMENT ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique IS 'Objet avec une arrivée d''électricité et un ou plusieurs départs.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.id_ouvelec IS 'Identifiant du nœud lié à l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.nom_ouv IS 'Nom métier de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.pdl_edf IS 'Numéro de référence EDF';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.n_com_edf IS 'Numéro du compteur EDF';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_ouvelec IS 'Type d''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.etat_ouvel IS 'Etat de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.mod_pos_ou IS 'Mode de pose de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.val_terre IS 'Valeur globale de la terre';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ik_ouvelec IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ip_ouvelec IS 'Indice de protection eux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.puis_mes IS 'Puissance mesurée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.puis_sous IS 'Puissance souscrite';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_comm IS 'Type de commande d''allumage';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.pres_var IS 'Présence d''un variateur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_fusible IS 'Type du fusible';

--################################################################### DEPART #######################################################

CREATE TABLE m_reseau_sec.an_ecl_depart -------------------------------------------- Objet intégré à une armoire et permettant le branchement d''un câble
	(
	id_depart   integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du depart interne à l''ARC
	id_ouvelec  integer NOT NULL,  --------------------------------------------- Lien vers table armoire
	nom_depart  character varying (254),  -------------------------------------- Nom du secteur déservi par le départ -- pas de unique car pour les transformateurs les noms sont les mêmes
	etat_dep    character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du départ
	tension     character varying (10) ,  ---------------------------------------Tension électrique en sortie - en varchar pour la gestion d'intervention
	ty_disjonc  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du disjoncteur
	ty_fusible  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du fusible
	observ      character varying(254) ,  -------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	op_sai      character varying(80), ----------------------------------------- Opérateur de la saisie initiale de la donnée
	situation   character varying (2) NOT NULL DEFAULT '10', ------------------- Situation générale : plus utilisé mais encore là ou utilisé ou supprimé
	date_donne  timestamp without time zone, ----------------------------------- Horodatage de la donnée
	puis_sous   integer -------------------------------------------------------- Puissance souscrite calculée via trigger
	);
---

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_pkey PRIMARY KEY(id_depart);
  
---

-- GESTION DES CONTROLES DE SAISIE A L'INSERTION OU LA MISE A JOUR (par génération de message d'erreur)
-- MISE A JOUR DE date_maj à la MAJ
-- A L'INSERT, génération de la date de la donnée (source) à la date du jour (modifiable ensuite par l'utilisateur)
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_depart_insert_update()
  RETURNS trigger AS
$BODY$
BEGIN

-- 1 ere partie : On Efface les messages d'erreurs existants, puis on test les attributs pour générer les nouveaux messages d'erreur si besoin

	DELETE FROM m_reseau_sec.an_ecl_erreur WHERE id_objet NOT IN (SELECT id_foyer FROM m_reseau_sec.an_ecl_foyer); ------ On efface les messages d'erreurs existants de la table, sauf foyer car ce trigger est lancé lors de l'update de foyer

	---

	IF (NEW.date_donne >= now()::timestamp) THEN--------------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
		NEW.date_donne=NULL;------------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)---------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_depart, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );----- Ce message, qui apparaît dans GEO sur la fiche départ
	END IF;
	
-- 2 ème partie : on actualise la date de maj si c'est un update

	IF (TG_OP ='UPDATE') THEN -------- Si c'est un UPDATE
		NEW.date_maj = now();----- La date de dernière mise à jour devient la date actuelle
	END IF; 

-- 3 ème partie : on défini la date de la donnée à now() si c'est un insert. Si l'armoire à laquelle est ajoutée le départ est inactive, on force le départ à être inactif.

	IF (TG_OP ='INSERT') THEN ------------------------------------------------------------------------------------ Si c'est un INSERT
		NEW.date_donne = now();------------------------------------------------------------------------------- La date de la donnée est égale à la date actuelle, elle est modifiable par la suite dans GEO 
		IF ((SELECT situation FROM m_reseau_sec.geo_ecl_noeud WHERE NEW.id_ouvelec = id_noeud) = '11') THEN--- Si le départ est ajouté à une armoire inactive 
			NEW.situation='11'; -------------------------------------------------------------------------- Le départ est ajouté en inactif
		END IF;	
	END IF; 

	
RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
  CREATE TRIGGER t_t1_depart_insert_update
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_depart
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_depart_insert_update(); 
  
---

-- SUPPRESSION VIRTUELLE DU DEPART (attribut SITUATION à supprimer)
-- COMME SUPPRIMER chap départ à null au niveau des noeuds reliés à ce départ
-- RAFRAICHISSEMENT DE LA VUE RECURSIVE
  CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_depart_delete()
  RETURNS trigger AS
$BODY$
DECLARE produit integer;
BEGIN
-- On empêche que ce soit supprimé, à la place on change la valeur de la situation vers ''Supprimé''

	UPDATE m_reseau_sec.an_ecl_depart
	SET
	situation = '12' ----------------------- Situation = '12' équivaut à ''supprimé'' dans la liste de domaine lt_ecl_situation
	WHERE OLD.id_depart=id_depart; --------- On utilise OLD puisque c'est un trigger DELETE

	---

	UPDATE m_reseau_sec.geo_ecl_noeud------- On UPDATE la table noeud
	SET
	depart = NULL -------------------------- On enlève les liens entre le départ inactif et les noeuds qui lui étaient reliés
	WHERE depart = OLD.id_depart;

	---

	REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t3_depart_delete ---- Le t2 est réservé au log.
  BEFORE DELETE
  ON m_reseau_sec.an_ecl_depart
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_depart_delete(); 

--- log

CREATE TRIGGER t_t3_log_depart
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_depart
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();

COMMENT ON TABLE m_reseau_sec.an_ecl_depart IS 'Objet intégré à un ouvrage électrique et permettant le branchement d''un câble.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.id_depart IS 'Numéro du depart interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.id_ouvelec IS 'Lien vers table armoire';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.nom_depart IS 'Nom du secteur déservi par le départ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.etat_dep IS 'Etat du départ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.tension IS 'Tension électrique en sortie';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.op_sai IS 'Opérateur de la saisie initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.puis_sous IS 'Puissance souscrite calculée via un trigger';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.date_donne IS 'Horodatage de la production initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.situation IS 'Situation générale : Actif / Inactif / supprimé'; 

--################################################################## FOYER  ########################################################
CREATE TABLE m_reseau_sec.an_ecl_foyer -------------------------------------- Objet reposant sur un support, intégrant une source lumineuse
	(
	id_foyer    integer DEFAULT nextval('m_reseau_sec.ecl_objet_seq') NOT NULL,----- Numéro du foyer interne à l''ARC
	id_supp     integer NOT NULL,  --------------------------------------------- Identifiant du support sur lequel repose le foyer
	id_mod_ln   integer NOT NULL DEFAULT '1',  --------------------------------- Lien vers la table modèle lanterne
	id_mod_lm   integer NOT NULL DEFAULT '1',  --------------------------------- Lien vers table modèle lampe
	etat_foy    character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du foyer : état de la lanterne + etat de la lampe = moyenne
	ty_lantern  character varying (2) NOT NULL DEFAULT '00',-------------------- Type de la lanterne piéton / routier / projecteur
	haut_feu    varchar (6),  -------------------------------------------------- Hauteur max de la lanterne par rapport au niveau de la chaussée
	dat_pos_ln  timestamp without time zone ,  --------------------------------- Date de la pose de la lanterne
	pct_fct     numeric ,  ----------------------------------------------------- Puissance de la lampe en % de sa puissance maximale : uniquement pour les leds / Présent dans un logiciel mais non accessible au ST
	dat_pos_lm  timestamp without time zone ,  --------------------------------- Date de pose de la lampe
	ty_ballast  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de ballast installé
	ty_amorce   character varying (2) NOT NULL DEFAULT '00',  ------------------ Type d''amorceur installé
	ty_auto_tr  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type d''auto trasformateur installé
	loc_plat    character varying (2) NOT NULL DEFAULT '00',  ------------------ Localisation de la platine du foyer
	observ      character varying(254) ,  -------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Date de la saisie de la donnée dans la base
	date_maj    timestamp without time zone,------------------------------------ Date de dernière mise à jour de la donnée
	op_sai      character varying(80), ------------------------------------------ Opérateur de la saisie de la donnée
	situation   character varying (2) NOT NULL DEFAULT '10', ------------------- Situation générale : plus utilisé mais encore là ou utilisé ou supprimé
	date_donne  timestamp without time zone ------------------------------------ Horodatage de la donnée
	);
---
ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_pkey PRIMARY KEY(id_foyer);

---

-- SUPPRESSION DES MESSAGES D'ERREUR
-- GESTION DES CONTRAINTES DE SAISIE avec génération de message d'erreur
-- FORCAGE DE CERTAINS ATTRIBUTS A L'INSERTION
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_foyer()
  RETURNS trigger AS
$BODY$
DECLARE produit integer;
BEGIN

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

	IF (NEW.pct_fct > 100::numeric) THEN -------------------------------------------------------------------- Si le pourcentage de puissanc de fonctionnement de la lampe est > 100 %
		NEW.pct_fct=NULL; ------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure) ------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_foyer, 'Le % de puissance de fonctionnement ne peut pas dépasser les 100 %', now() ); --- Ce message, qui apparaît dans GEO sur la fiche foyer
	END IF;

	---

	IF (NEW.date_donne >= now()::timestamp) THEN ----------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
		NEW.date_donne=NULL; --------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_foyer, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );--- Ce message, qui apparaît dans GEO sur la fiche foyer
	END IF;

	---
	
	IF ((SELECT ty_lampe FROM m_reseau_sec.an_ecl_modele_lampe WHERE NEW.id_mod_lm = id_mod_lm) ='50') THEN-------------------------------------------------------------------- Si c'est une lampe LED (on va chercher dans la table modèle de lampe le type de lampe correspondant au modèle saisi dans la table foyer)
		IF (NEW.loc_plat <> '20' OR NEW.ty_amorce <> 'ZZ' OR NEW.ty_ballast <> '30') THEN --------------------------------------------------------------------------------- Et que la localisation de la platine, le type d'amorce ou le type de ballast n'ont pas la bonne valeur (une seule possible pour les LED)
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_foyer, 'Pour les LED, l''emplacement de la platine est automatiquement indiqué dans la lanterne, l''amorceur est en "non-concerné" et le ballast est indiqué comme "driver". ', now() );-- On créé ce message d'erreur qui s'affiche dans la fiche info du foyer dans GEO		
		END IF;
		
		NEW.ty_ballast = '30';--------------------------------------------------------------------------------------------------------------------------------------------- Et on met la bonne valeur à ces 3 attributs
		NEW.ty_amorce = 'ZZ';
		NEW.loc_plat = '20';
	END IF;

	---

	IF ((SELECT ty_lampe FROM m_reseau_sec.an_ecl_modele_lampe WHERE NEW.id_mod_lm = id_mod_lm) <>'50') THEN ---------------- Si le type de lampe n'est pas une LED (on va chercher dans la table modèle de lampe le type de lampe correspondant au modèle saisi dans la table foyer)
		IF ( NEW.pct_fct IS NOT NULL ) THEN------------------------------------------------------------------------------ Et que le pourcentage de fonctionnement n'est pas NULL
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)---------------------------------------- On ajoute dans la table erreur
			VALUES
			(NEW.id_foyer, 'Seules les LED peuvent avoir un pourcentage de puissance de fonctionnement.', now() );--- Ce message, qui apparaît dans GEO sur la fiche foyer
		END IF;

		NEW.pct_fct = NULL; --------------------------------------------------------------------------------------------- Puis on surcorrige la saisie en attribuant la valeur NULL
	END IF;

	---

	IF (TG_OP = 'UPDATE') THEN ----------- SI c'est un UPDATE

		IF (((SELECT ty_lampe FROM m_reseau_sec.an_ecl_modele_lampe WHERE NEW.id_mod_lm = id_mod_lm) <>'50')
		      AND ((SELECT ty_lampe FROM m_reseau_sec.an_ecl_modele_lampe WHERE OLD.id_mod_lm = id_mod_lm) ='50') --- SI l'on passe d'une lampe LED à une lampe pas LED (on va chercher dans la table modèle de lampe le type de lampe correspondant au modèle saisi dans la table foyer)
		    )  THEN
		   
			   IF ( NEW.ty_ballast = '30' ) THEN ------------------------------------------------------------------- SI le ballast est resté sur la valeur 'Driver' (code = '30') alors qu'elle n'est possible que pour led LED
				NEW.ty_ballast = '00'; ------------------------------------------------------------------------- Le type de ballast passe à Non renseigné (code = '00')
			   END IF ; -------------------------------------------------------------------------------------------- FIN de condition
			   
			   IF (NEW.ty_amorce = 'ZZ') THEN ---------------------------------------------------------------------- SI que le type d'amorce et resté sur la valeur 'Non-concerné' (code ='ZZ') alors qu'elle n'est possible que pour led LED
				NEW.ty_amorce = '00'; -------------------------------------------------------------------------- On attribue la valeur 'Non renseigné' (code = '00') au type d'amorce
			   END IF;---------------------------------------------------------------------------------------------- FIN de condition
		   
		END IF;------------------------------------------------------------------------------------------------------ FIN de condition

		NEW.date_maj = now(); -------- On attribue la date actuelle à la date de dernière mise à jour.
		RETURN NEW;
	END IF; ------------------------------ FIN de condition

	---

	IF (TG_OP ='INSERT') THEN --- SI c'est un INSERT
		IF (NEW.op_sai <> 'ROCH SERVICE' AND NEW.op_sai <> 'ACEP CONTROLE' AND NEW.op_sai <> 'INEO RNO') THEN --- SI ce n'est pas des données d'un prestataire
			NEW.date_donne = now(); ------------------------------------------------------------------------- On attribue à la date de la donnée la date actuelle. Elle sera modifiable par la suite dans GEO
		END IF;-------------------------------------------------------------------------------------------------- FIN de condition
		RETURN NEW;
	END IF; --------------------- FIN de condition


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t1_foyer
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_foyer
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_foyer(); 

  ---

-- ON UPDATE le support du foyer (nbr foyer) et le départ auquel est lié le foyer (puissance souscrite).
-- Function: m_reseau_sec.ft_m_foyer_after()

-- DROP FUNCTION m_reseau_sec.ft_m_foyer_after();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_foyer_after()
  RETURNS trigger AS
$BODY$
DECLARE produit integer;
BEGIN
-------- En AFTER on update le départ afin qu'il prenne en compte la nouvelle valeur de lampe dans le calcul de la puissance souscrite. 

	UPDATE m_reseau_sec.an_ecl_support ---------------------------------------------------------------------------- On UPDATE le support du foyer en comptant le nombre de foyers qui lui sont raccrochés
	SET
	nbr_foyer = (SELECT count(*) ------------------------------------------------------------------------------------- On compte le nombre...
		     FROM m_reseau_sec.an_ecl_foyer ---------------------------------------------------------------------- De foyer
		     WHERE situation <> '12' AND situation <> '11' AND id_supp = NEW.id_supp) ---------------------------- Dont la situation n'est pas 'Inactif' (code = '11') ou 'Supprimer' (code ='12') ET dont le support est le même que le foyer ajouté.
										 
	WHERE NEW.id_supp=id_supp; ------------------------------------------------------------------------------------ Là ou le support est le même que celui du foyer saisi.

	---

	IF ((SELECT situation FROM m_reseau_sec.geo_ecl_noeud WHERE NEW.id_supp = id_noeud) = '11') THEN --- SI le support est 'Inactif' (situation code ='11')  
		NEW.situation='11';------------------------------------------------------------------------- Le foyer devient inactif
	END IF;--------------------------------------------------------------------------------------------- FIN de condition

	---
	--- partie désactivé car puissance lampe à saisir (pas liste de valeur) et null possible
	--- et en plus sous-armoire non prise en compte ici
        --- on calcule ici la puissance de l'ensemble des lampes des foyers reliés au départ 

-- partie supprimé car puissance mis en charactère mais à gérer plus tard (cf ticket redmine)
/*
IF ( TG_OP = 'INSERT') THEN ------------------------- Si c'est un INSERT
	UPDATE m_reseau_sec.an_ecl_depart---- On UPDATE le départ
			SET 
				puis_sous = 	(SELECT SUM ((lt_ecl_puissance_lampe.valeur::integer * (( SELECT count(*) AS count -------------Les puissances des lampes * le nbr de foyers...
													  FROM m_reseau_sec.an_ecl_foyer 
													  WHERE (an_ecl_foyer.id_mod_lm IN ----- Dont le modèle de lampe est ...
																	(SELECT an_ecl_modele_lampe.id_mod_lm 
																	 FROM m_reseau_sec.an_ecl_modele_lampe
																	 WHERE an_ecl_modele_lampe.puis_lam::text = lt_ecl_puissance_lampe.code::text)) ------ celui dont on a sélectionner la valeur au début.
																	       AND situation <> '12'
																	       AND (an_ecl_foyer.id_supp IN (SELECT geo_ecl_noeud.id_noeud ------------------- Encore en sélection sur le foyer : qui est lié à un noeud... 
																					     FROM m_reseau_sec.geo_ecl_noeud
																					     WHERE geo_ecl_noeud.depart = dep.id_depart AND situation <> '12' AND situation <> '11')))))) AS val --... qui est lui même lié au départ sur lequel on fait la recherche. 
						FROM m_reseau_sec.lt_ecl_puissance_lampe,m_reseau_sec.an_ecl_depart dep
						WHERE lt_ecl_puissance_lampe.code::text <> '00'::text AND lt_ecl_puissance_lampe.code::text <> 'ZZ'::text AND lt_ecl_puissance_lampe.code::text <> '99'::text -- Là où le modèle de lampe n'a pas une puissance nulle, non concerné ou Autre.
						      AND id_depart =(SELECT depart 
									   FROM m_reseau_sec.geo_ecl_noeud 
									   WHERE id_noeud =  NEW.id_supp
									  ))

			WHERE id_depart =    (SELECT depart 
								   FROM m_reseau_sec.geo_ecl_noeud 
								   WHERE id_noeud =  NEW.id_supp
								  );

			

	
ELSIF ( TG_OP = 'UPDATE') THEN --------------------- SI c'est un UPDATE

	--IF (OLD.id_mod_lm <> NEW.id_mod_lm) THEN ---- Si l'ancienne et la nouvelle lampe sont différentes (Pour éviter que ça se lance à chaque changement sur un foyer)
		UPDATE m_reseau_sec.an_ecl_depart---- On UPDATE le départ --> même procédé que si dessus.
			SET 
				puis_sous = 	(SELECT SUM ((lt_ecl_puissance_lampe.valeur::integer * (( SELECT count(*) AS count -------------Les puissances des lampes * le nbr de foyers...
													  FROM m_reseau_sec.an_ecl_foyer 
													  WHERE (an_ecl_foyer.id_mod_lm IN ----- Dont le modèle de lampe est ...
																	(SELECT an_ecl_modele_lampe.id_mod_lm 
																	 FROM m_reseau_sec.an_ecl_modele_lampe
																	 WHERE an_ecl_modele_lampe.puis_lam::text = lt_ecl_puissance_lampe.code::text)) ------ celui dont on a sélectionner la valeur au début.
																	       AND situation <> '12'
																	       AND (an_ecl_foyer.id_supp IN (SELECT geo_ecl_noeud.id_noeud ------------------- Encore en sélection sur le foyer : qui est lié à un noeud... 
																					     FROM m_reseau_sec.geo_ecl_noeud
																					     WHERE geo_ecl_noeud.depart = dep.id_depart AND situation <> '12' AND situation <> '11')))))) AS val --... qui est lui même lié au départ sur lequel on fait la recherche. 
						FROM m_reseau_sec.lt_ecl_puissance_lampe,m_reseau_sec.an_ecl_depart dep
						WHERE lt_ecl_puissance_lampe.code::text <> '00'::text AND lt_ecl_puissance_lampe.code::text <> 'ZZ'::text AND lt_ecl_puissance_lampe.code::text <> '99'::text -- Là où le modèle de lampe n'a pas une puissance nulle, non concerné ou Autre.
						      AND id_depart =(SELECT depart 
									   FROM m_reseau_sec.geo_ecl_noeud 
									   WHERE id_noeud =  NEW.id_supp
									  ))

			WHERE id_depart =    (SELECT depart 
								   FROM m_reseau_sec.geo_ecl_noeud 
								   WHERE id_noeud =  NEW.id_supp
								  );

	--END IF;
	
END IF;--------------------------------------------- FIN de condition
*/

RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_sec.ft_m_foyer_after()
  OWNER TO postgres;


  CREATE TRIGGER t_t3_foyer_after --- t3 réservé à log
  AFTER INSERT OR UPDATE
  ON m_reseau_sec.an_ecl_foyer
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_foyer_after(); 

---

-- SUPPRESSION VIRTUELLE DU FOYER (attribut SITUATION à supprimer)
-- COMME SUPPRIMER Puissance souscrite du départ auquel il est lié remise à jour.
-- RAFRAICHISSEMENT DE LA VUE RECURSIVE
CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_foyer_delete()
  RETURNS trigger AS
$BODY$
DECLARE produit integer;
BEGIN
-- On empêche que ce soit supprimé, à la place on change la valeur de la situation vers ''Supprimé''

UPDATE m_reseau_sec.an_ecl_foyer
SET
situation = '12' -------------------- Situation = '12' équivaut à ''supprimé'' dans la liste de domaine lt_ecl_situation
WHERE OLD.id_foyer=id_foyer;--------- On utilise OLD puisque c'est un trigger DELETE
RETURN NEW;

-- partie supprimé car puissance mis en charactère mais à gérer plus tard (cf ticket redmine)
/*
UPDATE m_reseau_sec.an_ecl_depart---- On UPDATE le départ avec les foyers actifs restant.
			SET 
				puis_sous = 	(SELECT SUM ((lt_ecl_puissance_lampe.valeur::integer * (( SELECT count(*) AS count -------------Les puissances des lampes * le nbr de foyers...
													  FROM m_reseau_sec.an_ecl_foyer 
													  WHERE (an_ecl_foyer.id_mod_lm IN ----- Dont le modèle de lampe est ...
																	(SELECT an_ecl_modele_lampe.id_mod_lm 
																	 FROM m_reseau_sec.an_ecl_modele_lampe
																	 WHERE an_ecl_modele_lampe.puis_lam::text = lt_ecl_puissance_lampe.code::text)) ------ celui dont on a sélectionner la valeur au début.
																	       AND situation <> '12'
																	       AND (an_ecl_foyer.id_supp IN (SELECT geo_ecl_noeud.id_noeud ------------------- Encore en sélection sur le foyer : qui est lié à un noeud... 
																					     FROM m_reseau_sec.geo_ecl_noeud
																					     WHERE geo_ecl_noeud.depart = dep.id_depart AND situation <> '12' AND situation <> '11')))))) AS val --... qui est lui même lié au départ sur lequel on fait la recherche. 
						FROM m_reseau_sec.lt_ecl_puissance_lampe,m_reseau_sec.an_ecl_depart dep
						WHERE lt_ecl_puissance_lampe.code::text <> '00'::text AND lt_ecl_puissance_lampe.code::text <> 'ZZ'::text AND lt_ecl_puissance_lampe.code::text <> '99'::text -- Là où le modèle de lampe n'a pas une puissance nulle, non concerné ou Autre.
						      AND id_depart =(SELECT depart 
									   FROM m_reseau_sec.geo_ecl_noeud 
									   WHERE id_noeud =  NEW.id_supp
									  ))

			WHERE id_depart =    (SELECT depart 
								   FROM m_reseau_sec.geo_ecl_noeud 
								   WHERE id_noeud =  NEW.id_supp
								  );
*/

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


  CREATE TRIGGER t_t4_foyer_delete
  BEFORE DELETE
  ON m_reseau_sec.an_ecl_foyer
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_foyer_delete(); 

---
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

  v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass); 
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
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
  
  v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  CASE WHEN new.situation ='12' THEN 'DELETE' ELSE 'UPDATE'END,
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;
  

END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_sec.ft_m_log_ecl()
  OWNER TO postgres;


-- Trigger: t_t5_log_foyer on m_reseau_sec.an_ecl_foyer

-- DROP TRIGGER t_t5_log_foyer ON m_reseau_sec.an_ecl_foyer;

CREATE TRIGGER t_t5_log_foyer
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_foyer
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_log_ecl();



---
  
COMMENT ON TABLE m_reseau_sec.an_ecl_foyer IS 'Objet reposant sur un support, intégrant une source lumineuse';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_foyer IS 'Numéro du foyer interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_supp IS 'Identifiant du support sur lequel repose le foyer';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_mod_ln IS 'Lien vers la table modèle lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_mod_lm IS 'Lien vers table modèle lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.etat_foy IS 'Etat du foyer';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.haut_feu IS 'Hauteur max de la lanterne par rapport au niveau de la chaussée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.dat_pos_ln IS 'Date de la pose de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.dat_pos_lm IS 'Date de pose de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.pct_fct IS 'Puissance de la lampe en % de sa puissance maximale : uniquement pour les leds';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_ballast IS 'Type de ballast installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_amorce IS 'Type d''amorceur installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_auto_tr IS 'Type d''auto trasformateur installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.date_donne IS 'Horodatage de la production initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.situation IS 'Situation générale : Actif / Inactif / supprimé'; 
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.loc_plat IS 'Localisation de la platine, pieds de support ou dans la lanterne'; 
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_lantern IS 'Type de lanterne : piéton ou routier'; 

--################################################################## ERREURS  ########################################################

CREATE TABLE m_reseau_sec.an_ecl_erreur -------------------------------------------- Table récupérant les messages d'erreurs
	(
	id_erreur   integer DEFAULT nextval('m_reseau_sec.an_ecl_erreur_id_erreur_seq') NOT NULL,------- Numéro de l'erreur interne à l''ARC
	id_objet    integer,---------------------------------------------------------- Identifiant de l'objet sur lequel l'erreur a été saisie
	message     varchar (254), --------------------------------------------------- Message d'erreur destiné à l'utilisateur de l'application
	heure       timestamp without time zone -------------------------------------- Date de la saisie de l'erreur
	);
--- 
ALTER TABLE  m_reseau_sec.an_ecl_erreur
  ADD CONSTRAINT an_ecl_erreur_pkey PRIMARY KEY (id_erreur);
  
COMMENT ON TABLE m_reseau_sec.an_ecl_erreur IS 'Erreurs de saisies et messages d''erreur associés';
COMMENT ON COLUMN m_reseau_sec.an_ecl_erreur.id_erreur IS 'Numéro de l''erreur interne à l''ARC'; 
COMMENT ON COLUMN m_reseau_sec.an_ecl_erreur.id_objet IS 'Identifiant de l''objet sur lequel l''erreur a été saisie'; 
COMMENT ON COLUMN m_reseau_sec.an_ecl_erreur.message IS 'Message d''erreur destiné à l''utilisateur de l''application'; 
COMMENT ON COLUMN m_reseau_sec.an_ecl_erreur.heure IS 'Date de la saisie de l''erreur'; 

--################################################################## INTERVENTION ########################################################

CREATE TABLE m_reseau_sec.an_ecl_intervention --------------------------------------- Interventions et signalements du service métier
(
	id_inter 	integer NOT NULL DEFAULT nextval('m_reseau_sec.an_ecl_intervention_seq'),-- Numéro de l''intervention interne à l''ARC
	id_objet 	integer NOT NULL,-------------------------------------------- Identifiant de l''objet concerné par l''intervention
	type_si_in 	character varying(2) DEFAULT '10'::character varying,-------- Signalement ou intervention
	dat_signa 	timestamp without time zone DEFAULT now(),------------------- Date du signalement
	dat_progra 	timestamp without time zone,--------------------------------- Date de la programmation
	dat_real 	timestamp without time zone,--------------------------------- Date de la réalisation de l''intervention
	typ_def 	character varying(2) DEFAULT '00'::character varying,-------- Type de défaillance
	src_def 	character varying(2) DEFAULT '00'::character varying,-------- Source de la défaillance
	etat_sign 	character varying(2) DEFAULT '10'::character varying,-------- Etat du signalement
	moy_interv 	character varying(2) DEFAULT '00'::character varying,-------- Moyen d''intervention
	type_inter 	character varying(254) DEFAULT '00'::character varying,------ Type d''intervention
	att_met1 	character varying(2), --------------------------------------- Dédié au type de disjoncteur / type de ballast
	att_met2 	character varying(2), --------------------------------------- Dédié au type de fusible / type d'amorce
	att_met3 	character varying(2), --------------------------------------- Dédié au type de parasurtenseur / type de commande / type d'auto transformateur
	att_met4 	character varying(2), --------------------------------------- Dédié au modele de lanterne / type de disjoncteur du départ (ajout)
	att_met5 	character varying(10), -------------------------------------- Dédié au modèle de lampe / Type de fusible du départ (ajout)
	att_met6 	character varying(2), --------------------------------------- Dédié à l'état de l'objet ciblé par l'intervention 
	att_met7 	character varying(254), ------------------------------------- Dédié au nom du départ / aux options du support 
	att_met8 	integer, ---------------------------------------------------- Dédié à la tension / pourcentage de puissance de fonctionnement
	observ 		character varying(254),-------------------------------------- Commentaires divers
	date_sai    	timestamp without time zone NOT NULL DEFAULT NOW(),---------- Date de la saisie de la donnée dans la base
	date_maj    	timestamp without time zone,--------------------------------- Date de dernière mise à jour de la donnée
	op_sai 		character varying(80),--------------------------------------- Opérateur de la saisie initiale de la donnée
	id_noeud        integer NOT NULL--------------------------------------------- Identifiant du noeud sur lequel a lieu l'intervention (Pour foyer et départ, noeud = Support ou armoire)
        lib_inter character varying(2500), -- Libellé en clair des interventions pour affichage des résultats dans GEO
        id_contrat character varying(2), -- Identifiant du contrat de maintenance
 );


--
ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_pkey PRIMARY KEY (id_inter);
--
--- SUPPRESSION DES MESSAGES D'ERREUR
--- On force certains attributs
--- GESTION DES CONTRAINTES DE SAISIE 
--- On update la date maj si UPDATE.
--- Selon le(s) type(s) d'intervention(s) on update les valeurs de l'objet concerné.
-- Function: m_reseau_sec.ft_m_intervention()

-- DROP FUNCTION m_reseau_sec.ft_m_intervention();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_intervention()
  RETURNS trigger AS
$BODY$
BEGIN

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

IF (TG_OP = 'INSERT') THEN

	IF (NEW.type_si_in = '20') THEN --- Si lors de l'insertion c'est une intervention (sans passer par un signalement donc).
		new.dat_real = now(); ----- La date de réalisation de l'intervention est égale à la date actuelle.
		new.dat_signa = NULL;------ Et la date de signalement est nulle.
    new.etat_sign = '30'; ----- Et l'état de signalement passe à réglé 
	END IF;

	IF ( NEW.type_si_in = '10' AND NEW.etat_sign = '30') THEN ----------------------------------------------- Si un signalement (type_si_in code =10) est saisie en réglé (etat_sign code= 30) sans intervention pas possible donc ...

		NEW.etat_sign = '10';----------------------------------------------------------------- Et on remet l'état du signalement à soumis.
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_inter, 'Le signalement ne peut-être réglé que s''il y a eu une intervention', now() );--- On ajoute un message d'erreur qui apparaît dans GEO



	END IF;

        -- décryptage des interventions pour affichage dans GEO dans les rapports de signalements ou d'intervention
        NEW.lib_inter :=
(
CASE 
WHEN new.type_inter = '' or new.type_inter is null  THEN 'n.r'
WHEN length(new.type_inter) = 2 AND new.type_inter = '00' THEN 'n.r'
WHEN length(new.type_inter) = 2 AND new.type_inter <> '00' THEN (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE li.code = new.type_inter)
WHEN length(new.type_inter) = 5 THEN 
	CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2))
	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2))

         END
WHEN length(new.type_inter) = 8 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2))
         END
WHEN length(new.type_inter) = 11 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))
         END

WHEN length(new.type_inter) = 14 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))
         END

WHEN length(new.type_inter) = 17 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2))
         END

WHEN length(new.type_inter) = 20 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2))
         END

WHEN length(new.type_inter) = 23 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2))
         END

WHEN length(new.type_inter) = 26 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2))
         END

WHEN length(new.type_inter) = 29 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2))
         END

WHEN length(new.type_inter) = 32 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2))
         END

WHEN length(new.type_inter) = 35 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2))
         END

WHEN length(new.type_inter) = 38 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2))
         END

WHEN length(new.type_inter) = 41 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 40 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2))
         END
ELSE 'Nombre d''interventions trop important, faire une demande au service SIG'
END
);

	
END IF;

	---

IF (TG_OP = 'UPDATE') THEN

	IF ( NEW.type_si_in = '10' AND NEW.etat_sign = '30') THEN ----------------------------------------------- Si un signalement (type_si_in code =10) est modifié en réglé (etat_sign code= 30) sans intervention pas possible donc ...

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_inter, 'Le signalement ne peut-être réglé que s''il y a eu une intervention', now() );--- On ajoute un message d'erreur qui apparaît dans GEO
		
		NEW.etat_sign = OLD.etat_sign ; ----------------------------------------------------------------- Et on remet l'état du signalement comme il était avant.
		
	END IF;

	IF (NEW.type_si_in = '20' AND OLD.type_si_in = '10') THEN --- Si on passe d'un signalement à une intervention
		NEW.dat_real = now();-------------------------------- La date de réalisation de l'intervention est égale à la date actuelle. 
	END IF;

	IF (OLD.type_si_in= '10' AND NEW.type_si_in='20') THEN --- Si on passe d'un signalement à une intervention.
		new.etat_sign = '30'; ---------------------------- On passe l'état du signalement à 'Réglé' (code = 30)
	END IF;

	NEW.date_maj = now(); ---------- On attribue la date actuelle à la date de dernière mise à jour

	-- mise à jour du contrat
        NEW.id_contrat := id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion, m_reseau_sec.geo_ecl_noeud n WHERE ST_Contains(gestion.geom,n.geom) AND n.id_noeud = new.id_noeud ;
	 -- décryptage des interventions pour affichage dans GEO dans les rapports de signalements ou d'intervention
        NEW.lib_inter :=
(
CASE 
WHEN new.type_inter = '' or new.type_inter is null  THEN 'n.r'
WHEN length(new.type_inter) = 2 AND new.type_inter = '00' THEN 'n.r'
WHEN length(new.type_inter) = 2 AND new.type_inter <> '00' THEN (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE li.code = new.type_inter)
WHEN length(new.type_inter) = 5 THEN 
	CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2))
	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2))

         END
WHEN length(new.type_inter) = 8 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2))
         END
WHEN length(new.type_inter) = 11 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))
         END

WHEN length(new.type_inter) = 14 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2))
         END

WHEN length(new.type_inter) = 17 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2))
         END

WHEN length(new.type_inter) = 20 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2))
         END

WHEN length(new.type_inter) = 23 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2))
         END

WHEN length(new.type_inter) = 26 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2))
         END

WHEN length(new.type_inter) = 29 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2))
         END

WHEN length(new.type_inter) = 32 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2))
         END

WHEN length(new.type_inter) = 35 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2))
         END

WHEN length(new.type_inter) = 38 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2))
         END

WHEN length(new.type_inter) = 41 THEN
CASE 
          WHEN substring(new.type_inter from 1 for 2) = '00' THEN 
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 40 for 2))

	  WHEN substring(new.type_inter from 1 for 2) <> '00' THEN 
                (SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 1 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 4 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 7 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 10 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 13 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 16 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 19 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 22 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 25 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 28 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 31 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 34 for 2)) || '<br>' ||
		(SELECT li.valeur FROM m_reseau_sec.lt_ecl_type_intervention li WHERE code = substring(new.type_inter from 37 for 2))
         END
ELSE 'Nombre d''interventions trop important, faire une demande au service SIG'
END
);
END IF;

	---

	IF (NEW.dat_progra < NEW.dat_signa ) THEN -----------Si la date de progra est inférieur à la date de signalement, on surcorrige et on met un message d"erreur

		NEW.dat_progra=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_inter, 'La date de programmation ne peut pas être inférieure à la date de signalement', now() );

	END IF;

	---

	IF (NEW.dat_real < NEW.dat_signa) THEN -----------Si la date de real est inférieur à la date de signalement, on surcorrige et on met un message d"erreur

		NEW.dat_real=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_inter, 'La date de réalisation de l''intervention ne peut pas être inférieure à la date de signalement', now() );

	END IF;

	IF (NEW.type_si_in = '10') THEN
		NEW.type_inter = '00';
		NEW.dat_progra = NULL;
    NEW.dat_real  = NULL;
	END IF;


--- Les interventions peuvent porter sur plusieurs objets différents. 
--- Ainsi, les attributs métier d'intervention ,au nombre de 8, servent à plusieurs types d'intervention à la fois.
--- Voir doc pour plus de précision.




---------------------------------------OUVRAGE ELECTRIQUE----------------------------------------
IF (NEW.id_objet IN (SELECT id_ouvelec FROM m_reseau_sec.an_ecl_ouvrage_electrique)) THEN -------- Si c'est un ouvrage électrique

	IF (NEW.id_noeud IS NULL) THEN 

		new.id_noeud = NEW.id_objet; ----------------------------------------------------- On attribue à l'intervention un lien avec le noeud. (sert pour foyer et départ)

	END IF;

	---
	
	IF (NEW.type_inter LIKE '%10%' ) THEN ---------------------------------------------------- Si c'est un changement de disjoncteur (%% stockage de plusieurs valeurs possibles dans type_inter 10;11;....)

		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique ------------------------------------ On change l'attribut dans la table 
		SET 
		ty_disjonc=NEW.att_met1
		WHERE NEW.id_objet=id_ouvelec;

	END IF;

	---

	IF (NEW.type_inter LIKE '%11%') THEN ----------------------------------------------------- Si c'est un changement de fusible

		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique ------------------------------------ On change l'attribut dans la table 
		SET 
		ty_fusible=NEW.att_met2
		WHERE NEW.id_objet=id_ouvelec;

	END IF;

	---

	IF (NEW.type_inter LIKE '%20%') THEN ----------------------------------------------------- Si c'est un changement de type de commande
	
		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique ------------------------------------ On change l'attribut dans la table 
		SET 
		ty_comm=NEW.att_met3
		WHERE NEW.id_objet=id_ouvelec AND ty_ouvelec = '10';

	END IF;

	---

	IF (NEW.type_inter LIKE '%60%') THEN ----------------------------------------------------- Si c'est un ajout de départ

		INSERT INTO m_reseau_sec.an_ecl_depart 
			(id_ouvelec, nom_depart, tension, ty_disjonc, ty_fusible, etat_dep, op_sai)  --------------- On ajoute un départ 
		VALUES 
			(NEW.id_objet, NEW.att_met7, NEW.att_met8, NEW.att_met4, NEW.att_met5, '10', NEW.op_sai);

	END IF;

	---

	IF (NEW.type_inter LIKE '%81%') THEN ----------------------------------------------------- Si c'est une désactivation de l'objet

		UPDATE m_reseau_sec.geo_v_ecl_ouvrage_electrique ------------------------------------- On met l'attribut situation à 'Inactif' (code = 11) 
		SET 
		situation= '11'
		WHERE NEW.id_objet=id_ouvelec;
		
	END IF;

	---

	IF (NEW.type_inter LIKE '%82%') THEN ----------------------------------------------------- Si c'est une réactivation de l'objet

		UPDATE m_reseau_sec.geo_v_ecl_ouvrage_electrique ------------------------------------- On met l'attribut situation à 'Actif' (code = 10)
		SET 
		situation= '10'
		WHERE NEW.id_objet=id_ouvelec;

	END IF;

	---

	IF (NEW.type_inter LIKE '%80%') THEN ------------------------------------------------------ Si c'est une suppresion de l'objet

		DELETE FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique WHERE NEW.id_objet =id_ouvelec;-- On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')

	END IF;

	---

	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ------------------------------ Si l'état est renseigné on le change, sinon on garde l'ancien

		UPDATE m_reseau_sec.geo_v_ecl_ouvrage_electrique  
		SET 
		etat_ouvel=NEW.att_met6
		WHERE NEW.id_objet=id_ouvelec;

	END IF;
	
END IF;

---------------------------------------DEPART----------------------------------------

IF (NEW.id_objet IN (SELECT id_depart FROM m_reseau_sec.an_ecl_depart)) THEN --------------------- Si c'est un départ


	IF (NEW.id_noeud IS NULL) THEN

		new.id_noeud = (SELECT id_ouvelec 
				FROM m_reseau_sec.an_ecl_depart 
				WHERE id_depart=NEW.id_objet) ; ---------------------------------- On attribue à l'intervention un lien avec le noeud auquel es rattaché le départ

	END IF;

	---

	IF (NEW.att_met7 IS NOT NULL AND NEW.att_met7 <> '') THEN -------------------------------- Cet attribut correspond au signalement réglé lors de l'intervention sur le départ, le signalement ayant ou avoir lieu sur l'armoire entière.
	
		UPDATE m_reseau_sec.an_ecl_intervention ------------------------------------------ on indique que le signalement sélectionné est réglé.
		SET 
		etat_sign = '60'------------------------------------------------------------------ code = 60 --> ''Réglé par intervention sur foyer/départ''
		WHERE id_inter = NEW.att_met7::integer;

	END IF;

	---

	IF (NEW.type_inter LIKE '%10%') THEN ----------------------------------------------------- Si c'est un changement de disjoncteur

		UPDATE m_reseau_sec.an_ecl_depart ------------------------------------------------ On change l'attribut dans la table 
		SET 
		ty_disjonc=NEW.att_met1
		WHERE NEW.id_objet=id_depart;

	END IF;

	---

	IF (NEW.type_inter LIKE '%11%') THEN----------------------------------------------------- Si c'est un changement de fusible

		UPDATE m_reseau_sec.an_ecl_depart------------------------------------------------ On change l'attribut dans la table 
		SET 
		ty_fusible=NEW.att_met2
		WHERE NEW.id_objet=id_depart;

	END IF;

	---

	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ----------------------------- Si l'état est renseigné on le change, sinon on garde l'ancien

		UPDATE m_reseau_sec.an_ecl_depart 
		SET 
		etat_dep=NEW.att_met6

		WHERE NEW.id_objet=id_depart;
	END IF;

	---

	IF (NEW.type_inter LIKE '%80%') THEN----------------------------------------------------- Si c'est une suppression de l'objet


		DELETE FROM m_reseau_sec.an_ecl_depart WHERE NEW.id_objet =id_depart; -- On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')

	END IF;

	
END IF;

---------------------------------------POINT D'INTERET----------------------------------------

IF (NEW.id_objet IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi)) THEN ---------------------------- Si c'est un PI

	IF (NEW.id_noeud IS NULL) THEN
		NEW.id_noeud = NEW.id_objet;
	END IF;


	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ----------------------------- Si l'état est renseigné on le change, sinon on garde l'ancien
		UPDATE m_reseau_sec.an_ecl_pi 
		SET 
		etat_pi=NEW.att_met6
		WHERE NEW.id_objet=id_pi;
	END IF;

	IF (NEW.type_inter LIKE '%81%') THEN ---------------------------------------------------- Si c'est une désactivation de l'objet
		UPDATE m_reseau_sec.geo_ecl_noeud ----------------------------------------------- On met l'attribut situation à 'Inactif' (code = 11)
		SET 
		situation= '11'
		WHERE NEW.id_objet=id_noeud;
	END IF;

	IF (NEW.type_inter LIKE '%82%') THEN ---------------------------------------------------- Si c'est une réactivation de l'objet
		UPDATE m_reseau_sec.geo_ecl_noeud ----------------------------------------------- On met l'attribut situation à 'Actif' (code = 10)
		SET 
		situation= '11'
		WHERE NEW.id_objet=id_noeud;
	END IF;
	
	IF (NEW.type_inter LIKE '%80%') THEN ---------------------------------------------------- Si c'est une suppression de l'objet
		DELETE FROM m_reseau_sec.geo_v_ecl_pi WHERE NEW.id_objet =id_pi; --------------------On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')
	END IF;

	
END IF;
---------------------------------------FOYER----------------------------------------

IF (NEW.id_objet IN (SELECT id_foyer FROM m_reseau_sec.an_ecl_foyer)) THEN ---------------------- Si c'est un foyer

	
	IF (NEW.id_noeud IS NULL) THEN
	
		NEW.id_noeud = (SELECT id_supp FROM m_reseau_sec.an_ecl_foyer foy WHERE id_foyer = NEW.id_objet);

	END IF;

	---

	IF (NEW.type_inter LIKE '%12%' AND NEW.att_met7 <> '2') THEN ---------------------------- Si c'est un changement de lanterne

		UPDATE m_reseau_sec.an_ecl_foyer------------------------------------------------- On change l'attribut dans la table 
		SET 
		id_mod_ln=NEW.att_met7::integer
		WHERE NEW.id_objet=id_foyer;

	END IF;

	---

	IF (NEW.type_inter LIKE '%13%' AND NEW.att_met8 <> 2 ) THEN ----------------------------- Si c'est un changement de lampe

		UPDATE m_reseau_sec.an_ecl_foyer------------------------------------------------- On change l'attribut dans la table 
		SET 
		id_mod_lm=NEW.att_met8
		WHERE NEW.id_objet=id_foyer;

	END IF;

	---

	IF (NEW.type_inter LIKE '%15%') THEN ----------------------------------------------------- Si c'est un changement de ballast

		UPDATE m_reseau_sec.an_ecl_foyer-------------------------------------------------- On change l'attribut dans la table 
		SET 
		ty_ballast=NEW.att_met1
		WHERE NEW.id_objet=id_foyer;

	END IF;

	---

	IF (NEW.type_inter LIKE '%16%') THEN ----------------------------------------------------- Si c'est un changement d'amorce

		UPDATE m_reseau_sec.an_ecl_foyer-------------------------------------------------- On change l'attribut dans la table 
		SET 
		ty_amorce=NEW.att_met2
		WHERE NEW.id_objet=id_foyer;

	END IF;	

	---

	IF (NEW.type_inter LIKE '%17%') THEN ----------------------------------------------------- Si c'est un changement d'auto-transformateur

		UPDATE m_reseau_sec.an_ecl_foyer ------------------------------------------------- On change l'attribut dans la table 
		SET 
		ty_auto_tr=NEW.att_met3
		WHERE NEW.id_objet=id_foyer;

	END IF;		

	---

	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ---------------------------------------------- Si l'état est renseigné on le change, sinon on garde l'ancien

		UPDATE m_reseau_sec.an_ecl_foyer  
		SET 
		etat_foy=NEW.att_met6
		WHERE NEW.id_objet=id_foyer;

	END IF;

	---

	IF (NEW.type_inter LIKE '%80%') THEN ----------------------------------------------------- Si c'est une suppression de l'objet
		
		DELETE FROM m_reseau_sec.an_ecl_foyer WHERE NEW.id_objet =id_foyer;----------------- On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')

	END IF;

	---

	IF (NEW.att_met5 IS NOT NULL AND NEW.att_met5 <> '') THEN -------------------------------- Cet attribut correspond au signalement réglé lors de l'intervention sur le départ, le signalement ayant ou avoir lieu sur l'armoire entière.
		
		UPDATE m_reseau_sec.an_ecl_intervention ------------------------------------------ on indique que le signalement sélectionné est réglé.
		SET 
		etat_sign = '60' ----------------------------------------------------------------- code = 60 --> ''Réglé par intervention sur foyer/départ''
		WHERE id_inter = NEW.att_met5::integer;

	END IF; 
	
END IF;

---------------------------------------POINT LUMINEUX----------------------------------------

IF (NEW.id_objet IN (SELECT id_supp FROM m_reseau_sec.an_ecl_support)) THEN ---------------------- Si c'est un point lumineux

	IF (NEW.id_noeud IS NULL) THEN
	
		NEW.id_noeud = NEW.id_objet;

	END IF;

	---

	IF (NEW.type_inter LIKE '%10%') THEN ----------------------------------------------------- Si c'est un changement de disjoncteur
	
		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On change l'attribut dans la table 
		SET 
		ty_disjonc=NEW.att_met1
		WHERE NEW.id_objet=id_supp;
		
	END IF;

	---

	IF (NEW.type_inter LIKE '%11%') THEN ----------------------------------------------------- Si c'est un changement de fusible
	
		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On change l'attribut dans la table 
		SET 
		ty_fusible=NEW.att_met2
		WHERE NEW.id_objet=id_supp;
		
	END IF;

	---

	IF (NEW.type_inter LIKE '%18%') THEN ----------------------------------------------------- Si c'est un ajout d'option
	
		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On change l'attribut dans la table 
		SET 
		opt_supp=CONCAT (opt_supp, ';',NEW.att_met7)
		WHERE NEW.id_objet=id_supp AND ty_supp = '10';

	END IF;	

	---

	IF (NEW.type_inter LIKE '%19%') THEN ----------------------------------------------------- Si c'est un changement de parasurtenseur

		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On change l'attribut dans la table 
		SET 
		ty_parasu=NEW.att_met3
		WHERE NEW.id_objet=id_supp;

	END IF;	

	---

	IF (NEW.type_inter LIKE '%90%') THEN ----------------------------------------------------- Suppression d'une option

		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On change l'attribut dans la table 
		SET 
		opt_supp=REPLACE(opt_supp, NEW.att_met7, '')
		WHERE NEW.id_objet=id_supp;

	END IF;	

	---

	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ------------------------------ Si l'état est renseigné on le change, sinon on garde l'ancien

		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux 
		SET 
		etat_supp = NEW.att_met6
		WHERE NEW.id_objet=id_supp;

	END IF;

	---

	IF (NEW.type_inter LIKE '%83%') THEN------------------------------------------------------ Si c'est un changement de mât + de foyer pour remettre identique (cas des accidents)
	
		UPDATE m_reseau_sec.an_ecl_foyer ----------------------------------------- On met l'attribut situation à 'Inactif' (code = 11)
		SET 
		etat_foy= '10',
		dat_pos_ln = now(),
		dat_pos_lm = now()
		WHERE NEW.id_objet=id_supp;

		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux -----------------------------------------  on change l'état du support pour un neuf
		SET 
		etat_supp= '10'
		WHERE NEW.id_objet=id_supp;

	END IF;

	---

	IF (NEW.type_inter LIKE '%81%') THEN------------------------------------------------------ Si c'est une désactivation de l'objet
	
		UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ----------------------------------------- On met l'attribut situation à 'Inactif' (code = 11)
		SET 
		situation= '11'
		WHERE NEW.id_objet=id_supp;

	END IF;


	---

	IF (NEW.type_inter LIKE '%82%') THEN ----------------------------------------------------- Si c'est une réactivation de l'objet
	
	UPDATE m_reseau_sec.geo_v_ecl_point_lumineux ------------------------------------------------- On met l'attribut situation à 'Actif' (code = 10) 
		SET 
		situation= '10'
		WHERE NEW.id_objet=id_supp;

	END IF;


	---

	IF (NEW.type_inter LIKE '%80%') THEN ----------------------------------------------------- Si c'est une suppression de l'objet

		DELETE FROM m_reseau_sec.geo_v_ecl_point_lumineux WHERE NEW.id_objet =id_supp; -------On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')

	END IF;

	
END IF;

---------------------------------------CABLE----------------------------------------

IF (NEW.id_objet IN (SELECT id_cab FROM m_reseau_sec.geo_ecl_cable)) THEN --------------------- Si c'est un PI

	IF (NEW.id_noeud IS NULL) THEN 
	
		IF ((SELECT id_nd_ini FROM m_reseau_sec.geo_ecl_cable WHERE id_cab = NEW.id_objet)IS NOT NULL) THEN
			new.id_noeud = (SELECT id_nd_ini FROM m_reseau_sec.geo_ecl_cable WHERE id_cab = NEW.id_objet); ----------------------------------------------------- On attribue à l'intervention un lien avec le noeud. (sert pour foyer et départ)

		ELSIF ((SELECT id_nd_fin FROM m_reseau_sec.geo_ecl_cable WHERE id_cab = NEW.id_objet) IS NOT NULL) THEN
			new.id_noeud = (SELECT id_nd_fin FROM m_reseau_sec.geo_ecl_cable WHERE id_cab = NEW.id_objet);

		END IF;
			
	END IF;



	IF (NEW.att_met6 IS NOT NULL AND NEW.att_met6 != '00') THEN ---------------------------------------------- Si l'état est renseigné on le change, sinon on garde l'ancien

		UPDATE m_reseau_sec.geo_ecl_cable 
		SET 
		etat_cable=NEW.att_met6
		WHERE NEW.id_objet=id_cab;

	END IF;

	---

	IF (NEW.type_inter LIKE '%81%') THEN----------------------------------------------------- Si c'est une désactivation de l'objet
	
	UPDATE m_reseau_sec.geo_ecl_cable ------------------------------------------------------- On met l'attribut situation à 'Inactif' (code = 11)
		SET 
		situation= '11'
		WHERE NEW.id_objet=id_cab;

	END IF;

	---

	IF (NEW.type_inter LIKE '%82%') THEN ----------------------------------------------------- Si c'est une réactivation de l'objet
	
	UPDATE m_reseau_sec.geo_ecl_cable -------------------------------------------------------- On met l'attribut situation à 'Actif' (code = 10)
		SET 
		situation= '10'
		WHERE NEW.id_objet=id_cab;

	END IF;

	---
	
	IF (NEW.type_inter LIKE '%80%') THEN ----------------------------------------------------- Si c'est une suppression de l'objet
		DELETE FROM m_reseau_sec.geo_ecl_cable WHERE NEW.id_objet =id_cab;---------------- On lance la suppression, qui changera en fait situation en 'Supprimé (code='12')
	END IF;
	
END IF;


RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_sec.ft_m_intervention()
  OWNER TO sig_create;



  CREATE TRIGGER t_t1_intervention
  BEFORE UPDATE OR INSERT
  ON m_reseau_sec.an_ecl_intervention
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_intervention(); 


--  contrat après l'insertion

-- Function: m_reseau_sec.ft_m_intervention_contrat()

-- DROP FUNCTION m_reseau_sec.ft_m_intervention_contrat();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_intervention_contrat()
  RETURNS trigger AS
$BODY$
BEGIN

        UPDATE m_reseau_sec.an_ecl_intervention  SET id_contrat = id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion, m_reseau_sec.geo_ecl_noeud n WHERE ST_Contains(gestion.geom,n.geom) AND n.id_noeud = an_ecl_intervention.id_noeud AND an_ecl_intervention.id_contrat IS NULL;

RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_reseau_sec.ft_m_intervention_contrat()
  OWNER TO sig_create;
  
  -- Trigger: t_t2_log_intervention_contrat on m_reseau_sec.an_ecl_intervention

-- DROP TRIGGER t_t2_log_intervention_contrat ON m_reseau_sec.an_ecl_intervention;

CREATE TRIGGER t_t2_log_intervention_contrat
  AFTER INSERT
  ON m_reseau_sec.an_ecl_intervention
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_intervention_contrat();


--- log

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_log_inter_ecl()
  RETURNS trigger AS
$BODY$
DECLARE v_idlog integer;
DECLARE v_dataold character varying(1000);
DECLARE v_datanew character varying(1000);
DECLARE v_name_table character varying(254);
BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass); 
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
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
  
  v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
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
 v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);

---
 
  INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
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

CREATE TRIGGER t_t3_log_intervention
  AFTER INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.an_ecl_intervention
  FOR EACH ROW
EXECUTE PROCEDURE m_reseau_sec.ft_m_log_inter_ecl();

--
COMMENT ON TABLE m_reseau_sec.an_ecl_intervention IS 'Interventions et signalements du service métier ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.id_inter IS 'Numéro de l''intervention interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.id_objet IS 'Identifiant de l''objet concerné par l''intervention';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.type_si_in IS 'Signalement ou intervention';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.dat_signa IS 'Date du signalement';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.dat_progra IS 'Date de la programmation';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.dat_real IS 'Date de la réalisation de l''intervention';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.typ_def IS 'Type de défaillance';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.src_def IS 'Source de la défaillance';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.etat_sign IS 'Etat du signalement';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.moy_interv IS 'Moyen d''intervention';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.type_inter IS 'Type d''intervention';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met1 IS 'Attribut métier dédié au type de disjoncteur / type de ballast';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met2 IS 'Attribut métier Dédié au type de fusible / type d''amorce';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met3 IS 'Attribut métier Dédié au type de parasurtenseur / type de commande / type d''auto transformateur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met4 IS 'Attribut métier Dédié à la mise en terre / modele de lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met5 IS 'Attribut métier Dédié au modèle de lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met6 IS 'Attribut métier Dédié à l''état de l''objet ciblé par l''intervention ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met7 IS 'Attribut métier Dédié au nom du départ / aux options du support ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.att_met8 IS 'Attribut métier Dédié à la tension / pourcentage de puissance de fonctionnement';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.op_sai IS 'Opérateur de la saisie initiale de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.id_noeud IS 'Identifiant du noeud sur lequel a lieu l''intervention (Pour foyer et départ, noeud = Support ou armoire)';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.lib_inter IS 'Libellé en clair des interventions pour affichage des résultats dans GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_intervention.id_contrat IS 'Identifiant du contrat de maintenance';



 --################################################################## MEDIA OBJET########################################################
 
-- Table servant à stocker les images et documents, en lien avec l'applicatif GEO. Le nom est simplement an_ecl_media car initialement il n'y en avait qu'une.
CREATE TABLE m_reseau_sec.an_ecl_media------------------------------------------------ Table de gestion des photos et documents dans GEO
(
	  gid serial 	NOT NULL, ---------------------------------------------------- Valeur par défaut ta séquence spécifique à cette table (nextval('[schéma].an_ecl_media_gid_seq'::regclass);)
	  id 		integer, ----------------------------------------------------- Identifiant de cession
	  media 	text, -------------------------------------------------------- Champ Média de GEO
	  miniature 	bytea, ------------------------------------------------------- Champ miniature de GEO
	  n_fichier 	text, -------------------------------------------------------- Nom du fichier
	  t_fichier 	text --------------------------------------------------------- Type de média dans GEO
	  op_sai 	text,--------------------------------------------------------- opérateur de la saisie initiale dans la base
	  date_sai 	timestamp without time zone ---------------------------------- Date de la saisie dans la base	  
);


ALTER TABLE  m_reseau_sec.an_ecl_media
  ADD CONSTRAINT an_ecl_media_pkey PRIMARY KEY (gid);

COMMENT ON TABLE m_reseau_sec.an_ecl_media_modele
  IS 'Table de gestion des photos et documents des modèles dans GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.gid IS 'Identifiant du modèle + lettre (dans GEO cle_media)';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.id IS 'Identifiant de l’objet lié';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.n_fichier IS 'Nom du fichier GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media.date_sai IS 'Date de saisie dans la base de donnée';

 --################################################################## MEDIA MODELE ########################################################
 
-- Table: m_reseau_sec.an_ecl_media_modele

-- DROP TABLE m_reseau_sec.an_ecl_media_modele;

CREATE TABLE m_reseau_sec.an_ecl_media_modele
(
  gid integer NOT NULL DEFAULT nextval('m_reseau_sec.an_ecl_media_modeles_gid_seq'::regclass), -- Identifiant du modèle + lettre (dans GEO cle_media)
  id character varying(5), -- Identifiant de l’objet lié
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier GEO
  t_fichier text,
  op_sai text,
  date_sai timestamp without time zone
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_sec.an_ecl_media_modele
  OWNER TO sig_create;

COMMENT ON TABLE m_reseau_sec.an_ecl_media_modele
  IS 'Table de gestion des photos et documents des modèles dans GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media_modele.gid IS 'Identifiant du modèle + lettre (dans GEO cle_media)';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media_modele.id IS 'Identifiant de l’objet lié';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media_modele.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media_modele.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_reseau_sec.an_ecl_media_modele.n_fichier IS 'Nom du fichier GEO';

--################################################################## LOG ########################################################
 
 -- Table: m_reseau_sec.an_ecl_log

-- DROP TABLE m_reseau_sec.an_ecl_log;

CREATE TABLE m_reseau_sec.an_ecl_log
(
  idlog integer NOT NULL, -- Identifiant unique de d'opération
  tablename character varying(80) NOT NULL, -- Nom de la table concernée par l'opération sur l'entité
  type_ope text NOT NULL, -- Type l'opération sur l'entité
  dataold character varying(1000), -- Valeur ancienne avant l'opération sur l'entité
  datanew character varying(1000), -- Valeur nouvelle après l'opération sur l'entité
  date_maj timestamp without time zone, -- Horodatage de l'opération sur la base d'éclairage public
  CONSTRAINT an_ecl_log_pkey PRIMARY KEY (idlog)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_reseau_sec.an_ecl_log
  OWNER TO postgres;

COMMENT ON TABLE m_reseau_sec.an_ecl_log
  IS 'Table des opérations sur la base de données d''éclairage public';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.idlog IS 'Identifiant unique de d''opération';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.tablename IS 'Nom de la table concernée par l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.type_ope IS 'Type l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.dataold IS 'Valeur ancienne avant l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.datanew IS 'Valeur nouvelle après l''opération sur l''entité';
COMMENT ON COLUMN m_reseau_sec.an_ecl_log.date_maj IS 'Horodatage de l''opération sur la base d''éclairage public';




-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                        CONTRAINTES                                                      ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--##################################################### MODELE SUPPORT ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_materiaux_fkey FOREIGN KEY (mat_supp) 
     REFERENCES m_reseau_sec.lt_ecl_materiaux_supports (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_ik_supp_check CHECK (ik_supp <= 10 OR NULL::boolean);

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_ip_supp_check CHECK (ip_supp <= 69 OR NULL::boolean);

--############################################################ NOEUD ##################################################

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_date_pose_check CHECK (dat_pos <= now());  

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_date_donne_check CHECK (date_donne <= now());    

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_depart_fkey FOREIGN KEY (depart)
      REFERENCES m_reseau_sec.an_ecl_depart (id_depart) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET NULL; ------------------------------------------- Si le départ auquel est lié le noeud est supprimé, on met l'attribut à NULL

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_qualite_geolocalisation_XY_fkey FOREIGN KEY (qua_geo_XY)
      REFERENCES m_reseau_sec.lt_ecl_qualite_geolocalisation (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- 

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_qualite_geolocalisation_Z_fkey FOREIGN KEY (qua_geo_Z)
      REFERENCES m_reseau_sec.lt_ecl_qualite_geolocalisation (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- 

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_lt_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE; 

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_situation_fkey FOREIGN KEY (situation)
      REFERENCES m_reseau_sec.lt_ecl_situation (code) MATCH SIMPLE;  

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_qualite_date_fkey FOREIGN KEY (qua_dat)
      REFERENCES m_reseau_sec.lt_ecl_qualite_date (code) MATCH SIMPLE;  

--############################################################ SUPPORT ##################################################

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_haut_supp_check CHECK (haut_supp < 30::numeric); -------- Hauteur du support < 30 mètres (à définir avec service d'éclairage public)

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_noeud_fkey FOREIGN KEY (id_supp)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;----------------------------------------------- Si le noeud est supprimé on supprime le support en cascade

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_modele_fkey FOREIGN KEY (id_mod_sup) 
     REFERENCES m_reseau_sec.an_ecl_modele_support (id_mod_sup) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_lt_etat_supp_fkey FOREIGN KEY (etat_supp)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_ty_disjonc_fkey FOREIGN KEY (ty_disjonc)
      REFERENCES m_reseau_sec.lt_ecl_type_disjoncteur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_ty_fusible_fkey FOREIGN KEY (ty_fusible)
      REFERENCES m_reseau_sec.lt_ecl_type_fusible (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_ty_parasu_fkey FOREIGN KEY (ty_parasu)
      REFERENCES m_reseau_sec.lt_ecl_type_parasurtenseur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_ty_supp_fkey FOREIGN KEY (ty_supp)
      REFERENCES m_reseau_sec.lt_ecl_type_support (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_haut_trap_fkey FOREIGN KEY (haut_trap)
      REFERENCES m_reseau_sec.lt_ecl_hauteur_trappe (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'


--############################################################ MODELE LANTERNE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_ik_lant_check CHECK (ik_lant <= 10);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_ip_lant_check CHECK (ip_lant <= 69);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_classe_electrique_fkey FOREIGN KEY (clas_el_ln)
      REFERENCES m_reseau_sec.lt_ecl_classe_electrique (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'


--############################################################ MODELE LAMPE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_type_lampe_fkey FOREIGN KEY (ty_lampe)
      REFERENCES m_reseau_sec.lt_ecl_type_lampe (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné' 
      
ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_culot_lampe_fkey FOREIGN KEY (cul_lamp)
      REFERENCES m_reseau_sec.lt_ecl_culot_lampe (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_telegestion_fkey FOREIGN KEY (telgest)
      REFERENCES m_reseau_sec.lt_ecl_presence (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'  

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_couleur_eclairage_fkey FOREIGN KEY (cou_ecl)
      REFERENCES m_reseau_sec.lt_ecl_couleur_eclairage (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'  

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_puissance_lampe_fkey FOREIGN KEY (puis_lam)
      REFERENCES m_reseau_sec.lt_ecl_puissance_lampe (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'  

--############################################################ FOYER ##################################################

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_date_donne_check CHECK (date_donne <= now());   

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_pct_fct_check CHECK (pct_fct <= 100::numeric); --------- Pourcentage de la puissance maximale donc < 100 

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_id_supp_fkey FOREIGN KEY (id_supp)
      REFERENCES m_reseau_sec.an_ecl_support (id_supp) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;  ------------------------------------------- Si le support est supprimé, on supprime les foyers en cascade

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_modele_lanterne_fkey FOREIGN KEY (id_mod_ln)
      REFERENCES m_reseau_sec.an_ecl_modele_lanterne (id_mod_ln) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;  ------------------------------------------- Modèle par défaut ajouté automatiquement dans la table modèle

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_modele_lampe_fkey FOREIGN KEY (id_mod_lm)
      REFERENCES m_reseau_sec.an_ecl_modele_lampe (id_mod_lm) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;  ------------------------------------------- Modèle par défaut ajouté automatiquement dans la table modèle

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_etat_foyer_fkey FOREIGN KEY (etat_foy)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_type_ballast_fkey FOREIGN KEY (ty_ballast)
      REFERENCES m_reseau_sec.lt_ecl_type_ballast (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_type_armoce_fkey FOREIGN KEY (ty_amorce)
      REFERENCES m_reseau_sec.lt_ecl_type_amorceur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_type_auto_transformateur_fkey FOREIGN KEY (ty_auto_tr)
      REFERENCES m_reseau_sec.lt_ecl_type_auto_transformateur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_lt_ecl_situation_fkey FOREIGN KEY (situation)
      REFERENCES m_reseau_sec.lt_ecl_situation (code) MATCH SIMPLE;       

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_lt_ecl_type_lanterne_fkey FOREIGN KEY (ty_lantern)
      REFERENCES m_reseau_sec.lt_ecl_type_lanterne (code) MATCH SIMPLE;      

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_lt_ecl_emplacement_fkey FOREIGN KEY (loc_plat)
      REFERENCES m_reseau_sec.lt_ecl_emplacement (code) MATCH SIMPLE;      

--############################################################ OUVRAGE ELECTRIQUE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ik_ouvelec_check CHECK (ik_ouvelec <= 10);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ip_ouvelec_check CHECK (ip_ouvelec <= 69);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_val_terre_check CHECK (val_terre <= 1000);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_val_max_puis_mes_check CHECK (puis_mes < 10000);-- Puissance mesurée < ??? ( à défnir avec service technique)

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_noeud_fkey FOREIGN KEY (id_ouvelec)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; -------------------------------------------- Si noeud supprimé, on supprime l'ouvrage

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_etat_ouvel_fkey FOREIGN KEY (etat_ouvel)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_mod_pos_ou_fkey FOREIGN KEY (mod_pos_ou)
      REFERENCES m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_pres_var_fkey FOREIGN KEY (pres_var)
      REFERENCES m_reseau_sec.lt_ecl_presence (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'
      
ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ty_comm_fkey FOREIGN KEY (ty_comm)
      REFERENCES m_reseau_sec.lt_ecl_type_commande (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ty_disjonc_fkey FOREIGN KEY (ty_disjonc)
      REFERENCES m_reseau_sec.lt_ecl_type_disjoncteur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ty_fusible_fkey FOREIGN KEY (ty_fusible)
      REFERENCES m_reseau_sec.lt_ecl_type_fusible (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ty_ouvelec_fkey FOREIGN KEY (ty_ouvelec)
      REFERENCES m_reseau_sec.lt_ecl_type_ouvrage_electrique (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

--############################################################ DEPART ##################################################

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_date_donne_check CHECK (date_donne <= now());   

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_val_max_tension_check CHECK (tension <= 3200); --------- la tension électrique est au maximum de 3200 VOLT à Compiègne sur l'éclairage public
/*
ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_id_ouvelec_fkey FOREIGN KEY (id_ouvelec)
      REFERENCES m_reseau_sec.an_ecl_ouvrage_electrique (id_ouvelec) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; -------------------------------------------- Si l'ouvrage est supprimé, on supprime les départs
*/
ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_etat_dep_fkey FOREIGN KEY (etat_dep)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'
      
ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_ty_disjonc_fkey FOREIGN KEY (ty_disjonc)
      REFERENCES m_reseau_sec.lt_ecl_type_disjoncteur (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_ty_fusible_fkey FOREIGN KEY (ty_fusible)
      REFERENCES m_reseau_sec.lt_ecl_type_fusible (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_lt_ecl_situation_fkey FOREIGN KEY (situation)
      REFERENCES m_reseau_sec.lt_ecl_situation (code) MATCH SIMPLE;    

--############################################################ POINT D'INTERET ##################################################

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_pkey PRIMARY KEY(id_pi);

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_noeud_fkey FOREIGN KEY (id_pi)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; -------------------------------------------- Si noeud supprimé, on supprime le point d'intérêt

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_etat_pi_fkey FOREIGN KEY (etat_pi)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_ty_pi_fkey FOREIGN KEY (ty_pi)
      REFERENCES m_reseau_sec.lt_ecl_type_pi (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'


--############################################################ CABLE ##################################################

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_date_donne_check CHECK (date_donne <= now());    

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_date_pose_check CHECK (dat_pos_ca <= now());  

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_noeud_initial_fkey FOREIGN KEY (id_nd_ini)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL; ----------------------------------------- Si le noeud auquel le câble était lié est supprimé, on met l'attribut à NULL

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_noeud_final_fkey FOREIGN KEY (id_nd_fin)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL; ----------------------------------------- Si le noeud auquel le câble était lié est supprimé, on met l'attribut à NULL

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_etat_fkey FOREIGN KEY (etat_cable)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_situation_fkey FOREIGN KEY (situ_cab)
      REFERENCES m_reseau_sec.lt_ecl_situation_cable(code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_qualite_geolocalisation_XY_fkey FOREIGN KEY (qua_geo_XY)
      REFERENCES m_reseau_sec.lt_ecl_qualite_geolocalisation (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- 

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_noeud_lt_ecl_qualite_geolocalisation_Z_fkey FOREIGN KEY (qua_geo_Z)
      REFERENCES m_reseau_sec.lt_ecl_qualite_geolocalisation (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- 

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_noeud_lt_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE; ------------------------------------------- 

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_lt_ecl_situation_fkey FOREIGN KEY (situation)
      REFERENCES m_reseau_sec.lt_ecl_situation (code) MATCH SIMPLE;    

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_lt_ecl_qualite_date_fkey FOREIGN KEY (qua_dat)
      REFERENCES m_reseau_sec.lt_ecl_qualite_date (code) MATCH SIMPLE;  

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_lt_ecl_section_cable_fkey FOREIGN KEY (sect_cab)
      REFERENCES m_reseau_sec.lt_ecl_section_cable (code) MATCH SIMPLE;  

--############################################################ INTERVENTION ##################################################

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_source_defaillance_fkey FOREIGN KEY (src_def)
      REFERENCES m_reseau_sec.lt_ecl_source_defaillance (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_type_defaillance_fkey FOREIGN KEY (typ_def)
      REFERENCES m_reseau_sec.lt_ecl_type_defaillance (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_lt_ecl_etat_signalement_affichage_fkey FOREIGN KEY (etat_sign)
      REFERENCES m_reseau_sec.lt_ecl_etat_signalement_affichage (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;      

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_lt_ecl_moyen_intervention_fkey FOREIGN KEY (moy_interv)
      REFERENCES m_reseau_sec.lt_ecl_moyen_intervention (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; 

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_lt_ecl_etat_fkey FOREIGN KEY (att_met6)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; 


ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_dates_programation_signalement_check CHECK (dat_progra >= dat_signa);

ALTER TABLE  m_reseau_sec.an_ecl_intervention
  ADD CONSTRAINT an_ecl_intervention_dates_realisation_signalement_check CHECK (dat_real >= dat_signa);


