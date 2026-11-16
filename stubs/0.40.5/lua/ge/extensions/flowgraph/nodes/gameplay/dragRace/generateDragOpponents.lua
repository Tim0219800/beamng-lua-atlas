---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C
local flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C = {}

--- Clears the selection and sets playerId to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:214
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:_executionStarted() end

--- Builds {model, config, random paint, dial} from a config (dial = time_1_4 from the performance data, otherwise 12).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:69
---@param config table Vehicle config
---@return table  Vehicle entry
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:createVehicleEntry(config) end

--- Editor: no properties.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:31
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawCustomProperties() end

--- Node drawing in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:36
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawMiddle(builder, style) end

--- Lists the configurations of core_vehicles.getConfigList that are valid as opponents.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:50
---@return table  List of configs
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:filterValidVehicleConfigs() end

--- Picks random configs with dial - 0.5.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:138
---@param vehConfigs table Candidate configs
---@param count integer Number of opponents
---@return table  List of entries
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateBracketRaceOpponents(vehConfigs, count) end

--- Picks configs whose 1/4 mile time is close to the given dial.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:157
---@param vehConfigs table Candidate configs
---@param dial number Player's dial
---@param count integer Number of opponents
---@param currentVeh table|nil Current vehicle
---@return table  List of entries
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh) end

--- Determines the player's dial: playerDial pin if >= 0, otherwise the recorded dial (dragBridge.getDialTimes), otherwise performance data, otherwise 12.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:113
---@param currentVeh table|nil Current vehicle details
---@return number  Dial (1/4 mile time, s)
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerDial(currentVeh) end

--- Returns count copies of the player's vehicle as fallback opponents.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:85
---@param count integer Number of entries
---@return table  List of entries
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerVehicleAsFallback(count) end

--- Initializes selectedOpponents and playerId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:26
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:init() end

--- Chooses the strategy (bracketRace or similar) and returns the list of opponents.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:189
---@return table  List of entries
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:selectVehicle() end

--- Initializes the randomness and writes vehicleGroup.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:219
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:workOnce() end

