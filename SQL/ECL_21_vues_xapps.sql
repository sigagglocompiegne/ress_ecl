 
/*ECL V1.0*/
/*Creation des vues nécessaires à l'application web-métier */
/*ECL_21_VUES_XAPPS.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau + Grégory Bodet */

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
	ST_Buffer(nd.geom,750)::geometry(Polygon,2154) AS geom ---------------------- Réalisation du buffer de 400 mètres (à revoir) selon géométrie de l'ouvrage(noeud) auquel est lié le départ
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

--#################################################### INTERVENTION VUE POUR LISTE RAFRAICHISSEMENT ET AFFICHAGE ####################################################

-- View: x_apps.xapps_geo_v_ecl_intervention_liste_affichage

-- DROP VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage AS 
  SELECT inter.id_inter AS code,
    concat('Signalement N°', inter.id_inter, ' - Défaillance : ', ( SELECT lt_ecl_type_defaillance.valeur
           FROM m_reseau_sec.lt_ecl_type_defaillance
          WHERE inter.typ_def::text = lt_ecl_type_defaillance.code::text)) AS valeur,
    inter.type_si_in,
    inter.etat_sign,
    noeud.geom,
    concat('Signalement N°', inter.id_inter, '<br>', ' Sur ',
        CASE
            WHEN (inter.id_objet IN ( SELECT an_ecl_ouvrage_electrique.id_ouvelec
               FROM m_reseau_sec.an_ecl_ouvrage_electrique)) THEN 'ouvrage électrique'::text
            WHEN (inter.id_objet IN ( SELECT an_ecl_support.id_supp
               FROM m_reseau_sec.an_ecl_support)) THEN 'support'::text
            WHEN (inter.id_objet IN ( SELECT an_ecl_pi.id_pi
               FROM m_reseau_sec.an_ecl_pi)) THEN 'point d''intérêt'::text
            WHEN (inter.id_objet IN ( SELECT geo_ecl_cable.id_cab
               FROM m_reseau_sec.geo_ecl_cable)) THEN 'câble'::text
            WHEN (inter.id_objet IN ( SELECT an_ecl_foyer.id_foyer
               FROM m_reseau_sec.an_ecl_foyer)) THEN 'foyer'::text
            WHEN (inter.id_objet IN ( SELECT an_ecl_depart.id_depart
               FROM m_reseau_sec.an_ecl_depart)) THEN 'depart'::text
            ELSE NULL::text
        END, ' N°', inter.id_objet, '<br>', 'Défaillance : ', ( SELECT lt_ecl_type_defaillance.valeur
           FROM m_reseau_sec.lt_ecl_type_defaillance
          WHERE inter.typ_def::text = lt_ecl_type_defaillance.code::text), '<br>', ' Intervention : ', ( SELECT lt_ecl_moyen_intervention.valeur
           FROM m_reseau_sec.lt_ecl_moyen_intervention
          WHERE inter.moy_interv::text = lt_ecl_moyen_intervention.code::text), '<br>', ' Commentaire(s) : ', inter.observ) AS affichage,
    inter.dat_signa,
    inter.dat_real,
    inter.op_rea,
    inter.typ_obj,
    inter.type_inter,
    inter.moy_interv,
    inter.observ,
    inter.typ_def,
    noeud.id_contrat,
    noeud.id_noeud,
    noeud.commune,
    inter.lib_inter
   FROM m_reseau_sec.an_ecl_intervention inter
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON inter.id_noeud = noeud.id_noeud
  WHERE noeud.id_contrat::text = 'ZZ'::text OR noeud.id_contrat::text = '03'::text
