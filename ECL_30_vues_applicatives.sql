 
/*ECL V1.0*/
/*Creation des vues et triggers nécessaires à l'application web-métier */
/*ECL_20_vues_applicatives.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau */

/*
SOMMAIRE :
 - DROP
 - VUES et COMMENTAIRES
 - TRIGGERS

*/




-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           DROP                                                          ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--VUES

DROP VIEW IF EXISTS m_reseau_sec.geo_v_ouvrage_electrique;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_point_lumineux;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_pi;

DROP MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;

DROP VIEW m_reseau_sec.geo_v_depart;

--TRIGGERS

DROP TRIGGER t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ouvrage_electrique;

DROP TRIGGER t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ouvrage_electrique;

DROP TRIGGER t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ouvrage_electrique;

-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                      VUES DE GESTION                                                      ###
-- ###                                                                                                                           ###
-- #################################################################################################################################


--##############################################################OUVELEC#############################################################

CREATE OR REPLACE VIEW m_reseau_sec.geo_v_ouvrage_electrique AS 
 SELECT 
	ouvelec.id_ouvelec,
	ouvelec.nom_ouv,
	ouvelec.ty_ouvelec,
	noeud.depart,
	ouvelec.etat_ouvel,
	ouvelec.mod_pos_ou,
	ouvelec.ty_comm,
	ouvelec.pdl_edf,
	ouvelec.n_com_edf,
	ouvelec.mis_terre,
	ouvelec.val_terre,
	ouvelec.ik_ouvelec,
	ouvelec.ip_ouvelec,
	ouvelec.puis_mes,
	ouvelec.puis_sous,
	ouvelec.pres_var,
	noeud.ent_pose,
	noeud.dat_pos,
	noeud.qua_dat,
	ouvelec.ty_disjonc,
	ouvelec.ty_fusible,
	ouvelec.observ,
        noeud.geom
 FROM m_reseau_sec.an_ecl_ouvrage_electrique ouvelec
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON ouvelec.id_ouvelec = noeud.id_noeud;

ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER etat_ouvel SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER ty_ouvelec SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER mod_pos_ou SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER mis_terre SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER ty_comm SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER pres_var SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER ty_disjonc SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER ty_fusible SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_ouvrage_electrique ALTER qua_dat SET DEFAULT '00';

COMMENT ON VIEW m_reseau_sec.geo_v_ouvrage_electrique IS 'Vue des ouvrages électriques permettant la saisie dans l''application Geo';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.id_ouvelec IS 'Identifiant de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.nom_ouv IS 'Nom métier de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ty_ouvelec IS 'Type de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.etat_ouvel IS 'Etat de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.mod_pos_ou IS 'Mode de pose de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ty_comm IS 'Type de commande d''allumage/extinction';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.pdl_edf IS 'Numéro de référence EDF';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.n_com_edf IS 'Numéro du compteur EDF';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.mis_terre IS 'Présence d''une mise à la terre de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.val_terre IS 'Valeur globale de la terre';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ik_ouvelec IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ip_ouvelec IS 'Indice de protection eux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.puis_mes IS 'Puissance mesurée';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.puis_sous IS 'Puissance souscrite';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.pres_var IS 'Présence d''un variateur';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.ent_pose IS 'Entreprise ayant posé l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.dat_pos IS 'Date de pose de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ouvrage_electrique.qua_dat IS 'Qualité de la date de pose de l''ouvrage';


--##############################################################POINT LUMINEUX######################################################

CREATE OR REPLACE VIEW m_reseau_sec.geo_v_point_lumineux AS 
 SELECT 
	supp.id_supp, 
	noeud.depart,
	supp.id_mod_sup, 
	supp.ty_supp ,
	supp.opt_supp ,
	supp.ty_parasu ,
	supp.etat_supp ,
	supp.haut_trap  ,
	supp.etat_trappe , 
	supp.loc_sy_el  ,
	supp.loc_plat  ,
	supp.ty_disjonc , 
	supp.ty_fusible  ,
	noeud.ent_pose ,
	noeud.dat_pos,
	noeud.qua_dat,
	supp.marq_fixat ,
	supp.etat_fixa  ,
	supp.cod_ral_f ,
	supp.haut_supp  ,
	supp.observ ,
	noeud.geom
 FROM m_reseau_sec.an_ecl_support supp
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON supp.id_supp = noeud.id_noeud;

--- '00' = "non renseigné" dans les domaines de valeurs
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_supp SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_parasu SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER etat_supp SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER etat_trappe SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER loc_sy_el SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER loc_plat SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_disjonc SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_fusible SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER marq_fixat SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER etat_fixa SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER qua_dat SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER id_mod_sup SET DEFAULT '1'; --- Modèle par défaut ajouté automatiquement dans la table modèle

COMMENT ON VIEW m_reseau_sec.geo_v_point_lumineux IS 'Vue des supports permettant la saisie dans l''application Geo';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.id_supp IS 'Identifiant du point lumineux';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.id_mod_sup IS 'Lien vers table modèle support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_supp IS 'Type de support : mat, facade…etc.';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.opt_supp IS 'Option(s) du support, sous forme de liste déroulante dans l''application';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_parasu IS 'Type de parasurtenseur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.etat_supp IS 'Etat du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.haut_trap IS 'Hauteur de la trappe de visite, en mètres, si elle existe';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.etat_trappe IS 'Etat de la porte de la chambre de visite';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.loc_sy_el IS 'Emplacement du parasurtenseur et fusible/disjoncteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.loc_plat IS 'Emplacement de la platine';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.marq_fixat IS 'Marque de la fixation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.etat_fixa IS 'Etat de la fixation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.cod_ral_f IS 'Code RAL de la fixation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.haut_supp IS 'Hauteur du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ent_pose IS 'Entreprise ayant posé le support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.dat_pos IS 'Date de pose du support ';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.qua_dat IS 'Qualité de la date de pose du support';




--############################################################## POINT - D'INTERET ################################################

CREATE OR REPLACE VIEW m_reseau_sec.geo_v_pi AS 
 SELECT 
	pi.id_pi,
	noeud.depart,
	pi.ty_pi,
	noeud.ent_pose,
	noeud.dat_pos,
	noeud.qua_dat,
	pi.etat_pi,
	pi.observ,
	noeud.geom
 FROM m_reseau_sec.an_ecl_pi pi
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON pi.id_pi = noeud.id_noeud;
     
--- '00' = "non renseigné" dans les domaines de valeurs
--- '99' = "Autre" dans les domaines de valeurs 
ALTER VIEW m_reseau_sec.geo_v_pi ALTER ty_pi SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER etat_pi SET DEFAULT '00';     
ALTER VIEW m_reseau_sec.geo_v_pi ALTER qua_dat SET DEFAULT '00';    

COMMENT ON VIEW m_reseau_sec.geo_v_pi IS 'Objet réel ou abstrait indiquant un point ayant une importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''EP.';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.id_pi IS 'Identifiant du nœud lié au point d''interet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.ty_pi IS 'Type de point d''intérêt';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.etat_pi IS 'Etat du point d''intérêt ';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.ent_pose IS 'Entreprise ayant posé le point d''interet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.dat_pos IS 'Date de pose du le point d''interet ';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.qua_dat IS 'Qualité de la date de pose du le point d''interet';



     
--############################################################## RECURSIVITE #####################################################

