---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_getMultipleButtons_C
local flowgraph_nodes_ui_buttons_getMultipleButtons_C = {}

--- Restores the node's state from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:94
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:_onDeserialized(res) end

--- Writes the node's state to the save table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:90
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:_onSerialize(res) end

--- Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:29
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:drawCustomProperties() end

--- Draws the central area of the node in the flowgraph editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:25
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:drawMiddle(builder, style) end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:21
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:init() end

--- Adjusts the number of triplets (input buttonId_i, outputs clicked_i and buttonId_i) by removing extra links and pins or creating the new ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:46
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:updatePins(old, new) end

--- For each i, reads the button buttonId_i and copies button.clicked to "clicked_i".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:78
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:work() end

