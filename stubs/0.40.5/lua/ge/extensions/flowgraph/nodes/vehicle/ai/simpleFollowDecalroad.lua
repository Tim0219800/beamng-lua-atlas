---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C
local flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C = {}

--- Displays Load button, state, number of nodes, distance and debug path if renderDebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:129
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:drawMiddle(builder, style) end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:61
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:getVeh() end

--- Initializes the data (speed=5, loopMode=startReset, renderDebug=false) and asks all vehicles to emit the onVehicleSubmitInfo hook with their ai.scriptState().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:33
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:init() end

--- Builds self.path from the DecalRoad (scenetree.findObject(roadName)): one point per node with the cumulative time and the direction/up of the first point.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:98
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:loadRecording() end

--- Hook called with the AI script state of a vehicle; updates progress = scriptTime / endScriptTime and receivedInfo if the id matches vehId.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:47
---@param id string|number Vehicle id.
---@param info table|nil AI script state (scriptTime, endScriptTime) or nil.
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:onVehicleSubmitInfo(id, info) end

--- Loads the road, sends ai.startFollowing(path, nil, loopCount or -1, loopMode) and initializes the finished, active and progress pins.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:71
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:play() end

--- Sends ai.stopFollowing() and sets finished/active to false.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:87
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:stop() end

--- Calls play on start, or stop on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:121
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:work() end

