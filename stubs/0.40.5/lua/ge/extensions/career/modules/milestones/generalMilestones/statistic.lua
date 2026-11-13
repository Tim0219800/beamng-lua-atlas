---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_milestones_generalMilestones_statistic` : `extensions.load("career_modules_milestones_generalMilestones_statistic")`, puis la globale `career_modules_milestones_generalMilestones_statistic`
---@class career_modules_milestones_generalMilestones_statistic
career_modules_milestones_generalMilestones_statistic = {}

--- statistic callback functions
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:88
---@param milestone any
function career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone) end

--- after a milestone is claimed, also re-register the watch
---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone any
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone) end

---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:8
---@param milestonesList any
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList) end

---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:81
---@param milestone any
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone) end

---Source : lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone any
function career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone) end

