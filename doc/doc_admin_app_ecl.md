            
![GeoCompiegnois](img/Logo_web-GeoCompiegnois.png)

# Documentation technique de l'application d'éclairage public (ECL)

* Statut
  - [ ] à rédiger
  - [ ] en cours de rédaction
  - [ ] relecture
  - [x] finaliser
  - [ ] révision
  
* Historique des versions

|Date | Auteur | Description
|:---|:---|:---|
|17/07/2019|Thibaud BILLOTEAU|version initiale|

# Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![pictogramme de l'application d'éclairage public](/doc/img/ecl_bleu.png)|Eclairage public (ECL)|Cette application est dédiée à la gestion du réseau d'éclairage public de l'ARC (zones de gestion ARC) et de la Ville de Compiègne.|

# Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux personnels gestionnaires des données du réseau ayant les droits d'accès.|

# Droit par profil de connexion

* **Prestataires**

	Sans objet

* **Personnel du service d'éclairage public - Groupe ECL-Edit**

	|Fonctionnalités|Lecture|Écriture|Précisions|
	|:---|:-:|:-:|:---|
	|Toutes|x|x|L'ensemble des fonctionnalités (recherches, cartographies, fiches d'informations, ...) sont accessibles par 	tous les utilisateurs connectés (en écriture pour les fonctions concernées).|

* **Personnel de l'ARC ou de la ville- Groupe ECL-consult / Réseau-consult**
	  * A redéfinir avec le service métier + service SIG *
 
	|Fonctionnalités|Lecture|Écriture|Précisions|
	|:---|:-:|:-:|:---|
	|Toutes les fiches informations|||L'ensemble des fiches d'informations ne sont pas accessibles aux personnes extérieures au service d'éclairage public.|
	|Cartographie|x||L'ensemble des données sont visibles aux personnes extérieures au service d'éclairage public.|
	|Recherches|x||L'ensemble des recherches ne sont pas visibles aux personnes extérieures au service d'éclairage public.|

* **Autres profils**

	Sans objet

# Utilisation des pictos

| Picto                 | Utilisation                                                                                                          |
| --------------------- | -------------------------------------------------------------------------------------------------------------------- |
| ![triangle vert](img/triangle_vert.png)         | Cartographie appx_geo_v_ecl_intervention_liste_affichage                                                             |
| ![triangle gris](img/triangle_gris.png)          | Cartographie appx_geo_v_ecl_intervention_liste_affichage                                                             |
| ![triangle bleu](img/triangle_bleu.png)            | Cartographie appx_geo_v_ecl_intervention_liste_affichage                                                             |
| ![mât 1 foyer](img/mat_1_foyer.png)     | Cartographie Points lumineux                                                                                         |
| ![mât 2 foyer](img/mat_2_foyers.png)   | Cartographie Points lumineux                                                                                         |
| ![mât 3 foyer](img/mat_3_foyers.png)  | Cartographie Points lumineux                                                                                         |
| ![Façade](img/facade.png)               | Cartographie Points lumineux                                                                                         |
| ![lanterne](img/ecp_picto_lanterne.png)             | Fiche information "Support (point lumineux)" et "Foyer (ECL)"                                                        |
| ![départ](img/ecp_picto_depart.png)              | Fiche information Ouvrage électrique                                                                                 |
| ![lampe](img/Lampe_ecl.png)                | Fiche informationFoyer (ECL)                                                                                         |
| ![intervention](img/intervention_ecl.png)        | Fiches informations Câble, Foyer (ECL), Support (point lumineux), Ouvrage électrique, Point d'intérêt, Départ (ECL)  |
|  ![Contrat](img/contrat_ecl.png)               | Fiche information Support (point lumineux), Ouvrage électrique et point d'intérêt (ECL)                              | 
| ![Courant](img/Prise.png)                 | Fiche information Support (point lumineux), Ouvrage électrique et point d'intérêt (ECL)                              |
| ![Métadonnées](img/metadonnees.png)          | Fiches informations Câble, Foyer (ECL), Support (point lumineux), Ouvrage électrique, Point d'intérêt, Départ (ECL)  |
| ![Armoire](img/armoire_ecl.png)                | Cartographie Ouvrage électrique                                                                                      |
| ![sous-Armoire](img/sous_armoire_ecl.png)            | Cartographie Ouvrage électrique                                                                                      |
| ![transformateur](img/transformateur_ecl.png)        | Cartographie Ouvrage électrique                                                                                      |
| ![non-renseigné](img/ouvrage_non_renseigne_ecl.png)        | Cartographie Ouvrage électrique                                                                                      |



# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

## Table : `an_ecl_depart`

| Attributs          | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                          | Utilisation                        | 
|:-----------------:|:-----------------:|:-------------:|:--------------------------------------------:|:------------------------------------------------------------:|:----------------------------------:|
| Affiche recherche | x                 |               | Affiche recherche                            |  Formate l’affichage d’une recherche                                                            | Recherche : Recherche de départ    | 
| date_donne        |                   | x             | Date de la donnée                            | Les heures ne sont pas affichées                             | Fiche d'information : Depart (ECL) |                                                    
| date_maj          |                   | x             | Date de dernière mise à jour de la donnée    | Les heures ne sont pas affichées                             | Fiche d'information : Depart (ECL) |                                                    
| date_sai          |                   | x             | Date de la saisie de la donnée dans la base  | Les heures ne sont pas affichées                             | Fiche d'information : Depart (ECL) |                                                    
| etat_dep          |                   | x             | Etat du départ                               | Formatage par une liste de domaine ( lt_ecl_etat)            | Fiche d'information : Depart (ECL) |                                                    
| situation         |                   | x             | Situation                                    | Formatage par une liste de domaine ( lt_ecl_situation)       | Fiche d'information : Depart (ECL) | 
| ty_disjonc        |                   | x             | Type du disjoncteur                          | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Fiche d'information : Depart (ECL) |                                                    
| ty_fusible        |                   | x             | Type du fusible                              | Formatage par une liste de domaine (lt_ecl_type_fusible)     | Fiche d'information : Depart (ECL) |                                                    

  * ### Filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|Nom de départ|nom_depart||Filtre à suggestion de valeur|Est égale à une valeur choisie par l'utilisateur|Valeur suggérée de "nom_depart"| Permet de faire une recherche par nom de départ|
|Situation != supprimer|situation|x|Alphanumérique|est différente de une (des) valeur(s) par défaut|12| Empêche l’apparition des départs supprimés|

  * ### Relations :

| Géotables ou Tables          | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------- | --------------------------------------------------------- | -------- |
| geo_v_ecl_ouvrage_electrique | id_ouvelec                                                | 1        |
| geo_ecl_noeud                | id_ouvelec  - id_noeud                                    |0...n      |
| an_ecl_erreur                | id_depart - id_objet                                      |0...n      |
| an_ecl_intervention          | id_depart - id_objet                                      |0...n      |

Une relation avec média pourra être ajoutée si le service en ressent le besoin. (demande initiale non renouvelée après test de l'application.

  * ### Particularités :
  *  Les départs sont *obligatoirement* rattachés à une armoire.
  

## Table : `an_ecl_erreur`
| Attributs      | Champ calculé     | Formatage     | Renommage                       | Particularité/Usage     | Utilisation                     | 
|:-------------:|:-----------------:|:-------------:| ------------------------------- | ----------------------- | ------------------------------- |
| Affichage_message_erreur  | x                 | x             | Affichage_message_erreur                |     (1)                    | Recherche : Recherche d'erreur  / Fiches informations : Multiples (2)     |    

(1) Requête SQL permettant d'afficher temporairement un Affichage_message_erreur dans la fiche d'information. La durée est de 10 minutes pour que l'utilisateur ait le temps de se souvenir de la présence des messages d'erreur, mais dès qu'un update est fait sur l'objet, les messages d'erreurs sont effacés via les triggers. Requête SQL :

 `CASE WHEN
  extract(epoch from  now()::timestamp) - extract(epoch from
{horodatage}::timestamp) <= 600 then 
'<table width=100%><td bgcolor="#FF000">
<font size=6 color="#ffffff"><center><b>' ||
{erreur} ||
'</b></center></font></td></table>'
ELSE '' 
END
`

(2) Intervention Foyer, Intervention_depart, Point lumineux (support), Intervention Point-lumineux, Intervention ouvrage, Support (modèle), Intervention_PI, Intervention câble, Lanterne (modèle)

Les erreurs possibles :

| Erreurs attributaires     |            |              |                                                                                                                                                                       |
|:-------------------------:|:----------:|:------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Classe                    | Attribut   | contrainte   | Message à faire remonter                                                                                                                                              |
| an_ecl_depart             | tension    | <= 3200      | La tension doit être inférieure ou égale à 3200 V                                                                                                                     |
| an_ecl_depart             | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| an_ecl_foyer              | ty_ballast |              | Pour les LED, l''emplacement de la platine est automatiquement indiqué dans la lanterne, l''amorceur est en "non-concerné" et le ballast est indiqué comme "driver".  |
| an_ecl_foyer              | loc_plat   |              | Pour les LED, l''emplacement de la platine est automatiquement indiqué dans la lanterne, l''amorceur est en "non-concerné" et le ballast est indiqué comme "driver".  |
| an_ecl_foyer              | ty_amorce  |              | Pour les LED, l''emplacement de la platine est automatiquement indiqué dans la lanterne, l''amorceur est en "non-concerné" et le ballast est indiqué comme "driver".  |
| an_ecl_foyer              | pct_fct    | <=100        | Le % de puissance de fonctionnement ne peut pas dépasser les 100 %                                                                                                    |
| an_ecl_foyer              | pct_fct    |              | Seules les LED peuvent avoir un pourcentage de puissance de fonctionnement.                                                                                           |
| an_ecl_foyer              | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| an_ecl_modele_lanterne    | ik_lant    | <=10         | L''IK ne peut pas être supérieur à 10                                                                                                                                 |
| an_ecl_modele_lanterne    | ip_lant    | <=69         | L''IP ne peut pas être supérieur à 69                                                                                                                                 |
| an_ecl_modele_support     | ik_supp    | <=10         | L''IK ne peut pas être supérieur à 10                                                                                                                                 |
| an_ecl_modele_support     | ip_supp    | <=69         | L''IP ne peut pas être supérieur à 69                                                                                                                                 |
| geo_v_ouvrage_electrique  | puis_mes   | <10000       | La puissance mesurée doit être inférieure à 10 000                                                                                                                    |
| geo_v_ouvrage_electrique  | val_terre  | <1000        | La valeur de la terre doit être inférieure à 1000                                                                                                                     |
| geo_v_ouvrage_electrique  | dat_pos    | <=now        | La date de pose doit être inférieure à la date actuelle                                                                                                               |
| geo_v_ouvrage_electrique  | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| geo_v_point_lumineux      | haut_supp  | <30          | Le support doit faire moins de 30 mètres                                                                                                                              |
| geo_v_point_lumineux      | dat_pos    | <=now        | La date de pose doit être inférieure à la date actuelle                                                                                                               |
| geo_v_point_lumineux      | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| an_ecl_intervention       | etat_sign  |              | Le signalement ne peut-être réglé que s''il y a eu une intervention                                                                                                   |
| an_ecl_intervention       | dat_progra | > dat_signa  | La date de programmation ne peut pas être inférieure à la date de signalement                                                                                         |
| an_ecl_intervention       | dat_real   | > dat_signa  | La date de réalisation de l''intervention ne peut pas être inférieure à la date de signalement                                                                        |
| geo_v_point_interet       | dat_pos    | <=now        | La date de pose doit être inférieure à la date actuelle                                                                                                               |
| geo_v_point_interet       | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| geo_ecl_cable             | date_donne | <= now       | La date de création de la donnée doit être inférieure à la date actuelle                                                                                              |
| **Erreurs de topologie**  | ****       | ****         | ****                                                                                                                                                                  |
| geo_ecl_cable             | id_nd_ini  | != id_nd_fin | Un câble ne peut pas être relié deux fois au même nœud.                                                                                                               |
| geo_ecl_cable             | geom       |              | L''objet se situe dans plusieurs zones de gestion. Merci de renseigner le prestataire et l''exploitant dans les métadonnées de ce câble                               |
| geo_ecl_cable             | geom       |              | Vous ne pouvez pas modifier la géométrie d'un objet en classe A.                           |
| geo_ecl_cable             | geom       |              | L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.                                                                                        |
| geo_v_point_lumineux      | geom       |              | L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.                                                                                        |
| geo_v_point_lumineux      | geom       |              | Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.                                                                  |
| geo_v_point_interet       | geom       |              | L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.                                                                                        |
| geo_v_point_interet       | geom       |              | Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.                                                                  |
| geo_v_ouvrage_electrique  | geom       |              | L''objet en dehors des zones de gestion. Contacter SIG pour changer les zones.                                                                                        |
| geo_v_ouvrage_electrique  | geom       |              | Les seules superpositions possibles sont un point lumineux avec un point d''intérêt, ou inversement.                                                                  |
| geo_v_point_interet       | geom, qua_geo_xy       |              | Vous ne pouvez pas modifier la géométrie d'un objet en classe A.                                                                  |
| geo_v_ouvrage_electrique  | geom,qua_geo_xy       |              | Vous ne pouvez pas modifier la géométrie d'un objet en classe A.                                                                                          |
| geo_v_point_lumineux      | geom, qua_geo_xy       |              | Vous ne pouvez pas modifier la géométrie d'un objet en classe A. |

## Table : `an_ecl_foyer`
| Attributs     | Champ calculé     | Formatage     | Renommage                                 | Particularité/Usage                                                     | Utilisation                     | 
|:------------:|:-----------------:|:-------------:|:-----------------------------------------:|:-----------------------------------------------------------------------:|:-------------------------------:|
| date_donne   |                   | x             | Date de création de la donnée             |  Les heures ne sont pas affichées                                                                       | Fiche information : Foyer (ECL) |             |
| date_maj     |                   | x             | Date de dernière mise à jour de la donnée |  Les heures ne sont pas affichées                                                                          | Fiche information : Foyer (ECL) |             |
| date_sai     |                   | x             | Date de saisie dans l'application         |    Les heures ne sont pas affichées                                                                        | Fiche information : Foyer (ECL) |             |
| etat_foy     |                   | x             | Etat du foyer                             | Formatage par une liste de domaine ( lt_ecl_etat)                       | Fiche information : Foyer (ECL) |             |
| id_mod_lm    |                   | x             | Modèle de la lampe                        | Formatage par une liste de domaine ( an_ecl_modele_lampe)               | Fiche information : Foyer (ECL) |             |
| id_mod_ln    |                   | x             | Modèle de la lanterne                     | Formatage par une liste de domaine ( an_ecl_modele_lanterne)            | Fiche information : Foyer (ECL) |             |
| loc_plat     |                   | x             | Localisation de la platine                | Formatage par une liste de domaine ( lt_ecl_emplacement (code))         | Fiche information : Foyer (ECL) |             |
| situation    |                   | x             | Situation                                 | Formatage par une liste de domaine ( lt_ecl_situation)                  | Fiche information : Foyer (ECL) |             |
| ty_amorce    |                   | x             | Type d'amorceur installé                  | Formatage par une liste de domaine ( lt_ecl_amorceur (code))            | Fiche information : Foyer (ECL) |             |
| ty_auto_tr   |                   | x             | Type d'auto trasformateur installé        | Formatage par une liste de domaine ( lt_ecl_auto_transformateur (code)) | Fiche information : Foyer (ECL) |             |
| ty_ballast   |                   | x             | Type de ballast installé                  | Formatage par une liste de domaine ( lt_ecl_type_ballast (code))        | Fiche information : Foyer (ECL) |             |
| ty_lantern   |                   | x             | Routier / piéton                          | Formatage par une liste de domaine ( lt_ecl_type_lanterne)              | Fiche information : Foyer (ECL) |             |

* ### Filtres :

| Nom                    | Attribut                       | Au chargement     | Type           | Condition                                                        | Valeur                                       | Description                                                            |
| ---------------------- | ------------------------------ |:-----------------:|:--------------:|:----------------------------------------------------------------:| -------------------------------------------- | ---------------------------------------------------------------------- |
| Si lampe par défaut    | id_mod_lm (modèle de lampe)    |                   | Alphanumérique | est égale à une valeur par défaut                                | 1                                            | Filtre pour la recherche ''Foyer dont la lampe n'est pas renseignée''. |
| Situation != supprimer | situation                      | x                 | Alphanumérique | est différente de une(des) valeur(s) par défaut                  | 12                                           | Empêche l’apparition des départ supprimés                              |
| Modèle de lampe        | id_mod_lm (modèle de lampe)    |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste | est égale à une valeur listée de "id_mod_lm" | Recherche de foyer par un certain modèle de lampe                      |
| Modèle de lanterne     | id_mod_ln (modèle de lanterne) |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste | est égale à une valeur listée de "id_mod_ln" | Recherche de foyer par un certain modèle de lanterne                   |

  * ### Relations :

| Géotables ou Tables                      | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_modele_lanterne                   | id_mod_ln                                                 | 1        |
| an_ecl_modele_lampe                      | id_mod_lm                                                 | 1        |
| geo_ecl_noeud                            | id_supp - id_noeud                                        |0...n      |
| an_ecl_intervention (Intervention Foyer) | id_depart - id_objet                                      |0...n      |
| an_ecl_erreur                            | id_foyer - id_objet                                       |0...n      |

Une relation avec média pourra être ajoutée si le service en ressent le besoin. (demande initiale non renouvelée après test de l'application.

  * ### Particularités : 
  * Les foyers sont *obligatoirement* rattachés à un support. 

## Table : `an_ecl_modele_lampe`
| Attributs      | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                             | Utilisation                              |
|:-------------:|:-----------------:|:-------------:|:--------------------------------------------:|:---------------------------------------------------------------:|:----------------------------------------:|
| Affichage_nom | x                 |               |                                              | Formate l'affichage d'une recherche                             | Recherche : recherche de foyer           |
| cle_media     | x                 |               | cle_media                                    | Correspond à l'id de l'objet avec LM en préfixe. (1)            | Relation avec an_ecl_media_modele.       |
| cou_ecl       |                   | x             | Couleur d'éclairage de la lampe              | Formatage par une liste de domaine ( lt_ecl_couleur_eclairage ) | Fiche d'information : modèle lampe (ECL) |
| cul_lamp      |                   | x             | Culot de la lampe                            | Formatage par une liste de domaine ( lt_ecl_culot_lampe )       | Fiche d'information : modèle lampe (ECL) |
| date_maj      |                   | x             | Date de dernière mise à jour                 | Les heures ne sont pas affichées                                | Fiche d'information : modèle lampe (ECL) |
| date_sai      |                   | x             | Date de saisie de l'information dans la base | Les heures ne sont pas affichées                                | Fiche d'information : modèle lampe (ECL) |
| puis_lam      |                   | x             | Puissance de la lampe                        |   | Fiche d'information : modèle lampe (ECL) |
| telgest       |                   | x             | Présence d'une télégestion                   | Formatage par une liste de domaine ( lt_ecl_presence )          | Fiche d'information : modèle lampe (ECL) |
| ty_lampe      |                   | x             | Type de lampe                                | Formatage par une liste de domaine ( lt_ecl_type_lampe )        | Fiche d'information : modèle lampe (ECL) |

(1)Les autres types de modèles ont le même type d'attribut avec un préfixe différent. Cela permet de tous les relier à la même table modèle malgré leur séquence différente.

  * ### Filtres :

| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                                                                                                                                        |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Domaine de valeur       | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est supérieure ou égale à                       | 00          | Filtre activé au chargement du domaine de valeur utilisant la table an_ecl_modele_lampe. (1) |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de lampe", afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions                                                                                                                           |

(1) Afin d'actualiser le domaine en posant une contrainte. Technique ayant pour but d'éviter de recharger l'application pour qu'une nouvelle valeur ajoutée par l'utilisateur dans la table an_ecl_modele_lampe apparaisse dans le domaine.

  * ### Relations :

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            |0...n      |


  * ### Particularités : 
  * La table est en fait un domaine de valeur avec plusieurs caractéristiques. Elle est éditable par les agents du service métier directement via l'application.

## Table : `an_ecl_modele_lanterne`
| Attributs      | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                             | Utilisation                              |
|:-------------:|:-----------------:|:-------------:|:--------------------------------------------:|:---------------------------------------------------------------:|:----------------------------------------:|
| Affichage_nom | x                 |               |                                              | Formate l'affichage d'une recherche                             | Recherche : recherche de foyer           |
| cle_media     | x                 |               | cle_media                                    | Correspond à l'id de l'objet avec LN en préfixe. (1)            | Relation avec an_ecl_media_modele.       |
| cou_ecl       |                   | x             | Couleur d'éclairage de la lampe              | Formatage par une liste de domaine ( lt_ecl_couleur_eclairage ) | Fiche d'information : modèle lampe (ECL) |
| cul_lamp      |                   | x             | Culot de la lampe                            | Formatage par une liste de domaine ( lt_ecl_culot_lampe )       | Fiche d'information : modèle lampe (ECL) |
| date_maj      |                   | x             | Date de dernière mise à jour                 | Les heures ne sont pas affichées                                | Fiche d'information : modèle lampe (ECL) |
| date_sai      |                   | x             | Date de saisie de l'information dans la base | Les heures ne sont pas affichées                                | Fiche d'information : modèle lampe (ECL) |
| puis_lam      |                   | x             | Puissance de la lampe                        | Formatage par une liste de domaine ( lt_ecl_puissance_lampe )   | Fiche d'information : modèle lampe (ECL) |
| telgest       |                   | x             | Présence d'une télégestion                   | Formatage par une liste de domaine ( lt_ecl_presence )          | Fiche d'information : modèle lampe (ECL) |
| ty_lampe      |                   | x             | Type de lampe                                | Formatage par une liste de domaine ( lt_ecl_type_lampe )        | Fiche d'information : modèle lampe (ECL) |


 (1) Les autres types de modèles ont le même type d'attribut avec un préfixe différent. Cela permet de tous les relier à la même table modèle malgré leur séquence différente.
 
  * ### Filtres :

| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                                                                                                                                                                                  |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Domaine de valeur       | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est supérieure ou égale à                       | 00          | Filtre activé au chargement du domaine de valeur utilisant la table an_ecl_modele_lanterne. |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de lanterne", afin de ne pas fair apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions                                                                                                                                                                  |

(1) Afin d'actualiser le domaine en posant une contrainte. Technique ayant pour but d'éviter de recharger l'application pour qu'une nouvelle valeur ajoutée par l'utilisateur dans la table an_ecl_modele_lanterne apparaisse dans le domaine.

  * ### Relations :

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            |0...n      |
| an_ecl_erreur           | id_mod_sup - id_objet                                     | o…n      |

  * ### Particularités : 
  * La table est en fait un domaine de valeur avec plusieurs caractéristiques. Elle est éditable par les agents du service métier directement via l'application.

## Table : `an_ecl_modele_support`

| Attributs     | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                              | Utilisation                             |
|:------------:|:-----------------:|:-------------:|:--------------------------------------------:|:----------------------------------------------------------------:|:---------------------------------------:|
| cle_media    | x                 |               | cle_media                                    | Correspond à l'id de l'objet avec LN en préfixe.                 |                                         |
| date_maj     |                   | x             | Date de dernière mise à jour                 | Les heures ne sont pas affichées                                 | Fiche d'information :support ( modèle ) |
| date_sai     |                   | x             | Date de saisie de l'information dans la base | Les heures ne sont pas affichées                                 | Fiche d'information :support ( modèle ) |
| mat_supp     |                   | x             | support                                      | Formatage par une liste de domaine ( lt_ecl_materiaux_supports ) | Fiche d'information :support ( modèle ) |

 (1) Les autres types de modèles ont le même type d'attribut avec un préfixe différent. Cela permet de tous les relier à la même table modèle malgré leur séquence différente.

  * ### Filtres :

| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Utilisé sur la recherche '' recherche d'un modèle de support", afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |

  * ### Relations :

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media_modele     | cle_media - id                                            |0...n      |
| an_ecl_erreur           | id_mod_sup - id_objet                                     | 0…n      |

  * ### Particularités : 
  * La table est en fait un domaine de valeur avec plusieurs caractéristiques. Elle est éditable par les agents du service métier directement via l'application.

## Table : `geo_ecl_cable`
| Attributs            | Champ calculé     | Formatage     | Renommage                                                         | Particularité/Usage                                                      | Utilisation                     |
|:-------------------:|:-----------------:|:-------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------------:|:-------------------------------:|
| Blanc | x |            | Blanc | Contient le caractère ' ' . (1)  | Recherche : Recherche de câble |
| Affichage recherche | x                 |               | Affichage recherche                                               | Formate l'affichage d'une recherche | Recherche : Recherche de câble  |
| etat_cable          |                   | x             | Etat du câble                                                     | Formatage par une liste de domaine ( lt_ecl_etat )                       | Fiche information : Câble (ECL) |
| qua_geo_xy          |                   | x             | Qua Geo Xy                                                        | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )    | Fiche information : Câble (ECL) |
| qua_geo_z           |                   | x             | Qua Geo Z                                                         | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )    | Fiche information : Câble (ECL) |
| sect_cab            |                   | x             | Section du câble                                                  | Formatage par une liste de domaine ( lt_ecl_section_cable )              | Fiche information : Câble (ECL) |
| situ_cab            |                   | x             | Situation physique du câble                                       | Formatage par une liste de domaine ( lt_ecl_situation_cable )            | Fiche information : Câble (ECL) |
| situation           |                   | x             | Situation                                                         | Formatage par une liste de domaine ( lt_ecl_situation )                  | Fiche information : Câble (ECL) |
| src_geom            |                   | x             | Source du référentiel géographique pour le positionnement du nœud | Formatage par une liste de domaine ( lt_src_geom )                       | Fiche information : Câble (ECL) |
| dat_pos_ca          |                   | x             | Date de pose du câble                                             | L'heure n'est pas affichée                                               | Fiche information : Câble (ECL) |
| date_donne          |                   | x             | Date de création de la donnée                                     | L'heure n'est pas affichée                                               | Fiche information : Câble (ECL) |
| date_maj            |                   | x             | Date de la mise à jour                                            | L'heure n'est pas affichée                                               | Fiche information : Câble (ECL) |
| date_sai            |                   | x             | Date de saisie dans la base                                       | L'heure n'est pas affichée                                               | Fiche information : Câble (ECL) |
| info_bulle | x                 |               | info_bulle                                               |  | Cartographie Réseaux  |
| label  | x                 |               | label                                               |  | Cartographie Réseaux  |

