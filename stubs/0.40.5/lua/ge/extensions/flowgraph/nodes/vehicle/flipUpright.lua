---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_flipUpright_C
local flowgraph_nodes_vehicle_flipUpright_C = {}

--- Empty constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:24
function flowgraph_nodes_vehicle_flipUpright_C:init() end

--- Teleports the vehicle in place, upright, and calls `extensions.hook('onVehicleFlippedUpright', vehId)`.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:33
function flowgraph_nodes_vehicle_flipUpright_C:resetVehicle() end

--- Calls `resetVehicle` and copies the input flow to the output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:28
function flowgraph_nodes_vehicle_flipUpright_C:work() end

