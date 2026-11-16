# `scenario_quickRace`

*File: `lua/ge/extensions/scenario/quickRace.lua` · VM: Game Engine (GE) · 410 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_quickRace`: `extensions.load("scenario_quickRace")`, then the global `scenario_quickRace`

Quick race (quickrace) logic: loads the track's prefabs and flowgraph, creates the player's vehicle at the start position, converts the race path (raceFile file) into nodes and lap configuration (lapConfig) for the scenario system, then records times and highscores. It only activates for scenarios built by scenario_quickRaceLoader (scenario.isQuickRace).

## Notes

- The onRaceWaypointReached and onRaceResult hooks exit immediately if the current scenario does not have isQuickRace.
- M.addCheckPoint and M.loadCheckpoints are exported but are nil (local variables never defined): do not use.
- In onRaceWaypointReached, each lap's time is obtained by subtracting the previous cumulative times; single-lap highscores use the key getConfigKey(false, nil, 0).
- In onRaceWaypointReached, the loop that increments scenario.highscores.singleRound uses the index k instead of v: questionable behavior.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_quickRace.changeTimeTrialConfig()` | Toggles the quickrace configuration screen during a race: opens the 'menu.quickrace' menu while pausing the simulation, or closes it and resumes (simTimeAuthority.pause). | 365 |
| `scenario_quickRace.getConfigKey(rolling, reverse, laps)` | Builds the configuration key used for highscores: 'standing' or 'rolling', suffix 'Reverse' if reverse, then the lap count. nil arguments fall back to scenario.rollingStart, scenario.isReverse and scenario.lapCount. | 238 |
| `scenario_quickRace.getNodesOnBranch(segment, config)` | Recursively walks the segments of a race path and returns the list of generated node names (_generatedName); at forks, adds a sub-list of '__b<id>' markers and fills config.branches. *(internal)* | 67 |
| `scenario_quickRace.getVehicleBrand(scenario)` | Returns the make of the scenario's vehicle (scenario.vehicle.file.Brand). | 310 |
| `scenario_quickRace.getVehicleName(scenario)` | Returns the name of the scenario's vehicle (scenario.vehicle.file.Name). | 314 |
| `scenario_quickRace.loadVehicle(scenario)` | Creates the player's vehicle (scenario.vehicle) named 'scenario_player0' with core_vehicles.spawnNewVehicle, at the computed start position (startTransform of the raceFile, or failing that the track's standing/rolling[/Reverse] spawnSphere), then adds it to the ScenarioObjectsGroup group. If the spawnSphere is not found, uses 0/0/0 with an error in the log. | 167 |
| `scenario_quickRace.onClientEndMission()` | End-of-mission hook: stops and deletes the track's flowgraph if it exists. *(internal)* *(hook)* | 140 |
| `scenario_quickRace.onCountdownEnded()` | Hook called by the UI at the end of the countdown: unfreezes the player vehicle (controller.setFreeze(0)) and clears the times list. *(internal)* *(hook)* | 227 |
| `scenario_quickRace.onCustomWaypoints(sc)` | Hook called by the scenario loader. Reverses the path if track.reverse, runs path:autoConfig(), generates sc.generatedNodes (nodes named '__generated_from_path__<id>' with pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, and optionally sc.BranchLapConfig and sc.lapConfigBranches, then merges them into sc.nodes. *(internal)* *(hook)* | 89 |
| `scenario_quickRace.onLoadCustomPrefabs(sc)` | Hook called by the scenario loader. If the track (sc.track) defines a flowgraph, loads it and runs it in transient mode; if it defines raceFile, reads the JSON, builds a gameplay/race/path in sc.path and computes sc.track.startTransform according to rollingStart and reverse. Ends with loadVehicle(sc). *(internal)* *(hook)* | 17 |
| `scenario_quickRace.onRaceResult(final)` | Hook called at the end of the race. Records the final time (final.finalTime in seconds, converted to ms) in the highscores, fills scenario.highscores (scores, place, singleScores) and scenario.detailedRecord for the results screen. *(internal)* *(hook)* | 318 |
| `scenario_quickRace.onRaceWaypointReached(wpInfo)` | Hook called by the race system at each waypoint. At the last waypoint (or return to the first), computes the lap time, records it in the highscores (core_highscores.setScenarioHighscoresCustom) and updates scenario.highscores.singleRound. *(internal)* *(hook)* | 260 |
| `scenario_quickRace.onScenarioLoaded(sc)` | Hook called when the scenario is loaded. Turns on the fog lights and lights of the player vehicle if track.tod is 0, 1 or 8 (night), and reverses the direction (rot) of the nodes if track.reverse. *(internal)* *(hook)* | 148 |
| `scenario_quickRace.onUiChangedState(curUIState, prevUIState)` | Hook called when the UI state changes: if returning from 'menu.quickrace' to 'menu' while timeTrialOpen is true, closes the configuration again. *(internal)* *(hook)* | 381 |

### Parameter details

#### `scenario_quickRace.getConfigKey(rolling, reverse, laps)`

Builds the configuration key used for highscores: 'standing' or 'rolling', suffix 'Reverse' if reverse, then the lap count. nil arguments fall back to scenario.rollingStart, scenario.isReverse and scenario.lapCount.

- `rolling` (*boolean|nil*) : Rolling start.
- `reverse` (*boolean|nil*) : Reverse direction.
- `laps` (*integer|nil*) : Number of laps.
- **returns**: string For example 'rollingReverse3'.

#### `scenario_quickRace.getNodesOnBranch(segment, config)`

Recursively walks the segments of a race path and returns the list of generated node names (_generatedName); at forks, adds a sub-list of '__b<id>' markers and fills config.branches.

- `segment` (*table*) : Start segment (object of path.segments).
- `config` (*table*) : Configuration table modified: receives config.branches.
- **returns**: table Ordered list of node names (may contain sub-lists for forks).

#### `scenario_quickRace.getVehicleBrand(scenario)`

Returns the make of the scenario's vehicle (scenario.vehicle.file.Brand).

- `scenario` (*table*) : Quickrace scenario.
- **returns**: string Make.

#### `scenario_quickRace.getVehicleName(scenario)`

Returns the name of the scenario's vehicle (scenario.vehicle.file.Name).

- `scenario` (*table*) : Quickrace scenario.
- **returns**: string Name.

#### `scenario_quickRace.loadVehicle(scenario)`

Creates the player's vehicle (scenario.vehicle) named 'scenario_player0' with core_vehicles.spawnNewVehicle, at the computed start position (startTransform of the raceFile, or failing that the track's standing/rolling[/Reverse] spawnSphere), then adds it to the ScenarioObjectsGroup group. If the spawnSphere is not found, uses 0/0/0 with an error in the log.

