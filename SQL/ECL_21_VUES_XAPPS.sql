 
/*ECL V1.0*/
/*Creation des vues nécessaires à l'application web-métier */
/*ECL_20_VUES_XAPPS.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau */

/*
SOMMAIRE :
 - DROP
 - VUES et COMMENTAIRES
*/


-- ###############################################################################################################################
-- ###                                                                                                                         ###
-- ###                                                           DROP                                                          ###
-- ###                                                                                                                         ###
-- ###############################################################################################################################

--VUES

DROP MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_depart;

DROP VIEW IF EXISTS m_reseau_sec.an_v_statistiques;

DROP VIEW IF EXISTS m_reseau_sec.an_v_intervention;

DROP VIEW IF EXISTS m_reseau_sec.an_v_patrimoine;

DROP VIEW IF EXISTS m_reseau_sec.an_v_tension_cable;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_intervention_liste;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_support_sans_foyer;

DROP VIEW IF EXISTS m_reseau_sec.an_v_depart_puissance_souscrite;

-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                      VUES APPLICATIVES                                                    ###
-- ###                                                                                                                           ###
-- #################################################################################################################################


    
--############################################################## RECURSIVITE #####################################################

-- VUE MATERIALISEE RAFRAICHIE UNIQUEMENT LORS DES CHANGEMENTS DE L'ATTRIBUT DEPART DE LA CLASSE NOEUD ET LORS DE LA SUPPRESSION D'UN DEPART
CREATE MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire AS 
	WITH RECURSIVE recursivite_noeud (id_noeud, depart,amont_cour, compteur) AS (  -- C'est le nom de la table qui va stocker les informations lors de chaque boucle
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
	       WHERE rec.depart=dep.id_depart ) IN (SELECT id_ouvelec ---------------- puisqu'un noeud ne peut être relié qu'à une seule armoire principale.
						    FROM m_reseau_sec.an_ecl_ouvrage_electrique 
						    WHERE ty_ouvelec='10'); 

ALTER MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire
OWNER TO sig_temp;

COMMENT ON MATERIALIZED VIEW m_reseau_sec.an_v_materialisee_noeud_armoire IS 'Vue matérialisée utilisant une requête récursive pour déterminer les ouvrages électriques en amont des noeuds';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.id_noeud IS 'Identifiant du nœud';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.depart IS 'depart de l''armoire principale auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.an_v_materialisee_noeud_armoire.amont_cour IS 'Cheminement de l''électricité';



--############################################################## SELECTION DEPART PROCHES ####################################################

--On créé une vue de buffer autour des départs, afin de limiter le nombre de départ dans la liste de valeur de Géo, selon la géospatialisation du noeud courant
--DROP VIEW m_reseau_sec.geo_v_depart;
CREATE VIEW m_reseau_sec.geo_v_depart AS 
SELECT  dep.id_depart,
	CONCAT (
		(SELECT nom_ouv ------------------------------------------------------ On concatène le nom de l'ouvrage auquel est lié le départ avec le nom du départ
		 FROM m_reseau_sec.an_ecl_ouvrage_electrique ouv --------------------- Ceci rend plus facile la sélection dans la liste de valeur
		 WHERE dep.id_ouvelec=ouv.id_ouvelec),'-' ,dep.nom_depart)  
	AS nom_depart,--------------------------------------------------------------- Nom de l'attribut concaténé
	ST_Buffer(nd.geom,400)::geometry(Polygon,2154) AS geom ---------------------- Réalisation du buffer de 200 mètres (à revoir) selon géométrie de l'ouvrage(noeud) auquel est lié le départ
FROM m_reseau_sec.an_ecl_depart dep
JOIN m_reseau_sec.geo_ecl_noeud nd ON nd.id_noeud = dep.id_ouvelec
WHERE dep.situation <> '12' AND dep.situation <> '11';------------------------------- On sélection les départs actifs uniquement

