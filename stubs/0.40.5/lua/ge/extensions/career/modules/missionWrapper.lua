---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/missionWrapper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fait le lien entre le système de missions (gameplay_missions_*) et la sauvegarde de carrière. Les données de progression des missions sont stockées dans <save>/career/missions/ ; le module suit les missions « sales » (modifiées) et les écrit à chaque sauvegarde du profil. Il déclenche aussi une sauvegarde avant et après une mission si l'autosauvegarde est active.
--- Accès : extension `career_modules_missionWrapper` : `extensions.load("career_modules_missionWrapper")`, puis la globale `career_modules_missionWrapper`
---@class career_modules_missionWrapper
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_missionWrapper = {}

--- Marque la mission comme modifiée (à sauvegarder) avec la date donnée ou la date UTC courante.
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:46
---@param id string Identifiant de la mission.
---@param dirtyDate string|nil Date ISO 8601, maintenant par défaut.
function career_modules_missionWrapper.cacheMissionData(id, dirtyDate) end

--- Hook : à l'état "stopped", réinitialise l'état du joueur et, si l'autosauvegarde est active, sauvegarde la mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:59
---@param state string État de la mission.
---@param mission table|nil Mission concernée.
function career_modules_missionWrapper.onAnyMissionChanged(state, mission) end

--- Hook : si la carrière est active, fixe le chemin de sauvegarde des missions et recharge le système de missions (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:20
function career_modules_missionWrapper.onExtensionLoaded() end

--- Hook : retire le chemin de sauvegarde des missions et recharge le système de missions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:27
function career_modules_missionWrapper.onExtensionUnloaded() end

--- Hook appelé quand les données d'une mission sont chargées : les enregistre comme suivies.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:50
---@param id string Identifiant de la mission.
---@param dirtyDate string|nil Date associée.
function career_modules_missionWrapper.onMissionLoaded(id, dirtyDate) end

--- Hook de sauvegarde : écrit les données de chaque mission modifiée dans career/missions/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:33
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath) end

--- Hook appelé quand la sauvegarde du véhicule est finie : débloque l'étape de démarrage de mission en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:69
function career_modules_missionWrapper.onVehicleSaveFinished() end

--- Étape appelée avant le démarrage d'une mission : si l'autosauvegarde est active, sauvegarde et attend onVehicleSaveFinished pour mettre step.handlingComplete = true ; sinon marque directement l'étape comme terminée.
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:76
---@param step table Étape de démarrage de mission (champ handlingComplete).
---@param task any Non utilisé.
function career_modules_missionWrapper.preMissionHandling(step, task) end

--- Marque la mission comme modifiée et lance une sauvegarde de carrière complète (career_saveSystem.saveCurrent).
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:54
---@param id string Identifiant de la mission.
function career_modules_missionWrapper.saveMission(id) end

