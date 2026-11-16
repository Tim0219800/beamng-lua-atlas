---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: variable-stiffness torsion bars (anti-roll). It groups torsion bars by name and, according to a named mode, applies multiplicative coefficients to their jbeam stiffness and damping via `obj:setTorsionbarSpringDamp`. The mode is chosen with `setParameters({torsionBarMode = "name"})`, typically from a `driveModes` mode of type "controller". Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/adaptiveTorsionBars` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_adaptiveTorsionBars
---@field defaultOrder number 80.
---@field isActing boolean false: never modified in this file.
---@field isActive boolean true after init.
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_adaptiveTorsionBars = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:103
---@return table  Deep copy ({isEnabled = true} by default).
function controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig() end

--- Finds the torsion bars by name and reads the modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:43
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:76
function controller_drivingDynamics_actuators_adaptiveTorsionBars.initLastStage() end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:83
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu) end

--- Empty (the bars are not restored to their initial state).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:40
function controller_drivingDynamics_actuators_adaptiveTorsionBars.reset() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:107
function controller_drivingDynamics_actuators_adaptiveTorsionBars.sendConfigData() end

--- Replaces the parameter table (no effect on the modes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:99
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable) end

--- Stores the debug mode (no other effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:79
---@param debugEnabled boolean Debug mode state.
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled) end

--- Applies a stiffness mode if `parameters.torsionBarMode` is provided.
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:93
---@param parameters table Field: torsionBarMode (name of a mode defined in `modes`).
function controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters) end

--- Stops the actuator (isActive = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua:87
function controller_drivingDynamics_actuators_adaptiveTorsionBars.shutdown() end

return controller_drivingDynamics_actuators_adaptiveTorsionBars
