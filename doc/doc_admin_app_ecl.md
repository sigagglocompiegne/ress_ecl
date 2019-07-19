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
| Atributs          | Champ calculé     | Formatage     | Renommage  |                                                                                                                           Particularité/Usage                                          | Utilisation                        | Exemple     |
|:-----------------:|:-----------------:|:-------------:| ---------- | ------------------------------------------------------------ | ---------------------------------- | ----------- |
| Affiche recherche | x                 |               | Affiche recherche                                                                                                                       |                                                              | Recherche : Recherche de départ    |             |
| date_donne        |                   | x             | Date Donne                                                                                                                              | Les heures ne sont pas affichées                             | Fiche d'information : Depart (ECL) |             |
| date_maj          |                   | x             | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  |                                                              | Fiche d'information : Depart (ECL) |             |
| date_sai          |                   | x             | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       |                                                              | Fiche d'information : Depart (ECL) |             |
| etat_dep          |                   | x             | Etat du départ                                                                                                                          | Formatage par une liste de domaine ( lt_ecl_etat)            | Fiche d'information : Depart (ECL) |             |
| situation         |                   | x             | Situation                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_situation)       | Fiche d'information : Depart (ECL) |             |
| ty_disjonc        |                   | x             | Type du disjoncteur                                                                                                                     | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Fiche d'information : Depart (ECL) |             |
| ty_fusible        |                   | x             | Type du fusible                                                                                                                         | Formatage par une liste de domaine (lt_ecl_type_fusible)     | Fiche d'information : Depart (ECL) |             |

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|Nom de départ|nom_depart||Filtre à suggestion de valeur|Est égale à une valeur choisie par l'utilisateur|Valeur suggérée de "nom_depart"| Permet de faire une rechercher par nom de départ|
|Situation != supprimer|situation|x|Alphanumerique|est différente de une(des) valeur(s) par défaut|12| Empêche l'apparation des départ supprimés|

| Géotables ou Tables          | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------- | --------------------------------------------------------- | -------- |
| geo_v_ecl_ouvrage_electrique | id_ouvelec                                                | 1        |
| geo_ecl_noeud                | id_ouvelec  - id_noeud                                    | 0…n      |
| an_ecl_erreur                | id_depart - id_objet                                      | 0…n      |
| an_ecl_intervention          | id_depart - id_objet                                      | 0…n      |


## Table : `an_ecl_erreur`
| Atributs      | Champ calculé     | Formatage     | Renommage                       | Particularité/Usage     | Utilisation                     | Exemple     |
|:-------------:|:-----------------:|:-------------:| ------------------------------- | ----------------------- | ------------------------------- | ----------- |
| champ_calcule | x                 | x             | Message d'erreur                |     (1)                    | Recherche : Recherche d' erreur |             |

