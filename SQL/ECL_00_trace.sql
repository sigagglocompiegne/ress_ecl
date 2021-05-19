/*ECL V1.0*/
/*Creation du fichier trace qui permet de suivre l'évolution du code*/
/* ECL_10_trace.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Thibaud Billoteau, Bodet Grégory */

/*  
 
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
2020-03-26 : GB / Mise à jour des vues de gestion avec l'enregistrement par défaut de la date du référentiel de saisie à l'insertion à 2018 au lieu de 2013
                / Correction de la fonction trigger sur la vue de gestion des Points d'intérêt concernant la mise à jour de l'attribut op_sai (manquant)
2020-03-31 : GB / Adaptation des vues de gestion (Point d'intérêt, Point lumineux et ouvrage) pour éviter une remontée d'erreur lorsque plus de 2 cables 
                / sont connectés (1 seul noeud initiale et final peut être affecté aux objets)
2020-04-07 : GB / Modification de l'attribut puis_lamp dans la table an_ecl_modele_lampe de charaecter varying en integer et mise à jour des valeurs de puissance
                / Modification des fonctions triggers sur cette table et autre table modèle pour prise en compte
                / ajout de la valeurs ZZ (Non concerné) pour les listes de valeurs des culots de lampe et présence (pour la télégestion)
2020-04-08 : GB / Modification des fonctions triggers pour les supports inactifs et le calcul du nombre de foyers dans la trigger AFTER INSERT OR UPDATE de la table des foyers
2021-04-18 : GB / Ajout d'un attribut sur le type de réseau électrique (BT, HTa, ...) dans la classe d'objet geo_ecl_cable + liste de valeurs associées
2021-05-18 : GB / Modification de la zone de gestion intégrant l'espace du Tigre sur la ZAE des Hauts-de-Margny, site ARC mais entretient par le prestataire privé de l''exploitant
                  Impact sur les triggers de gestions des ouvrages, support, foyer et câble
                  Impact sur les vues des indicateurs pour intégrer les objets sur ce site en tant que patrimoine de la collectivité
