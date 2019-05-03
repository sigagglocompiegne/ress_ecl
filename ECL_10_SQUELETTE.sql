
/*ECL V1.0*/
/*Creation du squelette de la structure des données (tables, séquences, triggers,...) */
/*ECL_10_DEMO_squelette.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau */

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


--Changements depuis mise à jour dans GEO :
----      - + UNIQUE pour tous les noms de modèles

-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           DROP                                                          ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


-- CLASSES

DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_support CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_lanterne CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_modele_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_ouvrage_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_depart CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_pi CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.geo_ecl_noeud CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.geo_ecl_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_fourreau CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.an_ecl_foyer CASCADE;


-- DOMAINES DE VALEUR

DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_etat CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_etat_fixation CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_etat_signalement CASCADE;
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
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_type_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_emplacement CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_qualite_date CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_marque_fixation CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_marque_lanterne CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_materiaux_supports CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_situation_cable CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_classe_electrique CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_culot_lampe CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_presence CASCADE;
DROP TABLE IF EXISTS m_reseau_sec.lt_ecl_couleur_eclairage CASCADE;


--SEQUENCE

DROP SEQUENCE m_reseau_sec.noeud_seq CASCADE;
DROP SEQUENCE m_reseau_sec.depart_seq;
DROP SEQUENCE m_reseau_sec.fourreau_seq;


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                        CLASSES OBJETS                                                   ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--############################################################ MODELE DE SUPPORT ##################################################

CREATE TABLE m_reseau_sec.an_ecl_modele_support ------------------------------------ Modèle des différents supports          
	(
	id_mod_sup  integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,----- Nom métier du modèle
	nom_mod_su  character varying (254) UNIQUE,---------------------------------------- Numéro du modèle de support, interne à l''ARC'
	mat_supp    character varying (2) NOT NULL DEFAULT '00',-------------------- Matériau du support
	cod_ral_s   character varying (20) ,---------------------------------------- Code RAL du support
	ik_supp     integer ,------------------------------------------------------- Indice de protection face aux influences extérieures
	ip_supp     integer ,------------------------------------------------------- Indice de protection aux chocs mécaniques
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone ------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	);
---
 
--############################################################ MODELE DE LANTERNE ##################################################


CREATE TABLE m_reseau_sec.an_ecl_modele_lanterne ----------------------------------- Modèles de lanternes existants ou ayant existés à Compiègne
	(
	id_mod_ln   integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,----- Numéro du modèle de lanterne interne à l''ARC
	nom_mod_ln  character varying (254) UNIQUE,---------------------------------------- Nom métier du modèle
	ty_lantern  character varying (2) NOT NULL DEFAULT '00',-------------------- Type de la lanterne
	gar_lant    smallint ,------------------------------------------------------ Durée de garantie de la lanterne, en années
	cod_ral_ln  character varying (20) ,---------------------------------------- Code RAL de la lanterne
	clas_el_ln  character varying (2) NOT NULL DEFAULT '00',-------------------- Classe électrique de la lanterne
	ik_lant     integer ,------------------------------------------------------- Indice de protection face aux influences extérieures
	ip_lant     integer ,------------------------------------------------------- Indice de protection aux chocs mécaniques
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone------------------------------------- Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	);
---

--############################################################ MODELE DE LAMPE ##################################################

CREATE TABLE m_reseau_sec.an_ecl_modele_lampe--------------------------------------- Modèles de lampe existants ou ayant existés à Compiègne
	(
	id_mod_lm   integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,----- Numéro du modèle de la lampe, interne à l''ARC
	nom_mod_lm  character varying (254) UNIQUE,---------------------------------------- Nom métier du modèle
	ty_lampe    character varying (2) NOT NULL DEFAULT '00',-------------------- Type de lampe
	puis_lam    smallint ,------------------------------------------------------ Puissance de la lampe
	cul_lamp    character varying(2) NOT NULL DEFAULT '00',--------------------- Culot de la lampe
	telgest     character varying (2) NOT NULL DEFAULT '00',------------------------------ Présence d''une télégestion
	cou_ecl     character varying (2) NOT NULL DEFAULT '00',-------------------- Couleur d''éclairage de la lampe
	gar_lamp    smallint ,------------------------------------------------------ Garantie de la lampe en années
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(),------------- Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone------------------------------------- Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	);
---

--################################################################ FOURREAU #####################################################

