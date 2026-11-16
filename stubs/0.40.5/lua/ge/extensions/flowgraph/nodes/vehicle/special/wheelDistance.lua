---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_wheelDistance_C
local flowgraph_nodes_vehicle_special_wheelDistance_C = {}

--- Computes the signed distance between `target` and the closest wheels of the vehicle `vehicle`.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:64
---@param vehicle userdata Vehicle object.
---@param target vec3 Target point.
function flowgraph_nodes_vehicle_special_wheelDistance_C:calculateDistanceFromStart(vehicle, target) end

--- Empty central display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:135
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_special_wheelDistance_C:drawMiddle(builder, style) end

--- Constructor; `data.debug = false`, `data.onlyUseFrontWheels = true`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:32
function flowgraph_nodes_vehicle_special_wheelDistance_C:init() end

--- Reads the vehicle and the position then writes `distance`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:122
function flowgraph_nodes_vehicle_special_wheelDistance_C:work() end

