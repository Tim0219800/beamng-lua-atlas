# `gameplay_freeformDelivery_goals`

*File: `lua/ge/extensions/gameplay/freeformDelivery/goals.lua` · VM: Game Engine (GE) · 898 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_goals`: `extensions.load("gameplay_freeformDelivery_goals")`, then the global `gameplay_freeformDelivery_goals`

Evaluates the goals of the freeform delivery mode. From delivery.goals, creates one goal per entry (types placement, playerInVehicle, engineRunning, coupled, unhitched, damage, distance), manages their prerequisites (requires, AND logic) and their state (active, completed), re-evaluates them every frame in two passes (completion then activation) and provides overall and per-goal progress. Also handles the 5 s automatic finish countdown when all active required goals are fulfilled.

## Example

```lua
local p = gameplay_freeformDelivery_goals.getProgress()
if p.allRequiredComplete then print('delivery successful') end
```

## Notes

- Common fields of a delivery.goals goal: id (mandatory), type (placement by default), required (true unless false), requires, label, subtext, stayCompleted, stayCompletedAfterGoalId, removeOnComplete, showInTasklist (true unless false), showRequiredProgress.
- placement: targetAreaId + vehicleId or vehicleIds (+ requiredAmount, all by default); succeeds when enough vehicles are in the target area (zone, location or parkingSpot). playerInVehicle and engineRunning: a single vehicle; playerInVehicle compares the player's vehicle, engineRunning reads the electric engineRunning > 0 via core_vehicleBridge. coupled/unhitched: vehicleId + trailerId (coupled if coupler attached or core_trailerRespawn). damage: vehicleId(s), maxDamage (10000 by default), true as long as no vehicle exceeds it. distance: vehicleListA and vehicleListB, failThreshold (1000 m by default), true as long as the maximum distance between a vehicle of A and one of B stays <= failThreshold; warningThreshold is used for the warning.
- Prerequisites: each element of requires is an id (string) or a table {id|goalId, state}. state: "complete" (default) or "completely_fulfilled" (completed); "not" or "not_fulfilled" (not completed); any other (partial, any...) = partially or fully progressed.
- A goal is only evaluated if its prerequisites are fulfilled; activation is recomputed after the completion pass to avoid pairs() iteration order artifacts.
- The end countdown (completionTimerDuration) lasts 5 s in real time (dtReal); it resets if a required goal becomes incomplete again. It relies on areAllRequiredGoalsCompleted: at least one active required goal and all completed.
- getProgress only counts active goals; allRequiredComplete requires required > 0.
- Badly defined goals (missing id, unknown type, missing vehicle...) are ignored with a logged error.
- Inconsistency: checkDamageGoal reads veh.damage on the vehicle object, whereas endScreen.collectStatistics reads map.objects[vehId].damage.
- update() logs a warning every frame if there are no goals.

**Dependencies (loaded first):** `gameplay_freeformDelivery_utils`, `core_trailerRespawn`, `core_vehicles`, `core_vehicleBridge`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId)` | Returns whether all goals of a target area are completed (false if there are none). | 771 |
| `gameplay_freeformDelivery_goals.cleanup()` | Full cleanup: clears goals, states, caches, pending requests, utils' vehicle cache and the finish message. | 884 |
| `gameplay_freeformDelivery_goals.getAllGoals()` | Returns all created goals, active or not, keyed by id. | 732 |
| `gameplay_freeformDelivery_goals.getCompletionTimer()` | Returns the remaining time of the finish countdown. | 871 |
| `gameplay_freeformDelivery_goals.getGoalProgress(goalId)` | Returns the detailed progress of a goal: for a multi-vehicle placement {total, requiredAmount, inArea, partial, complete}, otherwise {total = 1, inArea, partial = false, complete}. | 740 |
| `gameplay_freeformDelivery_goals.getGoalState(goalId)` | Returns the state of a goal. | 736 |
| `gameplay_freeformDelivery_goals.getGoals()` | Returns only the active goals (prerequisites fulfilled), keyed by id. | 720 |
| `gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId)` | Lists the goals linked to a target area. | 751 |
| `gameplay_freeformDelivery_goals.getGoalsByType(goalType)` | Lists the goals of a given type. | 761 |
| `gameplay_freeformDelivery_goals.getProgress()` | Counts active and completed goals, with the share of required goals. | 692 |
| `gameplay_freeformDelivery_goals.hideFromTasklist()` | Removes the finish message from the tasklist and stops the countdown, but keeps goals and states for result evaluation. | 876 |
| `gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal)` | Returns whether the maximum distance of a distance-type goal exceeds 90% of its warningThreshold (to display a warning). | 280 |
| `gameplay_freeformDelivery_goals.isGoalActive(goalId)` | Returns whether a goal's prerequisites are fulfilled. | 746 |
| `gameplay_freeformDelivery_goals.setup(delivery)` | Resets goals, states and caches, pre-fills the cache of target areas and their site objects, creates the delivery.goals goals and computes the initial activation according to prerequisites. | 492 |
| `gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler)` | To be called every frame: updates the position cache of the relevant vehicles, evaluates the completion of each active goal (pass 1) then recomputes activation (pass 2). | 553 |
| `gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal)` | Manages the automatic finish countdown: starts it when all active required goals are completed (message in the tasklist), cancels it if one becomes incomplete again, and returns true when it reaches 0. | 826 |

