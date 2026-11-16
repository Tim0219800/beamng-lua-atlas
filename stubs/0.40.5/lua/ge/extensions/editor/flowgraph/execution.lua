---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/execution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Task Manager window class (windowName = 'fg_execution').
---@class editor_flowgraph_execution_C
local editor_flowgraph_execution_C = {}

--- Draws the content: Projects header, Start All / Stop All buttons, then each project.
---Source: lua/ge/extensions/editor/flowgraph/execution.lua:132
function editor_flowgraph_execution_C:ExecutionView() end

--- Draws the window if it is visible.
---Source: lua/ge/extensions/editor/flowgraph/execution.lua:189
function editor_flowgraph_execution_C:draw() end

--- Displays the window outside a project's context (self.mgr = nil).
---Source: lua/ge/extensions/editor/flowgraph/execution.lua:181
function editor_flowgraph_execution_C:drawAlone() end

--- Draws a project's row: state icon, visibility, transient, name and buttons.
---Source: lua/ge/extensions/editor/flowgraph/execution.lua:22
---@param mgr table Flowgraph manager.
function editor_flowgraph_execution_C:drawManager(mgr) end

--- Gets core_flowgraphManager and registers the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/execution.lua:16
function editor_flowgraph_execution_C:init() end

