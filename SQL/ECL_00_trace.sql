/*ECL V1.0*/
/*Creation du fichier trace qui permet de suivre l'évolution du code*/
/* ECL_10_trace.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau */

/*  
  dépendances : voir script d'initialisation des dépendances init_bd_pei_dependencies.sql
  
  Liste des dépendances :
  schéma          | table                 | description                                                   | usage
*/

/*
#################################################################### SUIVI CODE SQL ####################################################################
2019-08-12 : TB / initialisation du code
2019-11-27 : GB / Ajout de 3 valeurs d'attributs dans la table lt_ecl_type_commande
2019-12-20 : GB / Modifications SQL suite adaptation sur l'exploitation des rapports de signalements/Interventions et leurs recherches
2019-12-20 : GB / Modifications suite intégration de la gestion des contrats et l'accès à des prestataires extérieurs
2020-01-01 : GB / Modification suite intégration de la gestion des contrats pour intégrer l'information du prestataire
                  pour les cables et les noeuds lorsqu'il n'y a pas de contrats (trigger sur cable et vues de gestion des ouvrages, points d'intérêts et points lumineux)
2020-01-10 : GB / Mise à jour structure table geo_ecl_cable (sect_cab par défaut '00')
2020-01-27 : GB / Mise à jour suite adaptation du suivi des interventions
2020-01-31 : GB / Mise à jour vue applicative (stat) suite prise en compte des réseaux rétrocédés
2020-02-03 : GB / Intégration liste de valeurs des interventions liées aux feux tricolores
2020-02-03 : GB / Intégration des signalements / interventions pour les feux tricolores (support)
2020-02-05 : GB / Mise à jour données Feu tricolore (liste de valeurs)
2020-02-13 : GB / Intégration des signalements / interventions pour les feux tricolroes (armoire)
2020-02-20 : GB / Ajout de l'attribut type d'intervention dans la vue applicative liste d'afichage des interventions pour filtrer sur ce champ dans GEO
