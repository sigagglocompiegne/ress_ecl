 
/*ECL V1.0*/
/*Creation des vues et triggers nécessaires à la gestion via l'application web-métier */
/*ECL_20_VUES_GESTION.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau + Grégory Bodet*/

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

--TRIGGERS

DROP TRIGGER IF EXISTS t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ouvrage_electrique;

DROP TRIGGER IF EXISTS t_t1_lk_point_lumineux ON m_reseau_sec.geo_v_point_lumineux;

DROP TRIGGER IF EXISTS t_t1_point_interet ON m_reseau_sec.geo_v_pi;


--VUES

DROP VIEW IF EXISTS m_reseau_sec.geo_v_ouvrage_electrique;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_point_lumineux;

DROP VIEW IF EXISTS m_reseau_sec.geo_v_pi;



-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                      VUES DE GESTION                                                      ###
-- ###                                                                                                                           ###
-- #################################################################################################################################


--##############################################################OUVELEC#############################################################
-- View: m_reseau_sec.geo_v_ecl_ouvrage_electrique

-- DROP VIEW m_reseau_sec.geo_v_ecl_ouvrage_electrique;

CREATE OR REPLACE VIEW m_reseau_sec.geo_v_ecl_ouvrage_electrique AS 
 SELECT ouvelec.id_ouvelec,
    ouvelec.nom_ouv,
    ouvelec.ty_ouvelec,
    noeud.depart,
    ouvelec.etat_ouvel,
    ouvelec.mod_pos_ou,
    ouvelec.ty_comm,
    ouvelec.pdl_edf,
    ouvelec.n_com_edf,
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
    noeud.observ,
    noeud.geom,
    noeud.op_sai,
    noeud.date_donne,
    noeud.op_sai_geo,
    noeud.qua_geo_xy,
    noeud.qua_geo_z,
    noeud.src_geom,
    noeud.src_date,
    noeud.situation,
    noeud.date_sai,
    noeud.date_maj,
    noeud.exploit_nd,
    noeud.presta_nd,
    noeud.id_contrat,
    noeud.commune,
    noeud.insee
   FROM m_reseau_sec.an_ecl_ouvrage_electrique ouvelec
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON ouvelec.id_ouvelec = noeud.id_noeud;

ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO read_sig;
COMMENT ON VIEW m_reseau_sec.geo_v_ecl_ouvrage_electrique
  IS 'Vue des ouvrages électriques permettant la saisie dans l''application Geo';
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN ty_ouvelec SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN etat_ouvel SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN mod_pos_ou SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN ty_comm SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN pres_var SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN qua_dat SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN ty_disjonc SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN ty_fusible SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN qua_geo_xy SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN qua_geo_z SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN src_geom SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN src_date SET DEFAULT '0000'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN situation SET DEFAULT '10'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique ALTER COLUMN id_contrat SET DEFAULT '00'::character varying;

COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.id_ouvelec IS 'Identifiant de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.nom_ouv IS 'Nom métier de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ty_ouvelec IS 'Type de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.etat_ouvel IS 'Etat de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.mod_pos_ou IS 'Mode de pose de l''ouvrage électrique';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ty_comm IS 'Type de commande d''allumage/extinction';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.pdl_edf IS 'Numéro de référence EDF';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.n_com_edf IS 'Numéro du compteur EDF';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.val_terre IS 'Valeur globale de la terre';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ik_ouvelec IS 'Indice de protection face aux influences extérieures';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ip_ouvelec IS 'Indice de protection eux chocs mécaniques';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.puis_mes IS 'Puissance mesurée';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.puis_sous IS 'Puissance souscrite';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.pres_var IS 'Présence d''un variateur';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ent_pose IS 'Entreprise ayant posé l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.dat_pos IS 'Date de pose de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.qua_dat IS 'Qualité de la date de pose de l''ouvrage';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ty_disjonc IS 'Type du disjoncteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.geom IS 'Géométrie de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.date_donne IS 'Date de la création de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.op_sai_geo IS 'Opérateur de la saisie des données de géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.qua_geo_xy IS 'Classe de la géolocalisation en XY';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.qua_geo_z IS 'Classe de la géolocalisation en Z';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.src_geom IS 'Source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.src_date IS 'Date de la source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.situation IS 'Situation générale : actif, inactif,supprimé';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.exploit_nd IS 'Exploitant de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.presta_nd IS 'Prestataire intervenant sur l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.id_contrat IS 'Code du contrat de maintenant et/ou d''entretien en cours';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.commune IS 'Commune sur laquelle est situé l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_ouvrage_electrique.insee IS 'Code insee de la commune sur laquelle se situe l''objet';





---

--- SUPPRESSION DES MESSAGES D'ERREUR
--- On force certains attributs
--- GESTION DES CONTRAINTES DE SAISIE avec génération de messages d'erreurs
--- Contrôle de la topologie 
--- Ventilation des données aux tables Noeuds et ouvrages électriques
--- En cas de DELETE, attribut situation passe à 'supprimer' --> Le point n'est donc pas réellement supprimé.
--- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.
--- L'insertion des logs se fait également dans cette fonction

-- Function: m_reseau_sec.ft_m_ouvrage_electrique()

-- DROP FUNCTION m_reseau_sec.ft_m_ouvrage_electrique();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_ouvrage_electrique()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;

--- variable pour un log
DECLARE v_idlog integer;
DECLARE v_dataold character varying(1000);
DECLARE v_datanew character varying(1000);
DECLARE v_name_table character varying(254);

BEGIN 

---

DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

---

