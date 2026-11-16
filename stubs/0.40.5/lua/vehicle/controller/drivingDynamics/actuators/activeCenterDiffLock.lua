---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: active locking of the center differential (electronically controlled clutch). At each intermediate physics step, it reads the center differential's output speeds, measures the speed difference between axles and sets, via a PID, a locking coefficient 0..1 written into `relevantDiff.activeLockCoef`. The locking is cut when braking, without throttle or with the parking brake, frozen during a gear change, and can have a minimum. The CMU's supervisors can limit it with `overrideMin`/`overrideMax`. Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/activeCenterDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_activeCenterDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true if the locking coefficient exceeds 0.01.
---@field isActive boolean true if the system found its differential and its CMU.
---@field overrideMax number Upper bound imposed by a supervisor (1 by default).
---@field overrideMin number Lower bound imposed by a supervisor (0 by default).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_activeCenterDiffLock = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:232
---@return table  Deep copy of the parameters.
function controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig() end

--- Reads the jbeam parameters and creates the locking PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:147
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData) end

--- Finds the center differential (`centerDiffName`) and enables the system; stops if the CMU is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:176
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData) end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:206
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu) end

--- Resets the states, smoothed speeds, override and `activeLockCoef` to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:132
function controller_drivingDynamics_actuators_activeCenterDiffLock.reset() end

--- Resets the override bounds to 0 and 1.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:43
function controller_drivingDynamics_actuators_activeCenterDiffLock.resetOverride() end

--- Sends the parameters to the CMU in a debug packet of type config.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:236
function controller_drivingDynamics_actuators_activeCenterDiffLock.sendConfigData() end

--- Replaces the whole parameter table (used by the debug tool).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:228
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable) end

--- Enables or disables sending debug packets every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:200
---@param debugEnabled boolean true to send.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled) end

--- Changes the parameters at runtime (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter; the value "default" restores the initial one.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:210
---@param parameters table Table of parameters to change.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters) end

--- Stops the actuator (called by the CMU in case of an incomplete system).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:125
function controller_drivingDynamics_actuators_activeCenterDiffLock.shutdown() end

--- Every frame: does nothing useful (returns if disabled). Debug variant: sends the values to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:98
---@param dt number Time step in seconds.
function controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt) end

--- Intermediate physics step: computes the locking coefficient (PID on the speed difference between outputs, brake, throttle, gear and parking brake conditions), applies the override and writes it into the differential's `activeLockCoef`.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:48
---@param dt number Step in seconds.
function controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_activeCenterDiffLock
