---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_thread_loadProject_C
local flowgraph_nodes_thread_loadProject_C = {}

--- Resets targetId to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:33
function flowgraph_nodes_thread_loadProject_C:_executionStarted() end

--- Resets targetId to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:37
function flowgraph_nodes_thread_loadProject_C:_executionStopped() end

--- Initializes targetId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:23
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_thread_loadProject_C:init(mgr, ...) end

--- Restricts path to "Flowgraph Files" (.flow.json).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:27
function flowgraph_nodes_thread_loadProject_C:postInit() end

--- Resolves the path (with or without the .flow.json extension), starts the project and writes its id.
---Source: lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua:41
function flowgraph_nodes_thread_loadProject_C:workOnce() end

