---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/format.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_string_format_C
local flowgraph_nodes_string_format_C = {}

--- Restores count and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:71
---@param res any saved data
function flowgraph_nodes_string_format_C:_onDeserialized(res) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:67
---@param res any save table
function flowgraph_nodes_string_format_C:_onSerialize(res) end

--- "Count" field (min 1) that adds/removes pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:31
function flowgraph_nodes_string_format_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:145
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_string_format_C:drawMiddle(builder, style) end

--- data.pattern = '%d' and count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:22
function flowgraph_nodes_string_format_C:init() end

--- Creates the initial value_i pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:27
function flowgraph_nodes_string_format_C:postInit() end

--- Creates or deletes the value_i pins (and the associated links) to go from old to new values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:49
---@param old any current count
---@param new any new count
function flowgraph_nodes_string_format_C:updatePins(old, new) end

--- Formats the pattern with the values value_1..value_count.
---Source: lua/ge/extensions/flowgraph/nodes/string/format.lua:77
function flowgraph_nodes_string_format_C:work() end

