---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_toggleVehicleControls_C
local flowgraph_nodes_vehicle_toggleVehicleControls_C = {}

--- Re-enables the action map when the project stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua:30
function flowgraph_nodes_vehicle_toggleVehicleControls_C:_executionStopped() end

--- Empty constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua:20
function flowgraph_nodes_vehicle_toggleVehicleControls_C:init() end

--- Enables/disables the `VehicleCommonActionMap` action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua:25
function flowgraph_nodes_vehicle_toggleVehicleControls_C:work() end