CREATE TABLE m_reseau_sec.an_ecl_fourreau------------------------------------------- Objet linéaire permettant de faire passer un ou plusieurs câble(s)
	(
	id_fourr    integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,------------- Numéro de fourreaut interne à l''ARC
	nom_fourr   character varying (254),---------------------------------------- Nom métier du fourreau
	dat_pos_fr  timestamp without time zone ,----------------------------------- Date de pose du fourreau
	place_libr  smallint ,------------------------------------------------------ Possibilité de rajouter un câble
	etat_four   character varying (2) NOT NULL DEFAULT '00',-------------------- Etat du fourreau
	observ      character varying(254) ,---------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(), ------------ Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone, ------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	op_sai      character varying(80) ------------------------------------------ Opérateur de la saisie de la donnée
	);
---

--################################################################# NOEUD #######################################################

CREATE TABLE m_reseau_sec.geo_ecl_noeud--------------------------------------- Objet ponctuel d''intérêt pour la connaissance patrimoniale du réseau
	(
	id_noeud    integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,------------- Numéro du noeud interne à l''ARC
	depart      integer,-------------------------------------------------------- Départ auquel est relié le noeud
	exploit_nd  character varying (254) ,--------------------------------------- Exploitant du nœud
	presta_nd   character varying (254) ,--------------------------------------- Prestataire des travaux sur le nœud
	commune     integer ,------------------------------------------------------- Commune sur laquelle est situé le nœud
	ent_pose    character varying (254),---------------------------------------- Entreprise ayant posé l''ouvrage électrique
	dat_pos     timestamp without time zone ,----------------------------------- Date de la pose
	qua_dat     character varying(2) NOT NULL DEFAULT '00',--------------------- Qualité de date de la pose
	src_geom    varchar(2) DEFAULT '00',---------------------------------------- Source du référentiel géographique pour le positionnement du nœud
	src_date    varchar(4) DEFAULT '0000',-------------------------------------- Année du millésime du référentiel géographique de saisie
	prec        varchar(3) ,---------------------------------------------------- Précision cartographique du noeud exprimée en cm
	ope_sai     varchar(254) ,-------------------------------------------------- Opérateur de la saisie de la donnée nœud
	geom        geometry(Point,2154)-------------------------------------------- Géométrie du noeud
	);
---

--################################################################# CABLE #######################################################

CREATE TABLE m_reseau_sec.geo_ecl_cable -------------------------------------- Objet linéaire allant d''un nœud à un autre. Transporte l''électricité lorsque le réseau est sous tension
	(
	id_cab      integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,----- Numéro du câble interne à l''ARC
	id_nd_ini   integer ,------------------------------------------------------- Lien vers l''identifiant du nœud initial du câble
	id_nd_fin   integer ,------------------------------------------------------- Lien vers l''identifiant du nœud final du câble
	fourreau    integer ,------------------------------------------------------- Identifiant du fourreau dans lequel passe le câble
	exploi_cab  character varying (254) ,--------------------------------------- Exploitant du câble
	presta_cab  character varying (254) ,--------------------------------------- Prestataire des travaux sur le câble
	etat_cable  character varying (2) NOT NULL DEFAULT '00',-------------------- Etat du câble
	situ_cab    character varying (2) NOT NULL DEFAULT '00',-------------------- Situation physique du câble
	dat_pos_ca  timestamp without time zone ,----------------------------------- Date de pose du câble
	sect_cab    character varying (10) ,---------------------------------------- Section du câble
	ent_pose    character varying (254) ,--------------------------------------- Entreprise ayant posé le cable
	insee1	    character varying(5), ------------------------------------------- Code insee de la commune
	commune1    integer ,------------------------------------------------------- Commune sur laquelle est située le câble
	insee2	    character varying(5), ------------------------------------------- Code insee de la commune
	commune2    integer ,------------------------------------------------------- Commune sur laquelle est située le câble
	src_geom    varchar(2) ,---------------------------------------------------- Source du référentiel géographique pour le positionnement du nœud
	src_date    varchar(4) ,---------------------------------------------------- Année du millésime du référentiel géographique de saisie
	prec        varchar(3) ,---------------------------------------------------- Précision cartographique moyenne du câble exprimée en cm
	observ     varchar(254),--------------------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT now(),------------- Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone, ------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	op_sai      character varying(80), ------------------------------------------ Opérateur de la saisie de la donnée
	geom        geometry(LineString,2154) -------------------------------------- Géométrie du câble
	);
---

--################################################################# SUPPORT #####################################################

