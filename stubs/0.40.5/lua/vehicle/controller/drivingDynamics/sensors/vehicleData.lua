---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle data" sensor of the drivingDynamics system (type "auxiliary", defaultOrder 54). It identifies the four corner wheels (front/rear, left/right) by their position, computes the vehicle geometry once (wheelbase, center-of-gravity-to-axle distances, track width, mass, characteristic speed, yaw inertia) then, at each step, the actual steering angles of the wheels and the wheel speed ratios due to the turning radius. The other drivingDynamics modules (yawControl, STMEstimate, virtualSensors, components) read these values via cmu.vehicleData.
--- Access: controller `drivingDynamics/sensors/vehicleData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_sensors_vehicleData
---@field defaultOrder number Default execution order (54).
---@field frontLeftWheelAngle number Front-left wheel angle (rad), signed by the steering direction.
---@field frontRightWheelAngle number Front-right wheel angle (rad), signed by the steering direction.
---@field frontWheelAngle number Average of the two front angles (rad).
---@field isActive boolean True when the four corner wheels were found and the geometry computed.
---@field rearLeftWheelAngle number Rear-left wheel angle (rad), unsigned.
---@field rearRightWheelAngle number Rear-right wheel angle (rad), unsigned.
---@field rearWheelAngle number Average of the two rear angles (rad).
---@field turningCircleSpeedRatios table<string, number> Expected speed ratio per corner wheel name, due to cornering (1 = no correction).
---@field type string "auxiliary".
---@field vehicleStats table Computed geometry and dynamic parameters (see notes).
---@field wheelAccess table Access to the corner wheel data: frontRight, frontLeft, rearRight, rearLeft (entries of wheels.wheels, nil until found).
local controller_drivingDynamics_sensors_vehicleData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:241
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_sensors_vehicleData.init(jbeamData) end

--- Reads the configuration, identifies the corner wheels, computes the geometry, the characteristic speed and the yaw inertia, then sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:244
---@param jbeamData table jbeam data (see notes).
function controller_drivingDynamics_sensors_vehicleData.initSecondStage(jbeamData) end

--- Stores the reference to the CMU (sensorHub, virtualSensors, sendDebugPacket).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:347
---@param cmu table CMU controller.
function controller_drivingDynamics_sensors_vehicleData.registerCMU(cmu) end

--- Resets the lateral acceleration smoother used for the turning radius.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:237
function controller_drivingDynamics_sensors_vehicleData.reset() end

--- Enables/disables debug logs and packets.
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:340
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_sensors_vehicleData.setDebugMode(debugEnabled) end

--- Disables the sensor (isActive=false, updateGFX and update set to nil).
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:351
function controller_drivingDynamics_sensors_vehicleData.shutdown() end

--- Physics step: updates wheel angles, turning radii and turningCircleSpeedRatios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:94
---@param dt number Time step (s).
function controller_drivingDynamics_sensors_vehicleData.update(dt) end

--- Empty in normal mode; replaced by a version that sends a debug packet in debug mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/vehicleData.lua:142
---@param dt number Graphics time step (s).
function controller_drivingDynamics_sensors_vehicleData.updateGFX(dt) end

return controller_drivingDynamics_sensors_vehicleData
