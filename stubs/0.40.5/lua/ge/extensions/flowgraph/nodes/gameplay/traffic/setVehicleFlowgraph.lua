---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C
local flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C = {}

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:41
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:_executionStopped() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:35
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:init() end

--- Supprime le flowgraph du rôle du véhicule mémorisé (clearFlowgraph) et oublie vehId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:45
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:onNodeReset() end

--- Copie les valeurs de tous les pins d'entrée non fixes dans varData et appelle veh.role:setupFlowgraph(fgFile, varData) pour le véhicule vehId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:55
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:workOnce() end

