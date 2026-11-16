---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/match.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_string_match_C
local flowgraph_nodes_string_match_C = {}

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/match.lua:31
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_string_match_C:drawMiddle(builder, style) end

--- data.pattern = '%d'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/match.lua:23
function flowgraph_nodes_string_match_C:init() end

--- Calls string.match(value, data.pattern.value) and writes the result.
---Source: lua/ge/extensions/flowgraph/nodes/string/match.lua:27
function flowgraph_nodes_string_match_C:work() end

