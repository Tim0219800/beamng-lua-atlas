---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/closestPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_closestPath_C
local flowgraph_nodes_util_closestPath_C = {}

--- Initializes lastTrackedPosValue to vec3().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:28
function flowgraph_nodes_util_closestPath_C:_executionStarted() end

--- Restores the Waypoints checkbox and updates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:36
---@param nodeData any
function flowgraph_nodes_util_closestPath_C:_onDeserialized(nodeData) end

--- Saves the state of the Waypoints checkbox.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:32
---@param res any
function flowgraph_nodes_util_closestPath_C:_onSerialize(res) end

--- Draws the "Waypoints" checkbox; changing it calls updatePins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:41
function flowgraph_nodes_util_closestPath_C:drawCustomProperties() end

--- Creates the "Waypoints" checkbox (BoolPtr false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:24
function flowgraph_nodes_util_closestPath_C:init() end

--- Replaces the posA/posB pins with a "waypoints" table pin (or the reverse) according to the checkbox, creating only the missing pins.
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:47
function flowgraph_nodes_util_closestPath_C:updatePins() end

--- Sets dist to -1; on setRoute, creates the route (route:setupPathMulti) from the points; tracks the position (route:trackPosition) when flow is active and trackedPos has changed; returns route.path[1].distToTarget.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/closestPath.lua:68
function flowgraph_nodes_util_closestPath_C:work() end

