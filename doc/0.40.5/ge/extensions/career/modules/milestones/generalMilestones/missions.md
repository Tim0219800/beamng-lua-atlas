# `career_modules_milestones_generalMilestones_missions`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua` · VM: Game Engine (GE) · 347 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_missions`: `extensions.load("career_modules_milestones_generalMilestones_missions")`, then the global `career_modules_milestones_generalMilestones_missions`

Milestones related to career missions. For the set of showInCareer missions, then for each branch (inferred from gameplay_missions_unlocks.getForwardMissionInfo(...).branchTags), creates three milestones: stars collected (mission_totalStarCount / mission_totalStar_branch_<b>), missions passed with at least one default star (mission_passMissions[_<b>]) and missions completed at 100% of stars (mission_completeMissions[_<b>]). Six tiers: 10, 18, 30, 54, 74 and 100% of the total (rounded up). Notifies at the end of a mission (stopped state).

## Notes

- Only mission_totalStarCount (global) has the general filter and the majorLinear reward; the others use minorLinear.
- makeUnlockMissionsMilestones (milestone mission_unlockMissions) is defined but its call is commented out in onGeneralMilestonesCollect; likewise onMissionUnlocked is not exported (inactive).
- missionIdToMilestonesList and milestoneConfigs are never cleared between two onGeneralMilestonesCollect calls: reactivating the career may duplicate milestones in these tables.
- Stars use mission.careerSetup._activeStarCache (defaultStarCount + bonusStarCount) for the total and gameplay_missions_progress.getUnlockedStarCountsForMissionById for progress.

**Dependencies (loaded first):** `gameplay_missions_missions`, `gameplay_missions_progress`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList)` | Creates the three global milestones (stars, missions passed, missions completed), registers them for each relevant mission and adds them to milestonesList. | 48 |
| `career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList)` | Creates the same three milestones for a given branch (or skill), with the branch name in the labels. | 157 |
| `career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList)` | Creates a mission unlock milestone (mission_unlockMissions, target (step+1)). Unused: its call is commented out. | 267 |
| `career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission)` | Hook called when a mission's state changes; in the "stopped" state, checks the milestones related to that mission, notifies the reached tiers and advances notificationStep. *(internal)* *(hook)* | 311 |
| `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList)` | Hook: gathers career missions, groups them by branch and creates the global then per-branch milestones. *(internal)* *(hook)* | 20 |
| `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesSetupCallbacks()` | Hook: sets the notification target of each mission milestone. *(internal)* *(hook)* | 293 |
| `career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone)` | Stores in milestone._target the target of the next tier to notify (nothing if all are notified). | 301 |

### Parameter details

#### `career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList)`

Creates the three global milestones (stars, missions passed, missions completed), registers them for each relevant mission and adds them to milestonesList.

- `missions` (*table[]*) : Career missions.
- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList)`

Creates the same three milestones for a given branch (or skill), with the branch name in the labels.

- `missions` (*table[]*) : Branch missions.
- `branchKey` (*string*) : Branch identifier (career_branches.getBranchById).
- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList)`

Creates a mission unlock milestone (mission_unlockMissions, target (step+1)). Unused: its call is commented out.

- `missions` (*table[]*) : Career missions.
- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission)`

Hook called when a mission's state changes; in the "stopped" state, checks the milestones related to that mission, notifies the reached tiers and advances notificationStep.

- `state` (*string*) : Mission state (stopped...).
- `mission` (*table*) : Mission concerned (id).

#### `career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList)`

Hook: gathers career missions, groups them by branch and creates the global then per-branch milestones.

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone)`

Stores in milestone._target the target of the next tier to notify (nothing if all are notified).

- `milestone` (*table*) : Milestone configuration.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: gameplay_missions_missions, gameplay_missions_progress. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua`.*
