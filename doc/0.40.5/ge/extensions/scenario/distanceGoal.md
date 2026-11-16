# `scenario_distanceGoal`

*File: `lua/ge/extensions/scenario/distanceGoal.lua` · VM: Game Engine (GE) · 129 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_distanceGoal`: `extensions.load("scenario_distanceGoal")`, then the global `scenario_distanceGoal`

"distance" scenario goal (goals.vehicles with id = 'distance'): the distance between the goal's vehicle and a target scenetree object must not leave [minDistance, maxDistance]. Useful for chase or convoy scenarios. Called by the scenario_scenarios goal system.

## Example

```lua
-- scenario JSON:
-- {"id":"distance", "value":{"target":"police", "maxDistance":80, "minDistance":5, "distanceEnable":60, "purpose":"fail", "msg":"Trop loin"}}
```

## Notes

- instance.value options: target (name of a scenetree object, required in practice), maxDistance, minDistance, distanceEnable (all numbers, meters), purpose ('fail' by default or 'win'), msg.
- distanceEnable: as long as the vehicle has never gone below this distance from the target, the limits are not checked. Once it has gone below, status.checkForCarDistance stays true.
- Checks are done on the 'onRaceTick' state.
- If scenario.targetName exists, the goal also fails as soon as the vehicle is within 5 m or less of that object (message 'DistanceBetweenSceneObjects.fail.msg'), otherwise status.result = 'passed'.
- Probable bug: if target is nil, the error log concatenates instance.value.target (nil) and crashes; getVehicleByName(nil) is also called without a guard.
- In showMsg, the expression {txt = ...} or {...} never falls back to the default victory message.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_distanceGoal.init(scenario)` | Resets instances and adds each goal id='distance' whose numeric options are valid; purpose is 'fail' if absent; checkForCarDistance is set to false. *(internal)* | 88 |
| `scenario_distanceGoal.processState(scenario, state, stateData)` | Called on every scenario state; on 'onRaceTick' measures the distance to the target vehicle and ends the scenario (victory or defeat depending on purpose) if it leaves the bounds. *(internal)* | 37 |
| `scenario_distanceGoal.updateFinalStatus(scenario, instance)` | Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario. *(internal)* | 118 |

### Parameter details

#### `scenario_distanceGoal.init(scenario)`

Resets instances and adds each goal id='distance' whose numeric options are valid; purpose is 'fail' if absent; checkForCarDistance is set to false.

- `scenario` (*table*) : Current scenario.

#### `scenario_distanceGoal.processState(scenario, state, stateData)`

Called on every scenario state; on 'onRaceTick' measures the distance to the target vehicle and ends the scenario (victory or defeat depending on purpose) if it leaves the bounds.

- `scenario` (*table*) : Current scenario.
- `state` (*string*) : State name; 'onRaceTick' handled.
- `stateData` (*table*) : State data (unused).

#### `scenario_distanceGoal.updateFinalStatus(scenario, instance)`

Sends each instance's result to statistics_statistics.setGoalProgress at the end of the scenario.

- `scenario` (*table*) : Current scenario.
- `instance` (*table|nil*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of valid 'distance' goals, filled by init(). |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/distanceGoal.lua`.*
