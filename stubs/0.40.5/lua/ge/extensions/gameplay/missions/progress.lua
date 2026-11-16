---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages mission progress (saving): attempts, aggregates (best result, number of tries, leaderboards), unlocked stars, quick travel and settings unlocks, career rewards and Steam achievements. Data is written to settings/cloud/missionProgress/<slot>/<mission id>.json. It also formats this data for the UI (mission screen, big map). A modder uses it to record an attempt (newAttempt then aggregateAttempt) or read a mission's progress.
--- Access: extension `gameplay_missions_progress`: `extensions.load("gameplay_missions_progress")`, then the global `gameplay_missions_progress`
---@class gameplay_missions_progress
---@field formatAggregatesForMissionTypeWithProgKey nil Is nil: the local of the same name does not exist in the file.
---@field getProgressAggregateCache nil Is nil: the local of the same name does not exist in the file.
---@field getSaveSlotVersion nil Is nil: the local of the same name does not exist in the file.
---@field setSaveSlotVersion nil Is nil: the local of the same name does not exist in the file.
---@field startConditionMet nil Is nil: the local of the same name does not exist in the file.
---@field testHelper table Internal test tools (e.g. testHelper.randomAttemptType, used by sanitizeMissionAfterCreation for getRandomizedAttempt).
gameplay_missions_progress = {}

--- Prepares, for the career end-of-mission UI, the reward details per attribute (total, icon, detail per star obtained, animation duration and sound pitch computed by a sigmoid-like curve). Does nothing outside career.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:619
---@param starRewards table starRewards table built by aggregateAttempt (originalRewardsPerStar, sums...).
---@param mission table Mission.
---@param attempt table Attempt (unlockedStars field).
---@return table|nil  {list = {...}} or nil outside career.
function gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt) end

--- Records an attempt in a mission's progress: sanitizes the attempt, adds it to progress.attempts, updates the aggregate (best type, number of tries, DNF, "recent" leaderboard), emits onMissionAttemptAggregated(attempt, mission, progressKey), unlocks the stars, achievements (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS and the mission type's), applies the automatic aggregates and mission:aggregateAttempt, distributes career rewards and computes the unlocks (missions, leagues, quick travel, settings).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:380
---@param id string Mission id.
---@param attempt table Attempt (newAttempt); modified in place (type, unlockedStars, attemptNumber, dnfCount).
---@param progressKey string|nil Progress key; defaults to mission.defaultProgressKey or 'default'.
---@return table|nil  Outside batch mode: {formattedAttempt, aggregateChange, unlockChange, nextMissionsUnlock, unlockedMissions, unlockedStarsAttempt, unlockedStarsChanged, starRewards, formattedRewards, unlockedLeagues?, quickTravelUnlockedChange?, userSettingsUnlockedChange?}. In batch mode: {}. nil if the mission does not exist.
function gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey) end

--- Disables batch mode.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1867
function gameplay_missions_progress.endBatchMode() end

--- Creates, if missing, the progress of a key (blank aggregate bestType='none', empty attempts, empty "recent" leaderboard).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1038
---@param missionInstance table Built mission.
---@param progressKey string Progress key.
function gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey) end

--- Empty function _anon(not implemented).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1874
function gameplay_missions_progress.exportAllProgressToCSV() end

--- Formats an attempt for the UI: list {value, label, mainResult} based on mission.autoUiAttemptProgress.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1318
---@param attempt table Attempt.
---@param mission table Mission.
---@return table  {list = {...}}.
function gameplay_missions_progress.formatAttemptSimple(attempt, mission) end

--- Formats the progress for the big map (aggregates configured in mission.autoUiBigmap, unlocked stars).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1677
---@param id string Mission id.
---@return table|nil  Formatted data; nil if the mission does not exist. Notably contains unlockedStars (formatStars).
function gameplay_missions_progress.formatSaveDataForBigmap(id) end

--- Formats a mission's entire progress (per progress key) for the mission screen, including automatic replay recordings (core_replay.getMissionReplayFiles).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1641
---@param id string Mission id.
---@param onlyKey string|nil Limits to one progress key.
---@param includeMostRecentAttempt boolean|nil Include the most recent attempt.
---@param fillAttempts boolean|nil Include the full list of attempts (inferred from code).
---@return table|nil  Formatted data; nil if the mission does not exist.
function gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts) end

--- Formats the mission's stars for the UI (sorted list, number unlocked default/bonus, total). Returns {disabled=true} if the mission has no active stars.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1578
---@param mission table Mission.
---@return table  Formatted stars.
function gameplay_missions_progress.formatStars(mission) end

