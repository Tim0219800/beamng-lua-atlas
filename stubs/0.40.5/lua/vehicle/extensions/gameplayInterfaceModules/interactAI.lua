---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour l'IA : lit ou fixe le mode d'IA du véhicule courant et peut commander l'IA de tous les autres véhicules en les faisant fuir, suivre, poursuivre, se déplacer au hasard ou s'arrêter. Déclare ses actions et lookups à gameplayInterface au chargement (requestRegistration).
--- Accès : extension `gameplayInterfaceModules_interactAI` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactAI")`, puis la globale `gameplayInterfaceModules_interactAI`
---@class gameplayInterfaceModules_interactAI
---@field moduleActions table<string, function> Actions exposées : setAIMode, setOtherVehiclesAIMode (remplie à onExtensionLoaded).
---@field moduleLookups table<string, function> Lookups exposés : aiMode.
gameplayInterfaceModules_interactAI = {}

--- Appelé au chargement de l'extension : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua:72
function gameplayInterfaceModules_interactAI.onExtensionLoaded() end

--- Appelé par gameplayInterface au démarrage : enregistre les actions et lookups du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua:68
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactAI.requestRegistration(gi) end

