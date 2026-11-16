---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traction control (TCS) supervisor of the new drivingDynamics architecture (type "auxiliary", defaultOrder 65). It computes nothing itself: at every fixed step, for each wheel group (one group per motor listed in tractionControlledMotors) it asks the first slipProvider that succeeds for the slip, then calls actAsTractionControl of each registered component (motorTorqueControl, brakeControl, diffControl, etc.). It also drives the electrics.values.tcs/tcsActive light. The providers and components register themselves via registerSlipProvider/registerComponent; the CMU (drivingDynamics) calls registerCMU.
--- Access: controller `drivingDynamics/supervisors/tractionControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_tractionControl
---@field defaultOrder number Default execution order (65).
---@field isActing boolean True when the TCS intervenes continuously (smoothed flag >= 1).
---@field isActive boolean True after init, false after shutdown.
---@field tractionControlledWheels table List of {wheel = wheel's wd, wheelGroup = group}, filled at initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_tractionControl = {}

--- Returns a copy of the current configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:235
---@return table  Copy of {isEnabled, velocityOffsetThreshold}.
function controller_drivingDynamics_supervisors_tractionControl.getConfig() end

--- Clears the provider and component lists, reads velocityOffsetThreshold and sets isActive to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:137
---@param jbeamData table Controller jbeam data.
function controller_drivingDynamics_supervisors_tractionControl.init(jbeamData) end

--- Sorts slip providers and components by their order.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:190
---@param jbeamData table Controller jbeam data.
function controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData) end

--- Builds the wheel groups from tractionControlledMotors (powertrain.getDevice / getChildWheels), initializes smoothing and slip per wheel, sets electrics.values.hasTCS to true and saves the initial parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:148
---@param jbeamData table Controller jbeam data.
function controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU (access to virtualSensors, sensorHub, applyParameter, sendDebugPacket).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:112
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu) end

--- Adds a component that must expose actAsTractionControl(wheelGroup, dt) and setParameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:116
---@param component table Control component.
function controller_drivingDynamics_supervisors_tractionControl.registerComponent(component) end

--- Adds a provider that must expose calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) returning true if the slip was computed, and setParameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:121
---@param slipProvider table Slip provider.
function controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider) end

--- Resets the slip (slip, lastSlip, slipRange) and the smoothers of all wheels.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:126
function controller_drivingDynamics_supervisors_tractionControl.reset() end

--- Sends the configuration to the CMU as a debug packet (packetType "config").
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:239
function controller_drivingDynamics_supervisors_tractionControl.sendConfigData() end

--- Replaces the entire configuration (controlParameters) and propagates isEnabled.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:230
---@param configTable table Table {isEnabled, velocityOffsetThreshold}.
function controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable) end

--- Enables/disables sending debug packets (wheel speed, slip, slipRange) to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:106
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled) end

--- Changes velocityOffsetThreshold and/or isEnabled via CMU.applyParameter; a change of isEnabled is propagated to the providers and components under the key "tractionControl.isEnabled".
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:223
---@param parameters table<string, any> Parameters to apply, e.g. {isEnabled = false}.
function controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters) end

--- Disables the supervisor (isActive=false, updateGFX and update set to nil).
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:208
function controller_drivingDynamics_supervisors_tractionControl.shutdown() end

--- Fixed step: computes the slip per group via the providers then lets the components act; remembers whether at least one component intervened.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:42
---@param dt number Time step (s).
function controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt) end

--- Updates the electrics values of the TCS light (replaced by a version with a debug packet if setDebugMode(true)).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua:72
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt) end

return controller_drivingDynamics_supervisors_tractionControl
