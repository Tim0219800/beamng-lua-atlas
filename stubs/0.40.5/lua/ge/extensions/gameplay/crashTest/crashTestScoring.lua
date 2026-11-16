---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Score computation for the crash test scenario. For each successful step, computes sub-scores (time before impact, impact speed, damage, impact zone, target redirection into the zone) and stores them per step. The scales are in scoreParameters (1000 points max per criterion, minimum time 500, speed tolerance 3 km/h). Uses gameplay_util_damageAssessment for damage severity.
--- Access: extension `gameplay_crashTest_crashTestScoring`: `extensions.load("gameplay_crashTest_crashTestScoring")`, then the global `gameplay_crashTest_crashTestScoring`
---@class gameplay_crashTest_crashTestScoring
---@field dependencies table<integer, string> Extensions loaded before: {"gameplay_util_damageAssessment"}.
gameplay_crashTest_crashTestScoring = {}

--- Impact zone accuracy score: share of the total damage located in the targeted zone, scaled to 1000. Also returns the zone actually most hit and the accuracy as a percentage.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:55
---@param damageLocationGoal string Required impact zone (key of damagedLocations).
---@param damageLocationData table Impact data: totalDamage, damageStateDiff (damagedLocations, mostDamagedLocation), mostDamagedLocation.
---@return table  {score, scoreName, maxScore, requiredImpactLocation, actualImpactLocation}.
function gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData) end

--- Compares a vehicle's damage severity (getDamageAssessment(vehId).damageSeverity) to the target and returns 1000, 500, 200 or 0 depending on the level difference.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:64
---@param damageGoal string 'Minor', 'Moderate' or 'A lot'.
---@param damageCondition string 'At least' or 'No more than'.
---@param vehId integer Identifier of the evaluated vehicle.
---@return integer|nil  Score; nil if the condition is unknown.
function gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId) end

--- Computes all the sub-scores of a successful step and adds the result to the per-step score list. Except for the objective 'Crash target vehicle into target area', computes time scores (if timeToImpact exists) and speed scores; depending on the case adds the damage, impact zone or target zone scores (1000).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:117
---@param stepData table Step definition (objective, timeToImpact, impactSpeed, plVehId, jbeamTargets, damageAmount, impactLocation...).
---@param stepCrashData table<integer, table> Crash data by vehicle id (stepElapsedTime, crashStartData, crashEndData).
function gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData) end

--- Returns a step's score data.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:148
---@param stepIndex integer Step index (starting at 1).
---@return table|nil  Step sub-scores.
function gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex) end

--- Adds up all the scores of all the steps and stores the total in the 'totalScore' key of the returned table.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:137
---@return table  List of per-step scores, with the totalScore key.
function gameplay_crashTest_crashTestScoring.getTotalScoreData() end

--- Clears all recorded scores.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:152
function gameplay_crashTest_crashTestScoring.reset() end