UNION ALL
 SELECT inter.id_inter AS code,
    concat('Signalement N°', inter.id_inter, ' - Défaillance : ', ( SELECT lt_elecslt_type_defaillance.valeur
           FROM m_reseau_sec.lt_elecslt_type_defaillance
          WHERE inter.typ_def::text = lt_elecslt_type_defaillance.code::text)) AS valeur,
    inter.type_si_in,
    inter.etat_sign,
    noeud.geom,
    concat(' N°', inter.id_objet, '<br>', 'Défaillance : ', ( SELECT lt_elecslt_type_defaillance.valeur
           FROM m_reseau_sec.lt_elecslt_type_defaillance
          WHERE inter.typ_def::text = lt_elecslt_type_defaillance.code::text), '<br>', ' Intervention : ', ( SELECT lt_ecl_moyen_intervention.valeur
           FROM m_reseau_sec.lt_ecl_moyen_intervention
          WHERE inter.moy_interv::text = lt_ecl_moyen_intervention.code::text), '<br>', ' Commentaire(s) : ', inter.observ) AS affichage,
    inter.dat_signa,
    inter.dat_real,
    inter.op_rea,
    inter.typ_obj,
    inter.type_inter,
    inter.moy_interv,
    inter.observ,
    inter.typ_def,
    noeud.id_contrat,
    noeud.idu AS id_noeud,
    noeud.commune,
    inter.lib_inter
   FROM m_reseau_sec.an_ecl_intervention inter
     JOIN m_reseau_sec.geo_feu_b_support noeud ON inter.id_objet = noeud.idu
  WHERE noeud.id_contrat::text = 'ZZ'::text OR noeud.id_contrat::text = '03'::text
UNION ALL
 SELECT inter.id_inter AS code,
    concat('Signalement N°', inter.id_inter, ' - Défaillance : ', ( SELECT lt_elecslt_type_defaillance.valeur
           FROM m_reseau_sec.lt_elecslt_type_defaillance
          WHERE inter.typ_def::text = lt_elecslt_type_defaillance.code::text)) AS valeur,
    inter.type_si_in,
    inter.etat_sign,
    noeud.geom,
    concat(' N°', inter.id_objet, '<br>', 'Défaillance : ', ( SELECT lt_elecslt_type_defaillance.valeur
           FROM m_reseau_sec.lt_elecslt_type_defaillance
          WHERE inter.typ_def::text = lt_elecslt_type_defaillance.code::text), '<br>', ' Intervention : ', ( SELECT lt_ecl_moyen_intervention.valeur
           FROM m_reseau_sec.lt_ecl_moyen_intervention
          WHERE inter.moy_interv::text = lt_ecl_moyen_intervention.code::text), '<br>', ' Commentaire(s) : ', inter.observ) AS affichage,
    inter.dat_signa,
    inter.dat_real,
    inter.op_rea,
    inter.typ_obj,
    inter.type_inter,
    inter.moy_interv,
    inter.observ,
    inter.typ_def,
    noeud.id_contrat,
    noeud.idu AS id_noeud,
    noeud.commune,
    inter.lib_inter
   FROM m_reseau_sec.an_ecl_intervention inter
     JOIN m_reseau_sec.geo_feu_b_armoire noeud ON inter.id_objet = noeud.idu
  WHERE noeud.id_contrat::text = 'ZZ'::text OR noeud.id_contrat::text = '03'::text;

ALTER TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO read_sig;
COMMENT ON VIEW x_apps.xapps_geo_v_ecl_intervention_liste_affichage
  IS 'Interventions/Signalements avec attributs calculés dynamiquement, sert à la liste de domaine interventions et à l''affichage des signalements sur GEO';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.code IS 'Identifiant du signalement/de l''intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.valeur IS 'Concaténation de plusieurs attributs, avec valeurs des defaillance (au lieu du code stocké dans la table intervention)';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.type_si_in IS 'Signalement ou intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.etat_sign IS 'Etat du signalement (soumis, réglé...)';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.geom IS 'Géométrie du noeud su lequel est l''intervention/le signalement';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.affichage IS 'Texte de l''infobulle dans GEO';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.dat_signa IS 'Date du signalement';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.dat_real IS 'Date de réalisation de l''intervention';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.moy_interv IS 'Moyen d''intervention (avec ou sans nacelle)';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.observ IS 'Commentaires divers';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.typ_def IS 'Type de défaillance';
COMMENT ON COLUMN x_apps.xapps_geo_v_ecl_intervention_liste_affichage.type_inter IS 'Type d''intervention';


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

-- View: x_apps.xapps_an_v_ecl_stat_intervention

