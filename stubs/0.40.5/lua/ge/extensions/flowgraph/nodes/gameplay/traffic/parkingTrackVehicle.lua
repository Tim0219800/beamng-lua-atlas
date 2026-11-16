---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C
local flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C = {}

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:34
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:_executionStopped() end

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:30
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:init() end

--- Disables the vehicle's tracking and sets the inside/outside/spotExists outputs back to false.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:38
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:reset() end

--- Enables tracking if needed, reads getTrackingData()[vehId] and detects parked / not parked transitions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua:49
function flowgraph_nodes_gameplay_traffic_parkingTrackVehicle_C:work() end

