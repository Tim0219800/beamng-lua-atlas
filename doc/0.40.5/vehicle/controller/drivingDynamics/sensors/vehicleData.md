# `controller_drivingDynamics_sensors_vehicleData`

*File: `lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua` · VM: Vehicle · 370 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/sensors/vehicleData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

"Vehicle data" sensor of the drivingDynamics system (type "auxiliary", defaultOrder 54). It identifies the four corner wheels (front/rear, left/right) by their position, computes the vehicle geometry once (wheelbase, center-of-gravity-to-axle distances, track width, mass, characteristic speed, yaw inertia) then, at each step, the actual steering angles of the wheels and the wheel speed ratios due to the turning radius. The other drivingDynamics modules (yawControl, STMEstimate, virtualSensors, components) read these values via cmu.vehicleData.

## Notes

- jbeam keys read in initSecondStage: skewStiffnessFront, skewStiffnessRear (cornering stiffnesses, default 0), cornerWheels (list of wheel names, default {"FR","FL","RR","RL"}). If v.config.partConfigFilename exists, the file <vehiclePath>drivingDynamics/<configName>.stat.json is read and its vehicleData section (skewStiffnessFront, skewStiffnessRear, cornerWheelData) takes precedence.
- If exactly 4 corner wheels are not found, an error is logged and isActive stays false (the statistics are not computed).
- Wheel angles in rad: the front angles are multiplied by the sign of sensorHub.steeringInput (positive = steering left according to the ESC convention); the rear angles are not signed. turningCircleSpeedRatios[wheelName] = expected speed ratio due to cornering (1 for inner wheels, outer/inner for outer wheels); below 3 m/s the turning radius comes from the wheel geometry (obj:wheelTurnRadius), above 5 m/s from the lateral acceleration, with a linear transition between the two.
- vehicleStats contains wheelBase, invWheelBase, distanceCOGFrontAxle, distanceCOGRearAxle, trackWidth, trackWidthRefLeft/Right, mass, characteristicSpeed, invSquaredCharacteristicSpeed, skewStiffnessFront/Rear, inertiaZ, as well as cogWithoutWheels, cogWithWheels and refNodePos filled at init (not listed in the initial table). Distances in m, mass in kg, characteristicSpeed in m/s.
- Bug/inconsistency: setDebugMode assigns M.update = isDebugEnabled and update or updateDebug (inverted from the expected meaning); harmless because update and updateDebug do the same thing.
- updateGFX is empty in normal mode; in debug it sends a packet with angles and turning radii via CMU.sendDebugPacket.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_sensors_vehicleData.init(jbeamData)` | Does nothing. *(internal)* | 241 |
| `controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData)` | Reads the configuration, identifies the corner wheels, computes the geometry, the characteristic speed and the yaw inertia, then sets isActive to true. *(internal)* | 244 |
| `controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu)` | Stores the reference to the CMU (sensorHub, virtualSensors, sendDebugPacket). *(internal)* | 347 |
| `controller_drivingDynamics_sensors_vehicleData.reset()` | Resets the lateral acceleration smoother used for the turning radius. *(internal)* | 237 |
| `controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled)` | Enables/disables debug logs and packets. | 340 |
| `controller_drivingDynamics_sensors_vehicleData.shutdown()` | Disables the sensor (isActive=false, updateGFX and update set to nil). | 351 |
| `controller_drivingDynamics_sensors_vehicleData.update(dt)` | Physics step: updates wheel angles, turning radii and turningCircleSpeedRatios. *(internal)* | 94 |
| `controller_drivingDynamics_sensors_vehicleData.updateGFX(dt)` | Empty in normal mode; replaced by a version that sends a debug packet in debug mode. *(internal)* | 142 |

### Parameter details

#### `controller_drivingDynamics_sensors_vehicleData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData)`

Reads the configuration, identifies the corner wheels, computes the geometry, the characteristic speed and the yaw inertia, then sets isActive to true.

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu)`

Stores the reference to the CMU (sensorHub, virtualSensors, sendDebugPacket).

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled)`

Enables/disables debug logs and packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_sensors_vehicleData.update(dt)`

Physics step: updates wheel angles, turning radii and turningCircleSpeedRatios.

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_sensors_vehicleData.updateGFX(dt)`

Empty in normal mode; replaced by a version that sends a debug packet in debug mode.

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (54). |
| `frontLeftWheelAngle` | number | Front-left wheel angle (rad), signed by the steering direction. |
| `frontRightWheelAngle` | number | Front-right wheel angle (rad), signed by the steering direction. |
| `frontWheelAngle` | number | Average of the two front angles (rad). |
| `isActive` | boolean | True when the four corner wheels were found and the geometry computed. |
| `rearLeftWheelAngle` | number | Rear-left wheel angle (rad), unsigned. |
| `rearRightWheelAngle` | number | Rear-right wheel angle (rad), unsigned. |
| `rearWheelAngle` | number | Average of the two rear angles (rad). |
| `turningCircleSpeedRatios` | table<string, number> | Expected speed ratio per corner wheel name, due to cornering (1 = no correction). |
| `type` | string | "auxiliary". |
| `vehicleStats` | table | Computed geometry and dynamic parameters (see notes). |
| `wheelAccess` | table | Access to the corner wheel data: frontRight, frontLeft, rearRight, rearLeft (entries of wheels.wheels, nil until found). |

## Calls into the engine (C++)

- `obj:` `calcCenterOfGravityRel`, `nodeLength`, `nodeVecPlanarCosRightForward`, `wheelTurnRadius`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua`.*
