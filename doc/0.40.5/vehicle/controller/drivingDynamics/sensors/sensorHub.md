# `controller_drivingDynamics_sensors_sensorHub`

*File: `lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua` · VM: Vehicle · 211 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/sensors/sensorHub` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Central sensor of the Driving Dynamics Suite: at each physics step it reads the angular velocities (roll, pitch, yaw), the attitude (roll, pitch), the X/Y/Z accelerations (via `sensors.ffiSensors`) and the driver inputs, and computes smoothed versions as well as an acceleration "noise" (difference between high and low envelopes, limited to 150). The other controllers in `drivingDynamics/` (supervisors, actuators, CMU) read these fields, accessible via `CMU.sensorHub` or `CMU.getSensor("sensorHub")`. Call order: `defaultOrder = 52`.

## Notes

- Units: accelerations in m/s² (vehicle frame: X forward, Y sideways, Z vertical non-inertial with gravity included), angular velocities in rad/s, roll/pitch angles in radians, `gravity` in m/s².
- Fields also written but not listed below: `throttleInput`, `brakeInput` (electrics throttle and brake); in debug mode only: `worldVelocity`, `directionVector`, `directionVectorUp`, `directionVectorLeft`.
- Bug: `yawAcceleration` = (yawAV - lastYawAV) / dt, but `lastYawAV` is never updated after init (stays 0), so the value is yawAV / dt, not a true acceleration.
- `vX` and `vY` (longitudinal and lateral speed) are only computed in the debug variant (`updateDebug`), otherwise they stay at 0.
- `shutdown` sets `isActive` to false and `update`/`updateGFX` to nil (the manager must call cacheAllControllerFunctions again to remove them).
- No jbeam key is read.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_sensors_sensorHub.init(jbeamData)` | Reads the gravity, marks the sensor as active. *(internal)* | 172 |
| `controller_drivingDynamics_sensors_sensorHub.initLastStage()` | Empty. *(internal)* | 178 |
| `controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu)` | Called by the CMU during its initSecondStage to give it a reference to itself (used for debugging). *(internal)* | 188 |
| `controller_drivingDynamics_sensors_sensorHub.reset()` | Resets all smoothers. *(internal)* | 155 |
| `controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled)` | Switches between the normal and debug variants of update/updateGFX. *(internal)* | 181 |
| `controller_drivingDynamics_sensors_sensorHub.shutdown()` | Stops the sensor: isActive = false and update functions removed. *(internal)* | 192 |
| `controller_drivingDynamics_sensors_sensorHub.update(dt)` | Physics step: reads and smooths angular velocities, attitude, accelerations and noise. Replaced by updateDebug in debug mode. *(internal)* | 71 |
| `controller_drivingDynamics_sensors_sensorHub.updateGFX(dt)` | Every frame: updates the gravity. In debug mode, also sends the debug packet to the CMU. *(internal)* | 144 |

### Parameter details

#### `controller_drivingDynamics_sensors_sensorHub.init(jbeamData)`

Reads the gravity, marks the sensor as active.

- `jbeamData` (*table*) : Jbeam data (unused).

#### `controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu)`

Called by the CMU during its initSecondStage to give it a reference to itself (used for debugging).

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled)`

Switches between the normal and debug variants of update/updateGFX.

- `debugEnabled` (*boolean*) : true to fill and send the debug packet.

#### `controller_drivingDynamics_sensors_sensorHub.update(dt)`

Physics step: reads and smooths angular velocities, attitude, accelerations and noise. Replaced by updateDebug in debug mode.

- `dt` (*number*) : Physics step in seconds.

#### `controller_drivingDynamics_sensors_sensorHub.updateGFX(dt)`

Every frame: updates the gravity. In debug mode, also sends the debug packet to the CMU.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `accNoiseX` | number | X acceleration noise level (0 to 150). |
| `accNoiseY` | number | Y acceleration noise level (0 to 150). |
| `accNoiseZ` | number | Z acceleration noise level (after removing gravity, 0 to 150). |
| `accelerationX` | number | Raw longitudinal acceleration (m/s²). |
| `accelerationXSmooth` | number | Smoothed accelerationX. |
| `accelerationY` | number | Raw lateral acceleration (m/s²). |
| `accelerationYSmooth` | number | Smoothed accelerationY. |
| `accelerationZ` | number | Raw non-inertial vertical acceleration (m/s²). |
| `accelerationZSmooth` | number | Smoothed accelerationZ. |
| `defaultOrder` | number | 52. |
| `gravity` | number | World gravity (`obj:getGravity()`), updated every GFX frame. |
| `isActive` | boolean | true after init, false after shutdown. |
| `pitch` | number | Pitch angle in rad. |
| `pitchAV` | number | Pitch angular velocity in rad/s. |
| `pitchAVSmooth` | number | Smoothed pitchAV. |
| `roll` | number | Roll angle in rad. |
| `rollAV` | number | Roll angular velocity in rad/s. |
| `rollAVSmooth` | number | Smoothed rollAV. |
| `steeringInput` | number | Value of `electrics.values.steering_input`. |
| `type` | string | "auxiliary". |
| `vX` | number | Longitudinal speed in m/s (computed only in debug mode). |
| `vY` | number | Lateral speed in m/s (computed only in debug mode). |
| `yawAV` | number | Yaw angular velocity in rad/s. |
| `yawAVSmooth` | number | Smoothed yawAV. |
| `yawAcceleration` | number | See the note: in practice equals yawAV / dt. |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getGravity`, `getRollPitchYawAngularVelocity`, `getRollPitchYawRad`, `getVelocity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua`.*
