---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the scenario race and the interface: sends the UI the waypoint progress (WayPointChange), lap progress (RaceLapChange) and time comparisons with the previous lap (RaceCheckpointComparison, RaceTimeComparison). Only reacts to events of player 0's vehicle.
--- Access: extension `scenario_raceUI`: `extensions.load("scenario_raceUI")`, then the global `scenario_raceUI`
---@class scenario_raceUI
scenario_raceUI = {}

--- Clears the stored waypoint times and clears the waypoint and lap displays on the UI side.
---Source: lua/ge/extensions/scenario/raceUI.lua:10
---@param scenario table Scenario (unused).
function scenario_raceUI.initialise(scenario) end

--- Hook called on each completed lap. For the player's vehicle, updates the lap number (capped at lapCount), resets the waypoint progress to full and displays the lap time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceUI.lua:70
---@param data table Lap data: vehicleId, lap, time (seconds).
function scenario_raceUI.onRaceLap(data) end

--- Race start hook: sends WayPointChange {current = 0, count = N} if the lap configuration has more than one waypoint, and RaceLapChange {current = 1, count = lapCount} if lapCount > 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceUI.lua:17
function scenario_raceUI.onRaceStart() end

--- Hook called on each waypoint reached. For the player's vehicle, stores the time, emits the time comparisons with the previous lap and updates the waypoint progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceUI.lua:38
---@param data table Waypoint data: vehicleId, time, cur, currentLapConfig.
function scenario_raceUI.onRaceWaypointReached(data) end

--- Scenario state change hook: clears the waypoint display when the scenario is absent or in 'pre-start'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceUI.lua:30
---@param scenario table|nil Current scenario.
function scenario_raceUI.onScenarioChange(scenario) end

