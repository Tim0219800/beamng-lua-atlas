# `controller_vehicleController_shiftLogic_electricMotor`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua` · VM: Vehicle · 695 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/electricMotor` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

"Gearbox" logic for electric vehicles: modes P R N D that set the rotation direction (motorDirection) of the electric motors, regenerative braking (regeneration on brake, one-pedal driving with force levels), friction brake compensation at low speed and smooth stop. Loaded by vehicleController when the "gearbox" device is of type electricMotor (or shiftLogicName). It computes M.regen (0..1 coefficient applied to the motors) and adjusts M.brake for the friction brakes. Publishes electrics.values.regenFromBrake, regenFromOnePedal, regenThrottle, maxRegenStrength and reads regenStrength.

## Notes

- jbeam keys read in init: motorNames (name or list; default {"mainMotor"}), regenSmoothingRate (20), regenSmoothingAccel (5), onePedalSmoothStopBrakeReleaseAmount (0.85), onePedalRegenCoef (0.5), onePedalFrictionBrakeCoef (1), regenStrengthLevels (3), defaultRegenStrength (= regenStrengthLevels), regenThrottleNeutralPoint (0.15), automaticModes ("PRND"), defaultAutomaticMode ("P").
- Modes P and N do not allow regeneration (regenHandling.unavailableGears); regen forced to 0.
- One-pedal driving: the force level comes from electrics.values.regenStrength (0..regenStrengthLevels); the throttle zone below regenThrottleNeutralPoint (increased with speed up to 2.5 m/s) generates regeneration, above it is positive throttle (M.throttle is remapped).
- M.regen is reduced by active ESC, by a strong lateral offset (|sensors.gx2| > 5 -> x0.8) and by the emergency brake (brake >= 1 -> x0.5).
- At maximum force level, the friction brakes compensate for the loss of regeneration at low speed then lock at standstill (smoothStopTimeToLatch 0.25 s).
- In P, the brake is at least arcadeAutoBrakeAmount; ignition < 2 forces P mode.
- With no motor found: error log "No motors have been specified". M.checkEngine is set to 0 (number) whereas the other modules use a boolean.
- Registers a quick menu (radial) entry to adjust regeneration (off / levels / full).
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController. M.running written without declaration.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse()` | Always false. *(internal)* | 105 |
| `controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior)` | Selects the arcade or realistic logic. *(internal)* | 117 |
| `controller_vehicleController_shiftLogic_electricMotor.getGearName()` | Mode name (P, R, N, D). | 109 |
| `controller_vehicleController_shiftLogic_electricMotor.getGearPosition()` | Normalized lever position and mode index. | 113 |
| `controller_vehicleController_shiftLogic_electricMotor.getState()` | Saveable state {grb_mde = mode}. | 661 |
| `controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable)` | Gets the motors, builds the brake/regeneration curves, the smoothers, the modes, registers the quick menu and applies the default mode. Called by vehicleController (init and reset). *(internal)* | 499 |
| `controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data)` | Load hook: restores electrics.values.regenStrength (clamped). *(internal)* *(hook)* | 651 |
| `controller_vehicleController_shiftLogic_electricMotor.onSerialize()` | Save hook: {regenLevel = regeneration level}. *(internal)* *(hook)* | 657 |
| `controller_vehicleController_shiftLogic_electricMotor.sendTorqueData()` | Asks each motor to send its torque curves to the UI. *(internal)* | 415 |
| `controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled)` | Turns the ignition of all motors on or off; called by vehicleController.setEngineIgnition when there is no main engine device. | 421 |
| `controller_vehicleController_shiftLogic_electricMotor.setState(data)` | Restores the mode from data.grb_mde. | 667 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftDown()` | Realistic: previous mode. | 159 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index)` | Realistic: selects the lever's mode; nonexistent -> message and N. | 170 |
| `controller_vehicleController_shiftLogic_electricMotor.shiftUp()` | Realistic: next mode in the list (P->R->N->D) and updates the motor direction. | 148 |

### Parameter details

#### `controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse()`

Always false.

- **returns**: boolean false

#### `controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior)`

Selects the arcade or realistic logic.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_electricMotor.getGearName()`

Mode name (P, R, N, D).

- **returns**: string Mode.

#### `controller_vehicleController_shiftLogic_electricMotor.getGearPosition()`

Normalized lever position and mode index.

- **returns**: number Position 0..1.
- **returns**: integer Mode index.

#### `controller_vehicleController_shiftLogic_electricMotor.getState()`

Saveable state {grb_mde = mode}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable)`

Gets the motors, builds the brake/regeneration curves, the smoothers, the modes, registers the quick menu and applies the default mode. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data)`

Load hook: restores electrics.values.regenStrength (clamped).

- `data` (*table*) : Table produced by onSerialize.

#### `controller_vehicleController_shiftLogic_electricMotor.onSerialize()`

Save hook: {regenLevel = regeneration level}.

- **returns**: table Data.

#### `controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled)`

Turns the ignition of all motors on or off; called by vehicleController.setEngineIgnition when there is no main engine device.

- `enabled` (*boolean*) : Ignition active?

#### `controller_vehicleController_shiftLogic_electricMotor.setState(data)`

Restores the mode from data.grb_mde.

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index)`

Realistic: selects the lever's mode; nonexistent -> message and N.

- `index` (*integer*) : Lever position (-1 R, 0 N, 1 P, 2 D).

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Final friction brake after deducting regeneration. |
| `checkEngine` | boolean | Declared boolean, but set to 0 (number) by updateExposedData. |
| `clutchRatio` | number | Always 1. |
| `currentGearIndex` | integer | R -1, N/P 0, D 1. |
| `energyStorages` | table<integer, string> | Motor batteries. |
| `engineLoad` | number | Average load of the motors. |
| `engineThrottle` | number | Copy of throttle. |
| `engineTorque` | number | Sum of the motor torques. |
| `flywheelTorque` | number | Same as engineTorque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Same as engineTorque. |
| `idleRPM` | number | 0. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | Throttle/brake swapped (arcade, reverse). |
| `isEngineRunning` | number | Always 1. |
| `isSportModeActive` | boolean | Always false in practice. |
| `maxGearIndex` | integer | Largest index. |
| `maxRPM` | number | Highest max speed of the motors. |
| `minGearIndex` | integer | Absolute value of the smallest index. |
| `oilTemp` | number | 0. |
| `regen` | number | Current regeneration coefficient (0..1) applied to the motors. |
| `rpm` | number | Highest motor speed (RPM, absolute value). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | 0 by default. |
| `smoothedAvgAVInput` | number | Average angular velocity of the devices of category "engine" (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Throttle (0..1), remapped in one-pedal driving. |
| `throttleInput` | number |  |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | nop then inGear of the active mode. |
| `waterTemp` | number | 0. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua`.*