(1) Pour gérer le fait que GEO affiche en haut de la fiche info le 1er champ du résultat d'une recherche.

  * ### Filtres :

| Nom                    | Attribut                          | Au chargement     | Type           | Condition                                       | Valeur     | Description                               |
| ---------------------- | --------------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ----------------------------------------- |
| Situation != supprimer | situation                         | x                 | Alphanumérique | est différente de une(des) valeur(s) par défaut | 12         | Empêche l'apparation des départ supprimés |
| id_nd_fin est null     | id_nd_fin (nœud final du câble)   |                   | Alphanumérique | La valeur de “id_nd_fin” est                    | null       | Recherche : "câble non relié"             |
| id_nd_ini est null     | id_nd_ini (nœud initial du câble) |                   | Alphanumérique | La valeur de “id_nd_ini” est                    | null       | Recherche : "câble non relié"             |

  * ### Relations :

| Géotables ou Tables                      | Champs de jointure (champs table - champs table liée)     | Type     |
| ---------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_intervention (Intervention câble) | id_cab - id_objet                                         |0...n      |
| xapps_an_v_ecl_tension_cable             | id_cab                                                    | 0…1      |

  * ### Particularités : 
  * Un câble ne peut pas être relié en ses deux extrémités au même nœud.
  * L'attribut tension est transmise au câble en fonction du départ auquel est lié le nœud référencer en tant que nœud final du câble.

## Table : `an_ecl_intervention` (Pour recherche "rapport se signalement", "rapport d'intervention" et pour affichage dans la cartographie) --> Présente 1 fois dans GEO.

| Attributs                       | Champ calculé     | Formatage     | Renommage                                                                                                                               | Particularité/Usage                                                              | Utilisation                                   | Exemple     |
|:------------------------------:|:-----------------:|:-------------:| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------- | ----------- |
| Affiche-recherche-intervention | x                 |               | Affiche-recherche-intervention                                                                                                          | Formate l'affichage d'une recherche. | Recherche : Rapport d'intervention            |             |
| Affiche-recherche-signalement  | x                 |               | Affiche-recherche-signalement                                                                                                           | Formate l'affichage d'une recherche. | Recherche : Rapport de signalement            |             |

  * ### Filtres :

| Nom                                | Attribut                                         | Au chargement     | Type           | Condition                                                                                       | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ------------------------------------------------ |:-----------------:|:--------------:|:-----------------------------------------------------------------------------------------------:| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Etats                              | etat_sign                                        |                   | Alphanumérique | La valeur de “etat_sign” =est égale à                                                           | 10 , 50 ou 40 | Sélectionne les interventions/signalements qui ne sont pas réglés (soumis, classé sans suite, pour information).  |
| Dates_intervention                 | dat_real (Date de réalisation de l'intervention) |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur et une valeur choisie par l'utilisateur |               |Sélectionne toutes les interventions réalisées entre deux dates.                                                      |
| Dates signalement                  | dat_signa (Date du signalement)                  |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur etune valeur choisie par l'utilisateur  |               | Sélectionne tous les signalements réalisées entre deux dates.                                                         |
| Intervention oui / signalement non | type_si_in (Signalement ou intervention)         |                   | Alphanumérique | La valeur de “type_si_in” =est égale à                                                          | 20            | Sélectionne uniquement les interventions                                                                                   |
| Signalement oui / intervention non | type_si_in (Signalement ou intervention)         |                   | Alphanumérique | La valeur de “type_si_in” =est égale à                                                          | 10            | Sélectionne uniquement les signalements                                                                                    |

  * ### Relations :

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| geo_ecl_noeud           | id_noeud                                                  | 00…1      |


  * ### Particularités :
  * Cette table a été insérée 7 fois dans GEO. La version présentée ici est celle servant aux recherches et à la cartographie.
  * Les 6 autres tables sont présentées d'un seul tenant ci-dessous.
   
 #### 	Intervention Foyer, Intervention Câble, Intervention Départ, Intervention Points lumineux, Intervention PI, Intervention ouvrage  
   * ### Table : `an_ecl_intervention` (Pour interventions sur les 6 objets du patrimoine) --> est insérée 6 fois dans GEO
 | Attributs     | Champ calculé     | Formatage     | Renommage                                | Particularité/Usage                                                                      | Utilisation                                                                                                                         |
|:------------:|:-----------------:|:-------------:|:----------------------------------------:|:----------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------:|
| Dates        | x                 |               | Dates                                    | Formate l'affichage des différentes dates dans les fiches informations des interventions | Fiches informations (Foyer, départ, Ouvrage électrique, câble, point lumineux, PI)                                                  |
| att_met1     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met2     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met3     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met4     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met5     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met6     |                   | x             | Etat de l'objet après l'intervention     | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met7     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| att_met8     |                   | x             | Voir tableau ci-après                    | Formatage par une liste de domaine (Voir tableau ci-après)                               | Fiche information (Voir tableau ci-après)                                                                                           |
| dat_progra   |                   | x             | Date de la programmation                 | Les heures ne sont pas affichées                                                         | Fiches informations des Fiches d'intervention                                                                                       |
| dat_real     |                   | x             | Date de la réalisation de l'intervention | Les heures ne sont pas affichées                                                         | Fiches informations des Fiches d'intervention                                                                                       |
| dat_signa    |                   | x             | Date du signalement                      | Les heures ne sont pas affichées                                                         | Fiches informations des Fiches d'intervention                                                                                       |
| date_maj     |                   | x             | Date de la dernière mise à jour          | Les heures ne sont pas affichées                                                         | Fiches informations des Fiches d'intervention                                                                                       |
| date_sai     |                   | x             | Date de la saisie initiale dans la base  | Les heures ne sont pas affichées                                                         | Fiches informations des Fiches d'intervention                                                                                       |
| etat_sign    |                   | x             | Etat du signalement                      | Formatage par une liste de domaine ( lt_ecl_etat_signalement_affichage )                 | Fiches informations des Fiches d'intervention                                                                                       |
| moy_interv   |                   | x             | Moyen d'intervention                     | Formatage par une liste de domaine ( lt_ecl_moyen_intervention )                         | Fiches informations des Fiches d'intervention                                                                                       |
| src_def      |                   | x             | Source de la défaillance                 | Formatage par une liste de domaine ( lt_ecl_source_defaillance )                         | Fiches informations des Fiches d'intervention                                                                                       |
| TRI -        | x                 |               | TRI -                                    |                                                                                          | Fiches informations (Foyer, départ, Ouvrage électrique, câble, point lumineux, PI)                                                  |
| typ_def      |                   | x             | Type de défaillance                      | Formatage par une liste de domaine ( lt_ecl_type_defaillance )                           | Fiches informations des Fiches d'intervention                                                                                       |
| type_inter   |                   | x             | Type d'intervention                      | Formatage par une liste de domaine ( lt_intervention_point_lumineux )                    | Fiches informations des Fiches d'intervention +  Fiches informations (Foyer, départ, Ouvrage électrique, câble, point lumineux, PI) |
| type_si_in   |                   | x             | Signalement ou intervention              | Formatage par une liste de domaine ( lt_ecl_signalement_intervention )                   | Fiches informations des Fiches d'intervention                                                                                       |
| Affiche_ordre   |            x       |              | affiche_ordre             |      Défini l'ordre de création des signalements/interventions              | Fiches informations des Fiches d'intervention                                                                                       |

* ### 'att_met1' 
| Fiche information           | Utilisé     | Particularité/Usage                                          | Label                |
|:---------------------------:|:-----------:|:------------------------------------------------------------:|:--------------------:|
| Intervention câble          |             |                                                              | Inutilisé            |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Type de disjoncteur  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Type de disjoncteur  |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Type de disjoncteur  |
| Intervention foyer          | x           | Formatage par une liste de domaine (lt_ecl_type_ballast)     | Type de ballast      |
| Intervention PI             |             |                                                              | Inutilisé            |


* ### 'att_met2' 
| Fiche information           | Utilisé     | Particularité/Usage                                      | Label            |
|:---------------------------:|:-----------:|:--------------------------------------------------------:|:----------------:|
| Intervention câble          |             |                                                          | Inutilisé        |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) | Type de fusible  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) | Type de fusible  |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_type_fusible) | Type de fusible  |
| Intervention foyer          | x           | Formatage par une liste de domaine ( lt_ecl_amorceur )   | Type d'amorce    |
| Intervention PI             |             |                                                          | Inutilisé        |


* ### 'att_met3' 
| Fiche information           | Utilisé     | Particularité/Usage                                               | Label                   |
|:---------------------------:|:-----------:|:-----------------------------------------------------------------:|:-----------------------:|
| Intervention câble          |             |                                                                   | Inutilisé               |
| Intervention point-lumineux | x           | Formatage par une liste de domaine ( lt_ecl_type_parasurtenseur ) | Type de parasurtenseur  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine ( lt_ecl_auto_transformateur ) | Type de commande        |
| Intervention depart         |             |                                                                   | Inutilisé               |
| Intervention foyer          | x           | Formatage par une liste de domaine ( lt_ecl_auto_transformateur ) | Auto transformateur     |
| Intervention PI             |             |                                                                   | Inutilisé               |


* ### 'att_met4' 
| Fiche information           | Utilisé     | Particularité/Usage                                          | Label                                 |
|:---------------------------:|:-----------:|:------------------------------------------------------------:|:-------------------------------------:|
| Intervention câble          |             |                                                              | Inutilisé                             |
| Intervention point-lumineux |             |                                                              | Inutilisé                             |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_disjoncteur) | Type de disjoncteur du départ ajouté  |
| Intervention depart         |             |                                                              | Inutilisé                             |
| Intervention foyer          |             |                                                              | Inutilisé                             |
| Intervention PI             |             |                                                              | Inutilisé                             |

* ### 'att_met5' 
| Fiche information           | Utilisé     | Particularité/Usage                                                                 | Label                                     |
|:---------------------------:|:-----------:|:-----------------------------------------------------------------------------------:|:-----------------------------------------:|
| Intervention câble          |             |                                                                                     | Inutilisé                                 |
| Intervention point-lumineux |             |                                                                                     |  Inutilisé                                |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_type_fusible)                            | Type de fusible du départ ajouté          |
| Intervention depart         |             |                                                                                     | Inutilisé                                 |
| Intervention foyer          | x           | Formatage par une liste de domaine ( xapps_geo_v_ecl_intervention_liste_affichage ) | Signalement réglé lors de l'intervention  |
| Intervention PI             |             |                                                                                     | Inutilisé                                 |


* ###  'att_met6' 
| Fiche information           | Utilisé     | Particularité/Usage                               |
| --------------------------- | ----------- | ------------------------------------------------- |
| Intervention câble          | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention point-lumineux | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention ouvrage        | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention depart         | x           | Formatage par une liste de domaine (lt_ecl_etat)  |
| Intervention foyer          | x           | Formatage par une liste de domaine (lt_ecl_etat ) |
| Intervention PI             | x           | Formatage par une liste de domaine (lt_ecl_etat)  |

* ###  'att_met7' 
| Fiche information           | Utilisé     | Particularité/Usage                                                                 | Label                                     |
|:---------------------------:|:-----------:|:-----------------------------------------------------------------------------------:|:-----------------------------------------:|
| Intervention câble          |             |                                                                                     | Inutilisé                                 |
| Intervention point-lumineux |             |                                                                                     |  Options du support                       |
| Intervention ouvrage        | x           |                                                                                     | Nom du départ                             |
| Intervention depart         | x           | Formatage par une liste de domaine ( xapps_geo_v_ecl_intervention_liste_affichage ) | Signalement réglé lors de l'intervention  |
| Intervention foyer          | x           | Formatage par une liste de domaine ( an_ecl_modele_lanterne )                       | Modèle de lanterne                        |
| Intervention PI             |             |                                                                                     | Inutilisé                                 |