-- VUE MATERIALISEE RAFRAICHIE UNIQUEMENT LORS DES CHANGEMENTS DE L'ATTRIBUT DEPART DE LA CLASSE NOEUD
-- OU BIEN LORS DE LA SUPPRESSION D'UN DEPART
CREATE MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire AS 
	WITH RECURSIVE recursivite_noeud (id_noeud, depart,amont_cour, compteur) AS (  ---- C'est le nom de la table qui va stocker les informations lors de chaque boucle
	   SELECT id_noeud,
		  depart,
		  (SELECT nom_ouv ---------------------------------------------------- On sélectionne le nom de l'ouvrage
		   FROM m_reseau_sec.an_ecl_ouvrage_electrique ----------------------- 
		   WHERE ( (SELECT id_ouvelec ---------------------------------------- Qui correspond au départ auquel est relié le noeud initial
			    FROM m_reseau_sec.an_ecl_depart dep ----------------------
			    WHERE nd.depart= dep.id_depart)---------------------------
			  = id_ouvelec))::varchar (600)------------------------------- Varchar 600 défini en comptant maximum 20 transformateurs à la suite (à revoir)
		   AS amont_cour,----------------------------------------------------- Nom de l'attribut qui recense les ouvrages et départs en amont du courant --> le "chemin d'électricité"
		   1 AS compteur ----------------------------------------------------- Le compteur évite les boucles à l'infini en cas de problème de données, ce qui en théorie est impossible
	   FROM m_reseau_sec.geo_ecl_noeud nd
-------------------------------------------------------------------------------------- Jusqu'ici, on a défini la première table qui va servir de base pour la récursivité
	UNION ALL  ------------------------------------------------------------------- Enclenchement de la récursivité
	   SELECT rec.id_noeud,------------------------------------------------------- On garde à chaque boucle l'identifiant du noeud étudié 
		  nd.depart, --------------------------------------------------------- 1ère boucle : On sélectionne le départ auquel est lié l'ouvrage auquel est lié le noeud initial (et ainsi de suite à chaque boucle)
		  CONCAT (  
			     (SELECT nom_ouv ----------------------------------------- On sélectionne le nom de l'ouvrage
			     FROM  m_reseau_sec.an_ecl_ouvrage_electrique ------------
			     WHERE (SELECT id_ouvelec -------------------------------- Qui correspond au départ auquel est relié l'ouvrage auquel est relié le noeud initial (et ainsi de suite à chaque boucle)
				   FROM m_reseau_sec.an_ecl_depart -------------------
				   WHERE nd.depart=id_depart) ------------------------
				   = id_ouvelec),-------------------------------------
			     ' - ' ,
			     (SELECT SUBSTR(nom_depart,0,100) AS id_depart ----------- On sélectionne le nom du départ auquel est relié l'ouvrage auquel est relié le noeud initial (et ainsi de suite à chaque boucle)
			     FROM m_reseau_sec.an_ecl_depart dep --------------------- 
			     WHERE nd.depart=dep.id_depart) ,-------------------------
			     ' --> ',
			     amont_cour----------------------------------------------- On remet à chaque boucle tout le "chemin d'électricité" réalisé dans les boucles précédentes 
			)::varchar(600) AS amont_cour, ------------------------------- On stock le nouveau "chemin d'électricité". 
		  compteur +1 -------------------------------------------------------- On rajoute 1 au compteur à chaque boucle
	   FROM recursivite_noeud rec, m_reseau_sec.geo_ecl_noeud nd
	   WHERE nd.id_noeud=(SELECT id_ouvelec -------------------------------------- 1 ère boucle: on sélectionne le noeud auquel est relié le noeud initial 
			      FROM m_reseau_sec.an_ecl_depart ------------------------ 2 ème boucle: On sélectionne le noeud auquel est relié le noeud auquel est relié le noeud initial 
			      WHERE rec.depart=id_depart) ---------------------------- 3 ème boucle: etc... / Lé sélection se fait via l'attribut départ du noeud et les attributs id_ouvelec et id_depart de la table depart.
		 AND compteur+1 <21 -------------------------------------------------- La boucle peut faire 20 tours maximum, au-delà elle s'arrête. 
	)
	SELECT id_noeud, depart, amont_cour ------------------------------------------ On sélectionne ce qu'on veut voir apparaître dans la vue
	FROM recursivite_noeud rec ---------------------------------------------------
	WHERE (SELECT id_ouvelec ----------------------------------------------------- On ne prend que les lignes dont le dernier ouvrage est une armoire principale
	       FROM m_reseau_sec.an_ecl_depart dep ----------------------------------- Ceci permet d'avoir le chemin complet pour chaque noeud et une seule ligne par noeud,
	       WHERE rec.depart=dep.id_depart ) IN (SELECT id_ouvelec ---------------- puisqu'un noeud ne peut être relié qu'avec une seule armoire principale.
						    FROM m_reseau_sec.an_ecl_ouvrage_electrique 
						    WHERE ty_ouvelec='10'); 

ALTER MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire
OWNER TO sig_temp;

COMMENT ON MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire IS 'Vue matérialisée utilisant une requête récursive pour déterminer les ouvrages électriques en amont des noeuds';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.id_noeud IS 'Identifiant du nœud';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.depart IS 'depart de l''armoire principale auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.amont_cour IS 'Cheminement de l''électricité';

--############################################################## SELECTION DEPART PROCHES ####################################################

