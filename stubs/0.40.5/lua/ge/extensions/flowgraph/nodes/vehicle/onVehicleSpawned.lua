---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onVehicleSpawned_C
local flowgraph_nodes_vehicle_onVehicleSpawned_C = {}

--- Called by the manager after the node is triggered; resets the event flag to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua:52
function flowgraph_nodes_vehicle_onVehicleSpawned_C:_afterTrigger() end

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua:32
function flowgraph_nodes_vehicle_onVehicleSpawned_C:_executionStarted() end

--- Empty constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua:28
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_onVehicleSpawned_C:init(mgr, ...) end

--- Hook called when a vehicle is created; stores `id` and raises the flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua:37
---@param id integer Id of the created vehicle.
function flowgraph_nodes_vehicle_onVehicleSpawned_C:onVehicleSpawned(id) end

--- If the flag is raised, fills `vehId` and sets `flow` to true for one frame, otherwise false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua:42
---@param args any
function flowgraph_nodes_vehicle_onVehicleSpawned_C:work(args) end

