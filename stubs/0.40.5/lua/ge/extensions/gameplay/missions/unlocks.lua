---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_unlocks` : `extensions.load("gameplay_missions_unlocks")`, puis la globale `gameplay_missions_unlocks`
---@class gameplay_missions_unlocks
---@field startConditionMet any
gameplay_missions_unlocks = {}

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:478
function gameplay_missions_unlocks.clearCache() end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:471
function gameplay_missions_unlocks.clearUnlockStatusCache() end

--- This function recursively processes a condition, generating label, if the condition is met etc.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:16
---@param condition any
function gameplay_missions_unlocks.conditionMet(condition) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:399
---@param mission any
function gameplay_missions_unlocks.constructUnlocksField(mission) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:450
---@param a any
---@param b any
function gameplay_missions_unlocks.depthIdSort(a, b) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:459
---@param aId any
---@param bId any
function gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:363
---@param mission any
function gameplay_missions_unlocks.getBackwardMissionIds(mission) end

--- recursively gets all branch level requirements in conditions (branchLevel)
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:112
---@param cond any
---@param list any
function gameplay_missions_unlocks.getBranchLevelForCondition(cond, list) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:374
---@param mission any
function gameplay_missions_unlocks.getForwardMissionInfo(mission) end

--- for a specific mission, gets all missions that are directly unlocked by it.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:82
---@param mission any
---@param diff any
function gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff) end

--- recursively collects all missions referenced in conditions (missionPassed, missionCompleted)
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:98
---@param cond any
---@param list any
function gameplay_missions_unlocks.getMissionsForCondition(cond, list) end

--- this function generates a flat/simple list of all unlock data for all missions, used for comparisons.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:33
function gameplay_missions_unlocks.getSimpleUnlockedStatus() end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:277
---@param mission any
function gameplay_missions_unlocks.getStartableDetails(mission) end

--- compares two simpleUnlockedStatus lists to see what changed between them
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:58
---@param before any
---@param after any
function gameplay_missions_unlocks.getUnlockDiff(before, after) end

--- Unlocks API
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:296
---@param mission any
function gameplay_missions_unlocks.isMissionStartable(mission) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:346
---@param mission any
function gameplay_missions_unlocks.isMissionVisible(mission) end

--- load all condition types.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:435
function gameplay_missions_unlocks.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:391
---@param mission any
---@param value any
function gameplay_missions_unlocks.overrideStartable(mission, value) end

---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:395
---@param mission any
---@param value any
function gameplay_missions_unlocks.overrideVisible(mission, value) end

