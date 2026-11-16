# `scenario_finishRaceGoal`

*File: `lua/ge/extensions/scenario/finishRaceGoal.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_finishRaceGoal`: `extensions.load("scenario_finishRaceGoal")`, then the global `scenario_finishRaceGoal`

"finishRace" scenario goal (goals.vehicles with id = 'finishRace'): the vehicle must finish the race. It listens for the last waypoint reached, then, on the 'onRaceResult' state, ends the scenario in success or failure.

## Example

```lua
-- scenario JSON:
-- {"id":"finishRace", "value":{"mustWin":true, "passed":"Victoire !", "failed":"Perdu"}}
```

## Notes

- instance.value options: mustWin (boolean: the vehicle must be the first to cross the last waypoint), passed and failed (final messages).
- On 'onRaceWaypointReached', when stateData.next is nil (last waypoint), the result is 'passed' for vehicle stateData.vehicleId and 'failed' for the others. With mustWin, only the first to arrive is evaluated (the result is no longer overwritten).
- On 'onRaceResult', each instance with no result or a failed one calls failedGoal (default English message 'You failed to finish the race.'), otherwise passedGoal; each calls scenario_scenarios.finish.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_finishRaceGoal.init(scenario)` | Resets instances and adds each goal id='finishRace', resetting status.result to nil. *(internal)* | 66 |
| `scenario_finishRaceGoal.processState(scenario, state, stateData)` | Called on every scenario state. Handles 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) and 'onRaceResult'. *(internal)* | 31 |
| `scenario_finishRaceGoal.updateFinalStatus(scenario)` | Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario. *(internal)* | 76 |

### Parameter details

#### `scenario_finishRaceGoal.init(scenario)`

Resets instances and adds each goal id='finishRace', resetting status.result to nil.

- `scenario` (*table*) : Current scenario.

#### `scenario_finishRaceGoal.processState(scenario, state, stateData)`

Called on every scenario state. Handles 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) and 'onRaceResult'.

- `scenario` (*table*) : Current scenario.
- `state` (*string*) : State name.
- `stateData` (*table*) : For 'onRaceWaypointReached': next (next waypoint, nil if last) and vehicleId.

#### `scenario_finishRaceGoal.updateFinalStatus(scenario)`

Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario.

- `scenario` (*table*) : Current scenario.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of 'finishRace' goals, filled by init(). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/finishRaceGoal.lua`.*
