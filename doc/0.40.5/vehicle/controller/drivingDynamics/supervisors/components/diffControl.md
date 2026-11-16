# `controller_drivingDynamics_supervisors_components_diffControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua` · VM: Vehicle · 301 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/components/diffControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Yaw control component acting on electronically controlled front/rear differentials (type "auxiliary", defaultOrder 70). It registers with tractionControl (order 20, no action) and yawControl (order 10). When the vehicle oversteers under acceleration, it sets overrideMin/overrideMax of the differential controllers (activeDiffLock or electronicDiffLock) to lock or open the differential according to the body slip angle.

## Notes

- jbeam keys: frontDiffName (default "lockFront") and rearDiffName (default "lockRear") = differential controller names; slip angle thresholds (rad) openFrontDiffOversteerThresholdMin/Max (0/0), openRearDiffOversteerThresholdMin/Max (0/0.1), lockableFrontDiffOversteerThresholdMin/Max (0/0.2), lockableRearDiffOversteerThresholdMin/Max (0/0.2).
- The differential controller type (typeName field) determines the method: "drivingDynamics/actuators/activeDiffLock" (lockable differential) or "drivingDynamics/actuators/electronicDiffLock" (open differential). Any other type = nop. If neither differential exists, the component neutralizes itself (actAs... = nop).
- actAsYawControl always returns false so as not to trigger the ESC light; the real state is in isActingAsYC. It only reacts if electrics.values.throttle > 0.
- The internal functions yawControlBiasFrontDiff/yawControlBiasRearDiff are defined but never used.
- The open front differential has no effect (max override set to 1, "TODO" in the code).
- The tractionControl.isEnabled parameters are declared in controlParameters but setParameters does not process them (only the yawControl branch is applied).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt)` | Called by tractionControl; does nothing and returns false. *(internal)* | 52 |
| `controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Called by yawControl: resets the overrides to zero then, in case of oversteer under acceleration, applies the front/rear control methods. *(internal)* | 126 |
| `controller_drivingDynamics_supervisors_components_diffControl.getConfig()` | Returns a copy of the configuration. | 271 |
| `controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData)` | Resets the flags to false. *(internal)* | 178 |
| `controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData)` | Does nothing. *(internal)* | 235 |
| `controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData)` | Looks for the differential controllers, registers with the supervisors and reads the thresholds. *(internal)* | 184 |
| `controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 165 |
| `controller_drivingDynamics_supervisors_components_diffControl.reset()` | Resets the flags to false. *(internal)* | 172 |
| `controller_drivingDynamics_supervisors_components_diffControl.sendConfigData()` | Sends the configuration to the CMU (debug packet). | 275 |
| `controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable)` | Replaces the entire configuration. | 266 |
| `controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 159 |
| `controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters)` | Applies the yawControl.* parameters (isEnabled and the eight thresholds) via CMU.applyParameter. | 247 |
| `controller_drivingDynamics_supervisors_components_diffControl.shutdown()` | Disables the component. | 238 |
| `controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt)` | Empty (debug version: sends a state packet). *(internal)* | 147 |

### Parameter details

#### `controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt)`

Called by tractionControl; does nothing and returns false.

- `wheelGroup` (*table*) : Wheel group.
- `dt` (*number*) : Time step (s).
- **returns**: boolean false.

#### `controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Called by yawControl: resets the overrides to zero then, in case of oversteer under acceleration, applies the front/rear control methods.

- `measuredYaw` (*number*) : Measured yaw (rad/s).
- `expectedYaw` (*number*) : Expected yaw.
- `yawDifference` (*number*) : Yaw error.
- `bodySlipAngle` (*number*) : Adjusted body slip angle (rad).
- `frontSlipAngle` (*number*) : Not used.
- `rearSlipAngle` (*number*) : Not used.
- `dt` (*number*) : Time step (s).
- **returns**: boolean Always false (see notes).

#### `controller_drivingDynamics_supervisors_components_diffControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of the configuration.

#### `controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData)`

Resets the flags to false.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData)`

Looks for the differential controllers, registers with the supervisors and reads the thresholds.

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable)`

Replaces the entire configuration.

- `configTable` (*table*) : Table {tractionControl, yawControl}.

#### `controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters)`

Applies the yawControl.* parameters (isEnabled and the eight thresholds) via CMU.applyParameter.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt)`

Empty (debug version: sends a state packet).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000: unused. |
| `componentOrderTractionControl` | number | 20. |
| `componentOrderYawControl` | number | 10. |
| `defaultOrder` | number | Default execution order (70). |
| `isActingAsABS` | boolean | Always false. |
| `isActingAsTC` | boolean | Always false. |
| `isActingAsYC` | boolean | True when a differential is currently forced. |
| `isActive` | boolean | True after initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua`.*
