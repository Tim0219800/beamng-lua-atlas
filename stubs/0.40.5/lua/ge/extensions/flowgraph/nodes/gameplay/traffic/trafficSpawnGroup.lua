---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C
local flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C = {}

--- Calls resetState().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:44
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:_executionStopped() end

--- Calls resetState().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:40
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:init() end

--- Deletes the vehicles created by this node (scene and editor) then resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:48
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:onNodeReset() end

--- Hook called when a group has been created; if groupId matches, registers the vehicles, publishes vehicleIds and goes to state 2.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:77
---@param vehIds any table of created vehicle ids
---@param groupId any identifier of the group created by core_multiSpawn
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:onVehicleGroupSpawned(vehIds, groupId) end

--- Defines the preset values of the spawnMode pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:69
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:postInit() end

--- Resets state, groupId, id list and flow output.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:62
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:resetState() end

--- On the first flow, launches spawnGroup (or finishes directly if the quantity is 0), then emits loaded and lets the flow through once loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:90
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:work() end

