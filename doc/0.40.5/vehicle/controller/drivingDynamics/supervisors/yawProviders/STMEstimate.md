# `controller_drivingDynamics_supervisors_yawProviders_STMEstimate`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua` · VM: Vehicle · 131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/yawProviders/STMEstimate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Expected yaw provider (type "auxiliary", defaultOrder 80, providerOrder 20) for the yawControl supervisor. It estimates the yaw rate the driver is requesting using the bicycle model with cornering stiffness (front wheel angle, wheelbase, characteristic speed), limited by a maximum lateral acceleration. Registers via yawControl.registerYawProvider; if yawControl is absent, it disables itself.

## Notes

- jbeam key: maxLateralAcceleration (default 12 m/s²).
- Formula: min( |frontWheelAngle| / wheelbase * v / (1 + v² / vc²), maxLateralAcceleration / v ) with v = virtual speed if virtualSpeed is fully trusted (>= 1) otherwise wheel speed. The result is always positive (the sign is handled by yawControl).
- Inconsistency: yawControl calls yawProvider.calculateExpectedYaw(speed, dt), but the function is declared calculateExpectedYaw(dt): the dt parameter actually receives the speed. Harmless since it is not used.
- Modifiable parameters: isEnabled, maxLateralAcceleration. isEnabled is not checked in calculateExpectedYaw (the provider always answers).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt)` | Returns the expected yaw rate (rad/s, positive) from the front wheel angle and the speed; called by yawControl at every fixed step. *(internal)* | 25 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig()` | Returns a copy of the configuration. | 103 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData)` | Sets isActive to true. *(internal)* | 66 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData)` | Does nothing. *(internal)* | 85 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData)` | Registers with yawControl and reads maxLateralAcceleration. *(internal)* | 70 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 59 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.reset()` | Does nothing. *(internal)* | 63 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.sendConfigData()` | Sends the configuration to the CMU. | 107 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable)` | Replaces the configuration. | 99 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 53 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters)` | Applies isEnabled and maxLateralAcceleration. | 94 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.shutdown()` | Disables the provider. | 88 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt)` | Empty (debug version: sends isEnabled). *(internal)* | 42 |

### Parameter details

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt)`

Returns the expected yaw rate (rad/s, positive) from the front wheel angle and the speed; called by yawControl at every fixed step.

- `dt` (*number*) : Declared as dt but receives the speed (see notes); unused.
- **returns**: number Expected yaw in rad/s.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData)`

Sets isActive to true.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData)`

Registers with yawControl and reads maxLateralAcceleration.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable)`

Replaces the configuration.

- `configTable` (*table*) : Table {isEnabled, maxLateralAcceleration}.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters)`

Applies isEnabled and maxLateralAcceleration.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt)`

Empty (debug version: sends isEnabled).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (80). |
| `isActive` | boolean | True after init, false if yawControl is absent. |
| `providerOrder` | number | Priority among the yaw providers (20). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua`.*
