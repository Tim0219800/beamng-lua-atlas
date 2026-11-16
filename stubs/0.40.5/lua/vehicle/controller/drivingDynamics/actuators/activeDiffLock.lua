---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: active locking of an axle differential. At 100 Hz (updateFixedStep) it compares the speeds of the two outputs corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`); under throttle, a PID sets a locking coefficient 0..1 that rises when the speed difference exceeds `avDiffThreshold`. The coefficient is written to `relevantDifferential.activeLockCoef`. Supervisors can bound it with `overrideMin`/`overrideMax`. Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/activeDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_activeDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true if the locking coefficient is > 0.
---@field isActive boolean true if the differential and its wheels were found.
---@field overrideMax number Upper bound of the locking (1 by default).
---@field overrideMin number Lower bound of the locking (0 by default).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_activeDiffLock = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:217
---@return table  Deep copy.
function controller_drivingDynamics_actuators_activeDiffLock.getConfig() end

--- Reads the jbeam parameters and creates the PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:132
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData) end

--- Finds the differential (`differentialName`) and the wheels of each output; enables the system.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:154
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData) end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:192
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu) end

--- Sets isActing to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:128
function controller_drivingDynamics_actuators_activeDiffLock.reset() end

--- Resets the override bounds to 0 and 1.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:46
function controller_drivingDynamics_actuators_activeDiffLock.resetOverride() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:221
function controller_drivingDynamics_actuators_activeDiffLock.sendConfigData() end

--- Replaces the whole parameter table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:213
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable) end

--- Enables or disables sending debug packets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:186
---@param debugEnabled boolean true to send.
function controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled) end

--- Changes avDiffThreshold, isEnabled and lockingPIDkP/kI/kD at runtime (via CMU.applyParameter).
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:196
---@param parameters table Table of parameters to change.
function controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters) end

--- Stops the actuator.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:121
function controller_drivingDynamics_actuators_activeDiffLock.shutdown() end

--- Fixed step (100 Hz): computes the corrected speed difference and the locking coefficient (smoothed PID, bounded by the override) and writes it to the differential's `activeLockCoef`.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:51
---@param dt number Step in seconds.
function controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt) end

--- Every frame: nothing useful. Debug variant: sends the values to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua:93
---@param dt number Time step in seconds.
function controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt) end

return controller_drivingDynamics_actuators_activeDiffLock
