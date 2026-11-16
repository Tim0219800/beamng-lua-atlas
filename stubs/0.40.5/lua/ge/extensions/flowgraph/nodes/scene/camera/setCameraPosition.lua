---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_setCameraPosition_C
local flowgraph_nodes_scene_camera_setCameraPosition_C = {}

--- Calls core_camera.setPosRot(0, ...) with the node's position and the camera's current rotation (core_camera.getQuat).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:88
function flowgraph_nodes_scene_camera_setCameraPosition_C:SetCamera() end

--- Restores position and mode; recreates the 'pos' pin in 'from Pin' mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:101
---@param nodeData any saved data
function flowgraph_nodes_scene_camera_setCameraPosition_C:_onDeserialized(nodeData) end

--- Saves the position (res.ppos) and the mode (res.mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:95
---@param res any node save table
function flowgraph_nodes_scene_camera_setCameraPosition_C:_onSerialize(res) end

--- Editor properties panel: mode choice, x/y/z fields, buttons "Set from camera" and "Preview". Creates or deletes the 'pos' pin depending on the mode. Returns a reason string if a change occurred.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:27
function flowgraph_nodes_scene_camera_setCameraPosition_C:drawCustomProperties() end

--- Central area of the node in the editor (nothing displayed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:84
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_camera_setCameraPosition_C:drawMiddle(builder, style) end

--- Initializes the position to (0,0,0), the mode to 'custom' and the mode list {'custom','from Pin'}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:21
function flowgraph_nodes_scene_camera_setCameraPosition_C:init() end

--- Switches to the free camera if needed, reads the position from the 'pos' pin in 'from Pin' mode, applies the position (SetCamera) and writes the value pin.
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:73
function flowgraph_nodes_scene_camera_setCameraPosition_C:work() end