IF (TG_OP = 'INSERT') THEN --------------------------------------------------- Si c'est un INSERT

	id_unique = nextval('m_reseau_sec.ecl_objet_seq');

	--
	
	NEW.date_donne = now();
	NEW.op_sai_geo = NEW.op_sai;
	NEW.qua_geo_Z = '30';
	NEW.qua_geo_XY = '30';
	NEW.src_geom = '20'; ---Orthophotographie
	NEW.src_date = '2018';
	NEW.situation = '10';

		--

	IF (NEW.dat_pos > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle

		NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(id_unique, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche

	END IF;
	
		--
		
	IF (NEW.ik_ouvelec > 10::integer) THEN -------------------------------------------------------------------- Si l'IK est supérieur à 10, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.ik_ouvelec=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(id_unique, 'L''IK ne peut pas être supérieur à 10 ', now() );

	END IF;

		--

	IF (NEW.ip_ouvelec > 69::integer) THEN -------------------------------------------------------------------- Si l'IP est supérieur à 69, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.ip_ouvelec=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(id_unique, 'L''IP ne peut pas être supérieur à 69 ', now() );

	END IF;

		--

	IF (NEW.val_terre > 1000::integer) THEN -------------------------------------------------------------------- Si la valeur de la terre est supérieure à 1000, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL
		NEW.val_terre=NULL;
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(id_unique, 'La valeur de la terre doit être inférieure à 1000', now() );
	END IF;

		--
	
	IF (NEW.puis_mes > 10000::integer) THEN -------------------------------------------------------------------- Si la puissance mesuréeest supérieure à 10000, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL
		NEW.puis_mes=NULL;
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(id_unique, 'La puissance mesurée doit être inférieure à 10 000 ', now() );
	END IF;

		--
	
	IF ((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') < 1 )  THEN -- S'il n'y a pas d'autre noeud dont la géométrie est égale

	
		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_ouvelec, 'L''objet est en dehors des zones de gestion. Contacter le SIG pour modifier les zones de gestion.', now() );
			RETURN OLD ;

		END IF;

		--

		NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
		NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune

		--

		IF (NEW.ty_ouvelec = '10') THEN ------------------------- Si l'ouvrage est une armoire principale, il ne peut être relié à un départ
			NEW.depart=NULL;
		END IF;

		--

		IF (NEW.nom_ouv = '') THEN ---------------------------- GEO retourne '' au lieu de NULL, on surcorrige pour éviter la contrainte UNIQUE
			NEW.nom_ouv=NULL;
		END IF;

		--

		IF (NEW.ty_ouvelec <>'10') THEN------------------------- Si l'ouvrage n'est pas une armoire principale, son type de commande, et ses caractéristiques EDF sont automatiquement complétés
			NEW.ty_comm='ZZ';
			NEW.pdl_edf=NULL;
			NEW.n_com_edf=NULL;
		END IF;

		--

		---On insère les données normalement dans noeud, avec une date de mise à jour des données = NULL.
		INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,commune, insee, exploit_nd, presta_nd,ent_pose,dat_pos,qua_dat, geom,op_sai,
							depart, observ, date_sai, date_maj,date_donne,op_sai_geo,qua_geo_Z,qua_geo_XY, src_geom, src_date,situation,id_contrat )
			SELECT
			id_unique,
			NEW.commune,
			NEW.insee,
			NEW.exploit_nd,
			CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
			NEW.ent_pose,
			NEW.dat_pos,
			NEW.qua_dat,
			NEW.geom,
			NEW.op_sai,
			NEW.depart,
			NEW.observ,
			now(),
			NULL,
			NEW.date_donne,
			NEW.op_sai_geo,
			NEW.qua_geo_Z,
			NEW.qua_geo_XY,
			NEW.src_geom,
			NEW.src_date,
			NEW.situation,
			NEW.id_contrat; -------------------------------------------------- On insère les données normalement dans noeud

		--

		IF (NEW.ty_ouvelec <> '10' AND NEW.depart IS NOT NULL)  THEN ------------------------- Si l'ouvrage n'est pas une armoire principale et le depart n'est pas NULL	
		
			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire; ---- On actualise la vue du "cheminement électricité"

		END IF;

		--
			
		INSERT INTO m_reseau_sec.an_ecl_ouvrage_electrique (
			id_ouvelec,
			nom_ouv,
			ty_ouvelec,
			etat_ouvel,
			mod_pos_ou, 
			ty_comm, 
			pdl_edf,
			n_com_edf,
			val_terre,
			ik_ouvelec,
			ip_ouvelec,
			puis_mes,
			puis_sous,
			pres_var,
			ty_disjonc,
			ty_fusible
			)
		SELECT
			id_unique,
			NEW.nom_ouv,
			NEW.ty_ouvelec,
			NEW.etat_ouvel,
			NEW.mod_pos_ou,
			NEW.ty_comm,
			NEW.pdl_edf,
			NEW.n_com_edf,
			NEW.val_terre,
			NEW.ik_ouvelec,
			NEW.ip_ouvelec,
			NEW.puis_mes,
			NEW.puis_sous,
			NEW.pres_var,
			NEW.ty_disjonc,
			NEW.ty_fusible				
			;----------------------------------------------------------- On insére les données dans ouvrage électrique normalement

		---
		
		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_ini= new.id_ouvelec
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) AND situation <> '12' ;

		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_fin= new.id_ouvelec
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) AND situation <> '12' ;


		
	ELSE ---- Si la topologie de la saisie n'est pas valide
	
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.', now() );

		RETURN OLD ;

	END IF;

	--- log
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

RETURN NEW;

