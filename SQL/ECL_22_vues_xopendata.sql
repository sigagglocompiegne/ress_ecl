 
/*ECL V1.0*/
/*Creation des vues nécessaires à l'application web-métier */
/*ECL_22_VUES_XOPENDATA.sql */
/*PostGIS*/
/* GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : fvanhoutte */

-- #################################################################################################################################
-- ###                                                                                                                           ###
-- ###                                                        VUES OPENDATA                                                      ###
-- ###                                                                                                                           ###
-- #################################################################################################################################

-- View: x_opendata.xopendata_geo_v_ecl_ptlum

DROP VIEW x_opendata.xopendata_geo_v_ecl_ptlum;

CREATE OR REPLACE VIEW x_opendata.xopendata_geo_v_ecl_ptlum
 AS
 SELECT p.id_supp as id_eclsup,
    p.insee,
    p.commune, 
--    p.depart,
    CASE
      WHEN p.id_mod_sup = 1 THEN 'Non renseigné'
      ELSE m.nom_mod_su
    END AS modele_sup,
    lta.valeur as type_sup,
    p.nbr_foyer,
    CASE WHEN p.opt_supp = '' THEN NULL ELSE
    -- on remplace individuellement les valeurs de liste pour un attribut multivalué
          (SELECT REPLACE
            (REPLACE
              (REPLACE
                (REPLACE
                  (REPLACE
                    (REPLACE
                      (REPLACE
                        (REPLACE
                          (REPLACE
                            (REPLACE
                              (REPLACE
                                (REPLACE
                                  (REPLACE
                                    (REPLACE
                                      (REPLACE
                                        (REPLACE
                                          (REPLACE
                                            (REPLACE (p.opt_supp,
                                            '00','Non renseigné'),
                                          '10','Caméra'),
                                        '11','Détecteur de mouvement'),                                           
                                      '12','Feu tricolore'),
                                    '13','Caisson piéton'),
                                  '14','Panneau traversée piéton'),
                                '15','Miroir'),
                              '16','Projecteur'),
                            '17','Appel piéton'),
                          '20','Oriflamme'),
                        '30','wi-fi'),
                      '40','Radar'),                                                  
                    '50','Panneau de signalisation'),
                  '60','Prise guirlande festive'),                   
                '70','Bluetooth'),                    
              '80','Jardinière'),                    
            '99','Autre'),
          'ZZ','Non concerné'))                                                                                                                                                                                               
      END as opt_sup,
--    p.ty_parasu,
--    p.etat_supp,
--    p.haut_trap,
--    p.ty_fusible,
--    p.ent_pose,
--    p.dat_pos,
--    p.qua_dat,
--    p.haut_supp,
    p.exploit_nd as gexploit,
    -- simplication état en service ou non de l'ouvrage
    CASE
      WHEN p.situation = '10' THEN 'O'
      ELSE 'N' 
    END AS enservice,
    -- simplification et regroupement des opérateurs de saisie
    CASE
      WHEN p.op_sai IN ('mporte','slagache') THEN 'Service éclairage' ELSE 
      CASE WHEN p.op_sai IN ('geo','geo1', 'geo2', 'gbodet', 'Grégory Bodet', 'fvanhoutte','Florent Vanhoutte','tbilloteau','service SIG') THEN 'Service SIG' ELSE 
        CASE WHEN p.op_sai LIKE '%ILLUM%' OR p.op_sai LIKE '%INEO%' OR p.op_sai LIKE '%ROCH%' OR p.op_sai LIKE '%LESENS%' THEN p.op_sai ELSE 'Non renseigné'
        END
      END
    END AS sourattrib,
--    p.ty_disjonc,
--    p.date_donne,
    CASE
      WHEN p.op_sai_geo IN ('mporte','slagache') THEN 'Service éclairage' ELSE 
      CASE WHEN p.op_sai_geo IN ('geo','geo1', 'geo2', 'gbodet', 'Grégory Bodet', 'fvanhoutte','Florent Vanhoutte','tbilloteau','service SIG') THEN 'Service SIG' ELSE 
        CASE WHEN p.op_sai_geo LIKE '%ILLUM%' OR p.op_sai_geo LIKE '%INEO%' OR p.op_sai_geo LIKE '%ROCH%' OR p.op_sai_geo LIKE '%LESENS%' THEN p.op_sai_geo ELSE 'Non renseigné'
        END
      END
    END AS sourgeoloc,
    -- simplification à la seul lettre de la classe de DT-DICT
    RIGHT(ltc.valeur,1) as qualglocxy,
    RIGHT(ltd.valeur,1) as qualglocz,
    ltb.valeur as src_geom,
    p.src_date,
    -- simplification à la date de la dernière opération (saisie ou mise à jour)
    CASE
      WHEN p.date_maj IS NULL THEN date(p.date_sai)
      ELSE date(p.date_maj)
    END AS datedermaj,
--    p.presta_nd,
--    p.id_contrat,
--    p.observ,
    ROUND(ST_X(p.geom)::numeric,2) as x_l93,
    ROUND(ST_Y(p.geom)::numeric,2) as y_l93,
    p.geom    
   FROM m_reseau_sec.geo_v_ecl_point_lumineux as p
   LEFT JOIN m_reseau_sec.lt_ecl_type_support as lta ON p.ty_supp = lta.code
   LEFT JOIN r_objet.lt_src_geom as ltb ON p.src_geom = ltb.code
   LEFT JOIN m_reseau_sec.lt_ecl_qualite_geolocalisation as ltc ON p.qua_geo_xy = ltc.code
   LEFT JOIN m_reseau_sec.lt_ecl_qualite_geolocalisation as ltd ON p.qua_geo_z = ltd.code
   LEFT JOIN m_reseau_sec.an_ecl_modele_support as m ON m.id_mod_sup = p.id_mod_sup
   -- je conserve les supports actifs et inactifs et écarte les supports "supprimé"
   WHERE p.situation <> '12'
   ORDER BY p.id_supp;

ALTER TABLE x_opendata.xopendata_geo_v_ecl_ptlum
    OWNER TO create_sig;
COMMENT ON VIEW x_opendata.xopendata_geo_v_ecl_ptlum
    IS 'Vue opendata décodée et simplifiée des points lumineux';

GRANT ALL ON TABLE x_opendata.xopendata_geo_v_ecl_ptlum TO sig_create;
GRANT SELECT ON TABLE x_opendata.xopendata_geo_v_ecl_ptlum TO sig_read;
GRANT ALL ON TABLE x_opendata.xopendata_geo_v_ecl_ptlum TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE x_opendata.xopendata_geo_v_ecl_ptlum TO sig_edit;

