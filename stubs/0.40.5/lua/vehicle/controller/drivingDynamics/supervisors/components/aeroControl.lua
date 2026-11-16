---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Yaw control component (type "auxiliary", defaultOrder 70) for active aerodynamics. It registers with the yawControl supervisor (order 30); when the vehicle oversteers (body slip angle of opposite sign to the yaw and above a threshold), it writes electrics.values.yawControlRequestReduceOversteer (1 or 0), which the vehicle's aero elements (wings, flaps) can read to reduce oversteer. Not used for traction control or ABS.
--- Access: controller `drivingDynamics/supervisors/components/aeroControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_components_aeroControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000: never used as ABS.
---@field componentOrderTractionControl number 1000: never used as traction control.
---@field componentOrderYawControl number 30: call order by yawControl.
---@field defaultOrder number Default execution order (70).
---@field isActingAsABS boolean Always false.
---@field isActingAsTC boolean Always false.
---@field isActingAsYC boolean True when oversteer reduction is requested.
---@field isActive boolean True after initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_aeroControl = {}

--- Called by tractionControl; does nothing (returns false, replaced by nop at init).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:34
---@param wheelGroup table Wheel group.
---@param dt number Time step (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt) end

--- Called by yawControl at every fixed step: detects oversteer via the body slip angle and updates electrics.values.yawControlRequestReduceOversteer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:41
---@param measuredYaw number Measured yaw (rad/s).
---@param expectedYaw number Expected yaw (rad/s), unused.
---@param yawDifference number Yaw error, unused.
---@param bodySlipAngle number Adjusted body slip angle (rad).
---@param frontSlipAngle number Front slip angle (rad), unused.
---@param rearSlipAngle number Rear slip angle (rad), unused.
---@param dt number Time step (s).
---@return boolean  True if oversteer reduction is requested.
function controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:137
---@return table  Copy of the configuration.
function controller_drivingDynamics_supervisors_components_aeroControl.getConfig() end

--- Resets the action flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:90
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:112
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData) end

--- Registers with yawControl, reads slipAngleThreshold and sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:96
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:76
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu) end

--- Resets the flags and the smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:83
function controller_drivingDynamics_supervisors_components_aeroControl.reset() end

--- Sends the configuration to the CMU (debug packet).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:141
function controller_drivingDynamics_supervisors_components_aeroControl.sendConfigData() end

--- Replaces the entire configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:132
---@param configTable table Table {yawControl = {isEnabled, slipAngleThreshold}}.
function controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:70
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled) end

--- Applies parameters (see notes) via CMU.applyParameter.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:124
---@param parameters table<string, any> E.g. {["yawControl.slipAngleThreshold"] = 0.3}.
function controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters) end

--- Disables the component.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:115
function controller_drivingDynamics_supervisors_components_aeroControl.shutdown() end

--- Empty (debug version: sends a state packet to the CMU).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua:57
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_aeroControl