(1) Requête SQL permettant d'afficher temporairement un message d'erreur dans la fiche d'information `
 CASE WHEN
  extract(epoch from  now()::timestamp) - extract(epoch from
{horodatage}::timestamp) <= 3 then 
'<table width=100%><td bgcolor="#FF000">
<font size=6 color="#ffffff"><center><b>' ||
{erreur} ||
'</b></center></font></td></table>'
ELSE '' 
END
`
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
| id_mod_lm     |                   | x             | Modèle de la lampe                                                                                                                      | Formatage par une liste de domaine ( an_ecl_modele_lampe)               | Fiche information : Foyer (ECL) |             |
| id_mod_ln     |                   | x             | Modèle de la lanterne                                                                                                                   | Formatage par une liste de domaine ( an_ecl_modele_lanterne)            | Fiche information : Foyer (ECL) |             |
| loc_plat      |                   | x             | Loc Plat                                                                                                                                | Formatage par une liste de domaine ( lt_ecl_emplacement (code))         | Fiche information : Foyer (ECL) |             |
| situation     |                   | x             | Situation                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_situation)                  | Fiche information : Foyer (ECL) |             |
| ty_amorce     |                   | x             | Type d'amorceur installé                                                                                                                | Formatage par une liste de domaine ( lt_ecl_amorceur (code))            | Fiche information : Foyer (ECL) |             |
| ty_auto_tr    |                   | x             | Type d'auto trasformateur installé                                                                                                      | Formatage par une liste de domaine ( lt_ecl_auto_transformateur (code)) | Fiche information : Foyer (ECL) |             |
| ty_ballast    |                   | x             | Type de ballast installé                                                                                                                | Formatage par une liste de domaine ( lt_ecl_type_ballast (code))        | Fiche information : Foyer (ECL) |             |
| ty_lantern    |                   | x             | Ty Lantern                                                                                                                              | Formatage par une liste de domaine ( lt_ecl_type_lanterne)              | Fiche information : Foyer (ECL) |             |

| Nom                    | Attribut                       | Au chargement     | Type           | Condition                                                        | Valeur                                       | Description                                                            |
| ---------------------- | ------------------------------ |:-----------------:|:--------------:|:----------------------------------------------------------------:| -------------------------------------------- | ---------------------------------------------------------------------- |
| Si lampe par défaut    | id_mod_lm (modèle de lampe)    |                   | Alphanumérique | est égale à une valeur par défaut                                | 1                                            | Filtre pour la recherche ''Foyer dont la lampe n'est pas renseignée''. |
| Situation != supprimer | situation                      | x                 | Alphanumérique | est différente de une(des) valeur(s) par défaut                  | 12                                           | Empêche l'apparation des départ supprimés                              |
| Modèle de lampe        | id_mod_lm (modèle de lampe)    |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste | est égale à une valeur listée de "id_mod_lm" | Recherche de foyer par un certain modèle de lampe                      |
| Modèle de lanterne     | id_mod_ln (modèle de lanterne) |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste | est égale à une valeur listée de "id_mod_ln" | Recherche de foyer par un certain modèle de lanterne                   |

| Géotables ou Tables                      | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_modele_lanterne                   | id_mod_ln                                                 | 1        |
| an_ecl_modele_lampe                      | id_mod_lm                                                 | 1        |
| geo_ecl_noeud                            | id_supp - id_noeud                                        | 0…n      |
| an_ecl_intervention (Intervention Foyer) | id_depart - id_objet                                      | 0…n      |
| an_ecl_erreur                            | id_foyer - id_objet                                       | 0…n      |



## Table : `an_ecl_modele_lampe`
| Atributs     | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                                                                                                                                                                      | Utilisation                              | Exemple     |
|:------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------- | ----------- |
| cle_media    | x                 |               | cle_media                                                                                                                               | Correspond à l'id de l'objet avec LM en préfixe. Les autres types de modèles ont le même type d'attribut avec un préfixe différent. Cela permet de tous les relier à la même table modèle malgré leur séquence différente. | Relation  avec an_ecl_media_modele.      |             |
| cou_ecl      |                   | x             | Couleur d'éclairage de la lampe                                                                                                         | Formatage par une liste de domaine ( lt_ecl_couleur_eclairage )                                                                                                                                                          | Fiche d'information : modèle lampe (ECL) |             |
| cul_lamp     |                   | x             | Culot de la lampe                                                                                                                       | Formatage par une liste de domaine ( lt_ecl_culot_lampe )                                                                                                                                                                | Fiche d'information : modèle lampe (ECL) |             |
| date_maj     |                   | x             | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  | Les heures ne sont pas affichées                                                                                                                                                                                         | Fiche d'information : modèle lampe (ECL) |             |
| date_sai     |                   | x             | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       | Les heures ne sont pas affichées                                                                                                                                                                                         | Fiche d'information : modèle lampe (ECL) |             |
| puis_lam     |                   | x             | Puissance de la lampe                                                                                                                   | Formatage par une liste de domaine ( lt_ecl_puissance_lampe  )                                                                                                                                                           | Fiche d'information : modèle lampe (ECL) |             |
| telgest      |                   | x             | Présence d'une télégestion                                                                                                              | Formatage par une liste de domaine ( lt_ecl_presence  )                                                                                                                                                                  | Fiche d'information : modèle lampe (ECL) |             |
| ty_lampe     |                   | x             | Type de lampe                                                                                                                           | Formatage par une liste de domaine ( lt_ecl_type_lampe )                                                                                                                                                                 | Fiche d'information : modèle lampe (ECL) |             |


| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                                                                                                                                        |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Domaine de valeur       | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est supérieure ou égale à                       | 0          | Filtre activé au chargement du domaine de valeur utilisant la table an_ecl_modele_lampe, afin de l'actualiser en posant une contrainte. Technique ayant pour but d'éviter le besoin de recharger l'application pour qu'une nouvelle valeur ajoutée par l'utilisateur dans la table an_ecl_modele_lampe apparaisse. |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de lampe", afin de ne pas fair apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions                                                                                                                           |


| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            | 0…n      |


## Table : `an_ecl_modele_lanterne`
| Atributs     | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                                                                                                                                                                        | Utilisation                                 | Exemple     |
|:------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- | ----------- |
| clas_el_ln   |                   | x             | Classe électrique de la lanterne                                                                                                        | Formatage par une liste de domaine ( lt_ecl_type_lampe )                                                                                                                                                                   | Fiche d'information : modèle lanterne (ECL) |             |
| cle_media    | x                 |               | cle_media                                                                                                                               | Correspond à l'id de l'objet avec LN en préfixe. Les autres types de modèles ont le même type d'attribut avec un préfixe différent. Cela permet de tous les relier à la même table modèle malgré leur séquence différente. | Relation  avec an_ecl_media_modele.         |             |
| cod_ral_ln   |                   |               | Code RAL de la lanterne                                                                                                                 |                                                                                                                                                                                                                            | Fiche d'information : modèle lanterne (ECL) |             |
| date_maj     |                   |     x          | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  | Les heures ne sont pas affichées                                                                                                                                                                                           | Fiche d'information : modèle lanterne (ECL) |             |
| date_sai     |                   |         x      | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       | Les heures ne sont pas affichées                                                                                                                                                                                           | Fiche d'information : modèle lanterne (ECL) |             |

| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                                                                                                                                                                                  |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Domaine de valeur       | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est supérieure ou égale à                       | 0          | Filtre activé au chargement du domaine de valeur utilisant la table an_ecl_modele_lanterne, afin de l'actualiser en posant une contrainte qui oblige GEO à recalculer le domaine. Technique ayant pour but d'éviter le besoin de recharger l'application pour qu'une nouvelle valeur ajoutée par l'utilisateur dans la table an_ecl_modele_lampe apparaisse. |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de lanterne", afin de ne pas fair apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions                                                                                                                                                                  |

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            | 0…n      |
| an_ecl_erreur           | id_mod_sup - id_objet                                     | o…n      |


## Table : `an_ecl_modele_support`

| Atributs     | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                               | Utilisation                             | Exemple     |
|:------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | --------------------------------------- | ----------- |
| cle_media    | x                 |               | cle_media                                                                                                                               |                                                                   |                                         |             |
| cod_ral_s    |                   |               | Code RAL du support                                                                                                                     |                                                                   | Fiche d'information :support ( modèle ) |             |
| date_maj     |                   | x             | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  | Les heures ne sont pas affichées                                  | Fiche d'information :support ( modèle ) |             |
| date_sai     |                   | x             | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       | Les heures ne sont pas affichées                                  | Fiche d'information :support ( modèle ) |             |

| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de support", afin de ne pas fair apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            | 0…n      |
| an_ecl_erreur           | id_mod_sup - id_objet                                     | o…n      |



## Table : `geo_ecl_cable`
| Atributs            | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                                                                               | Utilisation                     | Exemple     |
|:-------------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- | ----------- |
| $$                  | x                 |               | $$                                                                                                                                      | Contient le caractère ' ' . Pour gérer le fait que GEO affiche en haut de la fiche info le 1er  champ du résultat d'une recherche | Recherche : Recherche de câble  |             |
| Affichage recherche | x                 |               | Affichage recherche                                                                                                                     | Formate l'affichage d'un texte en fonction des attributs de la recherche                                                          | Recherche : Recherche de câble  |             |
| champ_calcule_1     | x                 |               | Champ calculé 1                                                                                                                         | Permet de lier deux champs qui détermine l'affichage du câble sur la carte                                                        | Cartographie : ECL              |             |
| etat_cable          |                   | x             | Etat du câble                                                                                                                           | Formatage par une liste de domaine ( lt_ecl_etat )                                                                                | Fiche information : Câble (ECL) |             |
| qua_geo_xy          |                   | x             | Qua Geo Xy                                                                                                                              | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation  )                                                            | Fiche information : Câble (ECL) |             |
| qua_geo_z           |                   | x             | Qua Geo Z                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation  )                                                            | Fiche information : Câble (ECL) |             |
| sect_cab            |                   | x             | Section du câble                                                                                                                        | Formatage par une liste de domaine ( lt_ecl_section_cable  )                                                                      | Fiche information : Câble (ECL) |             |
| situ_cab            |                   | x             | Situation physique du câble                                                                                                             | Formatage par une liste de domaine ( lt_ecl_situation_cable )                                                                     | Fiche information : Câble (ECL) |             |
| situation           |                   | x             | Situation                                                                                                                               | Formatage par une liste de domaine ( lt_ecl_situation )                                                                           | Fiche information : Câble (ECL) |             |
| src_geom            |                   | x             | Source du référentiel géographique pour le positionnement du nœud                                                                       | Formatage par une liste de domaine ( lt_src_geom )                                                                                | Fiche information : Câble (ECL) |             |

| Nom                    | Attribut                          | Au chargement     | Type           | Condition                                       | Valeur     | Description                               |
| ---------------------- | --------------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ----------------------------------------- |
| Situation != supprimer | situation                         | x                 | Alphanumérique | est différente de une(des) valeur(s) par défaut | 12         | Empêche l'apparation des départ supprimés |
| id_nd_fin est null     | id_nd_fin (nœud final du câble)   |                   | Alphanumérique | La valeur de “id_nd_fin” est                    | null       | Recherche : "câble non relié"             |
| id_nd_ini est null     | id_nd_ini (nœud initial du câble) |                   | Alphanumérique | La valeur de “id_nd_ini” est                    | null       | Recherche : "câble non relié"             |


| Géotables ou Tables                      | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_intervention (Intervention câble) | id_cab - id_objet                                         | 0…n      |
| xapps_an_v_ecl_tension_cable             | id_cab                                                    | 0…1      |



## Table : `an_ecl_intervention`
| Atributs                       | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                              | Utilisation                                   | Exemple     |
|:------------------------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------- | ----------- |
| Affiche-recherche-intervention | x                 |               | Affiche-recherche-intervention                                                                                                          | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée. | Recherche : Rapport d'intervention            |             |
| Affiche-recherche-signalement  | x                 |               | Affiche-recherche-signalement                                                                                                           | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée. | Recherche : Rapport de signalement            |             |



| Nom                                | Attribut                                         | Au chargement     | Type           | Condition                                                                                       | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ------------------------------------------------ |:-----------------:|:--------------:|:-----------------------------------------------------------------------------------------------:| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Etats                              | etat_sign                                        |                   | Alphanumérique | La valeur de “etat_sign” =est égale à                                                           | 10 , 50 ou 40 | Sélectionne les interventions/signalements qui ne sont pas réglés (soumis, classé sans suite, pour information), de façon à les faire apparaître dans le rapport de signalement .  |
| Dates_intervention                 | dat_real (Date de réalisation de l'intervention) |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur et une valeur choisie par l'utilisateur |               | Sert à la recherche : "Rapport d'intervention", afin de faire apparaître toutes les interventions réalisées entre deux dates.                                                      |
| Dates signalement                  | dat_signa (Date du signalement)                  |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur etune valeur choisie par l'utilisateur  |               | Sert à la recherche : "Rapport de signalement", afin de faire apparaître tous les signalements réalisées entre deux dates.                                                         |
| Intervention oui / signalement non | type_si_in (Signalement ou intervention)         |                   | Alphanumérique | La valeur de “type_si_in” =est égale à                                                          | 20            | Sert à la rechercher : '' Rapport d'intervention'' afin de ne sélectionner que les interventions                                                                                   |
| Signalement oui / intervention non | type_si_in (Signalement ou intervention)         |                   | Alphanumérique | La valeur de “type_si_in” =est égale à                                                          | 10            | Sert à la rechercher : '' Rapport de signalement'' afin de ne sélectionner que les signalements                                                                                    |


| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| geo_ecl_noeud           | id_noeud                                                  | 0…1      |


--> Intervention Foyer, Intervention Câble, Intervention Départ, intervention Points lumineux, Intervention PI, Intervention ouvrage  
## Table : `an_ecl_intervention`
| Atributs                       | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                              | Utilisation                                   | Exemple     |
|:------------------------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------- | ----------- |
|Champ_calcule|x||Dates|Formate l'affichage des différentes dates dans les fiches informations des interventions| Fiches informations (Foyer, départ, Ouvrage électrique, câble, point lumineux, PI)||
| att_met1                       |                   | x             | Attribut métier dédié au type de disjoncteur / type de ballast                                                                          | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met2                       |                   | x             | Attribut métier Dédié au type de fusible / type d'amorce                                                                                | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met3                       |                   | x             | Attribut métier Dédié au type de parasurtenseur / type de commande / type d'auto transformateur                                         | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met4                       |                   | x             | Attribut métier Dédié à la mise en terre / modele de lanterne                                                                           | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met5                       |                   | x             | Attribut métier Dédié au modèle de lampe                                                                                                | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met6                       |                   | x             | Attribut métier Dédié à l'état de l'objet ciblé par l'intervention                                                                      | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met7                       |                   | x             | Attribut métier Dédié au nom du départ / aux options du support                                                                         | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| att_met8                       |                   | x             | Attribut métier Dédié à la tension / pourcentage de puissance de fonctionnement                                                         | Formatage par une liste de domaine (Voir tableau ci-après)                       | Fiche information (Voir tableau ci-après)     |             |
| dat_progra                     |                   | x             | Date de la programmation                                                                                                                | Les heures ne sont pas affichées                                                 | Fiches informations des Fiches d'intervention |             |
| dat_real                       |                   | x             | Date de la réalisation de l'intervention                                                                                                | Les heures ne sont pas affichées                                                 | Fiches informations des Fiches d'intervention |             |
| dat_signa                      |                   | x             | Date du signalement                                                                                                                     | Les heures ne sont pas affichées                                                 | Fiches informations des Fiches d'intervention |             |
| date_maj                       |                   |  x            | Horodatage correspondant à la date de mise à jour de la donnée sans intégration du décalage horaire par rapport au méridient d'origine  | Les heures ne sont pas affichées                                                 | Fiches informations des Fiches d'intervention |             |
| date_sai                       |                   |  x            | Horodatage correspondant à la date de saisie de la donnée sans intégration du décalage horaire par rapport au méridient d'origine       | Les heures ne sont pas affichées                                                 | Fiches informations des Fiches d'intervention |             |
| etat_sign                      |                   | x             | Etat du signalement                                                                                                                     | Formatage par une liste de domaine ( lt_ecl_etat_signalement_affichage )        | Fiches informations des Fiches d'intervention |             |
| moy_interv                     |                   | x             | Moyen d'intervention                                                                                                                    | Formatage par une liste de domaine ( lt_ecl_moyen_intervention  )                | Fiches informations des Fiches d'intervention |             |
| src_def                        |                   | x             | Source de la défaillance                                                                                                                | Formatage par une liste de domaine ( lt_ecl_source_defaillance  )                | Fiches informations des Fiches d'intervention |             |
| TRI -                          | x                 |               | TRI -                                                                                                                                   |                                                                                  | Fiches informations des Fiches d'intervention |             |
| typ_def                        |                   | x             | Type de défaillance                                                                                                                     | Formatage par une liste de domaine ( lt_ecl_type_defaillance  )                  | Fiches informations des Fiches d'intervention |             |
| type_inter                     |                   | x             | Type d'intervention                                                                                                                     | Formatage par une liste de domaine ( lt_intervention_point_lumineux  )           | Fiches informations des Fiches d'intervention |             |
| type_si_in                     |                   | x             | Signalement ou intervention                                                                                                             | Formatage par une liste de domaine ( lt_ecl_signalement_intervention  )          | Fiches informations des Fiches d'intervention |             |



### Table : 'att_met1' 
| Fiche information           | Utilisé     | Particularité/Usage                                          |
| --------------------------- | ----------- | ------------------------------------------------------------ |
| Intervention câble          |             |                                                              |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) |
| Intervention foyer          | x           | Formatage par une liste de domaine (lt_ecl_type_ballast)     |
| Intervention PI             |             |                                                              |

### Table : 'att_met2' 
| Fiche information           | Utilisé     | Particularité/Usage                                      |
| --------------------------- | ----------- | -------------------------------------------------------- |
| Intervention câble          |             |                                                          |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) |
| Intervention foyer          | x           | Formatage par une liste de domaine ( lt_ecl_amorceur )   |
| Intervention PI             |             |                                                          |

### Table : 'att_met3' 
| Fiche information           | Utilisé     | Particularité/Usage                                                |
| --------------------------- | ----------- | ------------------------------------------------------------------ |
| Intervention câble          |             |                                                                    |
| Intervention point-lumineux | x           | Formatage par une liste de domaine ( lt_ecl_type_parasurtenseur )  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine ( lt_ecl_auto_transformateur  ) |
| Intervention depart         |             |                                                                    |
| Intervention foyer          | x           | Formatage par une liste de domaine ( lt_ecl_auto_transformateur  ) |
| Intervention PI             |             |                                                                    |

### Table : 'att_met4' 
| Fiche information           | Utilisé     | Particularité/Usage                                          |
| --------------------------- | ----------- | ------------------------------------------------------------ |
| Intervention câble          |             |                                                              |
| Intervention point-lumineux |             |                                                              |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) |
| Intervention depart         |             |                                                              |
| Intervention foyer          |             |                                                              |
| Intervention PI             |             |                                                              |

### Table : 'att_met5' 
| Fiche information           | Utilisé     | Particularité/Usage                                                                  |
| --------------------------- | ----------- | ------------------------------------------------------------------------------------ |
| Intervention câble          |             |                                                                                      |
| Intervention point-lumineux |             |                                                                                      |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_fusible)                             |
| Intervention depart         |             |                                                                                      |
| Intervention foyer          | x           | Formatage par une liste de domaine ( xapps_geo_v_ecl_intervention_liste_affichage  ) |
| Intervention PI             |             |                                                                                      |

### Table : 'att_met6' 
| Fiche information           | Utilisé     | Particularité/Usage                               |
| --------------------------- | ----------- | ------------------------------------------------- |
| Intervention câble          | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention foyer          | x           | Formatage par une liste de domaine (lt_ecl_etat ) |
| Intervention PI             | x           | Formatage par une liste de domaine (lt_ecl_etat)  |

### Table : 'att_met7' 
| Fiche information           | Utilisé     | Particularité/Usage                                                                  |
| --------------------------- | ----------- | ------------------------------------------------------------------------------------ |
| Intervention câble          |             |                                                                                      |
| Intervention point-lumineux |             |                                                                                      |
| Intervention ouvrage        | x           | nom du départ                                                                        |
| Intervention depart         | x           | Formatage par une liste de domaine ( xapps_geo_v_ecl_intervention_liste_affichage  ) |
| Intervention foyer          | x           | Formatage par une liste de domaine ( an_ecl_modele_lanterne )                        |
| Intervention PI             |             |                                                                                      |


### Table : 'att_met8' 
| Fiche information           | Utilisé     | Particularité/Usage                                         |
| --------------------------- | ----------- | ----------------------------------------------------------- |
| Intervention câble          |             |                                                             |
| Intervention point-lumineux |             |                                                             |
| Intervention ouvrage        | x           | Tension du départ                                           |
| Intervention depart         |             |                                                             |
| Intervention foyer          | x           | Formatage par une liste de domaine ( an_ecl_modele_lampe  ) |
| Intervention PI             |             |                                                             |


| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_erreur           | id_noeud                                                  | 0…n      |



## Table : `geo_v_ecl_ouvrage_electrique`
| Atributs       | Champ calculé     | Formatage     | Renommage                                               | Particularité/Usage                                                                                                               | Utilisation                                | Exemple     |
|:--------------:|:-----------------:|:-------------:| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ | ----------- |
| $$             | x                 |               | $$                                                      | Contient le caractère ' ' . Pour gérer le fait que GEO affiche en haut de la fiche info le 1er  champ du résultat d'une recherche |                                            |             |
| affiche_result | x                 |               | affiche_result                                          | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée.                                                  | Recherche : Recherche d'ouvrage électrique |             |
| depart         |                   | x             | Numéro de départ auquel est lié le noeud                | Formatage par une liste de domaine ( an_ecl_depart )                                                                              | Fiche information : Ouvrage electrique     |             |
| etat_ouvel     |                   | x             | Etat de l'ouvrage électrique                            | Formatage par une liste de domaine ( lt_ecl_etat )                                                                                | Fiche information : Ouvrage electrique     |             |
| mod_pos_ou     |                   | x             | Mode de pose de l'ouvrage                               | Formatage par une liste de domaine ( lt_ecl_mode_pose_ouvrage_electrique )                                                        | Fiche information : Ouvrage electrique     |             |
| pres_var       |                   | x             | Pres Var                                                | Formatage par une liste de domaine ( lt_ecl_presence  )                                                                           | Fiche information : Ouvrage electrique     |             |
| qua_dat        |                   | x             | Qualité de la date de pose de l'ouvrage                 | Formatage par une liste de domaine ( lt_ecl_qualite_date  )                                                                       | Fiche information : Ouvrage electrique     |             |
| qua_geo_xy     |                   | x             | Classe de la géolocalisation en XY                      | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation  )                                                            | Fiche information : Ouvrage electrique     |             |
| qua_geo_z      |                   | x             | Classe de la géolocalisation en Z                       | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation  )                                                            | Fiche information : Ouvrage electrique     |             |
| situation      |                   | x             | Situation générale : actif, inactif,supprimé            | Formatage par une liste de domaine ( lt_ecl_situation )                                                                           | Fiche information : Ouvrage electrique     |             |
| src_geom       |                   | x             | Source utilisée pour la géolocalisation                 | Formatage par une liste de domaine ( lt_src_geom )                                                                                | Fiche information : Ouvrage electrique     |             |
| ty_comm        |                   | x             | Type de commande                                        | Formatage par une liste de domaine ( lt_ecl_type_commande )                                                                       | Fiche information : Ouvrage electrique     |             |
| ty_disjonc     |                   | x             | Type de disjoncteur                                     | Formatage par une liste de domaine ( lt_ecl_type_disjoncteur )                                                                    | Fiche information : Ouvrage electrique     |             |
| ty_fusible     |                   | x             | Type de fusible                                         | Formatage par une liste de domaine ( lt_ecl_type_fusible )                                                                        | Fiche information : Ouvrage electrique     |             |
| ty_ouvelec     |                   | x             | Type d'ouvrage électrique                               | Formatage par une liste de domaine ( lt_ecl_type_ouvrage_electrique )                                                             | Fiche information : Ouvrage electrique     |             |

| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Etat                   | etat_ouvel                               |                   | Prédéfinis     | La valeur de “etat_ouvel” =est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de "etat_ouvel" | Sert à la recherche : ''Recherche d'ouvrages électriques"                                            |
| armoires principales   | ty_ouvelec (type d'ouvrage)              |                   | Alphanumérique | La valeur de “ty_ouvelec” =est égale à                                                      | 10                                | On ne sélectionne que les armoires principales : sert au domaine de valeur des armoires principales. |
| type d'ouvrage         | dat_signa (Date du signalement)          |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                            | une valeur listée de "ty_ouvelec" | Sert à la recherche : ''Recherche d'ouvrages électriques"                                            |
| Nom de l'ouvrage       | type_si_in (Signalement ou intervention) |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                            | une valeur listée de "nom_ouv"    | Sert à la rechercher : '' Rapport d'intervention'' afin de ne sélectionner que les interventions     |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l'apparation des ouvrages supprimés sur la cartographie                                      |

| Géotables ou Tables                         | Champs de jointure (champs table - champs table liée)     | Type     |
| ------------------------------------------- | --------------------------------------------------------- | -------- |
| **an_ecl_depart**                           | id_ouvelec                                                | 0…n      |
| an_ecl_media                                | id_ouvelec - id                                           | 0…n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire | id_ouvelec - id_noeud                                     | 1        |
| an_ecl_erreur                               | id_ouvelec - id_objet                                     | 0…n      |
| an_ecl_intervention (intervention ouvrage)  | id_ouvelec - id_objet                                     | 0…n      |




## Table : `geo_v_ecl_point_lumineux`
| Atributs                         | Champ calculé     | Formatage     | Renommage                                               | Particularité/Usage                                                                                                               | Utilisation                                  | Exemple     |
|:--------------------------------:|:-----------------:|:-------------:| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- | ----------- |
| $$                               | x                 |               | $$                                                      | Contient le caractère ' ' . Pour gérer le fait que GEO affiche en haut de la fiche info le 1er  champ du résultat d'une recherche | Recherche : Recherche de support             |             |
| Affiche_recherche                | x                 |               | Affiche_recherche                                       | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée.                                                  | Recherche : Recherche de support             |             |
| depart                           |                   | x             | Numéro de départ auquel est lié le noeud                | Formatage par une liste de domaine ( an_ecl_depart )                                                                              | Fiche information : Point lumineux (support) |             |
| etat_supp                        |                   | x             | Etat general du support                                 | Formatage par une liste de domaine ( lt_ecl_etat )                                                                                | Fiche information : Point lumineux (support) |             |
| haut_trap                        |                   | x             | Haut Trap                                               | Formatage par une liste de domaine ( lt_ecl_hauteur_trappe  )                                                                     | Fiche information : Point lumineux (support) |             |
| id_mod_sup                       |                   | x             | Identifiant du modèle du support                        | Formatage par une liste de domaine ( an_ecl_modele_support )                                                                      | Fiche information : Point lumineux (support) |             |
| opt_supp                         |                   | x             | Opt Supp                                                | Formatage par une liste de domaine ( lt_ecl_options_support  ) - attribut multivalué.                                             | Fiche information : Point lumineux (support) |             |
| qua_dat                          |                   | x             | Qua Dat                                                 | Formatage par une liste de domaine ( lt_ecl_qualite_date )                                                                        | Fiche information : Point lumineux (support) |             |
| qua_geo_xy                       |                   | x             | Classe de la géolocalisation en XY                      | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                                                             | Fiche information : Point lumineux (support) |             |
| qua_geo_z                        |                   | x             | Classe de la géolocalisation en Z                       | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                                                             | Fiche information : Point lumineux (support) |             |
| situation                        |                   | x             | Situation générale : actif, inactif,supprimé            | Formatage par une liste de domaine ( lt_ecl_situation )                                                                           | Fiche information : Point lumineux (support) |             |
| src_geom                         |                   | x             | Source utilisée pour la géolocalisation                 | Formatage par une liste de domaine ( lt_src_geom )                                                                                | Fiche information : Point lumineux (support) |             |
| ty_disjonc                       |                   | x             | Ty Disjonc                                              | Formatage par une liste de domaine ( lt_ecl_type_disjoncteur )                                                                    | Fiche information : Point lumineux (support) |             |
| ty_fusible                       |                   | x             | Type de fusible installé                                | Formatage par une liste de domaine ( lt_ecl_type_fusible )                                                                        | Fiche information : Point lumineux (support) |             |
| ty_parasu                        |                   | x             | Ty Parasu                                               | Formatage par une liste de domaine ( lt_ecl_type_parasurtenseur )                                                                 | Fiche information : Point lumineux (support) |             |
| ty_supp                          |                   | x             | Type de support                                         | Formatage par une liste de domaine ( lt_ecl_type_support )                                                                        | Fiche information : Point lumineux (support) |             |

| Nom                    | Attribut                                | Au chargement     | Type           | Condition                                                                                  | Valeur                                                       | Description                                                            |
| ---------------------- | --------------------------------------- |:-----------------:|:--------------:|:------------------------------------------------------------------------------------------:| ------------------------------------------------------------ | ---------------------------------------------------------------------- |
| Etat                   | etat_supp (état du support)             |                   | Prédéfinis     | La valeur de “etat_supp” =est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de "etat_supp"                             | Sert à la recherche : ''Recherche de support"                          |
| Départ                 | depart (départ auquel et relié le nœud) |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste                           | Une valeur de la liste de domaine : "xapps_geo_v_ecl_depart" | Sert à la recherche : ''Recherche de support"                          |
| type de support        | ty_supp (type de support)               |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                           | une valeur listée de “ty_supp”                               | Sert à la recherche : ''Recherche de support"                          |
| Support sans foyer     | id_supp                                 |                   | SQL            | {id_supp} NOT IN (SELECT id_supp FROM m_reseau_sec.an_ecl_foyer WHERE situation <> '12')   |                                                              | Sert à la recherche : "Recherche de support sans foyer''               |
| Situation != supprimer | situation                               |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                            | 12                                                           | Empêche l'apparation des points-lumineux supprimés sur la cartographie |


| Géotables ou Tables                               | Champs de jointure (champs table - champs table liée)     | Type     |
| ------------------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media                                      | id_supp - id                                           | 0…n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire       | id_supp - id_noeud                                     | 1        |
| an_ecl_erreur                                     | id_supp - id_objet                                     | 0…n      |
| an_ecl_intervention (intervention point lumineux) | id_supp - id_objet                                     | 0…n      |
| xapps_geo_v_ecl_depart                            | depart - id_depart                                        | 0…1      |
| an_ecl_foyer                                      | id_supp                                                   | 0…n      |
| an_ecl_modele_support                             | id_mod_sup                                                | 1        |


## Table : `geo_v_ecl_pi`
| Atributs          | Champ calculé     | Formatage     | Renommage                                               | Particularité/Usage                                                                                                               | Utilisation                              | Exemple     |
|:-----------------:|:-----------------:|:-------------:| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- | ----------- |
| $$                | x                 |               | $$                                                      | Contient le caractère ' ' . Pour gérer le fait que GEO affiche en haut de la fiche info le 1er  champ du résultat d'une recherche | Recherche : Recherche de point d'interet |             |
| Affiche_recherche | x                 |               | Affiche_recherche                                       | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée.                                                  | Recherche : Recherche de point d'interet |             |
| dat_pos           |                   | x             | Date de pose du le point d'interet                      | Les heures ne sont pas affichées                                                                                                  | Fiche information : Point intérêt (PI)   |             |
| date_donne        |                   | x             | Date de la donnée                                       | Les heures ne sont pas affichées                                                                                                  | Fiche information : Point intérêt (PI)   |             |
| date_maj          |                   | x             | Date de dernière mise à jour de la donnée               | Les heures ne sont pas affichées                                                                                                  | Fiche information : Point intérêt (PI)   |             |
| date_sai          |                   | x             | Date de la saisie de la donnée dans la base             | Les heures ne sont pas affichées                                                                                                  | Fiche information : Point intérêt (PI)   |             |
| depart            |                   | x             | Numéro de départ auquel est lié le noeud                | Formatage par une liste de domaine ( an_ecl_depart )                                                                              | Fiche information : Point intérêt (PI)   |             |
| etat_pi           |                   | x             | Etat Pi                                                 | Formatage par une liste de domaine ( lt_ecl_etat )                                                                                | Fiche information : Point intérêt (PI)   |             |
| qua_dat           |                   | x             | Qualité de la date de pose du le point d'interet        | Formatage par une liste de domaine ( lt_ecl_qualite_date )                                                                        | Fiche information : Point intérêt (PI)   |             |
| qua_geo_xy        |                   | x             | Classe de la géolocalisation en XY                      | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                                                             | Fiche information : Point intérêt (PI)   |             |
| qua_geo_z         |                   | x             | Classe de la géolocalisation en Z                       | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                                                             | Fiche information : Point intérêt (PI)   |             |
| situation         |                   | x             | Situation générale : actif, inactif,supprimé            | Formatage par une liste de domaine ( lt_ecl_situation )                                                                           | Fiche information : Point intérêt (PI)   |             |
| ty_pi             |                   | x             | Ty Pi                                                   | Formatage par une liste de domaine ( lt_ecl_type_pi )                                                                             | Fiche information : Point intérêt (PI)   |             |

| Nom                    | Attribut                        | Au chargement     | Type           | Condition                                                        | Valeur                       | Description                                                            |
| ---------------------- | ------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------:| ---------------------------- | ---------------------------------------------------------------------- |
| type_ PI               | ty_pi (type de point d'interet) |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de “ty_pi” | Sert à la recherche : ''Recherche de point d'interet"                  |
| Situation != supprimer | situation                       |      x             | Alphanumérique | est différente de une(des) valeur(s) par défaut                  | 12                           | Empêche l'apparation des points-lumineux supprimés sur la cartographie |

| Géotables ou Tables                                | Champs de jointure (champs table - champs table liée)     | Type     |
| -------------------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media                                       | id_pi - id                                                | 0…n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire        | id_pi - id_noeud                                          | 1        |
| an_ecl_intervention (intervention point d'interet) | id_pi - id_objet                                          | 0…n      |

## Table : 'xapps_geo_v_ecl_intervention_liste_affichage'
| Nom                                    | Attribut                                 | Au chargement     | Type           | Condition         | Valeur       | Description                                                                                             |
| -------------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-----------------:| ------------ | ------------------------------------------------------------------------------------------------------- |
| Etats                                  | etat_sign ( état du signalement)         | x                 | Alphanumérique | est différente de | 00, 60 et 30 | Permet de n'afficher que les entités qui ne sont pas en 'réglé' ou 'non-renseigné' sur la cartographie. |
| Type=signalement (10)                  | type_si_in (Signalement ou Intervention) | x                 | Alphanumérique | est égale à       | 10           | Permet d'afficher que les entités qui sont des signalements sur la cartographie.                        |
| Pour rafaichissement domaine de valeur | geom                                     |                   | Alphanumérique | est non-nulle     |              | Sert à actualiser le domaine de valeur en forçant un calcul de géométrie.                               |

## Table : 'xapps_geo_v_ecl_depart'
| Nom           | Attribut     | Au chargement     | Type     | Condition         | Valeur       | Description                                                                                                                                                          |
| ------------- | ------------ |:-----------------:|:--------:|:-----------------:| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| par géométrie | geom         |                   | Spatial  | est différente de | 00, 60 et 30 | Sélection des départs dont la géométrie (buffer autour du point réalisé en base) contient le point courant. Utilisé dans le domaine de valeur utilisant cette table. |

## Domaine de valeur : 'geo_v_ecl_ouvrage_electrique'
| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l'apparation des ouvrages supprimés                                      |


## Domaine de valeur : 'an_ecl_depart'
| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l'apparation des départs supprimés                 

## Domaine de valeur : 'xapps_geo_v_ecl_intervention_liste_affichage'
| Nom                                    | Attribut                                 | Au chargement     | Type           | Condition         | Valeur       | Description                                                                          |
| -------------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-----------------:| ------------ | ------------------------------------------------------------------------------------ |
| Etats                                  | etat_sign ( état du signalement)         | x                 | Alphanumérique | est différente de | 00, 60 et 30 | Permet de n'afficher que les entités qui ne sont pas en 'réglé' ou 'non-renseigné' . |
| Type=signalement (10)                  | type_si_in (Signalement ou Intervention) | x                 | Alphanumérique | est égale à       | 10           | Permet d'afficher que les entités qui sont des signalements                          |
| Pour rafaichissement domaine de valeur | geom                                     | x                 | Alphanumérique | est non-nulle     |              | Sert à actualiser le domaine de valeur en forçant un calcul de géométrie.            |


## Domaine de valeur : 'xapps_geo_v_ecl_depart'
| Nom           | Attribut     | Au chargement     | Type     | Condition         | Valeur       | Description                                                                                                                                                          |
| ------------- | ------------ |:-----------------:|:--------:|:-----------------:| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| par géométrie | geom         |           x        | Spatial  | est différente de | 00, 60 et 30 | Sélection des départs dont la géométrie (buffer autour du point réalisé en base) contient le point courant. |



## Domaine de valeur : 'an_ecl_modele_support'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_sup (modèle de support) |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_sup = 2), qui sert uniquement pour les interventions |

## Domaine de valeur : 'an_ecl_modele_lanterne'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_ln (modèle de lanterne) |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_ln = 2), qui sert uniquement pour les interventions |

## Domaine de valeur : 'an_ecl_modele_lanterne'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |    x               | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |

