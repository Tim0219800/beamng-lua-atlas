---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C
local flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C = {}

--- Restores the node's state from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:107
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:_onDeserialized(res) end

--- Writes the node's state to the save table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:103
---@param res table Node save table to fill.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:_onSerialize(res) end

--- Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:31
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:drawCustomProperties() end

--- Draws the central area of the node in the flowgraph editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:27
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:drawMiddle(builder, style) end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:23
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:init() end

--- Adjusts the number of groups of 5 input pins (buttonId, label, active, order, style).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:48
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:updatePins(old, new) end

--- For each i whose button exists, applies the non-nil properties.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:89
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:work() end