ALTER VIEW m_reseau_sec.geo_v_depart
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.geo_v_depart IS 'Vue géospatialisée des départs selon géométrie de l''ouvrage rattaché - géométrie de buffer';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.id_depart IS 'Identifiant du départ';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.nom_depart IS 'Concaténation du nom de l''ouvrage du départ et du nom du départ';
COMMENT ON COLUMN m_reseau_sec.geo_v_depart.geom IS 'Géométrie ';



--############################################################## SUPPORT SANS FOYERS ####################################################

--On cherche les supports sans foyers afin de les faire apparaître dans GEO (section gestion des anomalies)
--DROP VIEW m_reseau_sec.geo_v_support_sans_foyer;
CREATE VIEW m_reseau_sec.geo_v_support_sans_foyer AS 
SELECT  sup.id_supp,
	nd.geom
	FROM  m_reseau_sec.geo_ecl_noeud nd JOIN m_reseau_sec.an_ecl_support sup ON sup.id_supp = nd.id_noeud 
	      LEFT JOIN m_reseau_sec.an_ecl_foyer foy ON sup.id_supp = foy.id_supp
	WHERE foy.id_supp IS NULL AND nd.situation <> '12' AND nd.situation <> '11'; ----------- On sélection les supports actifs uniquement

ALTER VIEW m_reseau_sec.geo_v_support_sans_foyer
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.geo_v_support_sans_foyer IS 'Vue qui sélectionne les supports sans foyers';
COMMENT ON COLUMN m_reseau_sec.geo_v_support_sans_foyer.id_supp IS 'Identifiant du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_support_sans_foyer.geom IS 'géométrie du support';



--############################################################## Tension du câble ####################################################

--- On prend la tension du câble selon son lien avec les noeuds et donc les départs --> le lien avec câble est ensuite réalisé dans GEO.
--DROP VIEW m_reseau_sec.an_v_tension_cable ;
CREATE VIEW m_reseau_sec.an_v_tension_cable AS 
SELECT  cab.id_cab,
	dep.tension	
	FROM m_reseau_sec.geo_ecl_cable cab, m_reseau_sec.an_ecl_depart dep
	WHERE	cab.situation <> '12' AND cab.situation <> '11' AND (dep.id_depart=(SELECT depart 
										    FROM m_reseau_sec.geo_ecl_noeud nd 
										    WHERE cab.id_nd_fin=id_noeud AND nd.situation <> '12' AND nd.situation <> '11')); ----------- On sélection les noeuds et câbles actifs uniquement

ALTER VIEW m_reseau_sec.an_v_tension_cable
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.an_v_tension_cable IS 'Lien entre le câble et sa tension selon noeud final du câble';
COMMENT ON COLUMN m_reseau_sec.an_v_tension_cable.id_cab IS 'Identifiant du câble';
COMMENT ON COLUMN m_reseau_sec.an_v_tension_cable.tension IS 'Tension du câble';



--############################################################## TABLEAU DE BORD PATRIMOINE ####################################################

--- On fait une vue du nombre d'éléments du patrimoine
DROP VIEW  m_reseau_sec.an_v_patrimoine;
CREATE OR REPLACE VIEW m_reseau_sec.an_v_patrimoine AS 
SELECT 
	(SELECT count(*) FROM m_reseau_sec.an_ecl_ouvrage_electrique JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_ouvelec WHERE nd.situation <> '12')AS ouvrage,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_foyer WHERE situation <> '12') AS nbr_foyer,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_support sup JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_supp WHERE nd.situation <> '12') AS support,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_depart dep WHERE dep.situation <> '12' ) AS depart,
	(SELECT count(*) FROM m_reseau_sec.an_ecl_pi JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_pi WHERE nd.situation <> '12') AS pi;              

ALTER VIEW m_reseau_sec.an_v_patrimoine
OWNER TO sig_temp;

