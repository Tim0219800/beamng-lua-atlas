---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Milestones related to career missions. For the set of showInCareer missions, then for each branch (inferred from gameplay_missions_unlocks.getForwardMissionInfo(...).branchTags), creates three milestones: stars collected (mission_totalStarCount / mission_totalStar_branch_<b>), missions passed with at least one default star (mission_passMissions[_<b>]) and missions completed at 100% of stars (mission_completeMissions[_<b>]). Six tiers: 10, 18, 30, 54, 74 and 100% of the total (rounded up). Notifies at the end of a mission (stopped state).
--- Access: extension `career_modules_milestones_generalMilestones_missions`: `extensions.load("career_modules_milestones_generalMilestones_missions")`, then the global `career_modules_milestones_generalMilestones_missions`
---@class career_modules_milestones_generalMilestones_missions
---@field dependencies table<integer, string> Extensions loaded before: gameplay_missions_missions, gameplay_missions_progress.
career_modules_milestones_generalMilestones_missions = {}

--- Creates the three global milestones (stars, missions passed, missions completed), registers them for each relevant mission and adds them to milestonesList.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:48
---@param missions table[] Career missions.
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_missions.makeAllMissionStarMilestones(missions, milestonesList) end

--- Creates the same three milestones for a given branch (or skill), with the branch name in the labels.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:157
---@param missions table[] Branch missions.
---@param branchKey string Branch identifier (career_branches.getBranchById).
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_missions.makeBranchMissionStarMilestones(missions, branchKey, milestonesList) end

--- Creates a mission unlock milestone (mission_unlockMissions, target (step+1)). Unused: its call is commented out.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:267
---@param missions table[] Career missions.
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_missions.makeUnlockMissionsMilestones(missions, milestonesList) end

--- Hook called when a mission's state changes; in the "stopped" state, checks the milestones related to that mission, notifies the reached tiers and advances notificationStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:311
---@param state string Mission state (stopped...).
---@param mission table Mission concerned (id).
function career_modules_milestones_generalMilestones_missions.onAnyMissionChanged(state, mission) end

--- Hook: gathers career missions, groups them by branch and creates the global then per-branch milestones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:20
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_missions.onGeneralMilestonesCollect(milestonesList) end

--- Hook: sets the notification target of each mission milestone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:293
function career_modules_milestones_generalMilestones_missions.onGeneralMilestonesSetupCallbacks() end

--- Stores in milestone._target the target of the next tier to notify (nothing if all are notified).
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/missions.lua:301
---@param milestone table Milestone configuration.
function career_modules_milestones_generalMilestones_missions.setNotificationTarget(milestone) end

