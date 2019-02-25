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
idNoeud|Identifiant du noeud| | | 
Coordonnées x|Coordonnée X en lambert 93| | | 
Coordonnées Y|Coordonnée Y en lambert 93| | | 
Propriétaire(maitre ouvrage ?)|Propriétaire du nœud (pour élec : propriétaire du fourreau)| | | 
Exploitant/gestionnaire|Exploitant du nœud| | | 
DateInstallation|Date d'installation/construction du nœud. | | | 
DateSaisie|Date de première saisie de l'information| | | 
DateMaj|Date de la dernière modificiation| | | 
ReferencielSaisie|Référentiel de saisie | | | 
QualiteSaisie|indice de qualité de l'information saisie| | | 
Photo|Photographie du nœud (générique ou de l'objet propre)| | | 
Commentaire|Libre| | | 
precision xy|précision planimétrique| | | 
Métadonnées|Selon standart de la norme concernée| | | 
Etat|Etat de qualité du nœud| | | 
TechnologiePrésente|Technologie présente sur ou dans le nœud|Liste de valeur, de 1 à 5 option| | 
z|Hauteur du nœud : entre le sol et la base de l'infrastructure| | | 
/Adresse|Adresse de la voie --> pour dénomination du nœud| | | 
planRec|Lien vers plan de recollement| | | 
