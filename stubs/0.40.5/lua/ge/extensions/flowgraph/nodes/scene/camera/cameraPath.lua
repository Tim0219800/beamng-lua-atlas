---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_cameraPath_C
local flowgraph_nodes_scene_camera_cameraPath_C = {}

--- Resets activatedFlag and the duration state to 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:45
function flowgraph_nodes_scene_camera_cameraPath_C:_executionStarted() end

--- Migrates the old field data.loop to the hard-coded pin 'loop'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:89
---@param data any
function flowgraph_nodes_scene_camera_cameraPath_C:_onDeserialized(data) end

--- Draws the middle of the node (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:86
---@param builder any
---@param style any
function flowgraph_nodes_scene_camera_cameraPath_C:drawMiddle(builder, style) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:36
function flowgraph_nodes_scene_camera_cameraPath_C:init() end

--- Same reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:50
function flowgraph_nodes_scene_camera_cameraPath_C:onNodeReset() end

--- Restricts the pathName pin to '.camPath.json' files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:39
function flowgraph_nodes_scene_camera_cameraPath_C:postInit() end

--- During the started state: handles the activated impulse, sets inactive/duration depending on whether the path is active, goes to 'finished' when isPathComplete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:64
function flowgraph_nodes_scene_camera_cameraPath_C:work() end

--- Finds the path (camera:findPath), starts it (startPath), writes id, activated=true and goes to the 'started' state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:55
function flowgraph_nodes_scene_camera_cameraPath_C:workOnce() end

