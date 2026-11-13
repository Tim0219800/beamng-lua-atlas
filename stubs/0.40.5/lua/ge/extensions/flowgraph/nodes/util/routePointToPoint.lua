---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_routePointToPoint_C
local flowgraph_nodes_util_routePointToPoint_C = {}

--- Pour chaque position, trouve la route la plus proche (map.findClosestRoad) et retient le nœud le plus proche ; si l'une échoue, ne fait rien. Puis calcule map.getPath(depart, arrivee, nil, 1000 ou 1) et l'écrit sur la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua:24
function flowgraph_nodes_util_routePointToPoint_C:workOnce() end

