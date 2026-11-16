---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/overview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_treeview', windowDescription 'Overview').
---@class editor_flowgraph_overview_C
local editor_flowgraph_overview_C = {}

--- Draws the window content: filter, debug button, sorted list of root graphs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:210
function editor_flowgraph_overview_C:TreeView() end

--- Stores the current manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:21
---@param mgr table Flowgraph manager.
function editor_flowgraph_overview_C:attach(mgr) end

--- Draws the window if it is visible (calls TreeView).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:289
function editor_flowgraph_overview_C:draw() end

--- Draws a graph of the tree (and recursively its children).
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:79
---@param graph table Graph to draw.
function editor_flowgraph_overview_C:drawGraph(graph) end

--- Draws the "nodeOverviewPopup" popup: Focus (selects the node and navigates to it) and Delete (graph:deleteNode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:25
function editor_flowgraph_overview_C:drawPopups() end

--- Fills self.passedGraphIds with the ids of the graphs and macros whose name (or a node, depending on the preference) passes the filter.
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:175
function editor_flowgraph_overview_C:fillPassedGraphsArray() end

--- Creates the text filter and registers the window (150x300, hidden by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:15
function editor_flowgraph_overview_C:init() end

--- Selects a node in the editor (fge.SelectNode).
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:299
---@param node table Node (uses node.id).
---@param append boolean Add to the selection.
function editor_flowgraph_overview_C:selectNode(node, append) end

--- Indicates whether a graph must be hidden: false if it (or one of its parents) passes the filter, otherwise true except for the current graph.
---Source: lua/ge/extensions/editor/flowgraph/overview.lua:47
---@param graph table Graph tested.
---@return boolean  true if the graph must be skipped.
function editor_flowgraph_overview_C:skipDrawing(graph) end

