---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/nodePreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Preview class (windowKind = 'nodePreview').
---@class editor_flowgraph_nodePreview_C
local editor_flowgraph_nodePreview_C = {}

--- Associates the manager and creates the dummy 'nodePreview' graph.
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:13
---@param mgr table|nil Flowgraph manager.
function editor_flowgraph_nodePreview_C:attach(mgr) end

--- Draws the preview tooltip if an element is hovered, saving/restoring the current editor.
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:47
function editor_flowgraph_nodePreview_C:draw() end

--- Initializes the state (hover, "node" mode, preview size 200x200).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:20
function editor_flowgraph_nodePreview_C:init() end

--- Sets the hovered element as a graph (graph mode).
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:41
---@param graph table Graph.
function editor_flowgraph_nodePreview_C:setGraph(graph) end

--- Sets the hovered element as a macro (macro mode).
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:36
---@param macro table Macro.
function editor_flowgraph_nodePreview_C:setMacro(macro) end

--- Sets the hovered element as a library node (node mode).
---Source: lua/ge/extensions/editor/flowgraph/nodePreview.lua:30
---@param node table Library entry (path, node, create).
function editor_flowgraph_nodePreview_C:setNode(node) end

