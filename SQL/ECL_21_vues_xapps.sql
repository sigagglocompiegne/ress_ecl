 
/*ECL V1.0*/
/*Creation des vues nécessaires à l'application web-métier */
/*ECL_21_VUES_XAPPS.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau */

/*
SOMMAIRE :
 - DROP
 - VUES COMMENTAIRES TRIGGER
*/


--ETAPE 3 :

-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           DROP                                                          ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--VUES

DROP MATERIALIZED VIEW x_apps.an_v_ecl_materialisee_noeud_armoire;

DROP VIEW IF EXISTS x_apps.geo_v_depart;

DROP VIEW IF EXISTS x_apps.an_v_stat_intervention;

DROP VIEW IF EXISTS x_apps.an_v_patrimoine;

DROP VIEW IF EXISTS x_apps.an_v_tension_cable;

DROP VIEW IF EXISTS x_apps.geo_v_intervention_liste_affichage;

DROP VIEW IF EXISTS x_apps.geo_v_support_par_armoire;

-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                      VUES APPLICATIVES                                                    ###
-- ###                                                                                                                           ###
-- #################################################################################################################################


    
--############################################################## RECURSIVITE #####################################################

-- VUE MATERIALISEE RAFRAICHIE UNIQUEMENT LORS DES CHANGEMENTS DE L'ATTRIBUT DEPART DE LA CLASSE NOEUD ET LORS DE LA SUPPRESSION D'UN DEPART
CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire AS 
	WITH RECURSIVE recursivite_noeud (id_noeud, depart,amont_cour, compteur) AS (  -- C'est le nom de la table qui va stocker les informations lors de chaque boucle
	   SELECT id_noeud,							      -- ce premier SELECT génère la première relation entre un noeud sélectionné et l'ouvrage le plus proche (sauf si le noeud est une armoire). Génère une ligne vide si armoire supprimé dans le dernier SELECT
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
	UNION ALL  ------------------------------------------------------------------- Enclenchement de la récursivité, on génère les relations supplémentaires entre un noeud et l'ouvrage le plus proche en cas de présence d'une sous-armoire ou transfo
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
	       WHERE rec.depart=dep.id_depart ) IN (SELECT id_ouvelec ---------------- puisqu'un noeud ne peut être relié qu'à une seule armoire principale.
						    FROM m_reseau_sec.an_ecl_ouvrage_electrique 
						    WHERE ty_ouvelec='10'); 

ALTER MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire
OWNER TO sig_temp;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire IS 'Vue matérialisée utilisant une requête récursive pour déterminer les ouvrages électriques en amont des noeuds';
COMMENT ON COLUMN x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire.id_noeud IS 'Identifiant du nœud';
COMMENT ON COLUMN x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire.depart IS 'depart de l''armoire principale auquel est lié le noeud';
COMMENT ON COLUMN x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire.amont_cour IS 'Cheminement de l''électricité';



--############################################################## SELECTION DEPART PROCHES ####################################################

--On créé une vue de buffer autour des départs, afin de limiter le nombre de départ dans la liste de valeur de Géo, selon la géospatialisation du noeud courant
--DROP VIEW x_apps.geo_v_depart;
CREATE VIEW x_apps.xapps_geo_v_ecl_depart AS 
SELECT  dep.id_depart,
	CONCAT (
		(SELECT nom_ouv ------------------------------------------------------ On concatène le nom de l'ouvrage auquel est lié le départ avec le nom du départ
		 FROM m_reseau_sec.an_ecl_ouvrage_electrique ouv --------------------- Ceci rend plus facile la sélection dans la liste de valeur
		 WHERE dep.id_ouvelec=ouv.id_ouvelec),
	        '-' ,dep.nom_depart)  
	AS nom_depart,--------------------------------------------------------------- Nom de l'attribut concaténé
	ST_Buffer(nd.geom,400)::geometry(Polygon,2154) AS geom ---------------------- Réalisation du buffer de 400 mètres (à revoir) selon géométrie de l'ouvrage(noeud) auquel est lié le départ
FROM m_reseau_sec.an_ecl_depart dep
JOIN m_reseau_sec.geo_ecl_noeud nd ON nd.id_noeud = dep.id_ouvelec
WHERE dep.situation <> '12' AND dep.situation <> '11';------------------------------- On sélection les départs actifs uniquement

ALTER VIEW x_apps.xapps_geo_v_ecl_depart
OWNER TO sig_temp;


COMMENT ON VIEW x_apps.xapps_geo_v_ecl_depart IS 'Vue géospatialisée des départs selon géométrie de l''ouvrage rattaché - géométrie de buffer';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_depart.id_depart IS 'Identifiant du départ';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_depart.nom_depart IS 'Concaténation du nom de l''ouvrage du départ et du nom du départ';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_depart.geom IS 'Géométrie ';


