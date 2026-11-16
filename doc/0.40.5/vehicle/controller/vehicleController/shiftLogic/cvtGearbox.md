# `controller_vehicleController_shiftLogic_cvtGearbox`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua` · VM: Vehicle · 486 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/cvtGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Continuously variable transmission (CVT) gearbox logic, modes P R N D. Loaded by vehicleController when the "gearbox" device is of type cvtGearbox. Instead of choosing a discrete gear, it sets the continuous ratio every frame (gearbox:setGearRatio) to bring the engine speed toward a target speed interpolated between cvtLowRPM and cvtHighRPM according to driving aggression, and drives a simple converter lockup (electrics.values.lockupClutchRatio).

## Notes

- jbeam keys read in init: cvtGearRatioSmoothingIn (20), cvtGearRatioSmoothingOut (5), cvtTargetAVSmoothingIn (0.5), cvtTargetAVSmoothingOut (2), automaticModes ("PRND"), defaultAutomaticMode ("N"), cvtAggression (0.5), cvtHighRPM, cvtLowRPM (default: the highShiftUpRPM / lowShiftUpRPM shift points of gear 1), torqueConverterLockupRPM, torqueConverterLockupRange (20% of the lockup RPM), torqueConverterLockupMinGear (0).
- The ratio is only adjusted if |gearbox.outputAV1| > 10 rad/s; at standstill the ratio is maxGearRatio.
- The lockup is a linear ramp on engine speed (no partial lockup, unlike automaticGearbox).
- There is no "whileShifting" logic: updateGearboxGFX always stays inGear of the current mode. In arcade shiftUp/shiftDown display a warning and shiftToGearIndex switches to realistic.
- Gear indices are virtual: P=-2, R=-1, N=0, D=1 (cvtGearIndexLookup). currentGearIndex is 0 in P and N.
- Inconsistency: an "M" or "S" mode listed in availableModes does not exist (only P R N D), the M handling code remains but is never used; applyGearboxModeRestrictions manipulates nonexistent modes 1/2.
- M.throttleInput is assigned in init without being declared; M.running too (updateExposedData).
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse()` | True outside arcade in manual mode (never in practice). *(internal)* | 98 |
| `controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior)` | Selects the arcade or realistic logic. *(internal)* | 132 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getGearName()` | Name of the current mode (P, R, N, D). | 102 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition()` | Normalized lever position and mode index. | 106 |
| `controller_vehicleController_shiftLogic_cvtGearbox.getState()` | Saveable state {grb_mde = mode}. | 454 |
| `controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable)` | Creates the gear ratio and target speed smoothers, the mode list, the lockup parameters and applies the default mode. Called by vehicleController (init and reset). *(internal)* | 333 |
| `controller_vehicleController_shiftLogic_cvtGearbox.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 327 |
| `controller_vehicleController_shiftLogic_cvtGearbox.setState(data)` | Restores the mode from data.grb_mde. | 460 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftDown()` | Realistic: switches to the previous mode. | 173 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index)` | Realistic: chooses the mode matching the lever position (-1 R, 0 N, 1 P, 2 D); nonexistent -> message and N. | 185 |
| `controller_vehicleController_shiftLogic_cvtGearbox.shiftUp()` | Realistic: switches to the next mode in the list (P->R->N->D). | 161 |

### Parameter details

#### `controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse()`

True outside arcade in manual mode (never in practice).

- **returns**: boolean LEDs used?

#### `controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior)`

Selects the arcade or realistic logic.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_cvtGearbox.getGearName()`

Name of the current mode (P, R, N, D).

- **returns**: string Mode.

#### `controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition()`

Normalized lever position and mode index.

- **returns**: number (index-1)/(number of modes-1)
- **returns**: integer Mode index.

#### `controller_vehicleController_shiftLogic_cvtGearbox.getState()`

Saveable state {grb_mde = mode}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable)`

Creates the gear ratio and target speed smoothers, the mode list, the lockup parameters and applies the default mode. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_cvtGearbox.setState(data)`

Restores the mode from data.grb_mde.

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index)`

Realistic: chooses the mode matching the lever position (-1 R, 0 N, 1 P, 2 D); nonexistent -> message and N.

- `index` (*integer*) : Lever position.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Brake (0..1), at least arcadeAutoBrakeAmount at standstill in arcade. |
| `checkEngine` | boolean | Engine disabled. |
| `clutchRatio` | number | Always 1 (no driven clutch). |
| `currentGearIndex` | integer | Virtual index (R -1, N/P 0, D 1). |
| `energyStorages` | table<integer, string> | Engine tanks. |
| `engineLoad` | number | Engine load. |
| `engineThrottle` | number | Throttle applied to the engine. |
| `engineTorque` | number | Combustion torque. |
| `flywheelTorque` | number | Engine torque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox output torque. |
| `idleRPM` | number | Idle. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | Throttle/brake swapped. |
| `isEngineRunning` | number | 1 if the engine is running. |
| `isManualModeActive` | boolean | True in M modes (not available in practice). |
| `isSportModeActive` | boolean | True in S mode (not available in practice). |
| `maxGearIndex` | integer | Largest gearbox index. |
| `maxRPM` | number | Max RPM. |
| `minGearIndex` | integer | Absolute value of the smallest index (init), then not updated. |
| `oilTemp` | number | Oil temperature. |
| `rpm` | number | Engine speed (RPM). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Copy of smoothedValues.drivingAggression. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Throttle (0..1), swapped with the brake in arcade reverse. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | nop then inGear of the active mode. |
| `waterTemp` | number | Coolant temperature. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua`.*