--- On créé une vue de buffer autour des départs, afin de limiter le nombre de départ dans la liste de valeur de Géo, selon la géospatialisation du noeud courant
CREATE VIEW m_reseau_sec.geo_v_depart AS 
SELECT  dep.id_depart,
	CONCAT (
		(SELECT nom_ouv ------------------------------------------------------ On concatène le nom de l'ouvrage auquel est lié le départ avec le nom du départ
		 FROM m_reseau_sec.an_ecl_ouvrage_electrique ouv --------------------- Ceci rend plus facile la sélection dans la liste de valeur
		 WHERE dep.id_ouvelec=ouv.id_ouvelec),'-' ,dep.nom_depart)  
	AS nom_depart,--------------------------------------------------------------- Nom de l'attribut concaténé
	ST_Buffer(nd.geom,200)::geometry(Polygon,2154) AS geom ---------------------- Réalisation du buffer de 200 mètres (à revoir) selon géométrie de l'ouvrage(noeud) auquel est lié le départ
FROM m_reseau_sec.an_ecl_depart dep
JOIN m_reseau_sec.geo_ecl_noeud nd ON nd.id_noeud = dep.id_ouvelec; 

ALTER VIEW m_reseau_sec.geo_v_depart
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.geo_v_depart IS 'Vue géospatialisée des départs selon géométrie de l''ouvrage rattaché - géométrie de buffer';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.id_depart IS 'Identifiant du départ';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.nom_depart IS 'Concaténation du nom de l''ouvrage du départ et du nom du départ';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.geom IS 'Géométrie ';



-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           TRIGGER                                                       ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################


--############################################################## OUVRAGE ELECTRIQUE ##################################################################


CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_ouvrage_electrique()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;
BEGIN

id_unique = nextval('m_reseau_sec.media_seq');

IF (TG_OP = 'INSERT') THEN --------------------------------------------------- Si c'est un INSERT

	IF (NEW.depart IS NOT NULL AND NEW.ty_ouvelec <> '10'  ) THEN------------------------- Si l'ouvrage n'est pas une armoire principale
		INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,ent_pose,dat_pos,qua_dat, geom, depart)
		SELECT
		id_unique,
		NEW.ent_pose,
		NEW.dat_pos,
		NEW.qua_dat,
		NEW.geom,
		NEW.depart;------------------------------------------------------------------- On insére toutes les données normalement dans noeud

		REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire; ------ Et on actualise la vue du "cheminement électricité"

	ELSE  -------------------------------------------------------------------------------- Si l'ouvrage EST une armoire  principale
		INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,ent_pose,dat_pos,qua_dat, geom, depart)
		SELECT
		id_unique,
		NEW.ent_pose,
		NEW.dat_pos,
		NEW.qua_dat,
		NEW.geom,
		NULL; ------------------------------------------------------------------ On empêche juste qu'il soit relié à un départ 

---------------------------------------------------------------------------------------- on actualise pas le vue du "cheminement électricité" puisque pas de nouveau liens
	END IF;
	---
	---
	IF (NEW.ty_ouvelec = '10' ) THEN ----------------------------------------------- Si l'ouvrage est une armoire
		INSERT INTO m_reseau_sec.an_ecl_ouvrage_electrique (
			id_ouvelec,
			nom_ouv,
			ty_ouvelec,
			etat_ouvel,
			mod_pos_ou, 
			ty_comm, 
			pdl_edf,
			n_com_edf,
			mis_terre,
			val_terre,
			ik_ouvelec,
			ip_ouvelec,
			puis_mes,
			puis_sous,
			pres_var,
			ty_disjonc,
			ty_fusible,
			observ,
			date_sai,
			date_maj)
		SELECT
			id_unique,
			NEW.nom_ouv,
			NEW.ty_ouvelec,
			NEW.etat_ouvel,
			NEW.mod_pos_ou,
			NEW.ty_comm,
			NEW.pdl_edf,
			NEW.n_com_edf,
			NEW.mis_terre,
			NEW.val_terre,
			NEW.ik_ouvelec,
			NEW.ip_ouvelec,
			NEW.puis_mes,
			NEW.puis_sous,
			NEW.pres_var,
			NEW.ty_disjonc,
			NEW.ty_fusible,
			NEW.observ,
			now(),
			NULL;----------------------------------------------------------- On insére les données dans ouvrage électrique normalement
		
	ELSE --------------------------------------------------------------------------- Si l'ouvrage n'est PAS une armoire
		INSERT INTO m_reseau_sec.an_ecl_ouvrage_electrique (
			id_ouvelec,
			nom_ouv,
			ty_ouvelec,
			etat_ouvel,
			mod_pos_ou, 
			ty_comm, 
			pdl_edf,
			n_com_edf,
			mis_terre,
			val_terre,
			ik_ouvelec,
			ip_ouvelec,
			puis_mes,
			puis_sous,
			pres_var,
			ty_disjonc,
			ty_fusible,
			observ,
			date_sai,
			date_maj)
		SELECT
			id_unique,
			NEW.nom_ouv,
			NEW.ty_ouvelec,
			NEW.etat_ouvel,
			NEW.mod_pos_ou,
			'ZZ', ---------------------------------------------------------- On force l'attribut type de commande à "non-concerné"
			NEW.pdl_edf,
			NEW.n_com_edf,
			NEW.mis_terre,
			NEW.val_terre,
			NEW.ik_ouvelec,
			NEW.ip_ouvelec,
			NEW.puis_mes,
			NEW.puis_sous,
			NEW.pres_var,
			NEW.ty_disjonc,
			NEW.ty_fusible,
			NEW.observ,
			now(),
			NULL; --------------------------------------------------------- Les autres attributs sont insérés normalement
	END IF;


	----
	----

	RETURN NEW;