--############################################################## Tension du câble ####################################################

--- On prend la tension du câble selon son lien avec les noeuds et donc les départs --> le lien avec câble est ensuite réalisé dans GEO.
--DROP VIEW x_apps.xapps_an_v_ecl_tension_cable ;
CREATE VIEW x_apps.xapps_an_v_ecl_tension_cable AS 
SELECT  cab.id_cab,
	dep.tension	
	FROM m_reseau_sec.geo_ecl_cable cab, m_reseau_sec.an_ecl_depart dep
	WHERE	cab.situation <> '12' AND cab.situation <> '11' AND (dep.id_depart=(SELECT depart 
										    FROM m_reseau_sec.geo_ecl_noeud nd 
										    WHERE cab.id_nd_fin=id_noeud AND nd.situation <> '12' AND nd.situation <> '11')); ----------- On sélection les noeuds et câbles actifs uniquement

ALTER VIEW x_apps.xapps_an_v_ecl_tension_cable
OWNER TO sig_temp;


COMMENT ON VIEW x_apps.xapps_an_v_ecl_tension_cable IS 'Lien entre le câble et sa tension selon noeud final du câble';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_tension_cable.id_cab IS 'Identifiant du câble';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_tension_cable.tension IS 'Tension du câble';



--############################################################## TABLEAU DE BORD PATRIMOINE ####################################################

--- On fait une vue du nombre d'éléments du patrimoine
--DROP VIEW  x_apps.xapps_an_v_ecl_patrimoine;
CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_patrimoine AS 
SELECT 
	(SELECT count(*) FROM m_reseau_sec.an_ecl_ouvrage_electrique JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_ouvelec WHERE nd.situation <> '12') AS ouvrage,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_foyer WHERE situation <> '12') AS nbr_foyer,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_support sup JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_supp WHERE nd.situation <> '12') AS support,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_depart dep WHERE dep.situation <> '12' ) AS depart,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_pi JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_pi WHERE nd.situation <> '12') AS pi;              

ALTER VIEW x_apps.xapps_an_v_ecl_patrimoine
OWNER TO sig_temp;

COMMENT ON VIEW x_apps.xapps_an_v_ecl_patrimoine IS 'Bilan du patrimoine numérique d''éclairage public';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_patrimoine.ouvrage IS 'Nombre d''ouvrages Actifs ou Inactifs';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_patrimoine.support IS 'Nombre de supports Actifs ou Inactifs';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_patrimoine.nbr_foyer IS 'Nombre de foyers Actifs ou Inactifs';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_patrimoine.depart IS 'Nombre de departs Actifs ou Inactifs';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_patrimoine.pi IS 'Nombre de point d''intérêts Actifs ou Inactifs';


--#################################################### INTERVENTION VUE POUR LISTE RAFRAICHISSEMENT ET AFFICHAGE ####################################################

--- 
--DROP VIEW  x_apps.geo_v_intervention_liste_affichage ;
CREATE OR REPLACE VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage AS 
SELECT 
	inter.id_inter AS code,
	CONCAT ('Signalement N°', id_inter, ' - Défaillance : ', (SELECT valeur FROM m_reseau_sec.lt_ecl_type_defaillance WHERE typ_def=code)) AS valeur,
	inter.type_si_in,
	inter.etat_sign,
	noeud.geom,
	CONCAT ( 'Signalement N°' , id_inter, chr(10), ' Sur ', CASE 
		WHEN inter.id_objet IN (SELECT id_ouvelec FROM m_reseau_sec.an_ecl_ouvrage_electrique) THEN 'ouvrage électrique' 
		WHEN inter.id_objet IN (SELECT id_supp FROM m_reseau_sec.an_ecl_support) THEN 'support' 
		WHEN inter.id_objet IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi) THEN 'point d''intérêt' 
		WHEN inter.id_objet IN (SELECT id_cab FROM m_reseau_sec.geo_ecl_cable) THEN 'câble' 
		WHEN inter.id_objet IN (SELECT id_foyer FROM m_reseau_sec.an_ecl_foyer) THEN 'foyer' 
		WHEN inter.id_objet IN (SELECT id_depart FROM m_reseau_sec.an_ecl_depart) THEN 'depart' 
		ELSE NULL END ,
		 ' N°', id_objet, chr(10), 'Défaillance: ', (SELECT valeur FROM m_reseau_sec.lt_ecl_type_defaillance WHERE typ_def=code), chr(10), 'Nacelle : ',(SELECT valeur FROM m_reseau_sec.lt_ecl_moyen_intervention WHERE moy_interv=code)  ,chr(10), inter.observ )
	AS affichage,
	inter.dat_signa,
	inter.dat_real,
	inter.moy_interv,
	inter.observ,
	inter.typ_def
