---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_rallyLoopStars` : `extensions.load("gameplay_rally_loop_rallyLoopStars")`, puis la globale `gameplay_rally_loop_rallyLoopStars`
---@class gameplay_rally_loop_rallyLoopStars
gameplay_rally_loop_rallyLoopStars = {}

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:68
---@param loopMissionTypeData any
function gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData) end

--- Sum the linked stages' existing authored thresholds. All configured stages must
---  provide all three values; partial loop targets would be misleading.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:29
---@param loopMissionTypeData any
function gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:10
---@param value any
function gameplay_rally_loop_rallyLoopStars.extractMissionId(value) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:108
---@param mission any
---@param attempt any
function gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:82
---@param mission any
---@param attempt any
function gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt) end

