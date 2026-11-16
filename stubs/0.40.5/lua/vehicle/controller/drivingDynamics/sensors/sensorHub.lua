---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central sensor of the Driving Dynamics Suite: at each physics step it reads the angular velocities (roll, pitch, yaw), the attitude (roll, pitch), the X/Y/Z accelerations (via `sensors.ffiSensors`) and the driver inputs, and computes smoothed versions as well as an acceleration "noise" (difference between high and low envelopes, limited to 150). The other controllers in `drivingDynamics/` (supervisors, actuators, CMU) read these fields, accessible via `CMU.sensorHub` or `CMU.getSensor("sensorHub")`. Call order: `defaultOrder = 52`.
--- Access: controller `drivingDynamics/sensors/sensorHub` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_sensors_sensorHub
---@field accNoiseX number X acceleration noise level (0 to 150).
---@field accNoiseY number Y acceleration noise level (0 to 150).
---@field accNoiseZ number Z acceleration noise level (after removing gravity, 0 to 150).
---@field accelerationX number Raw longitudinal acceleration (m/s²).
---@field accelerationXSmooth number Smoothed accelerationX.
---@field accelerationY number Raw lateral acceleration (m/s²).
---@field accelerationYSmooth number Smoothed accelerationY.
---@field accelerationZ number Raw non-inertial vertical acceleration (m/s²).
---@field accelerationZSmooth number Smoothed accelerationZ.
---@field defaultOrder number 52.
---@field gravity number World gravity (`obj:getGravity()`), updated every GFX frame.
---@field isActive boolean true after init, false after shutdown.
---@field pitch number Pitch angle in rad.
---@field pitchAV number Pitch angular velocity in rad/s.
---@field pitchAVSmooth number Smoothed pitchAV.
---@field roll number Roll angle in rad.
---@field rollAV number Roll angular velocity in rad/s.
---@field rollAVSmooth number Smoothed rollAV.
---@field steeringInput number Value of `electrics.values.steering_input`.
---@field type string "auxiliary".
---@field vX number Longitudinal speed in m/s (computed only in debug mode).
---@field vY number Lateral speed in m/s (computed only in debug mode).
---@field yawAV number Yaw angular velocity in rad/s.
---@field yawAVSmooth number Smoothed yawAV.
---@field yawAcceleration number See the note: in practice equals yawAV / dt.
local controller_drivingDynamics_sensors_sensorHub = {}

--- Reads the gravity, marks the sensor as active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:172
---@param jbeamData table Jbeam data (unused).
function controller_drivingDynamics_sensors_sensorHub.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:178
function controller_drivingDynamics_sensors_sensorHub.initLastStage() end

--- Called by the CMU during its initSecondStage to give it a reference to itself (used for debugging).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:188
---@param cmu table CMU module.
function controller_drivingDynamics_sensors_sensorHub.registerCMU(cmu) end

--- Resets all smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:155
function controller_drivingDynamics_sensors_sensorHub.reset() end

--- Switches between the normal and debug variants of update/updateGFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:181
---@param debugEnabled boolean true to fill and send the debug packet.
function controller_drivingDynamics_sensors_sensorHub.setDebugMode(debugEnabled) end

--- Stops the sensor: isActive = false and update functions removed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:192
function controller_drivingDynamics_sensors_sensorHub.shutdown() end

--- Physics step: reads and smooths angular velocities, attitude, accelerations and noise. Replaced by updateDebug in debug mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:71
---@param dt number Physics step in seconds.
function controller_drivingDynamics_sensors_sensorHub.update(dt) end

--- Every frame: updates the gravity. In debug mode, also sends the debug packet to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/sensorHub.lua:144
---@param dt number Time step in seconds.
function controller_drivingDynamics_sensors_sensorHub.updateGFX(dt) end

return controller_drivingDynamics_sensors_sensorHub
