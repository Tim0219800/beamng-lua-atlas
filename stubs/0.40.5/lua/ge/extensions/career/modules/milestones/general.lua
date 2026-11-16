---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the career's "general milestones". When the career activates, it collects via the onGeneralMilestonesCollect hook the configurations provided by subsystems (generalMilestones/*), initializes their save data ({claimedStep, notificationStep}) in career_modules_milestones_milestones.saveData.general, then calls onGeneralMilestonesSetupCallbacks. It builds the UI entry of each milestone (getMilestone) and handles reward claiming (claim).
--- Access: extension `career_modules_milestones_general`: `extensions.load("career_modules_milestones_general")`, then the global `career_modules_milestones_general`
---@class career_modules_milestones_general
---@field dependencies table<integer, string> Extensions loaded before: career_modules_milestones_milestones.
career_modules_milestones_general = {}

--- Claims the milestone's current tier: sums the rewards of getRewards(claimedStep), credits them, increments claimedStep, calls the onGeneralMilestoneClaimed(config) hook and shows a success toast.
---Source: lua/ge/extensions/career/modules/milestones/general.lua:47
---@param id string Milestone identifier.
function career_modules_milestones_general.claim(id) end

--- Builds the milestone's UI card for the next tier: label, description, progress bar, rewards, claimable (value >= target), claimFunction and claimRefreshFunction. If all tiers are done (maxStep exceeded), returns a card with completed = true.
---Source: lua/ge/extensions/career/modules/milestones/general.lua:69
---@param id string Milestone identifier.
---@return table  Milestone card for the interface.
function career_modules_milestones_general.getMilestone(id) end

--- Hook: resets and re-collects the milestone configurations (onGeneralMilestonesCollect hook), creates missing save data (warns if claimedStep is absent) and calls the onGeneralMilestonesSetupCallbacks hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/general.lua:16
---@param active boolean Nothing if false.
function career_modules_milestones_general.onCareerActive(active) end

--- Milestone list hook: adds to list the card of each milestone whose filter contains one of the requested filters (all if the filter is empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/general.lua:131
---@param list table[] List to fill.
---@param filter string[]|nil Requested filter identifiers.
function career_modules_milestones_general.onGetMilestones(list, filter) end

--- Debug tool: exports all tiers (id, step, name, description, target, first two rewards) to milestones.csv.
---Source: lua/ge/extensions/career/modules/milestones/general.lua:151
function career_modules_milestones_general.printDebug() end