* ###  'att_met8' 
| Fiche information           | Utilisé     | Particularité/Usage                                        | Label                     |
|:---------------------------:|:-----------:|:----------------------------------------------------------:|:-------------------------:|
| Intervention câble          |             |                                                            | Inutilisé                 |
| Intervention point-lumineux |             |                                                            |  Inutilisé                |
| Intervention ouvrage        | x           |                                                            | Tension du départ ajouté  |
| Intervention depart         |             |                                                            | Tension                   |
| Intervention foyer          | x           | Formatage par une liste de domaine ( an_ecl_modele_lampe ) | Modèle de lampe           |
| Intervention PI             |             |                                                            | Inutilisé                 |


  * ### Filtres : Aucun.

  * ### Relations :

| Géotables ou Tables     | Champs de jointure (champs table - champs table liée)     | Type     |
| ----------------------- | --------------------------------------------------------- | -------- |
| an_ecl_erreur           | id_noeud                                                  |0...n      |

Une relation avec média pourra être ajoutée si le service en ressent le besoin. (demande initiale non renouvelée après test de l'application.

  * ### Particularités :
  * Ces tables interventions doivent être séparées dans Géo afin que l'affichage puisse se faire selon un domaine de valeur précis, différent selon l'objet de l'intervention. (cf tableau ci-dessus)

## Table : `geo_v_ecl_ouvrage_electrique`
| Attributs       | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                                              | Utilisation                                |
|:--------------:|:-----------------:|:-------------:|:--------------------------------------------:|:--------------------------------------------------------------------------------:|:------------------------------------------:|
| Blanc          | x                 |               | Blanc                                        | Contient le caractère ' ' .                                                      |                                            |
| affiche_result | x                 |               | affiche_result                               | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée. | Recherche : Recherche d'ouvrage électrique |
| depart         |                   | x             | Numéro de départ auquel est lié le nœud      | Formatage par une liste de domaine ( an_ecl_depart )                             | Fiche information : Ouvrage electrique     |
| etat_ouvel     |                   | x             | Etat de l'ouvrage électrique                 | Formatage par une liste de domaine ( lt_ecl_etat )                               | Fiche information : Ouvrage electrique     |
| mod_pos_ou     |                   | x             | Mode de pose de l'ouvrage                    | Formatage par une liste de domaine ( lt_ecl_mode_pose_ouvrage_electrique )       | Fiche information : Ouvrage electrique     |
| pres_var       |                   | x             | Présence d'un variateur                      | Formatage par une liste de domaine ( lt_ecl_presence )                           | Fiche information : Ouvrage electrique     |
| qua_dat        |                   | x             | Qualité de la date de pose de l'ouvrage      | Formatage par une liste de domaine ( lt_ecl_qualite_date )                       | Fiche information : Ouvrage electrique     |
| qua_geo_xy     |                   | x             | Classe de la géolocalisation en XY           | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )            | Fiche information : Ouvrage electrique     |
| qua_geo_z      |                   | x             | Classe de la géolocalisation en Z            | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )            | Fiche information : Ouvrage electrique     |
| situation      |                   | x             | Situation générale : actif, inactif,supprimé | Formatage par une liste de domaine ( lt_ecl_situation )                          | Fiche information : Ouvrage electrique     |
| src_geom       |                   | x             | Source utilisée pour la géolocalisation      | Formatage par une liste de domaine ( lt_src_geom )                               | Fiche information : Ouvrage electrique     |
| ty_comm        |                   | x             | Type de commande                             | Formatage par une liste de domaine ( lt_ecl_type_commande )                      | Fiche information : Ouvrage electrique     |
| ty_disjonc     |                   | x             | Type de disjoncteur                          | Formatage par une liste de domaine ( lt_ecl_type_disjoncteur )                   | Fiche information : Ouvrage electrique     |
| ty_fusible     |                   | x             | Type de fusible                              | Formatage par une liste de domaine ( lt_ecl_type_fusible )                       | Fiche information : Ouvrage electrique     |
| ty_ouvelec     |                   | x             | Type d'ouvrage électrique                    | Formatage par une liste de domaine ( lt_ecl_type_ouvrage_electrique )            | Fiche information : Ouvrage electrique     |
| date_maj       |                   | x             | Date de la mise à jour                       | L'heure n'est pas affichée                                                       | Fiche information : Câble (ECL)            |
| date_sai       |                   | x             | Date de saisie dans la base                  | L'heure n'est pas affichée                                                       | Fiche information : Câble (ECL)            |
| dat_pos        |                   | x             | Date de pose                                 | L'heure n'est pas affichée                                                       | Fiche information : Câble (ECL)            |
| date_donne     |                   | x             | Date de création de la donnée                | L'heure n'est pas affichée                                                       | Fiche information : Câble (ECL)            |
| info_bulle | x                 |               | info_bulle                                               |  | Cartographie Réseaux  |

 (1) Pour gérer le fait que GEO affiche en haut de la fiche info le 1er champ du résultat d'une recherche.

  * ### Filtres :

| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Etat                   | etat_ouvel                               |                   | Prédéfinis     | La valeur de “etat_ouvel” =est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de "etat_ouvel" | Sert à la recherche : ''Recherche d'ouvrages électriques"                                            |
| armoires principales   | ty_ouvelec (type d'ouvrage)              |                   | Alphanumérique | La valeur de “ty_ouvelec” =est égale à                                                      | 10                                | On ne sélectionne que les armoires principales : sert au domaine de valeur des armoires principales. |
| type d'ouvrage         | dat_signa (Date du signalement)          |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                            | une valeur listée de "ty_ouvelec" | Sert à la recherche : ''Recherche d'ouvrages électriques"                                            |
| Nom de l'ouvrage       | type_si_in (Signalement ou intervention) |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                            | une valeur listée de "nom_ouv"    | Sert à la rechercher : '' Rapport d'intervention'' afin de ne sélectionner que les interventions     |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l'apparation des ouvrages supprimés sur la cartographie                                      |

  * ### Relations :

| Géotables ou Tables                         | Champs de jointure (champs table - champs table liée)     | Type     |
| ------------------------------------------- | --------------------------------------------------------- | -------- |
| **an_ecl_depart**                           | id_ouvelec                                                |0...n      |
| an_ecl_media                                | id_ouvelec - id                                           |0...n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire | id_ouvelec - id_noeud                                     | 1        |
| an_ecl_erreur                               | id_ouvelec - id_objet                                     |0...n      |
| an_ecl_intervention (intervention ouvrage)  | id_ouvelec - id_objet                                     |0...n      |

  * ### Particularités :
  Aucune

## Table : `geo_v_ecl_point_lumineux`
| Attributs                         | Champ calculé     | Formatage     | Renommage                                    | Particularité/Usage                                                                  | Utilisation                                  |
|:--------------------------------:|:-----------------:|:-------------:|:--------------------------------------------:|:------------------------------------------------------------------------------------:|:--------------------------------------------:|
| Pour affichage qualité fct(date) |                   |               | Pour affichage qualité fct(date)             | Identifie les données non mises à jour depuis plus de deux ans                       | Cartographie                                 |
| Blanc                            | x                 |               | Blanc                                        | Contient le caractère ' '                                                            | Recherche : Recherche de support             |
| Affiche_recherche                | x                 |               | Affiche_recherche                            | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée.     | Recherche : Recherche de support             |
| depart                           |                   | x             | Numéro de départ auquel est lié le noeud     | Formatage par une liste de domaine ( an_ecl_depart )                                 | Fiche information : Point lumineux (support) |
| etat_supp                        |                   | x             | Etat general du support                      | Formatage par une liste de domaine ( lt_ecl_etat )                                   | Fiche information : Point lumineux (support) |
| haut_trap                        |                   | x             | Hauteur de la trappe                         | Formatage par une liste de domaine ( lt_ecl_hauteur_trappe )                         | Fiche information : Point lumineux (support) |
| id_mod_sup                       |                   | x             | Identifiant du modèle du support             | Formatage par une liste de domaine ( an_ecl_modele_support )                         | Fiche information : Point lumineux (support) |
| opt_supp                         |                   | x             | Options du support                           | Formatage par une liste de domaine ( lt_ecl_options_support ) - attribut multivalué. | Fiche information : Point lumineux (support) |
| qua_dat                          |                   | x             | Qualité de la date de pose                   | Formatage par une liste de domaine ( lt_ecl_qualite_date )                           | Fiche information : Point lumineux (support) |
| qua_geo_xy                       |                   | x             | Classe de la géolocalisation en XY           | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                | Fiche information : Point lumineux (support) |
| qua_geo_z                        |                   | x             | Classe de la géolocalisation en Z            | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )                | Fiche information : Point lumineux (support) |
| situation                        |                   | x             | Situation générale : actif, inactif,supprimé | Formatage par une liste de domaine ( lt_ecl_situation )                              | Fiche information : Point lumineux (support) |
| src_geom                         |                   | x             | Source utilisée pour la géolocalisation      | Formatage par une liste de domaine ( lt_src_geom )                                   | Fiche information : Point lumineux (support) |
| ty_disjonc                       |                   | x             | Type de disjoncteur                          | Formatage par une liste de domaine ( lt_ecl_type_disjoncteur )                       | Fiche information : Point lumineux (support) |
| ty_fusible                       |                   | x             | Type de fusible installé                     | Formatage par une liste de domaine ( lt_ecl_type_fusible )                           | Fiche information : Point lumineux (support) |
| ty_parasu                        |                   | x             | Type de parasurtenseur                       | Formatage par une liste de domaine ( lt_ecl_type_parasurtenseur )                    | Fiche information : Point lumineux (support) |
| ty_supp                          |                   | x             | Type de support                              | Formatage par une liste de domaine ( lt_ecl_type_support )                           | Fiche information : Point lumineux (support) |
| date_maj                         |                   | x             | Date de la mise à jour                       | L'heure n'est pas affichée                                                           | Fiche information : Câble (ECL)              |
| date_sai                         |                   | x             | Date de saisie dans la base                  | L'heure n'est pas affichée                                                           | Fiche information : Câble (ECL)              |
| dat_pos                          |                   | x             | Date de pose                                 | L'heure n'est pas affichée                                                           | Fiche information : Câble (ECL)              |
| date_donne                       |                   | x             | Date de création de la donnée                | L'heure n'est pas affichée                                                           | Fiche information : Câble (ECL)              |
| info_bulle | x                 |               | info_bulle                                               |  | Cartographie Réseaux  |
| label  | x                 |               | label                                               |  | Cartographie Réseaux  |

 (1) Pour gérer le fait que GEO affiche en haut de la fiche info le 1er champ du résultat d'une recherche.

  * ### Filtres :

| Nom                    | Attribut                                | Au chargement     | Type           | Condition                                                                                  | Valeur                                                       | Description                                                            |
| ---------------------- | --------------------------------------- |:-----------------:|:--------------:|:------------------------------------------------------------------------------------------:| ------------------------------------------------------------ | ---------------------------------------------------------------------- |
| Etat                   | etat_supp (état du support)             |                   | Prédéfinis     | La valeur de “etat_supp” =est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de "etat_supp"                             | Sert à la recherche : ''Recherche de support"                          |
| Départ                 | depart (départ auquel et relié le nœud) |                   | Alphanumérique | est égale à une valeur choisie par l'utilisateur parmi une liste                           | Une valeur de la liste de domaine : "xapps_geo_v_ecl_depart" | Sert à la recherche : ''Recherche de support"                          |
| type de support        | ty_supp (type de support)               |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste                           | une valeur listée de “ty_supp”                               | Sert à la recherche : ''Recherche de support"                          |
| Support sans foyer     | id_supp                                 |                   | SQL            | {id_supp} NOT IN (SELECT id_supp FROM m_reseau_sec.an_ecl_foyer WHERE situation <> '12')   |                                                              | Sert à la recherche : "Recherche de support sans foyer''               |
| Situation != supprimer | situation                               |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                            | 12                                                           | Empêche l'apparation des points-lumineux supprimés sur la cartographie |

  * ### Relations :

| Géotables ou Tables                               | Champs de jointure (champs table - champs table liée)     | Type     |
| ------------------------------------------------- | --------------------------------------------------------- | -------- |
| an_ecl_media                                      | id_supp - id                                           |0...n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire       | id_supp - id_noeud                                     | 1        |
| an_ecl_erreur                                     | id_supp - id_objet                                     |0...n      |
| an_ecl_intervention (intervention point lumineux) | id_supp - id_objet                                     |0...n      |
| xapps_geo_v_ecl_depart                            | depart - id_depart                                        | 0…1      |
| an_ecl_foyer                                      | id_supp                                                   |0...n      |
| an_ecl_modele_support                             | id_mod_sup                                                | 1        |

  * ### Particularités :
Aucune

## Table : `geo_v_ecl_pi`
| Attributs          | Champ calculé     | Formatage     | Renommage                                        | Particularité/Usage                                                              | Utilisation                              |
|:-----------------:|:-----------------:|:-------------:|:------------------------------------------------:|:--------------------------------------------------------------------------------:|:----------------------------------------:|
| Blanc             | x                 |               | Blanc                                            | Contient le caractère ' ' .                                                      | Recherche : Recherche de point d'interet |
| Affiche_recherche | x                 |               | Affiche_recherche                                | Formate l'affichage d'un texte en fonction des attributs de l'entité recherchée. | Recherche : Recherche de point d'interet |
| dat_pos           |                   | x             | Date de pose du le point d'interet               | Les heures ne sont pas affichées                                                 | Fiche information : Point intérêt (PI)   |
| date_donne        |                   | x             | Date de la donnée                                | Les heures ne sont pas affichées                                                 | Fiche information : Point intérêt (PI)   |
| date_maj          |                   | x             | Date de dernière mise à jour de la donnée        | Les heures ne sont pas affichées                                                 | Fiche information : Point intérêt (PI)   |
| date_sai          |                   | x             | Date de la saisie de la donnée dans la base      | Les heures ne sont pas affichées                                                 | Fiche information : Point intérêt (PI)   |
| depart            |                   | x             | Numéro de départ auquel est lié le noeud         | Formatage par une liste de domaine ( an_ecl_depart )                             | Fiche information : Point intérêt (PI)   |
| etat_pi           |                   | x             | Etat du point d'intérêt                          | Formatage par une liste de domaine ( lt_ecl_etat )                               | Fiche information : Point intérêt (PI)   |
| qua_dat           |                   | x             | Qualité de la date de pose du le point d'interet | Formatage par une liste de domaine ( lt_ecl_qualite_date )                       | Fiche information : Point intérêt (PI)   |
| qua_geo_xy        |                   | x             | Classe de la géolocalisation en XY               | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )            | Fiche information : Point intérêt (PI)   |
| qua_geo_z         |                   | x             | Classe de la géolocalisation en Z                | Formatage par une liste de domaine ( lt_ecl_qualite_geolocalisation )            | Fiche information : Point intérêt (PI)   |
| situation         |                   | x             | Situation générale : actif, inactif,supprimé     | Formatage par une liste de domaine ( lt_ecl_situation )                          | Fiche information : Point intérêt (PI)   |
| ty_pi             |                   | x             | Type de point d'intérêt                          | Formatage par une liste de domaine ( lt_ecl_type_pi )                            | Fiche information : Point intérêt (PI)   |
| info_bulle | x                 |               | info_bulle                                               |  | Cartographie Réseaux  |

  * ### Filtres :

