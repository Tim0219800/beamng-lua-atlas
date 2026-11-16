---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Slip provider (type "auxiliary", defaultOrder 70, providerOrder 10) that compares each wheel's speed to the vehicle's virtual speed (virtualSensors.virtual.speed) to estimate slip. It registers with the tractionControl and absControl supervisors (if present) and answers them via calculateSlipTractionControl and calculateSlipABSControl. The results are written into the supervisor's wheel structures (wheelData.slip, wheelGroup.maxSlip/minSlip/slipRange).
--- Access: controller `drivingDynamics/supervisors/slipProviders/virtualSpeedSlip` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip
---@field defaultOrder number Default execution order (70).
---@field isActive boolean True after init.
---@field providerOrder number Priority order among the providers (10, lower = tried first).
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip = {}

--- Computes the slip (as an absolute value) of a single wheel for the ABS. Called by the absControl supervisor.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:65
---@param wheelData table Wheel data {wd, slip, slipSmoother}.
---@param velocityOffset number Speed offset (m/s).
---@param dt number Time step (s), unused.
---@return boolean  True if the slip was computed, false if disabled.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt) end

--- Computes the slip of each wheel of a powered group and the group's extremes. Called by tractionControl.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:27
---@param wheelGroup table Wheel group {motor, wheels, wheelCount, maxSlip, minSlip, slipRange}.
---@param steeringCoef number 0.5..1 factor tied to steering.
---@param velocityOffset number Speed offset (m/s) avoiding division by ~0 at low speed.
---@param dt number Time step (s), unused.
---@return boolean  True if the slip was computed, false if disabled.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:144
---@return table  Copy.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig() end

--- Sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:109
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData) end

--- Saves the initial parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:125
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData) end

--- Registers as a slip provider with tractionControl and absControl.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:113
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:102
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:106
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.reset() end

--- Sends the configuration to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:148
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.sendConfigData() end

--- Replaces the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:140
---@param configTable table Table {tractionControl = {isEnabled}, absControl = {isEnabled}}.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:96
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled) end

--- Applies tractionControl.isEnabled and absControl.isEnabled.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:135
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters) end

--- Disables the provider.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:129
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.shutdown() end

--- Empty (debug version: sends the enabled state).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:84
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt) end

return controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip
