# `controller_drivingDynamics_supervisors_components_aeroControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua` · VM: Vehicle · 167 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/components/aeroControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Yaw control component (type "auxiliary", defaultOrder 70) for active aerodynamics. It registers with the yawControl supervisor (order 30); when the vehicle oversteers (body slip angle of opposite sign to the yaw and above a threshold), it writes electrics.values.yawControlRequestReduceOversteer (1 or 0), which the vehicle's aero elements (wings, flaps) can read to reduce oversteer. Not used for traction control or ABS.

## Notes

- jbeam key: slipAngleThreshold (default 0.2 rad) = body slip threshold beyond which aero is requested.
- Modifiable parameters (setParameters): yawControl, yawControl.isEnabled, yawControl.slipAngleThreshold.
- The electrics.values.yawControlRequestReduceOversteer flag is smoothed (temporalSmoothing 1 / 1000, slow 1 s rise, almost immediate fall) then reduced to its sign (0 or 1): it stays at 1 during the smoother's rise even after the request ends.
- actAsTractionControl is replaced by nop at initSecondStage; actAsABSControl is nop. componentOrderTractionControl and componentOrderABSControl are 1000 (unused).
- The component only registers with yawControl if that supervisor exists (CMU.getSupervisor("yawControl")).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt)` | Called by tractionControl; does nothing (returns false, replaced by nop at init). *(internal)* | 34 |
| `controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Called by yawControl at every fixed step: detects oversteer via the body slip angle and updates electrics.values.yawControlRequestReduceOversteer. *(internal)* | 41 |
| `controller_drivingDynamics_supervisors_components_aeroControl.getConfig()` | Returns a copy of the configuration. | 137 |
| `controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData)` | Resets the action flags to false. *(internal)* | 90 |
| `controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData)` | Does nothing. *(internal)* | 112 |
| `controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData)` | Registers with yawControl, reads slipAngleThreshold and sets isActive to true. *(internal)* | 96 |
| `controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 76 |
| `controller_drivingDynamics_supervisors_components_aeroControl.reset()` | Resets the flags and the smoother. *(internal)* | 83 |
| `controller_drivingDynamics_supervisors_components_aeroControl.sendConfigData()` | Sends the configuration to the CMU (debug packet). | 141 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable)` | Replaces the entire configuration. | 132 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 70 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters)` | Applies parameters (see notes) via CMU.applyParameter. | 124 |
| `controller_drivingDynamics_supervisors_components_aeroControl.shutdown()` | Disables the component. | 115 |
| `controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt)` | Empty (debug version: sends a state packet to the CMU). *(internal)* | 57 |

### Parameter details

#### `controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt)`

Called by tractionControl; does nothing (returns false, replaced by nop at init).

- `wheelGroup` (*table*) : Wheel group.
- `dt` (*number*) : Time step (s).
- **returns**: boolean false.

#### `controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Called by yawControl at every fixed step: detects oversteer via the body slip angle and updates electrics.values.yawControlRequestReduceOversteer.

- `measuredYaw` (*number*) : Measured yaw (rad/s).
- `expectedYaw` (*number*) : Expected yaw (rad/s), unused.
- `yawDifference` (*number*) : Yaw error, unused.
- `bodySlipAngle` (*number*) : Adjusted body slip angle (rad).
- `frontSlipAngle` (*number*) : Front slip angle (rad), unused.
- `rearSlipAngle` (*number*) : Rear slip angle (rad), unused.
- `dt` (*number*) : Time step (s).
- **returns**: boolean True if oversteer reduction is requested.

#### `controller_drivingDynamics_supervisors_components_aeroControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of the configuration.

#### `controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData)`

Resets the action flags to false.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData)`

Registers with yawControl, reads slipAngleThreshold and sets isActive to true.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable)`

Replaces the entire configuration.

- `configTable` (*table*) : Table {yawControl = {isEnabled, slipAngleThreshold}}.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters)`

Applies parameters (see notes) via CMU.applyParameter.

- `parameters` (*table<string, any>*) : E.g. {["yawControl.slipAngleThreshold"] = 0.3}.

#### `controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt)`

Empty (debug version: sends a state packet to the CMU).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000: never used as ABS. |
| `componentOrderTractionControl` | number | 1000: never used as traction control. |
| `componentOrderYawControl` | number | 30: call order by yawControl. |
| `defaultOrder` | number | Default execution order (70). |
| `isActingAsABS` | boolean | Always false. |
| `isActingAsTC` | boolean | Always false. |
| `isActingAsYC` | boolean | True when oversteer reduction is requested. |
| `isActive` | boolean | True after initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua`.*
