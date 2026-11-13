# `editor_roadArchitect_roadMesh`

*Fichier : `lua/ge/extensions/editor/roadArchitect/roadMesh.lua` · VM : Game Engine (GE) · 899 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_roadMesh` : `extensions.load("editor_roadArchitect_roadMesh")`, puis la globale `editor_roadArchitect_roadMesh`

Crée les maillages procéduraux (objets de scène ProceduralMesh) du Road Architect : trottoirs avec bordures (kerbs) à gauche ou à droite de la route, et ponts. Il garde en interne les tables des maillages par nom de route et par nom de pont, pour pouvoir les supprimer plus tard. Il est appelé par le module roads lors de finalise/unfinalise et de updateRoads.

## Remarques

- createRoad lit r.renderData et r.laneKeys : la route doit avoir été calculée (geometry.computeRoadRenderData) avant.
- createRoad ne génère des maillages que pour les sections latérales de type 'sidewalk' (une voie par section) ; les autres types de voies sont rendus par les décalcomanies, pas par ce module.
- Les maillages sont ajoutés au dossier de scène fourni, avec canSave = true.
- Les ponts sont nommés 'Bridge_<nom de route>' ; un pont existant est supprimé puis recréé à chaque updateBridge.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_roadMesh.clearBridges()` | Remplace la table des ponts par une table vide sans supprimer les objets de scène. | 888 |
| `editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder)` | Découpe la route en sections latérales et crée un maillage de trottoir + bordure pour chaque voie 'sidewalk' (côté gauche ou droit selon isLeftSide). Mémorise les maillages sous le nom de la route. | 669 |
| `editor_roadArchitect_roadMesh.tryRemove(roadName)` | Supprime de la scène les maillages créés pour la route (s'il y en a) et oublie l'entrée. | 686 |
| `editor_roadArchitect_roadMesh.tryRemoveBridge(name)` | Supprime l'objet maillage du pont et l'oublie. | 879 |
| `editor_roadArchitect_roadMesh.updateBridge(r, folder)` | (Re)crée le maillage procédural d'un pont : supprime l'ancien, calcule les anneaux de sommets à partir du renderData (voies -1 à 1), génère surface et capuchons, et l'ajoute au dossier. | 697 |

### Détail des paramètres

#### `editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder)`

Découpe la route en sections latérales et crée un maillage de trottoir + bordure pour chaque voie 'sidewalk' (côté gauche ou droit selon isLeftSide). Mémorise les maillages sous le nom de la route.

- `r` (*table*) : Route avec renderData.
- `roadMeshIdx` (*integer*) : Indice de la route, utilisé pour nommer les objets créés.
- `folder` (*userdata*) : SimGroup de scène qui reçoit les maillages.

#### `editor_roadArchitect_roadMesh.tryRemove(roadName)`

Supprime de la scène les maillages créés pour la route (s'il y en a) et oublie l'entrée.

- `roadName` (*string*) : Nom de la route.

#### `editor_roadArchitect_roadMesh.tryRemoveBridge(name)`

Supprime l'objet maillage du pont et l'oublie.

- `name` (*string*) : Nom (identifiant) de la route de type pont.

#### `editor_roadArchitect_roadMesh.updateBridge(r, folder)`

(Re)crée le maillage procédural d'un pont : supprime l'ancien, calcule les anneaux de sommets à partir du renderData (voies -1 à 1), génère surface et capuchons, et l'ajoute au dossier.

- `r` (*table*) : Route de type pont, avec renderData.
- `folder` (*userdata*) : SimGroup « Road Architect - Bridge <nom> ».

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/roadMesh.lua`.*
