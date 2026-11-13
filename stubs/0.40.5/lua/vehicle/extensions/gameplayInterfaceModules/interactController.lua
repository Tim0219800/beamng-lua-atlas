---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour le système de contrôleurs : envoyer un événement gameplay aux contrôleurs, geler le véhicule, changer le mode de boîte, passer un rapport et lire le mode de boîte ou l'état de gel.
--- Accès : extension `gameplayInterfaceModules_interactController` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactController")`, puis la globale `gameplayInterfaceModules_interactController`
---@class gameplayInterfaceModules_interactController
---@field moduleActions table<string, function> Actions : controllerGameplayEvent, setFreeze, setGearboxMode, shiftToGearIndex.
---@field moduleLookups table<string, function> Lookups : mainController.
gameplayInterfaceModules_interactController = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua:65
function gameplayInterfaceModules_interactController.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua:61
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactController.requestRegistration(gi) end