ELSIF (TG_OP= 'UPDATE') THEN --------------------------------------------------- Si c'est un UPDATE

	IF (NEW.depart NOT IN (SELECT id_depart  --------------------------------------- Si le départ auquel est lié l'ouvrage (dans nouvelle saisie) 
			       FROM m_reseau_sec.an_ecl_depart dep --------------------- n'est pas un des départs de l'ouvrage
			       WHERE NEW.id_ouvelec=dep.id_ouvelec)) THEN--------------- alors

		IF (NEW.depart IS NOT NULL AND NEW.ty_ouvelec <> '10' ) THEN ------------------- Si l'ouvrage n'est pas une armoire principale
			UPDATE m_reseau_sec.geo_ecl_noeud 
			SET 
			ent_pose=NEW.ent_pose,
			dat_pos=NEW.dat_pos,
			qua_dat=NEW.qua_dat,
			geom=NEW.geom,
			depart = NEW.depart
			WHERE id_noeud=NEW.id_ouvelec; ----------------------------------------- On insére toutes les données normalement dans noeud

		ELSE---------------------------------------------------------------------------- Si l'ouvrage EST une armoire  principale

			UPDATE m_reseau_sec.geo_ecl_noeud
			SET 
			ent_pose=NEW.ent_pose,
			dat_pos=NEW.dat_pos,
			qua_dat=NEW.qua_dat,
			geom=NEW.geom,
			depart = NULL ---------------------------------------------------------- On force un départ NULL
			WHERE id_noeud=NEW.id_ouvelec;  ---------------------------------------- On insère les autres données dans noeud 

		END IF;

	ELSE---------------------------------------------------------------------------- Si le départ auquel est lié l'ouvrage dans la nouvelle saisie est un départ de l'ouvrage

		UPDATE m_reseau_sec.geo_ecl_noeud 
		SET 
		ent_pose=NEW.ent_pose,
		dat_pos=NEW.dat_pos,
		qua_dat=NEW.qua_dat,
		geom=NEW.geom,
		depart = NULL ---------------------------------------------------------- On force le départ à NULL
		WHERE id_noeud=NEW.id_ouvelec;

	END IF;

	IF ( NEW.depart <> OLD.depart OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) ) 
	    THEN------------------------------------------------------------------------- Si le nouveau départ auquel est lié l'ouvrage est différent de l'ancien

		REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

	END IF;
	---
	---

	IF (NEW.ty_ouvelec <> '10') THEN ----------------------------------------------- Si l'ouvrage n'est PAS une armoire principale
		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique 
		SET 
		nom_ouv=NEW.nom_ouv,
		ty_ouvelec=NEW.ty_ouvelec,
		etat_ouvel=NEW.etat_ouvel,
		mod_pos_ou=NEW.mod_pos_ou,
		ty_comm='ZZ', ---------------------------------------------------------- On force le type de commande à non conerné
		pdl_edf=NEW.pdl_edf,
		n_com_edf=NEW.n_com_edf,
		mis_terre=NEW.mis_terre,
		val_terre=NEW.val_terre,
		ik_ouvelec=NEW.ik_ouvelec,
		ip_ouvelec=NEW.ip_ouvelec,
		puis_mes=NEW.puis_mes,
		puis_sous=NEW.puis_sous,
		pres_var=NEW.pres_var,
		ty_disjonc=NEW.ty_disjonc,
		ty_fusible=NEW.ty_fusible,
		observ=NEW.observ,
		date_maj=now() --------------------------------------------------------- On insére tous les autres données normalement
		WHERE id_ouvelec=NEW.id_ouvelec;

	ELSE --------------------------------------------------------------------------- Si l'ouvrage EST une armoire
		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique 
		SET 
		nom_ouv=NEW.nom_ouv,
		ty_ouvelec=NEW.ty_ouvelec,
		etat_ouvel=NEW.etat_ouvel,
		mod_pos_ou=NEW.mod_pos_ou,
		ty_comm=NEW.ty_comm,
		pdl_edf=NEW.pdl_edf,
		n_com_edf=NEW.n_com_edf,
		mis_terre=NEW.mis_terre,
		val_terre=NEW.val_terre,
		ik_ouvelec=NEW.ik_ouvelec,
		ip_ouvelec=NEW.ip_ouvelec,
		puis_mes=NEW.puis_mes,
		puis_sous=NEW.puis_sous,
		pres_var=NEW.pres_var,
		ty_disjonc=NEW.ty_disjonc,
		ty_fusible=NEW.ty_fusible,
		observ=NEW.observ,
		date_maj=now()---------------------------------------------------------- On inséère les données normalement
		WHERE id_ouvelec=NEW.id_ouvelec;

	END IF;

	RETURN NEW;


