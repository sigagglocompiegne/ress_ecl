![GeoCompiegnois](img/Logo_web-GeoCompiegnois.png)

# Documentation technique de l'application d'éclairage public (ECL)

* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision
  
* Historique des versions

|Date | Auteur | Description
|:---|:---|:---|
|17/07/2019|Thibaud BILLOTEAU|version initiale|


# Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![picto](/doc/img/ecl_bleu.png)|Eclairage public (ECL)|Cette application est dédiée à la gestion du réseau d'éclairage public de l'ARC (zones de gestion ARC) et de la Ville de Compiègne.|

# Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux personnels gestionnaires des données du réseau ayant les droits d'accès.|

# Droit par profil de connexion

* **Prestataires**

Sans objet

* **Personnel du service d'éclairage public - Groupe ECL-Edit**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Toutes|x|x|L'ensemble des fonctionnalités (recherches, cartographie, fiches d'informations, ...) sont accessibles par tous les utilisateurs connectés (en écriture pour les fonctions concernées).|

* **Personnel de l'ARC ou de la ville- Groupe ECL-consult / Reseau-consult**

 ** A redefinir avec le service métier + service SIG **
 
|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Toutes les fiches informations|||L'ensemble des fiches d'informations ne sont pas accessibles aux personnes extérieures au service d'éclairage public.|
|Cartographie|x||L'ensemble des données sont visibles aux personnes extérieures au service d'éclairage public.|
|Recherches|x||L'ensemble des recherches ne sont pas visibles aux personnes extérieures au service d'éclairage public.|

* **Autres profils**

Sans objet

# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 
*/ Table faîte à partir d'un macro excel, fichier excel à retrouver dans... /*
## Table : `an_ecl_depart`
| Atributs          | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                          | Utilisation                        | Exemple     |
|:-----------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------- | ----------- |
| Affiche recherche | x                 |               | Affiche recherche                                                                                                                       |                                                              | Recherche : Recherche de départ    |             |
| date_donne        |                   | x             | Date Donne                                                                                                                              | Les heures ne sont pas affichées                             | Fiche d'information : Depart (ECL) |             |
| date_maj          |                   | x             | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  |                                                              | Fiche d'information : Depart (ECL) |             |
| date_sai          |                   | x             | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       |                                                              | Fiche d'information : Depart (ECL) |             |
| etat_dep          |                   | x             | Etat du départ                                                                                                                          | Formatage par une liste de domaine ( lt_ecl_etat)            | Fiche d'information : Depart (ECL) |             |
| id_depart         |                   |               | Identifiant du départ interne à l'ARC                                                                                                   |                                                              | Fiche d'information : Depart (ECL) |             |
| id_ouvelec        |                   |               | Lien vers table armoire                                                                                                                 |                                                              | Fiche d'information : Depart (ECL) |             |
| nom_depart        |                   |               | Nom du secteur déservi par le départ                                                                                                    |                                                              | Fiche d'information : Depart (ECL) |             |
| observ            |                   |               | Commentaires divers                                                                                                                     |                                                              | Fiche d'information : Depart (ECL) |             |
| op_sai            |                   |               | Opérateur de la saisie de la donnée                                                                                                     |                                                              | Fiche d'information : Depart (ECL) |             |
| puis_sous         |                   |               | Puissance souscrite (W)                                                                                                                 |                                                              | Fiche d'information : Depart (ECL) |             |
| situation         |                   | x             | Situation                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_situation)       | Fiche d'information : Depart (ECL) |             |
| tension           |                   |               | Tension électrique en sortie                                                                                                            |                                                              | Fiche d'information : Depart (ECL) |             |
| ty_disjonc        |                   | x             | Type du disjoncteur                                                                                                                     | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Fiche d'information : Depart (ECL) |             |
| ty_fusible        |                   | x             | Type du fusible                                                                                                                         | Formatage par une liste de domaine (lt_ecl_type_fusible)     | Fiche d'information : Depart (ECL) |             |


