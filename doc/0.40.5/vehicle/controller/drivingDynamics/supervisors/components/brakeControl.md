# `controller_drivingDynamics_supervisors_components_brakeControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua` · VM: Vehicle · 622 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/components/brakeControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Braking component of the drivingDynamics system (type "auxiliary", defaultOrder 70). It acts as traction control (order 30), yaw control (order 50) and ABS (order 50) by braking individual wheels. The traction and yaw braking is added every step to wheel.desiredBrakingTorque in updateWheelsIntermediate; the ABS replaces each wheel's brake torque computation functions (wheels.setWheelBrakeUpdate). Each role is handled by parallel PID regulators configurable in the jbeam or via setParameters.

## Notes

- Top-level jbeam keys: useForTractionControl, useForYawControl, useForABSControl (booleans, true by default); tractionControl (table, required to enable the TC role) with wheelGroupSettings (header table: motorName, slipThreshold (0.2), slipRangeThreshold (0), maxVelocity (1, m/s), kP/kI/kD (0), integralInCoef (20), integralOutCoef (2)); yawControl (table, required to enable the YC role) with PIDSettings (header table: type = yawAV|slipAngle|frontAxleSlipAngle, kP, kI, kD, integralInCoef, integralOutCoef), yawAVThreshold (0.4), slipAngleThreshold (0.1), frontAxleSlipAngleThreshold (0.2); absControl.wheelSettings (header table: wheelName, absFrequency (100 Hz), slipThreshold (0.2), kP (5), kI (0.5), kD (0.1), integralInCoef (20), integralOutCoef (20), minSteeringCoef (0.3), steeringCoefYawRate (0.2)).
- Potential bug: initSecondStage reads jbeamData.absControl.wheelSettings as soon as the absControl supervisor exists and useForABSControl is true, without checking that jbeamData.absControl is defined (Lua error if absent).
- Yaw control: three PIDs (yaw error, body slip angle, combined front/rear slip angle); the strongest picks the wheel to brake: oversteer -> outer front wheel, understeer -> inner rear wheel; the factor is reduced at low wheel speed (anti-lock, 2..5 rad/s).
- Traction control: one PID per wheel on the slip, weighted by the speed (zeroed above maxVelocity+1 m/s) and by the group's slip range; the final brake factor per wheel is min(TC + YC, 1) * wheel.brakeTorque, applied with max().
- ABS: every absTime period (1/absFrequency) a PID computes a braking coefficient absCoef based on the slip, reduced at high yaw (steeringCoef); without speed > 2 m/s the ABS is inactive (absCoef = 1). The left/right/center torque limits (absBrakeTorqueLimits) prevent a wheel from braking much harder than the opposite wheel.
- electrics.values.isYCBrakeActive, isTCBrakeActive, isABSBrakeActive (0/1) are written every frame; isABSBrakeActive is always 0 ("TODO fix whatever this is" comment in the code).
- setParameters accepts many keys: tractionControl.isEnabled, tractionControl.wheelGroupSettings.<motor>.(slipThreshold|slipRangeThreshold|maxVelocity), tractionControl.wheelBrakingPID.<wheel>.(kP|kI|kD|integralInCoef|integralOutCoef), yawControl.(isEnabled|slipAngleThreshold|yawAvThreshold|frontAxleSlipAngleThreshold), absControl.wheelSettings.<wheel>.(kP|kI|kD|integralInCoef|integralOutCoef|slipThreshold|absFrequency|minSteeringCoef|steeringCoefYawRate). The yaw PID parameters (PIDSettings) are read but not modifiable via setParameters (they are only applied by setConfig).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt)` | Called by the absControl supervisor for each wheel: periodically updates the ABS coefficient (absCoef) via a PID on the slip. *(internal)* | 213 |
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt)` | Called by tractionControl for each wheel group: computes each wheel's braking factor from its slip. *(internal)* | 69 |
| `controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Called by yawControl: picks the wheel to brake according to the dominant PID (yaw error, body slip angle, front slip) and sets its brake factor. *(internal)* | 106 |
| `controller_drivingDynamics_supervisors_components_brakeControl.getConfig()` | Returns a copy of the configuration. | 591 |
| `controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData)` | Resets the action flags to false. *(internal)* | 330 |
| `controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData)` | Stores the number of wheels. *(internal)* | 533 |
| `controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData)` | Reads the configuration, creates the PIDs and registers with tractionControl, yawControl and absControl depending on their presence; installs the ABS brake functions on the wheels. *(internal)* | 373 |
| `controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 299 |
| `controller_drivingDynamics_supervisors_components_brakeControl.reset()` | Resets flags and PIDs and reinstalls the ABS brake functions. *(internal)* | 309 |
| `controller_drivingDynamics_supervisors_components_brakeControl.sendConfigData()` | Sends the configuration to the CMU. | 595 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable)` | Replaces the entire configuration and reconfigures the PIDs. | 586 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 293 |
| `controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters)` | Applies parameters (see notes) then reconfigures the PIDs. | 546 |
| `controller_drivingDynamics_supervisors_components_brakeControl.shutdown()` | Disables the component. | 537 |
| `controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt)` | Writes electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive then resets them to zero (debug version: also sends a detailed packet). *(internal)* | 245 |
| `controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt)` | Every step: adds the TC/YC brake of each controlled wheel to wheel.desiredBrakingTorque and rotates the ABS torque limits. *(internal)* | 51 |

### Parameter details

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt)`

