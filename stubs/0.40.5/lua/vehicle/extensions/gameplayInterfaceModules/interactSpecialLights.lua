---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for special lights: reads and sets the taxi light state via the 'lights/taxiLights' controllers.
--- Access: extension `gameplayInterfaceModules_interactSpecialLights`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactSpecialLights")`, then the global `gameplayInterfaceModules_interactSpecialLights`
---@class gameplayInterfaceModules_interactSpecialLights
---@field moduleActions table<string, function> Actions: setTaxiLightState.
---@field moduleLookups table<string, function> Lookups: taxiLightState.
gameplayInterfaceModules_interactSpecialLights = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua:36
function gameplayInterfaceModules_interactSpecialLights.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua:32
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi) end

