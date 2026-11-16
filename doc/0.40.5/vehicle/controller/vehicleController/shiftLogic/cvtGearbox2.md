# `controller_vehicleController_shiftLogic_cvtGearbox2`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua` · VM: Vehicle · 620 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/cvtGearbox2` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Second CVT gearbox logic, driven by a map (target speed = f(wheel speed, aggression)) instead of a simple interpolator. Modes P R N D S. S mode enables simulated fixed gears (sport "steps") with a delay between changes. Loaded by vehicleController via jbeam shiftLogicName = "cvtGearbox2" (the "gearbox" device must be of type cvtGearbox for automatic selection, otherwise name the module explicitly). Sets the continuous ratio through gearbox:setGearRatio and a converter lockup with hysteresis.

## Notes

- jbeam keys read in init: cvtGearRatioSmoothingIn (6), cvtGearRatioSmoothingOut (4), cvtLockupSmoothing (5), automaticModes ("PRND"), defaultAutomaticMode ("N"), lockupMinWheelspeed (2 m/s), lockupMinRpmDiff (50), lockupMaxRpmDiff (400), cvtTargetRPMMap (data for interpolatedMap: wheel speed / aggression axes -> RPM), cvtSportGearShiftCooldown (1 s), cvtSportGearRatios (array of decreasing ratios).
- The target speed comes from cvtTargetRPMMap:get(wheelspeed, drivingAggression); target ratio = target speed / gearbox output speed, bounded by minGearRatio/maxGearRatio, then smoothed. In R, ratio = maxGearRatio.
- Bug spotted: init always sets cvtHandling.useFixedGearRatios = false when reading cvtSportGearRatios (valid or not); the option is only re-enabled by applyGearboxMode in S mode, called at the end of init. If cvtTargetRPMMap is missing, loadData receives nil.
- The lockup (lockupClutchRatio) is only active if a "torqueConverter" device exists and lockupMinWheelspeed > 0; it depends on the gap between target speed and engine speed, on speed and on throttle.
- No "whileShifting" logic: updateGearboxGFX stays inGear. In arcade shiftUp/Down display a warning; shiftToGearIndex switches to realistic.
- Virtual gear: P=-2, R=-1, N=0, D=1, S=2. currentGearIndex = 0 in P/N.
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController. M.running written without declaration.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse()` | True outside arcade in manual mode (never in practice). *(internal)* | 104 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior)` | Selects the arcade or realistic logic. *(internal)* | 144 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getGearName()` | Mode name: P, R, N, D, or "S<n>" in sport (n = current fixed step). | 108 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition()` | Normalized lever position and mode index. | 118 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.getState()` | Saveable state {grb_mde = mode}. | 588 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable)` | Creates smoothers, mode list, lockup parameters, target speed map and S mode fixed ratios; applies the default mode. Called by vehicleController (init and reset). *(internal)* | 430 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 424 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.setState(data)` | Restores the mode from data.grb_mde. | 594 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftDown()` | Realistic: previous mode. | 189 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index)` | Realistic: mode matching the lever position; nonexistent -> message and N. | 201 |
| `controller_vehicleController_shiftLogic_cvtGearbox2.shiftUp()` | Realistic: next mode (P->R->N->D->S). | 177 |

### Parameter details

#### `controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse()`

True outside arcade in manual mode (never in practice).

- **returns**: boolean LEDs used?

#### `controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior)`

Selects the arcade or realistic logic.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getGearName()`

Mode name: P, R, N, D, or "S<n>" in sport (n = current fixed step).

- **returns**: string Displayed name.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition()`

Normalized lever position and mode index.

- **returns**: number (index-1)/(number of modes-1)
- **returns**: integer Mode index.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.getState()`

Saveable state {grb_mde = mode}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable)`

Creates smoothers, mode list, lockup parameters, target speed map and S mode fixed ratios; applies the default mode. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.setState(data)`

Restores the mode from data.grb_mde.

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index)`

Realistic: mode matching the lever position; nonexistent -> message and N.

- `index` (*integer*) : Lever position (-1 R, 0 N, 1 P, 2 D, 3 S).

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Brake (0..1). |
| `checkEngine` | boolean | Engine disabled. |
| `clutchRatio` | number | Always 1. |
| `currentGearIndex` | integer | Virtual index (R -1, N/P 0, D 1, S 2). |
| `energyStorages` | table<integer, string> | Engine tanks. |
| `engineLoad` | number | Engine load. |
| `engineThrottle` | number | Throttle applied to the engine. |
| `engineTorque` | number | Combustion torque. |
| `engineTorqueData` | table |  |
| `flywheelTorque` | number | Engine torque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox output torque. |
| `idleRPM` | number | Idle. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | Throttle/brake swapped. |
| `isEngineRunning` | number | 1 if the engine is running. |
| `isManualModeActive` | boolean | True in M modes (not available in practice). |
| `isSportModeActive` | boolean | True in S mode. |
| `maxGearIndex` | integer | Largest gearbox index. |
| `maxRPM` | number | Max RPM. |
| `minGearIndex` | integer | Absolute value of the smallest index (init). |
| `oilTemp` | number | Oil temperature. |
| `rpm` | number | Engine speed (RPM). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Copy of drivingAggression. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Throttle (0..1), swapped with the brake in arcade reverse. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `torqueToMinRPM` | table |  |
| `updateGearboxGFX` | function | nop then inGear of the active mode. |
| `waterTemp` | number | Coolant temperature. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua`.*
