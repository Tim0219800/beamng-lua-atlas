---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_customVlua_C
local flowgraph_nodes_vehicle_special_customVlua_C = {}

--- Migration of old projects: moves `data.func` to a hardcoded pin `func`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:49
---@param data any
function flowgraph_nodes_vehicle_special_customVlua_C:_onDeserialized(data) end

--- Empty central display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:45
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_special_customVlua_C:drawMiddle(builder, style) end

--- Sends `func` to the vehicle and copies `vehId` to the output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:31
function flowgraph_nodes_vehicle_special_customVlua_C:work() end

