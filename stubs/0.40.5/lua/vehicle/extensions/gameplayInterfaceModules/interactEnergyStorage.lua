---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for energyStorage: sets the stored energy of a tank and lists all storages with their current and maximum energy.
--- Access: extension `gameplayInterfaceModules_interactEnergyStorage`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactEnergyStorage")`, then the global `gameplayInterfaceModules_interactEnergyStorage`
---@class gameplayInterfaceModules_interactEnergyStorage
---@field moduleActions table<string, function> Actions: setEnergyStorageEnergy.
---@field moduleLookups table<string, function> Lookups: energyStorage.
gameplayInterfaceModules_interactEnergyStorage = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua:44
function gameplayInterfaceModules_interactEnergyStorage.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua:40
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi) end

