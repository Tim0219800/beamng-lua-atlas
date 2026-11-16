# `career_modules_vehiclePerformance`

*File: `lua/ge/extensions/career/modules/vehiclePerformance.lua` · VM: Game Engine (GE) · 654 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_vehiclePerformance`: `extensions.load("career_modules_vehiclePerformance")`, then the global `career_modules_vehiclePerformance`

Performance certification ("performance index") of career vehicles, from the garage computer. startDragTest chains, with util_stepHandler, a recorded drag test on the alderStrip track (west_coast_usa) (power, 0-60 time, 60 ft, 330 ft, 1/8, 1000 ft, 1/4 mile, speeds, braking), then an AI-driven 10-lap skidpad test (lateral acceleration). The data is stored in vehicle.certificationData, the history (10 entries max) in performanceHistory, then converted to scores and class by gameplay_vehiclePerformance. Also handles the test cameras, action blocking during the test and cancellation (user, stuck vehicle, broken engine).

## Notes

- During the test, the other inventory vehicles are deactivated and traffic dispersed; the vehicle is filled with fuel; a group of blocked actions certificationBlockedActions is activated (radial menu, big map, walking, physics reset, nodegrabber, triggers, gearbox mode).
- The test is cancelled if the vehicle moves less than 0.1 m for 7 s (considered stuck) or if the engine suffers catastrophic overtorque / locks up (cancellation after 3 s).
- cancelTest(delay, userAborted): delay = seconds to wait (real time) before going to the last step; userAborted ~= false and a test in progress emits the onGameplayActivityAborted hook.
- invalidateCertification moves the old certification into the history and deletes it; the tuning purchase calls it.
- The 0-60 mph time is computed by observing the speed (26.8224 m/s) during the run, subtracting the reaction time.
- addScoresToPerformanceData unlocks the PERFOMANCE_INDEX achievements (spelling from the code) and, for class X, HIGH_END_PERFORMANCE; the full test unlocks PERFORMANCE_INDEXED.
- The onVehicleDamaged hook is called by a Lua injection callback on the vehicle side (damageTracker.registerDamageUpdateCallback) that serializes the data.
- In getAggregateScoresFromVehId and getVehicleClass, the return is nil if the vehicle has no certificationData.

**Dependencies (loaded first):** `ui_vehicleSelector_vehicleSpecifications`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData)` | Adds the performanceAggregateScores and vehicleClass fields to a data block and unlocks the associated achievements. | 537 |
| `career_modules_vehiclePerformance.cancelTest(delay, userAborted)` | Requests cancellation of the current test and stops the camera zoom and the skidpad test. | 546 |
| `career_modules_vehiclePerformance.getActiveVehicleUiData()` | UI data of the active vehicle (career_modules_inventory.getVehicleUiData). | 616 |
| `career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId)` | Returns the aggregate scores (gameplay_vehiclePerformance.getAggregateScores) from a vehicle's certification. | 509 |
| `career_modules_vehiclePerformance.getVehicleClass(inventoryId)` | Returns a vehicle's performance class (gameplay_vehiclePerformance.getClassFromData). | 516 |
| `career_modules_vehiclePerformance.invalidateCertification(inventoryId)` | Archives a vehicle's current certification into its history then deletes it (called after a parts or tuning change). | 56 |
| `career_modules_vehiclePerformance.isTestInProgress()` | Indicates whether a certification test is in progress. | 637 |
| `career_modules_vehiclePerformance.onBeamNGTrigger(data)` | Triggers hook: changes the camera path (drag_pi_2 to 5) on entering the dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3 triggers, and switches to the external camera on exiting dragEndCamTrigger. Only handles the test vehicle. *(internal)* *(hook)* | 555 |
| `career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions)` | Garage computer hook: adds the "performance index" button for each garage vehicle (disabled until the starter vehicle is bought). *(internal)* *(hook)* | 588 |
| `career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial)` | Drag hook: 1 s after the countdown starts, switches to the start camera (behind the vehicle). *(internal)* *(hook)* | 580 |
| `career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data)` | UI router hook: attaches the active vehicle's data to data.vehicleData when the route is mounted. *(internal)* *(hook)* | 623 |
| `career_modules_vehiclePerformance.onUpdate(dtReal)` | Update hook: updates the braking camera zoom. *(internal)* *(hook)* | 75 |
| `career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta)` | Called from the vehicle via a damageTracker callback: cancels the test after 3 s in case of catastrophic overtorque or a locked engine. *(internal)* *(hook)* | 627 |
| `career_modules_vehiclePerformance.openMenu(options)` | Sets the active vehicle and navigates to the career.computer.vehiclePerformance screen. | 611 |
| `career_modules_vehiclePerformance.startDragTest()` | Starts the full certification test on the active vehicle (activeInventoryId): fade to black, vehicle spawn, recorded drag test, then skidpad (10 laps), saving of the results, return to the garage and return to the performance screen. If autosave is active, saves the career at the end. | 116 |
| `career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData)` | Translates in place the drivetrain, fuelType, inductionType fields of a performance data block for display. | 523 |

