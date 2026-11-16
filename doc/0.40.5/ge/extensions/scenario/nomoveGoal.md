# `scenario_nomoveGoal`

*File: `lua/ge/extensions/scenario/nomoveGoal.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_nomoveGoal`: `extensions.load("scenario_nomoveGoal")`, then the global `scenario_nomoveGoal`

"nomove" scenario goal (goals.vehicles with id = 'nomove'): the vehicle must not move more than 0.1 m from its starting position. Called by the scenario_scenarios goal system.

## Example

```lua
-- scenario JSON:
-- {"id":"nomove", "value":{"msg":"Ne bougez pas", "triggerEndOnly":false}}
```

## Notes

- instance.value options: msg (failure message), triggerEndOnly (boolean).
- The starting position is captured at init then refreshed on the 'onCountdownEnded' state.
- Checked on 'onRaceTick' and 'onRaceResult': if the vehicle has moved more than 0.1 m away, failure (scenario_scenarios.finish({failed = msg})). With triggerEndOnly, movement simply ends the scenario via scenario_scenarios.endScenario(0.25) and no result is recorded.
- If the vehicle is not present (vId absent), an error is logged only once and the instance is ignored; at init it is not added.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_nomoveGoal.init(scenario)` | Resets instances and adds each goal id='nomove' whose vehicle exists, remembering its starting position. *(internal)* | 45 |
| `scenario_nomoveGoal.processState(scenario, state, stateData)` | Called on every scenario state. Updates the starting position on 'onCountdownEnded' then checks immobility on 'onRaceTick' and 'onRaceResult'. *(internal)* | 9 |
| `scenario_nomoveGoal.updateFinalStatus(scenario, instance)` | Unless triggerEndOnly, sends the result to statistics_statistics.setGoalProgress for the goal's vehicle and for player 0's vehicle. *(internal)* | 61 |

### Parameter details

#### `scenario_nomoveGoal.init(scenario)`

Resets instances and adds each goal id='nomove' whose vehicle exists, remembering its starting position.

- `scenario` (*table*) : Current scenario.

#### `scenario_nomoveGoal.processState(scenario, state, stateData)`

Called on every scenario state. Updates the starting position on 'onCountdownEnded' then checks immobility on 'onRaceTick' and 'onRaceResult'.

- `scenario` (*table*) : Current scenario.
- `state` (*string*) : State name.
- `stateData` (*table*) : State data (unused).

#### `scenario_nomoveGoal.updateFinalStatus(scenario, instance)`

Unless triggerEndOnly, sends the result to statistics_statistics.setGoalProgress for the goal's vehicle and for player 0's vehicle.

- `scenario` (*table*) : Current scenario.
- `instance` (*table|nil*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of valid 'nomove' goals, filled by init(). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/nomoveGoal.lua`.*
