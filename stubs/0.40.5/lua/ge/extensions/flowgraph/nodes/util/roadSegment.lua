---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_roadSegment_C
local flowgraph_nodes_util_roadSegment_C = {}

--- Resets the cache of the two names.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:38
function flowgraph_nodes_util_roadSegment_C:_executionStarted() end

--- Resets the cache of the two names.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:34
function flowgraph_nodes_util_roadSegment_C:init() end

--- If both nodes exist in map.getMap().nodes, recomputes (when the pair changes) length, drivability, speed limit, one-way, private road, number of lanes (counting "-" and "+" in link.lanes, "-+" by default) and direction; always recomputes the width (2 × radius interpolated according to xnorm).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua:42
function flowgraph_nodes_util_roadSegment_C:work() end

