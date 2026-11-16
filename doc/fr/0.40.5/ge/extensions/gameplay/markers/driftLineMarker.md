# `gameplay_markers_driftLineMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/driftLineMarker.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_driftLineMarker` : `extensions.load("gameplay_markers_driftLineMarker")`, puis la globale `gameplay_markers_driftLineMarker`

Marqueur de ligne de départ des défis de drift en freeroam. Il n'affiche rien lui-même : il rend visibles les objets de scène nommés (markerObjects) à l'installation, les cache au nettoyage, et, quand le véhicule du joueur entre dans le rayon de la ligne, appelle gameplay_drift_freeroam_driftSpots.detectStart(lineId). Le module renvoie {create, cluster}.

## Remarques

- cluster : un cluster par POI (pas de fusion), id 'driftLineMarker#<poi.id>'. Lit poi.markerInfo.driftLineMarker.{pos, radius, startDir, markerObjects} et poi.lineId ; visibilityRadius = 0.
- setup suppose cluster.startDir non nil (calcule la gauche et la droite de la ligne) ; sans startDir, la fonction échoue, alors que drawOnMinimap prévoit ce cas.
- interactWhileMoving est ignorée quand le joueur marche (interactData.isWalking).
- Les méthodes update, hide, show et createObjects sont vides.
- clearObjects suppose self.cluster défini (setup appelé avant).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_driftLineMarker.cluster(pois, allClusters)` | Transforme chaque POI driftLineMarker en un cluster distinct et l'ajoute à allClusters. *(interne)* | 109 |
| `gameplay_markers_driftLineMarker.create(...)` | Fabrique un marqueur de ligne de drift (instance de C). | 100 |

### Détail des paramètres

#### `gameplay_markers_driftLineMarker.cluster(pois, allClusters)`

Transforme chaque POI driftLineMarker en un cluster distinct et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.driftLineMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_driftLineMarker.create(...)`

Fabrique un marqueur de ligne de drift (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de ligne de départ de drift.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Cache (setHidden(true)) les objets de scène listés dans cluster.markerObjects. | 18 |
| `C:createObjects()` | Ne fait rien. | 14 |
| `C:drawOnMinimap(td)` | Dessine sur la minimap une ligne entre les extrémités (ou un cercle si startDir est nil) en bleu (72,125,249). | 90 |
| `C:hide()` | Ne fait rien. | 28 |
| `C:init()` | Attribue un id incrémental à l'instance. | 9 |
| `C:interactWhileMoving(interactData)` | Appelée chaque frame : si le joueur est en véhicule dans le rayon, déclenche gameplay_drift_freeroam_driftSpots.detectStart(lineId). | 75 |
| `C:setup(cluster)` | Mémorise cluster, pos, radius, lineId et startDir, calcule les extrémités gauche et droite de la ligne (à 0.7 fois le rayon) et rend visibles les objets de markerObjects. | 54 |
| `C:show()` | Ne fait rien. | 31 |
| `C:update()` | Ne fait rien (le dessin de debug est commenté). | 35 |

## Appels vers le moteur (C++)

- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/driftLineMarker.lua`.*
