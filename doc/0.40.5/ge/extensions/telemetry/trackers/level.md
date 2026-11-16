# `telemetry_trackers_level`

*File: `lua/ge/extensions/telemetry/trackers/level.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_level`: `extensions.load("telemetry_trackers_level")`, then the global `telemetry_trackers_level`

Levels and scenarios telemetry tracker: which levels are played and for how long (activity "levelLoaded"), plus the scenario lifecycle (activity "scenarioRunning" with the result). The level load time (loadMs) is added at the end of the levelLoaded activity, because loading is only finished well after its opening. The per-frame tracking of collisions and damage that existed here was removed (too many events).

## Notes

- loadMs goes from onClientPreStartMission to state 2 of onWorldReadyState. The wait for materials in state 2 gives up after 5 s: a very slow load reports the moment of giving up. A level without a player vehicle reaches state 2 immediately and seems fast.
- Entering a level the game is already in skips onClientPreStartMission: the level is then reported without a load time rather than with that of the previous one.
- Flowgraph scenarios never reach scenario_scenarios (onScenarioLoaded does not fire for them) and have no end signal: onFlowgraphScenarioStarted is the same callback as onScenarioLoaded and endLevel closes them with the result "aborted".
- Scenario results: success, failed (pooledResults[1].failed), restarted, aborted.
- At the end of a level, the tracker asks for the report to be written (telemetry_core.triggerReportWrite).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_level.onClientEndMission(levelPath)` | Hook called on leaving the level: ends any scenario and the level. *(internal)* *(hook)* | 84 |
| `telemetry_trackers_level.onClientPreStartMission(levelPath)` | Hook called at the very top of the loading chain (before datablocks, objects and physics), on every load including restarts: stores the load start time. *(internal)* *(hook)* | 57 |
| `telemetry_trackers_level.onClientStartMission(levelPath)` | Hook called when the level starts (loading screen still displayed): starts the levelLoaded activity. *(internal)* *(hook)* | 62 |
| `telemetry_trackers_level.onExit()` | Hook called when the game closes: closes the open activities so as not to leave starts without ends in the session file. *(internal)* *(hook)* | 114 |
| `telemetry_trackers_level.onExtensionLoaded()` | Hook called on load: manual unload; if a level is already loaded, starts the activity immediately. *(internal)* *(hook)* | 103 |
| `telemetry_trackers_level.onExtensionUnloaded()` | Hook called on unload: a Lua reload destroys the trackers without onExit, so the activities are also closed here (same function as endLevel). *(internal)* *(hook)* | 39 |
| `telemetry_trackers_level.onFlowgraphScenarioStarted(scenario)` | Hook called when a flowgraph scenario starts; same function as onScenarioLoaded. *(internal)* *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioFinished(scenario)` | Hook called at the end of a scenario: ends the activity with "failed" or "success" according to pooledResults[1].failed. *(internal)* *(hook)* | 93 |
| `telemetry_trackers_level.onScenarioLoaded(scenario)` | Hook called when a scenario loads: starts the scenarioRunning activity (name and source file). *(internal)* *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioRestarted(scenario)` | Hook called when a scenario restarts: ends the activity with "restarted" then starts a new one. *(internal)* *(hook)* | 98 |
| `telemetry_trackers_level.onWorldReadyState(state)` | Hook called on world readiness state changes. State 2 is the first moment the player can drive (camera with its control object, vehicle materials ready): computes loadMs. *(internal)* *(hook)* | 77 |

### Parameter details

#### `telemetry_trackers_level.onClientEndMission(levelPath)`

Hook called on leaving the level: ends any scenario and the level.

- `levelPath` (*string*) : Level path.

#### `telemetry_trackers_level.onClientPreStartMission(levelPath)`

Hook called at the very top of the loading chain (before datablocks, objects and physics), on every load including restarts: stores the load start time.

- `levelPath` (*string*) : Level path.

#### `telemetry_trackers_level.onClientStartMission(levelPath)`

Hook called when the level starts (loading screen still displayed): starts the levelLoaded activity.

- `levelPath` (*string*) : Level path.

#### `telemetry_trackers_level.onFlowgraphScenarioStarted(scenario)`

Hook called when a flowgraph scenario starts; same function as onScenarioLoaded.

- `scenario` (*table*) : Scenario.

#### `telemetry_trackers_level.onScenarioFinished(scenario)`

Hook called at the end of a scenario: ends the activity with "failed" or "success" according to pooledResults[1].failed.

- `scenario` (*table*) : Finished scenario.

#### `telemetry_trackers_level.onScenarioLoaded(scenario)`

Hook called when a scenario loads: starts the scenarioRunning activity (name and source file).

- `scenario` (*table*) : Scenario (name, sourceFile).

#### `telemetry_trackers_level.onScenarioRestarted(scenario)`

Hook called when a scenario restarts: ends the activity with "restarted" then starts a new one.

- `scenario` (*table*) : Scenario.

#### `telemetry_trackers_level.onWorldReadyState(state)`

Hook called on world readiness state changes. State 2 is the first moment the player can drive (camera with its control object, vehicle materials ready): computes loadMs.

- `state` (*integer*) : Readiness state (only 2 is used).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/level.lua`.*
