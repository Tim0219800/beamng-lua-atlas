---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_getPointOnDecalroad_C
local flowgraph_nodes_scene_getPointOnDecalroad_C = {}

--- Resets the cache (oldRoadId, oldIdx, roadObj) and empties the output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:28
function flowgraph_nodes_scene_getPointOnDecalroad_C:_executionStarted() end

--- Nothing to initialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:24
function flowgraph_nodes_scene_getPointOnDecalroad_C:init() end

--- Looks up the road, computes pos ({x,y,z} of node idx) and rot (quatFromDir of the next->previous direction, Z up vector).
---Source: lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua:37
function flowgraph_nodes_scene_getPointOnDecalroad_C:work() end

