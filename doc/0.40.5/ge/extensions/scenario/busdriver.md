# `scenario_busdriver`

*File: `lua/ge/extensions/scenario/busdriver.lua` · VM: Game Engine (GE) · 861 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_busdriver`: `extensions.load("scenario_busdriver")`, then the global `scenario_busdriver`

Bus driving scenario (line route with stops). From the scenario.busdriver configuration (routeID, variance, strictStop, simulatePassengers, traffic), it retrieves the line via core_busRouteManager.setLine, draws the ground path (core_groundMarkers), tracks the bus stop triggers (BeamNGTrigger of type 'busstop' and 'buswp'), handles the 5 s wait time at the stop, the doors and the kneeling position, moves 4 stop frame markers and ends the scenario as a success at the last stop or as a failure if a stop is skipped. The player is the vehicle 'scenario_player0'.

## Example

```lua
-- in the scenario JSON:
-- "busdriver": {"routeID": "ligne1", "variance": "a", "strictStop": true, "simulatePassengers": true, "traffic": true}
```

## Notes

- Depends on scenario_scenarios and core_groundMarkers. The player is assumed to be the vehicle named 'scenario_player0'.
- A task (stop) of currentLine.tasklist is a list: [1] trigger name, [2] displayed name, [3] position {x,y,z}, [4] rotation (quaternion), [5] size {length, width} (inferred from code).
- Triggers have data.type 'busstop' (line stops) or 'buswp' (waypoints); data.event is 'enter' or 'exit', data.subjectName the vehicle, data.triggerName the trigger.
- Entering a stop without having passed the previous one fails the scenario (key 'scenarios.busRoutes.skip'). Leaving before the end of the wait (stopTimer < 5) or before stopComplete does not complete the stop.
- With busConfig.strictStop, you must open the doors (bus_dooropen) and kneel (bus_kneel) at the stop, otherwise messages prompt you to do so. The camera switches to 'onboard.rider' then 'external' during the stop, and the previous camera is restored at the end.
- UI messages sent via ScenarioRealtimeDisplay: keys scenarios.busRoutes.alreadyStop, stop, kneel, open, wait (context.remaining), close, raise, proceed, success. UI events: BusDisplayUpdate (remaining line) and BusRouteStats (disabled).
- The statistics computation (smoothness, stop angle, stop distance, damage) runs in onPreRender but its sending to the UI and to statistics_statistics is disabled (if false, ticket #2783).
- Probable bug: in onPreRender, the variable playerVehicle used to compute vehPos (near the navhelp handling) is not declared locally (only pv is): if it does not exist as a global, the call crashes.
- In onPreRender, the variable debugPath is always nil (its declaration is commented out): the sphere debug drawing never runs. Use M.enabledLineDebug instead to draw the full line.
- requestState modifies currentLine.tasklist in place (tmp = currentLine is not a copy): after a call, the list is truncated to the remaining stops.
- onVehicleStoppedMoving and computeStats exist but the hook is not exported (M.onVehicleStoppedMoving is commented out).
- onExtensionUnloaded unfreezes the player vehicle (controller.setFreeze(0)) and clears the groundMarkers path; reset() freezes it (setFreeze(1)).

**Dependencies (loaded first):** `scenario_scenarios`, `core_groundMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_busdriver.fail(reason)` | Ends the scenario as a failure (scenario_scenarios.finish({failed = reason})) then resets the module state. | 80 |
| `scenario_busdriver.onBeamNGTrigger(data)` | Hook called when a BeamNGTrigger is crossed. Handles entering and leaving the line's bus stops (type 'busstop') and recording waypoints (type 'buswp'). *(internal)* *(hook)* | 347 |
| `scenario_busdriver.onBusUpdate(state)` | Hook sent by the bus (vehicle) controller with events: 'onTriggerTick' (stop progress: speed, doors, kneeling), 'onApproachStop' (shows the stop markers, target alpha 1) and 'onDepartedStop' (restores the original bounding box). *(internal)* *(hook)* | 668 |
| `scenario_busdriver.onClientEndMission()` | End-of-mission hook: clears the marker list. *(internal)* *(hook)* | 838 |
| `scenario_busdriver.onExtensionUnloaded()` | Unload hook: clears the markers, clears the groundMarkers path and unfreezes the player vehicle. *(internal)* *(hook)* | 801 |
| `scenario_busdriver.onPhysicsPaused()` | Hook: physics is paused; the stop timer no longer advances. *(internal)* *(hook)* | 812 |
| `scenario_busdriver.onPhysicsUnpaused()` | Hook: physics resumes. *(internal)* *(hook)* | 816 |
| `scenario_busdriver.onPreRender(dt, dtSim)` | Hook called before each frame. Animates the markers' alpha, computes driving statistics (acceleration, jerk, damage, stop distance and angle), updates the ground path to the next stop (core_groundMarkers.setPath) and colors the markers depending on whether the bus is in the stop zone. *(internal)* *(hook)* | 501 |
| `scenario_busdriver.onRaceResult(final)` | End-of-race hook: if playerWon is true, records the final time in the highscores (core_highscores.setScenarioHighscoresCustom, key 'busRoute'). *(internal)* *(hook)* | 421 |
| `scenario_busdriver.onRaceStart()` | Race start hook: resets, loads the line, unfreezes the player, creates the 4 TSStatic markers (busMarkerTL, TR, BL, BR, model position_marker.dae) in ScenarioObjectsGroup, checks the road map's navhelp points and draws the path to the first stop (line's routeColor color). Sets running to true. *(internal)* *(hook)* | 229 |
| `scenario_busdriver.onScenarioLoaded(scenario)` | Hook called when the scenario is loaded. If busdriver.simulatePassengers, adds the part 'citybus_seats_ballast' to the player vehicle's configuration; if busdriver.traffic and traffic is off, starts traffic with trafficAmount (or the maximum for 12 vehicles if 0). *(internal)* *(hook)* | 781 |
| `scenario_busdriver.onScenarioRestarted(scenario)` | Hook called when the scenario restarts: resets the state and reloads the line. *(internal)* *(hook)* | 188 |
| `scenario_busdriver.onVehicleSwitched(oldId, newId, player)` | Hook called on vehicle switch. For player 0, resets, freezes the new vehicle and reloads the line; fails if the line is not found. *(internal)* *(hook)* | 448 |
| `scenario_busdriver.requestState()` | Requested by the UI: sends to the BusDisplayUpdate event the current line reduced to the remaining stops (from the next one). Logs an error and exits if no line is loaded. | 820 |

### Parameter details

#### `scenario_busdriver.fail(reason)`

Ends the scenario as a failure (scenario_scenarios.finish({failed = reason})) then resets the module state.

- `reason` (*string|table*) : Failure message or translation key.

#### `scenario_busdriver.onBeamNGTrigger(data)`

Hook called when a BeamNGTrigger is crossed. Handles entering and leaving the line's bus stops (type 'busstop') and recording waypoints (type 'buswp').

- `data` (*table*) : {type, event ('enter'|'exit'), subjectName, triggerName}.

#### `scenario_busdriver.onBusUpdate(state)`

Hook sent by the bus (vehicle) controller with events: 'onTriggerTick' (stop progress: speed, doors, kneeling), 'onApproachStop' (shows the stop markers, target alpha 1) and 'onDepartedStop' (restores the original bounding box).

- `state` (*table*) : {event, triggerName, speed, bus_dooropen, bus_kneel}.

#### `scenario_busdriver.onPreRender(dt, dtSim)`

Hook called before each frame. Animates the markers' alpha, computes driving statistics (acceleration, jerk, damage, stop distance and angle), updates the ground path to the next stop (core_groundMarkers.setPath) and colors the markers depending on whether the bus is in the stop zone.

- `dt` (*number*) : Real frame duration (s).
- `dtSim` (*number*) : Simulated duration (s).

#### `scenario_busdriver.onRaceResult(final)`

End-of-race hook: if playerWon is true, records the final time in the highscores (core_highscores.setScenarioHighscoresCustom, key 'busRoute').

- `final` (*table*) : Result, final.finalTime in seconds.

#### `scenario_busdriver.onScenarioLoaded(scenario)`

Hook called when the scenario is loaded. If busdriver.simulatePassengers, adds the part 'citybus_seats_ballast' to the player vehicle's configuration; if busdriver.traffic and traffic is off, starts traffic with trafficAmount (or the maximum for 12 vehicles if 0).

- `scenario` (*table*) : Loaded scenario (scenario.busdriver).

#### `scenario_busdriver.onScenarioRestarted(scenario)`

Hook called when the scenario restarts: resets the state and reloads the line.

- `scenario` (*table*) : Restarted scenario.

#### `scenario_busdriver.onVehicleSwitched(oldId, newId, player)`

Hook called on vehicle switch. For player 0, resets, freezes the new vehicle and reloads the line; fails if the line is not found.

- `oldId` (*integer*) : Old vehicle identifier.
- `newId` (*integer*) : New identifier.
- `player` (*integer*) : Player index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded first: scenario_scenarios, core_groundMarkers. |
| `enabledLineDebug` | boolean | If true, onPreRender draws the whole route (renderDebugLine) with debug texts. False by default. |

**UI events (guihooks.trigger):** `BusDisplayUpdate`, `BusRouteStats`, `ScenarioRealtimeDisplay`

## Calls into the engine (C++)

- `Sim.` `upcast`
- `be:` `castRay`
- `core_environment.` `getGravity`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/busdriver.lua`.*
