---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceGoals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dispatcher of a scenario's goals. At initialization it reads the goals declared in scenario.vehicles[name].goal of the JSON, creates scenario.goals.vehicles, validates the options with a schema, dynamically loads each goal's module ('scenario/<id>' or 'scenario/<id>goal') and calls its init. Then it relays the race events (onRaceInit, onRaceStart, onRaceTick, onRaceWaypointReached, onRaceResult, onCountdownEnded) to goal.processState(scenario, stateName, data).
--- Access: extension `scenario_raceGoals`: `extensions.load("scenario_raceGoals")`, then the global `scenario_raceGoals`
---@class scenario_raceGoals
---@field onRaceEnd any
---@field state table {goals = {}}: table goal name -> loaded module, filled by initialiseGoals.
scenario_raceGoals = {}

--- Builds scenario.goals.vehicles from the scenario's vehicles (scenario.vehicleNameToId), validates the schema, loads the goal modules and calls init on each, then emits the onRaceGoalsInitilised hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:128
function scenario_raceGoals.initialiseGoals() end

--- Hook called at the end of the countdown: relays 'onCountdownEnded' to the goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:240
function scenario_raceGoals.onCountdownEnded() end

--- Race hook: relays the 'onRaceInit' state to all goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:201
function scenario_raceGoals.onRaceInit() end

--- Hook called at the end of the race: records scenario.finalStatus and relays 'onRaceResult' to the goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:229
---@param status table Final race result.
function scenario_raceGoals.onRaceResult(status) end

--- Race hook: relays the 'onRaceStart' state to all goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:192
function scenario_raceGoals.onRaceStart() end

--- Hook called periodically during the race: relays 'onRaceTick' with {raceTickTime, scenarioTimer} to all goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:219
---@param raceTickTime number Race tick time.
---@param scenarioTimer number Scenario timer.
function scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer) end

--- Hook called when a vehicle reaches a waypoint: relays 'onRaceWaypointReached' with the received data to the goals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:210
---@param data table Waypoint data (vehicleId, next, time...).
function scenario_raceGoals.onRaceWaypointReached(data) end

--- Calls updateFinalStatus(scenario) on each loaded goal, to record the final results.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceGoals.lua:182
function scenario_raceGoals.updateGoalsFinalStatus() end

