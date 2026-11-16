---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Component of the drivingDynamics system that reduces engine torque via device.throttleFactor, for traction control (order 40) and yaw control (order 40). For each motor concerned, the final factor is min(traction control factor, yaw factor), recomputed at every fixed step. Traction control uses a PID on the maximum slip of the motor's wheel group; yaw uses three PIDs (yaw error, body slip, front slip). Cannot be used for ABS.
--- Access: controller `drivingDynamics/supervisors/components/motorTorqueControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_components_motorTorqueControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000: unused.
---@field componentOrderTractionControl number 40.
---@field componentOrderYawControl number 40.
---@field defaultOrder number Default execution order (70).
---@field isActingAsABS boolean Always false.
---@field isActingAsTC boolean True when the torque is reduced for traction control.
---@field isActingAsYC boolean True when the torque is reduced by the yaw control.
---@field isActive boolean True after init.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_motorTorqueControl = {}

--- Called by tractionControl: computes the torque factor of a wheel group's motor from the group's maximum slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:54
---@param wheelGroup table Wheel group {motor, maxSlip...}.
---@param dt number Time step (s).
---@return boolean  True if the torque is reduced.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt) end

--- Called by yawControl: computes a torque factor common to all controlled motors from the yaw error, the body slip angle (oversteer only) and the front slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:80
---@param measuredYaw number Measured yaw (rad/s).
---@param expectedYaw number Not used.
---@param yawDifference number Yaw error.
---@param bodySlipAngle number Adjusted body slip angle (rad).
---@param frontSlipAngle number Front slip angle (rad).
---@param rearSlipAngle number Not used.
---@param dt number Time step (s).
---@return boolean  True if the torque is reduced.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:348
---@return table  Copy of the configuration.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig() end

--- Sets isActive to true and resets the flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:173
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:308
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData) end

--- Reads the configuration, creates the PIDs, lists the controlled motors and registers with the supervisors.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:190
---@param jbeamData table jbeam data (see notes).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:147
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu) end

--- Resets the flags and the PIDs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:151
function controller_drivingDynamics_supervisors_components_motorTorqueControl.reset() end

--- Sends the configuration to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:352
function controller_drivingDynamics_supervisors_components_motorTorqueControl.sendConfigData() end

--- Replaces the entire configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:343
---@param configTable table Table {tractionControl, yawControl}.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:141
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled) end

--- Applies parameters (see notes) then reconfigures the traction control PIDs.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:320
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters) end

--- Disables the component.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:311
function controller_drivingDynamics_supervisors_components_motorTorqueControl.shutdown() end

--- Applies throttleFactor = min(TC factor, YC factor) to each controlled motor.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:41
---@param dt number Time step (s).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt) end

--- Empty (debug version: sends a detailed packet).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua:104
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_motorTorqueControl
