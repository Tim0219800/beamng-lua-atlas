# `gameplay_markers_inspectVehicleMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua` · VM : Game Engine (GE) · 274 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_inspectVehicleMarker` : `extensions.load("gameplay_markers_inspectVehicleMarker")`, puis la globale `gameplay_markers_inspectVehicleMarker`

Marqueur « inspecter un véhicule » en mode jeu (par exemple un véhicule à examiner chez un vendeur) : une icône flottante (poi_parking_rect par défaut) reliée au sol par un trait, qui se lève au-dessus du véhicule du joueur quand il est dans le rayon. Dans la zone, le marqueur rend son POI interactif (data du POI). Une version « focus » reste visible de loin avec un petit rebond. Le module renvoie {create, cluster}.

## Remarques

- cluster : un cluster par POI (pas de fusion), id 'inspectVehicleMarker#<poi.id>', data = poi.data ; lit poi.markerInfo.inspectVehicleMarker.{pos, radius, icon, focus} ; visibilityRadius = 0.
- Distances : l'icône n'apparaît qu'à moins de 60 m (farDist) hors focus ; elle se lève à partir de 15 m (nearDist) ; en focus, la taille décroît de 1 à 0.65 entre 100 et 1000 m, l'opacité retombe à 0.35 sous 750 m si l'icône est cachée.
- Si la caméra libre est active, les distances sont mesurées depuis la caméra, sinon depuis la position du joueur.
- L'icône est masquée par les obstacles statiques entre la caméra et l'icône (castRayStatic).
- isInAreaChanged vaut "in" ou "out" pendant une frame au changement d'état dedans/dehors.
- Les constantes smallScaleDist/bigScaleDist/iconHeightBottom sont utilisées par update ; la fonction distanceToHeight appelle linearScale(dist, 15, 700, 1.0, 500).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters)` | Transforme chaque POI inspectVehicleMarker en un cluster distinct et l'ajoute à allClusters. *(interne)* | 248 |
| `gameplay_markers_inspectVehicleMarker.create(...)` | Fabrique un marqueur d'inspection de véhicule (instance de C). | 239 |

### Détail des paramètres

#### `gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters)`

Transforme chaque POI inspectVehicleMarker en un cluster distinct et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.inspectVehicleMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_inspectVehicleMarker.create(...)`

Fabrique un marqueur d'inspection de véhicule (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur d'inspection de véhicule avec icône animée.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire l'icône de l'icon renderer. | 42 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas). | 38 |
| `C:hide()` | Passe invisible et met l'opacité de l'icône à 0. | 52 |
| `C:init()` | Attribue un id et crée les lisseurs (position, croisière, opacité, distance) ; visible = true. | 26 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le joueur est dans la zone, ajoute cluster.data aux éléments interactifs. | 231 |
| `C:setup(cluster)` | Mémorise cluster, pos, radius, focus, réinitialise les lisseurs et crée l'icône d'opacité initiale 0. | 202 |
| `C:show()` | Repasse visible. | 63 |
| `C:update(data)` | Chaque frame : calcule la distance, anime la hauteur de l'icône (au-dessus du véhicule du joueur s'il est dedans), gère la perspective en mode focus, ajuste taille et opacité, dessine le trait vers le sol (debugDrawer) et met à jour _inside et isInAreaChanged. | 86 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua`.*
