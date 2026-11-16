---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_imDialogue_C
local flowgraph_nodes_ui_imgui_imDialogue_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:127
function flowgraph_nodes_ui_imgui_imDialogue_C:_executionStopped() end

--- Restores options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:122
---@param nodeData table Saved node data.
function flowgraph_nodes_ui_imgui_imDialogue_C:_onDeserialized(nodeData) end

--- Saves options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:118
---@param res table Node save table to fill.
function flowgraph_nodes_ui_imgui_imDialogue_C:_onSerialize(res) end

--- Button list editing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:35
function flowgraph_nodes_ui_imgui_imDialogue_C:drawCustomProperties() end

--- Default options {accept, decline}, wrapSize = 500.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:26
function flowgraph_nodes_ui_imgui_imDialogue_C:init() end

--- Closes the window (open = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:135
function flowgraph_nodes_ui_imgui_imDialogue_C:onNodeReset() end

--- Creates the option pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:31
function flowgraph_nodes_ui_imgui_imDialogue_C:postInit() end

--- Recreates the option pins.
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:72
function flowgraph_nodes_ui_imgui_imDialogue_C:updateButtons() end

--- If open, draws the window, the text and the buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:139
function flowgraph_nodes_ui_imgui_imDialogue_C:work() end

--- Opens the window (open = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:131
function flowgraph_nodes_ui_imgui_imDialogue_C:workOnce() end

