---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jalons liés aux missions de la carrière. Pour l'ensemble des missions showInCareer puis pour chaque branche (déduite de gameplay_missions_unlocks.getForwardMissionInfo(...).branchTags), crée trois jalons : étoiles collectées (mission_totalStarCount / mission_totalStar_branch_<b>), missions réussies avec au moins une étoile par défaut (mission_passMissions[_<b>]) et missions complétées à 100 % des étoiles (mission_completeMissions[_<b>]). Six paliers : 10, 18, 30, 54, 74 et 100 % du total (arrondi au supérieur). Notifie à la fin d'une mission (état stopped).
--- Accès : extension `career_modules_milestones_generalMilestones_missions` : `extensions.load("career_modules_milestones_generalMilestones_missions")`, puis la globale `career_modules_milestones_generalMilestones_missions`
---@class career_modules_milestones_generalMilestones_missions
---@field dependencies table<integer, string> Extensions chargées avant : gameplay_missions_missions, gameplay_missions_progress.
career_modules_milestones_generalMilestones_missions = {}

--- Crée les trois jalons globaux (étoiles, missions réussies, missions complétées), les enregistre pour chaque mission concernée et les ajoute à milestonesList.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:48
---@param missions table[] Missions de carrière.
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList) end

--- Crée les trois mêmes jalons pour une branche (ou compétence) donnée, avec le nom de la branche dans les libellés.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:157
---@param missions table[] Missions de la branche.
---@param branchKey string Identifiant de branche (career_branches.getBranchById).
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList) end

--- Crée un jalon de déblocage de missions (mission_unlockMissions, cible (step+1)). Non utilisé : son appel est commenté.
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:267
---@param missions table[] Missions de carrière.
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList) end

--- Hook appelé quand l'état d'une mission change ; à l'état "stopped", vérifie les jalons liés à cette mission, notifie les paliers atteints et avance notificationStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:311
---@param state string État de la mission (stopped...).
---@param mission table Mission concernée (id).
function career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission) end

--- Hook : rassemble les missions de carrière, les groupe par branche et crée les jalons globaux puis par branche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:20
---@param milestonesList table[] Liste à compléter.
function career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList) end

--- Hook : fixe la cible de notification de chaque jalon de mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:293
function career_modules_milestones_generalMilestones_missions.onGeneralMilestonesSetupCallbacks() end

--- Stocke dans milestone._target la cible du prochain palier à notifier (rien si tous notifiés).
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:301
---@param milestone table Configuration du jalon.
function career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone) end

