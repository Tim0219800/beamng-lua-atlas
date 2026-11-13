---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour les conteneurs de cargaison (section jbeam cargoStorage) : permet au gameplay GE de remplir virtuellement les conteneurs (volume et densité cibles) et de lire leur état. Le remplissage est lissé dans le temps et se traduit par des changements de masse des nœuds et de raideur/amortissement/résistance des poutres liés au groupe via des fonctions jbeam (nodeWeightFunction, beamSpringFunction…).
--- Accès : extension `gameplayInterfaceModules_interactCargoContainers` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactCargoContainers")`, puis la globale `gameplayInterfaceModules_interactCargoContainers`
---@class gameplayInterfaceModules_interactCargoContainers
---@field moduleActions table<string, function> Actions exposées : setCargoContainers.
---@field moduleLookups table<string, function> Lookups exposés : getCargoContainers.
gameplayInterfaceModules_interactCargoContainers = {}

--- Appelé au chargement : désactive la mise à jour, remplit moduleActions/moduleLookups et vide le cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:332
function gameplayInterfaceModules_interactCargoContainers.onExtensionLoaded() end

--- Appelé au reset du véhicule : désactive la mise à jour et vide le cache des conteneurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:340
function gameplayInterfaceModules_interactCargoContainers.onReset() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:328
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi) end

--- Active ou désactive la boucle updateGFX de cette extension (avec extensions.hookUpdate('updateGFX')).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:238
---@param enabled boolean true pour démarrer le lissage des conteneurs.
function gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled) end

--- Appelé chaque frame pendant le remplissage : fait avancer les lisseurs de chaque conteneur n'ayant pas atteint sa cible et applique masses/propriétés de poutres ; se désactive quand tout est à la cible. Vaut nop sinon. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:dyn
---@param dtSim number Pas de temps de simulation en secondes.
function gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim) end