ELSIF (TG_OP = 'DELETE') THEN --------------------------------------------------- Si c'est un UPDATE


	DELETE FROM m_reseau_sec.geo_ecl_noeud CASCADE -------------------------- On supprime le noeud concerné et les ouvrages et départs sont supprimés en cascade
	WHERE id_noeud=OLD.id_ouvelec;

	REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;-- On actualise la vue du "chemin d'électricité"

	RETURN NEW;

END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


CREATE TRIGGER t_t1_lk_ouvrage_electrique
  INSTEAD OF INSERT OR UPDATE OR DELETE --------------------------------------------- Un seul trigger pour la vue
  ON m_reseau_sec.geo_v_ouvrage_electrique
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_ouvrage_electrique(); 


--############################################################### POINT LUMINEUX ###############################################################


CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_point_lumineux()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;
BEGIN

id_unique = nextval('m_reseau_sec.media_seq');

IF (TG_OP = 'INSERT') THEN --------------------------------------------------- Si c'est un INSERT

	INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,ent_pose,dat_pos,qua_dat, geom, depart)
		SELECT
		id_unique,
		NEW.ent_pose,
		NEW.dat_pos,
		NEW.qua_dat,
		NEW.geom,
		NEW.depart; -------------------------------------------------- On insère les données normalement dans noeud

	IF (NEW.depart IS NOT NULL) THEN -------------------------------------------------- Si le point lumineux est lié à un départ
		
		REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire; --- on actualise la vue du "chemin d'électricité"

	END IF;

	INSERT INTO m_reseau_sec.an_ecl_support (
	id_supp,
	etat_supp,
	haut_trap,
	id_mod_sup, 
	ty_supp ,
	opt_supp ,
	ty_parasu ,
	etat_trappe , 
	loc_sy_el  ,
	loc_plat  ,
	ty_disjonc , 
	ty_fusible  ,
	marq_fixat ,
	etat_fixa  ,
	cod_ral_f ,
	haut_supp  ,
	observ ,
	date_sai ,
	date_maj )
	SELECT
	id_unique,
	NEW.etat_supp,
	NEW.haut_trap,
	NEW.id_mod_sup, 
	NEW.ty_supp ,
	NEW.opt_supp ,
	NEW.ty_parasu ,
	NEW.etat_trappe , 
	NEW.loc_sy_el  ,
	NEW.loc_plat  ,
	NEW.ty_disjonc , 
	NEW.ty_fusible  ,
	NEW.marq_fixat ,
	NEW.etat_fixa  ,
	NEW.cod_ral_f ,
	NEW.haut_supp ,
	NEW.observ ,
	now() ,
	NULL ;----------------------------------------------------------------------- On insère les données normalement dans la table support

	RETURN NEW;

