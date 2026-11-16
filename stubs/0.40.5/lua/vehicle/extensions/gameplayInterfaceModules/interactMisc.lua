---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catch-all gameplayInterface module: connection test (ping) and opening/closing of the latches of advanced coupler controllers (advancedCouplerControl).
--- Access: extension `gameplayInterfaceModules_interactMisc`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactMisc")`, then the global `gameplayInterfaceModules_interactMisc`
---@class gameplayInterfaceModules_interactMisc
---@field moduleActions table<string, function> Actions: latchesOpen, latchesClose.
---@field moduleLookups table<string, function> Lookups: ping.
gameplayInterfaceModules_interactMisc = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua:34
function gameplayInterfaceModules_interactMisc.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua:30
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactMisc.requestRegistration(gi) end

