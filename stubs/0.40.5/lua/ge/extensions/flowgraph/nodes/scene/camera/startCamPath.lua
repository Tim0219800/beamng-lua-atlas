---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_startCamPath_C
local flowgraph_nodes_scene_camera_startCamPath_C = {}

--- Central area of the node (nothing displayed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:49
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_camera_startCamPath_C:drawMiddle(builder, style) end

--- Nothing to initialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:24
function flowgraph_nodes_scene_camera_startCamPath_C:init() end

--- Restricts the pathName pin to the "Camera Path Files" file selector (.camPath.json).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:27
function flowgraph_nodes_scene_camera_startCamPath_C:postInit() end

--- Drops activated back to false on the frame following the activation (flag activatedFlag).
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:41
function flowgraph_nodes_scene_camera_startCamPath_C:work() end

--- Finds the path (modules.camera:findPath), starts it (startPath with loop), writes id and raises the activated impulse.
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:33
function flowgraph_nodes_scene_camera_startCamPath_C:workOnce() end

