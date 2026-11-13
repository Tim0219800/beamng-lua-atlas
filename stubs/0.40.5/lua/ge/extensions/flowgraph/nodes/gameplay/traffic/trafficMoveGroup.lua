---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C
local flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C = {}

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:37
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:_executionStopped() end

--- Appelle onNodeReset() et définit data.instantTeleport=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:32
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:init() end

--- Remet l'état à 0 et oublie les ids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:41
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:onNodeReset() end

--- Hook appelé quand un groupe a été replacé ; passe à l'état 2 si le premier id correspond.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:54
---@param vehIds any table des ids du groupe replacé
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:onVehicleGroupRespawned(vehIds) end

--- Définit les valeurs prédéfinies du pin spawnMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:46
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:postInit() end

--- Machine à états : 0 lance placeGroup, 1 attend onVehicleGroupRespawned, 2 émet moved, 3 laisse passer le flux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:60
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:work() end

