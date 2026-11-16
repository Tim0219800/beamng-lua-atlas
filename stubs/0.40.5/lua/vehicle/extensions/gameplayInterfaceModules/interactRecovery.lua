---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module giving access to the recovery system: remote call of an argument-less function of the recovery module by name.
--- Access: extension `gameplayInterfaceModules_interactRecovery`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactRecovery")`, then the global `gameplayInterfaceModules_interactRecovery`
---@class gameplayInterfaceModules_interactRecovery
---@field moduleActions table<string, function> Actions: interactRecovery.
---@field moduleLookups table<string, function> Lookups: none.
gameplayInterfaceModules_interactRecovery = {}

--- Called on load: fills moduleActions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua:26
function gameplayInterfaceModules_interactRecovery.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua:22
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactRecovery.requestRegistration(gi) end

