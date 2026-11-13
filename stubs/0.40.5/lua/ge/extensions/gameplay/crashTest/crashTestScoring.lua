---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crashTest_crashTestScoring` : `extensions.load("gameplay_crashTest_crashTestScoring")`, puis la globale `gameplay_crashTest_crashTestScoring`
---@class gameplay_crashTest_crashTestScoring
---@field dependencies table
gameplay_crashTest_crashTestScoring = {}

---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:55
---@param damageLocationGoal any
---@param damageLocationData any
function gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData) end

---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:64
---@param damageGoal any
---@param damageCondition any
---@param vehId any
function gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId) end

--- onoly triggered if the step is successful
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:117
---@param stepData any
---@param stepCrashData any
function gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData) end

---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:148
---@param stepIndex any
function gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex) end

---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:137
function gameplay_crashTest_crashTestScoring.getTotalScoreData() end

---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:152
function gameplay_crashTest_crashTestScoring.reset() end

