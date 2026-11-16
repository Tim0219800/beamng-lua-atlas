---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_removePrefab_C
local flowgraph_nodes_scene_removePrefab_C = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua:24
function flowgraph_nodes_scene_removePrefab_C:_executionStopped() end

--- Calls the prefab module's deletePrefab(id, true) on every execution with flow.
---Source: lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua:20
function flowgraph_nodes_scene_removePrefab_C:work() end

