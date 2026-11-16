---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_simpleMultipleButtons_C
local flowgraph_nodes_ui_buttons_simpleMultipleButtons_C = {}

--- Initializes hiddenAfterDone/hiddenAfterReset to false for each button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:34
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_executionStarted() end

--- Restores the node's state from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:168
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_onDeserialized(res) end

--- Writes the node's state to the save table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:164
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_onSerialize(res) end

--- Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:43
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:drawCustomProperties() end

--- Empty central area.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:30
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:drawMiddle(builder, style) end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:26
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:init() end

--- Disables each button once and resets hiddenAfterDone to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:123
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:onNodeReset() end

--- Adjusts the number of pin groups (4 inputs, 4 outputs per button).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:60
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:updatePins(old, new) end

--- For each button, updates clicked/complete/incomplete and disables it if hideWhenDone is set and it is completed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:146
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:work() end

--- Creates all the buttons and writes their ids (see notes: bug).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:135
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:workOnce() end

