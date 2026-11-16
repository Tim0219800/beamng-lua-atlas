---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Milestone on the number of insurance repair claims (id insurance_repair_claims). Tiers: 1, 5, 10, 20, 50 claims (career_modules_insurance_history.getInsuranceClaimsCount), minorLinear reward.
--- Access: extension `career_modules_milestones_generalMilestones_insurance`: `extensions.load("career_modules_milestones_generalMilestones_insurance")`, then the global `career_modules_milestones_generalMilestones_insurance`
---@class career_modules_milestones_generalMilestones_insurance
career_modules_milestones_generalMilestones_insurance = {}

--- Hook: creates the milestone configuration, its save data if absent, and adds it to milestonesList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua:10
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList) end

--- Hook called on each insurance repair claim: if the counter reaches the next tier's target, notifies the milestone and advances notificationStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua:32
function career_modules_milestones_generalMilestones_insurance.onInsuranceRepairClaim() end

