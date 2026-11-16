---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/string.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_string_C
local flowgraph_nodes_types_string_C = {}

--- Restores the string (supports the old data.value format) and multiLine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:80
---@param nodeData any saved data
function flowgraph_nodes_types_string_C:_onDeserialized(nodeData) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:75
---@param res any save table
function flowgraph_nodes_types_string_C:_onSerialize(res) end

--- "Multi Line" checkbox and input field (2048-character buffer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:29
function flowgraph_nodes_types_string_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:58
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_string_C:drawMiddle(builder, style) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:72
function flowgraph_nodes_types_string_C:drawProperties() end

--- string = 'Hello World', multiLine = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:20
function flowgraph_nodes_types_string_C:init() end

--- Writes the string to the output.
---Source: lua/ge/extensions/flowgraph/nodes/types/string.lua:25
function flowgraph_nodes_types_string_C:work() end

