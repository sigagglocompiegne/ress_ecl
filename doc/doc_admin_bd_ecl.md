                                                                       
![GeoCompiegnois](img/Logo_web-GeoCompiegnois.png)

# Documentation technique de la base de données d'éclairage public (ECL)

## Principes
  
### Généralités

Dans le cadre de son axe prioritaire de développement autour de la connaissance patrimoniale et la gestion des réseaux, l’un des projets de l'ARC concerne plus particulièrement l’éclairage public. Celui-ci constitue essentiellement, à faire évoluer la base de données existante, enrichir les données sur la ville de Compiègne et développer une application web pour le service métier concerné. Cette BdD est donc vouée avant tout à la gestion du réseau, bien que la dimension précision cartographique soit prise en compte (DT/DICT).

Cette base de donnée s'inspire des modèles RAEPA et GR@CE, mais aussi de ceux du pays de Brest (https://geo.pays-de-brest.fr/espacedocumentaire/Documents/Public/CCTP_recolement.pdf), du syndicat d'énergie du Finistère, du géojura, d'Alpes Sud, geomap...etc.

Elle a été conçue au fur et à mesure des réunions avec le service d'éclairage public de la ville de Compiègne. Elle est donc adaptée à ses besoins spécifiques, et n'a pas vocation à être un standard valable dans chaque collectivité.  

Le standard de données des réseaux, en cours de rédaction au moment de la réalisation de cette base, n'a pas été intégré. Cependant, la problématique DT/DICT est prise en compte, avec des métadonnées de classe de précision tirées du RAEPA.


### Résumé fonctionnel

Pour rappel des grands principes :

* Toute la géométrie est contenue dans deux classes : Noeud et Câbles.
* Il a été choisi volontairement de ne pas mettre en place une classe artère, de par la complexification que cela entraîne et l'absence de besoins de cette information pour le service d'éclairage public.
* La suppression est gérée par un attribut, les données ne sont donc jamais supprimées "en dur" dans la BdD, afin d'atténuer l'impact des erreurs de suppression. 

## Schéma fonctionnel

![schema_fonctionnel](img/schema_fonctionnel_v2.png)

Dans le détail :

#### Les droits

#####	Le service d'éclairage public peut:
* Voir, rechercher et éditer toutes les données via l'application.

#####	Un autre service en faisant la demande peut :
* Voir les différents objets du réseau, sans les caractéristiques techniques.

###	Alimentation de la base de données
* Les données sont rentrées et modifiées via l'application web-métier d'éclairage public. 
* Les données des prestataires  agissant pour le compte de l'Agglomération de la Région de Compiègne ou de la Ville de Compiègne ont été ajoutées via un workflow FME.
* Le cadre d'actualisation des données par les prestataires est à définir avec ces prestataires.

###	Les contrôles de saisie

De nombreux point de contrôles de la saisie des utilisateurs sont vérifiés. Sans tous les lister, il convient néanmoins de rappeler que :

#### Topologie
- Seuls un point d'intérêt et un point lumineux peuvent avoir la même géométrie. 
- Un câble ne peut pas être relié en point initial et en point final au même nœud.

#### Attributs
- Un signalement ne peut pas être classé en 'réglé' sans la création d'une intervention. 
- Certains attributs sont forcés à une certaine valeur en fonction des autres attributs renseignés par l'utilisateur. (ex : si le support est une façade, l'attribut ''type de mât'' est forcé à ''non concerné''.)
- Certaines valeurs numériques ont une limite à ne pas dépasser, si la saisie est supérieure ou inférieurs aux limites, un message d'erreur est créé et la saisie est sur-corrigée. 

Toutes ces règles de vérification sont implémentées informatiquement pour éviter les erreurs de saisie (incohérences).

 ## Dépendances

La base de données ECL s'appuie sur des référentiels préexistants constituant autant de dépendances nécessaires pour l'implémentation de la BdD.

| schéma        | table                    | description                                                                              | usage                                                                                              |
| - | - | -- | -- |
| m_amenagement | geo_amt_zpne_gestion     | Table géographique délimitant les zones de gestion entre la ville de Compiègne et l''ARC | Détermine la complétion automatique du prestataire et du gestionnaire pour les nœuds et les câbles |
| r_osm         | geo_vm_osm_commune_arcba | Vue matérialisée des limites communales des communes de l''ARCBA                         | Détermine la complétion automatique de la commune et du code Insee pour les nœuds et les câbles    |

## Classes d'objets

L'ensemble des classes d'objets unitaires sont stockées dans le schéma m_reseau_sec, celles dérivées et applicatives dans le schéma x_apps.

### Classes d'objets géographique et patrimoniale

#### an_ecl_depart 
 Description : Objet intégré à un ouvrage électrique et permettant le branchement d''un câble


|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_depart|Numéro du depart interne à l'ARC|integer|nextval('m_reseau_sec.ecl_objet_seq'::regclass)|
|id_ouvelec|Lien vers table armoire|integer| |
|nom_depart|Nom du secteur déservi par le départ|character varying(254)| |
|etat_dep|Etat du départ|character varying(2)|'00'::character varying|
|tension|Tension électrique en sortie|integer| |
|ty_disjonc|Type du disjoncteur|character varying(2)|'00'::character varying|
|ty_fusible|Type du fusible|character varying(2)|'00'::character varying|
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie initiale de la donnée|character varying(80)| |
|situation|Situation générale : Actif / Inactif / supprimé|character varying(2)|'10'::character varying|
|date_donne|Horodatage de la production initiale de la donnée|timestamp without time zone| |
|puis_sous|Puissance souscrite calculée via un trigger|integer| |