### Parameter details

#### `gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId)`

Returns whether all goals of a target area are completed (false if there are none).

- `areaId` (*string*) : Target area id.
- **returns**: boolean true if all completed.

#### `gameplay_freeformDelivery_goals.getAllGoals()`

Returns all created goals, active or not, keyed by id.

- **returns**: table<string, table> All goals.

#### `gameplay_freeformDelivery_goals.getCompletionTimer()`

Returns the remaining time of the finish countdown.

- **returns**: number|nil Remaining seconds, nil if not started.

#### `gameplay_freeformDelivery_goals.getGoalProgress(goalId)`

Returns the detailed progress of a goal: for a multi-vehicle placement {total, requiredAmount, inArea, partial, complete}, otherwise {total = 1, inArea, partial = false, complete}.

- `goalId` (*string*) : Goal id.
- **returns**: table|nil Progress, nil if the goal does not exist.

#### `gameplay_freeformDelivery_goals.getGoalState(goalId)`

Returns the state of a goal.

- `goalId` (*string*) : Goal id.
- **returns**: table|nil {completed, lastCheck, active}

#### `gameplay_freeformDelivery_goals.getGoals()`

Returns only the active goals (prerequisites fulfilled), keyed by id.

- **returns**: table<string, table> Active goals.

#### `gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId)`

Lists the goals linked to a target area.

- `targetAreaId` (*string*) : Target area id.
- **returns**: table[] Array of goals.

#### `gameplay_freeformDelivery_goals.getGoalsByType(goalType)`

Lists the goals of a given type.

- `goalType` (*string*) : placement, playerInVehicle, engineRunning, coupled, unhitched, damage or distance.
- **returns**: table[] Array of goals.

#### `gameplay_freeformDelivery_goals.getProgress()`

Counts active and completed goals, with the share of required goals.

- **returns**: table {total, completed, required, requiredCompleted, allRequiredComplete}

#### `gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal)`

Returns whether the maximum distance of a distance-type goal exceeds 90% of its warningThreshold (to display a warning).

- `goal` (*table*) : Distance-type goal (vehicleListA, vehicleListB, warningThreshold).
- **returns**: boolean true if the warning must be active.

#### `gameplay_freeformDelivery_goals.isGoalActive(goalId)`

Returns whether a goal's prerequisites are fulfilled.

- `goalId` (*string*) : Goal id.
- **returns**: boolean true if active.

#### `gameplay_freeformDelivery_goals.setup(delivery)`

Resets goals, states and caches, pre-fills the cache of target areas and their site objects, creates the delivery.goals goals and computes the initial activation according to prerequisites.

- `delivery` (*table*) : Loaded delivery (goals, targetAreas, sites).

#### `gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler)`

To be called every frame: updates the position cache of the relevant vehicles, evaluates the completion of each active goal (pass 1) then recomputes activation (pass 2).

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).
- `profiler` (*table|nil*) : Optional LuaProfiler.

#### `gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal)`

Manages the automatic finish countdown: starts it when all active required goals are completed (message in the tasklist), cancels it if one becomes incomplete again, and returns true when it reaches 0.

- `dtReal` (*number*) : Real-time delta in seconds.
- **returns**: boolean true when the delivery must finish.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, core_trailerRespawn, core_vehicles, core_vehicleBridge. |

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/goals.lua`.*
