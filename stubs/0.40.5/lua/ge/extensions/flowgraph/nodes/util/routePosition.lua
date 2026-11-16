---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/routePosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_routePosition_C
local flowgraph_nodes_util_routePosition_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:29
function flowgraph_nodes_util_routePosition_C:_executionStopped() end

--- Calls onNodeReset (creates the route).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:25
function flowgraph_nodes_util_routePosition_C:init() end

--- Creates a new route object (local variable of the file, shared between instances).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:33
function flowgraph_nodes_util_routePosition_C:onNodeReset() end

--- Initializes the route with route:setupPathMultiWaypoints, advances by distance with route:stepAhead and writes n1, n2, pos and dirVec (normalized direction from n1 to n2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/routePosition.lua:37
function flowgraph_nodes_util_routePosition_C:workOnce() end