-- DROP VIEW x_apps.xapps_an_v_ecl_stat_intervention;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_stat_intervention AS 
 WITH req_annee AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            tint.code AS type,
            tint.valeur AS typ_int
           FROM m_reseau_sec.an_ecl_intervention "int",
            m_reseau_sec.lt_ecl_type_intervention tint
          WHERE "int".dat_real IS NOT NULL AND tint.code::text <> '00'::text
          GROUP BY "int".dat_real, tint.code, tint.valeur
          ORDER BY to_char("int".dat_real, 'YYYY'::text), tint.code
        ), r_ville AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            tint.code AS type,
            count(*) AS nb_int_ville
           FROM m_reseau_sec.an_ecl_intervention "int",
            m_reseau_sec.lt_ecl_type_intervention tint
          WHERE "int".type_si_in::text = '20'::text AND "int".type_inter::text ~~ (('%'::text || tint.code::text) || '%'::text) AND "int".id_contrat::text = 'ZZ'::text AND "int".dat_real >= '2019-09-01 00:00:00'::timestamp without time zone AND "int".dat_real IS NOT NULL
          GROUP BY to_char("int".dat_real, 'YYYY'::text), tint.code
        ), r_arc AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            tint.code AS type,
            count(*) AS nb_int_arc
           FROM m_reseau_sec.an_ecl_intervention "int",
            m_reseau_sec.lt_ecl_type_intervention tint
          WHERE "int".type_si_in::text = '20'::text AND "int".type_inter::text ~~ (('%'::text || tint.code::text) || '%'::text) AND "int".id_contrat::text = '03'::text AND "int".dat_real >= '2019-09-01 00:00:00'::timestamp without time zone AND "int".dat_real IS NOT NULL
          GROUP BY to_char("int".dat_real, 'YYYY'::text), "int".id_contrat, tint.code
        )
 SELECT row_number() OVER () AS id,
    a.typ_int AS type,
    a.annee,
        CASE
            WHEN r1.nb_int_arc IS NULL THEN 0::bigint
            ELSE r1.nb_int_arc
        END AS nb_int_arc,
        CASE
            WHEN r2.nb_int_ville IS NULL THEN 0::bigint
            ELSE r2.nb_int_ville
        END AS nb_int_ville,
        CASE
            WHEN r1.nb_int_arc IS NULL THEN 0::bigint
            ELSE r1.nb_int_arc
        END +
        CASE
            WHEN r2.nb_int_ville IS NULL THEN 0::bigint
            ELSE r2.nb_int_ville
        END AS nb_int_tot
   FROM req_annee a
     LEFT JOIN r_arc r1 ON a.type::text = r1.type::text AND a.annee = r1.annee
     LEFT JOIN r_ville r2 ON a.type::text = r2.type::text AND a.annee = r2.annee
  WHERE a.annee::integer >= 2019
  ORDER BY a.annee, a.type;

ALTER TABLE x_apps.xapps_an_v_ecl_stat_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO read_sig;
COMMENT ON VIEW x_apps.xapps_an_v_ecl_stat_intervention
  IS 'Compte des interventions selon le type et la zone de gestion';


-- View: x_apps.xapps_an_v_ecl_stat_intervention_total

-- DROP VIEW x_apps.xapps_an_v_ecl_stat_intervention_total;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_stat_intervention_total AS 
 WITH req_annee AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee
           FROM m_reseau_sec.an_ecl_intervention "int"
          WHERE "int".dat_real IS NOT NULL
          GROUP BY "int".dat_signa, "int".dat_real
          ORDER BY to_char("int".dat_real, 'YYYY'::text)
        ), req_total AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            count(*) AS nbr_inter
           FROM m_reseau_sec.an_ecl_intervention "int"
          WHERE "int".type_si_in::text = '20'::text AND "int".dat_real >= '2019-09-01 00:00:00'::timestamp without time zone AND ("int".id_contrat::text = 'ZZ'::text OR "int".id_contrat::text = '03'::text)
          GROUP BY to_char("int".dat_real, 'YYYY'::text)
          ORDER BY to_char("int".dat_real, 'YYYY'::text)
        ), req_total_secl AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            count(*) AS nbr_inter_secl
           FROM m_reseau_sec.an_ecl_intervention "int"
          WHERE "int".type_si_in::text = '20'::text AND "int".id_contrat::text = 'ZZ'::text AND "int".dat_real >= '2019-09-01 00:00:00'::timestamp without time zone AND "int".dat_real IS NOT NULL
          GROUP BY to_char("int".dat_real, 'YYYY'::text)
          ORDER BY to_char("int".dat_real, 'YYYY'::text)
        ), req_total_hecl AS (
         SELECT DISTINCT to_char("int".dat_real, 'YYYY'::text) AS annee,
            count(*) AS nbr_inter_hecl
           FROM m_reseau_sec.an_ecl_intervention "int"
          WHERE "int".type_si_in::text = '20'::text AND "int".id_contrat::text = '03'::text AND "int".dat_real >= '2019-09-01 00:00:00'::timestamp without time zone AND "int".dat_real IS NOT NULL
          GROUP BY to_char("int".dat_real, 'YYYY'::text)
          ORDER BY to_char("int".dat_real, 'YYYY'::text)
        )
 SELECT a.annee,
        CASE
            WHEN t.nbr_inter IS NULL THEN 0::bigint
            ELSE t.nbr_inter
        END AS nbr_inter,
        CASE
            WHEN secl.nbr_inter_secl IS NULL THEN 0::bigint
            ELSE secl.nbr_inter_secl
        END AS nbr_inter_secl,
        CASE
            WHEN hecl.nbr_inter_hecl IS NULL THEN 0::bigint
            ELSE hecl.nbr_inter_hecl
        END AS nbr_inter_hecl
   FROM req_annee a
     LEFT JOIN req_total t ON a.annee = t.annee
     LEFT JOIN req_total_secl secl ON a.annee = secl.annee
     LEFT JOIN req_total_hecl hecl ON a.annee = hecl.annee
  WHERE a.annee::integer >= 2019;

