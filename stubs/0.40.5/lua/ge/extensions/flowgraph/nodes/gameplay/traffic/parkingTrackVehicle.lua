---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C
local flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C = {}

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:34
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:_executionStopped() end

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:30
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:init() end

--- Désactive le suivi du véhicule et remet les sorties inside/outside/spotExists à false.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:38
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:reset() end

--- Active le suivi si besoin, lit getTrackingData()[vehId] et détecte les passages garé / non garé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:49
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:work() end