* Trigger(s) :
	* t_t1_depart_insert_update (Before Insert or Update) : 
- gestion des controles de saisie à l'insertion ou la mise à jour (par génération de message d'erreur)

		- mise à jour de date_maj à la maj

		- à l'insert, génération de la date de la donnée (source) à la date du jour (modifiable ensuite par l'utilisateur)

	* t_t3_depart_delete (Before Delete) : 

		- suppression virtuelle du départ (attribut situation à supprimer)

		- Suppression = départ à null au niveau des nœuds reliés à ce départ

		- rafraichissement de la vue récursive

* Vue(s) : 
    -  xapps_geo_v_ecl_depart  
    -  xapps_an_v_ecl_tension_cable
    - xapps_an_v_ecl_patrimoine
    - xapps_an_vmr_ecl_materialisee_noeud_armoire

-------------------------------------------------------------------------

#### an_ecl_foyer

D! Objet reposant sur un support, intégrant une source lumineuse

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_foyer|Numéro du foyer interne à l'ARC|integer|nextval('m_reseau_sec.ecl_objet_seq'::regclass)|
|id_supp|Identifiant du support sur lequel repose le foyer|integer| |
|id_mod_ln|Lien vers la table modèle lanterne|integer|1|
|id_mod_lm|Lien vers table modèle lampe|integer|1|
|etat_foy|Etat du foyer|character varying(2)|'00'::character varying|
|ty_lantern|Type de lanterne : piéton ou routier|character varying(2)|'00'::character varying|
|haut_feu|Hauteur max de la lanterne par rapport au niveau de la chaussée|character varying(6)| |
|dat_pos_ln|Date de la pose de la lanterne|timestamp without time zone| |
|pct_fct|Puissance de la lampe en % de sa puissance maximale : uniquement pour les leds|numeric| |
|dat_pos_lm|Date de pose de la lampe|timestamp without time zone| |
|ty_ballast|Type de ballast installé|character varying(2)|'00'::character varying|
|ty_amorce|Type d'amorceur installé|character varying(2)|'00'::character varying|
|ty_auto_tr|Type d'auto trasformateur installé|character varying(2)|'00'::character varying|
|loc_plat|Localisation de la platine, pieds de support ou dans la lanterne|character varying(2)|'00'::character varying|
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie de la donnée|character varying(80)| |
|situation|Situation générale : Actif / Inactif / supprimé|character varying(2)|'10'::character varying|
|date_donne|Horodatage de la production initiale de la donnée|timestamp without time zone| |

* Trigger(s) :
	* t_t1_foyer (before insert or update) :
		- suppression des messages d'erreur

		- gestion des contraintes de saisie avec génération de message d'erreur

		- forçage de certains attributs à l'insertion

	* t_t3_foyer_after (after insert or update) :
	- on update le support du foyer (nbr foyer) et le départ auquel est lié le foyer (puissance souscrite).
	
	*  t_t4_foyer_delete (before delete) : 
		- suppression virtuelle du foyer (attribut situation à supprimer)

		- Suppression = puissance souscrite du départ auquel il est lié remise à jour.

		- rafraichissement de la vue récursive
	
* Vue(s) :
    - xapps_an_v_ecl_patrimoine
-------------------------------------------------------------------------	
#### an_ecl_intervention

Interventions et signalements du service métier 

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_inter|Numéro de l'intervention interne à l'ARC|integer|nextval('m_reseau_sec.ecl_objet_seq'::regclass)|
|id_objet|Identifiant de l'objet concerné par l'intervention|integer| |
|type_si_in|Signalement ou intervention|character varying(2)|'10'::character varying|
|dat_signa|Date du signalement|timestamp without time zone|now()|
|dat_progra|Date de la programmation|timestamp without time zone| |
|dat_real|Date de la réalisation de l'intervention|timestamp without time zone| |
|typ_def|Type de défaillance|character varying(2)|'00'::character varying|
|src_def|Source de la défaillance|character varying(2)|'00'::character varying|
|etat_sign|Etat du signalement|character varying(2)|'10'::character varying|
|moy_interv|Moyen d'intervention|character varying(2)|'00'::character varying|
|type_inter|Type d'intervention|character varying(254)|'00'::character varying|
|att_met1|Attribut métier dédié au type de disjoncteur / type de ballast|character varying(2)| |
|att_met2|Attribut métier Dédié au type de fusible / type d'amorce|character varying(2)| |
|att_met3|Attribut métier Dédié au type de parasurtenseur / type de commande / type d'auto transformateur|character varying(2)| |
|att_met4|Attribut métier Dédié à la mise en terre / modele de lanterne|character varying(2)| |
|att_met5|Attribut métier Dédié au modèle de lampe|character varying(10)| |
|att_met6|Attribut métier Dédié à l'état de l'objet ciblé par l'intervention |character varying(2)| |
|att_met7|Attribut métier Dédié au nom du départ / aux options du support |character varying(254)| |
|att_met8|Attribut métier Dédié à la tension / pourcentage de puissance de fonctionnement|integer| |
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie initiale de la donnée|character varying(80)| |
|id_noeud|Identifiant du noeud sur lequel a lieu l'intervention (Pour foyer et départ, noeud = Support ou armoire)|integer| |

