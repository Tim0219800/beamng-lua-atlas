---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_bus_busControls_C
local flowgraph_nodes_vehicle_bus_busControls_C = {}

--- Resets both outputs to false at start (note: name without underscore, so never called by the manager, which calls `_executionStarted`).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:32
function flowgraph_nodes_vehicle_bus_busControls_C:executionStarted() end

--- Constructor; sets `isKneeling` and `doorsOpen` to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:21
function flowgraph_nodes_vehicle_bus_busControls_C:init() end

--- Updates `isKneeling`, `doorsOpen` from the manager's `vehicle` module and activates the output flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:26
function flowgraph_nodes_vehicle_bus_busControls_C:work() end

