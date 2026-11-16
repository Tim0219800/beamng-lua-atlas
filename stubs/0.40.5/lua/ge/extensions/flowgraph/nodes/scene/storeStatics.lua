---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_storeStatics_C
local flowgraph_nodes_scene_storeStatics_C = {}

--- Detects whether stored objects already exist in the scene.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:224
function flowgraph_nodes_scene_storeStatics_C:_executionStarted() end

--- Deletes the objects unless they existed before start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:233
function flowgraph_nodes_scene_storeStatics_C:_executionStopped() end

--- Restores storedObjects and forgets the current ids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:321
---@param nodeData any saved data
function flowgraph_nodes_scene_storeStatics_C:_onDeserialized(nodeData) end

--- Saves storedObjects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:317
---@param res any save table
function flowgraph_nodes_scene_storeStatics_C:_onSerialize(res) end

--- Deletes all created objects and forgets their ids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:239
function flowgraph_nodes_scene_storeStatics_C:clearObjects() end

--- Creates a TSStatic from the stored data and returns its id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:194
---@param pos any {x,y,z} table
---@param rot any {x,y,z,w} table
---@param scl any {x,y,z} table
---@param shape any shape path
function flowgraph_nodes_scene_storeStatics_C:createObject(pos, rot, scl, shape) end

--- Deletes the objects unless they existed before start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:309
function flowgraph_nodes_scene_storeStatics_C:destroy() end

--- Editor panel: list of stored objects, buttons Store Selected, Spawn All, Despawn All, Select All, Clear Storage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:33
function flowgraph_nodes_scene_storeStatics_C:drawCustomProperties() end

--- Initializes objects and storedObjects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:28
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_storeStatics_C:init(mgr, ...) end

--- End-of-mission hook: cleans up the objects created by the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:305
function flowgraph_nodes_scene_storeStatics_C:onClientEndMission() end

--- Creates all stored objects (if none exists or if force).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:265
---@param force any boolean: recreate even if they exist
function flowgraph_nodes_scene_storeStatics_C:spawnObjects(force) end

--- Replaces the storage with the given TSStatics (captures their transform), deletes the originals then recreates them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:145
---@param ids any list of scene object ids
function flowgraph_nodes_scene_storeStatics_C:updateStoredObjects(ids) end

--- On reset, deletes; on flow, spawns the stored objects and activates flow on output.
---Source: lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:292
function flowgraph_nodes_scene_storeStatics_C:work() end