* Trigger(s) :
	* t_t1_intervention (before update or insert) :

		- suppression des messages d'erreur

		- on force certains attributs

		- gestion des contraintes de saisie

		- on update la date maj si update.

		- selon le(s) type(s) d'intervention(s) on update les valeurs de l'objet concerné.

* Vue(s) :
    -  xapps_an_v_ecl_stat_intervention
    -  xapps_geo_v_ecl_intervention_liste_affichage
-------------------------------------------------------------------------
#### an_ecl_modele_lanterne

Modèles de lanternes existants ou ayant existés à Compiègne

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_mod_ln|Numéro du modèle de lanterne interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_modele_lanterne_id_mod_ln_seq'::regclass)|
|nom_mod_ln|Nom métier du modèle |character varying(254)| |
|gar_lant|Durée de garantie de la lanterne, en années|smallint| |
|cod_ral_ln|Code RAL de la lanterne|character varying(20)| |
|clas_el_ln|Classe électrique de la lanterne|character varying(2)|'00'::character varying|
|ik_lant|Indice de protection face aux influences extérieures|integer| |
|ip_lant|Indice de protection aux chocs mécaniques|integer| |
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie de la donnée|character varying(80)| |

* Trigger(s) :
	* t_t1_modele_lanterne (before insert or update) : 
		- geo retourne '' au lieu de null, on force donc la valeur null pour éviter la contrainte unique

		- suppression des messages d'erreur

		- gestion des contraintes de saisie avec génération de message d'erreur

		- on update la date maj si update.

-------------------------------------------------------------------------
#### an_ecl_modele_lampe
Modèles de lampe existants ou ayant existés à Compiègne

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_mod_lm|Numéro du modèle de la lampe, interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_modele_lampe_id_mod_lm_seq'::regclass)|
|nom_mod_lm|Nom métier du modèle|character varying(254)| |
|ty_lampe|Type de lampe|character varying(2)|'00'::character varying|
|puis_lam|Puissance de la lampe|character varying(2)|'00'::character varying|
|cul_lamp|Culot de la lampe|character varying(2)|'00'::character varying|
|telgest|Présence d'une télégestion|character varying(2)|'00'::character varying|
|cou_ecl|Couleur d'éclairage de la lampe|character varying(2)|'00'::character varying|
|gar_lamp|Garantie de la lampe en années|smallint| |
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie de la donnée|character varying(80)| |

* Trigger(s) :
	* t_t1_modele_lampe (before insert or update) : 
		- geo retourne '' au lieu de null, on force donc la valeur null pour éviter la contrainte unique

		- suppression des messages d'erreur

		- gestion des contraintes de saisie avec génération de message d'erreur

		- on update la date maj si update.
-------------------------------------------------------------------------
#### an_ecl_modele_support
Modèles des différents mâts

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_mod_sup|Numéro du modèle de support, interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_modele_support_id_mod_sup_seq'::regclass)|
|nom_mod_su|Nom métier du modèle|character varying(254)| |
|mat_supp|Matériau du support|character varying(2)|'00'::character varying|
|cod_ral_s|Code RAL du support|character varying(20)| |
|ik_supp|Indice de protection face aux influences extérieures|integer| |
|ip_supp|Indice de protection aux chocs mécaniques|integer| |
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie de la donnée|character varying(80)| |

* Trigger(s) :
	* t_t1_modele_support (before insert or update) :
		- geo retourne '' au lieu de null, on force donc la valeur null pour éviter la contrainte unique

		- suppression des messages d'erreur

		- gestion des contraintes de saisie avec génération de message d'erreur

		- on update la date maj si update.
-------------------------------------------------------------------------
#### an_ecl_ouvrage_electrique
Objet avec une arrivée d''électricité et un ou plusieurs départs

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_ouvelec|Identifiant du nœud lié à l'ouvrage|integer| |
|nom_ouv|Nom métier de l'ouvrage|character varying(254)| |
|pdl_edf|Numéro de référence EDF|character varying(4)| |
|n_com_edf|Numéro du compteur EDF|character varying(10)| |
|ty_ouvelec|Type d'ouvrage électrique|character varying(2)|'00'::character varying|
|etat_ouvel|Etat de l'ouvrage électrique|character varying(2)|'00'::character varying|
|mod_pos_ou|Mode de pose de l'ouvrage électrique|character varying(2)|'00'::character varying|
|val_terre|Valeur globale de la terre|bigint| |
|ik_ouvelec|Indice de protection face aux influences extérieures|integer| |
|ip_ouvelec|Indice de protection eux chocs mécaniques|integer| |
|puis_mes|Puissance mesurée|integer| |
|puis_sous|Puissance souscrite|integer| |
|ty_comm|Type de commande d'allumage|character varying(2)|'00'::character varying|
|pres_var|Présence d'un variateur|character varying(2)|'00'::character varying|
|ty_disjonc|Type du disjoncteur|character varying(2)|'00'::character varying|
|ty_fusible|Type du fusible|character varying(2)|'00'::character varying|

* Vue(s) :
    - xapps_geo_v_ecl_support_par_armoire
    - m_reseau_sec.geo_v_ecl_ouvrage_electrique
    - xapps_an_v_ecl_patrimoine
    - xapps_an_vmr_ecl_materialisee_noeud_armoire
    - xapps_geo_v_ecl_depart
