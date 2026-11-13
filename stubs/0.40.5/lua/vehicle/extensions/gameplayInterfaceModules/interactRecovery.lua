---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface donnant accès au système de récupération (recovery) : appel à distance d'une fonction sans argument du module recovery par son nom.
--- Accès : extension `gameplayInterfaceModules_interactRecovery` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactRecovery")`, puis la globale `gameplayInterfaceModules_interactRecovery`
---@class gameplayInterfaceModules_interactRecovery
---@field moduleActions table<string, function> Actions : interactRecovery.
---@field moduleLookups table<string, function> Lookups : aucun.
gameplayInterfaceModules_interactRecovery = {}

--- Appelé au chargement : remplit moduleActions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua:26
function gameplayInterfaceModules_interactRecovery.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua:22
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactRecovery.requestRegistration(gi) end

