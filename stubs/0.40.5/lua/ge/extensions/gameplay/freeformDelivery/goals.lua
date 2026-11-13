---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/goals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_freeformDelivery_goals` : `extensions.load("gameplay_freeformDelivery_goals")`, puis la globale `gameplay_freeformDelivery_goals`
---@class gameplay_freeformDelivery_goals
---@field dependencies table
gameplay_freeformDelivery_goals = {}

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:771
---@param areaId any
function gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId) end

--- Full cleanup: removes everything (for teardown)
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:884
function gameplay_freeformDelivery_goals.cleanup() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:732
function gameplay_freeformDelivery_goals.getAllGoals() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:871
function gameplay_freeformDelivery_goals.getCompletionTimer() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:740
---@param goalId any
function gameplay_freeformDelivery_goals.getGoalProgress(goalId) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:736
---@param goalId any
function gameplay_freeformDelivery_goals.getGoalState(goalId) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:720
function gameplay_freeformDelivery_goals.getGoals() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:751
---@param targetAreaId any
function gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:761
---@param goalType any
function gameplay_freeformDelivery_goals.getGoalsByType(goalType) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:692
function gameplay_freeformDelivery_goals.getProgress() end

--- Hide goals from UI (tasklist) but keep internal state for evaluation
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:876
function gameplay_freeformDelivery_goals.hideFromTasklist() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:280
---@param goal any
function gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:746
---@param goalId any
function gameplay_freeformDelivery_goals.isGoalActive(goalId) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:492
---@param delivery any
function gameplay_freeformDelivery_goals.setup(delivery) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:553
---@param dtReal any
---@param dtSim any
---@param dtRaw any
---@param profiler any
function gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:826
---@param dtReal any
function gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal) end

