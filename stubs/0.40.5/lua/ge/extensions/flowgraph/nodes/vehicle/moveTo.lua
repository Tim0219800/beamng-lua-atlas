---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_moveTo_C
local flowgraph_nodes_vehicle_moveTo_C = {}

--- Empty constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:31
function flowgraph_nodes_vehicle_moveTo_C:init() end

--- Moves the vehicle according to `pos`/`rot` and the options, then `extensions.hook('trackVehReset')`.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:39
function flowgraph_nodes_vehicle_moveTo_C:resetVehicle() end

--- Calls `resetVehicle`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:35
function flowgraph_nodes_vehicle_moveTo_C:work() end

