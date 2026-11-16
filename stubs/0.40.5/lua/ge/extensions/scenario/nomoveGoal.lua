---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/nomoveGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "nomove" scenario goal (goals.vehicles with id = 'nomove'): the vehicle must not move more than 0.1 m from its starting position. Called by the scenario_scenarios goal system.
--- Access: extension `scenario_nomoveGoal`: `extensions.load("scenario_nomoveGoal")`, then the global `scenario_nomoveGoal`
---@class scenario_nomoveGoal
---@field instances table List of valid 'nomove' goals, filled by init().
scenario_nomoveGoal = {}

--- Resets instances and adds each goal id='nomove' whose vehicle exists, remembering its starting position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/nomoveGoal.lua:45
---@param scenario table Current scenario.
function scenario_nomoveGoal.init(scenario) end

--- Called on every scenario state. Updates the starting position on 'onCountdownEnded' then checks immobility on 'onRaceTick' and 'onRaceResult'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/nomoveGoal.lua:9
---@param scenario table Current scenario.
---@param state string State name.
---@param stateData table State data (unused).
function scenario_nomoveGoal.processState(scenario, state, stateData) end

--- Unless triggerEndOnly, sends the result to statistics_statistics.setGoalProgress for the goal's vehicle and for player 0's vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/nomoveGoal.lua:61
---@param scenario table Current scenario.
---@param instance table|nil Not used.
function scenario_nomoveGoal.updateFinalStatus(scenario, instance) end