ALTER TABLE x_apps.xapps_an_v_ecl_stat_intervention_total
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention_total TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention_total TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_ecl_stat_intervention_total TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_ecl_stat_intervention_total TO read_sig;
COMMENT ON VIEW x_apps.xapps_an_v_ecl_stat_intervention_total
  IS 'Vue applicative formattant les indicateurs d''intervention';




-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                      VUES TABLEAU DE BORD                                                 ###
-- ###                                                                                                                           ###
-- #################################################################################################################################

-- View: x_apps.xapps_an_v_ecl_tb_patrimoine

-- DROP VIEW x_apps.xapps_an_v_ecl_tb_patrimoine;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_tb_patrimoine
 AS
 WITH req_pt_lumi AS (
         SELECT 1 AS gid,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_point_lumineux
          WHERE geo_v_ecl_point_lumineux.situation::text <> '12'::text
        ), req_foyer AS (
         SELECT 1 AS gid,
            count(*) AS nb
           FROM m_reseau_sec.an_ecl_foyer f,
            m_reseau_sec.geo_v_ecl_point_lumineux pl
          WHERE f.id_supp = pl.id_supp AND f.situation::text <> '12'::text
        ), req_cable AS (
         SELECT 1 AS gid,
            round(sum(st_length(geo_ecl_cable.geom))::numeric / 10000::numeric, 2) AS long_cable
           FROM m_reseau_sec.geo_ecl_cable
          WHERE geo_ecl_cable.situation::text <> '12'::text
        )
 SELECT 1 AS gid,
    req_pt_lumi.nb AS support,
    req_foyer.nb AS foyer,
    req_cable.long_cable AS cable
   FROM req_pt_lumi,
    req_foyer,
    req_cable
  WHERE req_pt_lumi.gid = req_foyer.gid AND req_pt_lumi.gid = req_cable.gid;

ALTER TABLE x_apps.xapps_an_v_ecl_tb_patrimoine
    OWNER TO create_sig;
COMMENT ON VIEW x_apps.xapps_an_v_ecl_tb_patrimoine
    IS 'Données nécessaire à la réalisation du tableau de bord dans l''application GEO';



-- View: x_apps.xapps_an_v_ecl_stat_patrimoine

