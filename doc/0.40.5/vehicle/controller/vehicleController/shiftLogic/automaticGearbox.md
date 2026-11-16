# `controller_vehicleController_shiftLogic_automaticGearbox`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua` · VM: Vehicle · 756 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/automaticGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Automatic gearbox logic (modes P R N D S 1-9 M, torque converter with partial lockup). Loaded by vehicleController when the "gearbox" device is of type automaticGearbox. Depending on the gearbox mode (arcade or realistic), it decides the target gear from the shift points (aggression, slip), handles throttle/brake (automatic inversion in reverse in arcade, auto brake at standstill) and converter lockup (electrics.values.lockupClutchRatio).

## Example

```lua
-- from another controller or the vehicle console
controller.mainController.shiftToGearIndex(0) -- delegated to this module
-- jbeam: "automaticModes":"PRNDS21M", "torqueConverterLockupRPM":1800
```

## Notes

- jbeam keys read in init: automaticModes (default "PRNDS21M"; letters P R N D S 1-9 M, "M" is replaced by M1..Mn depending on maxGearIndex), hShifterModePositions (table mode -> lever index; default {[-1]=R,[0]=N,P,D,S,2,1,M1}), defaultAutomaticMode (N), defaultAutomaticForwardMode (first forward mode, otherwise D), maxGearChangeTime / minGearChangeTime / sportGearChangeTime (0), autoDownShiftInM (true), autoDownShiftInMMinGear (2), throttleCoefWhileShifting (1), torqueConverterLockupRPM, torqueConverterLockupRange, torqueConverterLockupMinGear (0), torqueConverterHasPartialLockup (true), torqueConverterMinPartialLockupRatio or torqueConverterLockupRatioWhileShifting (0.67), partialLockupTipInThreshold (0.85), partialLockupTipInGain (1.5), torqueConverterLockupRate (5), torqueConverterLockupInRate (2x rate), torqueConverterLockupOutRate (rate).
- Converter lockup is active only if torqueConverterLockupRPM > 0 and a "torqueConverter" device exists.
- Common contract of the shiftLogic modules: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues are injected by vehicleController (nil until injected).
- updateGearboxGFX is nop at creation then replaced in gearboxBehaviorChanged by the "inGear" function of the current gearbox mode, and temporarily by "whileShifting" during a gear change.
- In arcade mode, shiftUp/shiftDown only display a warning (warnCannotShiftSequential) and shiftToGearIndex switches to realistic.
- Inconsistency: init sets M.minGearIndex = abs(minGearIndex) whereas updateExposedData (every frame) replaces it with gearbox.minGearIndex (signed).
- M.running and M.isShifting are written by updateExposedData without being declared initially.
- applyGearboxModeRestrictions can store strings (M mode index extracted from the string) in maxGearIndex/minGearIndex, then compared with numbers: Lua converts numeric strings for arithmetic but not for < / > comparisons between a string and a number (risk of error); only inferred from code.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse()` | True if not in arcade and in manual M mode. *(internal)* | 95 |
| `controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior)` | Called by vehicleController on an arcade/realistic change: chooses the matching logic and, in arcade, resets the mode (default forward mode, R or N depending on the gear). *(internal)* | 159 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getGearName()` | Displayed gear name: P/R/N/D, "S<n>" in S mode, "M<n>" in manual, otherwise the mode name. | 99 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition()` | Lever position for animation: (index-1)/(number of modes-1) and mode index. | 109 |
| `controller_vehicleController_shiftLogic_automaticGearbox.getState()` | Saveable state: {grb_mde = current mode}. | 723 |
| `controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable)` | Reads the devices (mainEngine, gearbox, torqueConverter), builds the mode list, the H-shifter table, the lockup parameters and applies the default mode. Called by vehicleController (init and reset). *(internal)* | 594 |
| `controller_vehicleController_shiftLogic_automaticGearbox.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 588 |
| `controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode)` | Sets the default "forward" mode (D, S, M1...) and applies it if already driving forward. | 182 |
| `controller_vehicleController_shiftLogic_automaticGearbox.setState(data)` | Restores the current mode from data.grb_mde. | 729 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftDown()` | Realistic mode: goes back one step in the mode list. With gearboxSafety, refuses to downshift below M1 above 2 m/s or a gear that would over-rev. | 239 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index)` | Realistic mode: selects the mode matching the H-shifter lever position (hShifterModePositions); nonexistent mode -> message and N. | 283 |
| `controller_vehicleController_shiftLogic_automaticGearbox.shiftUp()` | Realistic mode: advances one step in the mode list (P->R->N->D...). With gearboxSafety, refuses a manual gear that would make the engine exceed maxAV. | 196 |