-------------------------------------------------------------------------
#### an_ecl_pi

Objet réel ou abstrait indiquant un point d''importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''Eclairage Public

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_pi|Identifiant du nœud lié au point d'interet|integer| |
|ty_pi|Type de point d'intérêt|character varying(2)|'00'::character varying|
|etat_pi|Etat du point d'intérêt |character varying(2)|'00'::character varying|

* Vue(s) :
    - m_reseau_sec.geo_v_ecl_pi
    - xapps_an_v_ecl_patrimoine
-------------------------------------------------------------------------
#### an_ecl_support

Supports des foyers (sol, façade, mât...)

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_supp|Identifiant du nœud lié au support|integer| |
|id_mod_sup|Lien vers table modèle de support|integer|1|
|ty_supp|Type de support : mat, facade…etc.|character varying(2)|'00'::character varying|
|opt_supp|Option(s) du support, sous forme de liste déroulante dans l'application|character varying(80)| |
|ty_parasu|Type de parasurtenseur|character varying(2)|'00'::character varying|
|etat_supp|Etat du support|character varying(2)|'00'::character varying|
|haut_trap|Hauteur de la trappe de visite : Standard ou En hauteur|character varying(2)|'00'::character varying|
|ty_disjonc|Type du disjoncteur|character varying(2)|'00'::character varying|
|ty_fusible|Type du fusible|character varying(2)|'00'::character varying|
|haut_supp|Hauteur du support|integer| |
|nbr_foyer|Nombre de foyer, calculé automatiquement via trigger|integer| |

* Vue(s) :
    - geo_v_ecl_point_lumineux
    - xapps_geo_v_ecl_support_par_armoire
-------------------------------------------------------------------------
#### geo_ecl_cable

Objet linéaire allant d''un nœud à un autre

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_cab|Numéro du câble interne à l'ARC|integer|nextval('m_reseau_sec.ecl_objet_seq'::regclass)|
|id_nd_ini|Lien vers l'identifiant du nœud initial du câble|integer| |
|id_nd_fin|Lien vers l'identifiant du nœud final du câble|integer| |
|exploi_cab|Exploitant du câble|character varying(254)| |
|presta_cab|Prestataire des travaux sur le câble|character varying(254)| |
|etat_cable|Etat du câble|character varying(2)|'00'::character varying|
|situ_cab|Situation physique du câble|character varying(2)|'00'::character varying|
|dat_pos_ca|Date de pose du câble|timestamp without time zone| |
|qua_dat|Qualité de date de la pose|character varying(2)|'00'::character varying|
|sect_cab|Section du câble|character varying(2)| |
|ent_pose|Entreprise ayant posé le cable|character varying(254)| |
|insee1|Code insee de la commune sur laquelle est située le câble|character varying(5)| |
|commune1|Commune sur laquelle est située le câble|character varying(50)| |
|insee2|Code insee de la commune sur laquelle est située le câble|character varying(5)| |
|commune2|Commune sur laquelle est située le câble|character varying(50)| |
|src_geom|Source du référentiel géographique pour le positionnement du nœud|character varying(2)|'00'::character varying|
|src_date|Année du millésime du référentiel géographique de saisie|character varying(4)| |
|observ|Commentaires divers|character varying(254)| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|op_sai|Opérateur de la saisie attributaire de la donnée|character varying(80)| |
|geom|Géométrie du câble|USER-DEFINED| |
|qua_geo_xy|Qualité de la géolocalisation planimétrique|character varying(2)|'00'::character varying|
|qua_geo_z|Qualité de la géolocalisation altimétrique|character varying(2)|'00'::character varying|
|op_sai_geo|Opérateur de la géolocalisation|character varying(254)| |
|date_donne|Horodatage de la production initiale de la donnée|timestamp without time zone| |
|situation|Situation générale : Actif / Inactif / supprimé|character varying(2)|'10'::character varying|

