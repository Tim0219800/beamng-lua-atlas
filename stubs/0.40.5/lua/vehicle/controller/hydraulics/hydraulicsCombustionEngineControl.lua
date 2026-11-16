---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that raises the idle of a combustion engine and connects the hydraulic pump when a hydraulic function is commanded ("electricsRaiseAndConnect" mode). It watches electrics values, imposes idleAVOverwrite/maxIdleThrottleOverwrite on the engine, connects the pump (setConnected) once the RPM is high enough and writes a state electrics value. A manual idle raise is also possible.
--- Access: controller `hydraulics/hydraulicsCombustionEngineControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_hydraulicsCombustionEngineControl
---@field type string "auxiliary".
local controller_hydraulics_hydraulicsCombustionEngineControl = {}

--- Returns the state (manual raise).
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:113
---@return table  State table.
function controller_hydraulics_hydraulicsCombustionEngineControl.getState() end

--- Reads the configuration, finds the engine and the pump and enables the control loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:72
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData) end

--- Disables the manual raise.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:68
---@param jbeamData table Jbeam data.
function controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData) end

--- Enables/disables the manual idle raise.
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:60
---@param enabled boolean True to raise.
function controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled) end

--- Restores the state returned by getState.
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:118
---@param data table|nil State table.
function controller_hydraulics_hydraulicsCombustionEngineControl.setState(data) end

--- Toggles the manual idle raise.
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:64
function controller_hydraulics_hydraulicsCombustionEngineControl.toggleIdleRaise() end

--- Applies the idle raise and the pump connection (dynamically defined at init). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua:dyn
---@param dt number Time step (s).
function controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt) end

return controller_hydraulics_hydraulicsCombustionEngineControl
