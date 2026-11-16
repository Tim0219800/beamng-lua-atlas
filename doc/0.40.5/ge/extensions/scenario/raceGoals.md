# `scenario_raceGoals`

*File: `lua/ge/extensions/scenario/raceGoals.lua` · VM: Game Engine (GE) · 260 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_raceGoals`: `extensions.load("scenario_raceGoals")`, then the global `scenario_raceGoals`

Dispatcher of a scenario's goals. At initialization it reads the goals declared in scenario.vehicles[name].goal of the JSON, creates scenario.goals.vehicles, validates the options with a schema, dynamically loads each goal's module ('scenario/<id>' or 'scenario/<id>goal') and calls its init. Then it relays the race events (onRaceInit, onRaceStart, onRaceTick, onRaceWaypointReached, onRaceResult, onCountdownEnded) to goal.processState(scenario, stateName, data).

## Example

```lua
-- In a scenario's JSON:
-- "vehicles": { "scenario_player0": { "goal": { "nomove": {"msg":"Ne bougez pas"}, "damage": {"damageLimit":3000} } } }
-- '*' is used as the default value for vehicles not listed.
```

## Notes

- Goal validation schema (expected type per option): timeLimit {msg, maxTime, countdown, waitTime}, nomove {msg, triggerEndOnly}, position {msg, purpose, endPoint}, damage {msg, purpose, damageLimit, damageThreshold}, distance {msg, purpose, maxDistance, minDistance, distanceEnable, target}, speed {msg, purpose, maxSpeed, minSpeed, maxTimeout, wayPointNum, delay}, drift {msg, failMsg, minDrift, maxDrift, timeAllowance}, finishRace {passed, failed, mustWin}, wayPointAction {wayPointNum, wayPointMsg}. 'localizedString' accepts a string or a table with txt.
- A schema deviation is only logged (log E 'Schema error in scenario json'): the goal is still loaded.
- A string value of type localizedString that does not start with 'scenarios.' triggers a missing-localization warning.
- Shape of the goal in the JSON: either a list of names (goal.id = name, value = {msg='you hit something'}), or a table name -> options. Detection uses the local function istable (presence of a non-numeric key).
- A goal's module must exist in lua/ge/extensions/scenario/ under the name <id>.lua or <id>Goal.lua and expose init, processState, updateFinalStatus.
- M.onRaceEnd is exported but is nil (variable never defined).
- onRaceResult stores the final status in scenario.finalStatus before relaying the state.
- initialiseGoals sets scenario.targetName to '' and emits the hook extensions.hook('onRaceGoalsInitilised', scenario) (spelling from the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_raceGoals.initialiseGoals()` | Builds scenario.goals.vehicles from the scenario's vehicles (scenario.vehicleNameToId), validates the schema, loads the goal modules and calls init on each, then emits the onRaceGoalsInitilised hook. *(internal)* | 128 |
| `scenario_raceGoals.onCountdownEnded()` | Hook called at the end of the countdown: relays 'onCountdownEnded' to the goals. *(internal)* *(hook)* | 240 |
| `scenario_raceGoals.onRaceInit()` | Race hook: relays the 'onRaceInit' state to all goals. *(internal)* *(hook)* | 201 |
| `scenario_raceGoals.onRaceResult(status)` | Hook called at the end of the race: records scenario.finalStatus and relays 'onRaceResult' to the goals. *(internal)* *(hook)* | 229 |
| `scenario_raceGoals.onRaceStart()` | Race hook: relays the 'onRaceStart' state to all goals. *(internal)* *(hook)* | 192 |
| `scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer)` | Hook called periodically during the race: relays 'onRaceTick' with {raceTickTime, scenarioTimer} to all goals. *(internal)* *(hook)* | 219 |
| `scenario_raceGoals.onRaceWaypointReached(data)` | Hook called when a vehicle reaches a waypoint: relays 'onRaceWaypointReached' with the received data to the goals. *(internal)* *(hook)* | 210 |
| `scenario_raceGoals.updateGoalsFinalStatus()` | Calls updateFinalStatus(scenario) on each loaded goal, to record the final results. *(internal)* | 182 |

### Parameter details

#### `scenario_raceGoals.onRaceResult(status)`

Hook called at the end of the race: records scenario.finalStatus and relays 'onRaceResult' to the goals.

- `status` (*table*) : Final race result.

#### `scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer)`

Hook called periodically during the race: relays 'onRaceTick' with {raceTickTime, scenarioTimer} to all goals.

- `raceTickTime` (*number*) : Race tick time.
- `scenarioTimer` (*number*) : Scenario timer.

#### `scenario_raceGoals.onRaceWaypointReached(data)`

Hook called when a vehicle reaches a waypoint: relays 'onRaceWaypointReached' with the received data to the goals.

- `data` (*table*) : Waypoint data (vehicleId, next, time...).

## Fields

| Field | Type | Description |
|---|---|---|
| `onRaceEnd` | any |  ⚠ reference `onRaceEnd` not defined in the file (probably nil) |
| `state` | table | {goals = {}}: table goal name -> loaded module, filled by initialiseGoals. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRaceGoalsInitilised` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceGoals.lua`.*
