# `career_modules_milestones_generalMilestones_missions`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua` · VM : Game Engine (GE) · 347 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_missions` : `extensions.load("career_modules_milestones_generalMilestones_missions")`, puis la globale `career_modules_milestones_generalMilestones_missions`

Jalons liés aux missions de la carrière. Pour l'ensemble des missions showInCareer puis pour chaque branche (déduite de gameplay_missions_unlocks.getForwardMissionInfo(...).branchTags), crée trois jalons : étoiles collectées (mission_totalStarCount / mission_totalStar_branch_<b>), missions réussies avec au moins une étoile par défaut (mission_passMissions[_<b>]) et missions complétées à 100 % des étoiles (mission_completeMissions[_<b>]). Six paliers : 10, 18, 30, 54, 74 et 100 % du total (arrondi au supérieur). Notifie à la fin d'une mission (état stopped).

## Remarques

- Seul mission_totalStarCount (global) a le filtre general et la récompense majorLinear ; les autres utilisent minorLinear.
- makeUnlockMissionsMilestones (jalon mission_unlockMissions) est défini mais son appel est commenté dans onGeneralMilestonesCollect ; de même onMissionUnlocked n'est pas exporté (inactif).
- missionIdToMilestonesList et milestoneConfigs ne sont jamais vidés entre deux onGeneralMilestonesCollect : une réactivation de la carrière peut dupliquer les jalons dans ces tables.
- Les étoiles utilisent mission.careerSetup._activeStarCache (defaultStarCount + bonusStarCount) pour le total et gameplay_missions_progress.getUnlockedStarCountsForMissionById pour la progression.

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `gameplay_missions_progress`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList)` | Crée les trois jalons globaux (étoiles, missions réussies, missions complétées), les enregistre pour chaque mission concernée et les ajoute à milestonesList. | 48 |
| `career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList)` | Crée les trois mêmes jalons pour une branche (ou compétence) donnée, avec le nom de la branche dans les libellés. | 157 |
| `career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList)` | Crée un jalon de déblocage de missions (mission_unlockMissions, cible (step+1)). Non utilisé : son appel est commenté. | 267 |
| `career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission)` | Hook appelé quand l'état d'une mission change ; à l'état "stopped", vérifie les jalons liés à cette mission, notifie les paliers atteints et avance notificationStep. *(interne)* *(hook)* | 311 |
| `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList)` | Hook : rassemble les missions de carrière, les groupe par branche et crée les jalons globaux puis par branche. *(interne)* *(hook)* | 20 |
| `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesSetupCallbacks()` | Hook : fixe la cible de notification de chaque jalon de mission. *(interne)* *(hook)* | 293 |
| `career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone)` | Stocke dans milestone._target la cible du prochain palier à notifier (rien si tous notifiés). | 301 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList)`

Crée les trois jalons globaux (étoiles, missions réussies, missions complétées), les enregistre pour chaque mission concernée et les ajoute à milestonesList.

- `missions` (*table[]*) : Missions de carrière.
- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList)`

Crée les trois mêmes jalons pour une branche (ou compétence) donnée, avec le nom de la branche dans les libellés.

- `missions` (*table[]*) : Missions de la branche.
- `branchKey` (*string*) : Identifiant de branche (career_branches.getBranchById).
- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList)`

Crée un jalon de déblocage de missions (mission_unlockMissions, cible (step+1)). Non utilisé : son appel est commenté.

- `missions` (*table[]*) : Missions de carrière.
- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission)`

Hook appelé quand l'état d'une mission change ; à l'état "stopped", vérifie les jalons liés à cette mission, notifie les paliers atteints et avance notificationStep.

- `state` (*string*) : État de la mission (stopped...).
- `mission` (*table*) : Mission concernée (id).

#### `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList)`

Hook : rassemble les missions de carrière, les groupe par branche et crée les jalons globaux puis par branche.

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone)`

Stocke dans milestone._target la cible du prochain palier à notifier (rien si tous notifiés).

- `milestone` (*table*) : Configuration du jalon.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : gameplay_missions_missions, gameplay_missions_progress. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua`.*
