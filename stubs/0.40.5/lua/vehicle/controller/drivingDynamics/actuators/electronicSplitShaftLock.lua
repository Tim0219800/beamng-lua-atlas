---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: electronic locking of a split shaft (Haldex-type transfer clutch). At each intermediate physics step, it compares the input speed to that of the secondary output (`secondaryOutputAVName`); a PID sets the shaft's clutch ratio `clutchRatio` (0..1) to reduce the difference. The locking is cut when braking or without throttle (except left-foot braking), frozen during a gear change, with a possible minimum, and zero with the parking brake. Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/electronicSplitShaftLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_electronicSplitShaftLock
---@field defaultOrder number 80.
---@field isActing boolean true if the clutch ratio exceeds 0.01.
---@field isActive boolean true if the split shaft was found.
---@field overrideMax number Upper bound of the clutch ratio (1 by default).
---@field overrideMin number Lower bound of the clutch ratio (0 by default).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_electronicSplitShaftLock = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:229
---@return table  Deep copy.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig() end

--- Reads the jbeam parameters and creates the clutch PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:146
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData) end

--- Finds the split shaft (`splitShaftName`) and enables the system.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:175
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData) end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:203
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu) end

--- Resets isActing and the override bounds to their initial value.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:140
function controller_drivingDynamics_actuators_electronicSplitShaftLock.reset() end

--- Resets the override bounds to 0 and 1.
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:46
function controller_drivingDynamics_actuators_electronicSplitShaftLock.resetOverride() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:233
function controller_drivingDynamics_actuators_electronicSplitShaftLock.sendConfigData() end

--- Replaces the whole parameter table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:225
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable) end

--- Enables or disables sending debug packets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:197
---@param debugEnabled boolean true to send.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled) end

--- Changes avDiffThreshold, avThreshold, minimumLock, isEnabled and clutchPIDkP/kI/kD at runtime (via CMU.applyParameter).
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:207
---@param parameters table Table of parameters to change.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters) end

--- Stops the actuator.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:133
function controller_drivingDynamics_actuators_electronicSplitShaftLock.shutdown() end

--- Every frame: nothing useful. Debug variant: sends the values to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:106
---@param dt number Time step in seconds.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt) end

--- Intermediate physics step: computes the clutch ratio (PID, driving conditions, override) and writes it to the split shaft's `clutchRatio`.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua:51
---@param dt number Step in seconds.
function controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_electronicSplitShaftLock
