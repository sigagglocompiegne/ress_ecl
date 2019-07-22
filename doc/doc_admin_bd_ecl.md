![GeoCompiegnois](img/Logo_web-GeoCompiegnois.png)

# Documentation technique de la base de données d'éclairage public (ECL)

## Principes
  
### Généralités

Dans le cadre de son axe prioritaire de développement autour de la connaissance patrimoniale et la gestion des réseaux, l’un des projets de l'ARC concerne plus particulièrement l’éclairage public. Celui-ci constitue essentiellement, à faire évoluer la base de données existante, enrichir les données sur la ville de Compiègne et développer une application web pour le service métier concerné. Cette BdD est donc vouée avant tout à la gestion du réseau, bien que la dimension précision cartographique soit prise en compte (DT/DICT).

Cette base de donnée s'inspire des modèles RAEPA et GR@CE, mais aussi de ceux du pays de Brest (https://geo.pays-de-brest.fr/espacedocumentaire/Documents/Public/CCTP_recolement.pdf), du syndicat d'énergie du finistère, du géojura, d'Alpes Sud, geomap...etc.

Elle a été conçue au fur et à mesure des réunions avec le service d'éclairage public de la ville de Compiègne. Elle est donc adaptée à ses besoins spécifiques, et n'a pas vocation à être un standard valable dans chaque collectivité.  

Le standard de données des réseaux, en cours de rédaction au moment de la réalisation de cette base, n'a pas été inégré. Cependant, la problématique DT/DICT est prise en compte, avec des métadonnées de classe de précision tirées du RAEPA.


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
* Voir, rechercher et éditer toutes les données.

#####	Un autre service en faisant la demande peut :
* Voir les différents objets du réseau, sans les caractéristiqus techniques.

###	Alimentation de la base de données
* Les données sont rentrées et modifiées via l'application web-métier d'éclairage public. 
* Les données des prestataires  agissant pour le compte de l'Agglomération de la Région de Compiègne ou de la Ville de Compiègne ont été ajoutées via un workflow FME.
* Le cadre d'actualisation des données par les prestataires est ) définir avec ces prestataires.

###	Les contrôles de saisie

De nombreux point de contrôles de la saisie des utilisateurs sont vérifiés. Sans tous les lister, il convient néanmoins de rappeler que :

#### Topologie
- Seuls un point d'intérêt et un point lumineux peuvent avoir la même géométrie. 
- Un câble ne peut pas être relié en point initial et en point final au même noeud.

#### Attributs
- Un signalement ne peut pas être classé en 'réglé' sans la création d'une intervention. 
- Certains attributs sont forcés à une certaine valeur en fonction des autres attributs renseignés par l'utilisateur. (ex : si le support est une façade, l'attribut ''type de mât'' est forcé à ''non concerné''.)
- Certaines valeurs numériques ont une limite à ne pas dépasser, si 

Toutes ces règles de vérification sont implémentées informatiquement pour éviter les erreurs de saisie (incohérences).

 ## Dépendances

La base de données ECL s'appuie sur des référentiels préexistants constituant autant de dépendances nécessaires pour l'implémentation de la BdD.

| schéma        | table                    | description                                                                              | usage                                                                                              |
| ------------- | ------------------------ | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| m_amenagement | geo_amt_zpne_gestion     | Table géographique délimitant les zones de gestion entre la ville de Compiègne et l''ARC | Détermine la complétion automatique du prestataire et du gestionnaire pour les nœuds et les câbles |
| r_osm         | geo_vm_osm_commune_arcba | Vue matérialisée des limites communales des communes de l''ARCBA                         | Détermine la complétion automatique de la commune et du code Insee pour les nœuds et les câbles    |

## Classes d'objets

L'ensemble des classes d'objets unitaires sont stockées dans le schéma m_reseau_sec, celles dérivées et applicatives dans le schéma x_apps.

### Classes d'objets géographique et patrimoniale

#### an_ecl_depart
|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
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

#### an_ecl_foyer
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

#### an_ecl_intervention
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



### Classes d'objets de gestion

#### an_ecl_media
|gid|Identifiant d'une ligne, interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_media_gid_seq'::regclass)|
|id|Identifiant de l’objet lié|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier GEO|text| |
|op_sai|Opérateur de saisie|text| |
|date_sai|Date de saise|timestamp without time zone| |

#### an_ecl_media_modele
|gid|Identifiant du modèle + lettre (dans GEO cle_media)|integer|nextval('m_reseau_sec.an_ecl_media_modeles_gid_seq'::regclass)|
|id|Identifiant de l’objet lié|character varying(5)| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier GEO|text| |

#### an_ecl_modele_lanterne
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

#### an_ecl_modele_lampe
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

#### an_ecl_modele_support
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

#### an_ecl_ouvrage_electrique
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

#### an_ecl_pi
|id_pi|Identifiant du nœud lié au point d'interet|integer| |
|ty_pi|Type de point d'intérêt|character varying(2)|'00'::character varying|
|etat_pi|Etat du point d'intérêt |character varying(2)|'00'::character varying|

#### an_ecl_support
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

#### geo_ecl_cable

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

####geo_ecl_noeud
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


#### an_ecl_erreur
|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|id_erreur|Numéro de l'erreur interne à l'ARC|integer|nextval('m_reseau_sec.an_ecl_erreur_id_erreur_seq'::regclass)|
|id_objet|Identifiant de l'objet sur lequel l'erreur a été saisie|integer| |
|message|Message d'erreur destiné à l'utilisateur de l'application|character varying(254)| |
|heure|Date de la saisie de l'erreur|timestamp without time zone| |



