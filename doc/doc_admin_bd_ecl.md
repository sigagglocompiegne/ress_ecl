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

Classe d'objet géographique et patrimoniale

### an_ecl_depart
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

