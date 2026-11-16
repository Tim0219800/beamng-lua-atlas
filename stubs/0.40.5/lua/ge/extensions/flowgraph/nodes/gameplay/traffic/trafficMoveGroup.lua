---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C
local flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C = {}

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:37
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:_executionStopped() end

--- Calls onNodeReset() and sets data.instantTeleport=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:32
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:init() end

--- Resets the state to 0 and forgets the ids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:41
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:onNodeReset() end

--- Hook called when a group has been replaced; goes to state 2 if the first id matches.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:54
---@param vehIds any table of the replaced group's ids
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:onVehicleGroupRespawned(vehIds) end

--- Defines the preset values of the spawnMode pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:46
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:postInit() end

--- State machine: 0 launches placeGroup, 1 waits for onVehicleGroupRespawned, 2 emits moved, 3 lets the flow through.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua:60
function flowgraph_nodes_gameplay_traffic_trafficMoveGroup_C:work() end

