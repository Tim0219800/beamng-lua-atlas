---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/damageGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "damage" scenario goal (goals.vehicles with id = 'damage'). It monitors the vehicle's damage (map.objects[...].damage) at each race tick and makes the scenario win or lose when the damage exceeds damageLimit. It is called by the scenario_scenarios goal system (init on load, processState on each state, updateFinalStatus at the end).
--- Access: extension `scenario_damageGoal`: `extensions.load("scenario_damageGoal")`, then the global `scenario_damageGoal`
---@class scenario_damageGoal
---@field instances table List of valid 'damage' goals, filled by init().
scenario_damageGoal = {}

--- Resets instances and adds to them each goal id='damage' of scenario.goals.vehicles after checking the types (purpose is 'fail' if absent, lastProgress initialized to 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/damageGoal.lua:68
---@param scenario table Current scenario table.
function scenario_damageGoal.init(scenario) end

--- Called by the goal system on every scenario state change. On 'onRaceTick', compares the vehicle's damage to damageLimit, shows the progress and ends the scenario (scenario_scenarios.finish) in victory or defeat depending on purpose.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/damageGoal.lua:36
---@param scenario table Current scenario (scenario.timer is used to format the time).
---@param state string State name; only 'onRaceTick' is handled.
---@param stateData table State data (unused).
function scenario_damageGoal.processState(scenario, state, stateData) end

--- Records each instance's result in statistics_statistics.setGoalProgress at the end of the scenario.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/damageGoal.lua:95
---@param scenario table Current scenario.
---@param instance table|nil Unused: the loop iterates over M.instances.
function scenario_damageGoal.updateFinalStatus(scenario, instance) end

