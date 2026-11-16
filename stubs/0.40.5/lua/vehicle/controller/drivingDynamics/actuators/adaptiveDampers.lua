---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: variable-damping dampers. It groups damper beams (by name) and, according to a named mode (Comfort, Sport...), applies multiplicative coefficients to their jbeam damping values via `obj:setBoundedBeamDamp`. The mode is chosen with `setParameters({damperMode = "name"})`, typically from a `driveModes` mode of type "controller". Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/adaptiveDampers` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_adaptiveDampers
---@field defaultOrder number 80.
---@field isActing boolean false: never modified in this file.
---@field isActive boolean true after init.
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_adaptiveDampers = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:110
---@return table  Deep copy ({isEnabled = true} by default).
function controller_drivingDynamics_actuators_adaptiveDampers.getConfig() end

--- Finds the damper beams by name and reads the modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:47
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:83
function controller_drivingDynamics_actuators_adaptiveDampers.initLastStage() end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:90
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu) end

--- Empty (the damping is not restored to its initial state).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:44
function controller_drivingDynamics_actuators_adaptiveDampers.reset() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:114
function controller_drivingDynamics_actuators_adaptiveDampers.sendConfigData() end

--- Replaces the parameter table (no effect on the modes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:106
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable) end

--- Stores the debug mode (no other effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:86
---@param debugEnabled boolean Debug mode state.
function controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled) end

--- Applies a damping mode if `parameters.damperMode` is provided.
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:100
---@param parameters table Field: damperMode (name of a mode defined in `modes`).
function controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters) end

--- Stops the actuator (isActive = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua:94
function controller_drivingDynamics_actuators_adaptiveDampers.shutdown() end

return controller_drivingDynamics_actuators_adaptiveDampers
