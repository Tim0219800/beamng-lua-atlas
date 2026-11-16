---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_customVlua_string_C
local flowgraph_nodes_vehicle_special_customVlua_string_C = {}

--- Empty central display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua:48
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_special_customVlua_string_C:drawMiddle(builder, style) end

--- Constructor; tries to copy `pinIn.customLUAString.value` into `data.func` (nonexistent pin).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua:27
function flowgraph_nodes_vehicle_special_customVlua_string_C:init() end

--- Sends `customLUA` to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua:33
function flowgraph_nodes_vehicle_special_customVlua_string_C:work() end

