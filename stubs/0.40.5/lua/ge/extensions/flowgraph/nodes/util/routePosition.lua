---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/routePosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_routePosition_C
local flowgraph_nodes_util_routePosition_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:29
function flowgraph_nodes_util_routePosition_C:_executionStopped() end

--- Appelle onNodeReset (crée la route).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:25
function flowgraph_nodes_util_routePosition_C:init() end

--- Crée un nouvel objet route (variable locale du fichier, partagée entre instances).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:33
function flowgraph_nodes_util_routePosition_C:onNodeReset() end

--- Initialise la route avec route:setupPathMultiWaypoints, avance de distance avec route:stepAhead et écrit n1, n2, pos et dirVec (direction normalisée de n1 vers n2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:37
function flowgraph_nodes_util_routePosition_C:workOnce() end