-- DROP VIEW x_apps.xapps_an_v_ecl_stat_patrimoine;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_ecl_stat_patrimoine
 AS
 WITH req_ouvrage_arc AS (
         SELECT 'Ouvrage (total)'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND (geo_v_ecl_ouvrage_electrique.id_contrat::text = '03'::text OR geo_v_ecl_ouvrage_electrique.id_contrat::text = '93'::text)
        ), req_ouvrage_ville AS (
         SELECT 'Ouvrage (total)'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '03'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '93'::text
        ), req_ouvrage_serv AS (
         SELECT 'Ouvrage (total)'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND (geo_v_ecl_ouvrage_electrique.op_sai::text = 'mporte'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'slagache'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'ewiegant'::text)
        ), req_armoire_arc AS (
         SELECT 'dont armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '10'::text AND (geo_v_ecl_ouvrage_electrique.id_contrat::text = '03'::text OR geo_v_ecl_ouvrage_electrique.id_contrat::text = '93'::text)
        ), req_armoire_ville AS (
         SELECT 'dont armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '10'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '03'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '93'::text
        ), req_armoire_serv AS (
         SELECT 'dont armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '10'::text AND (geo_v_ecl_ouvrage_electrique.op_sai::text = 'mporte'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'slagache'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'ewiegant'::text)
        ), req_sous_armoire_arc AS (
         SELECT 'dont sous-armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '11'::text AND (geo_v_ecl_ouvrage_electrique.id_contrat::text = '03'::text OR geo_v_ecl_ouvrage_electrique.id_contrat::text = '93'::text)
        ), req_sous_armoire_ville AS (
         SELECT 'dont sous-armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '11'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '03'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '93'::text
        ), req_sous_armoire_serv AS (
         SELECT 'dont sous-armoire'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '11'::text AND (geo_v_ecl_ouvrage_electrique.op_sai::text = 'mporte'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'slagache'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'ewiegant'::text)
        ), req_transfo_arc AS (
         SELECT 'dont transformateur'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '20'::text AND (geo_v_ecl_ouvrage_electrique.id_contrat::text = '03'::text OR geo_v_ecl_ouvrage_electrique.id_contrat::text = '93'::text)
        ), req_transfo_ville AS (
         SELECT 'dont transformateur'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '20'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '03'::text AND geo_v_ecl_ouvrage_electrique.id_contrat::text <> '93'::text
        ), req_transfo_serv AS (
         SELECT 'dont transformateur'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_ouvrage_electrique
          WHERE geo_v_ecl_ouvrage_electrique.situation::text <> '12'::text AND geo_v_ecl_ouvrage_electrique.ty_ouvelec::text = '20'::text AND (geo_v_ecl_ouvrage_electrique.op_sai::text = 'mporte'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'slagache'::text OR geo_v_ecl_ouvrage_electrique.op_sai::text = 'ewiegant'::text)
        ), req_depart_arc AS (
         SELECT 'Départ'::text AS type,
            count(d.*) AS nb
           FROM m_reseau_sec.an_ecl_depart d,
            m_reseau_sec.geo_v_ecl_ouvrage_electrique o
          WHERE d.id_ouvelec = o.id_ouvelec AND d.situation::text <> '12'::text AND (o.id_contrat::text = '03'::text OR o.id_contrat::text = '93'::text)
        ), req_depart_ville AS (
         SELECT 'Départ'::text AS type,
            count(d.*) AS nb
           FROM m_reseau_sec.an_ecl_depart d,
            m_reseau_sec.geo_v_ecl_ouvrage_electrique o
          WHERE d.id_ouvelec = o.id_ouvelec AND d.situation::text <> '12'::text AND o.id_contrat::text <> '03'::text AND o.id_contrat::text <> '93'::text
        ), req_depart_serv AS (
         SELECT 'Départ'::text AS type,
            count(d.*) AS nb
           FROM m_reseau_sec.an_ecl_depart d,
            m_reseau_sec.geo_v_ecl_ouvrage_electrique o
          WHERE d.id_ouvelec = o.id_ouvelec AND d.situation::text <> '12'::text AND (d.op_sai::text = 'mporte'::text OR d.op_sai::text = 'slagache'::text OR d.op_sai::text = 'ewiegant'::text)
        ), req_pt_lumi_arc AS (
         SELECT 'Support'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_point_lumineux
          WHERE geo_v_ecl_point_lumineux.situation::text <> '12'::text AND (geo_v_ecl_point_lumineux.id_contrat::text = '03'::text OR geo_v_ecl_point_lumineux.id_contrat::text = '93'::text)
        ), req_pt_lumi_ville AS (
         SELECT 'Support'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_point_lumineux
          WHERE geo_v_ecl_point_lumineux.situation::text <> '12'::text AND geo_v_ecl_point_lumineux.id_contrat::text <> '03'::text AND geo_v_ecl_point_lumineux.id_contrat::text <> '93'::text
        ), req_pt_lumi_serv AS (
         SELECT 'Support'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_point_lumineux
          WHERE geo_v_ecl_point_lumineux.situation::text <> '12'::text AND (geo_v_ecl_point_lumineux.op_sai::text = 'mporte'::text OR geo_v_ecl_point_lumineux.op_sai::text = 'slagache'::text OR geo_v_ecl_point_lumineux.op_sai::text = 'ewiegant'::text)
        ), req_foyer_arc AS (
         SELECT 'Foyer'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.an_ecl_foyer f,
            m_reseau_sec.geo_v_ecl_point_lumineux pl
          WHERE f.id_supp = pl.id_supp AND f.situation::text <> '12'::text AND (pl.id_contrat::text = '03'::text OR pl.id_contrat::text = '93'::text)
        ), req_foyer_ville AS (
         SELECT 'Foyer'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.an_ecl_foyer f,
            m_reseau_sec.geo_v_ecl_point_lumineux pl
          WHERE f.id_supp = pl.id_supp AND f.situation::text <> '12'::text AND pl.id_contrat::text <> '03'::text AND pl.id_contrat::text <> '93'::text
        ), req_foyer_serv AS (
         SELECT 'Foyer'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.an_ecl_foyer f,
            m_reseau_sec.geo_v_ecl_point_lumineux pl
          WHERE f.id_supp = pl.id_supp AND f.situation::text <> '12'::text AND (f.op_sai::text = 'mporte'::text OR f.op_sai::text = 'slagache'::text OR f.op_sai::text = 'ewiegant'::text)
        ), req_pt_int_arc AS (
         SELECT 'Point d''intérêt'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_pi
          WHERE geo_v_ecl_pi.situation::text <> '12'::text AND (geo_v_ecl_pi.id_contrat::text = '03'::text OR geo_v_ecl_pi.id_contrat::text = '93'::text)
        ), req_pt_int_ville AS (
         SELECT 'Point d''intérêt'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_pi
          WHERE geo_v_ecl_pi.situation::text <> '12'::text AND geo_v_ecl_pi.id_contrat::text <> '03'::text AND geo_v_ecl_pi.id_contrat::text <> '93'::text
        ), req_pt_int_serv AS (
         SELECT 'Point d''intérêt'::text AS type,
            count(*) AS nb
           FROM m_reseau_sec.geo_v_ecl_pi
          WHERE geo_v_ecl_pi.situation::text <> '12'::text AND (geo_v_ecl_pi.op_sai::text = 'mporte'::text OR geo_v_ecl_pi.op_sai::text = 'slagache'::text OR geo_v_ecl_pi.op_sai::text = 'ewiegant'::text)
        ), req_cable_arc AS (
         SELECT 'Linéaire de câble**'::text AS type,
            round(sum(st_length(geo_ecl_cable.geom))::numeric / 10000::numeric, 2) AS long_cable
           FROM m_reseau_sec.geo_ecl_cable
          WHERE geo_ecl_cable.situation::text <> '12'::text AND (geo_ecl_cable.id_contrat::text = '03'::text OR geo_ecl_cable.id_contrat::text = '93'::text)
        ), req_cable_ville AS (
         SELECT 'Linéaire de câble**'::text AS type,
            round(sum(st_length(geo_ecl_cable.geom))::numeric / 10000::numeric, 2) AS long_cable
           FROM m_reseau_sec.geo_ecl_cable
          WHERE geo_ecl_cable.situation::text <> '12'::text AND geo_ecl_cable.id_contrat::text <> '03'::text AND geo_ecl_cable.id_contrat::text <> '93'::text
        ), req_cable_serv AS (
         SELECT 'Linéaire de câble**'::text AS type,
            round(sum(st_length(geo_ecl_cable.geom))::numeric / 10000::numeric, 2) AS long_cable
           FROM m_reseau_sec.geo_ecl_cable
          WHERE geo_ecl_cable.situation::text <> '12'::text AND (geo_ecl_cable.op_sai::text = 'mporte'::text OR geo_ecl_cable.op_sai::text = 'slagache'::text OR geo_ecl_cable.op_sai::text = 'ewiegant'::text)
        )
 SELECT 1 AS gid,
    req_ouvrage_arc.type,
    req_ouvrage_arc.nb AS nb_arc,
    req_ouvrage_ville.nb AS nb_ville,
    req_ouvrage_arc.nb + req_ouvrage_ville.nb AS total,
    req_ouvrage_serv.nb AS nb_serv
   FROM req_ouvrage_arc,
    req_ouvrage_ville,
    req_ouvrage_serv
  WHERE req_ouvrage_arc.type = req_ouvrage_ville.type AND req_ouvrage_arc.type = req_ouvrage_serv.type