--- Test tool: creates a random attempt (mission:getRandomizedAttempt), adds addAttemptData to it, aggregates it then saves (via career_modules_missionWrapper in career, otherwise saveMissionSaveData). Does dump() calls in the console.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1802
---@param id string Mission id.
---@param addAttemptData table Fields added to the attempt (must not be nil).
---@return table|nil  Result of aggregateAttempt.
function gameplay_missions_progress.generateAttempt(id, addAttemptData) end

--- Test tool: aggregates `amount` random attempts for each progress key of the mission.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1833
---@param id string Mission id.
---@param amount integer Number of attempts per key.
---@param dumpChange boolean|nil Show the aggregated change.
function gameplay_missions_progress.generateAttempts(id, amount, dumpChange) end

--- Indicates whether batch mode is active.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1870
---@return boolean  true if active.
function gameplay_missions_progress.getBatchMode() end

--- Returns the leaderboard -> new-record key table: 'recent' -> 'newRecentLeaderboardEntryKey', plus those of the automatic aggregates (leaderboardKey -> newLeaderboardEntryKey).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1090
---@param missionId string Mission id.
---@return table<string, string>  Mapping (empty if the mission does not exist).
function gameplay_missions_progress.getLeaderboardChangeKeys(missionId) end

--- Returns the current save slot name and its folder.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:292
---@return string  Slot name.
---@return string  Save folder.
function gameplay_missions_progress.getSaveSlot() end

--- Counts the unlocked stars: returns the number of default stars and the number of unlocked bonus stars.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1717
---@param id string Mission id.
---@return integer  Default stars unlocked.
---@return integer  Unlocked bonus stars (0 if no stars; 0, 0, 0 if the mission is not found).
function gameplay_missions_progress.getUnlockedStarCountsForMissionById(id) end

--- Loads a mission's progress data from disk (converts old star booleans to counters, notifies career, updates if the version is old, calls mission:loadSaveData). Returns blank data if the file is missing or unreadable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/progress.lua:924
---@param mission table Built mission.
---@return table  Mission saveData.
---@return boolean|nil  true if the data was updated to a newer version.
function gameplay_missions_progress.loadMissionSaveData(mission) end

--- Indicates whether quick travel to the mission is unlocked. Always returns true for an existing mission (the save condition is commented out).
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1058
---@param missionId string Mission id.
---@return boolean  true (false if the mission does not exist).
function gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId) end

--- Indicates whether the mission's user settings are unlocked. Always returns true for an existing mission.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1071
---@param missionId string Mission id.
---@return boolean  true (false if the mission does not exist).
function gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId) end

--- Creates an attempt table {type, date (os.time), humanDate (ISO 8601 UTC), data}.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:227
---@param type string Result type: completed, passed, attempted, abandoned, failed or none (will be recomputed by aggregateAttempt).
---@param data table|nil Data specific to the mission type.
---@return table  Attempt.
function gameplay_missions_progress.newAttempt(type, data) end

--- Loads all condition types from gameplay/missions/progress/conditions/*.lua into the internal conditionTypes table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1765
function gameplay_missions_progress.onExtensionLoaded() end

--- In career, reduces the rewards of each already-obtained active star (money to 10% of the original value, vouchers to 0) then recomputes the reward sums. Outside career, only recomputes the sums.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:999
---@param mission table Built mission.
function gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission) end

--- Writes mission.saveData to <folder>/<id>.json (indented JSON) after setting dirtyDate on it.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:296
---@param id string Mission id.
---@param dirtyDate number|nil Modification date for career synchronization.
---@return boolean|nil  Result of jsonWriteFile; nil if the mission does not exist.
function gameplay_missions_progress.saveMissionSaveData(id, dirtyDate) end

--- For each star, asks mission:getDynamicStarReward(key, userSettings) for a settings-dependent reward and substitutes it if it exists, then recomputes the sums.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1025
---@param mission table Built mission.
---@param userSettings table|nil Settings; defaults to mission.lastUserSettings.
function gameplay_missions_progress.setDynamicStarRewards(mission, userSettings) end

--- Directly sets the save folder; with no argument, returns to the default slot.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:288
---@param path string|nil Folder ending with "/".
function gameplay_missions_progress.setSavePath(path) end

--- Changes the save slot: the path becomes settings/cloud/missionProgress/<slotName>/.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:282
---@param slotName string Slot name ("default" by default).
function gameplay_missions_progress.setSaveSlot(slotName) end

--- Enables batch mode: aggregateAttempt skips the unlock computations and the permanent log.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1864
function gameplay_missions_progress.startBatchMode() end

--- Builds a translation context table from `data`, keeping only string or number values (converted to string). Returns {} if label is nil.
---Source: lua/ge/extensions/gameplay/missions/progress.lua:1566
---@param label any Label; if nil, the context is empty.
---@param data table Source data.
---@return table<string, string>  Context.
function gameplay_missions_progress.tryBuildContext(label, data) end

