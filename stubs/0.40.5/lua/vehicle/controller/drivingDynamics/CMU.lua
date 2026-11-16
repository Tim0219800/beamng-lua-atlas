---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/CMU.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- CMU (driving dynamics management center, Driving Dynamics Suite): controller that orchestrates the sub-controllers of the `drivingDynamics/` folder (`sensors/` sensors, `supervisors/` supervisors, `actuators/` actuators). It finds and registers them (`registerCMU`), exposes accessors (getSensor, getSupervisor, getActuator...), detects rollover and crash, manages the global system state (normal, degraded, offline), the blinking warning light, calibration callbacks, and a UDP debug channel (by default 127.0.0.1:54812) for an external tool. Call order: `defaultOrder = 50`.
--- Access: controller `drivingDynamics/CMU` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_CMU
---@field defaultOrder number 50.
---@field sensorHub table|nil Sub-controller `drivingDynamics/sensors/sensorHub` (filled by initSecondStage).
---@field systemState string Global system state: "normal", "degraded" or "offline".
---@field systemStates table<string, string> Constants: normal, degraded, offline.
---@field type string "auxiliary".
---@field updateCalibrationCallback function nop or function that runs the update-type calibration callbacks.
---@field updateFixedStepCalibrationCallback function nop or function that runs the updateFixedStep-type callbacks.
---@field updateGFXCalibrationCallback function nop or function that runs the updateGFX-type callbacks.
---@field vehicleData table|nil Sub-controller `sensors/vehicleData` (filled by initSecondStage).
---@field virtualSensors table|nil Sub-controller `sensors/virtualSensors` (filled by initSecondStage).
---@field warningLightPulse integer 0 or 1, toggles every 0.15 s for the warning light blinking.
local controller_drivingDynamics_CMU = {}

--- Modifies a parameter of a configuration table identified by a dotted path (e.g. "uiDisplayData.simplePowertrainApp.activeColor"). The value "default" restores the initial value. Never creates a new parameter.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:440
---@param currentParameters table Current (modified) configuration.
---@param initialParameters table Initial configuration (for "default").
---@param changedParameters table Table of changes, keyed by dotted path.
---@param name string Dotted path of the parameter.
---@return boolean  true if a parameter was modified.
function controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name) end

--- Disables all supervisors (`setParameters({isEnabled = false})`) to allow a calibration.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:74
function controller_drivingDynamics_CMU.disableSystemsForCalibration() end

--- Finds an actuator by its file name in `drivingDynamics/actuators/`.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:424
---@param actuatorName string Name of the actuator type.
---@return table|nil  The sub-controller.
function controller_drivingDynamics_CMU.getActuator(actuatorName) end

--- Lists all loaded actuators.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:436
---@return table[]  Sub-controllers of the actuators folder.
function controller_drivingDynamics_CMU.getActuators() end

--- Returns a copy of the CMU configuration.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:488
---@return table  Deep copy of the control parameters.
function controller_drivingDynamics_CMU.getConfig() end

--- Finds a sensor by its file name in `drivingDynamics/sensors/`.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:416
---@param sensorName string Name of the sensor type (e.g. "sensorHub").
---@return table|nil  The sub-controller.
function controller_drivingDynamics_CMU.getSensor(sensorName) end

--- Lists all loaded sensors.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:432
---@return table[]  Sub-controllers of the sensors folder.
function controller_drivingDynamics_CMU.getSensors() end

--- Finds a supervisor by its file name in `drivingDynamics/supervisors/` (e.g. yawControl, tractionControl).
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:420
---@param supervisorName string Name of the supervisor type.
---@return table|nil  The sub-controller.
function controller_drivingDynamics_CMU.getSupervisor(supervisorName) end

--- Lists all loaded supervisors.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:428
---@return table[]  Sub-controllers of the supervisors folder.
function controller_drivingDynamics_CMU.getSupervisors() end

--- Opens the debug UDP socket, prepares the control parameters (UI display) and clears the crash electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:301
---@param jbeamData table CMU jbeam data.
function controller_drivingDynamics_CMU.init(jbeamData) end

--- Checks that all sub-controllers are active (otherwise shuts them down), puts the state back to normal and sends an init debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:365
function controller_drivingDynamics_CMU.initLastStage() end

--- Lists the sub-controllers of the drivingDynamics/ folder, registers them with the CMU (`registerCMU`), finds the base sensors and disables debug mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:335
function controller_drivingDynamics_CMU.initSecondStage() end

--- Adds a debug message (`systemDebugMessage` packet) to the queue sent over UDP.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:248
---@param source string Origin of the message.
---@param message string Text.
function controller_drivingDynamics_CMU.logDebugMessage(source, message) end

--- Registers a function called at each step (update, updateFixedStep or updateGFX) during a calibration.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:81
---@param callback function Function called with dt.
---@param callbackType string "update", "updateFixedStep" or "updateGFX".
function controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType) end

--- Clears the debug packets, the crash electrics and the smoothers, and puts the state back to normal.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:290
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_CMU.reset(jbeamData) end

--- Adds a packet to the debug queue (writing `vehicleID` into it).
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:95
---@param packet table Debug packet (sourceType, packetType, ...).
function controller_drivingDynamics_CMU.sendDebugPacket(packet) end

--- Replaces the entire CMU configuration.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:484
---@param configTable table New configuration.
function controller_drivingDynamics_CMU.setConfig(configTable) end

--- Enables or disables the CMU's debug mode (choice of the updateGFX variant) and propagates it to all sub-controllers having `setDebugMode`, then rebuilds the caches.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:279
---@param debugEnabled boolean true to send the debug data at 30 Hz.
function controller_drivingDynamics_CMU.setDebugMode(debugEnabled) end

--- Modifies the CMU's display parameters (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) and `notifySystemStateDegraded`; updates the "DSE" button of the driveModes controller if present.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:471
---@param parameters table Table keyed by dotted paths.
function controller_drivingDynamics_CMU.setParameters(parameters) end

--- Puts the system in degraded state, logs the reason in the debug and marks the damage `systemStateDegraded`.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:253
---@param reason string Reason for the degradation.
function controller_drivingDynamics_CMU.systemDegradationDetected(reason) end

--- Puts the system back to normal state and clears the damage `systemStateDegraded`.
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:263
function controller_drivingDynamics_CMU.systemDegradationResolved() end

--- Physics step: runs the update-type calibration callbacks.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:244
---@param dt number Physics step in seconds.
function controller_drivingDynamics_CMU.update(dt) end

--- Fixed step (100 Hz): runs the updateFixedStep-type calibration callbacks.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:240
---@param dt number Step in seconds.
function controller_drivingDynamics_CMU.updateFixedStep(dt) end

--- Every frame: detects rollover and crash, animates the warning light, runs the GFX calibration callbacks and (depending on debug mode) exchanges the UDP packets. Replaced by a debug variant via setDebugMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/CMU.lua:188
---@param dt number Time step in seconds.
function controller_drivingDynamics_CMU.updateGFX(dt) end

return controller_drivingDynamics_CMU
