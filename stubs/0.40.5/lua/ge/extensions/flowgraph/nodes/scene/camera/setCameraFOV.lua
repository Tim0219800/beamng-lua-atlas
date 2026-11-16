---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_setCameraFOV_C
local flowgraph_nodes_scene_camera_setCameraFOV_C = {}

--- Called when the graph starts: stores the current FOV in self._storedFov.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:30
function flowgraph_nodes_scene_camera_setCameraFOV_C:_executionStarted() end

--- Called when the graph stops: restores the stored FOV then forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:33
function flowgraph_nodes_scene_camera_setCameraFOV_C:_executionStopped() end

--- Draws the FOV value (2 decimals) in the middle of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:39
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_camera_setCameraFOV_C:drawMiddle(builder, style) end

--- Forces the free camera (commands.setFreeCamera) if needed, then applies the FOV of the value pin via core_camera.setFOV(0, ...).
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:23
function flowgraph_nodes_scene_camera_setCameraFOV_C:work() end