ELSIF (TG_OP= 'UPDATE') THEN --------------------------------------------------- Si c'est un UPDATE


        
        IF ST_equals(new.geom,old.geom) is false AND new.qua_geo_xy = '10' THEN
	INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)----------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_ouvelec, 'Vous ne pouvez pas modifier la géométrie d''un objet en classe A', now() );--- Ce message, qui apparaît dans GEO sur la fiche départ

		new.geom = old.geom;
	ELSE
	NEW.date_maj = now(); ---------------------------------- On attribue la date actuelle à la date de dernière mise à jour.
	END IF;

	---

	IF (NEW.date_donne > now()::timestamp) THEN ----------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle

		NEW.date_donne=OLD.date_donne; --------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_ouvelec, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );-- Ce message, qui apparaît dans GEO sur la fiche

	END IF;

		--

	IF (NEW.dat_pos > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle

		NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_ouvelec, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche

	END IF;
	
		--
		
	IF (NEW.ik_ouvelec > 10::integer) THEN -------------------------------------------------------------------- Si l'IK est supérieur à 10, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.ik_ouvelec=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'L''IK ne peut pas être supérieur à 10 ', now() );

	END IF;

		--

	IF (NEW.ip_ouvelec > 69::integer) THEN -------------------------------------------------------------------- Si l'IP est supérieur à 69, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.ip_ouvelec=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'L''IP ne peut pas être supérieur à 69 ', now() );

	END IF;

		--

	IF (NEW.val_terre > 1000::integer) THEN -------------------------------------------------------------------- Si la valeur de la terre est supérieure à 1000, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.val_terre=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'La valeur de la terre doit être inférieure à 1000', now() );

	END IF;

		--
	
	IF (NEW.puis_mes > 10000::integer) THEN -------------------------------------------------------------------- Si la puissance mesurée est supérieure à 10000, on met un message d'erreur dans la fiche GEO et on surcorrige par la valeur NULL

		NEW.puis_mes=NULL;

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'La puissance mesurée doit être inférieure à 10 000 ', now() );

	END IF;

	--

		--

	NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
	NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune

		--

	IF (NEW.ty_ouvelec = '10') THEN ------------------------- Si l'ouvrage est une armoire principale, il ne peut être relié à un départ
		NEW.depart=NULL;
	END IF;

		--

	IF (NEW.nom_ouv = '') THEN ---------------------------- GEO retourne '' au lieu de NULL, on surcorrige pour éviter la contrainte UNIQUE
		NEW.nom_ouv=NULL;
	END IF;

		--

	IF (NEW.ty_ouvelec <>'10') THEN------------------------- Si l'ouvrage n'est pas une armoire principale, son type de commande, et ses caractéristiques EDF sont automatiquement complétés
		NEW.ty_comm='ZZ';
		NEW.pdl_edf=NULL;
		NEW.n_com_edf=NULL;
	END IF;

		--

	IF (NEW.ty_ouvelec ='10' AND OLD.ty_ouvelec <> '10') THEN ---Si l'ouvrage n'était pas une armoire mais en devient une, le type de commande passe à non renseigné.
		NEW.ty_comm='00';
	END IF;

		--
		
		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_ouvelec, 'L''objet est en dehors des zones de gestion. Contacter le SIG pour modifier les zones de gestion.', now() );
			RETURN OLD ;

		END IF;

		--


	IF (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') < 1 )
	      OR ( (NEW.geom = OLD.geom) AND ((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') = 1 ) AND (OLD.situation <>'12')))  THEN -- S'il n'y a pa d'autre noeud dont la géométrie est égale


		UPDATE m_reseau_sec.geo_ecl_noeud 
		SET 
		ent_pose = NEW.ent_pose,
		commune =NEW.commune,
		date_donne=NEW.date_donne,
		op_sai=NEW.op_sai,
		insee = NEW.insee,
		exploit_nd = NEW.exploit_nd,
		presta_nd = CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
		id_contrat = NEW.id_contrat,
		dat_pos=NEW.dat_pos,
		qua_dat=NEW.qua_dat,
		geom=NEW.geom, 
		observ=NEW.observ,
		date_maj=now(),
		depart = NEW.depart,
		situation = NEW.situation,
		qua_geo_Z = NEW.qua_geo_Z,
		qua_geo_XY = NEW.qua_geo_XY,
		src_geom = NEW.src_geom,
		src_date = NEW.src_date,
		op_sai_geo = NEW.op_sai_geo
		WHERE id_noeud=NEW.id_ouvelec; ----------------------------------------- On insére toutes les données normalement dans noeud

		---

		IF ( (NEW.depart <> OLD.depart) OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) )THEN
		------------------------------------------------------------------------- Si le nouveau départ auquel est lié l'ouvrage est différent de l'ancien
			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"
		END IF;

		
		---

		UPDATE m_reseau_sec.an_ecl_ouvrage_electrique 
		SET 
		nom_ouv=NEW.nom_ouv,
		ty_ouvelec=NEW.ty_ouvelec,
		etat_ouvel=NEW.etat_ouvel,
		mod_pos_ou=NEW.mod_pos_ou,
		ty_comm=NEW.ty_comm, 
		pdl_edf=NEW.pdl_edf,
		n_com_edf=NEW.n_com_edf,
		val_terre=NEW.val_terre,
		ik_ouvelec=NEW.ik_ouvelec,
		ip_ouvelec=NEW.ip_ouvelec,
		puis_mes=NEW.puis_mes,
		puis_sous=NEW.puis_sous,
		pres_var=NEW.pres_var,
		ty_disjonc=NEW.ty_disjonc,
		ty_fusible=NEW.ty_fusible
		 --------------------------------------------------------- On insére toutes les données normalement
		WHERE id_ouvelec=NEW.id_ouvelec;

		---

		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_ini= new.id_ouvelec
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) AND situation <> '12';

		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_fin= new.id_ouvelec
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) AND situation <> '12' ;

		---

		IF (NEW.situation = '11') THEN ----------------------------------------------- Si l'objet passe en Inactif

			UPDATE m_reseau_sec.an_ecl_depart ------------------------------------ On change l'attribut situation des départs de l'ouvrage en inactif
			SET 
			situation = '11'
			WHERE id_ouvelec = NEW.id_ouvelec AND situation <> '12';

			UPDATE m_reseau_sec.geo_ecl_noeud ------------------------------------ On met enlève les liens entre les noeuds et les départs de l'armoire
			SET
			situation = '11'
			WHERE depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec) AND situation <> '12';

			UPDATE m_reseau_sec.an_ecl_foyer ------------------------------------- On change l'attribut situation des foyers liés à l'ouvrage en inactif
			SET 
			situation = '11'
			WHERE id_supp IN (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE (depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec) AND situation <> '12'));

			UPDATE m_reseau_sec.geo_ecl_cable ------------------------------------ On change l'attribut situation des cables liés à l'ouvrage en inactif
			SET 
			situation = '11'
			WHERE id_nd_fin IN (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE (depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec) AND situation <> '12')) 
			      AND situation <> '12';
	

			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- On actualise la vue du "chemin d'électricité"

		END IF;

		--

		IF ((OLD.situation = '11' OR OLD.situation = '12') AND NEW.situation='10') THEN ---Si l'armoire est réactivée

			UPDATE m_reseau_sec.an_ecl_depart ------------------------------------ On change l'attribut situation dans la table 
			SET 
			situation = '10'
			WHERE id_ouvelec = NEW.id_ouvelec AND situation <> '12';

			UPDATE m_reseau_sec.geo_ecl_noeud ------------------------------------ On  réctive les noeuds liés aux départs de l'armoire
			SET
			situation = '10'
			WHERE (depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec)) 
                       AND (situation <> '12') ;

			UPDATE m_reseau_sec.an_ecl_foyer ------------------------------------- On change l'attribut situation des foyers liés à l'ouvrage en inactif
			SET 
			situation = '10'
			WHERE id_supp IN (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE (depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec) AND situation <> '12'));

			UPDATE m_reseau_sec.geo_ecl_cable ------------------------------------ On change l'attribut situation des cables liés à l'ouvrage en inactif
			SET 
			situation = '10'
			WHERE id_nd_fin IN (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE (depart IN (SELECT dep.id_depart FROM m_reseau_sec.an_ecl_depart dep WHERE dep.id_ouvelec=NEW.id_ouvelec) AND situation <> '12')) 
			      AND situation <> '12';

		END IF;



	ELSE --- Si la topologie n'est pas valide
	
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_ouvelec, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.', now() );

		RETURN OLD ;

	END IF;

	--- log
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
	
