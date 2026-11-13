---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendu des barres de vitesse et du graphe de navigation IA (lignée roadArchitect / drivePath) : barres et courbe de vitesses, sélection de nœuds du navgraph et surcouche du graphe IA du monde. Séparé de render.lua car seuls les outils de graphe et de vitesse l'utilisent. Module composite qui dessine via render/spheres, lines, tris et markup, avec sa propre réserve de vec3 temporaires.
--- Accès : extension `editor_toolUtilities_render_graph` : `extensions.load("editor_toolUtilities_render_graph")`, puis la globale `editor_toolUtilities_render_graph`
---@class editor_toolUtilities_render_graph
editor_toolUtilities_render_graph = {}

--- Dessine les nœuds navGraph choisis avec une grosse sphère pulsée (pour indiquer qu'ils font partie de la sélection) et une étiquette numérotée.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:249
---@param nodes table Liste de clés de nœuds choisis.
---@param graphData table Données de graphe avec le champ nodes.
function editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData) end

--- Dessine un chemin de graphe : sphères de nœuds de chemin et lignes entre nœuds consécutifs.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:236
---@param path table Liste de clés de nœuds dans graphData.nodes.
---@param graphData table Données de graphe avec le champ nodes.
function editor_toolUtilities_render_graph.renderGraphPath(path, graphData) end

--- Dessine le graphe de navigation : rubans triangulés entre sphères, ligne centrale et sphères de nœuds avec halo. Le nœud survolé pulse.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:204
---@param navGraph table|nil Graphe avec lines (pL, pR, qL, qR, cL, cR) et nodes (table de vec3).
---@param hoverNode vec3|nil Nœud survolé (comparé par identité).
function editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode) end

--- Dessine les barres de vitesse d'une spline : courbe plafond (Catmull-Rom sur barPoints) colorée selon la hauteur, lignes de chute vers le sol et étiquettes de vitesse à chaque point. Sans effet pour moins de 2 nœuds.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:31
---@param spline table Spline avec nodes, barPoints, vels, velLimits, isLoop.
---@param isBarsLimit boolean true : utilise velLimits (limites), false : vels (valeurs réelles).
---@param unitsInt integer Unité d'affichage : 0 m/s, 1 mph, 2 kph.
---@param elevScale number Hauteur correspondant au rouge de la rampe de couleur.
function editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale) end

--- Comme renderVelocities pour un chemin de graphe : si spline.divPoints existe, la courbe suit le chemin navgraph calculé et les vitesses sont interpolées linéairement entre les nœuds choisis (graphNodes/graphPath) ; sinon repli sur barPoints. Étiquettes seulement aux nœuds choisis.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:70
---@param spline table Spline avec graphNodes, graphPath, divPoints, barPoints, vels, velLimits, isLoop.
---@param unitsInt integer Unité d'affichage : 0 m/s, 1 mph, 2 kph.
---@param elevScale number Échelle des couleurs d'élévation.
---@param isBarsLimit boolean true : velLimits, false : vels.
function editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit) end

--- Dessine des sphères de fond agrandies derrière une liste de nœuds du graphe monde (mise en évidence).
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:302
---@param graph table|nil Graphe monde.
---@param drawRadiusMeters number Rayon de dessin autour de la caméra, en mètres.
---@param nodeIds integer[] Identifiants de nœuds (les valeurs <= 0 sont ignorées).
---@param nodeIdCount integer Nombre d'identifiants valides dans nodeIds.
---@param sphereRadiusMul number|nil Multiplicateur du rayon (défaut 1.6).
---@param col integer|nil Couleur packée (défaut style.colourNodeDull).
function editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col) end

--- Dessine les sphères des nœuds du graphe IA du monde situés dans le rayon donné autour de la caméra (requête kd-tree). La sphère est posée en nodeZ + nodeDepth + 0.05 m et colorée par groupe si groupCols existe.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:258
---@param graph table|nil Graphe monde (nodeCount, kdNodes, nodeX, nodeY, nodeZ, nodeDepth…).
---@param drawRadiusMeters number Rayon de dessin autour de la caméra, en mètres.
function editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters) end

