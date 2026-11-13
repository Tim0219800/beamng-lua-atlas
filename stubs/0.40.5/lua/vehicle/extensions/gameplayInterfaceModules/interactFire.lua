---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface donnant accès au système d'incendie : appel à distance d'une fonction sans argument du module fire par son nom.
--- Accès : extension `gameplayInterfaceModules_interactFire` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactFire")`, puis la globale `gameplayInterfaceModules_interactFire`
---@class gameplayInterfaceModules_interactFire
---@field moduleActions table<string, function> Actions : interactFire.
---@field moduleLookups table<string, function> Lookups : aucun.
gameplayInterfaceModules_interactFire = {}

--- Appelé au chargement : remplit moduleActions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua:26
function gameplayInterfaceModules_interactFire.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua:22
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactFire.requestRegistration(gi) end

