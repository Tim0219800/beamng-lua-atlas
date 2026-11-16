---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_closestRoad_C
local flowgraph_nodes_util_closestRoad_C = {}

--- Forgets the last position (oldPos=nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:37
function flowgraph_nodes_util_closestRoad_C:_executionStarted() end

--- For a compound node name "DecalRoad<id>_<index>", returns the DecalRoad id and the point index; returns -1,-1 if an object with that name exists in scenetree; nil otherwise.
---Source: lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:41
---@param name string Navgraph node name.
function flowgraph_nodes_util_closestRoad_C:findDecalroad(name) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:34
---@param mgr any
function flowgraph_nodes_util_closestRoad_C:init(mgr) end

--- If pos has changed, looks for the closest road, orders the nodes by proximity, fills the pins (positions, DecalRoad ids, distance, projected point, width = 2 × interpolated radius) and exists. Sets exists to false if nothing is found.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua:66
function flowgraph_nodes_util_closestRoad_C:work() end

