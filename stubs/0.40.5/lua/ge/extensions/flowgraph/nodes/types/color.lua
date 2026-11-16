---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/color.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_color_C
local flowgraph_nodes_types_color_C = {}

--- Restores clr (padded to 8 values) and mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:84
---@param nodeData any saved data
function flowgraph_nodes_types_color_C:_onDeserialized(nodeData) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:79
---@param res any save table
function flowgraph_nodes_types_color_C:_onSerialize(res) end

--- Creates the number input pins r, g, b, a.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:110
function flowgraph_nodes_types_color_C:createColorPins() end

--- Mode choice, creation/deletion of the r/g/b/a pins and color picker (editor.uiColorEdit8).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:26
function flowgraph_nodes_types_color_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:106
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_color_C:drawMiddle(builder, style) end

--- clr = {1,1,1,1}, mode = 'custom', modes = {'custom','from Pin'}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:20
function flowgraph_nodes_types_color_C:init() end

--- Writes the color (from the pins in 'from Pin' mode, otherwise clr).
---Source: lua/ge/extensions/flowgraph/nodes/types/color.lua:98
function flowgraph_nodes_types_color_C:work() end

