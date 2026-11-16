---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_scriptAI_followPath_C
local flowgraph_nodes_vehicle_ai_scriptAI_followPath_C = {}

--- Stops the AI if the path was running then resets started/complete to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:87
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_executionStopped() end

--- Restores timeScale (1 by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:138
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_onDeserialized(nodeData) end

--- Saves timeScale.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:134
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_onSerialize(res) end

--- Draws the Timescale field (minimum 0.25), the reset mode choice and the "Reset AI" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:38
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:drawCustomProperties() end

--- Displays the Complete and Started states.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:143
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:drawMiddle(builder, style) end

--- Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:70
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:endAI() end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:60
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:getVeh() end

--- Initializes started, complete, loopMode="neverReset", timeScale=1 and the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:29
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:init() end

--- Loads the path from the path pin into self.path.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:95
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:loadPath() end

--- Hook called by the command sent every frame (the vehicle's ai.scriptState); when the info is nil for this vehicle and this node, marks the path as finished and stops the AI.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:77
---@param id string|number Vehicle id.
---@param info table|nil AI script state, nil when it is finished.
---@param nodeID number|nil Id of the requesting node.
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:onVehicleSubmitInfo(id, info, nodeID) end

--- Prepares the path (times divided by timeScale, dir/up kept) and sends ai.startFollowing(path, nil, loopCount, loop mode).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:99
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:setupAI() end

--- Handles reset; on the first pass runs setupAI; every frame requests via be:queueAllObjectLua the ai.scriptState() state of each vehicle, which calls the onVehicleSubmitInfo hook back; activates flow once complete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:118
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:work() end

