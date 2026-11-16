---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_randomConfigProvider_C
local flowgraph_nodes_vehicle_randomConfigProvider_C = {}

--- Builds the `options` list of eligible models/configs if it does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:46
function flowgraph_nodes_vehicle_randomConfigProvider_C:_executionStarted() end

--- Empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:92
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_randomConfigProvider_C:_onDeserialized(nodeData) end

--- Empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:88
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_randomConfigProvider_C:_onSerialize(res) end

--- Draws nothing; returns nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:34
function flowgraph_nodes_vehicle_randomConfigProvider_C:drawCustomProperties() end

--- ImGui display in the center of the node in the flowgraph editor; purely visual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:41
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_randomConfigProvider_C:drawMiddle(builder, style) end

--- Constructor; initializes the model/config fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:24
function flowgraph_nodes_vehicle_randomConfigProvider_C:init() end

--- Draws a random model, config and paint and writes them to the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:74
function flowgraph_nodes_vehicle_randomConfigProvider_C:workOnce() end