CREATE TABLE m_reseau_sec.an_ecl_support ------------------------------------- Table des supports de foyer
	(
	id_supp     integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié au support
	id_mod_sup  integer NOT NULL DEFAULT '1',  --------------------------------- Lien vers table modèle support
	ty_supp     character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de support : mat, facade…etc.
	opt_supp    varchar (25),  ------------------------------------------------- Option(s) du support, sous forme de liste déroulante dans l''application
	entr_mass   smallint,  ----------------------------------------------------- Entraxe du massif : séparation entre les deux bords intérieur servant à caler le mât
	ty_parasu   character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de parasurtenseur
	etat_supp   character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du support
	haut_trap   integer ,  ----------------------------------------------------- Hauteur de la trappe de visite, en mètres, si elle existe
	etat_trappe character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat de la porte de la chambre de visite
	loc_sy_el   character varying (2) NOT NULL DEFAULT '00',  ------------------ Emplacement du parasurtenseur et fusible/disjoncteur
	loc_plat    character varying (2) NOT NULL DEFAULT '00',  ------------------ Emplacement de la platine
	ty_disjonc  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du disjoncteur
	ty_fusible  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du fusible
	marq_fixat  character varying(2) NOT NULL DEFAULT '00',  ------------------- Marque de la fixation
	etat_fixa   character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat de la fixation
	cod_ral_f   character varying(20),  ---------------------------------------- Code RAL de la fixation
	haut_supp   numeric ,  ----------------------------------------------------- Hauteur du support
	date_sai    timestamp without time zone NOT NULL DEFAULT now(), ------------ Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone ,----------------------------------- Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	observ      character varying(254)------------------------------------------ Commentaires divers
	);
---

--############################################################# POINT D'INTERET ##################################################

CREATE TABLE m_reseau_sec.an_ecl_pi ------------------------------------------------ Objet réel ou abstrait indiquant un point ayant une importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''EP.
	(
	id_pi       integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié au point d''interet
	ty_pi       character varying (2) NOT NULL DEFAULT '99',  ------------------ Type de point d''intérêt
	etat_pi     character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du point d''intérêt
	observ      character varying(254),----------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT now(), ------------ Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone ------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	);
---

--############################################################ OUVRAGE ELECTRIQUE ##################################################

CREATE TABLE m_reseau_sec.an_ecl_ouvrage_electrique -------------------------- Objet avec une arrivée d''électricité et un ou plusieurs départs
	(
	id_ouvelec  integer NOT NULL,  --------------------------------------------- Identifiant du nœud lié à l''ouvrage
	nom_ouv     character varying (254) UNIQUE, ------------------- Nom métier de l'ouvrage
	pdl_edf     character varying (4) ,  --------------------------------------- Numéro de référence EDF
	n_com_edf   character varying (10) ,  -------------------------------------- Numéro du compteur EDF
	ty_ouvelec  character varying (2)  DEFAULT '00',---------------------------- Type d''ouvrage électrique / coffret = sous-ouvrage électrique
	etat_ouvel  character varying (2)  DEFAULT '00',---------------------------- Etat de l''ouvrage électrique
	mod_pos_ou  character varying (2)  DEFAULT '00',  -------------------------- Mode de pose de l''ouvrage électrique
	mis_terre   character varying (2)  DEFAULT '00',  -------------------------- Présence d''une mise à la terre de l''ouvrage électrique
	val_terre   smallint ,  ---------------------------------------------------- Valeur globale de la terre
	ik_ouvelec  integer ,   ---------------------------------------------------- Indice de protection face aux influences extérieures
	ip_ouvelec  integer ,   ---------------------------------------------------- Indice de protection eux chocs mécaniques
	puis_mes    integer ,  ----------------------------------------------------- Puissance mesurée
	puis_sous   integer ,  ----------------------------------------------------- Puissance souscrite
	ty_comm     character varying (2)  DEFAULT '00',  -------------------------- Type de commande
	pres_var    character varying(2)  DEFAULT '00',  --------------------------- Présence d''un variateur
	ty_disjonc  character varying (2)  DEFAULT '00',  -------------------------- Type du disjoncteur
	ty_fusible  character varying (2)  DEFAULT '00',  -------------------------- Type du fusible
	date_sai    timestamp without time zone NOT NULL DEFAULT now(),------------- Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone ,----------------------------------- Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	observ      character varying(254)------------------------------------------ Commentaires divers
	);
---

--################################################################### DEPART #######################################################