ELSIF (TG_OP = 'UPDATE') THEN --------------------------------------------------- Si c'est un UPDATE

	UPDATE m_reseau_sec.geo_ecl_noeud 
	SET 
	ent_pose=NEW.ent_pose,
	dat_pos=NEW.dat_pos,
	qua_dat=NEW.qua_dat,
	geom=NEW.geom,
	depart = NEW.depart
	WHERE id_noeud=NEW.id_supp; --------------------------------------------- On insère les donnés normalement dans noeud

	IF ( NEW.depart <> OLD.depart OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) ) 
	    THEN----------------------------------------------------------------- Si le nouveau départ auquel est lié le noeud est différent de l'ancien

		REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

	END IF;


	UPDATE m_reseau_sec.an_ecl_support 
	SET  
	etat_supp=NEW.etat_supp,
	haut_trap=NEW.haut_trap,
	id_mod_sup=NEW.id_mod_sup,
	ty_supp=NEW.ty_supp ,
	opt_supp=NEW.opt_supp ,
	ty_parasu=NEW.ty_parasu ,
	etat_trappe=NEW.etat_trappe , 
	loc_sy_el=NEW.loc_sy_el  ,
	loc_plat=NEW.loc_plat  ,
	ty_disjonc=NEW.ty_disjonc , 
	ty_fusible=NEW.ty_fusible  ,
	marq_fixat=NEW.marq_fixat ,
	etat_fixa=NEW.etat_fixa  ,
	cod_ral_f=NEW.cod_ral_f ,
	haut_supp=NEW.haut_supp  ,
	observ=NEW.observ ,
	date_maj=now() 
	WHERE id_supp=NEW.id_supp; ---------------------------------------------- On insère les donnés normalement dans support

	RETURN NEW;

ELSIF (TG_OP = 'DELETE') THEN


	DELETE FROM m_reseau_sec.geo_ecl_noeud CASCADE--------------------------- On supprime le noeud et les supports et foyers sont supprimés en même temps
	WHERE id_noeud=OLD.id_supp;

	RETURN NEW;

END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

 CREATE TRIGGER t_t1_lk_point_lumineux
  INSTEAD OF INSERT OR UPDATE OR DELETE --------------------------------------------- Un seul trigger pour la vue
  ON m_reseau_sec.geo_v_point_lumineux
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_point_lumineux();  



--############################################################### POINT D'INTERET ###############################################################


CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_point_interet()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;
BEGIN


id_unique = nextval('m_reseau_sec.media_seq');

IF (TG_OP = 'INSERT') THEN 

	INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,ent_pose,dat_pos,qua_dat,geom,depart)
	SELECT
	id_unique,
	NEW.ent_pose,
	NEW.dat_pos,
	NEW.qua_dat,
	NEW.geom,
	NEW.depart; --------------------------------------------------------- On insère les données dans noeud normalement

	IF ( NEW.depart <> OLD.depart OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) ) 
	    THEN----------------------------------------------------------------- Si le nouveau départ auquel est lié le noeud est différent de l'ancien

		REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

	END IF;


	INSERT INTO m_reseau_sec.an_ecl_pi 
	SELECT
	id_unique,
	NEW.ty_pi,
	NEW.etat_pi,
	NEW.observ; --------------------------------------------------------- On insère les données dans point d'intérêt normalement

	RETURN NEW;

ELSIF (TG_OP = 'UPDATE') THEN 

	UPDATE m_reseau_sec.geo_ecl_noeud 
	SET 
	ent_pose = NEW.ent_pose,
	dat_pos = NEW.dat_pos,
	qua_dat = NEW.qua_dat,
	geom=NEW.geom,
	depart = NEW.depart
	WHERE id_noeud=NEW.id_pi; ------------------------------------------- On insère les données dans noeud normalement

	REFRESH MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;

	---
	---


	UPDATE m_reseau_sec.an_ecl_pi 
	SET 
	ty_pi=NEW.ty_pi,
	etat_pi=NEW.etat_pi,
	observ=NEW.observ
	WHERE id_pi=NEW.id_pi; ---------------------------------------------- On insère les données dans point d'intérêt normalement

	RETURN NEW;

ELSIF (TG_OP = 'DELETE') THEN


	DELETE FROM m_reseau_sec.geo_ecl_noeud CASCADE ---------------------- On supprime le noeud qui supprime le point d'intérêt en cascade
	WHERE id_noeud=OLD.id_pi;


RETURN NEW;

END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

CREATE TRIGGER t_t1_point_interet
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_pi
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_point_interet();  
