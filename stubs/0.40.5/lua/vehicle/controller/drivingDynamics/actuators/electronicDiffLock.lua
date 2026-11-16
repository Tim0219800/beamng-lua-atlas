---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: electronic brake-based locking differential (EDL, "brake-based": the slipping wheel is braked to transfer torque). At each intermediate physics step, it compares the speeds of the two outputs corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`); if the difference exceeds `avDiffThreshold` under throttle (> 0.05), a PID computes a braking coefficient applied as `desiredBrakingTorque` to the wheels on the faster side. Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/electronicDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_electronicDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true if the speed difference justifies braking.
---@field isActive boolean true if the differential and its wheels were found.
---@field overrideMax number Ceiling of the braking coefficient imposed by a supervisor (1 by default).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_electronicDiffLock = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:241
---@return table  Deep copy.
function controller_drivingDynamics_actuators_electronicDiffLock.getConfig() end

--- Reads the jbeam parameters and creates the braking PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:152
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData) end

--- Finds the differential (`differentialName`) and the wheels of each output; enables the system.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:175
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData) end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:215
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu) end

--- Sets isActing to false and overrideMax to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:147
function controller_drivingDynamics_actuators_electronicDiffLock.reset() end

--- Resets the override bounds: overrideMin = 0, overrideMax = 1.
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:48
function controller_drivingDynamics_actuators_electronicDiffLock.resetOverride() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:245
function controller_drivingDynamics_actuators_electronicDiffLock.sendConfigData() end

--- Replaces the whole parameter table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:237
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable) end

--- Enables or disables sending debug packets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:209
---@param debugEnabled boolean true to send.
function controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled) end

--- Changes avDiffThreshold, avThreshold, isEnabled and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter).
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:219
---@param parameters table Table of parameters to change.
function controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters) end

--- Stops the actuator.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:140
function controller_drivingDynamics_actuators_electronicDiffLock.shutdown() end

--- Every frame: nothing useful. Debug variant: sends the values to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:110
---@param dt number Time step in seconds.
function controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt) end

--- Intermediate physics step: computes the corrected output speeds, the braking coefficient (PID) and adds the braking torque to the wheels on the slipping side.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua:53
---@param dt number Step in seconds.
function controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_electronicDiffLock
