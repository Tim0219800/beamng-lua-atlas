---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_spawnLight_C
local flowgraph_nodes_scene_spawnLight_C = {}

--- Deletes the lights on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:76
function flowgraph_nodes_scene_spawnLight_C:_executionStopped() end

--- Deletes all created lights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:79
function flowgraph_nodes_scene_spawnLight_C:clearObjects() end

--- Creates the light with the pin values (canSave = false), adds it to the list, writes lastId and notifies the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:38
---@param objectName any unused (the computed name is not applied)
function flowgraph_nodes_scene_spawnLight_C:createObject(objectName) end

--- Called when the node is destroyed: cleans up the created objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:134
function flowgraph_nodes_scene_spawnLight_C:destroy() end

--- Initializes the object list and data.maxObjectCount = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:33
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_spawnLight_C:init(mgr, ...) end

--- End-of-mission hook: cleans up the objects created by the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:129
function flowgraph_nodes_scene_spawnLight_C:onClientEndMission() end

--- On clear, deletes; otherwise creates the light if the maximum is not reached (created = true) and, with update, updates it (position, rotation, angles, brightness, range, color).
---Source: lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua:92
function flowgraph_nodes_scene_spawnLight_C:work() end