Called by the absControl supervisor for each wheel: periodically updates the ABS coefficient (absCoef) via a PID on the slip.

- `wheelData` (*table*) : Wheel data {wheelName, slip}.
- `brake` (*number*) : Brake input 0..1.
- `vehicleVelocity` (*number*) : Vehicle speed (m/s).
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if the ABS reduces braking (absCoef < 0.9).

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt)`

Called by tractionControl for each wheel group: computes each wheel's braking factor from its slip.

- `wheelGroup` (*table*) : Wheel group {name, wheels, wheelCount, slipRange...}.
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if a traction control brake is requested.

#### `controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Called by yawControl: picks the wheel to brake according to the dominant PID (yaw error, body slip angle, front slip) and sets its brake factor.

- `measuredYaw` (*number*) : Measured yaw (rad/s).
- `expectedYaw` (*number*) : Expected yaw, unused.
- `yawDifference` (*number*) : Yaw error (positive = oversteer).
- `bodySlipAngle` (*number*) : Adjusted body slip angle (rad).
- `frontSlipAngle` (*number*) : Front axle slip angle (rad).
- `rearSlipAngle` (*number*) : Rear axle slip angle (rad).
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if a wheel is braked by the yaw control.

#### `controller_drivingDynamics_supervisors_components_brakeControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of the configuration.

#### `controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData)`

Resets the action flags to false.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData)`

Stores the number of wheels.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData)`

Reads the configuration, creates the PIDs and registers with tractionControl, yawControl and absControl depending on their presence; installs the ABS brake functions on the wheels.

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable)`

Replaces the entire configuration and reconfigures the PIDs.

- `configTable` (*table*) : Table {tractionControl, yawControl, absControl}.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters)`

Applies parameters (see notes) then reconfigures the PIDs.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt)`

Writes electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive then resets them to zero (debug version: also sends a detailed packet).

- `dt` (*number*) : Graphics time step (s).

#### `controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt)`

Every step: adds the TC/YC brake of each controlled wheel to wheel.desiredBrakingTorque and rotates the ABS torque limits.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `componentOrderABSControl` | number | 50. |
| `componentOrderTractionControl` | number | 30. |
| `componentOrderYawControl` | number | 50. |
| `defaultOrder` | number | Default execution order (70). |
| `isActingAsABS` | boolean | True when the ABS limits the braking. |
| `isActingAsTC` | boolean | True when a traction control brake is active. |
| `isActingAsYC` | boolean | True when a yaw control brake is active. |
| `isActive` | boolean | True after initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua`.*
