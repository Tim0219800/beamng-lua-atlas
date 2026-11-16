---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_setCameraRotation_C
local flowgraph_nodes_scene_camera_setCameraRotation_C = {}

--- Calls core_camera.setPosRot(0, ...) with the camera's current position and the node's rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:88
function flowgraph_nodes_scene_camera_setCameraRotation_C:SetCamera() end

--- Restores rotation and mode; recreates the 'rot' pin if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:102
---@param nodeData any saved data
function flowgraph_nodes_scene_camera_setCameraRotation_C:_onDeserialized(nodeData) end

--- Saves the rotation (res.rot) and the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:97
---@param res any save table
function flowgraph_nodes_scene_camera_setCameraRotation_C:_onSerialize(res) end

--- Editor properties panel: mode choice, x/y/z/w fields (normalized), buttons "Set from camera" and "Preview". Creates/deletes the 'rot' pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:28
function flowgraph_nodes_scene_camera_setCameraRotation_C:drawCustomProperties() end

--- Central area of the node (nothing displayed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:84
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_camera_setCameraRotation_C:drawMiddle(builder, style) end

--- Initializes the rotation to quat(0,0,0,0), the mode to 'custom' and the mode list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:22
function flowgraph_nodes_scene_camera_setCameraRotation_C:init() end

--- Switches to the free camera if needed, reads the 'rot' pin in 'from Pin' mode, applies the rotation (SetCamera) and writes the value pin.
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:73
function flowgraph_nodes_scene_camera_setCameraRotation_C:work() end

