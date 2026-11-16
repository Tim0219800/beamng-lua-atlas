# `controller_vehicleController_vehicleController`

*File: `lua/vehicle/controller/vehicleController/vehicleController.lua` · VM: Vehicle · 1261 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/vehicleController` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Main controller (type "main", defaultOrder 500) of the vehicle. It reads the driver inputs (input.throttle/brake/clutch, or the electrics overrides), loads the gearbox logic module (shiftLogic/ folder, chosen by the type of the "gearbox" device or by the jbeam key shiftLogicName), manages the arcade/realistic gearbox mode, the driving aggression computation, shift prevention on slip/jump, the smart parking brake, the speed limit, and publishes more than 30 values in electrics.values (throttle, brake, clutch, gear, rpm, fuel, engineRunning...). A modder uses it through controller.mainController to change gear, change gearbox mode, cut the ignition or limit the speed.

## Example

```lua
local vc = controller.mainController
vc.setGearboxMode("realistic")
vc.shiftUpOnDown()
vc.setTopSpeedLimitTemporary(20) -- m/s
vc.setTopSpeedLimitTemporaryActive(true)
```

## Notes

- jbeam keys read in init: arcadeAutoBrakeAmount (0.3), smartParkingBrakeActiveUponSpawn (true), gearboxDecisionSmoothingDown (2) / gearboxDecisionSmoothingUp (5), wheelSlipShiftUpSmoothingIn (10) / Out (20), aggressionSmoothingUp (1.5) / aggressionSmoothingDown (0.15), useSmartAggressionCalculation (true), topSpeedLimit (-1) and topSpeedLimitReverse (-1) in m/s (<=0: no limit), wheelSlipUpThreshold (20000) / wheelSlipDownThreshold (30000), shiftPreventionSlipEnabled (true), shiftPreventionJumpEnabled (true), lowShiftDownRPM / highShiftDownRPM / lowShiftUpRPM / highShiftUpRPM (number or per-gear array; defaults 2000/3500/2500/5000), calculateOptimalLoadShiftPoints and shiftDownRPMOffsetCoef (1.3), transmissionShiftDelay (0.2), transmissionGearChangeDelay (0.5), neutralSelectionDelay (0.5), aggressionHoldOffThrottleDelay (2.25), revMatchExpired (1), shiftLogicName.
- Shift points are stored internally as angular velocity (rad/s): rpm x 0.104719755. Values sent to the UI (shiftDecisionData) are converted back to RPM.
- The gearbox module is loaded from controller/vehicleController/shiftLogic/<name>, falling back to the old path controller/shiftLogic-<name> (log D "legacy"). Without a "gearbox" device, the "dummy" module is used.
- The two fields M.updateGFX and M.setDefaultForwardMode are initialized with `nop`: this is presumably an engine-provided global (not defined in this file). updateGFX is replaced by updateGFXGeneric in init/reset; setDefaultForwardMode is replaced by the gearbox module's one (so it can be nil if the module does not define it).
- M.gearboxBehavior is nil at creation and is only set after the first setGearboxBehavior (called at the end of init).
- updateGFX also applies the speed limit: M.throttle is multiplied by (1 - PID output) when wheelspeed exceeds the limit; in reverse (gear name starting with "R") it is topSpeedLimitReverse.
- When freeze is active (setFreeze(1)), M.brake is forced to 1 and the gearbox is locked (gearbox:setLock).
- Minor inconsistency: smartParkingBrake calls input.event("parkingbrake") when electrics.values.wheelspeed is nil, then continues anyway and does abs(speed) on nil (probable error); a return is missing after the first input.event.
- electrics.values written every frame: fuel, lowfuel, fuelCapacity, fuelVolume, throttle, brake, clutch (= 1 - clutchRatio), clutchRatio, isShifting, gear, gear_A, gearModeIndex, gearIndex, minGearIndex, maxGearIndex, rpm, idlerpm, maxrpm, oiltemp, watertemp, checkengine, ignition, running, engineThrottle, engineLoad, engineRunning, radiatorFanSpin, smoothShiftLogicAV, gearboxMode, freezeState.
- GUI streams fed if requested: engineInfo (array of 21 values), gearboxData, shiftDecisionData.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change)` | Adds a value to the temporary limit (nil counts as 0). | 163 |
| `controller_vehicleController_vehicleController.cycleGearboxModes()` | Switches to the next gearbox mode in the list {"arcade", "realistic"} (wrapping around) and displays a message. | 670 |
| `controller_vehicleController_vehicleController.getState()` | Returns the compact controller state for synchronization: grb_bhv (gearbox mode), frzn (frozen), merged with the gearbox module's getState. | 1202 |
| `controller_vehicleController_vehicleController.init(jbeamData)` | Initializes the controller: reads the jbeam keys, creates the smoothers, computes the shift points, loads and initializes the shiftLogic module, registers the "gearbox mode" quick menu and sets the initial gearbox mode (previous, defaultGearboxBehavior setting, otherwise arcade). Called by the engine at vehicle load. *(internal)* | 957 |
| `controller_vehicleController_vehicleController.initLastStage()` | Called after the init of all controllers: applies the parking brake at spawn if allowed. *(internal)* | 1169 |
| `controller_vehicleController_vehicleController.onDeserialize(data)` | Load hook: restores the gearbox mode, the gearbox module data, then reapplies the parking brake. *(internal)* *(hook)* | 1181 |
| `controller_vehicleController_vehicleController.onSerialize()` | Save hook: returns {previousGearboxBehavior, controlLogicModuleData} (gearbox module data if it has onSerialize). *(internal)* *(hook)* | 1191 |
| `controller_vehicleController_vehicleController.reset(jbeamData)` | Resets timers, smoothers, PID, parking brake state and reinitializes the gearbox module; reapplies the gearbox mode. Called at vehicle reset. *(internal)* | 863 |
| `controller_vehicleController_vehicleController.resetLastStage(jbeamData)` | Called last at reset: reapplies the spawn parking brake and cancels the automatic start. *(internal)* | 951 |
| `controller_vehicleController_vehicleController.sendTorqueData()` | Asks the gearbox module to send the torque curves to the UI; ignored if no main player is seated. | 719 |
| `controller_vehicleController_vehicleController.setAggressionOverride(aggression)` | Forces the driving aggression (0..1) used by the shift points; nil gives control back to the automatic computation. | 175 |
| `controller_vehicleController_vehicleController.setEngineIgnition(enabled)` | Cuts or turns on the engine ignition (engine:setIgnition 1/0) or, without an engine, calls the gearbox module's setIgnition. | 711 |
| `controller_vehicleController_vehicleController.setFreeze(mode)` | Freezes the vehicle: brake forced to 1 and gearbox locked if mode == 1. | 704 |
| `controller_vehicleController_vehicleController.setGearboxMode(behavior)` | Sets the gearbox mode. Unknown: error log and no effect. Displays a message, then notifies the module (gearboxBehaviorChanged). | 189 |
| `controller_vehicleController_vehicleController.setStarter(enabled)` | Engages or cuts the main engine's starter; only activates if the speed is below 80% of starterMaxAV. | 694 |
| `controller_vehicleController_vehicleController.setState(data)` | Applies a state produced by getState (gearbox mode, freeze, then the gearbox module state). | 1211 |
| `controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit)` | Sets the temporary speed limit. It only acts if setTopSpeedLimitTemporaryActive(true). | 159 |
| `controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active)` | Enables or disables the temporary speed limit (reset to false at reset). | 167 |
| `controller_vehicleController_vehicleController.settingsChanged()` | Hook called when user settings change: rereads autoClutch, autoThrottle, gearboxSafety and defaultGearboxBehavior (applies the latter to the player's vehicle). *(internal)* | 773 |
| `controller_vehicleController_vehicleController.shiftDownOnDown()` | Downshifts on key press: the module's shiftDownOnDown, otherwise shiftDown. | 652 |
| `controller_vehicleController_vehicleController.shiftDownOnUp()` | Downshift key release: the module's shiftDownOnUp if it exists. Required API of the main controller. | 660 |
| `controller_vehicleController_vehicleController.shiftToGearIndex(index)` | Shifts directly to the gear of the given index (negative = reverse, 0 = neutral) by delegating to the gearbox module. | 666 |
| `controller_vehicleController_vehicleController.shiftUpOnDown()` | Shifts up on key press: calls the gearbox module's shiftUpOnDown, otherwise shiftUp. | 639 |
| `controller_vehicleController_vehicleController.shiftUpOnUp()` | Shift up key release: calls the module's shiftUpOnUp if it exists. | 646 |
| `controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride)` | "Smart" handbrake input: if the vehicle is moving (> 2.8 m/s), skidding (cumulative slip > 10000) or if the input is an axis, relays the parkingbrake event as is (temporary brake); otherwise, at standstill, a press toggles the parking brake, and a release with the brake applied enables the smartParkingBrakeActive mode (released as soon as you accelerate). | 432 |
| `controller_vehicleController_vehicleController.toggleTopSpeedLimitTemporaryActive()` | Toggles the activation of the temporary limit. | 171 |
| `controller_vehicleController_vehicleController.vehicleActivated()` | Hook called when the vehicle becomes active: sends the shift point data back to the UI (ShiftPointDebugDataChanged) if a player is seated. *(internal)* | 1173 |

### Parameter details

#### `controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change)`

Adds a value to the temporary limit (nil counts as 0).

- `change` (*number*) : Change in m/s.

#### `controller_vehicleController_vehicleController.getState()`

Returns the compact controller state for synchronization: grb_bhv (gearbox mode), frzn (frozen), merged with the gearbox module's getState.

- **returns**: table|nil State table, nil if empty.

#### `controller_vehicleController_vehicleController.init(jbeamData)`

Initializes the controller: reads the jbeam keys, creates the smoothers, computes the shift points, loads and initializes the shiftLogic module, registers the "gearbox mode" quick menu and sets the initial gearbox mode (previous, defaultGearboxBehavior setting, otherwise arcade). Called by the engine at vehicle load.

- `jbeamData` (*table*) : Controller jbeam data (see notes for the keys).

#### `controller_vehicleController_vehicleController.onDeserialize(data)`

Load hook: restores the gearbox mode, the gearbox module data, then reapplies the parking brake.

- `data` (*table*) : Table produced by onSerialize.

#### `controller_vehicleController_vehicleController.onSerialize()`

Save hook: returns {previousGearboxBehavior, controlLogicModuleData} (gearbox module data if it has onSerialize).

- **returns**: table Data to serialize.

#### `controller_vehicleController_vehicleController.reset(jbeamData)`

Resets timers, smoothers, PID, parking brake state and reinitializes the gearbox module; reapplies the gearbox mode. Called at vehicle reset.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_vehicleController_vehicleController.resetLastStage(jbeamData)`

Called last at reset: reapplies the spawn parking brake and cancels the automatic start.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_vehicleController_vehicleController.setAggressionOverride(aggression)`

Forces the driving aggression (0..1) used by the shift points; nil gives control back to the automatic computation.

- `aggression` (*number|nil*) : Forced value or nil.

#### `controller_vehicleController_vehicleController.setEngineIgnition(enabled)`

Cuts or turns on the engine ignition (engine:setIgnition 1/0) or, without an engine, calls the gearbox module's setIgnition.

- `enabled` (*boolean*) : Ignition active?

#### `controller_vehicleController_vehicleController.setFreeze(mode)`

Freezes the vehicle: brake forced to 1 and gearbox locked if mode == 1.

- `mode` (*integer*) : 1 to freeze, any other value to release.

#### `controller_vehicleController_vehicleController.setGearboxMode(behavior)`

Sets the gearbox mode. Unknown: error log and no effect. Displays a message, then notifies the module (gearboxBehaviorChanged).

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_vehicleController.setStarter(enabled)`

Engages or cuts the main engine's starter; only activates if the speed is below 80% of starterMaxAV.

- `enabled` (*boolean*) : Starter active?

#### `controller_vehicleController_vehicleController.setState(data)`

Applies a state produced by getState (gearbox mode, freeze, then the gearbox module state).

- `data` (*table*) : Table with grb_bhv, frzn and gearbox module keys.

#### `controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit)`

Sets the temporary speed limit. It only acts if setTopSpeedLimitTemporaryActive(true).

- `speedLimit` (*number|nil*) : Limit in m/s.

#### `controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active)`

Enables or disables the temporary speed limit (reset to false at reset).

- `active` (*boolean*) : Enable?

#### `controller_vehicleController_vehicleController.shiftToGearIndex(index)`

Shifts directly to the gear of the given index (negative = reverse, 0 = neutral) by delegating to the gearbox module.

- `index` (*integer*) : Gear index.

#### `controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride)`

"Smart" handbrake input: if the vehicle is moving (> 2.8 m/s), skidding (cumulative slip > 10000) or if the input is an axis, relays the parkingbrake event as is (temporary brake); otherwise, at standstill, a press toggles the parking brake, and a release with the brake applied enables the smartParkingBrakeActive mode (released as soon as you accelerate).

- `ivalue` (*number*) : Input value (0..1).
- `filter` (*integer|nil*) : Input filter (FILTER_*), FILTER_DIRECT by default.
- `isAxisOverride` (*boolean|nil*) : Forces handling as an axis (true) or a key (false), e.g. for air brakes.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Final brake (0..1) decided by the gearbox logic (forced to 1 if the vehicle is frozen). |
| `clutchRatio` | number | Clutch ratio (1 = engaged, 0 = disengaged) provided by the gearbox logic. electrics.values.clutch equals 1 - clutchRatio. |
| `defaultOrder` | number | Default execution order of the controller (500). |
| `drivingAggression` | number | Smoothed driving aggression (0..1) that interpolates the low/high shift points; can be forced by setAggressionOverride. |
| `engineInfo` | table | Array of 21 values sent to the "engineInfo" stream: [1] idle RPM, [2] max RPM, [5] rpm, [6] gear name, [7] maxGearIndex, [8] minGearIndex, [9] flywheel torque, [10] gearbox torque, [11] ground speed, [12] fuel volume, [13] capacity, [14] "manual", [15] object id, [17] gearIndex, [18] engine running, [19] load, [20] wheel torque, [21] wheel power in hp (x0.001x1.35962), [22] engine power in hp. |
| `fireEngineTemperature` | number | Engine exhaust temperature (engine.thermals.exhaustTemperature) or ambient temperature if there is no thermal model. Updated every frame. |
| `gearboxBehavior` | string|nil | Current gearbox mode, "arcade" or "realistic"; nil before the first setGearboxBehavior. |
| `isArcadeSwitched` | boolean | True when arcade mode has swapped the throttle/brake roles (automatic reverse). Reported from the gearbox logic. |
| `setDefaultForwardMode` | function|nil | Delegated to the function of the same name in the gearbox module (changes the default forward direction). Is `nop` or nil if the module does not provide it. |
| `shiftingAggression` | number | Gear shift aggression reported by the gearbox module (0 if absent). |
| `throttle` | number | Final throttle (0..1) decided by the gearbox logic, after the speed limit. |
| `type` | string | Always "main": mandatory main controller of the vehicle. |
| `updateGFX` | function | Graphics loop, replaced by updateGFXGeneric(dt) at init (nop before). |

## Class `sharedFunctions`

Utility table passed as the second argument to the shiftLogic module's init (controlLogicModule.init(jbeamData, sharedFunctions)). Not exposed in M.

| Method | Description | Line |
|---|---|---|
| `sharedFunctions.getEnergyStorages(engines)` | Lists the tank names of the engines whose energy type matches requiredEnergyType. | 274 |
| `sharedFunctions.getShiftPoints()` | Returns the shift points table by gear index (lowShiftDownAV, highShiftDownAV, lowShiftUpAV, highShiftUpAV in rad/s). | 225 |
| `sharedFunctions.selectShiftPoints(gearIndex)` | Chooses the up/down shift speeds (rad/s) of the gear by interpolating between the low and high values according to the square of the normalized aggression; writes shiftBehavior.shiftUpAV/shiftDownAV and provides it to the module. | 215 |
| `sharedFunctions.switchToRealisticBehavior(gearIndex)` | Displays the "using the H-shifter" message, switches to realistic mode and selects the requested gear. | 229 |
| `sharedFunctions.updateAvgAVDeviceCategory(deviceCategory)` | Average of the outputAV1 of all devices of a category. Same division by zero pitfall. | 264 |
| `sharedFunctions.updateAvgAVDeviceType(deviceType)` | Average of the outputAV1 of all devices of a type. Pitfall: division by zero (NaN) if there is no device. | 254 |
| `sharedFunctions.updateAvgAVSingleDevice(deviceName, deviceProperty)` | Returns an angular velocity of a powertrain device (0 if absent). | 248 |
| `sharedFunctions.warnCannotShiftSequential()` | Sends the UI a "cannot shift to sequential" message with an action to switch the gearbox mode. | 235 |

**UI events (guihooks.trigger):** `Message`, `ShiftPointDebugDataChanged`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `obj:` `getEnvTemperature`, `getGroundSpeed`, `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/vehicleController.lua`.*
