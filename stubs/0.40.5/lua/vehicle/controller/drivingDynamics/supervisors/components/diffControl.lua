---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Yaw control component acting on electronically controlled front/rear differentials (type "auxiliary", defaultOrder 70). It registers with tractionControl (order 20, no action) and yawControl (order 10). When the vehicle oversteers under acceleration, it sets overrideMin/overrideMax of the differential controllers (activeDiffLock or electronicDiffLock) to lock or open the differential according to the body slip angle.
--- Access: controller `drivingDynamics/supervisors/components/diffControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_components_diffControl
---@field actAsABSControl function nop.
---@field componentOrderABSControl number 1000: unused.
---@field componentOrderTractionControl number 20.
---@field componentOrderYawControl number 10.
---@field defaultOrder number Default execution order (70).
---@field isActingAsABS boolean Always false.
---@field isActingAsTC boolean Always false.
---@field isActingAsYC boolean True when a differential is currently forced.
---@field isActive boolean True after initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_diffControl = {}

--- Called by tractionControl; does nothing and returns false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:52
---@param wheelGroup table Wheel group.
---@param dt number Time step (s).
---@return boolean  false.
function controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt) end

--- Called by yawControl: resets the overrides to zero then, in case of oversteer under acceleration, applies the front/rear control methods.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:126
---@param measuredYaw number Measured yaw (rad/s).
---@param expectedYaw number Expected yaw.
---@param yawDifference number Yaw error.
---@param bodySlipAngle number Adjusted body slip angle (rad).
---@param frontSlipAngle number Not used.
---@param rearSlipAngle number Not used.
---@param dt number Time step (s).
---@return boolean  Always false (see notes).
function controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:271
---@return table  Copy of the configuration.
function controller_drivingDynamics_supervisors_components_diffControl.getConfig() end

--- Resets the flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:178
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:235
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData) end

--- Looks for the differential controllers, registers with the supervisors and reads the thresholds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:184
---@param jbeamData table jbeam data (see notes).
function controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:165
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu) end

--- Resets the flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:172
function controller_drivingDynamics_supervisors_components_diffControl.reset() end

--- Sends the configuration to the CMU (debug packet).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:275
function controller_drivingDynamics_supervisors_components_diffControl.sendConfigData() end

--- Replaces the entire configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:266
---@param configTable table Table {tractionControl, yawControl}.
function controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:159
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled) end

--- Applies the yawControl.* parameters (isEnabled and the eight thresholds) via CMU.applyParameter.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:247
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters) end

--- Disables the component.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:238
function controller_drivingDynamics_supervisors_components_diffControl.shutdown() end

--- Empty (debug version: sends a state packet).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua:147
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_components_diffControl