- `scenario` (*table*) : Quickrace scenario (scenario.vehicle, scenario.track).

#### `scenario_quickRace.onCustomWaypoints(sc)`

Hook called by the scenario loader. Reverses the path if track.reverse, runs path:autoConfig(), generates sc.generatedNodes (nodes named '__generated_from_path__<id>' with pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, and optionally sc.BranchLapConfig and sc.lapConfigBranches, then merges them into sc.nodes.

- `sc` (*table*) : Quickrace scenario.

#### `scenario_quickRace.onLoadCustomPrefabs(sc)`

Hook called by the scenario loader. If the track (sc.track) defines a flowgraph, loads it and runs it in transient mode; if it defines raceFile, reads the JSON, builds a gameplay/race/path in sc.path and computes sc.track.startTransform according to rollingStart and reverse. Ends with loadVehicle(sc).

- `sc` (*table*) : Quickrace scenario (sc.track, sc.vehicle).

#### `scenario_quickRace.onRaceResult(final)`

Hook called at the end of the race. Records the final time (final.finalTime in seconds, converted to ms) in the highscores, fills scenario.highscores (scores, place, singleScores) and scenario.detailedRecord for the results screen.

- `final` (*table*) : Final result, with finalTime in seconds.

#### `scenario_quickRace.onRaceWaypointReached(wpInfo)`

Hook called by the race system at each waypoint. At the last waypoint (or return to the first), computes the lap time, records it in the highscores (core_highscores.setScenarioHighscoresCustom) and updates scenario.highscores.singleRound.

- `wpInfo` (*table*) : Waypoint information: next, time (cumulative time).

#### `scenario_quickRace.onScenarioLoaded(sc)`

Hook called when the scenario is loaded. Turns on the fog lights and lights of the player vehicle if track.tod is 0, 1 or 8 (night), and reverses the direction (rot) of the nodes if track.reverse.

- `sc` (*table*) : Quickrace scenario.

#### `scenario_quickRace.onUiChangedState(curUIState, prevUIState)`

Hook called when the UI state changes: if returning from 'menu.quickrace' to 'menu' while timeTrialOpen is true, closes the configuration again.

- `curUIState` (*string*) : New UI state.
- `prevUIState` (*string*) : Previous state.

## Fields

| Field | Type | Description |
|---|---|---|
| `addCheckPoint` | any |  ⚠ reference `addCheckPoint` not defined in the file (probably nil) |
| `loadCheckpoints` | any |  ⚠ reference `loadCheckpoints` not defined in the file (probably nil) |

**UI events (guihooks.trigger):** `MenuItemNavigation`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/quickRace.lua`.*
