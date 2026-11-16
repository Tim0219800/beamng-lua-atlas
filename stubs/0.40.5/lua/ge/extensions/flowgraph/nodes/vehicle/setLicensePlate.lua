---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_setLicensePlate_C
local flowgraph_nodes_vehicle_setLicensePlate_C = {}

--- Resets `ready = true`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua:28
function flowgraph_nodes_vehicle_setLicensePlate_C:_executionStopped() end

--- Constructor; `ready = true` (parameters `mgr, ...` ignored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua:24
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_setLicensePlate_C:init(mgr, ...) end

--- Handles `reset`, then, if `ready` and `flow`, applies the text and emits the output flow only once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua:32
function flowgraph_nodes_vehicle_setLicensePlate_C:work() end

