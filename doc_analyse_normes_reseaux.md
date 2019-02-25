# Analyse des normes RAEPA et GRACE dans un but d'urbanisation d'une BdD "Réseaux" globale

## Généralités

Les deux normes réseaux étudiées (RAEPA et GRACE) utilisent deux types de géométries : les polylignes et les points. Les différentes solutions existantes de BdD d'éclairage public vont dans le même sens. De plus, ne nombreux attributs sont communs aux différents types de réseaux, une urbanisation semble donc possible pour ce qui est des lignes et ds points, dans des classes qu'on appellera respectivement ici "lineaire reseau" et "noeud" (appellation selon nomenclature à définir).
Une troisième classe pourra être commune car indispensable à la gestion de réseau : la classe "maintenance".

|Nom de la classe|Définition de la classe|
|:---|:---|
|lineaire reseau | Tronçon d'un réseau de caractéristiques (physiques et immatérielles --> propriétaires, exploitants...) uniformes sur toute la longueur, représenté spatialement par des lignes. |
|noeud| Point d'intérêt d'un réseau (jonction des lineaires reseau, support d'éclairage autonome... etc) représenté spatialement par un point.|
|Maintenance|Lieu et détails d'une intervention de réparation, ou de prévention, de panne de réseau représentés spatialement par un point. |

Ces 3 classes pourraient ainsi être les seules à détenir de l'information géographique, les autres tables se posant en héritage des classes "lineaire reseau" ou "noeud", comme sur le schèma conceptuel simplifié ci-dessous.  

![UML urbanisation simplifié](/UML_simple_urbanisation.jpg)

Topologie générales des réseaux : 

- Tout arc (ligne ou polyligne) est relié à deux noeuds par ses extrémités.
- Deux arcs peuvent se croiser sans présence d'un noeud. 
- Un noeud est au choix : 
  - une terminaison de réseau
  - une connection entre deux arcs
  - indépendant du réseau (cas des supports d'éclairage indépendants)

## Etude des attributs commun des réseaux

**Nom de l'attribut**|**Définition**|**Type de valeurs**|**Valeurs possibles**|**Contraintes sur l'attribut**
:-----:|:-----:|:-----:|:-----:|:-----:
idDefaillance|Identifiant de l'action de maintenance|Texte| | 
supportIncident|Objet concerné par l'action de maintenance|Liste de valeur| | 
typeDefaillance|Type de défaillance concernée par l'action de maintenance|Liste de valeur| | 
typeReparation|Type de réparation effectuée|Texte| | 
maitreOuvrage|Maitre d'ouvrage de l'action de maintenance|Texte| | 
origineDetection|Opération ayant permis de détecter la défaillance|Liste de valeur| | 
dateDetection|Date de détection de la défaillance|Date| | 
dateIntervention|Date d'intervention |Date| | 
causeDefaillance|Type de cause de la défaillance|Liste devaleur| | 
sourceDefaillance|Source de la défaillance ayant donné lieu à réparation|Texte| | 
commentaireReparation|Commentaire libre|Texte| | 
PhotoIntervention|Photographie de l'intervention|Image| | 
Coordonnées x|Coordonnée X en lambert 93|Réel | | 
Coordonnées Y|Coordonnée Y en lambert 93|Réel | | 
