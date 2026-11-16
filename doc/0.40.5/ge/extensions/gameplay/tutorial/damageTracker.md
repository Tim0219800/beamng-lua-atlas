# `gameplay_tutorial_damageTracker`

*File: `lua/ge/extensions/gameplay/tutorial/damageTracker.lua` · VM: Game Engine (GE) · 393 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_tutorial_damageTracker`: `extensions.load("gameplay_tutorial_damageTracker")`, then the global `gameplay_tutorial_damageTracker`

Tracks the vehicle's damage during the career tutorial (and the time trial). It relies on gameplay_util_crashDetection to detect the end of a crash, waits for the vehicle to slow down (or a maximum delay), then displays an information window (career_modules_tutorialPopups) and a "repair" or "restart" task in the task list. The task disappears when the vehicle is repaired or reset.

## Example

```lua
gameplay_tutorial_damageTracker.setTrackedVehicleId(vehId)
gameplay_tutorial_damageTracker.setEnabled(true)
```

## Notes

- Depends on gameplay_util_crashDetection (M.dependencies).
- Wait before the window: up to 5 s (1.5 s in time trial) or as soon as the speed <= 3 km/h.
- After going out of bounds (onCareerTutorialOutOfBoundsStarted), damage is ignored for 8 s.
- Window identifiers: 'v2/damagedVehicleTimeTrial', 'v2/damagedVehicle' (tutorial active), 'v2/damagedVehicleCareer'; each is displayed only once per module session.
- BUG: onVehicleResetted is defined twice; the second definition (simpler, without the time trial case) overwrites the first, so the first one's time trial handling is never executed.
- The module only detects crashes for the tracked vehicle (trackedVehId); in time trial, it automatically tracks the player's vehicle.

**Dependencies (loaded first):** `gameplay_util_crashDetection`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_tutorial_damageTracker.claimNextDamagePopup()` | Marks a crash as already handled by the caller: the next damage window will be skipped, but the repair task will remain due. | 162 |
| `gameplay_tutorial_damageTracker.cleanup()` | Disables tracking and resets the whole module state (configured vehicle, task, handler, already-displayed window flags). | 202 |
| `gameplay_tutorial_damageTracker.debugTriggerCrash()` | Simulates a crash (debug): sets hadCrash and triggers the wait for the damage window. | 195 |
| `gameplay_tutorial_damageTracker.getHadCrash()` | Indicates whether a crash has been detected since the last reset. | 388 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded()` | Hook called when returning within bounds: outside time trial, if the tracked vehicle has damage, displays the repair task again. *(internal)* *(hook)* | 315 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted()` | Hook called when the player goes out of bounds: ignores damage for 8 s, cancels the pending crash and the repair task. *(internal)* *(hook)* | 307 |
| `gameplay_tutorial_damageTracker.onClientStartMission(levelPath)` | Mission start hook: ensures the tracked vehicle is up to date if tracking is active. *(internal)* *(hook)* | 347 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId)` | Recovery window hook: if the 'restartMission' button is pressed in time trial after a crash, marks as repaired and removes the tasks. *(internal)* *(hook)* | 368 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId)` | Hook called when the player chooses to repair on the spot: marks the vehicle as repaired and removes the tasks. *(internal)* *(hook)* | 353 |
| `gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw)` | Update hook: ensures the right vehicle is tracked, then, if a damage window is pending, displays it when the vehicle is almost stopped or after the maximum delay. *(internal)* *(hook)* | 278 |
| `gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData)` | crashDetection hook called at the end of a crash. If the tracked vehicle is concerned (and damage is not suppressed), schedules the display of the damage window. *(internal)* *(hook)* | 294 |
| `gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId)` | Hook called after a vehicle is repaired: if a crash had occurred, removes the repair tasks. *(internal)* *(hook)* | 360 |
| `gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId)` | Hook called when a vehicle is reset: if it is the tracked vehicle and tracking is active, marks as repaired and removes the tasks. (Effective definition: the file's second one, which overwrites the first.) *(internal)* *(hook)* | 379 |
| `gameplay_tutorial_damageTracker.setDamagePopupHandler(handler)` | Replaces the opening of the career damage window with a custom handler, called with the window id. A non-function value removes the handler. | 86 |
| `gameplay_tutorial_damageTracker.setDefaultRepairGoal()` | Restores the default repair task (id 'tutorial_repairVehicleGoal', action toggleRadialMenuMulti). | 85 |
| `gameplay_tutorial_damageTracker.setEnabled(value)` | Enables or disables damage tracking. On disabling: stops tracking the vehicle and removes all tasks; on enabling: tracks the vehicle and displays the task if needed. | 181 |
| `gameplay_tutorial_damageTracker.setRepairGoal(goal)` | Sets the "repair" task displayed after a crash (task table for the task list). nil restores the default task. | 84 |
| `gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId)` | Sets the id of the vehicle to track (taken into account at the next ensureTrackedVehicle, for example in onUpdate). | 158 |
| `gameplay_tutorial_damageTracker.showRepairTask()` | Displays the repair task (or restart task in time trial) if tracking is active, a crash occurred and the vehicle has not been repaired yet. | 169 |

### Parameter details

#### `gameplay_tutorial_damageTracker.getHadCrash()`

Indicates whether a crash has been detected since the last reset.

- **returns**: boolean true if a crash occurred.

#### `gameplay_tutorial_damageTracker.onClientStartMission(levelPath)`

Mission start hook: ensures the tracked vehicle is up to date if tracking is active.

- `levelPath` (*string*) : Level path (unused).

#### `gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId)`

Recovery window hook: if the 'restartMission' button is pressed in time trial after a crash, marks as repaired and removes the tasks.

- `buttonId` (*string*) : Identifier of the button pressed.

#### `gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId)`

Hook called when the player chooses to repair on the spot: marks the vehicle as repaired and removes the tasks.

- `invVehId` (*integer*) : Inventory vehicle id (not used).

#### `gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw)`

Update hook: ensures the right vehicle is tracked, then, if a damage window is pending, displays it when the vehicle is almost stopped or after the maximum delay.

- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulation time delta.
- `dtRaw` (*number*) : Raw delta time (used for the wait delay).

#### `gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData)`

crashDetection hook called at the end of a crash. If the tracked vehicle is concerned (and damage is not suppressed), schedules the display of the damage window.

- `crashData` (*table*) : Crash data; crashData.vehId = vehicle concerned.

#### `gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId)`

Hook called after a vehicle is repaired: if a crash had occurred, removes the repair tasks.

- `invVehId` (*integer*) : Inventory vehicle id (not used).

#### `gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId)`

Hook called when a vehicle is reset: if it is the tracked vehicle and tracking is active, marks as repaired and removes the tasks. (Effective definition: the file's second one, which overwrites the first.)

- `vehicleId` (*integer*) : Id of the reset vehicle.

#### `gameplay_tutorial_damageTracker.setDamagePopupHandler(handler)`

Replaces the opening of the career damage window with a custom handler, called with the window id. A non-function value removes the handler.

- `handler` (*function|nil*) : function(popupId) called instead of career_modules_tutorialPopups.introPopup.

#### `gameplay_tutorial_damageTracker.setEnabled(value)`

Enables or disables damage tracking. On disabling: stops tracking the vehicle and removes all tasks; on enabling: tracks the vehicle and displays the task if needed.

- `value` (*boolean*) : true to enable.

#### `gameplay_tutorial_damageTracker.setRepairGoal(goal)`

Sets the "repair" task displayed after a crash (task table for the task list). nil restores the default task.

- `goal` (*table|nil*) : Task table ({id, type, label, subtext, actionItems, done}).

#### `gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId)`

Sets the id of the vehicle to track (taken into account at the next ensureTrackedVehicle, for example in onUpdate).

- `vehicleId` (*integer|nil*) : Vehicle id, nil to track nothing.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: { 'gameplay_util_crashDetection' }. |

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/tutorial/damageTracker.lua`.*
