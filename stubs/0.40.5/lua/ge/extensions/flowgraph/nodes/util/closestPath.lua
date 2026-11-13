---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/closestPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_closestPath_C
local flowgraph_nodes_util_closestPath_C = {}

--- Initialise lastTrackedPosValue à vec3().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:28
function flowgraph_nodes_util_closestPath_C:_executionStarted() end

--- Restaure la case Waypoints et met à jour les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:36
---@param nodeData any
function flowgraph_nodes_util_closestPath_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état de la case Waypoints.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:32
---@param res any
function flowgraph_nodes_util_closestPath_C:_onSerialize(res) end

--- Dessine la case « Waypoints » ; la modifier appelle updatePins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:41
function flowgraph_nodes_util_closestPath_C:drawCustomProperties() end

--- Crée la case à cocher « Waypoints » (BoolPtr false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:24
function flowgraph_nodes_util_closestPath_C:init() end

--- Remplace les pins posA/posB par un pin table « waypoints » (ou l'inverse) selon la case, en ne créant que les pins manquants.
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:47
function flowgraph_nodes_util_closestPath_C:updatePins() end

--- Met dist à -1 ; sur setRoute, crée la route (route:setupPathMulti) à partir des points ; suit la position (route:trackPosition) quand flow est actif et trackedPos a changé ; renvoie route.path[1].distToTarget.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:68
function flowgraph_nodes_util_closestPath_C:work() end

