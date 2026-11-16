---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for powertrain: reads a property of a powertrain device by its name.
--- Access: extension `gameplayInterfaceModules_interactPowertrain`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactPowertrain")`, then the global `gameplayInterfaceModules_interactPowertrain`
---@class gameplayInterfaceModules_interactPowertrain
---@field moduleActions table<string, function> Empty.
---@field moduleLookups table<string, function> Lookups: powertrainDevice.
gameplayInterfaceModules_interactPowertrain = {}

--- Called on load: registers the lookup.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua:26
function gameplayInterfaceModules_interactPowertrain.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua:22
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactPowertrain.requestRegistration(gi) end

