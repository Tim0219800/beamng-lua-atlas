---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Virtual sensors of the drivingDynamics system (type "auxiliary", defaultOrder 56): estimates the vehicle's true speed (virtual.speed), the body slip angle (bodySlipAngle) and the reference wheel speed, without a ground speed sensor. It integrates the acceleration measured at the center of gravity position, corrects it with reset criteria (standstill, coasting, straight line, wheel acceleration consistency) and publishes confidence indices (trustWorthiness). The supervisors (yawControl, tractionControl) and the slip providers read cmu.virtualSensors.virtual and .trustWorthiness.
--- Access: controller `drivingDynamics/sensors/virtualSensors` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_sensors_virtualSensors
---@field defaultOrder number Default execution order (56).
---@field isActive boolean True after init, false after shutdown.
---@field reference table Reference values computed only in debug mode: bodySlipAngle (rad) and speed (m/s) from the physics engine's speed sensor.
---@field trustWorthiness table Confidence indices 0..1: pitch, roll, jerk (never modified, stays 1), bodySlipAngle, wheelSpeed, virtualSpeed, recoverySpeed; needsFullReset (boolean).
---@field type string "auxiliary".
---@field virtual table Estimates: speed, integratedSpeed, avgWheelSpeed (never updated), avgNonPropulsedWheelSpeed (never updated), wheelSpeed, imuAcceleration, recoveryWheelSpeed, recoveryWheelCount, bodySlipAngle, bodySlipAngleIntegrated, bodySlipAngleLowSpeed, bodySlipAngleLowSpeedTrust, lastBodySlipAngle, bodySlipAngleRate.
local controller_drivingDynamics_sensors_virtualSensors = {}

--- Resets the estimates and confidences, clears the caches and sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:617
---@param jbeamData table jbeam data (unused).
function controller_drivingDynamics_sensors_virtualSensors.init(jbeamData) end

--- Computes the center of gravity offset relative to the reference node, needed to derive the acceleration from the position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:648
function controller_drivingDynamics_sensors_virtualSensors.initLastStage() end

--- Stores the reference to the CMU (sensorHub, vehicleData, systemDegradationDetected/Resolved, logDebugMessage, sendDebugPacket).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:676
---@param cmu table CMU controller.
function controller_drivingDynamics_sensors_virtualSensors.registerCMU(cmu) end

--- Resets the whole estimation state (speed, slip, smoothers, probabilities, position sampling).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:560
---@param jbeamData table jbeam data (unused).
function controller_drivingDynamics_sensors_virtualSensors.reset(jbeamData) end

--- Enables/disables debug packets and the computation of reference values.
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:669
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_sensors_virtualSensors.setDebugMode(debugEnabled) end

--- Disables the sensor (isActive=false, updateGFX, update and updateWheelsIntermediate set to nil).
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:680
function controller_drivingDynamics_sensors_virtualSensors.shutdown() end

--- Physics step: integrates the acceleration for virtual.speed and updates the body slip angle (low speed from front wheel geometry, high speed by integration, blended between 4 and 5 m/s).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:488
---@param dt number Time step (s).
function controller_drivingDynamics_sensors_virtualSensors.update(dt) end

--- Fixed step: updates wheel speed, recovery speed and confidence indices / reset conditions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:420
---@param dt number Time step (s).
function controller_drivingDynamics_sensors_virtualSensors.updateFixedStep(dt) end

--- Empty in normal mode; sends a rich debug packet in debug mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/sensors/virtualSensors.lua:513
---@param dt number Graphics time step (s).
function controller_drivingDynamics_sensors_virtualSensors.updateGFX(dt) end

return controller_drivingDynamics_sensors_virtualSensors
