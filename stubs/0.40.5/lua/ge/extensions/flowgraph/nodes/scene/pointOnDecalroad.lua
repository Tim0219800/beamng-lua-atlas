---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_pointOnDecalroad_C
local flowgraph_nodes_scene_pointOnDecalroad_C = {}

--- Resets the road cache and empties the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:33
function flowgraph_nodes_scene_pointOnDecalroad_C:_executionStarted() end

--- Initializes point to (0,0,0) and pz to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:28
function flowgraph_nodes_scene_pointOnDecalroad_C:init() end

--- Reloads the road if roadId changes, then computes closestIdx, onRoad, inside and outside.
---Source: lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua:41
function flowgraph_nodes_scene_pointOnDecalroad_C:work() end

