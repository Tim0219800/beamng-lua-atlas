---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/timeLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "timeLimit" scenario goal: the scenario must be completed in less than maxTime seconds. Loaded by scenario_raceGoals (init, processState, updateFinalStatus); declared in goals.vehicles with id 'timeLimit'. Can display a countdown over the last seconds and fails if the time is exceeded.
--- Access: extension `scenario_timeLimit`: `extensions.load("scenario_timeLimit")`, then the global `scenario_timeLimit`
---@class scenario_timeLimit
---@field instances table<integer, table> 'timeLimit' goal instances for the current scenario, filled by init.
scenario_timeLimit = {}

--- Rebuilds M.instances from scenario.goals.vehicles (id == 'timeLimit') after validating the types of maxTime/waitTime/countdown; instance.wait receives countdown.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/timeLimit.lua:55
---@param scenario table current scenario
function scenario_timeLimit.init(scenario) end

--- Called by scenario_raceGoals on every event: handles 'onRaceTick' (countdown and exceeding maxTime + waitTime) and 'onRaceResult' (comparison of the final time to maxTime).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/timeLimit.lua:21
---@param scenario table current scenario
---@param state string hook name
---@param stateData table|nil hook data (unused)
function scenario_timeLimit.processState(scenario, state, stateData) end

--- Called at the end of the scenario: publishes the status of each instance to statistics_statistics.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/timeLimit.lua:76
---@param scenario table current scenario
---@param instance table unused (inferred from code)
function scenario_timeLimit.updateFinalStatus(scenario, instance) end