FROM m_reseau_sec.an_ecl_intervention inter JOIN m_reseau_sec.geo_ecl_noeud noeud ON inter.id_noeud = noeud.id_noeud;        

ALTER VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage
OWNER TO sig_temp;

COMMENT ON VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage IS 'Interventions/Signalements avec attributs calculés dynamiquement, sert à la liste de domaine interventions et à l''affichage des signalements sur GEO';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.code IS 'Identifiant du signalement/de l''intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.type_si_in IS 'Signalement ou intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.geom IS 'Géométrie du noeud su lequel est l''intervention/le signalement';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.affichage IS 'Texte de l''infobulle dans GEO';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.dat_signa IS 'Date du signalement';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.dat_real IS 'Date de réalisation de l''intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.moy_interv IS 'Moyen d''intervention (avec ou sans nacelle)';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.observ IS 'Commentaires divers';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.typ_def IS 'Type de défaillance';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.etat_sign IS 'Etat du signalement (soumis, réglé...)';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.valeur IS 'Concaténation de plusieurs attributs, avec valeurs des defaillance (au lieu du code stocké dans la table intervention)';


--####################################################### SUPPORT CATEGORISE PAR ARMOIRES ####################################################

-- DROP VIEW x_apps.xapps_geo_v_ecl_support_par_armoire;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_ecl_support_par_armoire AS 

	SELECT 	   
		id_supp,
		nom_ouv,
		geom

		FROM (m_reseau_sec.an_ecl_support JOIN m_reseau_sec.geo_ecl_noeud ON id_supp= id_noeud), m_reseau_sec.an_ecl_ouvrage_electrique ouv
		WHERE depart IN (SELECT id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec = ouv.id_ouvelec);

		
ALTER TABLE x_apps.xapps_geo_v_ecl_support_par_armoire
  OWNER TO sig_read;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO sig_read;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO sig_temp;

COMMENT ON VIEW x_apps.xapps_geo_v_ecl_support_par_armoire IS 'Support categorisé par armoires pour affichage GEO';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_support_par_armoire.id_supp IS 'idenfitifiant du support';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_support_par_armoire.nom_ouv IS 'Nom de l''ouvrage';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_support_par_armoire.geom IS 'Géométrie du support';


--############################################################## TABLEAU DE BORD INTERVENTION ####################################################

--- On fait une vue des intervenations
--DROP VIEW  x_apps.xapps_an_v_ecl_stat_intervention;
CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_stat_intervention AS 
SELECT          (SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_si_in = '20') AS nbr_inter,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%10%') AS chgmt_disj, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%11%') AS chgmt_fus, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%12%') AS chgmt_lant, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%13%') AS chgmt_lam,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%15%') AS chgmt_balla, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%16%') AS chgmt_amo, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%17%') AS chgmt_tran, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%18%') AS ajout_opti,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%19%') AS chgmt_para, 
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%20%') AS chgmt_comm,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%30%') AS ctrl_ele,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%31%') AS ctrl_mec,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%40%') AS nettoyage,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%50%') AS rep_objet,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%60%') AS ajout_dep,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%21%') AS chgmt_rece,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%70%') AS repo_lant,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%80%') AS supp_obj,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%81%') AS aban_obj,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%82%') AS reac_obj,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%90%') AS supp_optio,
		(SELECT count(*) FROM m_reseau_sec.an_ecl_intervention WHERE type_inter LIKE '%99%') AS autre;

ALTER VIEW x_apps.xapps_an_v_ecl_stat_intervention
OWNER TO sig_temp;


COMMENT ON VIEW x_apps.xapps_an_v_ecl_stat_intervention IS 'Compte des interventions selon le type';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.supp_obj IS 'Suppression de l''objet';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.aban_obj IS 'Abandon de l''objet';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.reac_obj IS 'Réactivation de l''objet';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.supp_optio IS 'Suppresion d''une option';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_rece IS 'Changement de recepteur';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.nbr_inter IS 'Identifiant du câble';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_disj IS 'Changement de disjoncteur';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_lant IS 'Changement de lanterne';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_lam IS 'Changement de lampe';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_amo IS 'Changement d''amorceur';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_balla IS 'Changement de ballaste / driver';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_tran IS 'Changement d''auto-transformateur';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.ajout_opti IS 'Ajout d''option';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_para IS 'Changement de parasurtenseur';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.chgmt_comm IS 'Changement de type de commande';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.ctrl_mec IS 'Contrôle mécanique';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.ctrl_ele IS 'Contrôle électrique';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.nettoyage IS 'Nettoyage';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.rep_objet IS 'Réparation d''objet';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.ajout_dep IS 'Ajout d''un départ';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.autre IS 'Autre type d''intervention';
COMMENT ON COLUMN x_apps.xapps_an_v_ecl_stat_intervention.repo_lant IS 'Repositionnement d''une lanterne/crosse';

