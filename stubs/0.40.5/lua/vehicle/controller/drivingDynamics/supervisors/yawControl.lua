---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Yaw control supervisor (modern ESC, type "auxiliary", defaultOrder 60) of the drivingDynamics architecture. At every fixed step it asks the first yawProvider that answers (e.g. STMEstimate) for the expected yaw, compares it to the measured yaw (sensorHub.yawAVSmooth), computes the difference and the front/rear slip angles, then calls actAsYawControl of each registered component (brakeControl, motorTorqueControl, awdControl...). It drives the electrics.values.esc/escActive light.
--- Access: controller `drivingDynamics/supervisors/yawControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_yawControl
---@field defaultOrder number Default execution order (60).
---@field isActing boolean True when the yaw control intervenes continuously (smoothed flag >= 1).
---@field isActive boolean True after init, false after shutdown.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_yawControl = {}

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:201
---@return table  Copy of {isEnabled}.
function controller_drivingDynamics_supervisors_yawControl.getConfig() end

--- Resets parameters, providers and components and sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:139
---@param jbeamData table jbeam data (unused).
function controller_drivingDynamics_supervisors_yawControl.init(jbeamData) end

--- Sorts providers and components by their order.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:156
---@param jbeamData table jbeam data (unused).
function controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData) end

--- Sets electrics.values.hasESC to true and saves the initial parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:150
---@param jbeamData table jbeam data (unused).
function controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:122
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu) end

--- Adds a component exposing actAsYawControl.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:131
---@param component table Control component.
function controller_drivingDynamics_supervisors_yawControl.registerComponent(component) end

--- Adds an expected yaw provider.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:126
---@param yawProvider table Provider exposing calculateExpectedYaw.
function controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:136
function controller_drivingDynamics_supervisors_yawControl.reset() end

--- Sends the configuration to the CMU ("config" debug packet).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:205
function controller_drivingDynamics_supervisors_yawControl.sendConfigData() end

--- Replaces the configuration and propagates isEnabled.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:196
---@param configTable table Table {isEnabled}.
function controller_drivingDynamics_supervisors_yawControl.setConfig(configTable) end

--- Enables/disables sending debug packets (yaw differences, slip angles, speed used) to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:116
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled) end

--- Changes isEnabled via CMU.applyParameter; propagated to the providers (key "isEnabled") and to the components (key "yawControl.isEnabled").
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:190
---@param parameters table<string, any> E.g. {isEnabled = false}.
function controller_drivingDynamics_supervisors_yawControl.setParameters(parameters) end

--- Disables the supervisor (isActive=false, updateGFX, update and updateFixedStep set to nil).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:174
function controller_drivingDynamics_supervisors_yawControl.shutdown() end

--- Fixed step: computes the expected yaw, the difference, the slip angles, then calls the components.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:43
---@param dt number Time step (s).
function controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt) end

--- Updates electrics.values.esc and escActive from the smoothed state (replaced by a version with a debug packet if setDebugMode(true)).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua:91
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_yawControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_yawControl