COMMENT ON VIEW m_reseau_sec.an_v_patrimoine IS 'Bilan du patrimoine numérique d''éclairage public';
COMMENT ON COLUMN m_reseau_sec.an_v_patrimoine.ouvrage IS 'Nombre d''ouvrages Actifs ou Inactifs';
COMMENT ON COLUMN m_reseau_sec.an_v_patrimoine.support IS 'Nombre de supports Actifs ou Inactifs';
COMMENT ON COLUMN m_reseau_sec.an_v_patrimoine.nbr_foyer IS 'Nombre de foyers Actifs ou Inactifs';
COMMENT ON COLUMN m_reseau_sec.an_v_patrimoine.depart IS 'Nombre de departs Actifs ou Inactifs';
COMMENT ON COLUMN m_reseau_sec.an_v_patrimoine.pi IS 'Nombre de point d''intérêts Actifs ou Inactifs';


--#################################################### INTERVENTION VUE POUR LISTE RAFRAICHISSEMENT ####################################################

--- 
DROP VIEW  m_reseau_sec.geo_v_intervention_liste ;
CREATE OR REPLACE VIEW m_reseau_sec.geo_v_intervention_liste AS 
SELECT 
	inter.id_inter AS code,
	CONCAT ('Signalement N°', id_inter, ' - Défaillance : ', (SELECT valeur FROM m_reseau_sec.lt_ecl_type_defaillance WHERE typ_def=code)) AS valeur,
	inter.type_si_in,
	inter.etat_sign,
	noeud.geom,
	CONCAT ( 'Signalement N°' , id_inter, chr(10), 'Défaillance: ', (SELECT valeur FROM m_reseau_sec.lt_ecl_type_defaillance WHERE typ_def=code), chr(10), 'Nacelle : ',(SELECT valeur FROM m_reseau_sec.lt_ecl_moyen_intervention WHERE moy_interv=code)  ,chr(10), inter.observ ) 
	AS affichage,
	inter.dat_signa,
	inter.dat_real,
	inter.moy_interv,
	inter.observ,
	inter.typ_def
FROM m_reseau_sec.an_ecl_intervention inter JOIN m_reseau_sec.geo_ecl_noeud noeud ON inter.id_noeud = noeud.id_noeud;        

ALTER VIEW m_reseau_sec.geo_v_intervention_liste
OWNER TO sig_temp;

COMMENT ON VIEW m_reseau_sec.geo_v_intervention_liste IS 'Interventions/Signalements avec attributs calculés dynamiquement, sert à la liste de domaine interventions et à l''affichage des signalements sur GEO';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.code IS 'Identifiant du signalement/de l''intervention';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.type_si_in IS 'Signalement ou intervention';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.geom IS 'Géométrie du noeud su lequel est l''intervention/le signalement';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.affichage IS 'Texte de l''infobulle dans GEO';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.dat_signa IS 'Date du signalement';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.dat_real IS 'Date de réalisation de l''intervention';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.moy_interv IS 'Moyen d''intervention (avec ou sans nacelle)';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.typ_def IS 'Type de défaillance';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.etat_sign IS 'Etat du signalement (soumis, réglé...)';
COMMENT ON COLUMN m_reseau_sec.geo_v_intervention_liste.valeur IS 'Concaténation de plusieurs attributs, avec valeurs des defaillance (au lieu du code stocké dans la table intervention)';


--####################################################### CALCULE DE LA PUISSANCE SOUSCRITE ####################################################

-- DROP VIEW m_reseau_sec.an_v_depart_puissance_souscrite;

