---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour electrics : fixer le niveau d'allumage, le mode de la barre lumineuse et l'état des phares, et lire n'importe quelle valeur de electrics.values.
--- Accès : extension `gameplayInterfaceModules_interactElectrics` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactElectrics")`, puis la globale `gameplayInterfaceModules_interactElectrics`
---@class gameplayInterfaceModules_interactElectrics
---@field moduleActions table<string, function> Actions : setIgnitionLevel, setLightbarMode, setLightMode.
---@field moduleLookups table<string, function> Lookups : electricsValue.
gameplayInterfaceModules_interactElectrics = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua:51
function gameplayInterfaceModules_interactElectrics.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua:47
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactElectrics.requestRegistration(gi) end

