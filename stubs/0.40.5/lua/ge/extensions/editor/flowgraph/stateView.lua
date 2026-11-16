---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/stateView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_stateView', windowDescription 'State View'). The methods are those called by flowgraphEditor via basewindow.
---@class editor_flowgraph_stateView_C
local editor_flowgraph_stateView_C = {}

--- Stores the current flowgraph manager in self.mgr. Called on each manager change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/stateView.lua:18
---@param mgr table Flowgraph manager to display.
function editor_flowgraph_stateView_C:attach(mgr) end

--- Draws the "States View" window if it is visible, from self.mgr.stateGraph. Called every frame by drawEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/stateView.lua:63
function editor_flowgraph_stateView_C:draw() end

--- Draws in two columns the graph name (in brackets, preceded by ' - ' per depth level) then its states with the play_circle_filled icon (running) or pause_circle_outline (stopped), then descends into the child graphs.
---Source: lua/ge/extensions/editor/flowgraph/stateView.lua:22
---@param graph table Graph to walk.
---@param depth integer Indentation depth (0 for the root).
function editor_flowgraph_stateView_C:drawStategraphRecursive(graph, depth) end

--- Creates the ImGui text filter and registers the window in the editor (size 150x300, hidden by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/stateView.lua:13
function editor_flowgraph_stateView_C:init() end

--- Selects a node in the graph editor (fge.SelectNode).
---Source: lua/ge/extensions/editor/flowgraph/stateView.lua:75
---@param node table Flowgraph node (uses node.id).
---@param append boolean Add to the existing selection.
function editor_flowgraph_stateView_C:selectNode(node, append) end