CREATE OR REPLACE VIEW m_reseau_sec.an_v_depart_puissance_souscrite AS 

	SELECT 	    
		    dep.id_depart, ----L'identifiant du départ
		    lt_ecl_puissance_lampe.valeur::integer * (( SELECT count(*) AS count -------------Les puissances des lampes * le nbr de foyers...
								FROM m_reseau_sec.an_ecl_foyer 
								WHERE (an_ecl_foyer.id_mod_lm IN ----- Dont le modèle de lampe est ...
												(SELECT an_ecl_modele_lampe.id_mod_lm 
												 FROM m_reseau_sec.an_ecl_modele_lampe
												 WHERE an_ecl_modele_lampe.puis_lam::text = lt_ecl_puissance_lampe.code::text)) ------ celui dont on a sélectionner la valeur au début.
												       AND (an_ecl_foyer.id_supp IN (SELECT geo_ecl_noeud.id_noeud ------------------- Encore en sélection sur le foyer : qui est lié à un noeud... 
																     FROM m_reseau_sec.geo_ecl_noeud
																     WHERE geo_ecl_noeud.depart = dep.id_depart AND situation <> '12' AND situation <> '11')))) AS val --... qui est lui même lié au départ sur lequel on fait la recherche. 
	FROM m_reseau_sec.lt_ecl_puissance_lampe,m_reseau_sec.an_ecl_depart dep
	WHERE lt_ecl_puissance_lampe.code::text <> '00'::text AND lt_ecl_puissance_lampe.code::text <> 'ZZ'::text AND lt_ecl_puissance_lampe.code::text <> '99'::text -- Là où le modèle de lampe n'a pas une puissance nulle, non concerné ou Autre.
	GROUP BY dep.id_depart, lt_ecl_puissance_lampe.valeur, lt_ecl_puissance_lampe.code; -- Regrouper par départ pour avoir la somme finale de la puissance souscrite.

ALTER TABLE m_reseau_sec.an_v_depart_puissance_souscrite
  OWNER TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.an_v_depart_puissance_souscrite TO sig_read;
GRANT ALL ON TABLE m_reseau_sec.an_v_depart_puissance_souscrite TO sig_temp;

COMMENT ON VIEW m_reseau_sec.an_v_depart_puissance_souscrite IS 'Calcul des puissance souscrites aux départs en fonction des lampe reliées';
COMMENT ON COLUMN m_reseau_sec.an_v_depart_puissance_souscrite.id_depart IS 'Identifiant du départ';
COMMENT ON COLUMN m_reseau_sec.an_v_depart_puissance_souscrite.val IS 'Valeur de la puissance souscrite';