CREATE TABLE m_reseau_sec.an_ecl_depart -------------------------------------- Objet intégré à une armoire et permettant le branchement d''un câble
	(
	id_depart   integer DEFAULT nextval('m_reseau_sec.depart_seq') NOT NULL,---- Numéro du depart interne à l''ARC
	id_ouvelec  integer NOT NULL,  --------------------------------------------- Lien vers table armoire
	nom_depart  character varying (254) UNIQUE,  ------------------------------- Nom du secteur déservi par le départ
	etat_dep    character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat du départ
	tension     integer ,  ----------------------------------------------------- Tension électrique en sortie
	ty_disjonc  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du disjoncteur
	ty_fusible  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type du fusible
	observ      character varying(254) ,  -------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(), ------------ Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone,------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	op_sai      character varying(80) ------------------------------------------ Opérateur de la saisie de la donnée
	);
---

--################################################################## FOYER  ########################################################

CREATE TABLE m_reseau_sec.an_ecl_foyer -------------------------------------- Objet reposant sur un support, intégrant une source lumineuse
	(
	id_foyer    integer DEFAULT nextval('m_reseau_sec.media_seq') NOT NULL,----- Numéro du foyer interne à l''ARC
	id_supp     integer NOT NULL,  --------------------------------------------- Identifiant du support sur lequel repose le foyer
	id_mod_ln   integer NOT NULL DEFAULT '1',  --------------------------------------------- Lien vers la table modèle lanterne
	id_mod_lm   integer NOT NULL DEFAULT '1',  --------------------------------------------- Lien vers table modèle lampe
	etat_lant   character varying (2) NOT NULL DEFAULT '00',  ------------------ Etat de la lanterne
	haut_feu    integer ,  ----------------------------------------------------- Hauteur max de la lanterne par rapport au niveau de la chaussée
	dat_pos_ln  timestamp without time zone ,  --------------------------------- Date de la pose de la lanterne
	pct_fct     numeric ,  ----------------------------------------------------- Puissance de la lampe en % de sa puissance maximale : uniquement pour les leds / Présent dans un logiciel mais non accessible au ST
	etat_lamp   character varying (2) NOT NULL DEFAULT '00', ------------------- Etat de la lampe
	dat_pos_lm  timestamp without time zone ,  --------------------------------- Date de pose de la lampe
	ty_ballast  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type de ballast installé
	ty_amorce   character varying (2) NOT NULL DEFAULT '00',  ------------------ Type d''amorceur installé
	ty_auto_tr  character varying (2) NOT NULL DEFAULT '00',  ------------------ Type d''auto trasformateur installé
	observ      character varying(254) ,  -------------------------------------- Commentaires divers
	date_sai    timestamp without time zone NOT NULL DEFAULT NOW(), ------------ Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	date_maj    timestamp without time zone,------------------------------------ Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine
	op_sai      character varying(80) ------------------------------------------ Opérateur de la saisie de la donnée
	);
---

-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           INSERTION                                                     ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--############################################################ MODELE DE SUPPORT ##################################################

INSERT INTO m_reseau_sec.an_ecl_modele_support --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
VALUES ('1','Modèle par défaut','00',NULL,00,00, NULL ,now(),NULL);

--############################################################ MODELE DE LANTERNE ##################################################

INSERT INTO m_reseau_sec.an_ecl_modele_lanterne --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
VALUES ('1','Modèle par défault','00','00',NULL,'00',00,00, NULL ,now(),NULL);

--############################################################ MODELE DE LAMPE ##################################################

