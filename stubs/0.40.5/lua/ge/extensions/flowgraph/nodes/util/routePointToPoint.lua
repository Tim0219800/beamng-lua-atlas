---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_routePointToPoint_C
local flowgraph_nodes_util_routePointToPoint_C = {}

--- For each position, finds the closest road (map.findClosestRoad) and keeps the closest node; if one fails, does nothing. Then computes map.getPath(start, end, nil, 1000 or 1) and writes it to the output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua:24
function flowgraph_nodes_util_routePointToPoint_C:workOnce() end

