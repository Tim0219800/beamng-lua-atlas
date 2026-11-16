---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for the controller system: send a gameplay event to the controllers, freeze the vehicle, change the gearbox mode, shift a gear and read the gearbox mode or the freeze state.
--- Access: extension `gameplayInterfaceModules_interactController`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactController")`, then the global `gameplayInterfaceModules_interactController`
---@class gameplayInterfaceModules_interactController
---@field moduleActions table<string, function> Actions: controllerGameplayEvent, setFreeze, setGearboxMode, shiftToGearIndex.
---@field moduleLookups table<string, function> Lookups: mainController.
gameplayInterfaceModules_interactController = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua:65
function gameplayInterfaceModules_interactController.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua:61
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactController.requestRegistration(gi) end

