---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_spawnVehicle_C
local flowgraph_nodes_vehicle_spawnVehicle_C = {}

--- Resets the state and the outputs at start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:93
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStarted() end

--- Resets the state and the vehicle reference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:85
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStopped() end

--- Central display of the node, empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:237
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_spawnVehicle_C:drawMiddle(builder, style) end

--- Builds a Lua command to call `buttonPushed(action)` on this node from another VM (inferred from code).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:233
---@param action string|nil Action passed to `buttonPushed`.
function flowgraph_nodes_vehicle_spawnVehicle_C:getCmd(action) end

--- Constructor; state 1, `flow` output false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:55
function flowgraph_nodes_vehicle_spawnVehicle_C:init() end

--- Called when the spawn fails: schedules a new attempt (1 s) or gives up after 10 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:62
function flowgraph_nodes_vehicle_spawnVehicle_C:onSpawnFailed() end

--- Marks the `color` pin with `colorSetup = {vehicleColor = true}`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:79
function flowgraph_nodes_vehicle_spawnVehicle_C:postInit() end

--- Resets the timer and the accumulated spawn failure time to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:50
function flowgraph_nodes_vehicle_spawnVehicle_C:resetSpawnRetry() end

--- Spawn state machine (see module); also handles `reset`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:103
function flowgraph_nodes_vehicle_spawnVehicle_C:work() end

