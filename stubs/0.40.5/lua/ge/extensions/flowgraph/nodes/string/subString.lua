---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/subString.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_string_subString_C
local flowgraph_nodes_string_subString_C = {}

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/subString.lua:27
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_string_subString_C:drawMiddle(builder, style) end

--- data.from = 0, data.to = -1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/subString.lua:22
function flowgraph_nodes_string_subString_C:init() end

--- Writes string.sub(value, from, to).
---Source: lua/ge/extensions/flowgraph/nodes/string/subString.lua:32
function flowgraph_nodes_string_subString_C:work() end

