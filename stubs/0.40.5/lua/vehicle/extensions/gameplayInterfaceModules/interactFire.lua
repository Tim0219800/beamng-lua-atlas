---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module giving access to the fire system: remote call of an argument-less function of the fire module by name.
--- Access: extension `gameplayInterfaceModules_interactFire`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactFire")`, then the global `gameplayInterfaceModules_interactFire`
---@class gameplayInterfaceModules_interactFire
---@field moduleActions table<string, function> Actions: interactFire.
---@field moduleLookups table<string, function> Lookups: none.
gameplayInterfaceModules_interactFire = {}

--- Called on load: fills moduleActions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua:26
function gameplayInterfaceModules_interactFire.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua:22
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactFire.requestRegistration(gi) end

