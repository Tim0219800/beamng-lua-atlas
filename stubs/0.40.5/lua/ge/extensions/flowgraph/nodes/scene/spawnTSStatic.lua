---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_spawnTSStatic_C
local flowgraph_nodes_scene_spawnTSStatic_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:100
function flowgraph_nodes_scene_spawnTSStatic_C:_executionStopped() end

--- Creates the TSStatic (canSave = false), registers it under spawnedObj_<time>_<id>_<n>, writes lastId and notifies the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:41
---@param objectName any unused
function flowgraph_nodes_scene_spawnTSStatic_C:createObject(objectName) end

--- Called when the node is destroyed: cleans up the created objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:136
function flowgraph_nodes_scene_spawnTSStatic_C:destroy() end

--- Initializes the object list and data.maxObjectCount = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:35
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_spawnTSStatic_C:init(mgr, ...) end

--- End-of-mission hook: cleans up the objects created by the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:132
function flowgraph_nodes_scene_spawnTSStatic_C:onClientEndMission() end

--- Deletes all created objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:104
function flowgraph_nodes_scene_spawnTSStatic_C:onNodeReset() end

--- Drops created back to false on the next frame.
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:121
function flowgraph_nodes_scene_spawnTSStatic_C:work() end

--- Creates the object and raises created.
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua:116
function flowgraph_nodes_scene_spawnTSStatic_C:workOnce() end