ELSIF (TG_OP = 'DELETE') THEN --------------------------------------------------- Si c'est un UPDATE


	UPDATE m_reseau_sec.geo_ecl_noeud --- En cas de suppression on change juste la situation de l'objet
	SET
	situation = '12'
	WHERE OLD.id_ouvelec=id_noeud;

	---On enlève les liens avec le câble,
	UPDATE m_reseau_sec.geo_ecl_cable
	SET id_nd_ini= NULL
	WHERE ST_equals(OLD.geom,ST_StartPoint(geom)) ;

	UPDATE m_reseau_sec.geo_ecl_cable
	SET id_nd_fin= NULL
	WHERE ST_equals(OLD.geom,ST_EndPoint(geom)) ;
	
	--- On supprime les départs, ce qui change leur situation à '12'
	DELETE FROM m_reseau_sec.an_ecl_depart WHERE id_ouvelec = OLD.id_ouvelec;

	--- log
	v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);

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
ALTER FUNCTION m_reseau_sec.ft_m_ouvrage_electrique()
  OWNER TO sig_create;



					     
-- Trigger: t_t1_lk_ouvrage_electrique on m_reseau_sec.geo_v_ecl_ouvrage_electrique

-- DROP TRIGGER t_t1_lk_ouvrage_electrique ON m_reseau_sec.geo_v_ecl_ouvrage_electrique;

CREATE TRIGGER t_t1_lk_ouvrage_electrique
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_ecl_ouvrage_electrique
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_ouvrage_electrique();
					     
--##############################################################POINT LUMINEUX######################################################
--DROP VIEW m_reseau_sec.geo_v_point_lumineux ;
CREATE OR REPLACE VIEW m_reseau_sec.geo_v_ecl_point_lumineux AS 
 SELECT 
	supp.id_supp, 
	noeud.depart,
	supp.id_mod_sup, 
	supp.ty_supp ,
	supp.opt_supp ,
	supp.ty_parasu ,
	supp.etat_supp ,
	supp.haut_trap  ,
	supp.ty_fusible  ,
	noeud.ent_pose ,
	noeud.dat_pos,
	noeud.qua_dat,
	supp.haut_supp  ,
	noeud.observ,
	noeud.geom,
	noeud.op_sai,
	supp.ty_disjonc,
	noeud.date_donne,
	noeud.op_sai_geo,
	noeud.qua_geo_XY,
        noeud.qua_geo_Z,
        noeud.src_geom,
        noeud.src_date,
        noeud.situation,
        noeud.date_sai,
        noeud.date_maj,
        supp.nbr_foyer,
        noeud.exploit_nd,
        noeud.presta_nd
        noeud.id_contrat,
        noeud.commune,
        noeud.insee       
 FROM m_reseau_sec.an_ecl_support supp
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON supp.id_supp = noeud.id_noeud;

--- '00' = "non renseigné" dans les domaines de valeurs
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_supp SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_parasu SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER etat_supp SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_fusible SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER qua_dat SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER ty_disjonc SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER id_mod_sup SET DEFAULT '1'; --- Modèle par défaut ajouté automatiquement dans la table modèle
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER qua_geo_XY SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER qua_geo_Z SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER src_geom SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER src_date SET DEFAULT '0000';
ALTER VIEW m_reseau_sec.geo_v_point_lumineux ALTER situation SET DEFAULT '10';
ALTER TABLE m_reseau_sec.geo_v_ecl_point_lumineux ALTER COLUMN id_contrat SET DEFAULT '00'::character varying;
ALTER TABLE m_reseau_sec.geo_v_ecl_point_lumineux ALTER COLUMN haut_trap SET DEFAULT '00'::character varying;

--- SUPPRESSION DES MESSAGES D'ERREUR
--- On force certains attributs
--- GESTION DES CONTRAINTES DE SAISIE avec génération de messages d'erreurs
--- Contrôle de la topologie 
--- Ventilation des données aux tables Noeuds et Support
--- En cas de DELETE, attribut situation passe à 'supprimer' --> Le point n'est donc pas réellement supprimé.
--- L'insertion des logs se fait également dans cette fonction					 
--- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.
-- Function: m_reseau_sec.ft_m_point_lumineux()


-- Function: m_reseau_sec.ft_m_point_lumineux()

-- DROP FUNCTION m_reseau_sec.ft_m_point_lumineux();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_point_lumineux()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;

--- variable pour les logs
DECLARE v_idlog integer;
DECLARE v_dataold character varying(2000);
DECLARE v_datanew character varying(2000);
DECLARE v_name_table character varying(254);


BEGIN

---


IF (TG_OP = 'INSERT') THEN ------ Si c'est un INSERT

	id_unique = nextval('m_reseau_sec.ecl_objet_seq');

	NEW.date_donne = now();
	NEW.qua_geo_Z = '30'; --- Classe C
	NEW.qua_geo_XY = '30';--- Classe C
	NEW.src_geom = '20'; ---- Orthophotographie
	NEW.src_date = '2018';--- 
	NEW.situation = '10';---- Actif
	
	---

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

	IF (NEW.date_donne > now()::timestamp) THEN ----------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
		NEW.date_donne=NULL; --------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(id_unique, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );-- Ce message, qui apparaît dans GEO sur la fiche
	END IF;

		---

	IF (NEW.dat_pos > now()::timestamp) THEN --------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle
		NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(id_unique, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche
	END IF;
		---

	IF (NEW.haut_supp > 30::integer) THEN ---------------------------------------Si la hauteur est supérieure à 30 mètres, on met un message d'erreur et on atttribue une valeur NULL
		
		NEW.haut_supp=NULL;
			
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(id_unique, 'Le support doit faire moins de 30 mètres', now() );

	END IF;

	---

	IF (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12' ) < 1 )
	   OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom)AND situation <> '12') = 1) AND 
	       (( SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi))
	      )   
	   )  THEN 
	   -- S'il n'y a pas d'autre noeud dont la géométrie est égale et la situation est Actif ou inatif, ou bien s'il y a un autre noeud au même endroit et que c'est un point d'intérêt

		--

		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee
			

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_supp, 'L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.', now() );
			RETURN OLD ;

		END IF;
		
		NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
		NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune

		--

		IF (NEW.ty_supp <> '10') THEN ---- Si le support n'est pas un mât, on change les attributs n'ayant de sens que pour un mât
		
			NEW.opt_supp = NULL; --- Les options accrochées au support
			NEW.haut_trap='ZZ';----- La hauteur de la trappe
			NEW.id_mod_sup='1';----- Le modèle de mât
			
		END IF;

		--

		---On insère les données normalement dans noeud, avec une date de mise à jour des données = NULL.
		INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,commune, insee, exploit_nd, presta_nd,ent_pose,dat_pos,qua_dat, geom,op_sai,
							depart, observ, date_sai, date_maj,date_donne,op_sai_geo,qua_geo_Z,qua_geo_XY, src_geom, src_date,situation,id_contrat)
			SELECT
			id_unique,
			NEW.commune,
			NEW.insee,
			NEW.exploit_nd,
			CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
			NEW.ent_pose,
			NEW.dat_pos,
			NEW.qua_dat,
			NEW.geom,
			NEW.op_sai,
			NEW.depart,
			NEW.observ,
			now(),
			NULL,
			NEW.date_donne,
			NEW.op_sai_geo,
			NEW.qua_geo_Z,
			NEW.qua_geo_XY,
			NEW.src_geom,
			NEW.src_date,
			NEW.situation,
			NEW.id_contrat; -------------------------------------------------- On insère les données normalement dans noeud

		--

		IF (NEW.depart IS NOT NULL) THEN -------------------------------------------------- Si le point lumineux est lié à un départ
			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire; --- on actualise la vue du "chemin d'électricité"
		END IF;

		--

		---On insère les données normalement dans support.
		INSERT INTO m_reseau_sec.an_ecl_support (
			id_supp,
			etat_supp,
			id_mod_sup, 
			ty_supp,
			opt_supp,
			ty_parasu,
			ty_fusible,
			haut_trap,
			ty_disjonc,
			haut_supp
			 )
			SELECT
			id_unique,
			NEW.etat_supp,
			NEW.id_mod_sup, 
			NEW.ty_supp ,
			NEW.opt_supp ,
			NEW.ty_parasu ,
			NEW.ty_fusible  ,
			NEW.haut_trap,
			NEW.ty_disjonc,
			NEW.haut_supp
			;


		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_ini= new.id_supp
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) ;


		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_fin= new.id_supp
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) ;

		

	ELSE ---- S'il y a déjà un point avec la même géométrie et que ce n'est pas un point d'intérêt

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_supp, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.', now() );
		RETURN OLD ;

	END IF;
		--- On accepte uniquement les PI sur les point lumineux et inversement.  


	---log
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass); 
	v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

	INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
	SELECT
	v_idlog,
	TG_TABLE_NAME,
	'INSERT',
	NULL,
	v_datanew,
	now();