--############################################################## TABLEAU DES ETATS ####################################################
/*
--On sélectionne les noeuds qui ne sont pas des armoirs principales et qui ne sont pas reliés à des armoirs principales, afin de les faire apparaître dans GEO
--DROP VIEW IF EXISTS m_reseau_sec.an_v_statistiques;
CREATE VIEW m_reseau_sec.an_v_statistiques AS 
SELECT  
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Etat </th><th> Nombre d''ouvrages </th> </tr> </th><th> Nombre de supports </th> </tr> ',
		'<tr><td align="center">Non renseigné </td> <td align="center">', (SELECT count(*) FROM m_reseau_sec.an_ecl_ouvrage_electrique JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_ouvelec WHERE  etat_ouvel = '00' ), '</td> </tr>', 
		'<tr><td align="center">Neuf </td> <td align="center">', SUM (CASE WHEN ouv.etat_ouvel='10' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Bon état </td> <td align="center">', SUM (CASE WHEN ouv.etat_ouvel='20' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Etat moyen </td> <td align="center">', SUM (CASE WHEN ouv.etat_ouvel='30' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">A changer </td> <td align="center">', SUM (CASE WHEN ouv.etat_ouvel='40' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Non concerné </td> <td align="center">', SUM (CASE WHEN ouv.etat_ouvel='ZZ' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_ouvrage_electrique ouv JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_ouvelec WHERE nd.situation <> '12' )
	AS etat_ouvel,
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Etat </th><th> Nombre de supports </th> </tr>',
		'<tr><td align="center">Non renseigné </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='00' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Neuf </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='10' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Bon état </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='20' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Etat moyen </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='30' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">A changer </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='40' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Non concerné </td> <td align="center">', SUM (CASE WHEN supp.etat_supp='ZZ' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_support supp JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_supp WHERE nd.situation <> '12')                        
	AS etat_supp,
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Etat </th><th> Nombre de lanternes </th> </tr>',
		'<tr><td align="center">Non renseigné </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='00' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Neuf </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='10' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Bon état </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='20' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Etat moyen </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='30' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">A changer </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='40' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Non concerné </td> <td align="center">', SUM (CASE WHEN foy.etat_foy='ZZ' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_foyer foy WHERE situation <> '12')                        
	AS etat_foy,
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Etat </th><th> Nombre de points d''intérêts </th> </tr>',
		'<tr><td align="center">Non renseigné </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='00' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Neuf </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='10' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Bon état </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='20' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Etat moyen </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='30' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">A changer </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='40' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Non concerné </td> <td align="center">', SUM (CASE WHEN pi.etat_pi='ZZ' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_pi pi JOIN m_reseau_sec.geo_ecl_noeud nd ON id_noeud=id_pi WHERE nd.situation <> '12')                        
	AS etat_pi,
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Etat </th><th> Nombre de départs </th> </tr>',
		'<tr><td align="center">Non renseigné </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='00' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Neuf </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='10' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Bon état </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='20' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Etat moyen </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='30' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">A changer </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='40' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Non concerné </td> <td align="center">', SUM (CASE WHEN dep.etat_dep='ZZ' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_depart dep WHERE situation <> '12')                        
	AS etat_dep ; 

ALTER VIEW m_reseau_sec.an_v_statistiques
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.an_v_statistiques IS 'Vue de statistique des états des ouvrages';
COMMENT ON COLUMN m_reseau_sec.an_v_statistiques.etat_ouvel IS 'Etats des ouvrages';
COMMENT ON COLUMN m_reseau_sec.an_v_statistiques.etat_supp IS 'Etats des supports';
COMMENT ON COLUMN m_reseau_sec.an_v_statistiques.etat_foy IS 'Etats des foyer';
COMMENT ON COLUMN m_reseau_sec.an_v_statistiques.etat_pi IS 'Etats des points-d''intérêts';
COMMENT ON COLUMN m_reseau_sec.an_v_statistiques.etat_dep IS 'Etats des départs';



--############################################################## TABLEAU DE BORD INTERVENTION ####################################################

--- On fait une vue des intervenations
DROP VIEW  m_reseau_sec.an_v_intervention;
CREATE OR REPLACE VIEW m_reseau_sec.an_v_intervention AS 
SELECT  count(*) AS nbr_inter,
	(SELECT CONCAT ('<table border="2" >',
		'<tr><th>Type d''intervention </th><th> Nombre d''interventions </th> </tr>',
		'<tr><td align="center">Changement de disjoncteur </td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%10%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de fusible </td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%11%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de lanterne</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%12%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de lampe</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%13%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de ballast </td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%15%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement d amorce</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%16%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement d auto-transformateur</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%17%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Ajout/suppression d''options</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%18%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de parasurtenseur</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%19%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Changement de type de commande</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%20%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Contrôle électrique</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%30%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Contrôle mécanique</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%31%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Nettoyage</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%40%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Réparation</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%50%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Ajout d un départ</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%60%' THEN 1 ELSE 0 END), '</td> </tr>',
		'<tr><td align="center">Autre</td> <td align="center">', SUM (CASE WHEN inte.type_inter LIKE '%99%' THEN 1 ELSE 0 END), '</td> </tr>')
		FROM m_reseau_sec.an_ecl_intervention inte)                        
	AS synt_inter 
	FROM m_reseau_sec.an_ecl_intervention;

ALTER VIEW m_reseau_sec.an_v_intervention
OWNER TO sig_temp;


COMMENT ON VIEW m_reseau_sec.an_v_tension_cable IS 'Vue de lien entre le câble et sa tension';
COMMENT ON COLUMN m_reseau_sec.an_v_tension_cable.id_cab IS 'Identifiant du câble';
COMMENT ON COLUMN m_reseau_sec.an_v_tension_cable.tension IS 'Tension du câble';

*/
