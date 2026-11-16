---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/goals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Evaluates the goals of the freeform delivery mode. From delivery.goals, creates one goal per entry (types placement, playerInVehicle, engineRunning, coupled, unhitched, damage, distance), manages their prerequisites (requires, AND logic) and their state (active, completed), re-evaluates them every frame in two passes (completion then activation) and provides overall and per-goal progress. Also handles the 5 s automatic finish countdown when all active required goals are fulfilled.
--- Access: extension `gameplay_freeformDelivery_goals`: `extensions.load("gameplay_freeformDelivery_goals")`, then the global `gameplay_freeformDelivery_goals`
---@class gameplay_freeformDelivery_goals
---@field dependencies string[] gameplay_freeformDelivery_utils, core_trailerRespawn, core_vehicles, core_vehicleBridge.
gameplay_freeformDelivery_goals = {}

--- Returns whether all goals of a target area are completed (false if there are none).
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:771
---@param areaId string Target area id.
---@return boolean  true if all completed.
function gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId) end

--- Full cleanup: clears goals, states, caches, pending requests, utils' vehicle cache and the finish message.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:884
function gameplay_freeformDelivery_goals.cleanup() end

--- Returns all created goals, active or not, keyed by id.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:732
---@return table<string, table>  All goals.
function gameplay_freeformDelivery_goals.getAllGoals() end

--- Returns the remaining time of the finish countdown.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:871
---@return number|nil  Remaining seconds, nil if not started.
function gameplay_freeformDelivery_goals.getCompletionTimer() end

--- Returns the detailed progress of a goal: for a multi-vehicle placement {total, requiredAmount, inArea, partial, complete}, otherwise {total = 1, inArea, partial = false, complete}.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:740
---@param goalId string Goal id.
---@return table|nil  Progress, nil if the goal does not exist.
function gameplay_freeformDelivery_goals.getGoalProgress(goalId) end

--- Returns the state of a goal.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:736
---@param goalId string Goal id.
---@return table|nil  {completed, lastCheck, active}
function gameplay_freeformDelivery_goals.getGoalState(goalId) end

--- Returns only the active goals (prerequisites fulfilled), keyed by id.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:720
---@return table<string, table>  Active goals.
function gameplay_freeformDelivery_goals.getGoals() end

--- Lists the goals linked to a target area.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:751
---@param targetAreaId string Target area id.
---@return table[]  Array of goals.
function gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId) end

--- Lists the goals of a given type.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:761
---@param goalType string placement, playerInVehicle, engineRunning, coupled, unhitched, damage or distance.
---@return table[]  Array of goals.
function gameplay_freeformDelivery_goals.getGoalsByType(goalType) end

--- Counts active and completed goals, with the share of required goals.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:692
---@return table  {total, completed, required, requiredCompleted, allRequiredComplete}
function gameplay_freeformDelivery_goals.getProgress() end

--- Removes the finish message from the tasklist and stops the countdown, but keeps goals and states for result evaluation.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:876
function gameplay_freeformDelivery_goals.hideFromTasklist() end

--- Returns whether the maximum distance of a distance-type goal exceeds 90% of its warningThreshold (to display a warning).
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:280
---@param goal table Distance-type goal (vehicleListA, vehicleListB, warningThreshold).
---@return boolean  true if the warning must be active.
function gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal) end

--- Returns whether a goal's prerequisites are fulfilled.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:746
---@param goalId string Goal id.
---@return boolean  true if active.
function gameplay_freeformDelivery_goals.isGoalActive(goalId) end

--- Resets goals, states and caches, pre-fills the cache of target areas and their site objects, creates the delivery.goals goals and computes the initial activation according to prerequisites.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:492
---@param delivery table Loaded delivery (goals, targetAreas, sites).
function gameplay_freeformDelivery_goals.setup(delivery) end

--- To be called every frame: updates the position cache of the relevant vehicles, evaluates the completion of each active goal (pass 1) then recomputes activation (pass 2).
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:553
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
---@param profiler table|nil Optional LuaProfiler.
function gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler) end

--- Manages the automatic finish countdown: starts it when all active required goals are completed (message in the tasklist), cancels it if one becomes incomplete again, and returns true when it reaches 0.
---Source: lua/ge/extensions/gameplay/freeformDelivery/goals.lua:826
---@param dtReal number Real-time delta in seconds.
---@return boolean  true when the delivery must finish.
function gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal) end

