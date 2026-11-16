---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Yaw control component for electronically locking all-wheel-drive transmissions (type "auxiliary", defaultOrder 70). It registers with tractionControl (order 10, but does nothing there) and yawControl (order 20). Under acceleration, if it detects oversteer via the body slip angle, it sets overrideMin/overrideMax of the locking actuator (by default "electronicSplitShaftLock") to distribute torque between the front/rear axles according to the mode (rearMain, frontMain, centerDiff).
--- Access: controller `drivingDynamics/supervisors/components/awdControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_components_awdControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000: unused.
---@field componentOrderTractionControl number 10.
---@field componentOrderYawControl number 20.
---@field defaultOrder number Default execution order (70).
---@field isActingAsABS boolean Always false.
---@field isActingAsTC boolean Always false.
---@field isActingAsYC boolean True when a locking override is applied.
---@field isActive boolean True after initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_awdControl = {}

--- Called by tractionControl; does nothing and returns false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:35
---@param wheelGroup table Wheel group.
---@param dt number Time step (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt) end

--- Called by yawControl: resets then computes the overrideMin/overrideMax bounds of the locking actuator from the body slip angle (oversteer under acceleration only).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:54
---@param measuredYaw number Measured yaw (rad/s).
---@param expectedYaw number Expected yaw, unused.
---@param yawDifference number Yaw error, unused.
---@param bodySlipAngle number Adjusted body slip angle (rad).
---@param frontSlipAngle number Not used.
---@param rearSlipAngle number Not used.
---@param dt number Time step (s).
---@return boolean  Always false (see notes).
function controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:176
---@return table  Copy of the configuration.
function controller_drivingDynamics_supervisors_components_awdControl.getConfig() end

--- Resets the flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:114
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:147
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData) end

--- Looks for the AWD actuator, registers with the supervisors and reads controlMode and slipAngleThreshold.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:120
---@param jbeamData table jbeam data (see notes).
function controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:94
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu) end

--- Resets the flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:108
function controller_drivingDynamics_supervisors_components_awdControl.reset() end

--- Sends the configuration to the CMU (debug packet).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:180
function controller_drivingDynamics_supervisors_components_awdControl.sendConfigData() end

--- Replaces the entire configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:171
---@param configTable table Table {tractionControl, yawControl, controlMode}.
function controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:88
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled) end

--- Applies parameters (see notes) and recomputes the control method according to controlMode.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:159
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters) end

--- Disables the component.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:150
function controller_drivingDynamics_supervisors_components_awdControl.shutdown() end

--- Empty (debug version: sends a state packet).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua:75
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_awdControl
