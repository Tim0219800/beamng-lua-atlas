# `scenario_waypointAction`

*File: `lua/ge/extensions/scenario/waypointAction.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_waypointAction`: `extensions.load("scenario_waypointAction")`, then the global `scenario_waypointAction`

"wayPointAction" scenario goal: displays an on-screen message when a vehicle reaches certain waypoints of the race. Loaded by scenario_raceGoals (init, processState, updateFinalStatus); declared in goals.vehicles with id 'wayPointAction'.

## Example

```lua
-- JSON: {"id":"wayPointAction", "vehicle":"scenario_player0", "value":{"wayPointNum":[2,4], "wayPointMsg":["Moitié !", "Presque fini"]}}
```

## Notes

- On the 'onRaceWaypointReached' event (only if scenario.state == 'running' and raceState == 'racing'), compares vehWpData.cur (current waypoint index, via scenario_waypoints.getVehicleWaypointData) with each entry of value.wayPointNum and displays value.wayPointMsg[i] for 2 s (helper.flashUiMessage) at the matching index.
- BUG/inconsistency: init sets value.wayPointMsg to the string " " if absent; indexing it like an array (wayPointMsg[i]) gives nil and the displayed message is empty/nil.
- BUG/inconsistency: init does not check that wayPointNum exists; if it is nil, processState calls next(nil) and raises a Lua error.
- BUG/inconsistency: if getVehicleWaypointData returns nil (vehicle without waypoint data), vehWpData.cur raises an error.
- updateFinalStatus is empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_waypointAction.init(scenario)` | Rebuilds M.instances from scenario.goals.vehicles (id == 'wayPointAction') after validating the type of wayPointNum (array). *(internal)* | 38 |
| `scenario_waypointAction.processState(scenario, state, stateData)` | Called by scenario_raceGoals; only reacts to 'onRaceWaypointReached' during the race and displays the message of the waypoint reached. *(internal)* | 9 |
| `scenario_waypointAction.updateFinalStatus(scenario, instance)` | Called at the end of the scenario; does nothing. *(internal)* | 55 |

### Parameter details

#### `scenario_waypointAction.init(scenario)`

Rebuilds M.instances from scenario.goals.vehicles (id == 'wayPointAction') after validating the type of wayPointNum (array).

- `scenario` (*table*) : current scenario

#### `scenario_waypointAction.processState(scenario, state, stateData)`

Called by scenario_raceGoals; only reacts to 'onRaceWaypointReached' during the race and displays the message of the waypoint reached.

- `scenario` (*table*) : current scenario
- `state` (*string*) : hook name
- `stateData` (*table|nil*) : hook data (unused)

#### `scenario_waypointAction.updateFinalStatus(scenario, instance)`

Called at the end of the scenario; does nothing.

- `scenario` (*table*) : current scenario
- `instance` (*table*) : unused

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | 'wayPointAction' goal instances for the current scenario, filled by init. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/waypointAction.lua`.*
