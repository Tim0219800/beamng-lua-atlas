---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the stars (bronze, silver, gold) of a rally loop. The loop's thresholds are the sum of the thresholds of the linked stages (up to 4: stage1_rallyStage...stage4_rallyStage). The module also grades an attempt (stars unlocked if the total time is less than or equal to the threshold) and picks the matching mission outro text.
--- Access: extension `gameplay_rally_loop_rallyLoopStars`: `extensions.load("gameplay_rally_loop_rallyLoopStars")`, then the global `gameplay_rally_loop_rallyLoopStars`
---@class gameplay_rally_loop_rallyLoopStars
gameplay_rally_loop_rallyLoopStars = {}

--- Computes the thresholds and writes them into loopMissionTypeData; sets them to nil if the computation fails.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:68
---@param loopMissionTypeData table Loop's missionTypeData, modified in place.
---@return table|nil  The totals, or nil.
function gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData) end

--- Adds up the bronze/silver/gold thresholds of the stages linked to the loop. All configured stages must provide the three values.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:29
---@param loopMissionTypeData table Loop's missionTypeData (fields stage1_rallyStage...stage4_rallyStage).
---@return table|nil  {bronzeTime, silverTime, goldTime, stageCount} or nil.
function gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData) end

--- Extracts the mission id from a field value: returns what is between the trailing parentheses ("Name (id)" gives "id"), otherwise the string as is; nil if the value is not a string, is empty or is '<none>'.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:10
---@param value any Value of the stageN_rallyStage field.
---@return string|nil  Mission id.
function gameplay_rally_loop_rallyLoopStars.extractMissionId(value) end

--- Returns the outro text: that of 'noStarUnlocked' then that of the best unlocked star (bronze, then silver, then gold), taken from careerSetup.starOutroTexts or else defaultStarOutroTexts. nil if the mission has no goldTime or no active star.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:108
---@param mission table|nil Loop mission.
---@param attempt table|nil Graded attempt (unlockedStars).
---@return string|nil  Outro text.
function gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt) end

--- Fills attempt.unlockedStars[key] = (total time <= threshold) for each active star. Does nothing for a DNF, a mission without missionTypeData or an invalid time (<= 0).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:82
---@param mission table|nil Loop mission (missionTypeData, careerSetup.starsActive).
---@param attempt table Attempt; reads attempt.data.totalTime and attempt.dnf.
---@return table  The same attempt.
function gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt) end

