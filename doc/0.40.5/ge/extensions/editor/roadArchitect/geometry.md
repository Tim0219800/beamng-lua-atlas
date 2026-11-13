# `editor_roadArchitect_geometry`

*Fichier : `lua/ge/extensions/editor/roadArchitect/geometry.lua` · VM : Game Engine (GE) · 753 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_geometry` : `extensions.load("editor_roadArchitect_geometry")`, puis la globale `editor_roadArchitect_geometry`

Module de géométrie de l'éditeur Road Architect (GE). Il transforme les nœuds de référence d'une route en points discrétisés le long d'une spline, puis calcule pour chaque point et chaque voie les quatre coins de la section transversale, les vecteurs normal et latéral, le dévers, etc. Le résultat est stocké dans road.renderData et sert à l'affichage et à la création des DecalRoads/meshes. Un moddeur ne l'utilise que pour recalculer ou lire ces données depuis un outil d'édition.

## Remarques

- Une seule fonction est exportée ; les fonctions d'ajustement (fitSplineStandardRoad, fitArc, fitCivEngAndFrame, identifyTunnelSections) sont locales.
- La route (road) est modifiée en place : road.renderData est remplacé, road.tunnels est vidé puis recréé si road.isAllowTunnels[0] est vrai, et les nœuds peuvent changer (p.z projeté sur le terrain, rot recalculé par auto-banking).
- Les valeurs de road.* telles que isConformRoadToTerrain, isCivilEngRoads, isAllowTunnels, extraS, extraE sont des pointeurs imgui (accès par [0]).
- Le dévers (indice 12) est converti en radians (rad() du degré stocké sur le nœud). Les largeurs et hauteurs sont en mètres.
- Le calcul des tunnels n'est fait que si extensions.editor_terrainEditor.getTerrainBlock() renvoie un bloc de terrain.
- L'élargissement aux épingles (profile.isExtraWidth) ajoute 3 m répartis sur les voies de largeur > 2 m, puis restaure les largeurs d'origine après l'ajustement (il n'y a pas de garde si numLanes vaut 0 : division par zéro possible, déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_geometry.computeRoadRenderData(road)` | Calcule les données de rendu de la route donnée et les stocke dans road.renderData. Choisit l'ajustement selon la route : style génie civil (road.isCivilEngRoads[0]), arc de cercle (road.isArc, trois nœuds) ou spline Catmull-Rom centripète par défaut. Applique avant cela la projection sur le terrain, l'auto-banking et l'élargissement aux épingles si ces options sont actives. | 533 |

### Détail des paramètres

#### `editor_roadArchitect_geometry.computeRoadRenderData(road)`

Calcule les données de rendu de la route donnée et les stocke dans road.renderData. Choisit l'ajustement selon la route : style génie civil (road.isCivilEngRoads[0]), arc de cercle (road.isArc, trois nœuds) ou spline Catmull-Rom centripète par défaut. Applique avant cela la projection sur le terrain, l'auto-banking et l'élargissement aux épingles si ces options sont actives.

- `road` (*table*) : Route de Road Architect (nodes, profile, laneKeys, leftKeys, rightKeys, renderData, tunnels, options imgui…). Modifiée en place.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/geometry.lua`.*