RETURN NEW;

ELSIF (TG_OP = 'UPDATE') THEN --------------------------------------------------- Si c'est un UPDATE


	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---
        IF ST_equals(new.geom,old.geom) is false AND new.qua_geo_xy = '10' THEN
	INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)----------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_supp, 'Vous ne pouvez pas modifier la géométrie d''un objet en classe A', now() );--- Ce message, qui apparaît dans GEO sur la fiche départ

		new.geom = old.geom;
	ELSE
	NEW.date_maj = now(); ---------------------------------- On attribue la date actuelle à la date de dernière mise à jour.
	END IF;
	---

	IF (NEW.date_donne > now()::timestamp) THEN ----------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
		NEW.date_donne=OLD.date_donne; --------------------------------------------------------------------------------- On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_supp, 'La date de création de la donnée doit être inférieure à la date actuelle', now() );-- Ce message, qui apparaît dans GEO sur la fiche
	END IF;

		---

	IF (NEW.dat_pos > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle
		NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_supp, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche
	END IF;
		---

	IF (NEW.haut_supp > 30::integer) THEN ---------------------------------------Si la hauteur est supérieure à 30 mètres, on met un message d'erreur et on atttribue une valeur NULL
		
		NEW.haut_supp=NULL;
			
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_supp, 'Le support doit faire moins de 30 mètres', now() );

	END IF;

	---

	IF (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') < 1 )
		--
	      OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') =1) AND 
		(( (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom)AND situation <> '12') IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi))
		    OR NEW.geom=OLD.geom))
		--
	      OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') =2) AND
	            ( (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud nd WHERE ST_equals(NEW.geom,geom)AND situation <> '12' AND id_noeud NOT IN(SELECT id_supp FROM m_reseau_sec.an_ecl_support)) IN (SELECT id_pi FROM m_reseau_sec.an_ecl_pi))
	                AND (NEW.geom = OLD.geom) AND (OLD.situation <> '12'))
		--
	   )  THEN 
	  
	-- S'il n'y a pas d'autre noeud dont la géométrie est égale, 
	-- OU S'il y a un noeud avec la même géométrie et que c'est un point d'intérêt ou bien le point lui même
	-- OU S'il y a deux noeud avec la même géométrie et que l'un est un point d'intérêt et l'autre est le noeud lui même ALORS
	-- (Tous ces tests excluent les objets supprimés, mais pas les inactifs)

		IF (NEW.ty_supp <> '10') THEN ---- Si le support n'est pas un mât, on change les attributs n'ayant de sens que pour un mât
		
			NEW.opt_supp = NULL; --- Les options accrochées au support
			NEW.haut_trap='ZZ';----- La hauteur de la trappe
			NEW.id_mod_sup='1';----- Le modèle de mât
			
		END IF;

		--
	
		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_supp, 'L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.', now() );
			RETURN OLD ;

		END IF;
		
		NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
		NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune;

		--

		UPDATE m_reseau_sec.geo_ecl_noeud 
		SET 
		ent_pose = NEW.ent_pose,
		commune =NEW.commune,
		insee = NEW.insee,
		exploit_nd = NEW.exploit_nd,
		presta_nd = CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
		id_contrat = NEW.id_contrat,
		dat_pos=NEW.dat_pos,
		qua_dat=NEW.qua_dat,
		geom=NEW.geom, 
		observ=NEW.observ,
		date_maj=now(),
		depart = NEW.depart,
		situation = NEW.situation,
		qua_geo_Z = NEW.qua_geo_Z,
		qua_geo_XY = NEW.qua_geo_XY,
		src_geom = NEW.src_geom,
		src_date = NEW.src_date,
		op_sai_geo = NEW.op_sai_geo,
		date_donne = NEW.date_donne,
		op_sai = NEW.op_sai
		WHERE id_noeud=NEW.id_supp; ----------------------------------------- On insére toutes les données normalement dans noeud

		--

		IF ( NEW.depart <> OLD.depart OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) ) 
		    THEN----------------------------------------------------------------- Si le nouveau départ auquel est lié le noeud est différent de l'ancien
		
			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

		END IF;

		--

		UPDATE m_reseau_sec.an_ecl_support 
		SET  
		etat_supp=NEW.etat_supp,
		haut_trap=NEW.haut_trap,
		id_mod_sup=NEW.id_mod_sup,
		ty_supp=NEW.ty_supp ,
		opt_supp=NEW.opt_supp ,
		ty_parasu=NEW.ty_parasu ,
		ty_fusible=NEW.ty_fusible  ,
		ty_disjonc=NEW.ty_disjonc,
		haut_supp=NEW.haut_supp   
		WHERE id_supp=NEW.id_supp; ---------------------------------------------- On insère les donnés normalement dans support

		--

		IF (NEW.situation = '11') THEN --- Si le point lumineux devient inactif

			UPDATE m_reseau_sec.an_ecl_foyer ------------------------------------ Ses foyers le deviennent aussi
			SET 
			situation = '11'
			WHERE id_supp = NEW.id_supp;


		END IF;

		--

		IF ((OLD.situation = '11' OR OLD.situation = '12') AND NEW.situation='10') THEN

			UPDATE m_reseau_sec.an_ecl_foyer ------------------------------------ On change l'attribut dans la table 
			SET 
			situation = '10'
			WHERE id_supp = NEW.id_supp;

		END IF;

		--

		--- On donne aux points initial et final des câbles la valeur de l'identifiant du noeud, si la géométrie est égale
		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_ini= new.id_supp
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) ;

		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_fin= new.id_supp
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) ;

		--

		
		

	ELSE --- Si la saisie géométrique n'est pas valide

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_supp, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, et inversement.', now() );

		RETURN OLD ;

	END IF;

	--- log
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);
	v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
	v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
	v_name_table := TG_TABLE_NAME;

	INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
	SELECT
	v_idlog,
	v_name_table,
	'UPDATE',
	v_dataold,
	v_datanew,
	now();
	
