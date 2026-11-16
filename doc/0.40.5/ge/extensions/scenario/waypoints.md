# `scenario_waypoints`

*File: `lua/ge/extensions/scenario/waypoints.lua` · VM: Game Engine (GE) · 757 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_waypoints`: `extensions.load("scenario_waypoints")`, then the global `scenario_waypoints`

Waypoint system of a race scenario: from scenario.lapConfig (ordered list of waypoints/triggers) and the branches (lapConfigBranches), builds a successor graph, displays the markers (raceMarker) and detects every frame the passage of the wheels of the player's or AI-driven vehicles through the next waypoint. Emits the race hooks (onRaceWaypointReached, onRaceWaypoint, onRaceLap, onRaceBranchChosen) and ends the race when the last waypoint of the last lap is crossed. Loaded by scenario_scenariosLoader with scenario_scenarios.

## Example

```lua
-- in a scenario extension:
local function onRaceWaypointReached(data)
  -- data = {cur, curPos, curRot, curRadius, next, vehicleId, vehicleName, waypointName, time, lapDiff, currentLapConfig}
end
local d = scenario_waypoints.getVehicleWaypointData(be:getPlayerVehicleID(0))
if d then print(d.cur, d.next, d.lap) end
```

## Notes

- Depends on scenario_scenarios (M.dependencies). Initialized by scenario_scenarios on entering 'pre-running' (initialise) and on each restart (onScenarioRestarted).
- M.state: vehicleWaypointsData[vehicleId] = {cur, next, lap, waypointConfig, nextWps, historicalLapConfig, wheelOffsets, currentCorners, previousCorners}; nextWpForVehicle; waypointBranches; branchGraph; pathnodes; lapConfigName; originalBranches. Reset by onScenarioChange(nil) and onClientEndMission.
- Indices: cur = -1 (before the start) then 0 (first target reached); in a rolling start (rollingStart with startTimerCheckpoint) cur starts at -2. After crossing, cur is the (1-based) index in waypointConfig of the waypoint just reached, next that of the following one or nil at the end. getNextWaypoint returns 1 for a new lap as long as lap + 1 < lapCount (lapCount == 0: infinite laps).
- Detection: onPreRender computes the current position of the corners (one per wheel, wheel axle offset) and tests the previous->current segment against each successor pathnode (pn:intersectCorners). dtOff = dtSim * (1 - tNorm) corrects the crossing time: time = scenario.timer - dtOff.
- Markers: modes 'default' (red), 'lap' (end of lap), 'final' (last waypoint of the last race), 'branch' (fork), 'next' (next of the nexts), 'start'; only shown for playerUsable vehicles.
- BUG/inconsistency: onScenarioVehicleTrigger, in the rolling start branch (rollingStart and cur == 0), emits onRaceWaypoint with the variable 'data' which is only declared further down (nil value at that point): the hook receives nil.
- BUG/inconsistency: M.onUpdate and M.addWaypointBranch are assigned from undefined variables (nil): these fields do not actually exist.
- BUG/inconsistency: deactivateWaypointBranch starts with "do return end": the function does nothing. isFinalWaypoint always returns false (code comment: "this always returns false or what?").
- BUG/inconsistency: initialise reads scenario.lapConfig before the "if scenario" test (error if there is no scenario); updateResetVehicleData mixes and/or without parentheses: "vehicleWaypointsData and not data[id] or not curWpIndex".
- BUG/inconsistency: onScenarioRestarted uses the scenario argument before redeclaring it (shadowing); undefined lapConfigBranches raises an error in insertWaypoints.

**Dependencies (loaded first):** `scenario_scenarios`

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff)` | Inserts into the vehicle's waypoint list the waypoints of the chosen branch, after the current waypoint, then emits onRaceBranchChosen({branchName, time, vehicleId, vehicleName}). | 324 |
| `scenario_waypoints.deactivateWaypointBranch(branchName)` | Does nothing (returns immediately). | 309 |
| `scenario_waypoints.getVehicleWaypointData(vehicleId)` | Returns a deep copy of a vehicle's waypoint data (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, wheel corners...). | 680 |
| `scenario_waypoints.initialise()` | Called by scenario_scenarios in 'pre-running': resets the state, builds the branches and the successor graph, creates a pathnode per waypoint, configures the markers (raceMarker.setupMarkers) and initializes the data of each vehicle in the scenario. Does nothing if lapConfig is empty. *(internal)* | 518 |
| `scenario_waypoints.isFinalWaypoint(vehicleId, waypointName)` | Supposed to tell whether a waypoint is the last one; always returns false (body commented out in the code). | 665 |
| `scenario_waypoints.onClientEndMission()` | Level end hook: clears the state. *(internal)* *(hook)* | 724 |
| `scenario_waypoints.onDeserialized(data)` | Deserialization hook: restores the state by converting vehicle names back to ids. *(internal)* *(hook)* | 697 |
| `scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw)` | Per-frame hook (luaPreRender): updates the wheel corners of each tracked vehicle and detects the crossing of the next waypoint. *(internal)* *(hook)* | 606 |
| `scenario_waypoints.onScenarioChange(scenario)` | Hook emitted by scenario_scenarios on each state change; clears the system state when the scenario is nil (stop). *(internal)* *(hook)* | 267 |
| `scenario_waypoints.onScenarioRestarted(scenario)` | Hook emitted when a scenario restarts: restores lapConfig, clears the state, rebuilds branches and the successor graph. *(internal)* *(hook)* | 495 |
| `scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff)` | Called internally when a vehicle crosses its target waypoint: processes the waypoint (markers, next), emits onRaceWaypointReached(data) (and onRaceWaypoint for playerUsable vehicles, with a sound), handles the end of the race (scenario_scenarios.endRace) and the laps (onRaceLap). Marked "private" in the code. *(internal)* *(hook)* | 205 |
| `scenario_waypoints.onSerialize()` | Serialization hook before Lua reload: returns the data per vehicle name. *(internal)* *(hook)* | 685 |
| `scenario_waypoints.onVehicleAIStateChanged(data)` | Hook emitted by scenario_scenarios: initializes waypoint tracking for a vehicle whose AI has just been enabled. *(internal)* *(hook)* | 706 |
| `scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex)` | Resets the waypoint data of a vehicle that was put back in place: without curWpIndex (or with missing data) recreates them, otherwise sets cur = curWpIndex - 1 and next = nextWpIndex - 1 and reprocesses the waypoint. Used by checkpoints.lua according to the code. | 712 |