* Trigger(s) :
	* t_t1_cable_before_insert_update (before insert or update):
		- on force la valeur de certains attributs à l'insertion

		- on actualise la date de maj à l'update

		- suppression des messages d'erreur

		- gestion des contraintes de saisie avec génération de message d'erreur

		- on force une valeur aux attributs nœud initial et nœud final du câble. -> lien avec table nœud.

		- on force une valeur pour les attributs commune, insee, gestionnaire, prestataire, en fonction d'autres tables.

	* t_t3_cable_delete (before delete) :
		- A la suppression du câble, attribut à supprimer (pas de suppression géométrique de l'objet)

* Vue(s) :
    - xapps_an_v_ecl_tension_cable
    - xapps_an_v_ecl_patrimoine
-------------------------------------------------------------------------
#### geo_ecl_noeud

Nœud ponctuel du réseau.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_noeud|Numéro du noeud interne à l'ARC|integer|nextval('m_reseau_sec.ecl_objet_seq'::regclass)|
|depart|Depart auquel est relié le noeud|integer| |
|exploit_nd|Exploitant du nœud|character varying(254)| |
|presta_nd|Prestataire des travaux sur le nœud|character varying(254)| |
|commune|Commune sur laquelle est situé le nœud|character varying(254)| |
|insee|Code insee de la commune sur laquelle est situé le nœud|character varying(5)| |
|ent_pose|Entreprise ayant posé l'ouvrage électrique|character varying(254)| |
|dat_pos|Date de la pose|timestamp without time zone| |
|qua_dat|Qualité de date de la pose|character varying(2)|'00'::character varying|
|src_geom|Source du référentiel géographique pour le positionnement du nœud|character varying(2)|'00'::character varying|
|src_date|Année du millésime du référentiel géographique de saisie|character varying(4)| |
|op_sai|Opérateur de la saisie attributaire de la donnée nœud|character varying(80)| |
|geom|Géométrie du noeud|USER-DEFINED| |
|date_sai|Date de la saisie de la donnée dans la base|timestamp without time zone|now()|
|date_maj|Date de dernière mise à jour de la donnée|timestamp without time zone| |
|observ|Commentaires divers|character varying(254)| |
|qua_geo_xy|Qualité de la géolocalisation planimétrique|character varying(2)|'00'::character varying|
|qua_geo_z|Qualité de la géolocalisation altimétrique|character varying(2)|'00'::character varying|
|op_sai_geo|Opérateur de la géolocalisation|character varying(254)| |
|date_donne|Horodatage de la production initiale de la donnée|timestamp without time zone| |
|situation|Situation générale : Actif / Inactif / supprimé|character varying(2)|'10'::character varying|

* Vue(s) : 
    - xapps_geo_v_ecl_support_par_armoire
    - xapps_geo_v_ecl_intervention_liste_affichage
    - xapps_geo_v_ecl_depart
    - xapps_an_v_ecl_patrimoine
    - xapps_an_vmr_ecl_materialisee_noeud_armoire
    - xapps_an_v_ecl_tension_cable
    - m_reseau_sec.geo_v_ecl_ouvrage_electrique
    - m_reseau_sec.geo_v_ecl_pi
    - m_reseau_sec.geo_v_ecl_point_lumineux
-------------------------------------------------------------------------
### Classes d'objets de gestion

#### an_ecl_media

Table de gestion des photos et documents dans GEO

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|gid|Identifiant d'une ligne, interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_media_gid_seq'::regclass)|
|id|Identifiant de l’objet lié|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier GEO|text| |
|op_sai|Opérateur de saisie|text| |
|date_sai|Date de saise|timestamp without time zone| |
-------------------------------------------------------------------------
#### an_ecl_media_modele

Table de gestion des photos et documents des modèles dans GEO

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|gid|Identifiant du modèle + lettre (dans GEO cle_media)|integer|nextval('m_reseau_sec.an_ecl_media_modeles_gid_seq'::regclass)|
|id|Identifiant de l’objet lié|character varying(5)| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier GEO|text| |
-------------------------------------------------------------------------
#### an_ecl_erreur
Erreurs de saisies et messages d''erreur associés

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:-|:-|:-|:-|  
|id_erreur|Numéro de l'erreur interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_erreur_id_erreur_seq'::regclass)|
|id_objet|Identifiant de l'objet sur lequel l'erreur a été saisie|integer| |
|message|Message d'erreur destiné à l'utilisateur de l'application|character varying(254)| |
|heure|Date de la saisie de l'erreur|timestamp without time zone| |

# Listes de valeurs


Toutes les listes de valeur ont la même structure :

| Nom attribut     | Définition         | Type                  |
| - | - | - |
| code             | Code de la liste   | character varying(2)  |
| valeur           | Valeur de la liste | character varying(80) |


-------------------------------------------------------------------------
#### lt_ecl_classe_electrique

Code permettant de décrire la classe électrique de la lanterne

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Classe I|
|20|Classe II|
|30|Classe III|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_couleur_eclairage

Code permettant de décrire la couleur d''éclairage de la lampe

|Code | Valeur |
|:-|:-|  
|00|Non-renseigné|
|10|803|
|20|942|
|ZZ|Non-concerné|
|99|Autre|

Particularité : N'est utile que pour certains types de lampe associés à certains types de culots. Saisie contrôlée dans l'application via les apparitions conditionnelles des fiches information.

-------------------------------------------------------------------------  
#### lt_ecl_culot_lampe

Code permettant de décrire le culot de la lampe

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|E27|
|20|E40|
|30|G12|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_emplacement

Code permettant de décrire l''emplacement de la platine du foyer

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Pied du support|
|20|Lanterne|
|ZZ|Non concerné|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_etat

Code permettant de décrire l''état de l''objet

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Neuf|
|20|Bon etat|
|30|Etat moyen (dégradation partielle)|
|40|Vétuste|
|ZZ|Non concerné|

Particularité : Selon appréciation du service métier, ou bien selon données des contrôles mécaniques/ électriques.
 
-------------------------------------------------------------------------
#### lt_ecl_etat_signalement_affichage

Code permettant de décrire l''etat du signalement pour affichage dans GEO

|Code | Valeur |
|:-|:-|  
|10|Soumis|
|30|Réglé|
|40|Classé sans suite|
|50|Pour information|
|60|Réglé par une intervention sur foyer / départ|

Particularité : Présents deux fois dans GEO, dont une fois avec un filtre pour enlever le code 60, afin que les utilisateurs ne puissent pas saisir l'option ''Réglé par une intervention sur foyer / départ". Pour que cette option s'affiche bien ensuite dans la fiche, le deuxième domaine de valeur GEO, basé sur ce même domaine mais sans filtre cette fois, est utilisé.

-------------------------------------------------------------------------
#### lt_ecl_hauteur_trappe
|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Standard|
|20|En hauteur|
|ZZ|Non concerné|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_materiaux_supports

