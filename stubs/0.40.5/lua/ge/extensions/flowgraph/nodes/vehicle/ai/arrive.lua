---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_arrive_C
local flowgraph_nodes_vehicle_ai_arrive_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:46
function flowgraph_nodes_vehicle_ai_arrive_C:_executionStopped() end

--- Displays the state and whether the command was sent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:50
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_arrive_C:drawMiddle(builder, style) end

--- Returns the vehicle of aiVehId, or the player's without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:56
function flowgraph_nodes_vehicle_ai_arrive_C:getVeh() end

--- Initializes sentCommand, data.autoDisableOnArrive=true and the duration state "inactive".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:35
function flowgraph_nodes_vehicle_ai_arrive_C:init() end

--- Resets sentCommand to false and the state to "inactive".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:41
function flowgraph_nodes_vehicle_ai_arrive_C:onNodeReset() end

--- If flow is active and not finished: checks the waypoint and the vehicle (node error otherwise), computes the distance from the middle of the front, goes to "finished" on arrival (and disables the AI if autoDisableOnArrive), then sends ai.setState manual and ai.setTarget once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:66
function flowgraph_nodes_vehicle_ai_arrive_C:work() end

