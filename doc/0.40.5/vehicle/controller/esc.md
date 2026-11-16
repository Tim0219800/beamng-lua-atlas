# `controller_esc`

*File: `lua/vehicle/controller/esc.lua` · VM: Vehicle · 1106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `esc` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller (type "auxiliary", defaultOrder 50) that implements the car's stability control (ESC) and traction control (TCS). The ESC compares the measured yaw rate to a desired yaw rate (computed from the front wheel angle, the speed, a characteristic speed and a max lateral acceleration) and brakes one wheel to correct oversteer or understeer. The TCS compares the speed of each driven wheel to that of the diagonal wheel and reduces engine thrust (throttle factors written into electrics.values) and/or brakes the slipping wheel. A modder uses it by declaring the controller in the jbeam with a block of configurations, or drives it with its mode functions (toggleESCMode, setESCMode). It writes electrics.values.esc, tcs, escActive, tcsActive, hasESC, hasTCS and one or more throttle factors (by default electrics.values.throttleFactor), which must be read by the engine/throttle for the TCS to act.

## Example

```lua
local esc = controller.getControllerSafe('esc')
if esc then
  esc.setESCMode(1)       -- 1 = first configuration sorted by 'order'
  esc.toggleESCMode()    -- next configuration (back to 1 after the last)
  esc.pauseESCAction = true -- suspends the ESC and TCS action
end
```

## Notes

