---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_elemental_imNumbers_C
local flowgraph_nodes_ui_imgui_elemental_imNumbers_C = {}

--- Clears the outputs and the value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:59
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_executionStarted() end

--- Restores the mode (default 'Int').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:120
---@param nodeData table Saved node data.
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_onDeserialized(nodeData) end

--- Saves the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:116
---@param res table Node save table to fill.
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_onSerialize(res) end

--- Edit mode combo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:45
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:drawCustomProperties() end

--- List of modes and mode = 'Int'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:33
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:init() end

--- Draws the widget of the chosen mode, clamps the value and writes value/changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:66
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:work() end

