---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour energyStorage : fixer l'énergie stockée d'un réservoir et lister tous les stockages avec leur énergie courante et maximale.
--- Accès : extension `gameplayInterfaceModules_interactEnergyStorage` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactEnergyStorage")`, puis la globale `gameplayInterfaceModules_interactEnergyStorage`
---@class gameplayInterfaceModules_interactEnergyStorage
---@field moduleActions table<string, function> Actions : setEnergyStorageEnergy.
---@field moduleLookups table<string, function> Lookups : energyStorage.
gameplayInterfaceModules_interactEnergyStorage = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua:44
function gameplayInterfaceModules_interactEnergyStorage.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua:40
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi) end

