---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_spawnPrefab_C
local flowgraph_nodes_scene_spawnPrefab_C = {}

--- Forgets the objects on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:81
function flowgraph_nodes_scene_spawnPrefab_C:_executionStopped() end

--- Empties the object list (without deleting the prefab from the scene).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:85
function flowgraph_nodes_scene_spawnPrefab_C:clearObjects() end

--- Resolves the path (with possible extensions), creates the prefab (canSave = false), puts it in MissionGroup and in modules.prefab; on failure, objects = {'failed'}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:45
function flowgraph_nodes_scene_spawnPrefab_C:createObject() end

--- Called when the node is destroyed: forgets the objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:116
function flowgraph_nodes_scene_spawnPrefab_C:destroy() end

--- Initializes the object list and origPositions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:33
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_spawnPrefab_C:init(mgr, ...) end

--- End-of-mission hook: forgets the objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:112
function flowgraph_nodes_scene_spawnPrefab_C:onClientEndMission() end

--- Restricts the path pin to .prefab.json and .prefab files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:38
function flowgraph_nodes_scene_spawnPrefab_C:postInit() end

--- Handles reset (forgets the prefab), resetVeh (restores the vehicle positions) and creates the prefab only once per flow; writes created, flow and success.
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua:89
function flowgraph_nodes_scene_spawnPrefab_C:work() end

