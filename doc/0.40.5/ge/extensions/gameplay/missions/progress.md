# `gameplay_missions_progress`

*File: `lua/ge/extensions/gameplay/missions/progress.lua` · VM: Game Engine (GE) · 1879 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_progress`: `extensions.load("gameplay_missions_progress")`, then the global `gameplay_missions_progress`

Manages mission progress (saving): attempts, aggregates (best result, number of tries, leaderboards), unlocked stars, quick travel and settings unlocks, career rewards and Steam achievements. Data is written to settings/cloud/missionProgress/<slot>/<mission id>.json. It also formats this data for the UI (mission screen, big map). A modder uses it to record an attempt (newAttempt then aggregateAttempt) or read a mission's progress.

## Example

```lua
local attempt = gameplay_missions_progress.newAttempt('completed', {time = 42.3})
attempt.unlockedStars = {justFinish = true}
local change = gameplay_missions_progress.aggregateAttempt('gridmap_v2/timeTrial/x', attempt)
gameplay_missions_progress.saveMissionSaveData('gridmap_v2/timeTrial/x')
```

## Notes

- Attempt type priority (the smallest is the best): completed=0, passed=10, attempted=20, abandoned=50, failed=100, none=1000.
- sanitizeAttempt (called by aggregateAttempt) recomputes the attempt type from the stars: 'passed' if at least one default star is obtained, 'completed' if all default AND active bonus stars are obtained, otherwise 'none'. The type passed to newAttempt is therefore overwritten. Only the stars that are active, visible and enabled for the current settings (mission.lastUserSettings) are kept.
- In career, the rewards of each star are added to the player's attributes; money is multiplied by the branch's level multiplier (career_branches.getLevelRewardMultiplier). reduceCareerRewardsForDefaultStars then reduces money to 10% for an already obtained star, and sets vouchers to 0.
- In batch mode (startBatchMode), aggregateAttempt neither computes unlocks nor writes the permanent log, and returns {}: useful for injecting many test attempts. Outside batch mode (and outside the shipping version), the result is written to permaMissionProgressLog.json (which grows with each attempt).
- aggregateAttempt does NOT save to disk: you must then call saveMissionSaveData (or career_modules_missionWrapper.saveMission in career).
- missionHasQuickTravelUnlocked and missionHasUserSettingsUnlocked always return true in the cases that matter: the code using saveData.quickTravelUnlocked / userSettingsUnlocked is commented out (the unlock still exists in aggregateAttempt, but is no longer consulted).
- Several exported fields are nil: formatAggregatesForMissionTypeWithProgKey, getProgressAggregateCache, getSaveSlotVersion, setSaveSlotVersion and startConditionMet are assigned to M.xxx from locals never defined in the file (leftovers from old code).
- exportAllProgressToCSV is an empty function.
- In missionHasQuickTravelUnlocked and missionHasUserSettingsUnlocked, the error message uses the variable `id` which does not exist (the parameter is named missionId): it will print nil.
- The version constant is 20 ("increasing the version purges all dev/test saves").
- onExtensionLoaded loads all files from the gameplay/missions/progress/conditions folder and registers their condition types.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt)` | Prepares, for the career end-of-mission UI, the reward details per attribute (total, icon, detail per star obtained, animation duration and sound pitch computed by a sigmoid-like curve). Does nothing outside career. | 619 |
| `gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey)` | Records an attempt in a mission's progress: sanitizes the attempt, adds it to progress.attempts, updates the aggregate (best type, number of tries, DNF, "recent" leaderboard), emits onMissionAttemptAggregated(attempt, mission, progressKey), unlocks the stars, achievements (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS and the mission type's), applies the automatic aggregates and mission:aggregateAttempt, distributes career rewards and computes the unlocks (missions, leagues, quick travel, settings). | 380 |
| `gameplay_missions_progress.endBatchMode()` | Disables batch mode. | 1867 |
| `gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey)` | Creates, if missing, the progress of a key (blank aggregate bestType='none', empty attempts, empty "recent" leaderboard). | 1038 |
| `gameplay_missions_progress.exportAllProgressToCSV()` | Empty function (not implemented). | 1874 |
| `gameplay_missions_progress.formatAttemptSimple(attempt, mission)` | Formats an attempt for the UI: list {value, label, mainResult} based on mission.autoUiAttemptProgress. | 1318 |
| `gameplay_missions_progress.formatSaveDataForBigmap(id)` | Formats the progress for the big map (aggregates configured in mission.autoUiBigmap, unlocked stars). | 1677 |
| `gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts)` | Formats a mission's entire progress (per progress key) for the mission screen, including automatic replay recordings (core_replay.getMissionReplayFiles). | 1641 |
| `gameplay_missions_progress.formatStars(mission)` | Formats the mission's stars for the UI (sorted list, number unlocked default/bonus, total). Returns {disabled=true} if the mission has no active stars. | 1578 |
| `gameplay_missions_progress.generateAttempt(id, addAttemptData)` | Test tool: creates a random attempt (mission:getRandomizedAttempt), adds addAttemptData to it, aggregates it then saves (via career_modules_missionWrapper in career, otherwise saveMissionSaveData). Does dump() calls in the console. | 1802 |
| `gameplay_missions_progress.generateAttempts(id, amount, dumpChange)` | Test tool: aggregates `amount` random attempts for each progress key of the mission. | 1833 |
| `gameplay_missions_progress.getBatchMode()` | Indicates whether batch mode is active. | 1870 |
| `gameplay_missions_progress.getLeaderboardChangeKeys(missionId)` | Returns the leaderboard -> new-record key table: 'recent' -> 'newRecentLeaderboardEntryKey', plus those of the automatic aggregates (leaderboardKey -> newLeaderboardEntryKey). | 1090 |
| `gameplay_missions_progress.getSaveSlot()` | Returns the current save slot name and its folder. | 292 |
| `gameplay_missions_progress.getUnlockedStarCountsForMissionById(id)` | Counts the unlocked stars: returns the number of default stars and the number of unlocked bonus stars. | 1717 |
| `gameplay_missions_progress.loadMissionSaveData(mission)` | Loads a mission's progress data from disk (converts old star booleans to counters, notifies career, updates if the version is old, calls mission:loadSaveData). Returns blank data if the file is missing or unreadable. *(internal)* | 924 |
| `gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId)` | Indicates whether quick travel to the mission is unlocked. Always returns true for an existing mission (the save condition is commented out). | 1058 |
| `gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId)` | Indicates whether the mission's user settings are unlocked. Always returns true for an existing mission. | 1071 |
| `gameplay_missions_progress.newAttempt(type, data)` | Creates an attempt table {type, date (os.time), humanDate (ISO 8601 UTC), data}. | 227 |
| `gameplay_missions_progress.onExtensionLoaded()` | Loads all condition types from gameplay/missions/progress/conditions/*.lua into the internal conditionTypes table. *(internal)* *(hook)* | 1765 |
| `gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission)` | In career, reduces the rewards of each already-obtained active star (money to 10% of the original value, vouchers to 0) then recomputes the reward sums. Outside career, only recomputes the sums. | 999 |
| `gameplay_missions_progress.saveMissionSaveData(id, dirtyDate)` | Writes mission.saveData to <folder>/<id>.json (indented JSON) after setting dirtyDate on it. | 296 |
| `gameplay_missions_progress.setDynamicStarRewards(mission, userSettings)` | For each star, asks mission:getDynamicStarReward(key, userSettings) for a settings-dependent reward and substitutes it if it exists, then recomputes the sums. | 1025 |
| `gameplay_missions_progress.setSavePath(path)` | Directly sets the save folder; with no argument, returns to the default slot. | 288 |
| `gameplay_missions_progress.setSaveSlot(slotName)` | Changes the save slot: the path becomes settings/cloud/missionProgress/<slotName>/. | 282 |
| `gameplay_missions_progress.startBatchMode()` | Enables batch mode: aggregateAttempt skips the unlock computations and the permanent log. | 1864 |
| `gameplay_missions_progress.tryBuildContext(label, data)` | Builds a translation context table from `data`, keeping only string or number values (converted to string). Returns {} if label is nil. | 1566 |

### Parameter details

#### `gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt)`

Prepares, for the career end-of-mission UI, the reward details per attribute (total, icon, detail per star obtained, animation duration and sound pitch computed by a sigmoid-like curve). Does nothing outside career.

- `starRewards` (*table*) : starRewards table built by aggregateAttempt (originalRewardsPerStar, sums...).
- `mission` (*table*) : Mission.
- `attempt` (*table*) : Attempt (unlockedStars field).
- **returns**: table|nil {list = {...}} or nil outside career.

#### `gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey)`

Records an attempt in a mission's progress: sanitizes the attempt, adds it to progress.attempts, updates the aggregate (best type, number of tries, DNF, "recent" leaderboard), emits onMissionAttemptAggregated(attempt, mission, progressKey), unlocks the stars, achievements (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS and the mission type's), applies the automatic aggregates and mission:aggregateAttempt, distributes career rewards and computes the unlocks (missions, leagues, quick travel, settings).

- `id` (*string*) : Mission id.
- `attempt` (*table*) : Attempt (newAttempt); modified in place (type, unlockedStars, attemptNumber, dnfCount).
- `progressKey` (*string|nil*) : Progress key; defaults to mission.defaultProgressKey or 'default'.
- **returns**: table|nil Outside batch mode: {formattedAttempt, aggregateChange, unlockChange, nextMissionsUnlock, unlockedMissions, unlockedStarsAttempt, unlockedStarsChanged, starRewards, formattedRewards, unlockedLeagues?, quickTravelUnlockedChange?, userSettingsUnlockedChange?}. In batch mode: {}. nil if the mission does not exist.

#### `gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey)`

Creates, if missing, the progress of a key (blank aggregate bestType='none', empty attempts, empty "recent" leaderboard).

- `missionInstance` (*table*) : Built mission.
- `progressKey` (*string*) : Progress key.

#### `gameplay_missions_progress.formatAttemptSimple(attempt, mission)`

Formats an attempt for the UI: list {value, label, mainResult} based on mission.autoUiAttemptProgress.

- `attempt` (*table*) : Attempt.
- `mission` (*table*) : Mission.
- **returns**: table {list = {...}}.

#### `gameplay_missions_progress.formatSaveDataForBigmap(id)`

Formats the progress for the big map (aggregates configured in mission.autoUiBigmap, unlocked stars).

- `id` (*string*) : Mission id.
- **returns**: table|nil Formatted data; nil if the mission does not exist. Notably contains unlockedStars (formatStars).

#### `gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts)`

Formats a mission's entire progress (per progress key) for the mission screen, including automatic replay recordings (core_replay.getMissionReplayFiles).

- `id` (*string*) : Mission id.
- `onlyKey` (*string|nil*) : Limits to one progress key.
- `includeMostRecentAttempt` (*boolean|nil*) : Include the most recent attempt.
- `fillAttempts` (*boolean|nil*) : Include the full list of attempts (inferred from code).
- **returns**: table|nil Formatted data; nil if the mission does not exist.

#### `gameplay_missions_progress.formatStars(mission)`

Formats the mission's stars for the UI (sorted list, number unlocked default/bonus, total). Returns {disabled=true} if the mission has no active stars.

- `mission` (*table*) : Mission.
- **returns**: table Formatted stars.

#### `gameplay_missions_progress.generateAttempt(id, addAttemptData)`

Test tool: creates a random attempt (mission:getRandomizedAttempt), adds addAttemptData to it, aggregates it then saves (via career_modules_missionWrapper in career, otherwise saveMissionSaveData). Does dump() calls in the console.

- `id` (*string*) : Mission id.
- `addAttemptData` (*table*) : Fields added to the attempt (must not be nil).
- **returns**: table|nil Result of aggregateAttempt.

#### `gameplay_missions_progress.generateAttempts(id, amount, dumpChange)`

Test tool: aggregates `amount` random attempts for each progress key of the mission.

- `id` (*string*) : Mission id.
- `amount` (*integer*) : Number of attempts per key.
- `dumpChange` (*boolean|nil*) : Show the aggregated change.

#### `gameplay_missions_progress.getBatchMode()`

Indicates whether batch mode is active.

- **returns**: boolean true if active.

#### `gameplay_missions_progress.getLeaderboardChangeKeys(missionId)`

Returns the leaderboard -> new-record key table: 'recent' -> 'newRecentLeaderboardEntryKey', plus those of the automatic aggregates (leaderboardKey -> newLeaderboardEntryKey).

- `missionId` (*string*) : Mission id.
- **returns**: table<string, string> Mapping (empty if the mission does not exist).

#### `gameplay_missions_progress.getSaveSlot()`

Returns the current save slot name and its folder.

- **returns**: string Slot name.
- **returns**: string Save folder.

#### `gameplay_missions_progress.getUnlockedStarCountsForMissionById(id)`

Counts the unlocked stars: returns the number of default stars and the number of unlocked bonus stars.

- `id` (*string*) : Mission id.
- **returns**: integer Default stars unlocked.
- **returns**: integer Unlocked bonus stars (0 if no stars; 0, 0, 0 if the mission is not found).

#### `gameplay_missions_progress.loadMissionSaveData(mission)`

Loads a mission's progress data from disk (converts old star booleans to counters, notifies career, updates if the version is old, calls mission:loadSaveData). Returns blank data if the file is missing or unreadable.

- `mission` (*table*) : Built mission.
- **returns**: table Mission saveData.
- **returns**: boolean|nil true if the data was updated to a newer version.

#### `gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId)`

Indicates whether quick travel to the mission is unlocked. Always returns true for an existing mission (the save condition is commented out).

- `missionId` (*string*) : Mission id.
- **returns**: boolean true (false if the mission does not exist).

#### `gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId)`

Indicates whether the mission's user settings are unlocked. Always returns true for an existing mission.

- `missionId` (*string*) : Mission id.
- **returns**: boolean true (false if the mission does not exist).

#### `gameplay_missions_progress.newAttempt(type, data)`

Creates an attempt table {type, date (os.time), humanDate (ISO 8601 UTC), data}.

- `type` (*string*) : Result type: completed, passed, attempted, abandoned, failed or none (will be recomputed by aggregateAttempt).
- `data` (*table|nil*) : Data specific to the mission type.
- **returns**: table Attempt.

#### `gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission)`

In career, reduces the rewards of each already-obtained active star (money to 10% of the original value, vouchers to 0) then recomputes the reward sums. Outside career, only recomputes the sums.

- `mission` (*table*) : Built mission.

#### `gameplay_missions_progress.saveMissionSaveData(id, dirtyDate)`

Writes mission.saveData to <folder>/<id>.json (indented JSON) after setting dirtyDate on it.

- `id` (*string*) : Mission id.
- `dirtyDate` (*number|nil*) : Modification date for career synchronization.
- **returns**: boolean|nil Result of jsonWriteFile; nil if the mission does not exist.

#### `gameplay_missions_progress.setDynamicStarRewards(mission, userSettings)`

For each star, asks mission:getDynamicStarReward(key, userSettings) for a settings-dependent reward and substitutes it if it exists, then recomputes the sums.

- `mission` (*table*) : Built mission.
- `userSettings` (*table|nil*) : Settings; defaults to mission.lastUserSettings.

#### `gameplay_missions_progress.setSavePath(path)`

Directly sets the save folder; with no argument, returns to the default slot.

- `path` (*string|nil*) : Folder ending with "/".

#### `gameplay_missions_progress.setSaveSlot(slotName)`

Changes the save slot: the path becomes settings/cloud/missionProgress/<slotName>/.

- `slotName` (*string*) : Slot name ("default" by default).

#### `gameplay_missions_progress.tryBuildContext(label, data)`

Builds a translation context table from `data`, keeping only string or number values (converted to string). Returns {} if label is nil.

- `label` (*any*) : Label; if nil, the context is empty.
- `data` (*table*) : Source data.
- **returns**: table<string, string> Context.

## Fields

| Field | Type | Description |
|---|---|---|
| `formatAggregatesForMissionTypeWithProgKey` | nil | Is nil: the local of the same name does not exist in the file. ⚠ reference `formatAggregatesForMissionTypeWithProgKey` not defined in the file (probably nil) |
| `getProgressAggregateCache` | nil | Is nil: the local of the same name does not exist in the file. ⚠ reference `getProgressAggregateCache` not defined in the file (probably nil) |
| `getSaveSlotVersion` | nil | Is nil: the local of the same name does not exist in the file. ⚠ reference `getSaveSlotVersion` not defined in the file (probably nil) |
| `setSaveSlotVersion` | nil | Is nil: the local of the same name does not exist in the file. ⚠ reference `setSaveSlotVersion` not defined in the file (probably nil) |
| `startConditionMet` | nil | Is nil: the local of the same name does not exist in the file. ⚠ reference `startConditionMet` not defined in the file (probably nil) |
| `testHelper` | table | Internal test tools (e.g. testHelper.randomAttemptType, used by sanitizeMissionAfterCreation for getRandomizedAttempt). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMissionAttemptAggregated` — listened to by 2 module(s)
- `onMissionUnlocked`

## Calls into the engine (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/progress.lua`.*
