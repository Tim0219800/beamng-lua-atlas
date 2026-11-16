---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/milestones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central career milestones module: save data (milestones.json), aggregated list for the UI via the onGetMilestones hook, reward claiming (one by one or all), unclaimed milestone counter and notifications. Also provides common reward functions and colors for the subsystems (generalMilestones/*).
--- Access: extension `career_modules_milestones_milestones`: `extensions.load("career_modules_milestones_milestones")`, then the global `career_modules_milestones_milestones`
---@class career_modules_milestones_milestones
---@field colorGeneralGray string CSS color var(--bng-cool-gray-700-rgb).
---@field colorMissionBlue string CSS color var(--bng-add-blue-500-rgb).
---@field colorOrange string CSS color var(--bng-orange-500-rgb).
---@field saveData table Saved data: general (per id: claimedStep, notificationStep) and unclaimedMilestonesCount.
career_modules_milestones_milestones = {}

--- Claims the milestone identified by its claimId (index in the last list). Runs its claimFunction, updates the refresh functions and notifies the UI (milestoneClaimed with replacementEntry).
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:47
---@param id integer claimId from the current list.
---@param noGuiEvent boolean|nil If true, does not send the UI event.
---@return table|nil  New milestone card (next tier) or nil.
function career_modules_milestones_milestones.claim(id, noGuiEvent) end

--- Claims all claimable milestones of the full list, re-runs getMilestones and sends guihooks allMilestonesClaimed.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:67
---@return {claimed: integer, unclaimedMilestonesCount: integer}  Number claimed and remaining counter.
function career_modules_milestones_milestones.claimAllUnclaimed() end

--- Collects milestones via the onGetMilestones(list, filter) hook, assigns claimIds, counts claimable milestones and returns the list with the available filters.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:89
---@param filter string[]|nil Filters (general, mission, branch, delivery, money, speedTrap, insurance, all...).
---@return {list: table[], filters: string[]}  Cards and sorted filter keys.
function career_modules_milestones_milestones.getMilestones(filter) end

--- Loads saveData from career/milestones.json of the current profile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:136
function career_modules_milestones_milestones.loadSaveData() end

--- Reward function: 250 * (step + 1) in money.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:186
---@param step integer Tier index (starting from 0).
---@return {attributeKey: string, rewardAmount: number}[]  A money reward.
function career_modules_milestones_milestones.majorLinear(step) end

--- Shows a "milestone reached" toast (string label or {txt, context}) and increments unclaimedMilestonesCount. Intended to possibly be deferred during a mission.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:122
---@param label string|table Text or translation table {txt, context}.
function career_modules_milestones_milestones.milestoneReached(label) end

--- Reward function: 100 * (step + 1) in money.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:185
---@param step integer Tier index (starting from 0).
---@return {attributeKey: string, rewardAmount: number}[]  A money reward.
function career_modules_milestones_milestones.minorLinear(step) end

--- Hook: shows a toast if there are unclaimed milestones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:169
---@param active boolean Nothing if false.
function career_modules_milestones_milestones.onCareerActive(active) end

--- Hook: loads saveData if the career is already active (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:145
function career_modules_milestones_milestones.onExtensionLoaded() end

--- Empty hook (stub); adding the cards is done by milestones/general.lua.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:112
---@param list table[] List to fill.
function career_modules_milestones_milestones.onGetMilestones(list) end

--- UI router lifecycle: calls onPauseEnter of ui_pause_routeLifecycleCallbacks if it exists and adds data.milestones.filterOptions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:218
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data) end

--- UI router lifecycle: calls onPauseMount then adds data.milestones.filterOptions (translated filter options).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:223
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data) end

--- Save hook: writes saveData to <save>/career/milestones.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:150
---@param currentSavePath string Save folder.
function career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath) end

--- Sends getMilestones(filter) to the UI via guihooks milestonesData.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:116
---@param filter string[]|nil Filters.
function career_modules_milestones_milestones.requestMilestones(filter) end

--- Number of milestones reached and unclaimed.
---Source: lua/ge/extensions/career/modules/milestones/milestones.lua:155
---@return integer  Saved counter.
function career_modules_milestones_milestones.unclaimedMilestonesCount() end

