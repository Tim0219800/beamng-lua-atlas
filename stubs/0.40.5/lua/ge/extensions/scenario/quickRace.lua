---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/quickRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quick race (quickrace) logic: loads the track's prefabs and flowgraph, creates the player's vehicle at the start position, converts the race path (raceFile file) into nodes and lap configuration (lapConfig) for the scenario system, then records times and highscores. It only activates for scenarios built by scenario_quickRaceLoader (scenario.isQuickRace).
--- Access: extension `scenario_quickRace`: `extensions.load("scenario_quickRace")`, then the global `scenario_quickRace`
---@class scenario_quickRace
---@field addCheckPoint any
---@field loadCheckpoints any
scenario_quickRace = {}

--- Toggles the quickrace configuration screen during a race: opens the 'menu.quickrace' menu while pausing the simulation, or closes it and resumes (simTimeAuthority.pause).
---Source: lua/ge/extensions/scenario/quickRace.lua:365
function scenario_quickRace.changeTimeTrialConfig() end

--- Builds the configuration key used for highscores: 'standing' or 'rolling', suffix 'Reverse' if reverse, then the lap count. nil arguments fall back to scenario.rollingStart, scenario.isReverse and scenario.lapCount.
---Source: lua/ge/extensions/scenario/quickRace.lua:238
---@param rolling boolean|nil Rolling start.
---@param reverse boolean|nil Reverse direction.
---@param laps integer|nil Number of laps.
---@return string  For example 'rollingReverse3'.
function scenario_quickRace.getConfigKey(rolling, reverse, laps) end

--- Recursively walks the segments of a race path and returns the list of generated node names (_generatedName); at forks, adds a sub-list of '__b<id>' markers and fills config.branches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:67
---@param segment table Start segment (object of path.segments).
---@param config table Configuration table modified: receives config.branches.
---@return table  Ordered list of node names (may contain sub-lists for forks).
function scenario_quickRace.getNodesOnBranch(segment, config) end

--- Returns the make of the scenario's vehicle (scenario.vehicle.file.Brand).
---Source: lua/ge/extensions/scenario/quickRace.lua:310
---@param scenario table Quickrace scenario.
---@return string  Make.
function scenario_quickRace.getVehicleBrand(scenario) end

--- Returns the name of the scenario's vehicle (scenario.vehicle.file.Name).
---Source: lua/ge/extensions/scenario/quickRace.lua:314
---@param scenario table Quickrace scenario.
---@return string  Name.
function scenario_quickRace.getVehicleName(scenario) end

--- Creates the player's vehicle (scenario.vehicle) named 'scenario_player0' with core_vehicles.spawnNewVehicle, at the computed start position (startTransform of the raceFile, or failing that the track's standing/rolling[/Reverse] spawnSphere), then adds it to the ScenarioObjectsGroup group. If the spawnSphere is not found, uses 0/0/0 with an error in the log.
---Source: lua/ge/extensions/scenario/quickRace.lua:167
---@param scenario table Quickrace scenario (scenario.vehicle, scenario.track).
function scenario_quickRace.loadVehicle(scenario) end

--- End-of-mission hook: stops and deletes the track's flowgraph if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:140
function scenario_quickRace.onClientEndMission() end

--- Hook called by the UI at the end of the countdown: unfreezes the player vehicle (controller.setFreeze(0)) and clears the times list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:227
function scenario_quickRace.onCountdownEnded() end

--- Hook called by the scenario loader. Reverses the path if track.reverse, runs path:autoConfig(), generates sc.generatedNodes (nodes named '__generated_from_path__<id>' with pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, and optionally sc.BranchLapConfig and sc.lapConfigBranches, then merges them into sc.nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:89
---@param sc table Quickrace scenario.
function scenario_quickRace.onCustomWaypoints(sc) end

--- Hook called by the scenario loader. If the track (sc.track) defines a flowgraph, loads it and runs it in transient mode; if it defines raceFile, reads the JSON, builds a gameplay/race/path in sc.path and computes sc.track.startTransform according to rollingStart and reverse. Ends with loadVehicle(sc).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:17
---@param sc table Quickrace scenario (sc.track, sc.vehicle).
function scenario_quickRace.onLoadCustomPrefabs(sc) end

--- Hook called at the end of the race. Records the final time (final.finalTime in seconds, converted to ms) in the highscores, fills scenario.highscores (scores, place, singleScores) and scenario.detailedRecord for the results screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:318
---@param final table Final result, with finalTime in seconds.
function scenario_quickRace.onRaceResult(final) end

--- Hook called by the race system at each waypoint. At the last waypoint (or return to the first), computes the lap time, records it in the highscores (core_highscores.setScenarioHighscoresCustom) and updates scenario.highscores.singleRound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:260
---@param wpInfo table Waypoint information: next, time (cumulative time).
function scenario_quickRace.onRaceWaypointReached(wpInfo) end

--- Hook called when the scenario is loaded. Turns on the fog lights and lights of the player vehicle if track.tod is 0, 1 or 8 (night), and reverses the direction (rot) of the nodes if track.reverse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:148
---@param sc table Quickrace scenario.
function scenario_quickRace.onScenarioLoaded(sc) end

--- Hook called when the UI state changes: if returning from 'menu.quickrace' to 'menu' while timeTrialOpen is true, closes the configuration again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRace.lua:381
---@param curUIState string New UI state.
---@param prevUIState string Previous state.
function scenario_quickRace.onUiChangedState(curUIState, prevUIState) end