### Parameter details

#### `career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData)`

Adds the performanceAggregateScores and vehicleClass fields to a data block and unlocks the associated achievements.

- `performanceData` (*table*) : Performance data (modified in place).

#### `career_modules_vehiclePerformance.cancelTest(delay, userAborted)`

Requests cancellation of the current test and stops the camera zoom and the skidpad test.

- `delay` (*number|nil*) : Delay in seconds before the actual stop, 0 by default.
- `userAborted` (*boolean|nil*) : false if the cancellation is automatic (no onGameplayActivityAborted hook).

#### `career_modules_vehiclePerformance.getActiveVehicleUiData()`

UI data of the active vehicle (career_modules_inventory.getVehicleUiData).

- **returns**: table|nil UI data, nil if no active vehicle.

#### `career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId)`

Returns the aggregate scores (gameplay_vehiclePerformance.getAggregateScores) from a vehicle's certification.

- `inventoryId` (*integer*) : Inventory id.
- **returns**: table|nil Scores, or nil without certification.

#### `career_modules_vehiclePerformance.getVehicleClass(inventoryId)`

Returns a vehicle's performance class (gameplay_vehiclePerformance.getClassFromData).

- `inventoryId` (*integer*) : Inventory id.
- **returns**: table|nil Class, or nil without certification.

#### `career_modules_vehiclePerformance.invalidateCertification(inventoryId)`

Archives a vehicle's current certification into its history then deletes it (called after a parts or tuning change).

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_vehiclePerformance.isTestInProgress()`

Indicates whether a certification test is in progress.

- **returns**: boolean|nil true during the test, nil otherwise.

#### `career_modules_vehiclePerformance.onBeamNGTrigger(data)`

Triggers hook: changes the camera path (drag_pi_2 to 5) on entering the dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3 triggers, and switches to the external camera on exiting dragEndCamTrigger. Only handles the test vehicle.

- `data` (*table*) : {triggerName, event ("enter"|"exit"), subjectID}.

#### `career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions)`

Garage computer hook: adds the "performance index" button for each garage vehicle (disabled until the starter vehicle is bought).

- `menuData` (*table*) : Menu data.
- `computerFunctions` (*table*) : Table to fill.

#### `career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial)`

Drag hook: 1 s after the countdown starts, switches to the start camera (behind the vehicle).

- `vehId` (*integer*) : Vehicle id.
- `dial` (*any*) : Dial value (unused).

#### `career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data)`

UI router hook: attaches the active vehicle's data to data.vehicleData when the route is mounted.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Origin route.
- `data` (*table*) : Route data table (receives vehicleData).

#### `career_modules_vehiclePerformance.onUpdate(dtReal)`

Update hook: updates the braking camera zoom.

- `dtReal` (*number*) : Real time delta (s).

#### `career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta)`

Called from the vehicle via a damageTracker callback: cancels the test after 3 s in case of catastrophic overtorque or a locked engine.

- `damageData` (*table*) : Damage data.
- `damageDataDelta` (*table*) : Damage change (engine field).

#### `career_modules_vehiclePerformance.openMenu(options)`

Sets the active vehicle and navigates to the career.computer.vehiclePerformance screen.

- `options` (*table*) : {inventoryId = integer}.

#### `career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData)`

Translates in place the drivetrain, fuelType, inductionType fields of a performance data block for display.

- `performanceData` (*table|nil*) : Performance data (modified in place).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_vehicleSelector_vehicleSpecifications"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplayActivityAborted`

## Calls into the engine (C++)

- `be:` `getObjectOOBBHalfAxisXYZ`
- `scenetree.` `findObject`

**Loads extensions:** `gameplay_drag_dragTypes_headsUpRace`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/vehiclePerformance.lua`.*