INSERT INTO m_reseau_sec.an_ecl_modele_lampe --- MODELE PAR DEFAUT AFIN D'EVITER LES VALEUR NULL
VALUES ('1','Modèle par défault','00','0','00','00','00',NULL, NULL,now(),NULL);


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                    DOMAINES DE VALEURS                                                  ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--############################################################ TYPE CABLE ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_type_cable
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_type_cable_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_type_cable(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Aérien'),
	('11','Aérien nu'),
	('12','Aérien torsade EP'),
	('20','Souterrain'),
	('21','Souterrain blindé'),
	('22','Souterrain RO2'),
	('99','Autre');

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
	('10','Jaune'),
	('20','Blanc'),
	('99','Autre');

--############################################################ PRESENCE ##################################################


CREATE TABLE m_reseau_sec.lt_ecl_presence
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
	('30','G24d'),
	('99','Autre');

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
	('10','Puissance 1'),
	('20','Puissance 2'),
	('99','Autre'),
	('ZZ','Non concerné');

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
	('10','Puissance 1'),
	('20','Puissance 2'),
	('99','Autre'),
	('ZZ','Non concerné');

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
	('10','Puissance 1'),
	('20','Puissance 2'),
	('30','Driver'),
	('99','Autre'),
	('ZZ','Non concerné');

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

--############################################################ MARQUE FIXATION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_marque_fixation
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_marque_fixation_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_marque_fixation(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','ECLATEC'),
	('20','GHM'),
	('99','Autre'),
	('ZZ','Non concerné');


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
	('10','Trappe visite'),
	('20','Luminaire'),
	('ZZ','Non concerné');

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
	('10','Absent'),
	('20','type 1'),
	('99','Autre');

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
	('99','Autre');

--############################################################ DISJONCTEUR ##################################################

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
	('10','Absent'),
	('20','type 1'),
	('99','Autre');

--############################################################ FUSIBLE ##################################################

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
	('10','Absent'),
	('20','type 1'),
	('99','Autre');

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



--############################################################ ETAT ##################################################

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
	('40','A changer'),
	('ZZ','Non concerné');

--############################################################ ETAT FIXATION ##################################################

CREATE TABLE m_reseau_sec.lt_ecl_etat_fixation
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_ecl_etat_fixation_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO m_reseau_sec.lt_ecl_etat_fixation(code, valeur)
    VALUES
	('00','Non renseigné'),
	('10','Tournée'),
	('20','Arrachée'),
	('30','A changer'),
	('ZZ','Non concerné');



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
	('60','SAGEME GSM'),
	('99','Autre'),
	('ZZ','Non concerné');

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
	('99','Autre');

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
	('99','Autre');


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                        CONTRAINTES                                                      ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

-- Pour faire référence à une autre table, celle-ci doit avoir une clé primaire. On commence donc par donné une clé primaire à départ.
-- Ceci évite le problème du cercle de référence Ouvrage-->Noeud -->Depart
--						    ^                 |
--						    |_________________|
						    

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_pkey PRIMARY KEY(id_depart);


--############################################################ MODELE SUPPORT ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_pkey PRIMARY KEY(id_mod_sup);

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_materiaux_fkey FOREIGN KEY (mat_supp) 
     REFERENCES m_reseau_sec.lt_ecl_materiaux_supports (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'
      
ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_ik_supp_check CHECK (ik_supp < 10 OR NULL::boolean);

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  ADD CONSTRAINT an_ecl_modele_support_ip_supp_check CHECK (ip_supp < 69 OR NULL::boolean);

--############################################################ NOEUD ##################################################


ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_pkey PRIMARY KEY(id_noeud);

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_date_pose_check CHECK (dat_pos <= now());  

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  ADD CONSTRAINT geo_ecl_noeud_depart_fkey FOREIGN KEY (depart)
      REFERENCES m_reseau_sec.an_ecl_depart (id_depart) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET NULL; ------------------------------------------- Si le départ auquel est lié le noeud est supprimé, on met l'attribut à NULL



--############################################################ SUPPORT ##################################################
ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_pkey PRIMARY KEY(id_supp);

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_haut_supp_check CHECK (haut_supp < 30::numeric); -------- Hauteur du support < 30 mètres (à définir avec service d'éclairage public)

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_haut_trap_check CHECK (haut_trap < 30); ----------------- Hauteur de la trappe de visite < 30 mètres (à définir avec service d'éclairage public)

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_noeud_fkey FOREIGN KEY (id_supp)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;----------------------------------------------- Si le noeud est supprimé on supprime le support en cascade

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_modele_fkey FOREIGN KEY (id_mod_sup) 
     REFERENCES m_reseau_sec.an_ecl_modele_support (id_mod_sup) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT;

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_lt_etat_fixa_fkey FOREIGN KEY (etat_fixa)
      REFERENCES m_reseau_sec.lt_ecl_etat_fixation (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_lt_etat_supp_fkey FOREIGN KEY (etat_supp)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_etat_trappe_fkey FOREIGN KEY (etat_trappe)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'
ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_loc_plat_fkey FOREIGN KEY (loc_plat)
      REFERENCES m_reseau_sec.lt_ecl_emplacement (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_loc_sy_el_fkey FOREIGN KEY (loc_sy_el)
      REFERENCES m_reseau_sec.lt_ecl_emplacement (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_support
  ADD CONSTRAINT an_ecl_support_marq_fixat_fkey FOREIGN KEY (marq_fixat)
      REFERENCES m_reseau_sec.lt_ecl_marque_fixation (code) MATCH SIMPLE
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


--############################################################ MODELE LANTERNE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_pkey PRIMARY KEY(id_mod_ln);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_ik_lant_check CHECK (ik_lant < 10);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_ip_lant_check CHECK (ip_lant < 69);

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_type_lanterne_fkey FOREIGN KEY (ty_lantern)
      REFERENCES m_reseau_sec.lt_ecl_type_lanterne (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné' 

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  ADD CONSTRAINT an_ecl_modele_lanterne_classe_electrique_fkey FOREIGN KEY (clas_el_ln)
      REFERENCES m_reseau_sec.lt_ecl_classe_electrique (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'


--############################################################ MODELE LAMPE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_pkey PRIMARY KEY(id_mod_lm);

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  ADD CONSTRAINT an_ecl_modele_lampe_dates_check CHECK (date_maj >= date_sai);

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

--############################################################ FOYER ##################################################

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_pkey PRIMARY KEY(id_foyer);

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_foyer
  ADD CONSTRAINT an_ecl_foyer_haut_feu_check CHECK (haut_feu < 30); ------------------ Hauteur maximum du foyer = 30 mètres (à revoir avec service technique)

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
  ADD CONSTRAINT an_ecl_foyer_etat_lanterne_fkey FOREIGN KEY (etat_lant)
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


--############################################################ OUVRAGE ELECTRIQUE ##################################################

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_pkey PRIMARY KEY(id_ouvelec);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_puissances_check CHECK (puis_sous < puis_mes); -- Puissance souscrite < puissance mesurée

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ik_ouvelec_check CHECK (ik_ouvelec < 10);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_ip_ouvelec_check CHECK (ip_ouvelec < 69);

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_val_max_puis_mes_check CHECK (puis_mes < 1000);-- Puissance mesurée < ??? ( à défnir avec service technique)

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_noeud_fkey FOREIGN KEY (id_ouvelec)
      REFERENCES m_reseau_sec.geo_ecl_noeud (id_noeud) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; -------------------------------------------- Si noeud supprimé, on supprime l'ouvrage

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_etat_ouvel_fkey FOREIGN KEY (etat_ouvel)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  ADD CONSTRAINT an_ecl_ouvrage_electrique_mis_terre_fkey FOREIGN KEY (mis_terre)
      REFERENCES m_reseau_sec.lt_ecl_etat_mise_a_terre (code) MATCH SIMPLE
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
  ADD CONSTRAINT an_ecl_depart_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_val_max_tension_check CHECK (tension <= 3002); --------- la tension électrique est au maximum de 3002 VOLT à Compiègne sur l'éclairage public

ALTER TABLE m_reseau_sec.an_ecl_depart
  ADD CONSTRAINT an_ecl_depart_id_ouvelec_fkey FOREIGN KEY (id_ouvelec)
      REFERENCES m_reseau_sec.an_ecl_ouvrage_electrique (id_ouvelec) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE; -------------------------------------------- Si l'ouvrage est supprimé, on supprime les départs

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

--############################################################ POINT D'INTERET ##################################################

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_pkey PRIMARY KEY(id_pi);

ALTER TABLE m_reseau_sec.an_ecl_pi
  ADD CONSTRAINT an_ecl_pi_dates_check CHECK (date_maj >= date_sai);

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
  ADD CONSTRAINT geo_ecl_cable_pkey PRIMARY KEY(id_cab);

ALTER TABLE m_reseau_sec.geo_ecl_cable
  ADD CONSTRAINT geo_ecl_cable_dates_check CHECK (date_maj >= date_sai);

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


--############################################################ FOURREAU ##################################################

ALTER TABLE m_reseau_sec.an_ecl_fourreau
  ADD CONSTRAINT an_ecl_fourreau_pkey PRIMARY KEY(id_fourr);

ALTER TABLE m_reseau_sec.an_ecl_fourreau
  ADD CONSTRAINT an_ecl_fourreau_dates_check CHECK (date_maj >= date_sai);

ALTER TABLE m_reseau_sec.an_ecl_fourreau
  ADD CONSTRAINT an_ecl_fourreau_etat_four_fkey FOREIGN KEY (etat_four)
      REFERENCES m_reseau_sec.lt_ecl_etat (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE SET DEFAULT; ------------------------------------------- Correspond à 'non renseigné'

-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                         TRIGGER                                                         ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--############################################################ CABLE ##################################################


CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_cable()
  RETURNS trigger AS
$BODY$
BEGIN

----On ajout les identifiants des noeuds auquels est relié le câble automatiquement. 
----Un câble ne peut pas être relié à une armoire principale comme noeud final. 

new.id_nd_ini= (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud nd WHERE ST_equals(nd.geom,ST_StartPoint(NEW.geom)));
new.id_nd_fin= (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud nd WHERE ST_equals(nd.geom,ST_EndPoint(NEW.geom)));



RETURN NEW;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  CREATE TRIGGER t_t1_cable
  BEFORE INSERT OR UPDATE
  ON m_reseau_sec.geo_ecl_cable
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_cable(); 


 

  
-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                         SEQUENCE                                                        ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################
/*
--############################################################ MEDIA ##################################################


--Même séquence car GEO ne permet pas d'avoir plusieurs médias dans l'application, tout les objets avec des photos ne doivent donc pas avoir le même id. 
--Exception faîte des 3 modèles (lanterne, lampe, support) par défaut insérés à la création de la base (id =1 ). 

DROP SEQUENCE m_reseau_sec.media_seq;

CREATE SEQUENCE m_reseau_sec.media_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
ALTER TABLE m_reseau_sec.media_seq
  OWNER TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.media_seq TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.media_seq TO sig_temp; 


-------------------------------------------DEPART-----------------------------------------

CREATE SEQUENCE m_reseau_sec.depart_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
ALTER TABLE m_reseau_sec.depart_seq
  OWNER TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.depart_seq TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.depart_seq TO sig_temp; 

*/
-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                        COMMENTAIRES                                                     ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--############################################################ SUPPORT ##################################################

COMMENT ON TABLE m_reseau_sec.an_ecl_support IS 'Table des supports de foyer';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.id_supp IS 'Identifiant du nœud lié au support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.id_mod_sup IS 'Lien vers table modèle support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_supp IS 'Type de support : mat, facade…etc.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.opt_supp IS 'Option(s) du support, sous forme de liste déroulante dans l''application';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.entr_mass IS 'Entraxe du massif : séparation entre les deux bords intérieur servant à caler le mât';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_parasu IS 'Type de parasurtenseur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.etat_supp IS 'Etat du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.haut_trap IS 'Hauteur de la trappe de visite, en mètres, si elle existe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.etat_trappe IS 'Etat de la porte de la chambre de visite';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.loc_sy_el IS 'Emplacement du parasurtenseur et fusible/disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.loc_plat IS 'Emplacement de la platine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.marq_fixat IS 'Marque de la fixation';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.etat_fixa IS 'Etat de la fixation';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.cod_ral_f IS 'Code RAL de la fixation';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.haut_supp IS 'Hauteur du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_support.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';



--############################################################ MODELE SUPPORT ##################################################

COMMENT ON TABLE m_reseau_sec.an_ecl_modele_support IS 'Modèle des différents supports';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.nom_mod_su IS 'Nom métier du modèle';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.id_mod_sup IS 'Numéro du modèle de support, interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.mat_supp IS 'Matériau du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.cod_ral_s IS 'Code RAL du support';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.ik_supp IS 'indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.ip_supp IS 'Indice de protection aux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_support.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--############################################################ MODELE LANTERNE ##################################################

COMMENT ON TABLE m_reseau_sec.an_ecl_modele_lanterne IS 'Modèles de lanternes existants ou ayant existés à Compiègne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.id_mod_ln IS 'Numéro du modèle de lanterne interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.ty_lantern IS 'Type de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.nom_mod_ln IS 'Nom métier du modèle ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.gar_lant IS 'Durée de garantie de la lanterne, en années';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.cod_ral_ln IS 'Code RAL de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.clas_el_ln IS 'Classe électrique de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.ik_lant IS 'indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.ip_lant IS 'Indice de protection aux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lanterne.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################FOYER########################################

COMMENT ON TABLE m_reseau_sec.an_ecl_foyer IS 'Objet reposant sur un support, intégrant une source lumineuse';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_foyer IS 'Numéro du foyer interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_supp IS 'Identifiant du support sur lequel repose le foyer';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_mod_ln IS 'Lien vers la table modèle lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.id_mod_lm IS 'Lien vers table modèle lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.etat_lant IS 'Etat de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.haut_feu IS 'Hauteur max de la lanterne par rapport au niveau de la chaussée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.dat_pos_ln IS 'Date de la pose de la lanterne';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.etat_lamp IS 'Etat de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.dat_pos_lm IS 'Date de pose de la lampe';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.pct_fct IS 'Puissance de la lampe en % de sa puissance maximale : uniquement pour les leds';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_ballast IS 'Type de ballast installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_amorce IS 'Type d''amorceur installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.ty_auto_tr IS 'Type d''auto trasformateur installé';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_foyer.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################MODELE LAMPE########################################

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
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_modele_lampe.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################OUVRAGE ELECTRIQUE########################################

COMMENT ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique IS 'Objet avec une arrivée d''électricité et un ou plusieurs départs.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.id_ouvelec IS 'Identifiant du nœud lié à l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.nom_ouv IS 'Nom métier de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.pdl_edf IS 'Numéro de référence EDF';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.n_com_edf IS 'Numéro du compteur EDF';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_ouvelec IS 'Type d''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.etat_ouvel IS 'Etat de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.mod_pos_ou IS 'Mode de pose de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.mis_terre  IS 'Présence d''une mise à la terre de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.val_terre IS 'Valeur globale de la terre';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ik_ouvelec IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ip_ouvelec IS 'Indice de protection eux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.puis_mes IS 'Puissance mesurée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.puis_sous IS 'Puissance souscrite';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_comm IS 'Type de commande';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.pres_var IS 'Présence d''un variateur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_ouvrage_electrique.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################DEPART########################################

COMMENT ON TABLE m_reseau_sec.an_ecl_depart IS 'Objet intégré à une armoire et permettant le branchement d''un câble.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.id_depart IS 'Numéro du depart interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.id_ouvelec IS 'Lien vers table armoire';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.nom_depart IS 'Nom du secteur déservi par le départ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.etat_dep IS 'Etat du départ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.tension IS 'Tension électrique en sortie';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_depart.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################POINT D'INTERET########################################

COMMENT ON TABLE m_reseau_sec.an_ecl_pi IS 'Objet réel ou abstrait indiquant un point ayant une importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''EP.';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.id_pi IS 'Identifiant du nœud lié au point d''interet';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.ty_pi IS 'Type de point d''intérêt';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.etat_pi IS 'Etat du point d''intérêt ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_pi.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';


--######################################NOEUD########################################

COMMENT ON TABLE m_reseau_sec.geo_ecl_noeud IS 'Objet ponctuel d''intérêt pour la connaissance patrimoniale du réseau.';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.id_noeud IS 'Numéro du noeud interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.depart IS 'Depart auquel est relié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.exploit_nd IS 'Exploitant du nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.presta_nd IS 'Prestataire des travaux sur le nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.commune IS 'Commune sur laquelle est situé le nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.ent_pose IS 'Entreprise ayant posé l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.dat_pos IS 'Date de la pose';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.qua_dat IS 'Qualité de date de la pose';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.src_geom IS 'Source du référentiel géographique pour le positionnement du nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.src_date IS 'Année du millésime du référentiel géographique de saisie';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.prec IS 'Précision cartographique du noeud exprimée en cm';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.ope_sai IS 'Opérateur de la saisie de la donnée nœud';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_noeud.geom IS 'Géométrie du noeud';


--######################################CABLE########################################

COMMENT ON TABLE m_reseau_sec.geo_ecl_cable IS 'Objet linéaire allant d''un nœud à un autre. Transporte l''électricité lorsque le réseau est sous tension.';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_cab IS 'Numéro du câble interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_nd_ini IS 'Lien vers l''identifiant du nœud initial du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.id_nd_fin IS 'Lien vers l''identifiant du nœud final du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.fourreau IS 'Identifiant du fourreau dans lequel passe le câble';
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
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.prec IS 'Précision cartographique moyenne du câble exprimée en cm';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.geom IS 'Géométrie du câble';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_ecl_cable.op_sai IS 'Opérateur de la saisie de la donnée';

--######################################FOURREAU########################################

COMMENT ON TABLE m_reseau_sec.an_ecl_fourreau IS 'Objet linéaire permettant de faire passer un ou plusieurs câble(s). ';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.id_fourr IS 'Numéro de fourreaut interne à l''ARC';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.nom_fourr IS 'Nom métier du fourreau';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.dat_pos_fr IS 'Date de pose du fourreau';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.place_libr IS 'possibilité de rajouter un câble';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.etat_four IS 'Etat du fourreau';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.date_sai IS 'Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';
COMMENT ON COLUMN m_reseau_sec.an_ecl_fourreau.date_maj IS 'Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d''origine';

