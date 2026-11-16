---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_beamstate_beamstate_C
local flowgraph_nodes_vehicle_beamstate_beamstate_C = {}

--- Called when the project loads; restores the node's settings from `nodeData`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:69
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_beamstate_beamstate_C:_onDeserialized(nodeData) end

--- Called when the project is saved; copies the node's settings into the `res` table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:65
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_beamstate_beamstate_C:_onSerialize(res) end

--- ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:34
function flowgraph_nodes_vehicle_beamstate_beamstate_C:drawCustomProperties() end

--- ImGui display in the center of the node in the flowgraph editor; purely visual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:59
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_beamstate_beamstate_C:drawMiddle(builder, style) end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:25
function flowgraph_nodes_vehicle_beamstate_beamstate_C:init() end

--- Sends `beamstate.<chosen function>()` to the vehicle `vehId` via `queueLuaCommand`. Does nothing if the vehicle does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua:48
function flowgraph_nodes_vehicle_beamstate_beamstate_C:workOnce() end

