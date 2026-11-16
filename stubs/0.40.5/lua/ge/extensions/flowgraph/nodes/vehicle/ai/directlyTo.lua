---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_directlyTo_C
local flowgraph_nodes_vehicle_ai_directlyTo_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:40
function flowgraph_nodes_vehicle_ai_directlyTo_C:_executionStopped() end

--- Displays the Complete and Started states.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:124
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_directlyTo_C:drawMiddle(builder, style) end

--- Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle according to the node data.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:60
function flowgraph_nodes_vehicle_ai_directlyTo_C:endAI() end

--- Returns the vehicle of vehId, or the player's without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:50
function flowgraph_nodes_vehicle_ai_directlyTo_C:getVeh() end

--- Initializes started/complete and the default data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:31
function flowgraph_nodes_vehicle_ai_directlyTo_C:init() end

--- Resets started/complete to false and calls endAI.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:44
function flowgraph_nodes_vehicle_ai_directlyTo_C:reset() end

--- Builds a path of points spaced at most maxStepDistance apart between the vehicle position and the target (time = distance / speed) and sends it via ai.startFollowing.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:67
function flowgraph_nodes_vehicle_ai_directlyTo_C:setupAI() end

--- Handles reset; on the first flow runs setupAI; then tests the squared distance to the target and, below minDistance, stops the AI, marks complete and activates the flow output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:96
function flowgraph_nodes_vehicle_ai_directlyTo_C:work() end

