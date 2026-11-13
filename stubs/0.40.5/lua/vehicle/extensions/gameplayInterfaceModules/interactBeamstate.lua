---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface donnant accès à beamstate : appel à distance d'une fonction sans argument de beamstate par son nom, et lecture du décalage d'un coupleur. Les actions et lookups sont enregistrés auprès de gameplayInterface.
--- Accès : extension `gameplayInterfaceModules_interactBeamstate` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactBeamstate")`, puis la globale `gameplayInterfaceModules_interactBeamstate`
---@class gameplayInterfaceModules_interactBeamstate
---@field moduleActions table<string, function> Actions exposées : interactBeamstate.
---@field moduleLookups table<string, function> Lookups exposés : couplerOffset.
gameplayInterfaceModules_interactBeamstate = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua:36
function gameplayInterfaceModules_interactBeamstate.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua:32
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactBeamstate.requestRegistration(gi) end

