---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Milestones based on gameplay statistics (gameplay_statistic): distance traveled (vehicle/total_odometer.length, in m, 8 tiers from 10 to 300 km), career play time (general/mode/career.time, in s, 5 h tiers), rollovers (vehicle/rollover) and airtime (vehicle/airtime.time, in s). majorLinear reward. Notification relies on statistic callbacks registered for the next tier.
--- Access: extension `career_modules_milestones_generalMilestones_statistic`: `extensions.load("career_modules_milestones_generalMilestones_statistic")`, then the global `career_modules_milestones_generalMilestones_statistic`
---@class career_modules_milestones_generalMilestones_statistic
career_modules_milestones_generalMilestones_statistic = {}

--- Removes the milestone's statistic callback if it exists.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:88
---@param milestone table Milestone configuration.
function career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone) end

--- Hook called after a milestone is claimed: alias of registerStastisticCallback to re-register the watching.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone table Configuration of the claimed milestone.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone) end

--- Hook: builds the four statistic milestones (stat_distance, stat_playtime, stat_rollover, jump) and adds them to milestonesList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:8
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList) end

--- Hook: registers the statistic callback of each milestone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:81
---@param milestone any Not used.
function career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone) end

--- Registers a callback triggered when the watched statistic reaches the next tier's target; the callback notifies the milestone and stores notificationStep.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua:95
---@param milestone table Milestone configuration (watchStatisticKey, getTarget...).
function career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone) end