| Nom                    | Attribut                        | Au chargement     | Type           | Condition                                                        | Valeur                       | Description                                                            |
| ---------------------- | ------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------:| ---------------------------- | ---------------------------------------------------------------------- |
| type_ PI               | ty_pi (type de point d'interet) |                   | Prédéfinis     | est égale à une valeur choisie par l'utilisateur parmi une liste | une valeur listée de “ty_pi” | Sert à la recherche : ''Recherche de point d'interet"                  |
| Situation != supprimer | situation                       |      x             | Alphanumérique | est différente de une(des) valeur(s) par défaut                  | 12                           | Empêche l'apparation des points-lumineux supprimés sur la cartographie |

  * ### Relations :

| Géotables ou Tables                                | Champs de jointure (champs table - champs table liée)     | Type     |
|:--------------------------------------------------:|:---------------------------------------------------------:|:--------:|
| an_ecl_media                                       | id_pi - id                                                |0...n      |
| xapps_an_vmr_ecl_materialisee_noeud_armoire        | id_pi - id_noeud                                          | 1        |
| an_ecl_intervention (intervention point d'interet) | id_pi - id_objet                                          |0...n      |
| an_ecl_errreur                                     | id_pi - id_objet                                          |0...n      |


  * ### Particularités :

## Table : 'xapps_geo_v_ecl_intervention_liste_affichage'

* ### Filtres :
| Nom                                    | Attribut                                 | Au chargement     | Type           | Condition         | Valeur       | Description                                                                                             |
| -------------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-----------------:| ------------ | ------------------------------------------------------------------------------------------------------- |
| Etats                                  | etat_sign ( état du signalement)         | x                 | Alphanumérique | est différente de | 000, 60 et 30 | Permet de n'afficher que les entités qui ne sont pas en 'réglé' ou 'non-renseigné' sur la cartographie. |
| Type=signalement (10)                  | type_si_in (Signalement ou Intervention) | x                 | Alphanumérique | est égale à       | 10           | Permet d'afficher que les entités qui sont des signalements sur la cartographie.                        |
| Pour rafaichissement domaine de valeur | geom                                     |                   | Alphanumérique | est non-nulle     |              | Sert à actualiser le domaine de valeur en forçant un calcul de géométrie.                               |

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune
## Table : 'xapps_geo_v_ecl_depart'
| Nom           | Attribut     | Au chargement     | Type     | Condition         | Valeur       | Description                                                                                                                                                          |
| ------------- | ------------ |:-----------------:|:--------:|:-----------------:| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| par géométrie | geom         |                   | Spatial  | est différente de | 000, 60 et 30 | Sélection des départs dont la géométrie (buffer autour du point réalisé en base) contient le point courant. Utilisé dans le domaine de valeur utilisant cette table. |
* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Domaine de valeur : 'geo_v_ecl_ouvrage_electrique'
| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l’apparition des ouvrages supprimés                                      |

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Domaine de valeur : 'an_ecl_depart'
| Nom                    | Attribut                                 | Au chargement     | Type           | Condition                                                                                   | Valeur                            | Description                                                                                          |
| ---------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-------------------------------------------------------------------------------------------:| --------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Situation != supprimer | situation                                |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut                                             | 12                                | Empêche l’apparition des départs supprimés          

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune       

## Domaine de valeur : 'xapps_geo_v_ecl_intervention_liste_affichage'
| Nom                                    | Attribut                                 | Au chargement     | Type           | Condition         | Valeur       | Description                                                                          |
| -------------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:-----------------:| ------------ | ------------------------------------------------------------------------------------ |
| Etats                                  | etat_sign ( état du signalement)         | x                 | Alphanumérique | est différente de | 000, 60 et 30 | Permet de n'afficher que les entités qui ne sont pas en 'réglé' ou 'non-renseigné' . |
| Type=signalement (10)                  | type_si_in (Signalement ou Intervention) | x                 | Alphanumérique | est égale à       | 10           | Permet d'afficher que les entités qui sont des signalements                          |
| Pour rafaichissement domaine de valeur | geom                                     | x                 | Alphanumérique | est non-nulle     |              | Sert à actualiser le domaine de valeur en forçant un calcul de géométrie.            |

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Domaine de valeur : 'xapps_geo_v_ecl_depart'
| Nom           | Attribut     | Au chargement     | Type     | Condition         | Valeur       | Description                                                                                                                                                          |
| ------------- | ------------ |:-----------------:|:--------:|:-----------------:| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| par géométrie | geom         |           x        | Spatial  | est différente de | 00, 60 et 30 | Sélection des départs dont la géométrie (buffer autour du point réalisé en base) contient le point courant. |

* ### Relations : 
	Aucune
* ### Particularités :
	Sélectionne les départs à 400 m ou moins de l'objet courant (dont la fiche information est ouverte). Evite une liste des 300 ou 500 départs différents. 

## Domaine de valeur : 'an_ecl_modele_support'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_sup (modèle de support) |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_sup = 2), qui sert uniquement pour les interventions |

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Domaine de valeur : 'an_ecl_modele_lanterne'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_ln (modèle de lanterne) |     x              | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_ln = 2), qui sert uniquement pour les interventions |

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Domaine de valeur : 'an_ecl_modele_lanterne'
| Nom                     | Attribut                    | Au chargement     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |    x               | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |
* ### Relations : 
	Aucune
* ### Particularités :
	Aucune

## Médias : 'Media - ECL - Objets'

| Source       | Taille        | Connexion                   | Lien de connexion                      | Média     | Miniature     | Type de media     | Nom du média     | Fichier origine     |
| ------------ |:-------------:|:---------------------------:| -------------------------------------- | --------- | ------------- | ----------------- | ---------------- | ------------------- |
| an_ecl_media | 450x450 60x60 | ECL - Gestion du patrimoine | /home/DOC_SIG_FIC/metiers/ress/ecl/doc | media     | miniature     | t_fichier         | n_fichier        |                     |

Concerne tous les objets (Supports, foyers, départs, PI, ouvrages, câbles).
* ### Relations : 
	Aucune
* ### Particularités :
	Aucune
## Médias : 'Media - ECL - Modèles'
| Source              | Taille        | Connexion                   | Lien de connexion                      | Média     | Miniature     | Type de media     | Nom du média     | Fichier origine     |
| ------------------- |:-------------:|:---------------------------:| -------------------------------------- | --------- | ------------- | ----------------- | ---------------- | ------------------- |
| an_ecl_media_modele | 450x450 60x60 | ECL - Gestion du patrimoine | /home/DOC_SIG_FIC/metiers/ress/ecl/doc | media     | miniature     | t_fichier         | n_fichier        |                     |

Concerne les modèles de lampe, de lanterne et de support.

* ### Relations : 
	Aucune
* ### Particularités :
	Aucune
	
# Les fonctionnalités 	
	
## Recherche globale : `ECL - Recherche avancée d'une voie`

Cette recherche permet à l'utilisateur de rechercher une voie en mode proposition de valeur (sans saisie manuelle). Cette recherche est issue de l'application Voie-Adresse. Se référer à ce dossier pour le détail de cette recherche. **La seule différence ici est que la vleur de la ville a été mise à 'Compiègne' par défaut**, afin de faciliter le travail du service d'éclairage public qui intervient principalement sur Compiègne.

## Recherche globale : `ECL - Recherche avancée d'une adresse`
Cette recherche permet à l'utilisateur de rechercher une adresse en mode proposition de valeur (sans saisie manuelle). Cette recherche est issue de l'application Voie-Adresse. Se référer à ce dossier pour le détail de cette recherche. **La seule différence ici est que la vleur de la ville a été mise à 'Compiègne' par défaut**, afin de faciliter le travail du service d'éclairage public qui intervient principalement sur Compiègne.

## *En Construction*

> **Les recherches ci-dessous existent, mais n'ont encore jamais été utilisées par le service technique, la documentation sera donc réalisée après les retours possibles du service. En l'absence d'utilisation, ces recherches pourront être supprimées, ou simplifiées pour celles éligibles au clic.**
>## Recherche : 'Recherche d'ouvrages électriques'
>Eligible au clic
>## Recherche : 'Recherche de départ'
>## Recherche : 'Recherche de support'
> Eligible au clic
> ## Recherche : 'Recherche de foyer'
> ## Recherche : 'Recherche de point-d'intérêt' Eligible au clic
> ## Recherche : 'Recherche de câble' Eligible au clic
> ## Tableau de bord 
> 
> ## *Fin de la zone en construction*

## Recherche : 'Recherche de modèle de support'
Cette recherche permet à l'utilisateur de faire une recherche de tous les modèles de support existants, sauf le modèle id=2, utilisé uniquement pour la gestion des interventions.

* ### Configuration :

Source : an_ecl_modele_support

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| nom_mod_su   | x            | x              | x              |                         | x                     |

Tri : nom_mod_su (Alphabétique) 

(la détection des doublons n'est pas activée ici)

* ### Filtres :

| Nom                     | Attribut                    | Obligatoire    | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_sup (modèle de support) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |

Fiches d'information active : Fiche d'information Support (modèle)

## Recherche : 'Recherche de modèle de lampe'
Cette recherche permet à l'utilisateur de faire une recherche de tous les modèles de lampe existants, sauf le modèle id=2, utilisé uniquement dans l'application pour les interventions.

* ### Configuration :

Source : an_ecl_modele_lampe

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| nom_mod_lm   | x            | x              | x              |                         | x                     |

Tri : nom_mod_lm (Alphabétique)

(la détection des doublons n'est pas activée ici)

* ### Filtres :

| Nom                     | Attribut                    | obligatoire     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_lm (modèle de lampe) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_lm = 2), qui sert uniquement pour les interventions |

Fiches d'information active : Fiche d'information Lampe (modèle)

## Recherche : 'Recherche de modèle de lanterne'
Cette recherche permet à l'utilisateur de faire une recherche de tous les modèles de lanterne existants, sauf le modèle id=2, utilisé uniquement dans l'application pour les interventions.

* ### Configuration :

Source : an_ecl_modele_lampe

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| nom_mod_ln   | x            | x              | x              |                           | x                     |

Tri : nom_mod_ln (Alphabétique) 

(la détection des doublons n'est pas activée ici)

* ### Filtres :

| Nom                     | Attribut                    | Obligatoire     | Type           | Condition                                       | Valeur     | Description                                                                                                                                                                                 |
| ----------------------- | --------------------------- |:-----------------:|:--------------:|:-----------------------------------------------:| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tout sauf 'même modèle' | id_mod_ln (modèle de lanterne) |                   | Alphanumérique | est différente de une(des) valeur(s) par défaut | 2          | Afin de ne pas faire apparaître le modèle intitulé 'même modèle' (id_mod_ln = 2), qui sert uniquement pour les interventions |

Fiches d'information active : Fiche d'information Lanterne (modèle)

## Recherche : 'Rapport de signalement'
Cette recherche permet à l'utilisateur de rechercher tous les signalements faits entre deux dates.

* ### Configuration :

Source : an_ecl_intervention

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| Affiche-recherche-signalement  | x            | x              | x              |                        | x                     |

Tri : id_inter (ascendant) 

(la détection des doublons n'est pas activée ici)

La géométrie est récupérer via la relation avec la table geo_ecl_noeud.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Etats                              | etat_sign                                |                   | Alphanumérique | La valeur de “etat_sign” =est égale à                                                          | 10 , 50 ou 40 | Sélectionne les interventions/signalements qui ne sont pas réglés (soumis, classé sans suite, pour information), de façon à les faire apparaître dans le rapport de signalement .  |
| Dates signalement                  | dat_signa (Date du signalement)          |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur et une valeur choisie par l'utilisateur |               | Sert à la recherche : "Rapport de signalement", afin de faire apparaître tous les signalements réalisées entre deux dates.                                                         |
| Signalement oui / intervention non | type_si_in (Signalement ou intervention) |                   | Alphanumérique | La valeur de “type_si_in” =est égale à                                                         | 10            |                                                                                    |

Fiches d'information active : sans objet

## Recherche : 'Rapport d'intervention'
Cette recherche permet à l'utilisateur rechercher de toutes les interventions faits entre deux dates.

* ### Configuration :

Source : an_ecl_intervention

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| Affiche-recherche-signalement  | x            | x              | x              |                        | x                     |

Tri : id_inter (ascendant) 

(la détection des doublons n'est pas activée ici)

La géométrie est récupérer via la relation avec la table geo_ecl_noeud.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dates intervention                 | dat_real (Date de réalisation des signalements)          |                   | Alphanumérique | est comprise entre une valeur choisie par l'utilisateur et une valeur choisie par l'utilisateur |               |                                                          |

Fiches d'information active : sans objet

## Recherche : 'Câble non-relié'
Cette recherche permet à l'utilisateur de rechercher de tous les câbles non-reliés, que ce soit au noeud final, initial ou les deux.

* ### Configuration :

Source : geo_ecl_cable

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| id_cab  | x            | x              | x              |                        | x                     |

Tri : pas de tri.

(la détection des doublons n'est pas activée ici)

La géométrie est celle du câble.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id_nd_fin est null | id_nd_fin (nœud final du câble)   |            | Alphanumérique | La valeur de “id_nd_fin” est | null | Recherche : "câble non relié" |
| id_nd_ini est null | id_nd_ini (nœud initial du câble) |            | Alphanumérique | La valeur de “id_nd_ini” est | null | |


Fiches d'information active : sans objet

## Recherche : 'Noeud non-relié à un câble'
Cette recherche permet à l'utilisateur rechercher de tous les noeuds qui ne sont pas reliés à des câbles.

* ### Configuration :

Source : geo_ecl_noeud

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| id_noeud  | x            | x              | x              |                        | x                     |

Tri : pas de tri.

(la détection des doublons n'est pas activée ici)

La géométrie est celle du noeud.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ------------------------ |
| Non relié à un câble  |  id_noeud  |        | Alphanumérique | (id_noeud NOT IN (SELECT id_nd_ini FROM m_reseau_sec.geo_ecl_cable WHERE id_nd_ini IS NOT NULL AND situation <> '12') AND id_noeud NOT IN (SELECT id_nd_fin FROM m_reseau_sec.geo_ecl_cable WHERE id_nd_fin IS NOT NULL AND situation <> '12') AND situation <> '12' AND situation <> '11') |  |  |

Fiches d'information active : sans objet

## Recherche : 'Noeud non-relié à une armoire'
Cette recherche permet à l'utilisateur de rechercher de tous les noeuds qui ne sont pas reliés à une armoire de façon attributaire.

* ### Configuration :

Source : geo_ecl_noeud

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| id_noeud  | x            | x              | x              |                        | x                     |

Tri : pas de tri.

(la détection des doublons n'est pas activée ici)

La géométrie est celle du noeud.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ------------------------ |
|Depart null  |  depart     |   | Alphanumérique | la valeur est | null |  | |
|Noeud n'est pas une armoire   |  id_noeud     |   | Alphanumérique | (id_noeud NOT IN (SELECT id_ouvelec FROM m_reseau_sec.an_ecl_ouvrage_electrique))|  |  | |
| Situation != supprimer et inactif  |  situation    |   | Alphanumérique |  est différente de|  12, 11|  | |

Fiches d'information active : sans objet

## Recherche : 'Recherche des foyers dont la lampe n'est pas renseignée'
Cette recherche permet à l'utilisateur de rechercher tous les foyers qui n'ont pas de modèle de lampe renseignée.

  * ### Configuration :

Source : an_ecl_foyer

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| id_foyer  | x            | x              | x              |                        | x                     |

Tri : pas de tri.

(la détection des doublons n'est pas activée ici)

La géométrie est celle du support auquel est lié le foyer, via la relation avec la table "geo_ecl_noeud".

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ------------------------ |
|Si lampe par défaut   |  id_mod_lm     |   | Alphanumérique | est égale à| 1  |  | |
| Situation != supprimer et inactif  |  situation    |   | Alphanumérique |  est différente de|  12, 11|  | |

Fiches d'information active : 'Foyer (ECL)'

## Recherche : ' Recherche de supports sans foyers'
Cette recherche permet à l'utilisateur de rechercher tous les supports qui n'ont pas de foyer.

* ### Configuration :

Source : geo_v_ecl_point_lumineux

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| Affiche_recherche | x            | x              | x              |                        | x                     | 

Tri : pas de tri.        

(la détection des doublons n'est pas activée ici)  

La géométrie est celle du noeud.

* ### Filtres :

| Nom                                | Attribut                                 | Au chargement     | Type           | Condition                                                                                      | Valeur        | Description                                                                                                                                                                        |
| ---------------------------------- | ---------------------------------------- |:-----------------:|:--------------:|:----------------------------------------------------------------------------------------------:| ------------- | ------------------------ |
|Support sans foyer   |  id_supp    |   | Alphanumérique | ({id_supp} NOT IN (SELECT id_supp FROM m_reseau_sec.an_ecl_foyer WHERE situation <> '12'))|   |  | |
| Situation != supprimer  |  situation    |   | Alphanumérique |  est différente de|  12|  | |

Fiches d'information active : 'Point lumineux (support)'

## Recherche : ' Recherche d'erreur'
Cette recherche permet à l'utilisateur de rechercher tous les supports qui n'ont pas de foyer.

* ### Configuration :

Source : geo_v_ecl_point_lumineux

| Attribut     | Afficher     | Rechercher     | Suggestion     | Attribut de géométrie     | Tri des résultats     |
| ------------ |:------------:|:--------------:|:--------------:|:-------------------------:|:---------------------:|
| champ_calcule | x            | x              | x              |                        | x                     |

Tri : pas de tri.

(la détection des doublons n'est pas activée ici)

Pas de géométrie.

* ### Filtres : Sans objet

Fiches d'information active : sans objet



## Cartographie (via menu de gauche des fonctionnalités) : 

Pour les "Visuels de gestion", les géotables sont glissées dans les fonctionnalités de l'application. Cela permet de les afficher sans passer par la légende.

### Visuel de gestion --> Support classés par armoire

Source : xapps_geo_v_ecl_support_par_armoire

Particularité : Lorsqu'une armoire est ajoutée, il faut la rentrer dans la cartographie ECL (ajouter une catégorie dans la symbologie).

### Visuel de gestion --> Zones de gestion

Source : geo_amt_zpne_gestion

### Visuel de gestion --> Etat des supports

Source : Etat des supports (geo_v_ecl_point_lumineux)

## Modification géométrique d'ouvrage électrique 

Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un ouvrage électrique. Cette fonctionnalité n'est accessible qu'aux agents du service d'éclairage public, et au SIG.

* ### Configuration :

	Source : geo_v_ecl_ouvrage_electrique

* ### Filtres : 
	Aucun
* ### Accrochage : 
| Géotable                     | Types     | Suivi de lignes     | Tolérance (px)     |
| ---------------------------- |:---------:|:-------------------:| ------------------ |
| geo_v_ecl_point_lumineux     | Nœud      |                     | 15                 |
| geo_v_ecl_point_d'interet    | Nœud      |                     | 15                 |
| geo_ecl_cable                | Nœud      |                     | 15                 |
| geo_v_ecl_ouvrage_electrique | Nœud      |                     | 15                 |

* ### Fiches d'information active :
	Fiche d'information 'Ouvrage electrique'
* ### Topologie : 
	Aucune

## Modification géométrique d'un point lumineux
Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un point lumineux. Cette fonctionnalité n'est accessible qu'aux agents du service d'éclairage public, et au SIG.

* ### Configuration :

Source : geo_v_ecl_point_lumineux

* ### Filtres : aucun
* ###  Accrochage : 
| Géotable                     | Types     | Suivi de lignes     | Tolérance (px)     |
| ---------------------------- |:---------:|:-------------------:| ------------------ |
| geo_v_ecl_ouvrage_electrique | Nœud      |                     | 15                 |
| geo_v_ecl_point_d'interet    | Nœud      |                     | 15                 |
| geo_ecl_cable                | Nœud      |                     | 15                 |
| geo_v_ecl_point_lumineux     | Nœud      |                     | 15                 |

* ### Fiches d'information active : 
	Fiche d'information 'Point lumineux (support)'
* ### Topologie : aucune

## Modification géométrique d'un point d'intérêt (ECL)
Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un point lumineux. Cette fonctionnalité n'est accessible qu'aux agents du service d'éclairage public, et au SIG.

* ### Configuration :

	Source : geo_v_ecl_point_d'interet

* ### Filtres : aucun
* ### Accrochage : 
| Géotable                     | Types     | Suivi de lignes     | Tolérance (px)     |
| ---------------------------- |:---------:|:-------------------:| ------------------ |
| geo_v_ecl_ouvrage_electrique | Nœud      |                     | 15                 |
| geo_v_ecl_point_lumineux     | Nœud      |                     | 15                 |
| geo_ecl_cable                | Nœud      |                     | 15                 |
| geo_v_ecl_point_d'interet    | Nœud      |                     | 15                 |

* ### Fiches d'information active :
	 Fiche d'information 'Point d'intérêt (PI)'
* ### Topologie : aucune

## Modification géométrique d'un point d'intérêt (ECL)
Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un câble. Cette fonctionnalité n'est accessible qu'aux agents du service d'éclairage public, et au SIG.

* ### Configuration :

Source : geo_ecl_cable

* ### Filtres : aucun
* ### Accrochage : 
| Géotable                     | Types     | Suivi de lignes     | Tolérance (px)     |
| ---------------------------- |:---------:|:-------------------:| ------------------ |
| geo_v_ecl_ouvrage_electrique | Nœud      |                     | 15                 |
| geo_v_ecl_point_lumineux     | Nœud      |                     | 15                 |
| geo_v_ecl_pi                 | Nœud      |                     | 15                 |

* ### Fiches d'information active : Fiche d'information 'Câble (ECL)'
* ### Topologie : aucune
    
    
## Saisie attributaire d'un modèle de lampe 

* ### Fiches d'information active : 
	Fiche d'information 'Lampe (modèle)'

## Saisie attributaire d'un modèle de lanterne

* ### Fiches d'information active : 
	Fiche d'information 'Lanterne (modèle)'

## Saisie attributaire d'un modèle de lampe 

* ### Fiches d'information active :
	Fiche d'information 'Support (modèle)'


## Fiche information :  Lampe (modèle)

Source : an_ecl_modele_lampe

* ###    Statistique : 
	Aucune
  
* ### Représentation : 

	| Mode d'ouverture     |      | Taille (px)     | Agencement des sections     |
	| -------------------- | ---- | --------------- | --------------------------- |
	| dans le gabarit      |      | 600 * 650       | Vertical                    |
	
	| Nom de la section     | Sous-section     | Attributs     | Position label     | Agencement attribut     | Visibilité conditionnelle        | Fichie liée     | Ajout de données autorisé     | Description                                |
	|:---------------------:|:----------------:|:-------------:|:------------------:|:-----------------------:|:--------------------------------:|:---------------:|:-----------------------------:|:------------------------------------------:|
	| Caractéristiques      |                  |               | par défaut         | Vertical                |                                  |                 |                               | Caréctéristiques métier du modèle de lampe |
	|                       | nom_mod_lm       |               |                    |                         |                                  |                 |                               |                                            |
	|                       | gar_lamp         |               |                    |                         |                                  |                 |                               |                                            |
	|                       | ty_lampe         |               |                    |                         |                                  |                 |                               |                                            |
	|                       | puis_lam         |               |                    |                         |                                  |                 |                               |                                            |
	|                       | cul_lamp         |               |                    |                         |                                  |                 |                               |                                            |
	| Télégestion           |                  |               | par défaut         | Vertical                | ty_lampe == 50                   |                 |                               |                                            |
	|                       | telgest          |               |                    |                         |                                  |                 |                               |                                            |
	| Couleur d’éclairage   |                  |               | par défaut         | Vertical                | ty_lampe == 10 && cul_lamp == 30 |                 |                               |                                            |
	|                       | cou_ecl          |               |                    |                         |                                  |                 |                               |                                            |
	| Métadonnées           |                  |               |                    |                         |                                  |                 |                               |                                            |
	|                       | date_maj         |               |                    |                         |                                  |                 |                               |                                            |
	|                       | date_sai         |               |                    |                         |                                  |                 |                               |                                            |
	|                       | op_sai           |               |                    |                         |                                  |                 |                               |                                            |
	| Photothèque           |                  |               | par défaut         | Vertical                | id_mod_lm != NULL                |                 |                               | Photos et documents associés               |
	|                       | miniature        |               |                    |                         |                                  |                 |                               |                                            |
	|                       | n_fichier        |               |                    |                         |                                  |                 |                               |                                            |

* ### Saisie :

Sont présents ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                         | Obligatoire     | Valeur par défaut     | Liste de domaine                  |
|:----------------------------------------------------------------:|:---------------:|:---------------------:|:---------------------------------:|
| Nom du modèle de lampe ( nom_mod_lm )   STRING                   |                 |                       |                                   |
| Type de lampe ( ty_lampe )   STRING                              | x               | 00                     | "lt_ecl_type_lampe"               |
| Puissance de la lampe ( puis_lam )   STRING                      |                |                      |    |
| Culot de la lampe ( cul_lamp )   STRING                          | x               | 00                     | "lt_ecl_culot_lampe"              |
| Présence d'une télégestion ( telgest )   STRING                  | x               | 00                     | "lt_ecl_presence (code)"          |
| Couleur d'éclairage de la lampe ( cou_ecl )   STRING             | x               | 00                     | "lt_ecl_couleur_eclairage (code)" |
| Garantie de la lampe en années ( gar_lamp )   INTEGER            |                 |                       |                                   |
| Opérateur de la saisie initiale de la donnée ( op_sai )   STRING |                 | %USER_LOGIN%          |                                   |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :  Lanterne (modèle)

Source : an_ecl_modele_lanterne

* ### Statistique :
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530 *650        | Vertical                    |

| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                               | Fichie liée     | Ajout de données autorisé     | Description                                |
|:---------------------:|:----------------:|:----------------:|:------------------:|:-----------------------:|:-------------------------------------------------------:|:---------------:|:-----------------------------:|:------------------------------------------:|
| Caractéristiques      |                  |                  | par défaut         | Vertical                |                                                         |                 |                               | Caréctéristiques métier du modèle de lampe |
|                       |                  | nom_mod_ln       |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | gar_lant         |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | clas_el_ln       |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | cod_ral_ln       |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | ik_lant          |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | ip_lant          |                    |                         |                                                         |                 |                               |                                            |
|                       | (vide)           |                  | par défaut         | Vertical                | id_mod_ln != NULL && (ik_lant == NULL `||` ip_lant ==NULL) |                 |                               |                                            |
|                       |                  | Affichage_message_erreur |                    |                         |                                                         |                 |                               |                                            |
| Photothèque           |                  |                  | par défaut         | Vertical                | id_mod_lm != NULL                                       |                 |                               | Photos et documents associés               |
|                       |                  | miniature        |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | n_fichier        |                    |                         |                                                         |                 |                               |                                            |
| Métadonnées           |                  |                  | par défaut         | Vertical                | id_mod_lm != NULL                                       |                 |                               | métadonnées de l'entité                    |
|                       |                  | op_sai           |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | date_sai         |                    |                         |                                                         |                 |                               |                                            |
|                       |                  | date_maj         |                    |                         |                                                         |                 |                               |                                            |
|                       | (vide)           |                  | par défaut         | Vertical                | id_mod_ln != NULL                                       |                 |                               |                                            |
|                       |                  | Affichage_message_erreur |                    |                         |                                                         |                 |                               |                                            |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attributs     | Champ calculé     | Formatage     | Renommage                                 | Particularité/Usage                                      | Utilisation                                               |
|:------------:|:-----------------:|:-------------:|:-----------------------------------------:|:--------------------------------------------------------:|:---------------------------------------------------------:|
| clas_el_ln   |                   | x             | Classe électrique de la lanterne          | Formatage par une liste de domaine ( lt_ecl_type_lampe ) | Fiche d'information : modèle lanterne (ECL) / Foyer (ECL) |
| cle_media    | x                 |               | cle_media                                 | Correspond à l'id de l'objet avec LN en préfixe. (1)     | Relation avec an_ecl_media_modele.                        |
| cod_ral_ln   |                   |               | Code RAL de la lanterne                   |                                                          | Fiche d'information : modèle lanterne (ECL) / Foyer (ECL) |
| date_maj     |                   | x             | Date de dernière mise à jour              | Les heures ne sont pas affichées                         | Fiche d'information : modèle lanterne (ECL)               |
| date_sai     |                   | x             | Date de saisie de la donnée dans la base  | Les heures ne sont pas affichées                         | Fiche d'information : modèle lanterne (ECL)               |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :  Support (modèle)

Source : an_ecl_modele_support

* ### Statistique : aucune
  
* ### Représentation : 

| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 570*650         | Vertical                    |


| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle              | Fichie liée     | Ajout de données autorisé     | Description                                               |
|:---------------------:|:----------------:|:----------------:|:------------------:|:-----------------------:|:--------------------------------------:|:---------------:|:-----------------------------:|:---------------------------------------------------------:|
| Caractéristiques      |                  | Caractéristiques | par défaut         | Vertical                |                                        |                 |                               | Caréctéristiques métier du modèle de support              |
|                       |                  | nom_mod_su       |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | mat_supp         |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | ik_supp          |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | ip_supp          |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | cod_ral_s        |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | observ           |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | op_sai           |                    |                         |                                        |                 |                               |                                                           |
|                       | (vide)           |                  | par défaut         | Vertical                | id_mod_sup != NULL && (ik_supp == NULL `||` ip_supp ==NULL) |                 |                |                                                           |
|                       |                  | Affichage_message_erreur |                    |                         |                                        |                 |                               |                                                           |
| Photothèque           |                  |                  | par défaut         | Vertical                | id_mod_sup!= NULL                      |                 |                               | Photos et documents associés                              |
|                       |                  | miniature        |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | n_fichier        |                    |                         |                                        |                 |                               |                                                           |
| Métadonnées           |                  |                  | par défaut         | Vertical                | id_mod_sup != NULL                     |                 |                               | métadonnées de l'entité                                   |
|                       |                  | op_sai           |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | date_sai         |                    |                         |                                        |                 |                               |                                                           |
|                       |                  | date_maj         |                    |                         |                                        |                 |                               |                                                           |
| (vide)                |                  | op_sai           | par défaut         | Vertical                | id_mod_lm < 0                          |                 |                               | Pour que l'opérateur de saisie se remplisse correctement. |

* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                                   | Obligatoire     | Valeur par défaut     | Liste de domaine            | Représentation     |
|:--------------------------------------------------------------------------:|:---------------:|:---------------------:|:---------------------------:|:------------------:|
| Nom Mod Su ( nom_mod_su )   STRING                                         |                 |                       |                             | Par défaut         |
| Matériau du support ( mat_supp )   STRING                                  | x               | 00                     | "lt_ecl_materiaux_supports" | Par défaut         |
| indice de protection face aux influences extérieures ( ik_supp )   INTEGER |                 |                       |                             | Par défaut         |
| Indice de protection aux chocs mécaniques ( ip_supp )   INTEGER            |                 |                       |                             | Par défaut         |
| Op Sai ( op_sai )   STRING                                                 |                 | %USER_LOGIN%          |                             | Par défaut         |
| Code RAL du support ( cod_ral_s )   STRING                                 |                 |                       |                             | Par défaut         |
| Commentaires divers ( observ )   STRING                                    |                 |                       |                             | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun
  
## Fiche information :  Câble (ECL)

Source : geo_ecl_cable

* ### Statistique : 
	Aucune
  
* ### Représentation : 

| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*300         | Onglet                      |


| Nom de la section     | Sous-section     | Attributs     | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée        | Ajout de données autorisé     | Description                                         |
|:---------------------:|:----------------:|:-------------:|:------------------:|:-----------------------:|:-----------------------------:|:------------------:|:-----------------------------:|:---------------------------------------------------:|
| Caractéristiques      |                  |               | par défaut         | Vertical                |                               |                    |                               | Caréctéristiques métier de l'objet                  |
|                       |                  | etat_cable    |                    |                         |                               |                    |                               |                                                     |
|                       |                  | situ_cab      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | sect_cab      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | observ        |                    |                         |                               |                    |                               |                                                     |
|                       | (vide)           |               | par défaut         | Vertical                | id_cab != NULL                |                    |                               |                                                     |
|                       |                  | tension       |                    |                         |                               |                    |                               |                                                     |
|                       | (vide)           |               | par défaut         | Vertical                | id_cab != NULL                |                    |                               |                                                     |
|                       |                  | message       |                    |                         |                               |                    |                               |                                                     |
| Photothèque           |                  |               | par défaut         | Vertical                | id_cab != NULL                |                    |                               | Photos et documents associés                        |
|                       |                  | miniature     |                    |                         |                               |                    |                               |                                                     |
|                       |                  | n_fichier     |                    |                         |                               |                    |                               |                                                     |
| Métadonnées           |                  |               | par défaut         | Vertical                | id_cab != NULL                |                    |                               | métadonnées de l'entité                             |
|                       |                  | situation     |                    |                         |                               |                    |                               |                                                     |
|                       |                  | qua_geo_xy    |                    |                         |                               |                    |                               |                                                     |
|                       |                  | qua_geo_z     |                    |                         |                               |                    |                               |                                                     |
|                       |                  | date_donne    |                    |                         |                               |                    |                               |                                                     |
|                       |                  | date_sai      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | date_maj      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | op_sai        |                    |                         |                               |                    |                               |                                                     |
|                       |                  | op_sai_geo    |                    |                         |                               |                    |                               |                                                     |
|                       |                  | src_geom      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | src_date      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | insee1        |                    |                         |                               |                    |                               |                                                     |
|                       |                  | commune1      |                    |                         |                               |                    |                               |                                                     |
|                       |                  | insee2        |                    |                         |                               |                    |                               |                                                     |
|                       |                  | commune2      |                    |                         |                               |                    |                               |                                                     |
|                       | (vide)           |               | par défaut         | Vertical                | id_cab != NULL                |                    |                               |                                                     |
|                       |                  | message       |                    |                         |                               |                    |                               |                                                     |
| Intervention          |                  |               | par défaut         | Vertical                | id_cab != NULL                | intervention câble | x                             | Données de an_ecl_intervention en lien avec l'objet |
|                       |                  | dates         |                    |                         |                               |                    |                               |                                                     |
|                       |                  | type_inter    |                    |                         |                               |                    |                               |                                                     |

* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                     | Obligatoire     | Valeur par défaut     | Liste de domaine                | Représentation     |
|:------------------------------------------------------------:|:---------------:|:---------------------:|:-------------------------------:|:------------------:|
| Exploitant du câble ( exploi_cab )   STRING                  |                 |                       |                                 | Par défaut         |
| Prestataire des travaux sur le câble ( presta_cab )   STRING |                 |                       |                                 | Par défaut         |
| Etat du câble ( etat_cable )   STRING                        | x               | 00                     | "lt_ecl_etat"                   | Par défaut         |
| Situation physique du câble ( situ_cab )   STRING            | x               | 00                     | "lt_ecl_situation_cable"        | Par défaut         |
| Date de pose du câble ( dat_pos_ca )   TIMESTAMP             |                 |                       |                                 | Par défaut         |
| Section du câble ( sect_cab )   STRING                       | x               | 00                     | "lt_ecl_section_cable (valeur)" | Par défaut         |
| Commentaires divers ( observ )   STRING                      |                 |                       |                                 | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING      |                 | %USER_LOGIN%          |                                 | Par défaut         |
| Opérateur de la saisie de la donnée géographique ( op_sai_geo )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Date de création de la donnée ( date_donne )   TIMESTAMP     |                 |                       |                                 | Par défaut         |
| Qualité de la date de pose ( qua_dat )   STRING              |                 | 00                     |                                 | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :   Point d'intérêt (PI)

Source : geo_v_ecl_point_d'interet

* ### Statistique : aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 850*550         | Onglet                      |


| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée     |
|:---------------------:|:----------------:|:----------------:|:------------------:|:-----------------------:|:-----------------------------:|:---------------:|
| Caractéristiques      |                  |                  | par défaut         | Vertical                |                               |                 |
|                       |                  | ty_pi            |                    |                         |                               |                 |
|                       |                  | etat_pi          |                    |                         |                               |                 |
|                       |                  | observ           |                    |                         |                               |                 |
|                       | Courant          |                  | par défaut         | Vertical                |                               |                 |
|                       |                  | depart           |                    |                         |                               |                 |
|                       |                  | amont_cour       |                    |                         |                               |                 |
| Photothèque           |                  |                  | par défaut         | Vertical                | id_pi != NULL                 |                 |
|                       |                  | miniature        |                    |                         |                               |                 |
|                       |                  | n_fichier        |                    |                         |                               |                 |
| Métadonnées           |                  |                  | par défaut         | Vertical                | id_pi != NULL                 |                 |
|                       |                  | situation        |                    |                         |                               |                 |
|                       |                  | qua_geo_xy       |                    |                         |                               |                 |
|                       |                  | qua_geo_z        |                    |                         |                               |                 |
|                       |                  | date_donne       |                    |                         |                               |                 |
|                       |                  | date_sai         |                    |                         |                               |                 |
|                       |                  | date_maj         |                    |                         |                               |                 |
|                       |                  | op_sai           |                    |                         |                               |                 |
|                       |                  | op_sai_geo       |                    |                         |                               |                 |
|                       |                  | src_geom         |                    |                         |                               |                 |
|                       |                  | src_date         |                    |                         |                               |                 |
|                       | (vide)           |                  | par défaut         | Vertical                | id_pi != NULL                 |                 |
|                       |                  | Affichage_message_erreur |                    |                         |                               |                 |
| Intervention          |                  |                  | par défaut         | Vertical                | id_pi != NULL                 | intervention PI |
|                       |                  | dates            |                    |                         |                               |                 |
|                       |                  | type_inter       |                    |                         |                               |                 |
| Contrat               |                  |                  | par défaut         | Vertical                | id_pi != NULL                 |                 |
|                       |                  | exploit_nd       |                    |                         |                               |                 |
|                       |                  | presta_nd        |                    |                         |                               |                 |
|                       |                  | ent_pose         |                    |                         |                               |                 |
|                       |                  | dat_pos          |                    |                         |                               |                 |
|                       |                  | qua_dat          |                    |                         |                               |                 |
|                       |                  | commune          |                    |                         |                               |                 |
|                       |                  | insee            |                    |                         |                               |                 |

* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                              | Obligatoire     | Valeur par défaut     | Liste de domaine                     | Représentation     |
|:---------------------------------------------------------------------:|:---------------:|:---------------------:|:------------------------------------:|:------------------:|
| Type de point d'intérêt ( ty_pi )   STRING                            | x               | 99                    | "lt_ecl_type_pi"                     | Par défaut         |
| Etat du point d'intérêt ( etat_pi )   STRING                          | x               | 00                     | "lt_ecl_etat"                        | Par défaut         |
| Numéro de départ auquel est lié le noeud ( depart )   INTEGER         |                 |                       | "xapps_geo_v_ecl_depart (id_depart)" | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING               |                 | %USER_LOGIN%          |                                      | Par défaut         |
| Opérateur de la saisie de la donnée géographique ( op_sai_geo )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Commentaires divers ( observ )   STRING                               |                 |                       |                                      | Par défaut         |
| Date de la donnée ( date_donne )   TIMESTAMP                          |                 |                       |                                      | Par défaut         |
| Exploit Nd ( exploit_nd )   STRING                                    |                 |                       |                                      | Par défaut         |
| Presta Nd ( presta_nd )   STRING                                      |                 |                       |                                      | Par défaut         |
| Entreprise ayant posé le point d'interet ( ent_pose )   STRING        |                 |                       |                                      | Par défaut         |
| Qualité de la date de pose du le point d'interet ( qua_dat )   STRING | x               | 00                     | "lt_ecl_qualite_date (code)"         | Par défaut         |
| Date de pose du le point d'interet ( dat_pos )   TIMESTAMP            |                 |                       |                                      | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :    Foyer (ECL)

Source : an_ecl_foyer

* ### Statistique : aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Onglet                      |

| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle             | Fichie liée              | Ajout de données autorisé     |
|:---------------------:|:----------------:|:----------------:|:------------------:|:-----------------------:|:-------------------------------------:|:------------------------:|:-----------------------------:|
| Foyer                 |                  |                  | par défaut         | Vertical                |                                       |                          |                               |
|                       |                  | id_mod_ln        |                    |                         |                                       |                          |                               |
|                       |                  | etat_foy         |                    |                         |                                       |                          |                               |
|                       |                  | ty_lantern       |                    |                         |                                       |                          |                               |
|                       |                  | observ           |                    |                         |                                       |                          |                               |
|                       | Platine          |                  | par défaut         | Vertical                |                                       |                          |                               |
|                       |                  | loc_plat         |                    |                         |                                       |                          |                               |
|                       |                  | ty_amorce        |                    |                         |                                       |                          |                               |
|                       |                  | ty_ballast       |                    |                         |                                       |                          |                               |
|                       |                  | ty_auto_tr       |                    |                         |                                       |                          |                               |
|                       | (vide)           |                  | par défaut         | Vertical                | id_foyer != NULL && (haut_feu == NULL `||`pct_fct ==NULL ||  |                          |                 |
|                       |                  | Affichage_message_erreur |                    |                         |                                       |                          |                               |
| Lanterne              |                  |                  | par défaut         | Vertical                | id_foyer != NULL                      | Lanterne (modèle :photo) |                               |
|                       |                  | nom_mod_ln       |                    |                         |                                       |                          |                               |
|                       |                  | gar_lant         |                    |                         |                                       |                          |                               |
|                       |                  | cod_ral_ln       |                    |                         |                                       |                          |                               |
|                       |                  | clas_el_ln       |                    |                         |                                       |                          |                               |
|                       |                  | ik_lant          |                    |                         |                                       |                          |                               |
|                       |                  | ip_lant          |                    |                         |                                       |                          |                               |
|                       |                  | observ           |                    |                         |                                       |                          |                               |
| Lampe                 |                  |                  | par défaut         | Vertical                | id_foyer != NULL                      | Lampe (modèle : photo)   |                               |
|                       |                  | nom_mod_lm       |                    |                         |                                       |                          |                               |
|                       |                  | ty_lampe         |                    |                         |                                       |                          |                               |
|                       |                  | puis_lam         |                    |                         |                                       |                          |                               |
|                       |                  | cul_lamp         |                    |                         |                                       |                          |                               |
|                       |                  | telgest          |                    |                         |                                       |                          |                               |
|                       |                  | cou_ecl          |                    |                         |                                       |                          |                               |
|                       |                  | gar_lamp         |                    |                         |                                       |                          |                               |
|                       |                  | observ           |                    |                         |                                       |                          |                               |
| Photothèque           |                  |                  | par défaut         | Vertical                | id_foyer != NULL                      |                          |                               |
|                       |                  | miniature        |                    |                         |                                       |                          |                               |
|                       |                  | n_fichier        |                    |                         |                                       |                          |                               |
| Métadonnées           |                  |                  | par défaut         | Vertical                | id_foyer != NULL                      |                          |                               |
|                       |                  | situation        |                    |                         |                                       |                          |                               |
|                       |                  | date_donne       |                    |                         |                                       |                          |                               |
|                       |                  | date_sai         |                    |                         |                                       |                          |                               |
|                       |                  | date_maj         |                    |                         |                                       |                          |                               |
|                       |                  | op_sai           |                    |                         |                                       |                          |                               |
|                       | (vide)           |                  |                    |                         |                                       |                          |                               |
|                       |                  | Affichage_message_erreur |                    |                         |                                       |                          |                               |
| Intervention          |                  |                  | par défaut         | Vertical                | id_foyer != NULL                      | intervention foyer       | x                             |
|                       |                  | Dates            |                    |                         |                                       |                          |                               |
|                       |                  | type_inter       |                    |                         |                                       |                          |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                            | Obligatoire     | Valeur par défaut     | Liste de domaine             | Représentation     |
|:-------------------------------------------------------------------:|:---------------:|:---------------------:|:----------------------------:|:------------------:|
| Modèle de la lanterne ( id_mod_ln )   INTEGER                       | x               | 1                     | "an_ecl_modele_lanterne"     | Par défaut         |
| Modèle de la lampe ( id_mod_lm )   INTEGER                          | x               | 1                     | "an_ecl_modele_lampe"        | Par défaut         |
| Pourcentage de puissance de fonctionnement ( pct_fct )   BIGDECIMAL |                 |                       |                              | Par défaut         |
| Type de ballast installé ( ty_ballast )   STRING                    | x               | 00                     | "lt_ecl_type_ballast (code)" | Par défaut         |
| Type d'amorceur installé ( ty_amorce )   STRING                     | x               | 00                     | "lt_ecl_amorceur (code)"     | Par défaut         |
| Type d'auto trasformateur installé ( ty_auto_tr )   STRING          |                 | 00                     |                              | Par défaut         |
| Commentaires divers ( observ )   STRING                             |                 |                       |                              | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING             |                 | %USER_LOGIN%          |                              | Par défaut         |
| Etat du foyer ( etat_foy )   STRING                                 | x               | 00                     | "lt_ecl_etat"                | Par défaut         |
|  Localisation de la platine  ( loc_plat )   STRING                  | x               | 00                     | "lt_ecl_emplacement (code)"  | Par défaut         |
|  Type de lanterne  ( ty_lantern )   STRING                          | x               | 00                     | "lt_ecl_type_lanterne"       | Par défaut         |
|  Date de création de la donnée  ( date_donne )   TIMESTAMP          |                 |                       |                              | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :    Ouvrage électrique

Source : geo_v_ecl_ouvrage_electrique

* ### Statistique :
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 925*550         | Onglet                      |

| Nom de la section     | Sous-section     | Attributs          | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée        | Ajout de données autorisé     |
|:---------------------:|:----------------:|:------------------:|:------------------:|:-----------------------:|:-----------------------------:|:------------------:|:-----------------------------:|
| Caractéristiques      |                  |                    | Par défaut         | Vertical                |                               |                    |                               |
|                       |                  | ty_ouvelec         |                    |                         |                               |                    |                               |
|                       |                  | nom_ouv            |                    |                         |                               |                    |                               |
|                       |                  | mod_pos_ou         |                    |                         |                               |                    |                               |
|                       |                  | etat_ouvel         |                    |                         |                               |                    |                               |
|                       |                  | etat_ouvel         |                    |                         |                               |                    |                               |
|                       |                  | ty_disjonc         |                    |                         |                               |                    |                               |
|                       |                  | ty_fusible         |                    |                         |                               |                    |                               |
|                       |                  | pres_var           |                    |                         |                               |                    |                               |
|                       |                  | observ             |                    |                         |                               |                    |                               |
|                       | Commande         |                    | Par défaut         | Vertical                | ty_ouvelec == '10'            |                    |                               |
|                       |                  | ty_comm            |                    |                         |                               |                    |                               |
|                       | Consommation     |                    | Par défaut         | Vertical                | ty_ouvelec == '10'            |                    |                               |
|                       |                  | pdl_edf            |                    |                         |                               |                    |                               |
|                       |                  | n_com_edf          |                    |                         |                               |                    |                               |
|                       |                  | puis_mes           |                    |                         |                               |                    |                               |
|                       | (vide)           |                    | Par défaut         | Vertical                | id_ouvelec != NULL && (ik_ouvelec == NULL`||`ip_ouvelec == NULL  `||` puis_mes ==NULL `||` val_terre==NULL)       |                    |                               |
|                       |                  | Affichage_message_erreur   |                    |                         |                               |                    |                               |
| Départ(s)             |                  |                    | Par défaut         | Vertical                | id_ouvelec != NULL            | Depart (ECL)       | x                             |
|                       |                  | nom_depart         |                    |                         |                               |                    |                               |
|                       |                  | puis_sous          |                    |                         |                               |                    |                               |
| Courant               |                  |                    | Par défaut         | Vertical                | ty_ouvelec != '10'            |                    |                               |
|                       |                  | depart             |                    |                         |                               |                    |                               |
|                       |                  | amont_cour         |                    |                         |                               |                    |                               |
| Photothèque           |                  |                    | Par défaut         | Vertical                | id_ouvelec != NULL            |                    |                               |
|                       |                  | miniature          |                    |                         |                               |                    |                               |
|                       |                  | n_fichier          |                    |                         |                               |                    |                               |
| Métadonnées           |                  |                    | Par défaut         | Vertical                | id_ouvelec != NULL            |                    |                               |
|                       |                  | situation          |                    |                         |                               |                    |                               |
|                       |                  | qua_geo_xy         |                    |                         |                               |                    |                               |
|                       |                  | qua_geo_z          |                    |                         |                               |                    |                               |
|                       |                  | date_donne         |                    |                         |                               |                    |                               |
|                       |                  | date_sai           |                    |                         |                               |                    |                               |
|                       |                  | date_maj           |                    |                         |                               |                    |                               |
|                       |                  | op_sai             |                    |                         |                               |                    |                               |
|                       |                  | op_sai_geo         |                    |                         |                               |                    |                               |
|                       |                  | src_geom           |                    |                         |                               |                    |                               |
|                       |                  | src_date           |                    |                         |                               |                    |                               |
|                       | (vide)           |                    | Par défaut         | Vertical                | id_ouvelec != NULL            |                    |                               |
|                       |                  | Affichage_message_erreur   |                    |                         |                               |                    |                               |
| Intervention          |                  |                    | Par défaut         | Vertical                | id_ouvelec != NULL            | intervention ouvrage electrique | x                             |
|                       |                  | dates              |                    |                         |                               |                    |                               |
|                       |                  | type_inter         |                    |                         |                               |                    |                               |
| Contrat               |                  |                    | Par défaut         | Vertical                | id_ouvelec != NULL            |                    |                               |
|                       |                  | exploit_nd         |                    |                         |                               |                    |                               |
|                       |                  | presta_nd          |                    |                         |                               |                    |                               |
|                       |                  | ent_pose           |                    |                         |                               |                    |                               |
|                       |                  | dat_pos            |                    |                         |                               |                    |                               |
|                       |                  | qua_dat            |                    |                         |                               |                    |                               |
|                       |                  | commune            |                    |                         |                               |                    |                               |
|                       |                  | insee              |                    |                         |                               |                    |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                      | Obligatoire     | Valeur par défaut     | Liste de domaine                      | Représentation     |
|:-------------------------------------------------------------:|:---------------:|:---------------------:|:-------------------------------------:|:------------------:|
| Nom de l'ouvrage ( nom_ouv )   STRING                         |                 |                       |                                       | Par défaut         |
| Type d'ouvrage électrique ( ty_ouvelec )   STRING             | x               | 00                     | "lt_ecl_type_ouvrage_electrique"      | Par défaut         |
| Etat de l'ouvrage électrique ( etat_ouvel )   STRING          | x               | 00                     | "lt_ecl_etat"                         | Par défaut         |
| Mode de pose de l'ouvrage ( mod_pos_ou )   STRING             | x               | 00                     | "lt_ecl_mode_pose_ouvrage_electrique" | Par défaut         |
| Type de commande ( ty_comm )   STRING                         | x               | 00                     | "lt_ecl_type_commande"                | Par défaut         |
| Pdl Edf ( pdl_edf )   STRING                                  |                 |                       |                                       | Par défaut         |
| Numéro de compteur EDF ( n_com_edf )   STRING                 |                 |                       |                                       | Par défaut         |
| Valeur de la terre en ohm ( val_terre )   LONG                |                 |                       |                                       | Par défaut         |
| Puis Mes ( puis_mes )   INTEGER                               |                 |                       |                                       | Par défaut         |
| Pres Var ( pres_var )   STRING                                | x               | 00                     | "lt_ecl_presence (code)"              | Par défaut         |
| Type de disjoncteur ( ty_disjonc )   STRING                   | x               | 00                     | "lt_ecl_type_disjoncteur"             | Par défaut         |
| Type de fusible ( ty_fusible )   STRING                       | x               | 00                     | "lt_ecl_type_fusible"                 | Par défaut         |
| Numéro de départ auquel est lié le noeud ( depart )   INTEGER |                 |                       | "xapps_geo_v_ecl_depart (id_depart)"  | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Opérateur de la saisie de la donnée géographique ( op_sai_geo )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Commentaires divers ( observ )   STRING                       |                 |                       |                                       | Par défaut         |
| Date de la donnée ( date_donne )   TIMESTAMP                  |                 |                       |                                       | Par défaut         |
| Prestataire intervenant sur l'objet ( presta_nd )   STRING    |                 |                       |                                       | Par défaut         |
| Exploitant de l'objet ( exploit_nd )   STRING                 |                 |                       |                                       | Par défaut         |
| Entreprise de pose ( ent_pose )   STRING                      |                 |                       |                                       | Par défaut         |
| Date de pose de l'ouvrage ( dat_pos )   TIMESTAMP             |                 |                       |                                       | Par défaut         |
| Qualité de la date de pose de l'ouvrage ( qua_dat )   STRING  | x               | 00                     | "lt_ecl_qualite_date (code)"          | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :    Départ (ECL)

Source : an_ecl_depart

* ###  Statistique : aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 500*450         | Onglet                      |


| Nom de la section     | Sous-section      | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle            | Fichie liée         | Ajout de données autorisé     |
|:---------------------:|:-----------------:|:----------------:|:------------------:|:-----------------------:|:------------------------------------:|:-------------------:|:-----------------------------:|
| Caractéristiques      |                   |                  | par défaut         | Vertical                |                                      |                     |                               |
|                       |                   | nom_depart       |                    |                         |                                      |                     |                               |
|                       |                   | etat_dep         |                    |                         |                                      |                     |                               |
|                       |                   | tension          |                    |                         |                                      |                     |                               |
|                       |                   | ty_disjonc       |                    |                         |                                      |                     |                               |
|                       |                   | ty_fusible       |                    |                         |                                      |                     |                               |
|                       |                   | puis_sous        |                    |                         |                                      |                     |                               |
|                       |                   | observ           |                    |                         |                                      |                     |                               |
|                       | Ouvrage du départ |                  | par défaut         | Vertical                |                                      |                     |                               |
|                       |                   | nom_ouv          |                    |                         |                                      |                     |                               |
|                       | Options           |                  | par défaut         | Vertical                |                                      |                     |                               |
|                       |                   | opt_supp         |                    |                         |                                      |                     |                               |
|                       | (vide)            |                  | par défaut         | Vertical                | id_depart != NULL && tension == NULL |                     |                               |
|                       |                   | Affichage_message_erreur |                    |                         |                                      |                     |                               |
| Photothèque           |                   |                  | par défaut         | Vertical                |                                      |                     |                               |
|                       |                   | miniature        |                    |                         |                                      |                     |                               |
|                       |                   | n_fichier        |                    |                         |                                      |                     |                               |
| Métadonnées           |                   |                  | par défaut         | Vertical                |                                      |                     |                               |
|                       |                   | situation        |                    |                         |                                      |                     |                               |
|                       |                   | date_donne       |                    |                         |                                      |                     |                               |
|                       |                   | date_sai         |                    |                         |                                      |                     |                               |
|                       |                   | date_maj         |                    |                         |                                      |                     |                               |
|                       |                   | op_sai           |                    |                         |                                      |                     |                               |
| Intervention          |                   |                  | par défaut         | Vertical                | id_depart != NULL                    | intervention départ | x                             |
|                       |                   | dates            |                    |                         |                                      |                     |                               |
|                       |                   | type_inter       |                    |                         |                                      |                     |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

  | Attribut                                                     | Obligatoire     | Valeur par défaut     | Liste de domaine          | Représentation     |
|:------------------------------------------------------------:|:---------------:|:---------------------:|:-------------------------:|:------------------:|
| Etat du départ ( etat_dep )   STRING                         | x               | 00                     | "lt_ecl_etat"             | Par défaut         |
| Tension électrique en sortie ( tension )   INTEGER           |                 |                       |                           | Par défaut         |
| Type du disjoncteur ( ty_disjonc )   STRING                  | x               | 00                     | "lt_ecl_type_disjoncteur" | Par défaut         |
| Type du fusible ( ty_fusible )   STRING                      | x               | 00                     | "lt_ecl_type_fusible"     | Par défaut         |
| Nom du secteur déservi par le départ ( nom_depart )   STRING |                 |                       |                           | Par défaut         |
| Commentaires divers ( observ )   STRING                      |                 |                       |                           | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING      |                 | %USER_LOGIN%          |                           | Par défaut         |
| Date de création de la donnée ( date_donne )   TIMESTAMP     |                 |                       |                           | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :     Support (point-lumineux)

Source : geo_v_ecl_point_lumineux (support)

* ### Statistique : aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 500*450         | Onglet                      |

| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                                   | Fichie liée                           | Ajout de données autorisé     |
|:---------------------:|:----------------:|:----------------:|:------------------:|:-----------------------:|:-----------------------------------------------------------:|:-------------------------------------:|:-----------------------------:|
| Caractéristiques      |                  |                  | par défaut         | Vertical                |                                                             |                                       |                               |
|                       |                  | ty_supp          |                    |                         |                                                             |                                       |                               |
|                       |                  | etat_supp        |                    |                         |                                                             |                                       |                               |
|                       |                  | ty_disjonc       |                    |                         |                                                             |                                       |                               |
|                       |                  | ty_fusible       |                    |                         |                                                             |                                       |                               |
|                       |                  | haut_supp        |                    |                         |                                                             |                                       |                               |
|                       |                  | haut_trap        |                    |                         |                                                             |                                       |                               |
|                       |                  | ty_para          |                    |                         |                                                             |                                       |                               |
|                       |                  | observ           |                    |                         |                                                             |                                       |                               |
|                       | Modèle de mât    |                  | par défaut         | Vertical                | ty_supp == 10                                               |                                       |                               |
|                       |                  | id_mod_sup       |                    |                         |                                                             |                                       |                               |
|                       | Option           |                  | par défaut         | Vertical                | ty_supp == 10                                               |                                       |                               |
|                       |                  | opt_supp         |                    |                         |                                                             |                                       |                               |
|                       | (vide)           |                  | par défaut         | Vertical                | id_supp != NULL && (haut_supp == NULL`||` haut_trap == NULL) ||  |                                       |                               |
|                       |                  | Message d'erreur |                    |                         |                                                             |                                       |                               |
| Foyer(s)              |                  |                  | par défaut         | Vertical                | id_ouvelec != NULL                                          | Foyer (ECL)                           | x                             |
|                       |                  | id_mod_ln        |                    |                         |                                                             |                                       |                               |
|                       |                  | id_mod_lm        |                    |                         |                                                             |                                       |                               |
| Courant               |                  |                  | par défaut         | Vertical                |                                                             |                                       |                               |
|                       |                  | depart           |                    |                         |                                                             |                                       |                               |
|                       |                  | amont_cour       |                    |                         |                                                             |                                       |                               |
| Photothèque           |                  |                  | par défaut         | Vertical                | id_supp != NULL                                             |                                       |                               |
|                       |                  | miniature        |                    |                         |                                                             |                                       |                               |
|                       |                  | n_fichier        |                    |                         |                                                             |                                       |                               |
| Métadonnées           |                  |                  | par défaut         | Vertical                | id_supp != NULL                                             |                                       |                               |
|                       |                  | situation        |                    |                         |                                                             |                                       |                               |
|                       |                  | qua_geo_xy       |                    |                         |                                                             |                                       |                               |
|                       |                  | qua_geo_z        |                    |                         |                                                             |                                       |                               |
|                       |                  | date_donne       |                    |                         |                                                             |                                       |                               |
|                       |                  | date_sai         |                    |                         |                                                             |                                       |                               |
|                       |                  | date_maj         |                    |                         |                                                             |                                       |                               |
|                       |                  | op_sai           |                    |                         |                                                             |                                       |                               |
|                       |                  | op_sai_geo       |                    |                         |                                                             |                                       |                               |
|                       |                  | src_geom         |                    |                         |                                                             |                                       |                               |
|                       |                  | src_date         |                    |                         |                                                             |                                       |                               |
|                       | (vide)           |                  | par défaut         | Vertical                | id_supp != NULL                                             |                                       |                               |
|                       |                  | Message d'erreur |                    |                         |                                                             |                                       |                               |
| Intervention          |                  |                  | par défaut         | Vertical                | id_supp != NULL                                             | intervention support (point-lumineux) | x                             |
|                       |                  | dates            |                    |                         |                                                             |                                       |                               |
|                       |                  | type_inter       |                    |                         |                                                             |                                       |                               |
| Contrat               |                  |                  | par défaut         | Vertical                | id_supp != NULL                                             |                                       |                               |
|                       |                  | exploit_nd       |                    |                         |                                                             |                                       |                               |
|                       |                  | presta_nd        |                    |                         |                                                             |                                       |                               |
|                       |                  | ent_pose         |                    |                         |                                                             |                                       |                               |
|                       |                  | dat_pos          |                    |                         |                                                             |                                       |                               |
|                       |                  | qua_dat          |                    |                         |                                                             |                                       |                               |
|                       |                  | commune          |                    |                         |                                                             |                                       |                               |
|                       |                  | insee            |                    |                         |                                                             |                                       |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                      | Obligatoire     | Valeur par défaut     | Liste de domaine                      | Représentation     |
|:-------------------------------------------------------------:|:---------------:|:---------------------:|:-------------------------------------:|:------------------:|
| Identifiant du modèle du support ( id_mod_sup )   INTEGER     | x               | 1                     | "an_ecl_modele_support"               | Par défaut         |
| Type de support ( ty_supp )   STRING                          | x               | 00                     | "lt_ecl_type_support"                 | Par défaut         |
| Opitions du support ( opt_supp )   STRING                     |                 |                       | "lt_ecl_options_support (code)"       | Par défaut         |
| Type de parasurtenseur ( ty_parasu )   STRING                 | x               | 00                     | "lt_ecl_type_parasurtenseur"          | Par défaut         |
| Etat general du support ( etat_supp )   STRING                | x               | 00                     | "lt_ecl_etat"                         | Par défaut         |
| Hauteur de la trappe ( haut_trap )   STRING                   | x               | 00                     | "lt_ecl_hauteur_trappe (code)"        | Par défaut         |
| Type de fusible installé ( ty_fusible )   STRING              | x               | 00                     | "lt_ecl_type_fusible"                 | Par défaut         |
| Hauteur du support ( haut_supp )   INTEGER                    |                 |                       |                                       | Par défaut         |
| Qualité de la date de pose ( qua_dat )   STRING               | x               | 00                     | "lt_ecl_qualite_date (code)"          | Par défaut         |
| Date de pose ( dat_pos )   TIMESTAMP                          |                 |                       |                                       | Par défaut         |
| Entreprise de pose ( ent_pose )   STRING                      |                 |                       |                                       | Par défaut         |
| Numéro de départ auquel est lié le noeud ( depart )   INTEGER |                 |                       | "xapps_geo_v_ecl_depart (id_depart)"  | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Opérateur de la saisie de la donnée géographique ( op_sai_geo )   STRING       |                 | %USER_LOGIN%          |                                       | Par défaut         |
| Commentaires divers ( observ )   STRING                       |                 |                       |                                       | Par défaut         |
| Type de disjoncteur ( ty_disjonc )   STRING                   | x               | 00                     | "lt_ecl_type_disjoncteur"             | Par défaut         |
| Date de la donnée ( date_donne )   TIMESTAMP                  |                 |                       |                                       | Par défaut         |
| Exploitant de l'objet ( exploit_nd )   STRING                 |                 |                       |                                       | Par défaut         |
| Prestataire intervenant sur l'objet ( presta_nd )   STRING    |                 |                       |                                       | Par défaut         |




## Fiche information :     Media - Fiche objet ECL

Source : an_ecl_media

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Onglet                      |


| Nom de la section     | Sous-section     | Attributs     | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée     |
| --------------------- | ---------------- | ------------- | ------------------ | ----------------------- | ----------------------------- | --------------- |
| (vide)                |                  |               | Par défaut         | Vertical                |                               |                 |
|                       |                  | op_sai        |                    |                         |                               |                 |
|                       |                  | dat_sai       |                    |                         |                               |                 |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                | Obligatoire     | Valeur par défaut     | Liste de domaine     | Représentation     |
| --------------------------------------- | --------------- | --------------------- | -------------------- | ------------------ |
| Opérateur de saisie ( op_sai )   STRING |                 | %USER_LOGIN%          |                      | Par défaut         |
| Date de saise ( date_sai )   TIMESTAMP  |                 | %CURRENT_DATE%        |                      | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :     Media - Fiche modèle

Source : an_ecl_media_modele

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Onglet                      |


| Nom de la section     | Sous-section     | Attributs     | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée     |
| --------------------- | ---------------- | ------------- | ------------------ | ----------------------- | ----------------------------- | --------------- |
| (vide)                |                  |               | Par défaut         | Vertical                |                               |                 |
|                       |                  | op_sai        |                    |                         |                               |                 |
|                       |                  | dat_sai       |                    |                         |                               |                 |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                | Obligatoire     | Valeur par défaut     | Liste de domaine     | Représentation     |
| --------------------------------------- | --------------- | --------------------- | -------------------- | ------------------ |
| Opérateur de saisie ( op_sai )   STRING |                 | %USER_LOGIN%          |                      | Par défaut         |
| Date de saise ( date_sai )   TIMESTAMP  |                 | %CURRENT_DATE%        |                      | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :     Intervention Point-lumineux

Source : an_ecl_intervention

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section                       | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                                                                                                                                                                | Fichie liée         | Ajout de données autorisé     |
| --------------------- | ---------------------------------- | ---------------- | ------------------ | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | ----------------------------- |
| Général               |                                    |                  | par défaut         | Vertical                |                                                                                                                                                                                          |                     |                               |
|                       |                                    | type_si_in       |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | moy_interv       |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | observ           |                    |                         |                                                                                                                                                                                          |                     |                               |
| (vide)                |                                    |                  | par défaut         | Vertical                |                                                                                                                                                                                          |                     |                               |
|                       |                                    | Affichage_message_erreur |                    |                         |                                                                                                                                                                                          |                     |                               |
| Métadonnées           |                                    |                  | par défaut         | Vertical                |                                                                                                                                                                                          |                     |                               |
|                       |                                    | date_sai         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | date_maj         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | op_sai           |                    |                         |                                                                                                                                                                                          |                     |                               |
| Signalement           |                                    |                  | par défaut         | Vertical                | type_si_in == '10'                                                                                                                                                                       |                     | x                             |
|                       |                                    |  typ_def         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | src_def          |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       |                                    | etat_sign        |                    |                         |                                                                                                                                                                                          |                     |                               |
| Intervention          |                                    |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                                                                                                       | intervention départ |                               |
|                       |                                    | type_inter       |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       | Disjoncteur                        |                  | par défaut         | Vertical                | ((type_inter.indexOf('10') >0) && (type_si_in == '20') ) `||` (type_inter == '10' && (type_si_in == '20'))                                                                                 |                     |                               |
|                       |                                    | att_met1         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       | Fusible                            |                  | par défaut         | Vertical                | ((type_inter.indexOf('11') >0) && (type_si_in == '20')) `||` (type_inter == '11' && (type_si_in == '20'))                                                                                  |                     |                               |
|                       |                                    | att_met2         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       | Parasurtenseur                     |                  | par défaut         | Vertical                | ((type_inter.indexOf("19") >0) && (type_si_in == '20')) `||` (type_inter == 19 && (type_si_in == '20') )                                                                                   |                     |                               |
|                       |                                    | att_met3         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       | Options                            |                  | par défaut         | Vertical                | (((type_inter.indexOf("18") >0) `||` (type_inter.indexOf("90") >0)) && (type_si_in == '20')) `||` (type_inter == 18 && (type_si_in == '20') ) `||` (type_inter == 90 && (type_si_in == '20') ) |                     |                               |
|                       |                                    | att_met7         |                    |                         |                                                                                                                                                                                          |                     |                               |
|                       | Etat du support après intervention |                  | par défaut         | Vertical                | (type_si_in == '20')                                                                                                                                                                     |                     |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                          | Obligatoire     | Valeur par défaut     | Liste de domaine                          | Représentation     |
| ----------------------------------------------------------------- | --------------- | --------------------- | ----------------------------------------- | ------------------ |
| Signalement ou intervention ( type_si_in )   STRING               | x               | 10                    | "lt_ecl_signalement_intervention (code)"  | Par défaut         |
| Type de défaillance ( typ_def )   STRING                          | x               | 00                     | "lt_ecl_type_defaillance (code)"          | Par défaut         |
| Source de la défaillance ( src_def )   STRING                     | x               | 00                     | "lt_ecl_source_defaillance (code)"        | Par défaut         |
| Etat du signalement ( etat_sign )   STRING                        | x               | 10                    | "lt_ecl_etat_signalement"                 | Par défaut         |
| Moyen d'intervention ( moy_interv )   STRING                      | x               | 00                     | "lt_ecl_moyen_intervention (code)"        | Par défaut         |
| Type d'intervention ( type_inter )   STRING                       | x               | 00                     | "lt_intervention_point_lumineux (code)"   | Par défaut         |
| Type de disjoncteur ( att_met1 )   STRING                         | x               | 00                     | "lt_ecl_type_disjoncteur"                 | Par défaut         |
| Type de fusible ( att_met2 )   STRING                             | x               | 00                     | "lt_ecl_type_fusible"                     | Par défaut         |
| Type de parasurtenseur ( att_met3 )   STRING                      | x               | 00                     | "lt_ecl_type_parasurtenseur"              | Par défaut         |
| Etat du point lumineux après l'intervention ( att_met6 )   STRING | x               | 00                     | "lt_ecl_etat"                             | Par défaut         |
| Commentaires divers ( observ )   STRING                           |                 |                       |                                           | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING           |                 | %USER_LOGIN%          |                                           | Par défaut         |
| Options du support ( att_met7 )   STRING                          | x               | 00                     | "lt_ecl_options_support (code)"           | Par défaut         |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :      Intervention ouvrage

Source : Intervention_ouvrage (an_ecl_intervention)

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section                       | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                                                                                | Fichie liée     | Ajout de données autorisé     |
| --------------------- | ---------------------------------- | ---------------- | ------------------ | ----------------------- | -------------------------------------------------------------------------------------------------------- | --------------- | ----------------------------- |
| Général               |                                    |                  | par défaut         | Vertical                |                                                                                                          |                 |                               |
|                       |                                    | type_si_in       |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | moy_interv       |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | observ           |                    |                         |                                                                                                          |                 |                               |
| (vide)                |                                    |                  | par défaut         | Vertical                |                                                                                                          |                 |                               |
|                       |                                    | Affichage_message_erreur |                    |                         |                                                                                                          |                 |                               |
| Métadonnées           |                                    |                  | par défaut         | Vertical                |                                                                                                          |                 |                               |
|                       |                                    | date_sai         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | date_maj         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | op_sai           |                    |                         |                                                                                                          |                 |                               |
| Signalement           |                                    |                  | par défaut         | Vertical                | type_si_in == '10'                                                                                       |                 |                               |
|                       |                                    |  typ_def         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | src_def          |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | etat_sign        |                    |                         |                                                                                                          |                 |                               |
| Intervention          |                                    |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                       |                 |                               |
|                       |                                    | type_inter       |                    |                         |                                                                                                          |                 |                               |
|                       | Disjoncteur                        |                  | par défaut         | Vertical                | ((type_inter.indexOf('10') >0) && (type_si_in == '20') ) `||` (type_inter == '10' && (type_si_in == '20')) |                 |                               |
|                       |                                    | att_met1         |                    |                         |                                                                                                          |                 |                               |
|                       | Fusible                            |                  | par défaut         | Vertical                | ((type_inter.indexOf('11') >0) && (type_si_in == '20')) `||` (type_inter == '11' && (type_si_in == '20'))  |                 |                               |
|                       |                                    | att_met2         |                    |                         |                                                                                                          |                 |                               |
|                       | Type de commande                   |                  | par défaut         | Vertical                | ((type_inter.indexOf("19") >0) && (type_si_in == '20')) `||` (type_inter == 19 && (type_si_in == '20') )   |                 |                               |
|                       |                                    | att_met3         |                    |                         |                                                                                                          |                 |                               |
|                       | Etat du support après intervention |                  | par défaut         | Vertical                | (type_si_in == '20')                                                                                     |                 |                               |
|                       |                                    | att_met6         |                    |                         |                                                                                                          |                 |                               |
|                       | Caractéristiques du départ         |                  | par défaut         | Vertical                | ((type_inter.indexOf("60") >0) && type_si_in == '20') `||` (type_inter == 60 && (type_si_in == '20') )     |                 |                               |
|                       |                                    | att_met4         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | att_met5         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | att_met7         |                    |                         |                                                                                                          |                 |                               |
|                       |                                    | att_met8         |                    |                         |                                                                                                          |                 |                               |


* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                     | Obligatoire     | Valeur par défaut     | Liste de domaine                          | Représentation     |
| ------------------------------------------------------------ | --------------- | --------------------- | ----------------------------------------- | ------------------ |
| Signalement ou intervention ( type_si_in )   STRING          | x               | 10                    | "lt_ecl_signalement_intervention (code)"  | Par défaut         |
| Type de défaillance ( typ_def )   STRING                     | x               | 00                     | "lt_ecl_type_defaillance (code)"          | Par défaut         |
| Source de la défaillance ( src_def )   STRING                | x               | 00                     | "lt_ecl_source_defaillance (code)"        | Par défaut         |
| Etat du signalement ( etat_sign )   STRING                   | x               | 10                    | "lt_ecl_etat_signalement"                 | Par défaut         |
| Moyen d'intervention ( moy_interv )   STRING                 | x               | 00                     | "lt_ecl_moyen_intervention (code)"        | Par défaut         |
| Type d'intervention ( type_inter )   STRING                  | x               | 00                     | "lt_intervention_point_lumineux (code)"   | Par défaut         |
| Commentaires divers ( observ )   STRING                      |                 |                       |                                           | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING      |                 | %USER_LOGIN%          |                                           | Par défaut         |
| Type de disjoncteur ( att_met1 )   STRING                    |                 | 00                     | "lt_ecl_type_disjoncteur"                 | Par défaut         |
| Type de fusible ( att_met2 )   STRING                        |                 | 00                     | "lt_ecl_type_fusible"                     | Par défaut         |
| Type de commande ( att_met3 )   STRING                       |                 | 00                     | "lt_ecl_type_commande"                    | Par défaut         |
| Type de disjoncteur du départ ajouté ( att_met4 )   STRING   |                 | 00                     | "lt_ecl_type_disjoncteur"                 | Par défaut         |
| Type de fusible du départ ajouté ( att_met5 )   STRING       |                 | 00                     | "lt_ecl_type_fusible"                     | Par défaut         |
| Etat de l'ouvrage après l'intervention ( att_met6 )   STRING |                 | 00                     | "lt_ecl_etat"                             | Par défaut         |
| Tension du départ ajouté ( att_met8 )   INTEGER              |                 |                       |                                           | Par défaut         |
| Nom du départ ( att_met7 )   STRING                          |                 |                       |                                           | Par défaut         |


IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :      Intervention_depart

Source : Intervention_depart (an_ecl_intervention)

* ### Statistique : aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section                        | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                                                                              | Fichie liée     |
| --------------------- | ----------------------------------- | ---------------- | ------------------ | ----------------------- | ------------------------------------------------------------------------------------------------------ | --------------- |
| Général               |                                     |                  | par défaut         | Vertical                |                                                                                                        |                 |
|                       |                                     | type_si_in       |                    |                         |                                                                                                        |                 |
|                       |                                     | moy_interv       |                    |                         |                                                                                                        |                 |
|                       |                                     | observ           |                    |                         |                                                                                                        |                 |
|                       | Signalement                         |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                     |                 |
|                       |                                     | att_met7         |                    |                         |                                                                                                        |                 |
| (vide)                |                                     |                  | par défaut         | Vertical                |                                                                                                        |                 |
|                       |                                     | Affichage_message_erreur |                    |                         |                                                                                                        |                 |
| Métadonnées           |                                     |                  | par défaut         | Vertical                |                                                                                                        |                 |
|                       |                                     | date_sai         |                    |                         |                                                                                                        |                 |
|                       |                                     | date_maj         |                    |                         |                                                                                                        |                 |
|                       |                                     | op_sai           |                    |                         |                                                                                                        |                 |
| Signalement           |                                     |                  | par défaut         | Vertical                | type_si_in == '10' && id_inter ==NULL                                                                                    |                 |
|                       |                                     |  typ_def         |                    |                         |                                                                                                        |                 |
|                       |                                     | src_def          |                    |                         |                                                                                                        |                 |
|                       |                                     | etat_sign        |                    |                         |                                                                                                        |                 |
| Intervention          |                                     |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                     |                 |
|                       |                                     | type_inter       |                    |                         |                                                                                                        |                 |
|                       | Disjoncteur                         |                  | par défaut         | Vertical                | ((type_inter.indexOf("10") >0) && (type_si_in == '20')) `||` (type_inter == 10 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met1         |                    |                         |                                                                                                        |                 |
|                       | Fusible                             |                  | par défaut         | Vertical                | ((type_inter.indexOf("11") >0) && (type_si_in == '20')) `||` (type_inter == 11 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met2         |                    |                         |                                                                                                        |                 |
|                       | Etat du départ après l'intervention |                  | par défaut         | Vertical                | (type_si_in == '20')                                                                                   |                 |



* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                                              | Obligatoire     | Valeur par défaut     | Liste de domaine                                       | Représentation     |
| ------------------------------------------------------------------------------------- | --------------- | --------------------- | ------------------------------------------------------ | ------------------ |
| Signalement ou intervention ( type_si_in )   STRING                                   | x               | 10                    | "lt_ecl_signalement_intervention (code)"               | Par défaut         |
| Type de défaillance ( typ_def )   STRING                                              | x               | 00                     | "lt_ecl_type_defaillance (code)"                       | Par défaut         |
| Source de la défaillance ( src_def )   STRING                                         | x               | 00                     | "lt_ecl_source_defaillance (code)"                     | Par défaut         |
| Etat du signalement ( etat_sign )   STRING                                            | x               | 10                    | "lt_ecl_etat_signalement"                              | Par défaut         |
| Moyen d'intervention ( moy_interv )   STRING                                          | x               | 00                     | "lt_ecl_moyen_intervention (code)"                     | Par défaut         |
| Type d'intervention ( type_inter )   STRING                                           | x               | 00                     | "lt_intervention_point_lumineux (code)"                | Par défaut         |
| Commentaires divers ( observ )   STRING                                               |                 |                       |                                                        | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai )   STRING                               |                 | %USER_LOGIN%          |                                                        | Par défaut         |
| Type de disjoncteur ( att_met1 )   STRING                                             |                 | 00                     | "lt_ecl_type_disjoncteur"                              | Par défaut         |
| Type de fusible ( att_met2 )   STRING                                                 |                 | 00                     | "lt_ecl_type_fusible"                                  | Par défaut         |
| Etat de l'ouvrage après l'intervention ( att_met6 )   STRING                          |                 | 00                     | "lt_ecl_etat"                                          | Par défaut         |
| Signalement réglé lors de l'intervention ( att_met7 )   STRING |                 |                       | "xapps_geo_v_ecl_intervention_liste_affichage (code)"  | Par défaut         |


IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

L'attribut "Signalement réglé lors de l'intervention" (att_met7), n'apparaît que lorsqu'il s'agit d'une création d'intervention sans passé par un signalement (géré par la conditionnalité : id_inter==NULL).

## Fiche information :      Intervention_Foyer

Source : Intervention_foyer (an_ecl_intervention)

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section                        | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle                                                                            | Fichie liée     |
| --------------------- | ----------------------------------- | ---------------- | ------------------ | ----------------------- | ---------------------------------------------------------------------------------------------------- | --------------- |
| Général               |                                     |                  | par défaut         | Vertical                |                                                                                                      |                 |
|                       |                                     | type_si_in       |                    |                         |                                                                                                      |                 |
|                       |                                     | moy_interv       |                    |                         |                                                                                                      |                 |
|                       |                                     | observ           |                    |                         |                                                                                                      |                 |
|                       | Signalement                         |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                   |                 |
|                       |                                     | att_met5         |                    |                         |                                                                                                      |                 |
| (vide)                |                                     |                  | par défaut         | Vertical                |                                                                                                      |                 |
|                       |                                     | Affichage_message_erreur |                    |                         |                                                                                                      |                 |
| Métadonnées           |                                     |                  | par défaut         | Vertical                |                                                                                                      |                 |
|                       |                                     | date_sai         |                    |                         |                                                                                                      |                 |
|                       |                                     | date_maj         |                    |                         |                                                                                                      |                 |
|                       |                                     | op_sai           |                    |                         |                                                                                                      |                 |
| Signalement           |                                     |                  | par défaut         | Vertical                | type_si_in == '10'                                                                                   |                 |
|                       |                                     |  typ_def         |                    |                         |                                                                                                      |                 |
|                       |                                     | src_def          |                    |                         |                                                                                                      |                 |
|                       |                                     | etat_sign        |                    |                         |                                                                                                      |                 |
| Intervention          |                                     |                  | par défaut         | Vertical                | type_si_in == '20'                                                                                   |                 |
|                       |                                     | type_inter       |                    |                         |                                                                                                      |                 |
|                       | Modèle de lanterne                  |                  | par défaut         | Vertical                | ((type_inter.indexOf("12") >0) && type_si_in == '20') `||` (type_inter == 12 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met7         |                    |                         |                                                                                                      |                 |
|                       | Modèle de lampe                     |                  | par défaut         | Vertical                | ((type_inter.indexOf("13") >0)&& type_si_in == '20') `||` (type_inter == 13 && (type_si_in == '20') )  |                 |
|                       |                                     | att_met8             |                    |                         |                                                                                                      |                 |
|                       | Ballast / driver                    |                  | par défaut         | Vertical                | ((type_inter.indexOf("15") >0) && type_si_in == '20') `||` (type_inter == 15 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met1         |                    |                         |                                                                                                      |                 |
|                       | Amorceur                            |                  | par défaut         | Vertical                | ((type_inter.indexOf("16") >0) && type_si_in == '20') `||` (type_inter == 16 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met2         |                    |                         |                                                                                                      |                 |
|                       | Auto transformateur                 |                  |                    |                         | ((type_inter.indexOf("17") >0) && type_si_in == '20') `||` (type_inter == 17 && (type_si_in == '20') ) |                 |
|                       |                                     | att_met3         |                    |                         |                                                                                                      |                 |
|                       | Etat du départ après l'intervention |                  | par défaut         | Vertical                | (type_si_in == '20')                                                                                 |                 |

- Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                       | Obligatoire     | Valeur par défaut     | Liste de domaine                                      | Représentation     |
|:--------------------------------------------------------------:|:---------------:|:---------------------:|:-----------------------------------------------------:|:------------------:|
| Signalement ou intervention ( type_si_in ) STRING              | x               | 10                    | "lt_ecl_signalement_intervention (code)"              | Par défaut         |
| Type de défaillance ( typ_def ) STRING                         | x               | 00                     | "lt_ecl_type_defaillance (code)"                      | Par défaut         |
| Source de la défaillance ( src_def ) STRING                    | x               | 00                     | "lt_ecl_source_defaillance (code)"                    | Par défaut         |
| Etat du signalement ( etat_sign ) STRING                       | x               | 10                    | "lt_ecl_etat_signalement"                             | Par défaut         |
| Moyen d'intervention ( moy_interv ) STRING                     | x               | 00                     | "lt_ecl_moyen_intervention (code)"                    | Par défaut         |
| Type d'intervention ( type_inter ) STRING                      | x               | 00                     | "lt_intervention_point_lumineux (code)"               | Par défaut         |
| Commentaires divers ( observ ) STRING                          |                 |                       |                                                       | Par défaut         |
| Opérateur de la saisie de la donnée ( op_sai ) STRING          |                 | %USER_LOGIN%          |                                                       | Par défaut         |
| Auto transformateur ( att_met3 )   STRING                      |                 | 00                     | "lt_ecl_auto_transformateur (code)"                   | Par défaut         |
| Type d'amorce ( att_met2 )   STRING                            |                 | 00                     | "lt_ecl_amorceur (code)"                              | Par défaut         |
| Type de ballast ( att_met1 )   STRING                          |                 | 00                     | "lt_ecl_type_ballast (code)"                          | Par défaut         |
| Modèle de lanterne ( att_met7 )   STRIN                        |                 | 2                     | "an_ecl_modele_lanterne"                              | Par défaut         |
| Modèle de lampe ( att_met8 )   INTEGER                         |                 | 2                     | "an_ecl_modele_lampe (intervention)"                  | Par défaut         |
| Etat de l'objet après l'intervention ( att_met6 )   STRING     |                 | 00                     | "lt_ecl_etat"                                         | Par défaut         |
| Signalement réglé lors de l'intervention ( att_met5 )   STRING |                 |                       | "xapps_geo_v_ecl_intervention_liste_affichage (code)" | Par défaut         |

L'attribut "Signalement réglé lors de l'intervention" (att_met5), n'apparaît que lorsqu'il s'agit d'une création d'intervention sans passé par un signalement (géré par la conditionnalité : id_inter==NULL).

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiche information :      Intervention_Câble

Source : Intervention_cable (an_ecl_intervention)

* ### Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section     | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée     | Ajout de données autorisé     |
| --------------------- | ---------------- | ---------------- | ------------------ | ----------------------- | ----------------------------- | --------------- | ----------------------------- |
| Général               |                  |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                  | type_si_in       |                    |                         |                               |                 |                               |
|                       |                  | moy_interv       |                    |                         |                               |                 |                               |
|                       |                  | observ           |                    |                         |                               |                 |                               |
| (vide)                |                  |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                  | Affichage_message_erreur |                    |                         |                               |                 |                               |
| Métadonnées           |                  |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                  | date_sai         |                    |                         |                               |                 |                               |
|                       |                  | date_maj         |                    |                         |                               |                 |                               |
|                       |                  | op_sai           |                    |                         |                               |                 |                               |
| Signalement           |                  |                  | par défaut         | Vertical                | type_si_in == '10'            |                 |                               |
|                       |                  |  typ_def         |                    |                         |                               |                 |                               |
|                       |                  | src_def          |                    |                         |                               |                 |                               |
|                       |                  | etat_sign        |                    |                         |      

* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                                                 | Obligatoire     | Valeur par défaut     | "lt_ecl_signalement_intervention (code)"  | Par défaut |
| ---------------------------------------------------------------------------------------- | --------------- | --------------------- | ----------------------------------------- | ---------- |
| Signalement ou intervention ( type_si_in )   STRING                                      | x               | 10                    | "lt_ecl_type_defaillance (code)"          | Par défaut |
| Type de défaillance ( typ_def )   STRING                                                 | x               | 00                     | "lt_ecl_source_defaillance (code)"        | Par défaut |
| Source de la défaillance ( src_def )   STRING                                            | x               | 00                     | "lt_ecl_etat_signalement"                 | Par défaut |
| Etat du signalement ( etat_sign )   STRING                                               | x               | 10                    | "lt_ecl_moyen_intervention (code)"        | Par défaut |
| Moyen d'intervention ( moy_interv )   STRING                                             | x               | 00                     | "lt_intervention_point_lumineux (code)"   | Par défaut |
| Type d'intervention ( type_inter )   STRING                                              | x               | 00                     |                                           | Par défaut |
| Commentaires divers ( observ )   STRING                                                  |                 |                       |                                           | Par défaut |
| Opérateur de la saisie de la donnée ( op_sai )   STRING                                  |                 | %USER_LOGIN%          | "lt_ecl_auto_transformateur (code)"       | Par défaut |
| Etat de l'objet après l'intervention ( att_met6 )   STRING|                 | 2                     | "lt_ecl_etat"                             | Par défaut |


IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun


## Fiche information :      Intervention_PI

Source : Intervention_PI (an_ecl_intervention)

* ###  Statistique : 
	Aucune
  
* ### Représentation : 
  
| Mode d'ouverture     | Taille (px)     | Agencement des sections     |
| -------------------- | --------------- | --------------------------- |
| dans le gabarit      | 530*650         | Vertical                    |


| Nom de la section     | Sous-section                    | Attributs        | Position label     | Agencement attribut     | Visibilité conditionnelle     | Fichie liée     | Ajout de données autorisé     |
| --------------------- | ------------------------------- | ---------------- | ------------------ | ----------------------- | ----------------------------- | --------------- | ----------------------------- |
| Général               |                                 |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                                 | type_si_in       |                    |                         |                               |                 |                               |
|                       |                                 | moy_interv       |                    |                         |                               |                 |                               |
|                       |                                 | observ           |                    |                         |                               |                 |                               |
| (vide)                |                                 |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                                 | Affichage_message_erreur |                    |                         |                               |                 |                               |
| Métadonnées           |                                 |                  | par défaut         | Vertical                |                               |                 |                               |
|                       |                                 | date_sai         |                    |                         |                               |                 |                               |
|                       |                                 | date_maj         |                    |                         |                               |                 |                               |
|                       |                                 | op_sai           |                    |                         |                               |                 |                               |
| Signalement           |                                 |                  | par défaut         | Vertical                | type_si_in == '10'            |                 |                               |
|                       |                                 |  typ_def         |                    |                         |                               |                 |                               |
|                       |                                 | src_def          |                    |                         |                               |                 |                               |
|                       |                                 | etat_sign        |                    |                         |                               |                 |                               |
| Intervention          |                                 |                  | par défaut         | Vertical                | type_si_in == '20'            |                 |                               |
|                       |                                 | type_inter       |                    |                         |                               |                 |                               |
|                       | Etat du PI après l'intervention |                  | par défaut         | Vertical                | (type_si_in == '20')          |                 |                               |

* ### Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

| Attribut                                                                                 | Obligatoire     | Valeur par défaut     | "lt_ecl_signalement_intervention (code)"  | Par défaut |
| ---------------------------------------------------------------------------------------- | --------------- | --------------------- | ----------------------------------------- | ---------- |
| Signalement ou intervention ( type_si_in )   STRING                                      | x               | 10                    | "lt_ecl_type_defaillance (code)"          | Par défaut |
| Type de défaillance ( typ_def )   STRING                                                 | x               | 00                     | "lt_ecl_source_defaillance (code)"        | Par défaut |
| Source de la défaillance ( src_def )   STRING                                            | x               | 00                     | "lt_ecl_etat_signalement"                 | Par défaut |
| Etat du signalement ( etat_sign )   STRING                                               | x               | 10                    | "lt_ecl_moyen_intervention (code)"        | Par défaut |
| Moyen d'intervention ( moy_interv )   STRING                                             | x               | 00                     | "lt_intervention_point_lumineux (code)"   | Par défaut |
| Type d'intervention ( type_inter )   STRING                                              | x               | 00                     |                                           | Par défaut |
| Commentaires divers ( observ )   STRING                                                  |                 |                       |                                           | Par défaut |
| Opérateur de la saisie de la donnée ( op_sai )   STRING                                  |                 | %USER_LOGIN%  |         |  Par défaut |
| Etat de l'objet après l'intervention ( att_met6 )   STRING |                  | 2                     | "lt_ecl_etat"                             | Par défaut |

IMPORTANT : L'édition des données jointes est désactivée.

Modèle d'impression : aucun

## Fiches information : Lanterne / Lampe / Support       (modèle : photo)

Ces 3 fiches information sont uniquement composées d'une miniature de la photo des modèles s'il y en a une, rien n'est éditable. Elles sont utilisées dans les fiches informations du foyer / du support afin d'empêcher un lien direct entre un objet précis et une fiche de modèle éditable. 
Le but est d'imposer une prise de conscience avant une modification d'un modèle qui agira sur tous les objets ayant le même modèle.

              
# Limites :

L'application, tout comme la base de données, ne gère pas les activités temporaires, notamment en lien avec les festivités.

 # La cartothèque
 
 | Geotable                                     | Visible dans la légende     | Visible au démarrage     | Détails visibles     | Déplié par défaut     | Renommée                                    | Couche accrochable     | Catégorisation                         | Seuil de visibilité     | Symbologie                                           | Autres                                         |
| -------------------------------------------- |:---------------------------:|:------------------------:|:--------------------:|:---------------------:| ------------------------------------------- | ---------------------- | -------------------------------------- | ----------------------- | ---------------------------------------------------- | ---------------------------------------------- |
| xapps_geo_v_ecl_intervention_liste_affichage | x                           | x                        |                      | x                     | Signalement                                 | x                      | etat_sign                              |                         | Selon état                                           | Interactivité avec le champ calculé infobulle  |
| Etat des supports (geo_v_ecl_point_lumineux) |                             |                          |                      |                       | Etat des supports                           |                        | etat_supp                              | 0-1/5000                | Selon état                                           | Interactivité avec le champ etat_supp          |
| geo_v_ecl_ouvrage_electrique                 | x                           | x                        |                      |                       | Ouvrages électriques                        |                        | Champ calculé "catégorisation"         | 0-1/8000                | Selon type d'ouvrage                                 | Interactivité avec le champ nom_ouv            |
| xapps_geo_v_ecl_support_par_armoire          |                             |                          |                      |                       | Supports classés par armoire                |                        | nom_ouv                                | 0-1/5000                | Selon armoire                                        | Interactivité avec le champ nom_ouv            |
| geo_v_ecl_point_lumineux (Support)           | x                           | x                        |                      |                       | Points lumineux                             | x                      | Champ calculé "catégorisation"         | 0-1/3500                | Selon catégorie                                      | Interactivité avec le champ nom_ouv            |
| geo_v_ecl_point_d'interet                    | x                           | x                        |                      |                       | Points d'intérêt                            | x                      | Champ calculé "catégorisation"         | 0-1/2500                | Selon catégorie                                      |                                                |
| **geo_ecl_cable**                            | x                           | x                        |                      |                       | Câbles                                      | x                      | Champ calculé "catégorisation"         |                         | Selon catégorie                                      | Interactivité avec le champ id_cab             |
| geo_v_ecl_point_lumineux (Support)           | x                           | x                        |                      | x                     | Points lumineux (validité des mises à jour) | x                      | Champ calculé "Pour affichage qualité" | 0-1/3000                | Circle #FF8B00 Taille 19                             |                                                |
| geo_amt_zpne_gestion                         | x                           |                          |                      |                       | Zones de gestion                            |                        | gest                                   |                         | ARC = (Polygone, solid texture, #003978, opacité 18) / Ville = (Polygone, solid texture, #CAAE10, opacité 18 |                                                |
|                                              | x                           | x                        | x                    | x                     | Limite administrative                       |                        |                                        |                         |                                                      |                                                |

# L'application

* Généralités :

| Gabarit     | Thème                            | Modules spé                                                                                                     | Impression                            |
| ----------- | -------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| Pro         | Thème GeoCompiegnois 1.0.7 (ECL) |  Introduction, StreetView, Page de connexion perso (config Eclirage public), javascript, Multimédia (Média-ECL) | A4 - Portrait et A4 - Paysage+légende |

* Particularité de certains modules :
  * Module introduction : ce menu s'ouvre automatiquement à l'ouverture de l'application grâce un code dans le module javascript. Ce module contient une introduction sur l'application, et des liens vers le guide utilisateur.
  * Module javacript : 
  `var injector = angular.element('body').injector();
var acfApplicationService = injector.get('acfApplicationService');
acfApplicationService.whenLoaded(setTimeout(function(){
$(".sidepanel-item.launcher-application").click();
}, 100));`

* Recherche globale : 
Vide

* Carte : `ECL`

Comportement au clic : (dés)active uniquement l'item cliqué
Liste des recherches :  Recherche d'ouvrage électrique ,  Recherche de support ,  Recherche de point d'intérêt (ECL) ,  Recherche de câble.


* Fonds de plan :

|Nom|Au démarrage|opacité|
|:---|:---|:---|
|Cadastre|x|100%|
|Plan de ville||100%|
|Photographie aérienne 2013|x|70%|

* Fonctionnalités

| Groupe                                        | Sous-groupe | Nom                                                     |
| --------------------------------------------- | ----------- | ------------------------------------------------------- |
| Recherche métier                              |             |                                                         |
|                                               |             | Recherche d'ouvrage électrique                          |
|                                               |             | Recherche de départ                                     |
|                                               |             | Recherche de support                                    |
|                                               |             | Recherche de foyer                                      |
|                                               |             | Recherche de point d'intérêt                            |
|                                               |             | **Recherche de câble**                                  |
| Saisie                                        |             |                                                         |
|                                               |             | Saisie d'ouvrage électrique                             |
|                                               |             | Saisie de points d'intérêts                             |
|                                               |             | Saisie de supports pour foyers                          |
|                                               |             | Saisie de câble                                         |
| Gestion des modèles                           |             | ****                                                    |
|                                               |             | Nouveau modèle de support                               |
|                                               |             | Nouveau modèle de lanterne                              |
|                                               |             | Nouveau modèle de lampe                                 |
|                                               |             | Recherche d'un modèle de support                        |
|                                               |             | Recherche d'un modèle de lanterne                       |
|                                               |             | Recherche d'un modèle de lampe                          |
| Signalements et interventions                 |             |                                                         |
|                                               |             | Rapport de signalement                                  |
|                                               |             | Rapport d'intervention                                  |
| Recherche avancée d'une voie ou d'une adresse |             |                                                         |
|                                               |             | ECL-Recherche avancée d'une voie                        |
|                                               |             | ECL-Recherche avancée d'une adresse                     |
| Gestion des anomalies                         |             |                                                         |
|                                               | Topologie   |                                                         |
|                                               |             | Câble non relié                                         |
|                                               |             | Nœud non relié à un câble                               |
|                                               | Réseau      |                                                         |
|                                               |             | Nœuds non reliés à une armoire                          |
|                                               |             | Recherche des foyers dont la lampe n'est pas renseignée |
|                                               |             | Recherche de supports de foyers                         |
|                                               |             | Messages d'erreurs                                      |
| Visuels de gestion                            |             |                                                         |
|                                               |             | Supports classés par armoire                            |
|                                               |             | Etat des supports                                       |
|                                               |             | Zones de gestion                                        |

