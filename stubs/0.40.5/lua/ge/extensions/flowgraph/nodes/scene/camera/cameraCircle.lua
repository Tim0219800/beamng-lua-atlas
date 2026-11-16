---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_cameraCircle_C
local flowgraph_nodes_scene_camera_cameraCircle_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:28
function flowgraph_nodes_scene_camera_cameraCircle_C:_executionStarted() end

--- Resets center, offset, camera position and angle to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:32
function flowgraph_nodes_scene_camera_cameraCircle_C:onNodeReset() end

--- Computes the center, the position on the circle, the height (with 5% smoothing if snapHeight), orients the camera toward the center (core_camera.setPosRot) then increments the angle by dtReal * speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:54
function flowgraph_nodes_scene_camera_cameraCircle_C:work() end

--- Switches to the free camera and sets the start angle (+180 degrees, plus the vehicle's orientation if vehId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:39
function flowgraph_nodes_scene_camera_cameraCircle_C:workOnce() end

