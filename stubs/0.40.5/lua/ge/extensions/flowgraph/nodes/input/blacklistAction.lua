---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_input_blacklistAction_C
local flowgraph_nodes_input_blacklistAction_C = {}

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:264
---@param data table saved node data
function flowgraph_nodes_input_blacklistAction_C:_onDeserialized(data) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:260
---@param res table serialization table to fill
function flowgraph_nodes_input_blacklistAction_C:_onSerialize(res) end

--- Draws the action list editor (presets, add by search or category, current list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:113
function flowgraph_nodes_input_blacklistAction_C:drawCustomProperties() end

--- Displays the number of actions and renames the node to Block/Allow Input Actions if block is hard-coded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:271
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_input_blacklistAction_C:drawMiddle(builder, style) end

--- Draws the action search field and updates the results.
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:60
function flowgraph_nodes_input_blacklistAction_C:drawSearchInput() end

--- Draws `label`, highlighting the occurrences of `highlightText`.
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:87
---@param label any text to display
---@param highlightText any text to highlight
function flowgraph_nodes_input_blacklistAction_C:highlightText(label, highlightText) end

--- Initializes the list with the Scenario preset and the search engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:31
function flowgraph_nodes_input_blacklistAction_C:init() end

--- Registers the list in the flowgraph action module (registerList) if not already done, then calls blockActions(id) or allowActions(id).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:282
function flowgraph_nodes_input_blacklistAction_C:workOnce() end