Code permettant de décrire le matériaux du support

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Acier|
|20|Béton|
|30|Bois|
|40|Aluminium|
|50|Fonte|
|60|Fibre de verre|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_mode_pose_ouvrage_electrique

Code permettant de décrire le mode de pose de l''ouvrage électrique

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Encastrée|
|20|Saillie sur poste distribution publique|
|30|Sur façade autre|
|40|Sur socle|
|50|Dans fosse|
|60|Enterré|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_moyen_intervention

Code permettant de décrire si l''intervention se fait avec ou sans nacelle

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Avec nacelle|
|20|Sans nacelle|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_options_support

Code permettant de décrire les options du support

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Caméra|
|20|Oriflamme|
|30|wi-fi|
|40|Radar|
|50|Panneau signalisation|
|60|Prise guirlande festive|
|70|Bluetooth|
|80|Jardinière|
|11|Détecteur de mouvement|
|12|Feu tricolore|
|13|Boîte piéton|
|14|Traversée piétonne|
|15|Miroir|
|16|Projecteur|
|17|Appel piéton|
|99|Autre|
|ZZ|Non concerné|

Particularités : 
Le fonctionnement du générateur d'application web permet la saisie de choix multiple par la concaténation des différents `code` séparées par un `;`. Il n'y a donc pas de nécessité à gérer une cardinalité 1-n depuis la classe `an_ecl_support`.

-------------------------------------------------------------------------
#### lt_ecl_presence

Code permettant de décrire la présence, ou non, d''un élément

|Code | Valeur |
|:-|:-|  
|00|Non-renseigné|
|10|Oui|
|20|Non|

Particularité :  Devrait être remplacé à terme par un domaine oui/non déjà existant.

-------------------------------------------------------------------------
#### lt_ecl_puissance_lampe

Code permettant de décrire la puissance de la lampe

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|05|30|
|10|35|
|15|40|
|20|60|
|30|70|
|40|100|
|50|150|
|60|250|
|70|400|
|80|1000|
|99|Autre|
|ZZ|Non concerné|

Particularité : Doit disparaître pour laisser la place à une saisie libre, car les puissances sont trop différentes et varient souvent.

-------------------------------------------------------------------------
#### lt_ecl_qualite_date

Code permettant de décrire la qualité de la date indiquée

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Certaine|
|20|Récolement|
|30|Projet|
|40|Mémoire|
|50|Déduite|

Particularité : Tiré des métadonnées du standard GraceTHD.

-------------------------------------------------------------------------
#### lt_ecl_qualite_geolocalisation

Code permettant de décrire la qualité de la géolocalisation

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Classe A|
|20|Classe B|
|30|Classe C|

Particularité :  Tiré des métadonnées du standard RAEPA

-------------------------------------------------------------------------
#### lt_ecl_section_cable

Code permettant de décrire la section du câble

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|35|
|11|25|
|12|16|
|20|10|
|21|6|
|22|4|
|30|2,5|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_signalement_intervention

Code permettant de décrire si c''est un signalement ou une intervention

|Code | Valeur |
|:-|:-|  
|10|Signalement|
|20|Intervention|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_situation
Code permettant de décrire la situation réelle de l''objet

|Code | Valeur |
|:-|:-|  
|10|Actif|
|11|Inactif|
|12|Supprimé|

Particularité : Inactif signifie que l'objet existe toujours physiquement mais qu'il ne joue plus aucun rôle pour le réseau d'éclairage public.

-------------------------------------------------------------------------
#### lt_ecl_situation_cable

Code permettant de décrire la situation du câble

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Aérien|
|11|Aérien nu|
|12|Aérien torsade EP|
|20|Souterrain|
|21|Souterrain blindé|
|22|Souterrain R02|
|30|Mural|
|99|Autre|

Particularité : 

-------------------------------------------------------------------------
#### lt_ecl_source_defaillance

Code permettant de décrire la source de la déaillance repérée

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Vandalisme|
|30|Catastrophe naturelle|
|40|Accident|
|50|Inconnue|
|99|Autre|

Particularité :x

-------------------------------------------------------------------------
#### lt_ecl_type_amorceur

Code permettant de décrire le type d''amorceur

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Abel ATR|
|20|STAR A50 48|
|30|TRIDONIC ZRM 2-ES/C|
|99|Autre|
|ZZ|Non concerné|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_auto_transformateur

Code permettant de décrire le type d''auto-transformateur

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|300V/250V 130VA|
|11|300V/250V 200VA|
|12|300V/250V 510VA|
|20|300V/230V 130VA|
|21|300V/230V 200VA|
|22|300V/230V 510VA|
|30|380V/250V 130VA|
|31|380V/250V 200VA|
|32|380V/250V 510VA|
|33|380V/250V 600VA|
|34|380V/250V 1260VA|
|40|380V/230V 200VA|
|41|380V/230V 510VA|
|42|380V/230V 600VA|
|43|380V/230V 1260VA|
|99|Autre|
|ZZ|Non concerné|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_ballast

Code permettant de décrire le type de ballast

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Ferromagnétique|
|20|Electronique|
|30|Driver|
|99|Autre|
|ZZ|Non concerné|

Particularité : Type de Ballast doit évoluer sur le moyen/long terme vers type de driver, puisque les lampes vont toutes passées en LED. 

-------------------------------------------------------------------------
#### lt_ecl_type_commande

