---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface fourre-tout : test de connexion (ping) et ouverture/fermeture des verrous des contrôleurs de coupleurs avancés (advancedCouplerControl).
--- Accès : extension `gameplayInterfaceModules_interactMisc` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactMisc")`, puis la globale `gameplayInterfaceModules_interactMisc`
---@class gameplayInterfaceModules_interactMisc
---@field moduleActions table<string, function> Actions : latchesOpen, latchesClose.
---@field moduleLookups table<string, function> Lookups : ping.
gameplayInterfaceModules_interactMisc = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua:34
function gameplayInterfaceModules_interactMisc.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua:30
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactMisc.requestRegistration(gi) end

