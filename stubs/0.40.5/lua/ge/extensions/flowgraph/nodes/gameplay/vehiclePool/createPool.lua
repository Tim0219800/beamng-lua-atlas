---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_vehiclePool_createPool_C
local flowgraph_nodes_gameplay_vehiclePool_createPool_C = {}

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:27
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:_executionStopped() end

--- Displays the "Keep Inactive Vehicles" checkbox (data.keepVehicles).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:38
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:drawCustomProperties() end

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:23
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:init() end

--- Deletes the created pool (deletePool) and forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:31
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:onNodeReset() end

--- Creates the pool if it does not exist and publishes it on vehPool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:45
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:workOnce() end

