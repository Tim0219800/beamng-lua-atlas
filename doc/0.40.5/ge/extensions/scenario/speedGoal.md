# `scenario_speedGoal`

*File: `lua/ge/extensions/scenario/speedGoal.lua` · VM: Game Engine (GE) · 151 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_speedGoal`: `extensions.load("scenario_speedGoal")`, then the global `scenario_speedGoal`

"speed" scenario goal: monitors a vehicle's speed and wins or fails when it stays outside the range [minSpeed, maxSpeed] for more than maxTimeout seconds. Loaded by scenario_raceGoals which calls init, processState and updateFinalStatus; a scenario declares it in goals.vehicles with id 'speed'.

## Example

```lua
-- in a scenario's JSON, goals.vehicles:
-- {"id":"speed", "vehicle":"scenario_player0", "value":{"minSpeed":10, "maxTimeout":3, "purpose":"fail", "msg":"Trop lent"}}
```

## Notes

- instance.value fields read: minSpeed and maxSpeed (m/s, numbers), maxTimeout (s, 0 by default), delay (s: skips the check while scenario.timer <= delay), wayPointNum (array of waypoint indices: the check only applies when vehWpData.cur is one of them), purpose ('fail' by default or 'win'), msg (message).
- The check runs on every 'onRaceTick' (every 0.25 s of simulated time): while the speed is outside the range, instance.Timeout increases by 0.25; it is reset to 0 otherwise. A countdown message is displayed every whole second. When Timeout > maxTimeout, showMsg ends the scenario via scenario_scenarios.finish: as a failure if purpose='fail' (result.failed = msg or default key), as a win if purpose='win' (result.msg with the time).
- Speed tracking uses map.objects (vehicle tracking); if absent, the function asks the vehicle side for mapmgr.enableTracking(name) and waits for the next frame.
- BUG/inconsistency: in showMsg, "{txt = instance.value.msg, ...} or {...}" never falls back to the default message (a table is always truthy); if value.msg is nil, the win message has no text.
- BUG/inconsistency: processState skips the instance if maxSpeed == 0 but not if maxSpeed is nil; if the vehicle is not found (vehicle nil) and fobjData is nil, playerSpeed may receive a nil fobjData and raise an error.
- BUG/inconsistency: the test "instance.Timeout % 1 == 0" compares floats (accumulated 0.25); it works because 0.25 is exactly representable.
- BUG/inconsistency: updateFinalStatus ignores its instance argument and redeclares the loop variable of the same name.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_speedGoal.init(scenario)` | Called by scenario_raceGoals at startup: rebuilds M.instances from scenario.goals.vehicles (entries id == 'speed'), validates the types (minSpeed, maxSpeed, delay numbers; wayPointNum array; purpose string), sets maxTimeout to 0 and purpose to 'fail' by default, and Timeout to 0. *(internal)* | 98 |
| `scenario_speedGoal.processState(scenario, state, stateData)` | Called by scenario_raceGoals on every race event; only acts for state == 'onRaceTick': checks the speed of the relevant vehicles (see notes). *(internal)* | 58 |
| `scenario_speedGoal.updateFinalStatus(scenario, instance)` | Called at the end of the scenario: publishes to statistics_statistics the status (passed/failed) of each instance. *(internal)* | 140 |

### Parameter details

#### `scenario_speedGoal.init(scenario)`

Called by scenario_raceGoals at startup: rebuilds M.instances from scenario.goals.vehicles (entries id == 'speed'), validates the types (minSpeed, maxSpeed, delay numbers; wayPointNum array; purpose string), sets maxTimeout to 0 and purpose to 'fail' by default, and Timeout to 0.

- `scenario` (*table*) : current scenario

#### `scenario_speedGoal.processState(scenario, state, stateData)`

Called by scenario_raceGoals on every race event; only acts for state == 'onRaceTick': checks the speed of the relevant vehicles (see notes).

- `scenario` (*table*) : current scenario
- `state` (*string*) : hook name: 'onRaceStart','onRaceInit','onRaceWaypointReached','onRaceTick','onRaceResult','onCountdownEnded'
- `stateData` (*table|nil*) : hook data (unused here)

#### `scenario_speedGoal.updateFinalStatus(scenario, instance)`

Called at the end of the scenario: publishes to statistics_statistics the status (passed/failed) of each instance.

- `scenario` (*table*) : current scenario
- `instance` (*table*) : unused (inferred from code)

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | 'speed' goal instances active for the current scenario, filled by init. |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/speedGoal.lua`.*
