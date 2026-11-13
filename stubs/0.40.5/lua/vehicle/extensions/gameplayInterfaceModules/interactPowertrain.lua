---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour powertrain : lecture d'une propriété d'un périphérique du groupe motopropulseur par son nom.
--- Accès : extension `gameplayInterfaceModules_interactPowertrain` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactPowertrain")`, puis la globale `gameplayInterfaceModules_interactPowertrain`
---@class gameplayInterfaceModules_interactPowertrain
---@field moduleActions table<string, function> Vide.
---@field moduleLookups table<string, function> Lookups : powertrainDevice.
gameplayInterfaceModules_interactPowertrain = {}

--- Appelé au chargement : enregistre le lookup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua:26
function gameplayInterfaceModules_interactPowertrain.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua:22
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactPowertrain.requestRegistration(gi) end

