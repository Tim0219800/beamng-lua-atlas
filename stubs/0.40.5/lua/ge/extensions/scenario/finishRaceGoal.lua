---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/finishRaceGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "finishRace" scenario goal (goals.vehicles with id = 'finishRace'): the vehicle must finish the race. It listens for the last waypoint reached, then, on the 'onRaceResult' state, ends the scenario in success or failure.
--- Access: extension `scenario_finishRaceGoal`: `extensions.load("scenario_finishRaceGoal")`, then the global `scenario_finishRaceGoal`
---@class scenario_finishRaceGoal
---@field instances table List of 'finishRace' goals, filled by init().
scenario_finishRaceGoal = {}

--- Resets instances and adds each goal id='finishRace', resetting status.result to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/finishRaceGoal.lua:66
---@param scenario table Current scenario.
function scenario_finishRaceGoal.init(scenario) end

--- Called on every scenario state. Handles 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) and 'onRaceResult'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/finishRaceGoal.lua:31
---@param scenario table Current scenario.
---@param state string State name.
---@param stateData table For 'onRaceWaypointReached': next (next waypoint, nil if last) and vehicleId.
function scenario_finishRaceGoal.processState(scenario, state, stateData) end

--- Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/finishRaceGoal.lua:76
---@param scenario table Current scenario.
function scenario_finishRaceGoal.updateFinalStatus(scenario) end

