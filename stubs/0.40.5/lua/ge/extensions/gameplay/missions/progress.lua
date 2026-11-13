---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_progress` : `extensions.load("gameplay_missions_progress")`, puis la globale `gameplay_missions_progress`
---@class gameplay_missions_progress
---@field formatAggregatesForMissionTypeWithProgKey any
---@field getProgressAggregateCache any
---@field getSaveSlotVersion any
---@field setSaveSlotVersion any
---@field startConditionMet any
---@field testHelper table
gameplay_missions_progress = {}

---Source : lua/ge/extensions/gameplay/missions/progress.lua:619
---@param starRewards any
---@param mission any
---@param attempt any
function gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:380
---@param id any
---@param attempt any
---@param progressKey any
function gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1867
function gameplay_missions_progress.endBatchMode() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1038
---@param missionInstance any
---@param progressKey any
function gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1874
function gameplay_missions_progress.exportAllProgressToCSV() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1318
---@param attempt any
---@param mission any
function gameplay_missions_progress.formatAttemptSimple(attempt, mission) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1677
---@param id any
function gameplay_missions_progress.formatSaveDataForBigmap(id) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1641
---@param id any
---@param onlyKey any
---@param includeMostRecentAttempt any
---@param fillAttempts any
function gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1578
---@param mission any
function gameplay_missions_progress.formatStars(mission) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1802
---@param id any
---@param addAttemptData any
function gameplay_missions_progress.generateAttempt(id, addAttemptData) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1833
---@param id any
---@param amount any
---@param dumpChange any
function gameplay_missions_progress.generateAttempts(id, amount, dumpChange) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1870
function gameplay_missions_progress.getBatchMode() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1090
---@param missionId any
function gameplay_missions_progress.getLeaderboardChangeKeys(missionId) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:292
function gameplay_missions_progress.getSaveSlot() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1717
---@param id any
function gameplay_missions_progress.getUnlockedStarCountsForMissionById(id) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:924
---@param mission any
function gameplay_missions_progress.loadMissionSaveData(mission) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1058
---@param missionId any
function gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1071
---@param missionId any
function gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:227
---@param type any
---@param data any
function gameplay_missions_progress.newAttempt(type, data) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1765
function gameplay_missions_progress.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:999
---@param mission any
function gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:296
---@param id any
---@param dirtyDate any
function gameplay_missions_progress.saveMissionSaveData(id, dirtyDate) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1025
---@param mission any
---@param userSettings any
function gameplay_missions_progress.setDynamicStarRewards(mission, userSettings) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:288
---@param path any
function gameplay_missions_progress.setSavePath(path) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:282
---@param slotName any
function gameplay_missions_progress.setSaveSlot(slotName) end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1864
function gameplay_missions_progress.startBatchMode() end

---Source : lua/ge/extensions/gameplay/missions/progress.lua:1566
---@param label any
---@param data any
function gameplay_missions_progress.tryBuildContext(label, data) end