## Table : `an_ecl_erreur`
| Atributs      | Champ calculé     | Formatage     | Renommage                       | Particularité/Usage     | Utilisation                     | Exemple     |
|:-------------:|:-----------------:|:-------------:| ------------------------------- | ----------------------- | ------------------------------- | ----------- |
| champ_calcule | x                 | x             | Message d'erreur                |                         | Recherche : Recherche d' erreur |             |
| heure         |                   |               | Heure                           |                         |                                 |             |
| id_erreur     |                   |               | Id de l'erreur, interne au SIG  |                         |                                 |             |
| id_objet      |                   |               | Id de l'objet, interne au SIG   |                         |                                 |             |
| message       |                   |               | Message                         |                         |                                 |             |

## Table : `an_ecl_foyer`
| Atributs      | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                     | Utilisation                     | Exemple     |
|:-------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------- | ----------- |
| champ_calcule | x                 |               | Champ calculé                                                                                                                           |                                                                         | Recherche : Recherche de foyer  |             |
| dat_pos_lm    |                   | x             | Date de pose de la lampe                                                                                                                |                                                                         | Fiche information : Foyer (ECL) |             |
| dat_pos_ln    |                   | x             | Date de la pose de la lanterne                                                                                                          |                                                                         | Fiche information : Foyer (ECL) |             |
| date_donne    |                   | x             | Date Donne                                                                                                                              |                                                                         | Fiche information : Foyer (ECL) |             |
| date_maj      |                   | x             | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  |                                                                         | Fiche information : Foyer (ECL) |             |
| date_sai      |                   | x             | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       |                                                                         | Fiche information : Foyer (ECL) |             |
| etat_foy      |                   | x             | Etat du foyer                                                                                                                           | Formatage par une liste de domaine (  lt_ecl_etat)                      | Fiche information : Foyer (ECL) |             |
| haut_feu      |                   |               | Hauteur max de la lanterne par rapport au niveau de la chaussée                                                                         |                                                                         | Fiche information : Foyer (ECL) |             |
| id_foyer      |                   |               | Numéro du foyer interne à l'ARC                                                                                                         |                                                                         | Fiche information : Foyer (ECL) |             |
| id_mod_lm     |                   | x             | Modèle de la lampe                                                                                                                      | Formatage par une liste de domaine ( an_ecl_modele_lampe)               | Fiche information : Foyer (ECL) |             |
| id_mod_ln     |                   | x             | Modèle de la lanterne                                                                                                                   | Formatage par une liste de domaine ( an_ecl_modele_lanterne)            | Fiche information : Foyer (ECL) |             |
| id_supp       |                   |               | Identifiant du support sur lequel repose le foyer                                                                                       |                                                                         | Fiche information : Foyer (ECL) |             |
| loc_plat      |                   | x             | Loc Plat                                                                                                                                | Formatage par une liste de domaine ( lt_ecl_emplacement (code))         | Fiche information : Foyer (ECL) |             |
| observ        |                   |               | Commentaires divers                                                                                                                     |                                                                         | Fiche information : Foyer (ECL) |             |
| op_sai        |                   |               | Opérateur de la saisie de la donnée                                                                                                     |                                                                         | Fiche information : Foyer (ECL) |             |
| pct_fct       |                   |               | Pourcentage de puissance de fonctionnement                                                                                              |                                                                         | Fiche information : Foyer (ECL) |             |
| situation     |                   | x             | Situation                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_situation)                  | Fiche information : Foyer (ECL) |             |
| ty_amorce     |                   | x             | Type d'amorceur installé                                                                                                                | Formatage par une liste de domaine ( lt_ecl_amorceur (code))            | Fiche information : Foyer (ECL) |             |
| ty_auto_tr    |                   | x             | Type d'auto trasformateur installé                                                                                                      | Formatage par une liste de domaine ( lt_ecl_auto_transformateur (code)) | Fiche information : Foyer (ECL) |             |
| ty_ballast    |                   | x             | Type de ballast installé                                                                                                                | Formatage par une liste de domaine ( lt_ecl_type_ballast (code))        | Fiche information : Foyer (ECL) |             |
| ty_lantern    |                   | x             | Ty Lantern                                                                                                                              | Formatage par une liste de domaine ( lt_ecl_type_lanterne)              | Fiche information : Foyer (ECL) |             |




