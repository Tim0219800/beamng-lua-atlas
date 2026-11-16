---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career money milestones. Each milestone accumulates, for a mode (gains or losses) and tags, the amounts tracked by career_modules_playerAttributes.getAttribute("money")[mode][tag] (absolute value). Seven milestones: gains (tag reward), spending (buying), parts bought (partsBought), vehicles bought (vehicleBought), sales (selling), deliveries (delivery), fines (fine). Two Steam achievements are tied to gains: FIRST_PAYCHECK (10,000) and SIX_FIGURES (100,000).
--- Access: extension `career_modules_milestones_generalMilestones_money`: `extensions.load("career_modules_milestones_generalMilestones_money")`, then the global `career_modules_milestones_generalMilestones_money`
---@class career_modules_milestones_generalMilestones_money
career_modules_milestones_generalMilestones_money = {}

--- Hook: creates one milestone per mode configuration and adds it to milestonesList (save data created if absent).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:75
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList) end

--- Hook: sets the notification target of each money milestone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:111
function career_modules_milestones_generalMilestones_money.onGeneralMilestonesSetupCallbacks() end

--- Hook: if the money attribute changed, checks each milestone, unlocks any achievements, notifies the reached tier and advances notificationStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:129
---@param change table<string, number> Change per attribute.
function career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change) end

--- Stores in milestoneConfig._target the target of the next tier to notify (nothing if all are notified).
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua:119
---@param milestoneConfig table Milestone configuration.
function career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig) end

