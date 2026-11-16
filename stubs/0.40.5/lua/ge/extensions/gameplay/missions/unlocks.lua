---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that evaluates the unlock and visibility conditions of missions (startCondition and visibleCondition fields). On load, it loads all condition types from the gameplay/missions/unlocks/conditions/ folder. It also builds caches: previous missions (backward), next missions (forward), depth in the tree and required career branch level. A modder uses it to know whether a mission is startable/visible or to force these states.
--- Access: extension `gameplay_missions_unlocks`: `extensions.load("gameplay_missions_unlocks")`, then the global `gameplay_missions_unlocks`
---@class gameplay_missions_unlocks
---@field startConditionMet nil Exported from an undefined variable: always nil.
gameplay_missions_unlocks = {}

--- Clears the state cache as well as the backward and forward caches.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:478
function gameplay_missions_unlocks.clearCache() end

--- Clears the startable/visible state cache (and the career leagues cache if present).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:471
function gameplay_missions_unlocks.clearUnlockStatusCache() end

--- Recursively evaluates a condition. Looks up the type among the loaded types (falls back to 'missing' if unknown), calls its conditionMet and its getLabel.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:16
---@param condition table Condition with a type field (e.g. missionPassed, branchLevel, multiAnd) and its parameters.
---@return table  {met = boolean, condition = table, nested = table|nil (results of the sub-conditions), label = string|table, hidden = boolean|nil}
function gameplay_missions_unlocks.conditionMet(condition) end

--- Assembles a mission's unlocks field.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:399
---@param mission table Mission.
---@return table  {startable, visible, startableDetails, backward, forward, maxBranchLevel, branchTags, depth}
function gameplay_missions_unlocks.constructUnlocksField(mission) end

--- Comparator for table.sort on missions: by ascending depth then by id.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:450
---@param a table Mission.
---@param b table Mission.
---@return boolean  true if a must come before b.
function gameplay_missions_unlocks.depthIdSort(a, b) end

--- Like depthIdSort but from mission ids. Returns false if either mission does not exist.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:459
---@param aId string Mission id.
---@param bId string Mission id.
---@return boolean  true if a must come before b.
function gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId) end

--- Ids of the missions required by this mission's startCondition (cached).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:363
---@param mission table Mission.
---@return string[]  List of ids.
function gameplay_missions_unlocks.getBackwardMissionIds(mission) end

--- Recursively collects the required career branch levels (branchLevel conditions, and league via the league's branch, level 1).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:112
---@param cond table Condition to walk.
---@param list table<string, integer> Table branchId -> level, filled in place.
function gameplay_missions_unlocks.getBranchLevelForCondition(cond, list) end

--- Forward information: unlocked missions, max branch level, branch tags and depth. Rebuilds the full cache if needed (loads all missions).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:374
---@param mission table Mission.
---@return table  {forwardIds = string[], maxBranchLevel = integer, branchTags = table<string, boolean>, depth = integer}
function gameplay_missions_unlocks.getForwardMissionInfo(mission) end

--- For a mission, lists the missions it directly unlocks (forwardIds), with their startable state and whether they changed in diff.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:82
---@param mission table Source mission.
---@param diff table Result of getUnlockDiff (uses diff.byId).
---@return table  {list = {{missionId, changed, startable}}}
function gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff) end

--- Recursively collects the mission ids referenced by the missionPassed and missionCompleted conditions.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:98
---@param cond table Condition (walks cond.nested).
---@param list string[] List filled in place.
function gameplay_missions_unlocks.getMissionsForCondition(cond, list) end

--- Builds a flat table (mission id -> deep copy of constructUnlocksField) to compare the unlock state before/after an action.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:33
---@return table<string, table>  Unlock data per mission id.
function gameplay_missions_unlocks.getSimpleUnlockedStatus() end

--- Details (cached) of the startCondition evaluation. Returns nil for a mission present in both career and freeroam when career is not active.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:277
---@param mission table Mission.
---@return table|nil  Result of conditionMet (met, label, nested...).
function gameplay_missions_unlocks.getStartableDetails(mission) end

--- Compares two getSimpleUnlockedStatus results on the startable and visible keys.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:58
---@param before table State before.
---@param after table State after.
---@return table  {list = {{missionId, change = {{key, old, new}}}}, byId = table, missionsList = {{name, id}} (missions that became startable)}
function gameplay_missions_unlocks.getUnlockDiff(before, after) end

--- Indicates whether the mission is startable. An override set by overrideStartable takes precedence, otherwise the startCondition result is used.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:296
---@param mission table Mission.
---@return boolean  true if startable.
function gameplay_missions_unlocks.isMissionStartable(mission) end

--- Indicates whether the mission is visible (depending on career/freeroam mode and visibleCondition). An override set by overrideVisible takes precedence. Result cached.
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:346
---@param mission table Mission.
---@return boolean  true if visible.
function gameplay_missions_unlocks.isMissionVisible(mission) end

--- Hook called when the extension loads: loads all files from /lua/ge/extensions/gameplay/missions/unlocks/conditions and registers each condition type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:435
function gameplay_missions_unlocks.onExtensionLoaded() end

--- Forces a mission's startable state (nil to remove the override).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:391
---@param mission table Mission.
---@param value boolean|nil Forced value.
function gameplay_missions_unlocks.overrideStartable(mission, value) end

--- Forces a mission's visibility (nil to remove the override).
---Source: lua/ge/extensions/gameplay/missions/unlocks.lua:395
---@param mission table Mission.
---@param value boolean|nil Forced value.
function gameplay_missions_unlocks.overrideVisible(mission, value) end

