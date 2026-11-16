---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for electrics: set the ignition level, the light bar mode and the headlight state, and read any value of electrics.values.
--- Access: extension `gameplayInterfaceModules_interactElectrics`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactElectrics")`, then the global `gameplayInterfaceModules_interactElectrics`
---@class gameplayInterfaceModules_interactElectrics
---@field moduleActions table<string, function> Actions: setIgnitionLevel, setLightbarMode, setLightMode.
---@field moduleLookups table<string, function> Lookups: electricsValue.
gameplayInterfaceModules_interactElectrics = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua:51
function gameplayInterfaceModules_interactElectrics.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua:47
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactElectrics.requestRegistration(gi) end