### Parameter details

#### `controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse()`

True if not in arcade and in manual M mode.

- **returns**: boolean Use RPM LEDs?

#### `controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior)`

Called by vehicleController on an arcade/realistic change: chooses the matching logic and, in arcade, resets the mode (default forward mode, R or N depending on the gear).

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_automaticGearbox.getGearName()`

Displayed gear name: P/R/N/D, "S<n>" in S mode, "M<n>" in manual, otherwise the mode name.

- **returns**: string Displayed name.

#### `controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition()`

Lever position for animation: (index-1)/(number of modes-1) and mode index.

- **returns**: number Normalized position 0..1.
- **returns**: integer Mode index.

#### `controller_vehicleController_shiftLogic_automaticGearbox.getState()`

Saveable state: {grb_mde = current mode}.

- **returns**: table|nil State table.

#### `controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable)`

Reads the devices (mainEngine, gearbox, torqueConverter), builds the mode list, the H-shifter table, the lockup parameters and applies the default mode. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : jbeam data (see notes).
- `sharedFunctionTable` (*table*) : sharedFunctions of vehicleController.

#### `controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode)`

Sets the default "forward" mode (D, S, M1...) and applies it if already driving forward.

- `mode` (*string*) : Mode name ("M1" switches to manual on the current gear).

#### `controller_vehicleController_shiftLogic_automaticGearbox.setState(data)`

Restores the current mode from data.grb_mde.

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index)`

Realistic mode: selects the mode matching the H-shifter lever position (hShifterModePositions); nonexistent mode -> message and N.

- `index` (*integer*) : Lever position (-1 R, 0 N, 1.. according to the table).

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Decided brake (0..1); in arcade, at least arcadeAutoBrakeAmount at standstill without throttle. |
| `checkEngine` | boolean | True if the engine is disabled. |
| `clutchRatio` | number | Always 1 (automatic gearbox, no driven clutch). |
| `currentGearIndex` | integer | Gear index targeted by the logic. |
| `energyStorages` | table<integer, string> | Tanks of the main engine. |
| `engineLoad` | number | Engine load. |
| `engineThrottle` | number | Throttle actually applied to the engine. |
| `engineTorque` | number | Combustion torque. |
| `flywheelTorque` | number | Engine output torque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox output torque. |
| `idleRPM` | number | Idle RPM. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | True when throttle and brake are swapped (arcade, reverse). |
| `isEngineRunning` | number | 1 if the engine is running, 0 otherwise. |
| `isManualModeActive` | boolean | True in M1..Mn modes. |
| `isSportModeActive` | boolean | True in S mode. |
| `maxGearIndex` | integer | Highest forward gear. |
| `maxRPM` | number | Maximum RPM. |
| `minGearIndex` | integer | Smallest gear index (reverse); see notes on the sign. |
| `oilTemp` | number | Engine oil temperature. |
| `rpm` | number | Engine speed in RPM. |
| `shiftBehavior` | table|nil | Injected (shiftUpAV / shiftDownAV in rad/s). |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Copy of smoothedValues.drivingAggression. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s), used by vehicleController. |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Decided throttle (0..1), possibly inverted in arcade reverse or limited during a shift. |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | Current decision loop: nop, then inGear/whileShifting of the active gearbox mode. |
| `waterTemp` | number | Coolant temperature. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua`.*
