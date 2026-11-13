---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface pour partCondition : initialiser ou lire les conditions des pièces (odomètre, intégrité, visuel, peintures par défaut), lire l'odomètre de la pièce racine et gérer les instantanés (snapshots) de condition, y compris celui utilisé au reset.
--- Accès : extension `gameplayInterfaceModules_interactPartCondition` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactPartCondition")`, puis la globale `gameplayInterfaceModules_interactPartCondition`
---@class gameplayInterfaceModules_interactPartCondition
---@field moduleActions table<string, function> Actions : initPartConditions, ensurePartConditionsInit, createPartConditionSnapshot, applyPartConditionSnapshot, deletePartConditionSnapshots, setPartConditionResetSnapshotKey, createAndSetPartConditionResetSnapshotKey.
---@field moduleLookups table<string, function> Lookups : getPartConditions, getRootPartOdometer.
gameplayInterfaceModules_interactPartCondition = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua:99
function gameplayInterfaceModules_interactPartCondition.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua:95
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactPartCondition.requestRegistration(gi) end