- jbeam keys read (jbeamData, configuration table): actionedWheels (list of wheel names, required, 4 wheels expected: front/rear left/right deduced from their position), offColor (LED off color, default "343434"), throttleFactorAssingment (header table wheelName/throttleFactorName; the spelling "Assingment" is the code's; default: one "throttleFactor" factor for all wheels), defaultConfig (index of the default configuration, 1 otherwise), isDebugMode (number; the code compares isDebugMode > 0 without a default value, so nil would cause an error), blacklistedEngines (list of engine names excluded from the temporary RPM limitation), configurations (table name -> configuration).
- Keys of a configuration (only those with escConfigurationEnabled true are kept, sorted by the order field ascending): escEnabled (false by default), activeColor ("98FB00"), characteristicSpeed (0 = computed from skewStiffnessFront/Rear and the geometry), proportionalFactor (1), integralFactor (0), maxIntegralPart (2), maxSideAcceleration (0), brakeForceMultiplier (0), escThreshold (999), skewStiffnessFront/Rear (1), desiredYawRateSmoothing (500), slipThreshold (0), tcsWheelSpeedThreshold (10), throttleProportionalFactor (1.5), throttleIntegralFactor (1), throttleIntegralReductionFactor (2*slipThreshold), brakingProportionalFactor (1.2), brakingIntegralFactor (0), maxBrakingFactor (0, bounded 0..1), minThrottleFactor (1, bounded 0..1), brakeThrottleSwitchThreshold (10), overrideESCPulse/overrideTCSPulse (forces the value of electrics.values.esc/tcs).
- The user settings v.userSettings.escConfig are recursively merged into the configuration at initSecondStage.
- The ESC only acts if the speed exceeds 6 m/s (escEnableThreshold) and if the yaw difference exceeds escThreshold; yaw values are in rad/s, speed in m/s. The TCS is disabled if speed < 0.55 m/s or throttle < 0.01 (except during a gear change), or if pauseESCAction is true.
- The ESC is completely disabled in reverse (electrics.values.gearIndex < 0) or if escEnabled is false in the current configuration: the throttle factors are reset to 1.
- If the number of wheels changes (wheel torn off), escFailure becomes true: updateWheelsIntermediate is replaced by nop, the esc and tcs lights stay on (1) and the modes can no longer be changed until the next initSecondStage (vehicle reset).
- If an actioned wheel is not found, initSecondStage sets M.update and M.graphicsStep to nop (names that are not the ones used by the controller, which only has updateWheelsIntermediate/updateGFX) and exits without defining updateGFX: probable inconsistency in the game's code.
- The fields M.stiffnessFront/Rear, calibrationMeasurementReady, calibrationSettled, doMeasure, doSettle are used for an internal calibration procedure (startESCCalibration); M.wheelAngleFront/Rear are the actual angle of the front/rear wheels in rad (positive sign = left turn).
- Hook: updateWheelsIntermediate(dt) is called by the controller loop after the wheels update; updateGFX(dt) is called every graphics frame. Both are nil until initSecondStage has succeeded.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_esc.deserialize(data)` | Restores the configuration from serialize(). | 1062 |
| `controller_esc.getCarData()` | Returns the computed vehicle geometry, or nil if the mass is zero. | 621 |
| `controller_esc.getCurrentConfigData()` | Returns the table of the current ESC configuration (sanitized fields, with name). | 640 |
| `controller_esc.getState()` | Returns the state table (key "<controllerName>ConfigKey" = current index) for saving/synchronizing the vehicle. | 1068 |
| `controller_esc.init(jbeamData)` | Stores the jbeam data, creates the state table for saving and resets the LED color. Called by the controller loading. *(internal)* | 820 |
| `controller_esc.initSecondStage()` | Builds the wheel caches, identifies the front/rear left/right wheels by geometry, loads and sorts the configurations, computes wheelbase, mass distribution, characteristic speed, registers the radial menu entry and installs updateWheelsIntermediate and updateGFX. Called after the init of all controllers. *(internal)* | 828 |
| `controller_esc.nextESCMode()` | Switches to the next configuration, without wrapping (stays on the last). | 715 |
| `controller_esc.previousESCMode()` | Switches to the previous configuration, without wrapping (stays on the first). | 720 |
| `controller_esc.serialize()` | Returns the state to save: the current configuration index. | 1058 |
| `controller_esc.setESCMode(key, silent)` | Activates the configuration at index key (falls back to 1 if key exceeds the number of configurations), recomputes the precomputed values and shows a UI message unless silent. Does nothing if the vehicle has no ESC or lost a wheel. | 684 |
| `controller_esc.setState(data)` | Applies a state returned by getState if the index is a valid integer and differs from the current one (no message). | 1075 |
| `controller_esc.startESCCalibration()` | Resets the calibration counters and results then enables the cornering stiffness computation at every step (to be used with doMeasure/doSettle). | 603 |
| `controller_esc.stopESCCalibration()` | Disables the calibration computation. | 617 |
| `controller_esc.toggleESCMode()` | Switches to the next ESC configuration; after the last, returns to the first. Called by the interface button. | 709 |
| `controller_esc.updateGFX(dt)` | Blinks the esc/tcs lights (0.15 s period when active), writes electrics.values.esc/tcs/escActive/tcsActive and fills debugData. Dynamically defined by initSecondStage. (dynamically assigned) *(internal)* | dyn |
| `controller_esc.updateSimpleControlButtons()` | Forces the (re)creation of the "ESC & TC" button in the powertrain simplified control panel (ui_simplePowertrainControl), with the color of the current configuration. | 147 |
| `controller_esc.updateWheelsIntermediate(dt)` | ESC + TCS + decision loop at every physics step (see the module notes). Dynamically defined by initSecondStage. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_esc.deserialize(data)`

Restores the configuration from serialize().

- `data` (*table|nil*) : Table returned by serialize.

#### `controller_esc.getCarData()`

Returns the computed vehicle geometry, or nil if the mass is zero.

- **returns**: table|nil {wheels, frontLeftWheelId, frontRightWheelId, rearLeftWheelId, rearRightWheelId, wheelBase (m), trackWidth (m), distanceCOGRearAxle (m), distanceCOGFrontAxle (m), mass (kg)}

#### `controller_esc.getCurrentConfigData()`

Returns the table of the current ESC configuration (sanitized fields, with name).

- **returns**: table|nil Current configuration; nil if no ESC.

#### `controller_esc.getState()`

Returns the state table (key "<controllerName>ConfigKey" = current index) for saving/synchronizing the vehicle.

- **returns**: table Shared state table (reused).

#### `controller_esc.init(jbeamData)`

Stores the jbeam data, creates the state table for saving and resets the LED color. Called by the controller loading.

- `jbeamData` (*table*) : Controller data in the jbeam (see notes).

#### `controller_esc.serialize()`

Returns the state to save: the current configuration index.

- **returns**: table {escConfigKey = integer}

#### `controller_esc.setESCMode(key, silent)`

Activates the configuration at index key (falls back to 1 if key exceeds the number of configurations), recomputes the precomputed values and shows a UI message unless silent. Does nothing if the vehicle has no ESC or lost a wheel.

- `key` (*integer*) : Index 1..n in the configuration list sorted by order.
- `silent` (*boolean|nil*) : If true, no guihooks message.

#### `controller_esc.setState(data)`

Applies a state returned by getState if the index is a valid integer and differs from the current one (no message).

- `data` (*table|nil*) : State table.

#### `controller_esc.updateGFX(dt)`

Blinks the esc/tcs lights (0.15 s period when active), writes electrics.values.esc/tcs/escActive/tcsActive and fills debugData. Dynamically defined by initSecondStage. (dynamically assigned)

- `dt` (*number*) : Graphics time step in seconds.

#### `controller_esc.updateWheelsIntermediate(dt)`

ESC + TCS + decision loop at every physics step (see the module notes). Dynamically defined by initSecondStage. (dynamically assigned)

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `calibrationMeasurementReady` | boolean | True when the calibration stiffness measurement is finished. |
| `calibrationSettled` | boolean | True when the calibration settling phase is finished. |
| `debugData` | table | Data for the debug app: debugData.esc (steeringAngle, yawRate, desiredYawRate, difference, desiredYawRateAcceleration, desiredYawRateSteering, speed) and debugData.tcs (wheelBrakeFactors, wheelSlips, slipThreshold, throttleFactors, allWheelSlips). Only yawRate, desiredYawRate, difference and the tcs fields are updated; steeringAngle, desiredYawRateAcceleration/Steering and speed stay at 0. |
| `defaultOrder` | number | Default execution order of the controller (50). |
| `doMeasure` | boolean | Set to true to start the calibration measurement phase (3500 steps); returns to false at the end. |
| `doSettle` | boolean | Set to true to start the calibration settling phase (1500 steps); returns to false at the end. |
| `isExisting` | boolean | Always true: serves as a marker indicating that an ESC exists. |
| `pauseESCAction` | boolean | If true, the ESC no longer brakes and the TCS is treated as disabled. Reset to false at initSecondStage. |
| `stiffnessFront` | number | Average cornering stiffness of the front axle estimated by the calibration. |
| `stiffnessRear` | number | Average cornering stiffness of the rear axle estimated by the calibration. |
| `type` | string | Always "auxiliary". |
| `wheelAngleFront` | number | Actual steering angle of the front wheels (rad), updated every step. |
| `wheelAngleRear` | number | Actual steering angle of the rear wheels (rad), updated every step. |

## Calls into the engine (C++)

- `obj:` `calcBeamStats`, `getDirectionVector`, `getVelocity`, `getYawAngularVelocity`, `nodeLength`, `nodeVecPlanarCosRightForward`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/esc.lua`.*