### Parameter details

#### `scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff)`

Inserts into the vehicle's waypoint list the waypoints of the chosen branch, after the current waypoint, then emits onRaceBranchChosen({branchName, time, vehicleId, vehicleName}).

- `branchName` (*string*) : branch name (key of lapConfigBranches)
- `vehicleId` (*integer*) : vehicle id
- `dtOff` (*number*) : time correction (s)

#### `scenario_waypoints.deactivateWaypointBranch(branchName)`

Does nothing (returns immediately).

- `branchName` (*string*) : branch name

#### `scenario_waypoints.getVehicleWaypointData(vehicleId)`

Returns a deep copy of a vehicle's waypoint data (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, wheel corners...).

- `vehicleId` (*integer*) : vehicle id
- **returns**: table|nil data or nil

#### `scenario_waypoints.isFinalWaypoint(vehicleId, waypointName)`

Supposed to tell whether a waypoint is the last one; always returns false (body commented out in the code).

- `vehicleId` (*integer*) : vehicle id
- `waypointName` (*string*) : waypoint name
- **returns**: boolean always false

#### `scenario_waypoints.onDeserialized(data)`

Deserialization hook: restores the state by converting vehicle names back to ids.

- `data` (*table*) : data from onSerialize

#### `scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw)`

Per-frame hook (luaPreRender): updates the wheel corners of each tracked vehicle and detects the crossing of the next waypoint.

- `dtReal` (*number*) : real time (s)
- `dtSim` (*number*) : simulated time (s)
- `dtRaw` (*number*) : raw time (s)

#### `scenario_waypoints.onScenarioChange(scenario)`

Hook emitted by scenario_scenarios on each state change; clears the system state when the scenario is nil (stop).

- `scenario` (*table|nil*) : scenario or nil

#### `scenario_waypoints.onScenarioRestarted(scenario)`

Hook emitted when a scenario restarts: restores lapConfig, clears the state, rebuilds branches and the successor graph.

- `scenario` (*table*) : scenario

#### `scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff)`

Called internally when a vehicle crosses its target waypoint: processes the waypoint (markers, next), emits onRaceWaypointReached(data) (and onRaceWaypoint for playerUsable vehicles, with a sound), handles the end of the race (scenario_scenarios.endRace) and the laps (onRaceLap). Marked "private" in the code.

- `vid` (*integer*) : vehicle id
- `wpData` (*table*) : scenario node {pos, radius, rot}
- `dtOff` (*number*) : time correction (s)

#### `scenario_waypoints.onSerialize()`

Serialization hook before Lua reload: returns the data per vehicle name.

- **returns**: table serialized data

#### `scenario_waypoints.onVehicleAIStateChanged(data)`

Hook emitted by scenario_scenarios: initializes waypoint tracking for a vehicle whose AI has just been enabled.

- `data` (*table*) : {vehicleId, vehicleName, aiControlled}

#### `scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex)`

Resets the waypoint data of a vehicle that was put back in place: without curWpIndex (or with missing data) recreates them, otherwise sets cur = curWpIndex - 1 and next = nextWpIndex - 1 and reprocesses the waypoint. Used by checkpoints.lua according to the code.

- `vehicleId` (*integer*) : vehicle id
- `curWpIndex` (*integer|nil*) : (1-based) index of the current waypoint
- `nextWpIndex` (*integer|nil*) : (1-based) index of the next waypoint

## Fields

| Field | Type | Description |
|---|---|---|
| `addWaypointBranch` | nil | Exported but is nil (local variable not defined in the file). ⚠ reference `addWaypointBranch` not defined in the file (probably nil) |
| `dependencies` | table<integer, string> | {'scenario_scenarios'} |
| `onUpdate` | nil | Exported but is nil (local variable not defined in the file). ⚠ reference `onUpdate` not defined in the file (probably nil) |
| `state` | table | System state (see notes): vehicleWaypointsData, nextWpForVehicle, waypointBranches, currentWaypointChoice, currentBranch, waypointsConfigData, branchGraph, pathnodes. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRaceBranchChosen` — listened to by 1 module(s)
- `onRaceLap` — listened to by 2 module(s)
- `onRaceWaypoint`
- `onRaceWaypointReached` — listened to by 6 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/waypoints.lua`.*
