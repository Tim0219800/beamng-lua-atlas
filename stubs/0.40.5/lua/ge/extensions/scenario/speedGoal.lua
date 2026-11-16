---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/speedGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "speed" scenario goal: monitors a vehicle's speed and wins or fails when it stays outside the range [minSpeed, maxSpeed] for more than maxTimeout seconds. Loaded by scenario_raceGoals which calls init, processState and updateFinalStatus; a scenario declares it in goals.vehicles with id 'speed'.
--- Access: extension `scenario_speedGoal`: `extensions.load("scenario_speedGoal")`, then the global `scenario_speedGoal`
---@class scenario_speedGoal
---@field instances table<integer, table> 'speed' goal instances active for the current scenario, filled by init.
scenario_speedGoal = {}

--- Called by scenario_raceGoals at startup: rebuilds M.instances from scenario.goals.vehicles (entries id == 'speed'), validates the types (minSpeed, maxSpeed, delay numbers; wayPointNum array; purpose string), sets maxTimeout to 0 and purpose to 'fail' by default, and Timeout to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/speedGoal.lua:98
---@param scenario table current scenario
function scenario_speedGoal.init(scenario) end

--- Called by scenario_raceGoals on every race event; only acts for state == 'onRaceTick': checks the speed of the relevant vehicles (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/speedGoal.lua:58
---@param scenario table current scenario
---@param state string hook name: 'onRaceStart','onRaceInit','onRaceWaypointReached','onRaceTick','onRaceResult','onCountdownEnded'
---@param stateData table|nil hook data (unused here)
function scenario_speedGoal.processState(scenario, state, stateData) end

--- Called at the end of the scenario: publishes to statistics_statistics the status (passed/failed) of each instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/speedGoal.lua:140
---@param scenario table current scenario
---@param instance table unused (inferred from code)
function scenario_speedGoal.updateFinalStatus(scenario, instance) end

