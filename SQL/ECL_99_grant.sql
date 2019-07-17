
/*ECL V1.0*/
/*Creation droits sur l'ensemble des objets */
/*ECL_99_GRANT.sql */
/*PostGIS*/
/*GeoCompiegnois - http://geo.compiegnois.fr/ */
/*Auteur : Thibaud Billoteau */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        GRANT                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- #################################################################### DOMAINE DE VALEUR  ####################################################################

ALTER TABLE m_reseau_sec.lt_ecl_classe_electrique
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_classe_electrique TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_classe_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_classe_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_classe_electrique TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_couleur_eclairage
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_couleur_eclairage TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_couleur_eclairage TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_couleur_eclairage TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_couleur_eclairage TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_culot_lampe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_culot_lampe TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_culot_lampe TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_culot_lampe TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_culot_lampe TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_support
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_support TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_support TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_support TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_support TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_pi
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_pi TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_pi TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_pi TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_pi TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_parasurtenseur
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_parasurtenseur TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_parasurtenseur TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_parasurtenseur TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_parasurtenseur TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_ouvrage_electrique TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_lanterne
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_lanterne TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_lanterne TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_lanterne TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_lanterne TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_lampe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_lampe TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_lampe TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_lampe TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_lampe TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_point_lumineux TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_ouvrage TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_pi
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_pi TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_pi TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_pi TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_pi TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_foyer
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_foyer TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_foyer TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_foyer TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_foyer TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_depart
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_depart TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_depart TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_depart TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_depart TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention_cables
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_cables TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention_cables TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention_cables TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention_cables TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_intervention TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_intervention TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_fusible
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_fusible TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_fusible TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_fusible TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_fusible TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_disjoncteur
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_disjoncteur TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_disjoncteur TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_disjoncteur TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_disjoncteur TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_defaillance
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_defaillance TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_defaillance TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_defaillance TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_defaillance TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_commande
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_commande TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_commande TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_commande TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_commande TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_ballast
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_ballast TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_ballast TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_ballast TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_ballast TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_auto_transformateur
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_auto_transformateur TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_auto_transformateur TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_auto_transformateur TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_auto_transformateur TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_type_amorceur
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_amorceur TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_type_amorceur TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_type_amorceur TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_type_amorceur TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_source_defaillance
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_source_defaillance TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_source_defaillance TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_source_defaillance TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_source_defaillance TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_situation_cable
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_situation_cable TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_situation_cable TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_situation_cable TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_situation_cable TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_situation
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_situation TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_situation TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_situation TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_situation TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_signalement_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_signalement_intervention TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_signalement_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_signalement_intervention TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_signalement_intervention TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_section_cable
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_section_cable TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_section_cable TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_section_cable TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_section_cable TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_qualite_geolocalisation TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_qualite_date
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_qualite_date TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_qualite_date TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_qualite_date TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_qualite_date TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_puissance_lampe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_puissance_lampe TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_puissance_lampe TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_puissance_lampe TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_puissance_lampe TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_presence
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_presence TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_presence TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_presence TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_presence TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_options_support
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_options_support TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_options_support TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_options_support TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_options_support TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_moyen_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_moyen_intervention TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_moyen_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_moyen_intervention TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_moyen_intervention TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_mode_pose_ouvrage_electrique TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_materiaux_supports
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_materiaux_supports TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_materiaux_supports TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_materiaux_supports TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_materiaux_supports TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_hauteur_trappe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_hauteur_trappe TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_hauteur_trappe TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_hauteur_trappe TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_hauteur_trappe TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_etat_signalement_affichage TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_culot_lampe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_etat TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_etat TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_etat TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_etat TO read_sig;

ALTER TABLE m_reseau_sec.lt_ecl_emplacement
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_emplacement TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.lt_ecl_emplacement TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.lt_ecl_emplacement TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.lt_ecl_emplacement TO read_sig;

-- #################################################################### TABLE  ####################################################################