RETURN NEW;

ELSIF (TG_OP = 'DELETE') THEN


	UPDATE m_reseau_sec.geo_ecl_noeud --- En cas de suppression on change juste la situation de l'objet
	SET
	situation = '12'
	WHERE OLD.id_supp=id_noeud;

	--

	UPDATE m_reseau_sec.an_ecl_foyer --- En cas de suppression on change juste la situation des foyers de l"objet
	SET
	situation = '12'
	WHERE OLD.id_supp=id_supp;

	--

	--- On enlève les liens avec le câble,
	UPDATE m_reseau_sec.geo_ecl_cable 
	SET id_nd_ini= NULL
	WHERE ST_equals(OLD.geom,ST_StartPoint(geom)) ;

	--

	UPDATE m_reseau_sec.geo_ecl_cable
	SET id_nd_fin= NULL
	WHERE ST_equals(OLD.geom,ST_EndPoint(geom)) ;

	
	REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- On actualise la vue du "chemin d'électricité"


	--- log
	v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);

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
ALTER FUNCTION m_reseau_sec.ft_m_point_lumineux()
  OWNER TO sig_create;




-- Trigger: t_t1_lk_point_lumineux on m_reseau_sec.geo_v_ecl_point_lumineux

-- DROP TRIGGER t_t1_lk_point_lumineux ON m_reseau_sec.geo_v_ecl_point_lumineux;

CREATE TRIGGER t_t1_lk_point_lumineux
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_ecl_point_lumineux
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_point_lumineux();
  
  

COMMENT ON VIEW m_reseau_sec.geo_v_point_lumineux IS 'Vue des supports permettant la saisie dans l''application Geo';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.id_supp IS 'Identifiant du point lumineux';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.id_mod_sup IS 'Lien vers table modèle support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_supp IS 'Type de support : mat, facade…etc.';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.opt_supp IS 'Option(s) du support, sous forme de liste déroulante dans l''application';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_parasu IS 'Type de parasurtenseur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.etat_supp IS 'Etat du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_fusible IS 'Type du fusible';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.haut_supp IS 'Hauteur du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ent_pose IS 'Entreprise ayant posé le support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.dat_pos IS 'Date de pose du support ';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.qua_dat IS 'Qualité de la date de pose du support';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.date_donne IS 'Date de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.op_sai_geo IS 'Opérateur de la saisie des données de géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.qua_geo_XY IS 'Classe de la géolocalisation en XY';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.qua_geo_Z IS 'Classe de la géolocalisation en Z';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.src_geom IS 'Source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.src_date IS 'Date de la source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.situation IS 'Situation générale : actif, inactif,supprimé';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.exploit_nd IS 'Exploitant de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.presta_nd IS 'Prestataire intervenant sur l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.commune IS 'Commune sur laquelle est situé l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.insee IS 'Code insee de la commune sur laquelle se situe l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.haut_trap IS 'Hauteur de la trappe, standard ou En hauteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.geom IS 'Géométrie de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.ty_disjonc IS 'Type de disjoncteur';
COMMENT ON COLUMN m_reseau_sec.geo_v_point_lumineux.nbr_foyer IS 'Nombre de foyers, calculé via trigger';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_point_lumineux.id_contrat IS 'Code du contrat de maintenant et/ou d''entretien en cours';
					     
--############################################################## POINT - D'INTERET ################################################
--DROP VIEW m_reseau_sec.geo_v_pi ;
CREATE OR REPLACE VIEW m_reseau_sec.geo_v_ecl_pi AS 
 SELECT 
	pi.id_pi,
	noeud.depart,
	pi.ty_pi,
	noeud.ent_pose,
	noeud.dat_pos,
	noeud.qua_dat,
	pi.etat_pi,
	noeud.observ,
	noeud.geom,
	noeud.op_sai,
	noeud.date_donne,
	noeud.op_sai_geo,
        noeud.qua_geo_XY,
        noeud.qua_geo_Z,
        noeud.src_geom,
        noeud.src_date,
        noeud.situation,
        noeud.date_sai,
        noeud.date_maj,
        noeud.exploit_nd,
        noeud.presta_nd,
	noeud.id_contrat,
	noeud.commune,
        noeud.insee       
 FROM m_reseau_sec.an_ecl_pi pi
     JOIN m_reseau_sec.geo_ecl_noeud noeud ON pi.id_pi = noeud.id_noeud;
     
--- '00' = "non renseigné" dans les domaines de valeurs
ALTER VIEW m_reseau_sec.geo_v_pi ALTER ty_pi SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER etat_pi SET DEFAULT '00';     
ALTER VIEW m_reseau_sec.geo_v_pi ALTER qua_dat SET DEFAULT '00';    
ALTER VIEW m_reseau_sec.geo_v_pi ALTER qua_geo_XY SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER qua_geo_Z SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER src_geom SET DEFAULT '00';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER src_date SET DEFAULT '0000';
ALTER VIEW m_reseau_sec.geo_v_pi ALTER situation SET DEFAULT '10';
ALTER TABLE m_reseau_sec.geo_v_ecl_pi ALTER COLUMN id_contrat SET DEFAULT '00'::character varying;
---

