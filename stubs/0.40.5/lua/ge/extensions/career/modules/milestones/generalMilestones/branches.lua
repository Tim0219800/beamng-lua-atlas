---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career branch level and skill milestones. For each non-"isInDevelopment" branch of career_branches.getSortedBranches(), creates a branch_<id> milestone whose tiers are the levels (requiredValue). Branches give a majorLinear reward and also appear in the general filter; skills (isSkill) give a minorLinear reward. Notifies the player when the next level's threshold is reached.
--- Access: extension `career_modules_milestones_generalMilestones_branches`: `extensions.load("career_modules_milestones_generalMilestones_branches")`, then the global `career_modules_milestones_generalMilestones_branches`
---@class career_modules_milestones_generalMilestones_branches
---@field dependencies table<integer, string> Extensions loaded before: career_branches.
career_modules_milestones_generalMilestones_branches = {}

--- Hook: adds to milestonesList one milestone per branch/skill and creates its save data if absent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:16
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList) end

--- Hook: sets the next notification target of each branch milestone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:57
function career_modules_milestones_generalMilestones_branches.onGeneralMilestonesSetupCallbacks() end

--- Hook: when a branch attribute increases and exceeds the target, triggers onBranchTierReached, shows the milestone toast, advances notificationStep and recomputes the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:76
---@param change table<string, number> Change per attribute.
function career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change) end

--- Computes the target of the next tier to notify (notificationStep + 1) and stores it in milestoneConfig._target; does nothing if all tiers are notified.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua:65
---@param attKey string Branch attribute key.
function career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey) end