ALTER TABLE m_reseau_sec.an_ecl_depart
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_depart TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_depart TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_depart TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_depart TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_erreur
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_erreur TO postgres;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_erreur TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_erreur TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_erreur TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_foyer
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_foyer TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_foyer TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_foyer TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_foyer TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_intervention TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_intervention TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_intervention TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_media
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_media TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_media TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_media TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_media TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_media_modele
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_media_modele TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_media_modele TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_media_modele TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_media_modele TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_modele_lampe
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_lampe TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_lampe TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_modele_lampe TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_modele_lampe TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_modele_lanterne
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_lanterne TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_lanterne TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_modele_lanterne TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_modele_lanterne TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_modele_support
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_support TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_modele_support TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_modele_support TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_modele_support TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_ouvrage_electrique
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_ouvrage_electrique TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_pi
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_pi TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_pi TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_pi TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_pi TO read_sig;

ALTER TABLE m_reseau_sec.an_ecl_support
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_support TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.an_ecl_support TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.an_ecl_support TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.an_ecl_support TO read_sig;

ALTER TABLE m_reseau_sec.geo_ecl_cable
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.geo_ecl_cable TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.geo_ecl_cable TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_ecl_cable TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_ecl_cable TO read_sig;

ALTER TABLE m_reseau_sec.geo_ecl_noeud
  OWNER TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.geo_ecl_noeud TO sig_create;
GRANT ALL ON TABLE m_reseau_sec.geo_ecl_noeud TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_ecl_noeud TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_ecl_noeud TO read_sig;

-- #################################################################### VUE DE GESTION  ####################################################################


ALTER TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_v_ecl_ouvrage_electrique TO read_sig;

ALTER TABLE m_reseau_sec.geo_v_ecl_pi
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_pi TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_pi TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_v_ecl_pi TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_v_ecl_pi TO read_sig;

ALTER TABLE m_reseau_sec.geo_v_ecl_point_lumineux
  OWNER TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_point_lumineux TO postgres;
GRANT ALL ON TABLE m_reseau_sec.geo_v_ecl_point_lumineux TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_reseau_sec.geo_v_ecl_point_lumineux TO edit_sig;
GRANT SELECT ON TABLE m_reseau_sec.geo_v_ecl_point_lumineux TO read_sig;

-- #################################################################### VUE APPLICATIVE  ####################################################################

ALTER TABLE x_apps.xapps_geo_v_ecl_depart
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_depart TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_depart TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_ecl_depart TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_ecl_depart TO read_sig;

ALTER TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_ecl_intervention_liste_affichage TO read_sig;

ALTER TABLE x_apps.xapps_geo_v_ecl_support_par_armoire
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_ecl_support_par_armoire TO read_sig;

ALTER TABLE x_apps.xapps_an_v_ecl_patrimoine
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_patrimoine TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_patrimoine TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_ecl_patrimoine TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_ecl_patrimoine TO read_sig;

ALTER TABLE x_apps.xapps_an_v_ecl_stat_intervention
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_ecl_stat_intervention TO read_sig;

ALTER TABLE x_apps.xapps_an_v_ecl_tension_cable
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_tension_cable TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_ecl_tension_cable TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_ecl_tension_cable TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_ecl_tension_cable TO read_sig;

-- #################################################################### FUNCTION TRIGGER  ####################################################################

ALTER FUNCTION m_reseau_sec.ft_m_cable_after()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_after() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_after() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_after() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_cable_before()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_before() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_before() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_before() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_cable_delete()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_delete() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_cable_delete() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_depart_delete()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_delete() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_delete() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_depart_insert_update()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_insert_update() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_insert_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_depart_insert_update() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_foyer()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_foyer_after()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_after() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_after() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_after() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_foyer_delete()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_delete() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_foyer_delete() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_intervention()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_intervention() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_intervention() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_intervention() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_modele_lampe()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lampe() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lampe() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lampe() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_modele_lanterne()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lanterne() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lanterne() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_lanterne() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_modele_support()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_support() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_support() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_modele_support() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_ouvrage_electrique()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_ouvrage_electrique() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_ouvrage_electrique() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_ouvrage_electrique() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_point_interet()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_interet() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_interet() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_interet() TO create_sig;

ALTER FUNCTION m_reseau_sec.ft_m_point_lumineux()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_lumineux() TO public;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_lumineux() TO sig_create;
GRANT EXECUTE ON FUNCTION m_reseau_sec.ft_m_point_lumineux() TO create_sig;