Code permettant de décrire le type de commande de l''ouvrage électrique

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Cellule photo-électrique|
|20|Horloge astronomique|
|30|Horloge standard|
|40|Télégestion|
|50|Radio BH-T|
|60|SOGEME GSM|
|99|Autre|
|ZZ|Non concerné|

Particularité : Compiègne vise à être est uniquement en BH-T à moyen terme, mais l'ARC dispose de nombreux types de commande différents.

-------------------------------------------------------------------------
#### lt_ecl_type_defaillance

Code permettant de décrire le type de défaillane

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Foyer éteint|
|20|Lanterne tournée|
|30|Vasque cassée|
|40|Trappe abîmée|
|50|Problème d'allumage|
|60|Phase ouverte|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_disjoncteur

Code permettant de décrire le type de disjoncteur

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Pas de disjoncteur|
|20|40A 500Ma|
|30|63A 500Ma|
|31|63A 1000Ma|
|40|Disjoncteur principal|
|99|Autre|

Particularité : Les armoirs principales ont toutes un disjoncteur différent, d'où la présence d'un ''disjoncteur principal''. Les nouvelles armoires devraient toutes avoir le même, sa référence sera donc ajoutée.

-------------------------------------------------------------------------
#### lt_ecl_type_fusible

Code permettant de décrire le type de fusible

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Pas de fusible|
|20|8,5x31,5 4A|
|21|8,5x31,5 6A|
|22|8,5x31,5 8A|
|23|8,5x31,5 10A|
|30|10x38 4A|
|31|10x38 6A|
|32|10x38 8A|
|33|10x38 10A|
|34|10x38 16A|
|40|14x51 10A|
|41|14x51 16A|
|42|14x51 20A|
|43|14x51 25A|
|44|14x51 32A|
|45|14x51 50A|
|50|22x58 32A|
|51|22x58 60A|
|52|22x58 80A|
|53|22x58 100A|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_intervention

Code permettant de décrire le type d''intervention

|Code | Valeur |
|:-|:-|  
|00|->|
|10|Changement de disjoncteur|
|11|Changement de fusible|
|20|Changement de type de commande|
|21|Changement de récepteur|
|30|Contrôle électrique|
|40|Nettoyage|
|50|Réparation|
|60|Ajout d'un départ|
|80|Suppression de l'objet|
|81|Désactivation de l'objet|
|99|Autre|
|12|Changement de lanterne|
|13|Changement de lampe|
|15|Changement de ballast/driver|
|16|Changement d'amorce|
|17|Changement d'auto-transformateur|
|70|Repositionnement lanterne/crosse|
|31|Contrôle mécanique|
|18|Ajout d'une option|
|90|Suppression d'une option|

Particularité : Le fonctionnement du générateur d'application web permet la saisie de choix multiple par la concaténation des différents `code` séparées par un `;`. Il n'y a donc pas de nécessiter à gérer une cardinalité 1-n depuis la classe `an_ecl_intervention`.

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_cables

Code permettant de décrire le type d''intervention des câbles

|Code | Valeur |
|:-|:-|  
|50|Réparation|
|80|Suppression de l'objet|
|81|Désactivation de l'objet|
|82|Réactivation de l'objet|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_depart

Code permettant de décrire le type d''intervention des départs

|Code | Valeur |
|:-|:-|  
|10|Changement de disjoncteur|
|11|Changement de fusible|
|50|Réparation|
|80|Suppression de l'objet|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_foyer

Code permettant de décrire le type d''intervention des foyers

|Code | Valeur |
|:-|:-|  
|12|Changement de lanterne|
|13|Changement de lampe|
|15|Changement de ballast/driver|
|16|Changement d'amorce|
|17|Changement d'auto-transformateur|
|40|Nettoyage|
|50|Réparation|
|70|Repositionnement lanterne/crosse|
|80|Suppression de l'objet|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_ouvrage

Code permettant de décrire le type d''intervention des ouvrages

|Code | Valeur |
|:-|:-|  
|10|Changement de disjoncteur|
|11|Changement de fusible|
|20|Changement de type de commande|
|30|Contrôle électrique|
|40|Nettoyage|
|50|Réparation|
|60|Ajout d'un départ|
|80|Suppression de l'objet|
|81|Désactivation de l'objet|
|82|Réactivation de l'objet|
|21|Changement de récepteur|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_pi

Code permettant de décrire le type d''intervention des point-d''intérets

|Code | Valeur |
|:-|:-|  
|30|Contrôle électrique|
|31|Contrôle mécanique|
|40|Nettoyage|
|50|Réparation|
|80|Suppression de l'objet|
|81|Désactivation de l'objet|
|82|Réactivation de l'objet|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_intervention_point_lumineux

Code permettant de décrire le type d''intervention des point lumineux

|Code | Valeur |
|:-|:-|  
|10|Changement de disjoncteur|
|11|Changement de fusible|
|18|Ajout d'une option|
|90|Suppression d'une option|
|19|Changement de parasurtenseur|
|31|Contrôle mécanique|
|40|Nettoyage|
|50|Réparation|
|80|Suppression de l'objet|
|81|Désactivation de l'objet|
|82|Réactivation de l'objet|
|83|Dépose / repose identique (accident)|
|99|Autre|

Particularité : voir lt_ecl_type_intervention

-------------------------------------------------------------------------
#### lt_ecl_type_lampe