UNION ALL
 SELECT 2 AS gid,
    req_armoire_arc.type,
    req_armoire_arc.nb AS nb_arc,
    req_armoire_ville.nb AS nb_ville,
    req_armoire_arc.nb + req_armoire_ville.nb AS total,
    req_armoire_serv.nb AS nb_serv
   FROM req_armoire_arc,
    req_armoire_ville,
    req_armoire_serv
  WHERE req_armoire_arc.type = req_armoire_ville.type AND req_armoire_arc.type = req_armoire_serv.type
UNION ALL
 SELECT 3 AS gid,
    req_sous_armoire_arc.type,
    req_sous_armoire_arc.nb AS nb_arc,
    req_sous_armoire_ville.nb AS nb_ville,
    req_sous_armoire_arc.nb + req_sous_armoire_ville.nb AS total,
    req_sous_armoire_serv.nb AS nb_serv
   FROM req_sous_armoire_arc,
    req_sous_armoire_ville,
    req_sous_armoire_serv
  WHERE req_sous_armoire_arc.type = req_sous_armoire_ville.type AND req_sous_armoire_arc.type = req_sous_armoire_serv.type
UNION ALL
 SELECT 4 AS gid,
    req_transfo_arc.type,
    req_transfo_arc.nb AS nb_arc,
    req_transfo_ville.nb AS nb_ville,
    req_transfo_arc.nb + req_transfo_ville.nb AS total,
    req_transfo_serv.nb AS nb_serv
   FROM req_transfo_arc,
    req_transfo_ville,
    req_transfo_serv
  WHERE req_transfo_arc.type = req_transfo_ville.type AND req_transfo_arc.type = req_transfo_serv.type
