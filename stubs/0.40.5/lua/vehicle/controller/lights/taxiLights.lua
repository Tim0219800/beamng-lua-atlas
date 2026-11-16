---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lights/taxiLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for the taxi sign (type "auxiliary"). It stores a state among available, occupied, reserved, offDuty (default), driverDistress and exposes each state as an electrics value named "<controllerName>_<state>" equal to 1 for the active state and 0 for the others.
--- Access: controller `lights/taxiLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_lights_taxiLights
---@field type string "auxiliary".
local controller_lights_taxiLights = {}

--- Returns the state for saving.
---Source: lua/vehicle/controller/lights/taxiLights.lua:57
---@return table  State table (reused).
function controller_lights_taxiLights.getState() end

--- Returns the current state.
---Source: lua/vehicle/controller/lights/taxiLights.lua:35
---@return string  Sign state.
function controller_lights_taxiLights.getTaxiState() end

--- Initializes the offDuty state and the electrics names.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lights/taxiLights.lua:43
---@param jbeamData table Controller jbeam data.
function controller_lights_taxiLights.init(jbeamData) end

--- Resets to the offDuty state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lights/taxiLights.lua:39
---@param jbeamData table Controller jbeam data.
function controller_lights_taxiLights.reset(jbeamData) end

--- Restores the state returned by getState (if valid).
---Source: lua/vehicle/controller/lights/taxiLights.lua:62
---@param data table|nil State table.
function controller_lights_taxiLights.setState(data) end

--- Changes the sign's state.
---Source: lua/vehicle/controller/lights/taxiLights.lua:31
---@param state string "available", "occupied", "reserved", "offDuty" or "driverDistress".
function controller_lights_taxiLights.setTaxiState(state) end

--- Writes the 0/1 electrics values of each state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/lights/taxiLights.lua:24
---@param dt number Time step (s).
function controller_lights_taxiLights.updateGFX(dt) end

return controller_lights_taxiLights
