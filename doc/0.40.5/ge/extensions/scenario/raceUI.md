# `scenario_raceUI`

*File: `lua/ge/extensions/scenario/raceUI.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_raceUI`: `extensions.load("scenario_raceUI")`, then the global `scenario_raceUI`

Bridge between the scenario race and the interface: sends the UI the waypoint progress (WayPointChange), lap progress (RaceLapChange) and time comparisons with the previous lap (RaceCheckpointComparison, RaceTimeComparison). Only reacts to events of player 0's vehicle.

## Notes

- UI events emitted by guihooks.trigger: WayPointChange {current, count} or nil, RaceLapChange {current, count} or nil, RaceCheckpointComparison {timeOut = 5000, time}, RaceTimeComparison {timeOut = 5000, time}.
- The comparisons are only emitted from the second lap (lastTimeId > 1), and are ignored if scenario.disableWaypointTimes is true.
- On each completed lap, a ui_message 'lap N time: X.XXXs' is displayed for 2 s.
- M.initialise is not a hook: it must be called explicitly by the scenario code.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_raceUI.initialise(scenario)` | Clears the stored waypoint times and clears the waypoint and lap displays on the UI side. | 10 |
| `scenario_raceUI.onRaceLap(data)` | Hook called on each completed lap. For the player's vehicle, updates the lap number (capped at lapCount), resets the waypoint progress to full and displays the lap time. *(internal)* *(hook)* | 70 |
| `scenario_raceUI.onRaceStart()` | Race start hook: sends WayPointChange {current = 0, count = N} if the lap configuration has more than one waypoint, and RaceLapChange {current = 1, count = lapCount} if lapCount > 1. *(internal)* *(hook)* | 17 |
| `scenario_raceUI.onRaceWaypointReached(data)` | Hook called on each waypoint reached. For the player's vehicle, stores the time, emits the time comparisons with the previous lap and updates the waypoint progress. *(internal)* *(hook)* | 38 |
| `scenario_raceUI.onScenarioChange(scenario)` | Scenario state change hook: clears the waypoint display when the scenario is absent or in 'pre-start'. *(internal)* *(hook)* | 30 |

### Parameter details

#### `scenario_raceUI.initialise(scenario)`

Clears the stored waypoint times and clears the waypoint and lap displays on the UI side.

- `scenario` (*table*) : Scenario (unused).

#### `scenario_raceUI.onRaceLap(data)`

Hook called on each completed lap. For the player's vehicle, updates the lap number (capped at lapCount), resets the waypoint progress to full and displays the lap time.

- `data` (*table*) : Lap data: vehicleId, lap, time (seconds).

#### `scenario_raceUI.onRaceWaypointReached(data)`

Hook called on each waypoint reached. For the player's vehicle, stores the time, emits the time comparisons with the previous lap and updates the waypoint progress.

- `data` (*table*) : Waypoint data: vehicleId, time, cur, currentLapConfig.

#### `scenario_raceUI.onScenarioChange(scenario)`

Scenario state change hook: clears the waypoint display when the scenario is absent or in 'pre-start'.

- `scenario` (*table|nil*) : Current scenario.

**UI events (guihooks.trigger):** `RaceCheckpointComparison`, `RaceLapChange`, `RaceTimeComparison`, `WayPointChange`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceUI.lua`.*
