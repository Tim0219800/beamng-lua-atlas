---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_input_blacklistActionFilter_C
local flowgraph_nodes_input_blacklistActionFilter_C = {}

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:58
---@param data table saved node data
function flowgraph_nodes_input_blacklistActionFilter_C:_onDeserialized(data) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:54
---@param res table serialization table to fill
function flowgraph_nodes_input_blacklistActionFilter_C:_onSerialize(res) end

--- Draws one checkbox per action template, with the number of actions in a tooltip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:32
function flowgraph_nodes_input_blacklistActionFilter_C:drawCustomProperties() end

--- Renames the node to Block/Allow Input Actions by Filters if block is hard-coded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:65
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_input_blacklistActionFilter_C:drawMiddle(builder, style) end

--- Enables the default templates.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:25
function flowgraph_nodes_input_blacklistActionFilter_C:init() end

--- Creates the list via core_input_actionFilter.createActionTemplate(active templates), registers it then blocks or allows the actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:74
function flowgraph_nodes_input_blacklistActionFilter_C:workOnce() end

