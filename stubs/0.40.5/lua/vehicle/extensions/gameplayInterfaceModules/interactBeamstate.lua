---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module giving access to beamstate: remote call of a beamstate function without arguments by its name, and reading of a coupler's offset. The actions and lookups are registered with gameplayInterface.
--- Access: extension `gameplayInterfaceModules_interactBeamstate`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactBeamstate")`, then the global `gameplayInterfaceModules_interactBeamstate`
---@class gameplayInterfaceModules_interactBeamstate
---@field moduleActions table<string, function> Exposed actions: interactBeamstate.
---@field moduleLookups table<string, function> Exposed lookups: couplerOffset.
gameplayInterfaceModules_interactBeamstate = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua:36
function gameplayInterfaceModules_interactBeamstate.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua:32
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactBeamstate.requestRegistration(gi) end

