# `controller_drivingDynamics_supervisors_components_motorTorqueControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua` · VM: Vehicle · 379 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/components/motorTorqueControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Component of the drivingDynamics system that reduces engine torque via device.throttleFactor, for traction control (order 40) and yaw control (order 40). For each motor concerned, the final factor is min(traction control factor, yaw factor), recomputed at every fixed step. Traction control uses a PID on the maximum slip of the motor's wheel group; yaw uses three PIDs (yaw error, body slip, front slip). Cannot be used for ABS.

## Notes

- jbeam keys: useForTractionControl, useForYawControl (true by default); tractionControl.wheelGroupSettings (header table: motorName, kP, kI, kD (0), integralInCoef (20), integralOutCoef (2), slipThreshold (0.2), minimumThrottleLimit (0)); yawControl.PIDSettings (header table: type yawAV | slipAngle | frontAxleSlipAngle, kP, kI, kD, integralInCoef, integralOutCoef; default yawAV {2,0.5,0,100,10} and slipAngle {2,1,0,10,1}), yawControl.yawAVThreshold (0.4), yawControl.slipAngleThreshold (0.1), yawControl.frontAxleSlipAngleThreshold (0.1), yawControl.minimumThrottleLimit (0), yawControlledMotors (list of motor names).
- The roles are only active if the corresponding supervisor exists AND the corresponding jbeam table (tractionControl / yawControl) is present.
- The traction control factor is smoothed (temporalSmoothing 5/5) and bounded by minimumThrottleLimit; the yaw factor is bounded by yawControl.minimumThrottleLimit. M.isActingAsTC / isActingAsYC are true when the factor is < 1.
- setParameters handles: tractionControl.isEnabled, tractionControl.wheelGroupSettings.<motor>.(kP|kI|kD|integralInCoef|integralOutCoef|slipThreshold|minimumThrottleLimit), yawControl.isEnabled, yawControl.yawAvThreshold, yawControl.slipAngleThreshold. The yaw PIDs are not reconfigured by setParameters/applyControlParameters (only traction control is); yawControl.frontAxleSlipAngleThreshold is not modifiable.
- Inconsistency: if the yawControl role is active but not tractionControl (or vice versa), controlParameters.yawControl/tractionControl may be nil, and actAsTractionControl/actAsYawControl read controlParameters.<role>.isEnabled without a guard; these functions are however only called if the component registered for that role.
- The motor's throttleFactor can also be modified by other controllers (esc.lua goes through electrics, not through this field); here it is overwritten at every step.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt)` | Called by tractionControl: computes the torque factor of a wheel group's motor from the group's maximum slip. *(internal)* | 54 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Called by yawControl: computes a torque factor common to all controlled motors from the yaw error, the body slip angle (oversteer only) and the front slip. *(internal)* | 80 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig()` | Returns a copy of the configuration. | 348 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData)` | Sets isActive to true and resets the flags to false. *(internal)* | 173 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData)` | Does nothing. *(internal)* | 308 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData)` | Reads the configuration, creates the PIDs, lists the controlled motors and registers with the supervisors. *(internal)* | 190 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 147 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.reset()` | Resets the flags and the PIDs to zero. *(internal)* | 151 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.sendConfigData()` | Sends the configuration to the CMU. | 352 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable)` | Replaces the entire configuration. | 343 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 141 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters)` | Applies parameters (see notes) then reconfigures the traction control PIDs. | 320 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.shutdown()` | Disables the component. | 311 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt)` | Applies throttleFactor = min(TC factor, YC factor) to each controlled motor. *(internal)* | 41 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt)` | Empty (debug version: sends a detailed packet). *(internal)* | 104 |

### Parameter details

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt)`

Called by tractionControl: computes the torque factor of a wheel group's motor from the group's maximum slip.

- `wheelGroup` (*table*) : Wheel group {motor, maxSlip...}.
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if the torque is reduced.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Called by yawControl: computes a torque factor common to all controlled motors from the yaw error, the body slip angle (oversteer only) and the front slip.

- `measuredYaw` (*number*) : Measured yaw (rad/s).
- `expectedYaw` (*number*) : Not used.
- `yawDifference` (*number*) : Yaw error.
- `bodySlipAngle` (*number*) : Adjusted body slip angle (rad).
- `frontSlipAngle` (*number*) : Front slip angle (rad).
- `rearSlipAngle` (*number*) : Not used.
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if the torque is reduced.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of the configuration.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData)`

Sets isActive to true and resets the flags to false.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData)`

Reads the configuration, creates the PIDs, lists the controlled motors and registers with the supervisors.

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable)`

Replaces the entire configuration.

- `configTable` (*table*) : Table {tractionControl, yawControl}.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters)`

Applies parameters (see notes) then reconfigures the traction control PIDs.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt)`

Applies throttleFactor = min(TC factor, YC factor) to each controlled motor.

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt)`

Empty (debug version: sends a detailed packet).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000: unused. |
| `componentOrderTractionControl` | number | 40. |
| `componentOrderYawControl` | number | 40. |
| `defaultOrder` | number | Default execution order (70). |
| `isActingAsABS` | boolean | Always false. |
| `isActingAsTC` | boolean | True when the torque is reduced for traction control. |
| `isActingAsYC` | boolean | True when the torque is reduced by the yaw control. |
| `isActive` | boolean | True after init. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua`.*