Code permettant de décrire le type de la lampe

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Iodure Métallique – IM|
|20|Sodium Haute Pression – SHP|
|30|Sodium Basse Pression – SBP|
|40|Ballon Fluorescent – BF|
|50|LED|
|60|Fluo Compact – FC|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_lanterne

Code permettant de décrire le type de lanterne

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Piéton|
|20|Routier|
|30|Projecteur|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_ouvrage_electrique

Code permettant de décrire le type d''ouvrage électrique

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Armoire|
|11|Sous-armoire|
|20|Transformateur|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_parasurtenseur

'Code permettant de décrire le type de parasurtenseur';

|Code | Valeur |
|:-|:-|  
|00|Non renseigné|
|10|Pas de parasurtenseur|
|20|Vario Var15EP25MR|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_pi

Code permettant de décrire le type de point d''interet

|Code | Valeur |
|:-|:-| 
|00|Non renseigné|
|10|Chambre de tirage|
|20|Tangente|
|30|Remontée aérosouterraine|
|40|Descente aérosouterraine|
|50|Borne|
|60|Panneau publicitaire|
|70|Sous-marin|
|80|Arrêt de bus|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
#### lt_ecl_type_support

Code permettant de décrire le type de support

|Code | Valeur |
|:-|:-| 
|00|Non renseigné|
|10|Mât|
|20|Façade|
|30|Poteau réseau électrique BT|
|40|Sol|
|99|Autre|

Particularité : x

-------------------------------------------------------------------------
# Les Vue(s)

### m_reseau_sec.geo_v_ecl_ouvrage_electrique
Description : Vue des ouvrages électriques permettant la saisie dans l''application Geo

* Trigger(s) :
	* t_t1_lk_ouvrage_electrique (INSTEAD OF INSERT OR UPDATE OR DELETE) :
	  
		- Suppression des messages d'erreur
		- On force certains attributs
		- Gestion des contraintes de saisie avec génération de  	messages d'erreurs
		- Contrôle de la topologie 
		- Ventilation des données aux tables Noeuds et ouvrages électriques
		- En cas de DELETE, attribut situation passe à 'supprimer' -> Le point n'est donc pas réellement supprimé.
		- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.

###  m_reseau_sec.geo_v_ecl_point_lumineux
Description : Vue des supports permettant la saisie dans l''application Geo

* Trigger(s) :
	* t_t1_lk_point_lumineux (INSTEAD OF INSERT OR UPDATE OR DELETE) :
	  
		- Suppression des messages d'erreur
		- On force certains attributs
		- Gestion des contraintes de saisie avec génération de  	messages d'erreurs
		- Contrôle de la topologie 
		- Ventilation des données aux tables Noeuds et Supports
		- En cas de DELETE, attribut situation passe à 'supprimer' -> Le point n'est donc pas réellement supprimé
		- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.

###  m_reseau_sec.geo_v_ecl_pi 
Description : Objet réel ou abstrait indiquant un point ayant une importance pour la connaissance patrimoniale du réseau, mais ne possédant pas de caractéristiques intrasèques intéressantes pour l''EP.

* Trigger(s) :
	* t_t1_point_interet (INSTEAD OF INSERT OR UPDATE OR DELETE) :
	   
		- Suppression des messages d'erreur
		- On force certains attributs
		- Gestion des contraintes de saisie avec génération de  	messages d'erreurs
		- Contrôle de la topologie 
		- Ventilation des données aux tables Noeuds et PI
		- En cas de DELETE, attribut situation passe à 'supprimer' -> Le point n'est donc pas réellement supprimé.
		- Gestionnaire, exploitant et commune / insee mis à jours selon géométrie d'autres tables.

### xapps_an_v_ecl_patrimoine
Description : Bilan du patrimoine numérique d''éclairage public

### xapps_an_v_ecl_stat_intervention 
Description : Compte des interventions selon le type

### xapps_an_v_ecl_tension_cable
Description : Lien entre le câble et sa tension selon noeud final du câble

### xapps_geo_v_ecl_depart
Description : Vue géospatialisée des départs selon géométrie de l''ouvrage rattaché - géométrie de buffer

### xapps_geo_v_ecl_intervention_liste_affichage
Description : Interventions/Signalements avec attributs calculés dynamiquement, sert à la liste de domaine interventions et à l''affichage des signalements sur GEO

### xapps_geo_v_ecl_support_par_armoire
Description : Supports categorisés par armoires pour affichage GEO

### xapps_an_vmr_ecl_materialisee_noeud_armoire 
Description : Vue matérialisée utilisant une requête récursive pour déterminer les ouvrages électriques en amont des noeuds.

# Projet QGIS pour la gestion
Un projet QGIS a été réalisé pour la gestion interne des données. Il est stocké ici : R:\Projets\Metiers\1902RESS-ARC-EvolBdd_Apps_ECL\2-PreEtude\Utilitaires_et_ressources dans l'attente d'être placé ici Y:\Ressources\4-Partage\3-Procedures\QGIS

# Traitement automatisé mis en place (Workflow de l'ETL FME)
 ## Initialisation des données - Etat 0
 Les fichiers à utiliser ont été placés ici : R:\Projets\Metiers\1902RESS-ARC-EvolBdd_Apps_ECL\PASSAGE_PROD
 
 ## Mise à jour régulière des données des prestataires extérieurs

  Le processus est en cours de développement.
  
# Schéma fonctionnel
  ## Modèle conceptuel simplifié
  

