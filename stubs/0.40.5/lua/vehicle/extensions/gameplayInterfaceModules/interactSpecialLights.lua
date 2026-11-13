---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour les feux spéciaux : lecture et fixation de l'état du feu de taxi via les contrôleurs 'lights/taxiLights'.
--- Accès : extension `gameplayInterfaceModules_interactSpecialLights` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactSpecialLights")`, puis la globale `gameplayInterfaceModules_interactSpecialLights`
---@class gameplayInterfaceModules_interactSpecialLights
---@field moduleActions table<string, function> Actions : setTaxiLightState.
---@field moduleLookups table<string, function> Lookups : taxiLightState.
gameplayInterfaceModules_interactSpecialLights = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua:36
function gameplayInterfaceModules_interactSpecialLights.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua:32
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi) end

