---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_followWaypoints_C
local flowgraph_nodes_vehicle_ai_followWaypoints_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:34
function flowgraph_nodes_vehicle_ai_followWaypoints_C:_executionStopped() end

--- Displays the state, the number of waypoints and the final target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:108
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_followWaypoints_C:drawMiddle(builder, style) end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:47
function flowgraph_nodes_vehicle_ai_followWaypoints_C:getVeh() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:30
function flowgraph_nodes_vehicle_ai_followWaypoints_C:init() end

--- Clears the path, resets the lap counters to zero, clears finalWp and goes to the "inactive" state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:38
function flowgraph_nodes_vehicle_ai_followWaypoints_C:onNodeReset() end

--- While "started", counts a lap when the vehicle passes within the radius of the last waypoint, re-arms when it is closer to the first one; goes to "finished" when lapsDone == lapCount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:85
function flowgraph_nodes_vehicle_ai_followWaypoints_C:work() end

--- Reads the path, computes lapCount, finalWp (last waypoint) and sends ai.driveUsingPath({wpTargetList, wpSpeeds, noOfLaps, aggression = 1}); in multi-lap mode, adds the first waypoint at the end; without stopAtFinish, sets the speed of the last waypoint to 100. Sets the state to "started".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:57
function flowgraph_nodes_vehicle_ai_followWaypoints_C:workOnce() end