--- SUPPRESSION DES MESSAGES D'ERREUR
--- On force certains attributs
--- GESTION DES CONTRAINTES DE SAISIE avec génération de messages d'erreurs
--- Contrôle de la topologie 
--- Ventilation des données aux tables Noeuds et PI
--- En cas de DELETE, attribut situation passe à 'supprimer' --> Le point n'est donc pas réellement supprimé.
--- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.
--- L'insertion des logs se fait également dans cette fonction	

-- Function: m_reseau_sec.ft_m_point_interet()

-- DROP FUNCTION m_reseau_sec.ft_m_point_interet();

CREATE OR REPLACE FUNCTION m_reseau_sec.ft_m_point_interet()
  RETURNS trigger AS
$BODY$
DECLARE id_unique integer;

-- variable pour les logs
DECLARE v_idlog integer;
DECLARE v_dataold character varying(1000);
DECLARE v_datanew character varying(1000);
DECLARE v_name_table character varying(254);

BEGIN

	---

IF (TG_OP = 'INSERT') THEN 

	id_unique = nextval('m_reseau_sec.ecl_objet_seq');

	NEW.date_donne = now();
	NEW.qua_geo_Z = '30'; --- Classe C
	NEW.qua_geo_XY = '30';--- Classe C
	NEW.src_geom = '20'; ---- Orthophotographie
	NEW.src_date = '2018';--- 
	NEW.situation = '10';---- Actif

	--

	IF (NEW.dat_pos > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle
		NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL
		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(id_unique, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche
	END IF;

	--
	
	IF (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') < 1 )
	      OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') =1) AND 
		(( SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') IN (SELECT id_supp FROM m_reseau_sec.an_ecl_support)
		    ))   
	   )  THEN -- S'il n'y a pas d'autre noeud dont la géométrie est égale, ou bien s'il y a un autre noeud au même endroit et que c'est un point lumineux

		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(id_unique, 'L''objet est en dehors des zones de gestion. Contacter SIG pour changer les zones.', now() );
			RETURN OLD ;

		END IF;

		--

		NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
		NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune

		--

	
		INSERT INTO m_reseau_sec.geo_ecl_noeud (id_noeud,commune, insee, exploit_nd, presta_nd,ent_pose,dat_pos,qua_dat, geom,op_sai,
							depart, observ, date_sai, date_maj,date_donne,op_sai_geo,qua_geo_Z,qua_geo_XY, src_geom, src_date,situation,id_contrat)
			SELECT
			id_unique,
			NEW.commune,
			NEW.insee,
			NEW.exploit_nd,
			CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
			NEW.ent_pose,
			NEW.dat_pos,
			NEW.qua_dat,
			NEW.geom,
			NEW.op_sai,
			NEW.depart,
			NEW.observ,
			now(),
			NULL, --- Date de dernière mise à jour
			NEW.date_donne,
			NEW.op_sai_geo,
			NEW.qua_geo_Z,
			NEW.qua_geo_XY,
			NEW.src_geom,
			NEW.src_date,
			NEW.situation,
			NEW.id_contrat; -------------------------------------------------- On insère les données normalement dans noeud

		--

		IF (NEW.depart IS NOT NULL) THEN
		
			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"

		END IF;

		--

		INSERT INTO m_reseau_sec.an_ecl_pi 
		SELECT
		id_unique,
		NEW.ty_pi,
		NEW.etat_pi
		; --------------------------------------------------------- On insère les données dans point d'intérêt normalement

		--

		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_ini= new.id_pi
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) ;

		UPDATE m_reseau_sec.geo_ecl_cable --- On UPDATE câble dont un des points (final ou initial) est égal à la géométrie de l'objet
		SET id_nd_fin= new.id_pi
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) ;


		

	ELSE ---- S'il y a déjà un point avec la même géométrie et que ce n'est pas un point lumineux

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_pi, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.', now() );
		RETURN OLD ;

	END IF; 

	---log
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass); 
	v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

	INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
	SELECT
	v_idlog,
	TG_TABLE_NAME,
	'INSERT',
	NULL,
	v_datanew,
	now();
	
RETURN NEW;

