---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/distanceGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "distance" scenario goal (goals.vehicles with id = 'distance'): the distance between the goal's vehicle and a target scenetree object must not leave [minDistance, maxDistance]. Useful for chase or convoy scenarios. Called by the scenario_scenarios goal system.
--- Access: extension `scenario_distanceGoal`: `extensions.load("scenario_distanceGoal")`, then the global `scenario_distanceGoal`
---@class scenario_distanceGoal
---@field instances table List of valid 'distance' goals, filled by init().
scenario_distanceGoal = {}

--- Resets instances and adds each goal id='distance' whose numeric options are valid; purpose is 'fail' if absent; checkForCarDistance is set to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/distanceGoal.lua:88
---@param scenario table Current scenario.
function scenario_distanceGoal.init(scenario) end

--- Called on every scenario state; on 'onRaceTick' measures the distance to the target vehicle and ends the scenario (victory or defeat depending on purpose) if it leaves the bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/distanceGoal.lua:37
---@param scenario table Current scenario.
---@param state string State name; 'onRaceTick' handled.
---@param stateData table State data (unused).
function scenario_distanceGoal.processState(scenario, state, stateData) end

--- Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/distanceGoal.lua:118
---@param scenario table Current scenario.
---@param instance table|nil Not used.
function scenario_distanceGoal.updateFinalStatus(scenario, instance) end

