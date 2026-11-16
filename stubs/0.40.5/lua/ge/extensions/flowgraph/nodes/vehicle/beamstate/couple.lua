---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_beamstate_couple_C
local flowgraph_nodes_vehicle_beamstate_couple_C = {}

--- ImGui display in the center of the node in the flowgraph editor; purely visual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:52
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_beamstate_couple_C:drawMiddle(builder, style) end

--- Constructor; sets `data.mode = "activate"` (parameters `mgr, ...` ignored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:26
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_beamstate_couple_C:init(mgr, ...) end

--- Sends the beamstate command matching `data.mode` to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:30
function flowgraph_nodes_vehicle_beamstate_couple_C:work() end