UNION ALL
 SELECT 5 AS gid,
    req_depart_arc.type,
    req_depart_arc.nb AS nb_arc,
    req_depart_ville.nb AS nb_ville,
    req_depart_arc.nb + req_depart_ville.nb AS total,
    req_depart_serv.nb AS nb_serv
   FROM req_depart_arc,
    req_depart_ville,
    req_depart_serv
  WHERE req_depart_arc.type = req_depart_ville.type AND req_depart_arc.type = req_depart_serv.type
UNION ALL
 SELECT 6 AS gid,
    req_pt_lumi_arc.type,
    req_pt_lumi_arc.nb AS nb_arc,
    req_pt_lumi_ville.nb AS nb_ville,
    req_pt_lumi_arc.nb + req_pt_lumi_ville.nb AS total,
    req_pt_lumi_serv.nb AS nb_serv
   FROM req_pt_lumi_arc,
    req_pt_lumi_ville,
    req_pt_lumi_serv
  WHERE req_pt_lumi_arc.type = req_pt_lumi_ville.type AND req_pt_lumi_arc.type = req_pt_lumi_serv.type
UNION ALL
 SELECT 7 AS gid,
    req_foyer_arc.type,
    req_foyer_arc.nb AS nb_arc,
    req_foyer_ville.nb AS nb_ville,
    req_foyer_arc.nb + req_foyer_ville.nb AS total,
    req_foyer_serv.nb AS nb_serv
   FROM req_foyer_arc,
    req_foyer_ville,
    req_foyer_serv
  WHERE req_foyer_arc.type = req_foyer_ville.type AND req_foyer_arc.type = req_foyer_serv.type
UNION ALL
 SELECT 8 AS gid,
    req_pt_int_arc.type,
    req_pt_int_arc.nb AS nb_arc,
    req_pt_int_ville.nb AS nb_ville,
    req_pt_int_arc.nb + req_pt_int_ville.nb AS total,
    req_pt_int_serv.nb AS nb_serv
   FROM req_pt_int_arc,
    req_pt_int_ville,
    req_pt_int_serv
  WHERE req_pt_int_arc.type = req_pt_int_ville.type AND req_pt_int_arc.type = req_pt_int_serv.type
UNION ALL
 SELECT 9 AS gid,
    req_cable_arc.type,
    req_cable_arc.long_cable AS nb_arc,
    req_cable_ville.long_cable AS nb_ville,
    req_cable_arc.long_cable + req_cable_ville.long_cable AS total,
    req_cable_ville.long_cable AS nb_serv
   FROM req_cable_arc,
    req_cable_ville,
    req_cable_serv
  WHERE req_cable_arc.type = req_cable_ville.type AND req_cable_arc.type = req_cable_serv.type;

ALTER TABLE x_apps.xapps_an_v_ecl_stat_patrimoine
    OWNER TO create_sig;
COMMENT ON VIEW x_apps.xapps_an_v_ecl_stat_patrimoine
    IS 'Bilan du patrimoine numérique d''éclairage public';
														


