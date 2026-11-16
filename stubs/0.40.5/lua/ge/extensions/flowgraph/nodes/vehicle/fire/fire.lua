---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_fire_fire_C
local flowgraph_nodes_vehicle_fire_fire_C = {}

--- Sets `done = false` (unused field).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:52
function flowgraph_nodes_vehicle_fire_fire_C:_executionStarted() end

--- Called when the project loads; restores the node's settings from `nodeData`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:77
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_fire_fire_C:_onDeserialized(nodeData) end

--- Called when the project is saved; copies the node's settings into the `res` table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:73
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_fire_fire_C:_onSerialize(res) end

--- ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:38
function flowgraph_nodes_vehicle_fire_fire_C:drawCustomProperties() end

--- ImGui display in the center of the node in the flowgraph editor; purely visual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:67
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_fire_fire_C:drawMiddle(builder, style) end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:26
function flowgraph_nodes_vehicle_fire_fire_C:init() end

--- Sends the `interactFire` action with the selected function to the vehicle `vehId`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:56
function flowgraph_nodes_vehicle_fire_fire_C:workOnce() end

