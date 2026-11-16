# `scenario_damageGoal`

*File: `lua/ge/extensions/scenario/damageGoal.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_damageGoal`: `extensions.load("scenario_damageGoal")`, then the global `scenario_damageGoal`

"damage" scenario goal (goals.vehicles with id = 'damage'). It monitors the vehicle's damage (map.objects[...].damage) at each race tick and makes the scenario win or lose when the damage exceeds damageLimit. It is called by the scenario_scenarios goal system (init on load, processState on each state, updateFinalStatus at the end).

## Example

```lua
-- in the scenario JSON, a vehicle's goal:
-- {"id":"damage", "value":{"damageLimit":5000, "damageThreshold":500, "purpose":"fail", "msg":"Trop de dégâts"}}
```

## Notes

- Options read from instance.value: damageLimit (number), damageThreshold (number), purpose ('fail' by default, or 'win'), msg (final text). A wrong type makes the instance be ignored with an error in the log.
- Everything happens on the 'onRaceTick' state. If the vehicle is not yet in map.objects, the goal calls helper.trackVehicle to enable tracking and waits for the next tick.
- When the damage progresses by at least damageThreshold (as a percentage of damageLimit) since the last message, a 1 s flashUiMessage is shown (translation keys checkDamage.win.msg or checkDamage.fail.msg with the damage context as a percentage).
- In showMsg, the expression {txt = instance.value.msg, ...} or {...} never falls back to the default message (a table is always truthy): if purpose='win' and msg is absent, txt is nil.
- While the damage is under the limit, status.result is set to 'passed' on every tick.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_damageGoal.init(scenario)` | Resets instances and adds to them each goal id='damage' of scenario.goals.vehicles after checking the types (purpose is 'fail' if absent, lastProgress initialized to 0). *(internal)* | 68 |
| `scenario_damageGoal.processState(scenario, state, stateData)` | Called by the goal system on every scenario state change. On 'onRaceTick', compares the vehicle's damage to damageLimit, shows the progress and ends the scenario (scenario_scenarios.finish) in victory or defeat depending on purpose. *(internal)* | 36 |
| `scenario_damageGoal.updateFinalStatus(scenario, instance)` | Records each instance's result in statistics_statistics.setGoalProgress at the end of the scenario. *(internal)* | 95 |

### Parameter details

#### `scenario_damageGoal.init(scenario)`

Resets instances and adds to them each goal id='damage' of scenario.goals.vehicles after checking the types (purpose is 'fail' if absent, lastProgress initialized to 0).

- `scenario` (*table*) : Current scenario table.

#### `scenario_damageGoal.processState(scenario, state, stateData)`

Called by the goal system on every scenario state change. On 'onRaceTick', compares the vehicle's damage to damageLimit, shows the progress and ends the scenario (scenario_scenarios.finish) in victory or defeat depending on purpose.

- `scenario` (*table*) : Current scenario (scenario.timer is used to format the time).
- `state` (*string*) : State name; only 'onRaceTick' is handled.
- `stateData` (*table*) : State data (unused).

#### `scenario_damageGoal.updateFinalStatus(scenario, instance)`

Records each instance's result in statistics_statistics.setGoalProgress at the end of the scenario.

- `scenario` (*table*) : Current scenario.
- `instance` (*table|nil*) : Unused: the loop iterates over M.instances.

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table | List of valid 'damage' goals, filled by init(). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/damageGoal.lua`.*
