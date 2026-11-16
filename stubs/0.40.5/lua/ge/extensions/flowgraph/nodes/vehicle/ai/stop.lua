---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_stop_C
local flowgraph_nodes_vehicle_ai_stop_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:30
function flowgraph_nodes_vehicle_ai_stop_C:_executionStarted() end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:34
function flowgraph_nodes_vehicle_ai_stop_C:getVeh() end

--- Initializes complete=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:22
function flowgraph_nodes_vehicle_ai_stop_C:init() end

--- Resets complete to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:26
function flowgraph_nodes_vehicle_ai_stop_C:onNodeReset() end

--- If the stop is detected, activates stopped; otherwise compares the speed (map.objects[vehId].vel) to the threshold and stores complete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:51
function flowgraph_nodes_vehicle_ai_stop_C:work() end

--- Sends ai.setState({mode = "stop"}) to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:44
function flowgraph_nodes_vehicle_ai_stop_C:workOnce() end

