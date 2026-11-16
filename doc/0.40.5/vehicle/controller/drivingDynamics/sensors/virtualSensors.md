# `controller_drivingDynamics_sensors_virtualSensors`

*File: `lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua` · VM: Vehicle · 701 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/sensors/virtualSensors` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Virtual sensors of the drivingDynamics system (type "auxiliary", defaultOrder 56): estimates the vehicle's true speed (virtual.speed), the body slip angle (bodySlipAngle) and the reference wheel speed, without a ground speed sensor. It integrates the acceleration measured at the center of gravity position, corrects it with reset criteria (standstill, coasting, straight line, wheel acceleration consistency) and publishes confidence indices (trustWorthiness). The supervisors (yawControl, tractionControl) and the slip providers read cmu.virtualSensors.virtual and .trustWorthiness.

## Notes

- Units: speeds in m/s, angles in rad, accelerations in m/s², rates of change in rad/s. virtual.speed is signed (negative in reverse).
- The longitudinal/lateral acceleration and the yaw rate are computed by differences of the center of gravity position, sampled at 250 Hz; an acceleration > 200 m/s² (~20 g) is treated as a teleport and ignored.
- trustWorthiness: pitch, roll, bodySlipAngle, wheelSpeed, virtualSpeed (0 to 1), recoverySpeed (0 to 1), needsFullReset (boolean). A degradation (body slip angle drift, accelerations > 20/30/40 m/s² depending on the axis, angular velocities > 5 rad/s, acceleration noise, difference between virtual speed and recovery speed > 1 m/s) sets needsFullReset to true, confidence to 0 and calls CMU.systemDegradationDetected; a reset is resolved when the vehicle is stopped, coasting or going straight with consistent wheels (probabilities >= 0.99).
- The reset probabilities are fractions of true conditions (low accelerations, low pitch/roll, low angular velocities, pedals, zero steering...) smoothed over time.
- virtual.recoveryWheelSpeed is the average of the wheel speeds (corrected for the turning radius) whose acceleration matches the smoothed IMU acceleration; virtual.wheelSpeed is the average of the non-driven wheels (otherwise of all wheels).
- Bug/inconsistency: virtual.avgWheelSpeed and virtual.avgNonPropulsedWheelSpeed are declared and sent to debug but never updated (stay at 0); updateWheelSpeed computes local averages without storing them. M.reference is only filled in debug mode (reference speed and body slip angle from sensorHub.vX/vY).
- The refNodeCoGTransformation* variables are initialized but no longer used (leftovers from an older method).
- The order in updateTrustWorthiness means trustWorthiness.virtualSpeed is computed with the bodySlipAngle confidence from the previous step (inferred from code).
- reset(jbeamData) resets the whole estimation state; init resets a subset and sets isActive.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_sensors_virtualSensors.init(jbeamData)` | Resets the estimates and confidences, clears the caches and sets isActive to true. *(internal)* | 617 |
| `controller_drivingDynamics_sensors_virtualSensors.initLastStage()` | Computes the center of gravity offset relative to the reference node, needed to derive the acceleration from the position. *(internal)* | 648 |
| `controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu)` | Stores the reference to the CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket). *(internal)* | 676 |
| `controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData)` | Resets the whole estimation state (speed, slip, smoothers, probabilities, position sampling). *(internal)* | 560 |
| `controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled)` | Enables/disables debug packets and the computation of reference values. | 669 |
| `controller_drivingDynamics_sensors_virtualSensors.shutdown()` | Disables the sensor (isActive=false, updateGFX, update and updateWheelsIntermediate set to nil). | 680 |
| `controller_drivingDynamics_sensors_virtualSensors.update(dt)` | Physics step: integrates the acceleration for virtual.speed and updates the body slip angle (low speed from front wheel geometry, high speed by integration, blended between 4 and 5 m/s). *(internal)* | 488 |
| `controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt)` | Fixed step: updates wheel speed, recovery speed and confidence indices / reset conditions. *(internal)* | 420 |
| `controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt)` | Empty in normal mode; sends a rich debug packet in debug mode. *(internal)* | 513 |

### Parameter details

#### `controller_drivingDynamics_sensors_virtualSensors.init(jbeamData)`

Resets the estimates and confidences, clears the caches and sets isActive to true.

- `jbeamData` (*table*) : jbeam data (unused).

#### `controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu)`

Stores the reference to the CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket).

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData)`

Resets the whole estimation state (speed, slip, smoothers, probabilities, position sampling).

- `jbeamData` (*table*) : jbeam data (unused).

#### `controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled)`

Enables/disables debug packets and the computation of reference values.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_sensors_virtualSensors.update(dt)`

Physics step: integrates the acceleration for virtual.speed and updates the body slip angle (low speed from front wheel geometry, high speed by integration, blended between 4 and 5 m/s).

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt)`

Fixed step: updates wheel speed, recovery speed and confidence indices / reset conditions.

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt)`

Empty in normal mode; sends a rich debug packet in debug mode.

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (56). |
| `isActive` | boolean | True after init, false after shutdown. |
| `reference` | table | Reference values computed only in debug mode: bodySlipAngle (rad) and speed (m/s) from the physics engine's speed sensor. |
| `trustWorthiness` | table | Confidence indices 0..1: pitch, roll, jerk (never modified, stays 1), bodySlipAngle, wheelSpeed, virtualSpeed, recoverySpeed; needsFullReset (boolean). |
| `type` | string | "auxiliary". |
| `virtual` | table | Estimates: speed, integratedSpeed, avgWheelSpeed (never updated), avgNonPropulsedWheelSpeed (never updated), wheelSpeed, imuAcceleration, recoveryWheelSpeed, recoveryWheelCount, bodySlipAngle, bodySlipAngleIntegrated, bodySlipAngleLowSpeed, bodySlipAngleLowSpeedTrust, lastBodySlipAngle, bodySlipAngleRate. |

## Calls into the engine (C++)

- `obj:` `getDirectionVectorUpXYZ`, `getDirectionVectorXYZ`, `getPositionXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua`.*