ELSIF (TG_OP = 'UPDATE') THEN 

	DELETE FROM m_reseau_sec.an_ecl_erreur; ------ On efface les messages d'erreurs existants

	---

	IF ST_equals(new.geom,old.geom) is false AND new.qua_geo_xy = '10' THEN
	INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)----------------------------------- Puis on ajoute dans la table erreur
		VALUES
		(NEW.id_pi, 'Vous ne pouvez pas modifier la géométrie d''un objet en classe A', now() );--- Ce message, qui apparaît dans GEO sur la fiche départ

		new.geom = old.geom;
	ELSE
	NEW.date_maj = now(); ---------------------------------- On attribue la date actuelle à la date de dernière mise à jour.
	END IF;

	---

	IF (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') < 1 )
	      OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') =1) AND 
		(( (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12' ) IN (SELECT id_supp FROM m_reseau_sec.an_ecl_support))
		    OR NEW.geom=OLD.geom))
	       OR (((SELECT count(*) FROM m_reseau_sec.geo_ecl_noeud WHERE ST_equals(NEW.geom,geom) AND situation <> '12') =2) AND
	            ( (SELECT id_noeud FROM m_reseau_sec.geo_ecl_noeud nd WHERE ST_equals(NEW.geom,geom)AND situation <> '12' AND id_noeud NOT IN(SELECT id_pi FROM m_reseau_sec.an_ecl_pi)) IN (SELECT id_supp FROM m_reseau_sec.an_ecl_support))
	                AND (NEW.geom = OLD.geom) AND (OLD.situation <> '12')
		   )
	   )  THEN -- S'il n'y a pas d'autre noeud dont la géométrie est égale, ou bien s'il y a un autre noeud au même endroit et que c'est un point lumineux

		--

		IF (NEW.date_donne > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la donnée est supérieure à la date actuelle
			NEW.date_donne=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
			VALUES
			(NEW.id_pi, 'La date de la donnée doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche
		END IF;

		--
	
		IF (NEW.dat_pos > now()::timestamp) THEN -------------------------------------------------------------------- Si la date de la pose est supérieure à la date actuelle
			NEW.dat_pos=NULL; ------------------------------------------------------------------------------------ On surcorrige la saisie en attribuant la valeur NULL
			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)------------------------------------- Puis on ajoute dans la table erreur
			VALUES
			(NEW.id_pi, 'La date de pose doit être inférieure à la date actuelle', now() );------------------ Ce message, qui apparaît dans GEO sur la fiche
		END IF;

		--

		IF ( (SELECT count(*) FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) > 0) THEN

			NEW.exploit_nd = (SELECT gest FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

			NEW.id_contrat = (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)); ------ Remplissage automatique de l'insee

		ELSE  ------------------------------------------------ Si l'objet n'est dans aucune zone de gestion, on met un message d'erreur

			INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
			VALUES
			(NEW.id_pi, 'L''objet est en dehors des zones de gestion. Contacter SIG pour changer les zones.', now() );
			RETURN OLD ;

		END IF;

		--

		NEW.insee = (SELECT insee FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom)); ------ Remplissage automatique de l'insee
		
		NEW.commune = (SELECT commune FROM r_osm.geo_vm_osm_commune_arcba arcba WHERE ST_Contains(arcba.geom,NEW.geom));--- Remplissage automatique de l'attribut commune;

		--


		UPDATE m_reseau_sec.geo_ecl_noeud 
		SET 
		ent_pose = NEW.ent_pose,
		commune =NEW.commune,
		insee = NEW.insee,
		exploit_nd = NEW.exploit_nd,
		presta_nd = CASE WHEN (SELECT id_contrat_ecl FROM m_amenagement.geo_amt_zone_gestion gestion WHERE ST_Contains(gestion.geom,NEW.geom)) = 'ZZ' THEN 'Service d''éclairage public - Lesens' ELSE '' END,
		id_contrat = NEW.id_contrat,
		dat_pos=NEW.dat_pos,
		qua_dat=NEW.qua_dat,
		geom=NEW.geom, 
		observ=NEW.observ,
		date_maj=now(),
		depart = NEW.depart,
		situation = NEW.situation,
		qua_geo_Z = NEW.qua_geo_Z,
		qua_geo_XY = NEW.qua_geo_XY,
		src_geom = NEW.src_geom,
		src_date = NEW.src_date,
		op_sai_geo = NEW.op_sai_geo,
		op_sai = NEW.op_sai,
		date_donne = NEW.date_donne
		WHERE id_noeud=NEW.id_pi; ----------------------------------------- On insére toutes les données normalement dans noeud

		--

		IF ( NEW.depart <> OLD.depart OR (NEW.depart IS NOT NULL AND OLD.depart IS NULL) OR (NEW.depart IS NULL AND OLD.depart IS NOT NULL) ) 
		THEN----------------------------------------------------------------- Si le nouveau départ auquel est lié le noeud est différent de l'ancien

			REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- on rafraichi la vue du "chemin d'électricité"
		
		END IF;

		--

		UPDATE m_reseau_sec.an_ecl_pi 
		SET 
		ty_pi=NEW.ty_pi,
		etat_pi=NEW.etat_pi
		WHERE id_pi=NEW.id_pi; ---------------------------------------------- On insère les données dans point d'intérêt normalement

		--

		--- On donne aux points initial et final des câbles la valeur de l'identifiant du noeud, si la géométrie est égale
		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_ini= new.id_pi
		WHERE ST_equals(NEW.geom,ST_StartPoint(geom)) ;

		UPDATE m_reseau_sec.geo_ecl_cable
		SET id_nd_fin= new.id_pi
		WHERE ST_equals(NEW.geom,ST_EndPoint(geom)) ;
		


	ELSE --- Si la saisie géométrique n'est pas valide

		INSERT INTO m_reseau_sec.an_ecl_erreur (id_objet, message, heure)
		VALUES
		(NEW.id_pi, 'Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.', now() );
		RETURN OLD ;

	END IF;
		--- On accepte uniquement les PI sur les point lumineux inversement. Le reste n'est pas possible.  

	--- log
	v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);
	v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
	v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
	v_name_table := TG_TABLE_NAME;

	INSERT INTO m_reseau_sec.an_ecl_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
	SELECT
	v_idlog,
	v_name_table,
	'UPDATE',
	v_dataold,
	v_datanew,
	now();

RETURN NEW;
		
ELSIF (TG_OP = 'DELETE') THEN

	UPDATE m_reseau_sec.geo_ecl_noeud --- En cas de suppression on change juste la situation de l'objet
	SET
	situation = '12'
	WHERE OLD.id_pi=id_noeud;
	
	--

	UPDATE m_reseau_sec.geo_ecl_cable
	SET id_nd_ini= NULL
	WHERE ST_equals(OLD.geom,ST_StartPoint(geom)) ;

	UPDATE m_reseau_sec.geo_ecl_cable
	SET id_nd_fin= NULL
	WHERE ST_equals(OLD.geom,ST_EndPoint(geom)) ;

	--

	REFRESH MATERIALIZED VIEW x_apps.xapps_an_vmr_ecl_materialisee_noeud_armoire;-- On actualise la vue du "chemin d'électricité"

	 v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
	 v_idlog := nextval('m_reseau_sec.an_ecl_log_idlog_seq'::regclass);

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
ALTER FUNCTION m_reseau_sec.ft_m_point_interet()
  OWNER TO sig_create;




-- Trigger: t_t1_point_interet on m_reseau_sec.geo_v_ecl_pi

-- DROP TRIGGER t_t1_point_interet ON m_reseau_sec.geo_v_ecl_pi;

CREATE TRIGGER t_t1_point_interet
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_reseau_sec.geo_v_ecl_pi
  FOR EACH ROW
  EXECUTE PROCEDURE m_reseau_sec.ft_m_point_interet();

---

COMMENT ON VIEW m_reseau_sec.geo_v_pi IS 'Objet réel ou abstrait indiquant un point ayant une importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''EP.';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.id_pi IS 'Identifiant du nœud lié au point d''interet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.depart IS 'Numéro de départ auquel est lié le noeud';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.ty_pi IS 'Type de point d''intérêt';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.etat_pi IS 'Etat du point d''intérêt ';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.observ IS 'Commentaires divers';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.ent_pose IS 'Entreprise ayant posé le point d''interet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.date_donne IS 'Date de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.dat_pos IS 'Date de pose du le point d''interet ';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.qua_dat IS 'Qualité de la date de pose du le point d''interet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.op_sai_geo IS 'Opérateur de la saisie des données de géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.qua_geo_XY IS 'Classe de la géolocalisation en XY';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.qua_geo_Z IS 'Classe de la géolocalisation en Z';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.src_geom IS 'Source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.src_date IS 'Date de la source utilisée pour la géolocalisation';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.situation IS 'Situation générale : actif, inactif,supprimé';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.date_sai IS 'Date de la saisie de la donnée dans la base';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.date_maj IS 'Date de dernière mise à jour de la donnée';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.exploit_nd IS 'Exploitant de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.presta_nd IS 'Prestataire intervenant sur l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.commune IS 'Commune sur laquelle est situé l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.insee IS 'Code insee de la commune sur laquelle se situe l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_pi.geom IS 'Géométrie de l''objet';
COMMENT ON COLUMN m_reseau_sec.geo_v_ecl_pi.id_contrat IS 'Code du contrat de maintenant et/ou d''entretien en cours';
