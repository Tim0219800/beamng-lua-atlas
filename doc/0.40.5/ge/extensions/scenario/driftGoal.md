# `scenario_driftGoal`

*File: `lua/ge/extensions/scenario/driftGoal.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_driftGoal`: `extensions.load("scenario_driftGoal")`, then the global `scenario_driftGoal`

"drift" scenario goal (goals.vehicles with id = 'drift'). It computes a drift score from the difference between the vehicle's direction (dirVec) and that of its velocity (vel), with combos and encouragement messages shown via scenariohelper.realTimeUiDisplay. The scenario ends when the allotted time (timeAllowance) is exceeded or on the 'onRaceResult' state.

## Example

```lua
-- scenario JSON:
-- {"id":"drift", "value":{"minDrift":2000, "maxDrift":10000, "timeAllowance":60, "msg":"Bravo", "failMsg":"Raté"}}
```

## Notes

- instance.value options: minDrift (minimum score to succeed), maxDrift (cap of the recorded progress), timeAllowance (seconds of scenario.timer), msg and failMsg (final texts, receive context.score).
- The instantaneous score = floor(angleBonus) * speedBonus; angleBonus = floor(10 * vector difference), ignored if it is 1 or less (drift too small) or 11 and more (spin-out); speedBonus = speed * 0.15, ignored if it is 1 or less. A combo multiplies the score by (combo + 1) as long as the grace period has not elapsed.
- The drift counters (driftState, driftCombo...) are local variables of the module, shared among all instances: the goal only correctly handles a single vehicle.
- The cooldown counters decrease per processState call (0.25 per call, message 0.1), not in real seconds.
- If the speed is zero, fobjData.vel:length() is 0 and the division gives non-finite values (nan) in the angle computation.
- updateFinalStatus crashes if value.minDrift is nil; sessionEnd too (comparison with nil).
- The default success message uses instance.value.driftPoints, which is never defined elsewhere in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_driftGoal.init(scenario)` | Resets instances and the drift state; adds each goal id='drift' (minDrift and maxDrift must be numeric) with driftScore = 0 and status.completed = false. *(internal)* | 118 |
| `scenario_driftGoal.processState(scenario, state, stateData)` | Called on every scenario state: updates the vehicle's drift score from map.objects, shows the real-time message, and ends the scenario (sessionEnd) on 'onRaceResult' or if timeAllowance is exceeded. Re-enables mapmgr tracking if the vehicle is not yet in map.objects. *(internal)* | 53 |
| `scenario_driftGoal.updateFinalStatus(scenario, instance)` | Sets passed or failed depending on driftScore >= minDrift and sends points (driftScore) and maxPoints (maxDrift) to statistics_statistics.setGoalProgress. *(internal)* | 147 |

### Parameter details

#### `scenario_driftGoal.init(scenario)`

Resets instances and the drift state; adds each goal id='drift' (minDrift and maxDrift must be numeric) with driftScore = 0 and status.completed = false.

- `scenario` (*table*) : Current scenario.

#### `scenario_driftGoal.processState(scenario, state, stateData)`

Called on every scenario state: updates the vehicle's drift score from map.objects, shows the real-time message, and ends the scenario (sessionEnd) on 'onRaceResult' or if timeAllowance is exceeded. Re-enables mapmgr tracking if the vehicle is not yet in map.objects.

- `scenario` (*table*) : Current scenario (scenario.timer).
- `state` (*string*) : State name; 'onRaceResult' ends the session.
- `stateData` (*table*) : State data (unused).

#### `scenario_driftGoal.updateFinalStatus(scenario, instance)`

Sets passed or failed depending on driftScore >= minDrift and sends points (driftScore) and maxPoints (maxDrift) to statistics_statistics.setGoalProgress.

- `scenario` (*table*) : Current scenario.
- `instance` (*table|nil*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of valid 'drift' goals, filled by init(). |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/driftGoal.lua`.*
