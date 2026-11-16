---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Milestones related to career deliveries: parcels, vehicles, trailers, fluids and dry bulk delivered; on-time, delayed or late deliveries (parcelMods "timed"); number of facilities served (deliverToMilestone) or that received deliveries (deliverFromMilestone). Values come from career_modules_delivery_progress and career_modules_delivery_parcelMods.
--- Access: extension `career_modules_milestones_generalMilestones_delivery`: `extensions.load("career_modules_milestones_generalMilestones_delivery")`, then the global `career_modules_milestones_generalMilestones_delivery`
---@class career_modules_milestones_generalMilestones_delivery
career_modules_milestones_generalMilestones_delivery = {}

--- Hook called when the delivery facility progress statistics change: checks each milestone, notifies the reached tiers and advances notificationStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:165
function career_modules_milestones_generalMilestones_delivery.onDeliveryFacilityProgressStatsChanged() end

--- Hook: builds the delivery milestone configurations and adds them to milestonesList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:71
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList) end

--- Hook: sets the notification target of each delivery milestone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:148
function career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesSetupCallbacks() end

--- Stores in milestoneConfig._target the target of the next tier to notify, unless all are notified.
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua:154
---@param milestoneConfig table Milestone configuration.
function career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig) end

