# `controller_drivingDynamics_supervisors_components_awdControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua` · VM: Vehicle · 206 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/components/awdControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Yaw control component for electronically locking all-wheel-drive transmissions (type "auxiliary", defaultOrder 70). It registers with tractionControl (order 10, but does nothing there) and yawControl (order 20). Under acceleration, if it detects oversteer via the body slip angle, it sets overrideMin/overrideMax of the locking actuator (by default "electronicSplitShaftLock") to distribute torque between the front/rear axles according to the mode (rearMain, frontMain, centerDiff).

## Notes

- jbeam keys: awdActuatorName (default "electronicSplitShaftLock", name of a CMU actuator), controlMode ("rearMain" by default, "frontMain" or "centerDiff"; centerDiff reuses rearMain), slipAngleThreshold (default 0.2 rad).
- If the actuator is not found, actAsTractionControl and actAsYawControl are replaced by nop and the component registers nowhere.
- actAsYawControl always returns false on purpose, so that the ESC light does not turn on (too intrusive for AWD control); the real state is in isActingAsYC.
- rearMain mode: overrideMin rises from 0 to 1 as the corrected slip angle goes from 0 to slipAngleThreshold; frontMain mode: overrideMax falls from 1 to 0. Understeer detection is not implemented ("todo" comment in the code).
- Parameters modifiable via setParameters: tractionControl, tractionControl.isEnabled, yawControl, yawControl.isEnabled, yawControl.slipAngleThreshold, controlMode.
- The control only acts if electrics.values.throttle > 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt)` | Called by tractionControl; does nothing and returns false. *(internal)* | 35 |
| `controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Called by yawControl: resets then computes the overrideMin/overrideMax bounds of the locking actuator from the body slip angle (oversteer under acceleration only). *(internal)* | 54 |
| `controller_drivingDynamics_supervisors_components_awdControl.getConfig()` | Returns a copy of the configuration. | 176 |
| `controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData)` | Resets the flags to false. *(internal)* | 114 |
| `controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData)` | Does nothing. *(internal)* | 147 |
| `controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData)` | Looks for the AWD actuator, registers with the supervisors and reads controlMode and slipAngleThreshold. *(internal)* | 120 |
| `controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 94 |
| `controller_drivingDynamics_supervisors_components_awdControl.reset()` | Resets the flags to false. *(internal)* | 108 |
| `controller_drivingDynamics_supervisors_components_awdControl.sendConfigData()` | Sends the configuration to the CMU (debug packet). | 180 |
| `controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable)` | Replaces the entire configuration. | 171 |
| `controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 88 |
| `controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters)` | Applies parameters (see notes) and recomputes the control method according to controlMode. | 159 |
| `controller_drivingDynamics_supervisors_components_awdControl.shutdown()` | Disables the component. | 150 |
| `controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt)` | Empty (debug version: sends a state packet). *(internal)* | 75 |

### Parameter details

#### `controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt)`

Called by tractionControl; does nothing and returns false.

- `wheelGroup` (*table*) : Wheel group.
- `dt` (*number*) : Time step (s).
- **returns**: boolean false.

#### `controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Called by yawControl: resets then computes the overrideMin/overrideMax bounds of the locking actuator from the body slip angle (oversteer under acceleration only).

- `measuredYaw` (*number*) : Measured yaw (rad/s).
- `expectedYaw` (*number*) : Expected yaw, unused.
- `yawDifference` (*number*) : Yaw error, unused.
- `bodySlipAngle` (*number*) : Adjusted body slip angle (rad).
- `frontSlipAngle` (*number*) : Not used.
- `rearSlipAngle` (*number*) : Not used.
- `dt` (*number*) : Time step (s).
- **returns**: boolean Always false (see notes).

#### `controller_drivingDynamics_supervisors_components_awdControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of the configuration.

#### `controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData)`

Resets the flags to false.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData)`

Looks for the AWD actuator, registers with the supervisors and reads controlMode and slipAngleThreshold.

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable)`

Replaces the entire configuration.

- `configTable` (*table*) : Table {tractionControl, yawControl, controlMode}.

#### `controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters)`

Applies parameters (see notes) and recomputes the control method according to controlMode.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt)`

Empty (debug version: sends a state packet).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000: unused. |
| `componentOrderTractionControl` | number | 10. |
| `componentOrderYawControl` | number | 20. |
| `defaultOrder` | number | Default execution order (70). |
| `isActingAsABS` | boolean | Always false. |
| `isActingAsTC` | boolean | Always false. |
| `isActingAsYC` | boolean | True when a locking override is applied. |
| `isActive` | boolean | True after initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua`.*
