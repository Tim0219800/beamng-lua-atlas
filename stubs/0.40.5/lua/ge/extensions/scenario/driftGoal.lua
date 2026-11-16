---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/driftGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "drift" scenario goal (goals.vehicles with id = 'drift'). It computes a drift score from the difference between the vehicle's direction (dirVec) and that of its velocity (vel), with combos and encouragement messages shown via scenariohelper.realTimeUiDisplay. The scenario ends when the allotted time (timeAllowance) is exceeded or on the 'onRaceResult' state.
--- Access: extension `scenario_driftGoal`: `extensions.load("scenario_driftGoal")`, then the global `scenario_driftGoal`
---@class scenario_driftGoal
---@field instances table List of valid 'drift' goals, filled by init().
scenario_driftGoal = {}

--- Resets instances and the drift state; adds each goal id='drift' (minDrift and maxDrift must be numeric) with driftScore = 0 and status.completed = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/driftGoal.lua:118
---@param scenario table Current scenario.
function scenario_driftGoal.init(scenario) end

--- Called on every scenario state: updates the vehicle's drift score from map.objects, shows the real-time message, and ends the scenario (sessionEnd) on 'onRaceResult' or if timeAllowance is exceeded. Re-enables mapmgr tracking if the vehicle is not yet in map.objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/driftGoal.lua:53
---@param scenario table Current scenario (scenario.timer).
---@param state string State name; 'onRaceResult' ends the session.
---@param stateData table State data (unused).
function scenario_driftGoal.processState(scenario, state, stateData) end

--- Sets passed or failed depending on driftScore >= minDrift and sends points (driftScore) and maxPoints (maxDrift) to statistics_statistics.setGoalProgress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/driftGoal.lua:147
---@param scenario table Current scenario.
---@param instance table|nil Not used.
function scenario_driftGoal.updateFinalStatus(scenario, instance) end

