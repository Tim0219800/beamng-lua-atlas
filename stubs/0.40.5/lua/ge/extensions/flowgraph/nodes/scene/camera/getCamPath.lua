---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_camera_getCamPath_C
local flowgraph_nodes_scene_camera_getCamPath_C = {}

--- Resets done and completedFlag to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:35
function flowgraph_nodes_scene_camera_getCamPath_C:_executionStarted() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:40
function flowgraph_nodes_scene_camera_getCamPath_C:_executionStopped() end

--- Draws the middle of the node (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:79
---@param builder any
---@param style any
function flowgraph_nodes_scene_camera_getCamPath_C:drawMiddle(builder, style) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:32
function flowgraph_nodes_scene_camera_getCamPath_C:init() end

--- On reset, starts again from zero. flow follows the input. With flow, determines whether the path is active, then computes inactive/complete/completed/incomplete/duration via camera:isPathComplete and getPathDuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:43
function flowgraph_nodes_scene_camera_getCamPath_C:work() end

