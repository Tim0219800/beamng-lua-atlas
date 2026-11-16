# `scenario_positionGoal`

*File: `lua/ge/extensions/scenario/positionGoal.lua` · VM: Game Engine (GE) · 88 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_positionGoal`: `extensions.load("scenario_positionGoal")`, then the global `scenario_positionGoal`

"position" scenario goal (goals.vehicles with id = 'position'): at the end of the race, the vehicle must be in the zone of a scenetree object (for example a braking zone). The zone is defined by the distance to the center of the endPoint object, compared to its scale.x.

## Example

```lua
-- scenario JSON:
-- {"id":"position", "value":{"endPoint":"brake_zone", "purpose":"fail", "msg":"Vous n'êtes pas dans la zone"}}
```

## Notes

- instance.value options: endPoint (scenetree object name), purpose ('fail' by default or 'win'), msg.
- The check only happens on the 'onRaceResult' state: if the distance to the center of endPoint exceeds endPoint.scale.x, showMsg ends the scenario; otherwise status.result = 'passed'.
- Probable bug: in purpose 'win', instance.value.msg .. timeStr crashes if msg is nil (the fallback 'or' is evaluated too late).
- The default failure message ('Not in brake area') is hard-coded in English.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_positionGoal.init(scenario)` | Resets instances and adds each goal id='position'; purpose is 'fail' if absent. *(internal)* | 60 |
| `scenario_positionGoal.processState(scenario, state, stateData)` | Called on every scenario state. On 'onRaceResult', checks that the vehicle is in the zone of the endPoint object. *(internal)* | 38 |
| `scenario_positionGoal.updateFinalStatus(scenario, instance)` | Sends each instance's result to statistics_statistics.setGoalProgress. *(internal)* | 78 |

### Parameter details

#### `scenario_positionGoal.init(scenario)`

Resets instances and adds each goal id='position'; purpose is 'fail' if absent.

- `scenario` (*table*) : Current scenario.

#### `scenario_positionGoal.processState(scenario, state, stateData)`

Called on every scenario state. On 'onRaceResult', checks that the vehicle is in the zone of the endPoint object.

- `scenario` (*table*) : Current scenario.
- `state` (*string*) : State name.
- `stateData` (*table*) : State data (unused).

#### `scenario_positionGoal.updateFinalStatus(scenario, instance)`

Sends each instance's result to statistics_statistics.setGoalProgress.

- `scenario` (*table*) : Current scenario.
- `instance` (*table|nil*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of valid 'position' goals, filled by init(). |

## Calls into the engine (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/positionGoal.lua`.*
