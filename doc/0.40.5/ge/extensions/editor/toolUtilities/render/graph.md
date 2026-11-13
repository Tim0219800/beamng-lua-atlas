# `editor_toolUtilities_render_graph`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/graph.lua` · VM : Game Engine (GE) · 346 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_graph` : `extensions.load("editor_toolUtilities_render_graph")`, puis la globale `editor_toolUtilities_render_graph`

Rendu des barres de vitesse et du graphe de navigation IA (lignée roadArchitect / drivePath) : barres et courbe de vitesses, sélection de nœuds du navgraph et surcouche du graphe IA du monde. Séparé de render.lua car seuls les outils de graphe et de vitesse l'utilisent. Module composite qui dessine via render/spheres, lines, tris et markup, avec sa propre réserve de vec3 temporaires.

## Remarques

- Les hauteurs de barres sont la vitesse (m/s) multipliée par geom.getBarScale(), posées sur le sol trouvé par util.vertRaycast.
- unitsInt : 0 ou autre = m/s, 1 = mph, 2 = kph (util.msToMph / util.msToKph).
- À défaut de vitesses (vels/velLimits vides), 30.0 m/s est utilisé.
- renderWorldGraphNodes utilise le kd-tree graph.kdNodes ; le graphe attend nodeX/nodeY/nodeZ/nodeDepth, éventuellement nodeGroupId, groupCols, defaultNodeCol et sphereRadius (défaut 1.5).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData)` | Dessine les nœuds navGraph choisis avec une grosse sphère pulsée (pour indiquer qu'ils font partie de la sélection) et une étiquette numérotée. | 249 |
| `editor_toolUtilities_render_graph.renderGraphPath(path, graphData)` | Dessine un chemin de graphe : sphères de nœuds de chemin et lignes entre nœuds consécutifs. | 236 |
| `editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode)` | Dessine le graphe de navigation : rubans triangulés entre sphères, ligne centrale et sphères de nœuds avec halo. Le nœud survolé pulse. | 204 |
| `editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale)` | Dessine les barres de vitesse d'une spline : courbe plafond (Catmull-Rom sur barPoints) colorée selon la hauteur, lignes de chute vers le sol et étiquettes de vitesse à chaque point. Sans effet pour moins de 2 nœuds. | 31 |
| `editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit)` | Comme renderVelocities pour un chemin de graphe : si spline.divPoints existe, la courbe suit le chemin navgraph calculé et les vitesses sont interpolées linéairement entre les nœuds choisis (graphNodes/graphPath) ; sinon repli sur barPoints. Étiquettes seulement aux nœuds choisis. | 70 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col)` | Dessine des sphères de fond agrandies derrière une liste de nœuds du graphe monde (mise en évidence). | 302 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters)` | Dessine les sphères des nœuds du graphe IA du monde situés dans le rayon donné autour de la caméra (requête kd-tree). La sphère est posée en nodeZ + nodeDepth + 0.05 m et colorée par groupe si groupCols existe. | 258 |

### Détail des paramètres

#### `editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData)`

Dessine les nœuds navGraph choisis avec une grosse sphère pulsée (pour indiquer qu'ils font partie de la sélection) et une étiquette numérotée.

- `nodes` (*table*) : Liste de clés de nœuds choisis.
- `graphData` (*table*) : Données de graphe avec le champ nodes.

#### `editor_toolUtilities_render_graph.renderGraphPath(path, graphData)`

Dessine un chemin de graphe : sphères de nœuds de chemin et lignes entre nœuds consécutifs.

- `path` (*table*) : Liste de clés de nœuds dans graphData.nodes.
- `graphData` (*table*) : Données de graphe avec le champ nodes.

#### `editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode)`

Dessine le graphe de navigation : rubans triangulés entre sphères, ligne centrale et sphères de nœuds avec halo. Le nœud survolé pulse.

- `navGraph` (*table|nil*) : Graphe avec lines (pL, pR, qL, qR, cL, cR) et nodes (table de vec3).
- `hoverNode` (*vec3|nil*) : Nœud survolé (comparé par identité).

#### `editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale)`

Dessine les barres de vitesse d'une spline : courbe plafond (Catmull-Rom sur barPoints) colorée selon la hauteur, lignes de chute vers le sol et étiquettes de vitesse à chaque point. Sans effet pour moins de 2 nœuds.

- `spline` (*table*) : Spline avec nodes, barPoints, vels, velLimits, isLoop.
- `isBarsLimit` (*boolean*) : true : utilise velLimits (limites), false : vels (valeurs réelles).
- `unitsInt` (*integer*) : Unité d'affichage : 0 m/s, 1 mph, 2 kph.
- `elevScale` (*number*) : Hauteur correspondant au rouge de la rampe de couleur.

#### `editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit)`

Comme renderVelocities pour un chemin de graphe : si spline.divPoints existe, la courbe suit le chemin navgraph calculé et les vitesses sont interpolées linéairement entre les nœuds choisis (graphNodes/graphPath) ; sinon repli sur barPoints. Étiquettes seulement aux nœuds choisis.

- `spline` (*table*) : Spline avec graphNodes, graphPath, divPoints, barPoints, vels, velLimits, isLoop.
- `unitsInt` (*integer*) : Unité d'affichage : 0 m/s, 1 mph, 2 kph.
- `elevScale` (*number*) : Échelle des couleurs d'élévation.
- `isBarsLimit` (*boolean*) : true : velLimits, false : vels.

#### `editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col)`

Dessine des sphères de fond agrandies derrière une liste de nœuds du graphe monde (mise en évidence).

- `graph` (*table|nil*) : Graphe monde.
- `drawRadiusMeters` (*number*) : Rayon de dessin autour de la caméra, en mètres.
- `nodeIds` (*integer[]*) : Identifiants de nœuds (les valeurs <= 0 sont ignorées).
- `nodeIdCount` (*integer*) : Nombre d'identifiants valides dans nodeIds.
- `sphereRadiusMul` (*number|nil*) : Multiplicateur du rayon (défaut 1.6).
- `col` (*integer|nil*) : Couleur packée (défaut style.colourNodeDull).

#### `editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters)`

Dessine les sphères des nœuds du graphe IA du monde situés dans le rayon donné autour de la caméra (requête kd-tree). La sphère est posée en nodeZ + nodeDepth + 0.05 m et colorée par groupe si groupCols existe.

- `graph` (*table|nil*) : Graphe monde (nodeCount, kdNodes, nodeX, nodeY, nodeZ, nodeDepth…).
- `drawRadiusMeters` (*number*) : Rayon de dessin autour de la caméra, en mètres.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/graph.lua`.*
