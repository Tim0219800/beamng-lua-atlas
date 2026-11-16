---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for AI: reads or sets the current vehicle's AI mode and can command the AI of all other vehicles by making them flee, follow, chase, move randomly or stop. Declares its actions and lookups to gameplayInterface at load (requestRegistration).
--- Access: extension `gameplayInterfaceModules_interactAI`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactAI")`, then the global `gameplayInterfaceModules_interactAI`
---@class gameplayInterfaceModules_interactAI
---@field moduleActions table<string, function> Exposed actions: setAIMode, setOtherVehiclesAIMode (filled at onExtensionLoaded).
---@field moduleLookups table<string, function> Exposed lookups: aiMode.
gameplayInterfaceModules_interactAI = {}

--- Called when the extension loads: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua:72
function gameplayInterfaceModules_interactAI.onExtensionLoaded() end

--- Called by gameplayInterface at startup: registers the module's actions and lookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua:68
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactAI.requestRegistration(gi) end

