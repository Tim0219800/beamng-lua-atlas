---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/number.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_number_C
local flowgraph_nodes_types_number_C = {}

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/number.lua:28
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_number_C:drawMiddle(builder, style) end

--- data.value = 0 and clearOutPinsOnStart = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/number.lua:19
function flowgraph_nodes_types_number_C:init() end

--- Empty (name without underscore, unlike _onSerialize used by the other nodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/number.lua:36
---@param nodeData any saved data
function flowgraph_nodes_types_number_C:onDeserialized(nodeData) end

--- Empty (name without underscore, unlike _onSerialize used by the other nodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/number.lua:33
---@param res any save table
function flowgraph_nodes_types_number_C:onSerialize(res) end

--- Writes data.value to the output.
---Source: lua/ge/extensions/flowgraph/nodes/types/number.lua:24
function flowgraph_nodes_types_number_C:work() end

