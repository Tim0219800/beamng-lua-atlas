---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Expected yaw provider (type "auxiliary", defaultOrder 80, providerOrder 20) for the yawControl supervisor. It estimates the yaw rate the driver is requesting using the bicycle model with cornering stiffness (front wheel angle, wheelbase, characteristic speed), limited by a maximum lateral acceleration. Registers via yawControl.registerYawProvider; if yawControl is absent, it disables itself.
--- Access: controller `drivingDynamics/supervisors/yawProviders/STMEstimate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_yawProviders_STMEstimate
---@field defaultOrder number Default execution order (80).
---@field isActive boolean True after init, false if yawControl is absent.
---@field providerOrder number Priority among the yaw providers (20).
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_yawProviders_STMEstimate = {}

--- Returns the expected yaw rate (rad/s, positive) from the front wheel angle and the speed; called by yawControl at every fixed step.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:25
---@param dt number Declared as dt but receives the speed (see notes); unused.
---@return number  Expected yaw in rad/s.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:103
---@return table  Copy.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig() end

--- Sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:66
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:85
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData) end

--- Registers with yawControl and reads maxLateralAcceleration.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:70
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:59
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:63
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.reset() end

--- Sends the configuration to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:107
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.sendConfigData() end

--- Replaces the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:99
---@param configTable table Table {isEnabled, maxLateralAcceleration}.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:53
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled) end

--- Applies isEnabled and maxLateralAcceleration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:94
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters) end

--- Disables the provider.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:88
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.shutdown() end

--- Empty (debug version: sends isEnabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:42
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt) end

return controller_drivingDynamics_supervisors_yawProviders_STMEstimate
