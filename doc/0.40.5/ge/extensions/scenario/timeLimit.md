# `scenario_timeLimit`

*File: `lua/ge/extensions/scenario/timeLimit.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_timeLimit`: `extensions.load("scenario_timeLimit")`, then the global `scenario_timeLimit`

"timeLimit" scenario goal: the scenario must be completed in less than maxTime seconds. Loaded by scenario_raceGoals (init, processState, updateFinalStatus); declared in goals.vehicles with id 'timeLimit'. Can display a countdown over the last seconds and fails if the time is exceeded.

## Example

```lua
-- JSON: {"id":"timeLimit", "value":{"maxTime":60, "waitTime":2, "countdown":10, "msg":"Trop long"}}
```

## Notes

- instance.value fields: maxTime (s), waitTime (s of tolerance after maxTime during the race), countdown (s: threshold for displaying the countdown), msg (failure message).
- During 'onRaceTick' (only if waitTime is defined and maxTime ~= 0): if countdown is provided, displays a message every second below the threshold; if scenario.timer > maxTime + waitTime, failure (failedGoal -> scenario_scenarios.finish({failed=...})). On 'onRaceResult': failure if scenario.finalStatus.finalTime > maxTime, otherwise the status becomes 'passed'.
- BUG/inconsistency: init rejects the instance only if maxTime AND waitTime are NOT numbers (and operator); a single invalid value passes.
- BUG/inconsistency: without waitTime, the 'onRaceTick' check is skipped (only 'onRaceResult' checks the limit). instance.wait is initialized to countdown (may be nil, which would make the comparison timeleft < instance.wait fail if countdown is nil but defined otherwise).
- BUG/inconsistency: updateFinalStatus ignores its instance argument and redeclares the loop variable of the same name.
- The default failure message is {txt = 'extensions.scenario.timeLimit.failedGoal', context = {maxTime}}; value not translated in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_timeLimit.init(scenario)` | Rebuilds M.instances from scenario.goals.vehicles (id == 'timeLimit') after validating the types of maxTime/waitTime/countdown; instance.wait receives countdown. *(internal)* | 55 |
| `scenario_timeLimit.processState(scenario, state, stateData)` | Called by scenario_raceGoals on every event: handles 'onRaceTick' (countdown and exceeding maxTime + waitTime) and 'onRaceResult' (comparison of the final time to maxTime). *(internal)* | 21 |
| `scenario_timeLimit.updateFinalStatus(scenario, instance)` | Called at the end of the scenario: publishes the status of each instance to statistics_statistics. *(internal)* | 76 |

### Parameter details

#### `scenario_timeLimit.init(scenario)`

Rebuilds M.instances from scenario.goals.vehicles (id == 'timeLimit') after validating the types of maxTime/waitTime/countdown; instance.wait receives countdown.

- `scenario` (*table*) : current scenario

#### `scenario_timeLimit.processState(scenario, state, stateData)`

Called by scenario_raceGoals on every event: handles 'onRaceTick' (countdown and exceeding maxTime + waitTime) and 'onRaceResult' (comparison of the final time to maxTime).

- `scenario` (*table*) : current scenario
- `state` (*string*) : hook name
- `stateData` (*table|nil*) : hook data (unused)

#### `scenario_timeLimit.updateFinalStatus(scenario, instance)`

Called at the end of the scenario: publishes the status of each instance to statistics_statistics.

- `scenario` (*table*) : current scenario
- `instance` (*table*) : unused (inferred from code)

## Fields

| Field | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | 'timeLimit' goal instances for the current scenario, filled by init. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/timeLimit.lua`.*
