# `gameplay_missions_unlocks`

*File: `lua/ge/extensions/gameplay/missions/unlocks.lua` · VM: Game Engine (GE) · 485 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_unlocks`: `extensions.load("gameplay_missions_unlocks")`, then the global `gameplay_missions_unlocks`

GE extension that evaluates the unlock and visibility conditions of missions (startCondition and visibleCondition fields). On load, it loads all condition types from the gameplay/missions/unlocks/conditions/ folder. It also builds caches: previous missions (backward), next missions (forward), depth in the tree and required career branch level. A modder uses it to know whether a mission is startable/visible or to force these states.

## Example

```lua
local m = gameplay_missions_missions.getMissionById('west_coast_usa/timeTrials/xyz')
if gameplay_missions_unlocks.isMissionStartable(m) then ... end
gameplay_missions_unlocks.overrideStartable(m, true)
```

## Notes

- M.startConditionMet is exported but references a nonexistent local variable: it is always nil (game bug).
- Outside career, a mission shown in both career and freeroam is always startable and visible (computeStartableDetails returns nil).
- Results are cached by mission id: call clearUnlockStatusCache() after a progress change.
- A visibleCondition of type 'automatic' makes the mission visible if at least one previous mission is startable (or if there are none).
- getBranchLevelForCondition calls M.getBranchLevelForCondition for recursion (not the local): no consequence as long as M is not replaced.
- Overrides (overrideStartable / overrideVisible) take precedence over the computation and are never cleared by clearCache.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_unlocks.clearCache()` | Clears the state cache as well as the backward and forward caches. | 478 |
| `gameplay_missions_unlocks.clearUnlockStatusCache()` | Clears the startable/visible state cache (and the career leagues cache if present). | 471 |
| `gameplay_missions_unlocks.conditionMet(condition)` | Recursively evaluates a condition. Looks up the type among the loaded types (falls back to 'missing' if unknown), calls its conditionMet and its getLabel. | 16 |
| `gameplay_missions_unlocks.constructUnlocksField(mission)` | Assembles a mission's unlocks field. | 399 |
| `gameplay_missions_unlocks.depthIdSort(a, b)` | Comparator for table.sort on missions: by ascending depth then by id. | 450 |
| `gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId)` | Like depthIdSort but from mission ids. Returns false if either mission does not exist. | 459 |
| `gameplay_missions_unlocks.getBackwardMissionIds(mission)` | Ids of the missions required by this mission's startCondition (cached). | 363 |
| `gameplay_missions_unlocks.getBranchLevelForCondition(cond, list)` | Recursively collects the required career branch levels (branchLevel conditions, and league via the league's branch, level 1). | 112 |
| `gameplay_missions_unlocks.getForwardMissionInfo(mission)` | Forward information: unlocked missions, max branch level, branch tags and depth. Rebuilds the full cache if needed (loads all missions). | 374 |
| `gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff)` | For a mission, lists the missions it directly unlocks (forwardIds), with their startable state and whether they changed in diff. | 82 |
| `gameplay_missions_unlocks.getMissionsForCondition(cond, list)` | Recursively collects the mission ids referenced by the missionPassed and missionCompleted conditions. | 98 |
| `gameplay_missions_unlocks.getSimpleUnlockedStatus()` | Builds a flat table (mission id -> deep copy of constructUnlocksField) to compare the unlock state before/after an action. | 33 |
| `gameplay_missions_unlocks.getStartableDetails(mission)` | Details (cached) of the startCondition evaluation. Returns nil for a mission present in both career and freeroam when career is not active. | 277 |
| `gameplay_missions_unlocks.getUnlockDiff(before, after)` | Compares two getSimpleUnlockedStatus results on the startable and visible keys. | 58 |
| `gameplay_missions_unlocks.isMissionStartable(mission)` | Indicates whether the mission is startable. An override set by overrideStartable takes precedence, otherwise the startCondition result is used. | 296 |
| `gameplay_missions_unlocks.isMissionVisible(mission)` | Indicates whether the mission is visible (depending on career/freeroam mode and visibleCondition). An override set by overrideVisible takes precedence. Result cached. | 346 |
| `gameplay_missions_unlocks.onExtensionLoaded()` | Hook called when the extension loads: loads all files from /lua/ge/extensions/gameplay/missions/unlocks/conditions and registers each condition type. *(internal)* *(hook)* | 435 |
| `gameplay_missions_unlocks.overrideStartable(mission, value)` | Forces a mission's startable state (nil to remove the override). | 391 |
| `gameplay_missions_unlocks.overrideVisible(mission, value)` | Forces a mission's visibility (nil to remove the override). | 395 |

### Parameter details

#### `gameplay_missions_unlocks.conditionMet(condition)`

Recursively evaluates a condition. Looks up the type among the loaded types (falls back to 'missing' if unknown), calls its conditionMet and its getLabel.

- `condition` (*table*) : Condition with a type field (e.g. missionPassed, branchLevel, multiAnd) and its parameters.
- **returns**: table {met = boolean, condition = table, nested = table|nil (results of the sub-conditions), label = string|table, hidden = boolean|nil}

#### `gameplay_missions_unlocks.constructUnlocksField(mission)`

Assembles a mission's unlocks field.

- `mission` (*table*) : Mission.
- **returns**: table {startable, visible, startableDetails, backward, forward, maxBranchLevel, branchTags, depth}

#### `gameplay_missions_unlocks.depthIdSort(a, b)`

Comparator for table.sort on missions: by ascending depth then by id.

- `a` (*table*) : Mission.
- `b` (*table*) : Mission.
- **returns**: boolean true if a must come before b.

#### `gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId)`

Like depthIdSort but from mission ids. Returns false if either mission does not exist.

- `aId` (*string*) : Mission id.
- `bId` (*string*) : Mission id.
- **returns**: boolean true if a must come before b.

#### `gameplay_missions_unlocks.getBackwardMissionIds(mission)`

Ids of the missions required by this mission's startCondition (cached).

- `mission` (*table*) : Mission.
- **returns**: string[] List of ids.

#### `gameplay_missions_unlocks.getBranchLevelForCondition(cond, list)`

Recursively collects the required career branch levels (branchLevel conditions, and league via the league's branch, level 1).

- `cond` (*table*) : Condition to walk.
- `list` (*table<string, integer>*) : Table branchId -> level, filled in place.

#### `gameplay_missions_unlocks.getForwardMissionInfo(mission)`

Forward information: unlocked missions, max branch level, branch tags and depth. Rebuilds the full cache if needed (loads all missions).

- `mission` (*table*) : Mission.
- **returns**: table {forwardIds = string[], maxBranchLevel = integer, branchTags = table<string, boolean>, depth = integer}

#### `gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff)`

For a mission, lists the missions it directly unlocks (forwardIds), with their startable state and whether they changed in diff.

- `mission` (*table*) : Source mission.
- `diff` (*table*) : Result of getUnlockDiff (uses diff.byId).
- **returns**: table {list = {{missionId, changed, startable}}}

#### `gameplay_missions_unlocks.getMissionsForCondition(cond, list)`

Recursively collects the mission ids referenced by the missionPassed and missionCompleted conditions.

- `cond` (*table*) : Condition (walks cond.nested).
- `list` (*string[]*) : List filled in place.

#### `gameplay_missions_unlocks.getSimpleUnlockedStatus()`

Builds a flat table (mission id -> deep copy of constructUnlocksField) to compare the unlock state before/after an action.

- **returns**: table<string, table> Unlock data per mission id.

#### `gameplay_missions_unlocks.getStartableDetails(mission)`

Details (cached) of the startCondition evaluation. Returns nil for a mission present in both career and freeroam when career is not active.

- `mission` (*table*) : Mission.
- **returns**: table|nil Result of conditionMet (met, label, nested...).

#### `gameplay_missions_unlocks.getUnlockDiff(before, after)`

Compares two getSimpleUnlockedStatus results on the startable and visible keys.

- `before` (*table*) : State before.
- `after` (*table*) : State after.
- **returns**: table {list = {{missionId, change = {{key, old, new}}}}, byId = table, missionsList = {{name, id}} (missions that became startable)}

#### `gameplay_missions_unlocks.isMissionStartable(mission)`

Indicates whether the mission is startable. An override set by overrideStartable takes precedence, otherwise the startCondition result is used.

- `mission` (*table*) : Mission.
- **returns**: boolean true if startable.

#### `gameplay_missions_unlocks.isMissionVisible(mission)`

Indicates whether the mission is visible (depending on career/freeroam mode and visibleCondition). An override set by overrideVisible takes precedence. Result cached.

- `mission` (*table*) : Mission.
- **returns**: boolean true if visible.

#### `gameplay_missions_unlocks.overrideStartable(mission, value)`

Forces a mission's startable state (nil to remove the override).

- `mission` (*table*) : Mission.
- `value` (*boolean|nil*) : Forced value.

#### `gameplay_missions_unlocks.overrideVisible(mission, value)`

Forces a mission's visibility (nil to remove the override).

- `mission` (*table*) : Mission.
- `value` (*boolean|nil*) : Forced value.

## Fields

| Field | Type | Description |
|---|---|---|
| `startConditionMet` | nil | Exported from an undefined variable: always nil. ⚠ reference `startConditionMet` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/unlocks.lua`.*
