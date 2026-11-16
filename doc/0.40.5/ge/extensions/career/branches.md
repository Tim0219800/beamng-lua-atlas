# `career_branches`

*File: `lua/ge/extensions/career/branches.lua` · VM: Game Engine (GE) · 651 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_branches`: `extensions.load("career_branches")`, then the global `career_branches`

Tree of domains, branches and skills of career mode. It reads all info.json files under /gameplay/domains/ (recursively) and infers from the folder structure (domains / branches / skills) the pathId (folder names joined by "-", e.g. "apm-motorsport"), the parent and the type (isDomain, isBranch, isSkill). It computes levels and XP from the value of the player's attribute (career_modules_playerAttributes), the reward multipliers per level, the unlock conditions (flags) and saves the "unlocked" state in career/branchUnlocks.json.

## Notes

- A branch level is defined by levels[i].requiredValue; calcBranchLevelFromValue returns -1 if no threshold is reached. A "missing" branch (id = "missing") is returned when the identifier is unknown.
- Old attribute names (timeTrials, drift, delivery, police…) are translated to the new paths via oldAttributeNamesToNewNames, with a warning in the log.
- A branch with isInDevelopment is locked (unlockCondition type "never"). unlockCondition types handled in checkUnlocks: unlockFlag, anyNunlockFlags (at least n flags among a list) and never.
- Display order: domains sorted by order, then their children recursively; order[attributeKey] (money = 0, beamXP = 1, vouchers = 9999) is used to sort the attributes.
- The "max" level is the last level whose isInDevelopment is false (levels[i].isMaxLevel).
- Bug: M.onPlayerAttributesChanged = onPlayerAttributesChanged exports an undefined variable (nil).
- Bug: onCareerActive rereads branchUnlocks.json but the inner loop that should reapply the fields is empty; the saved "unlocked" values are therefore not restored here (checkUnlocks recomputes them).
- Potential bug: getLevelRewardMultiplier indexes branch.levels[level] without a check; if the level is -1 (no threshold reached), the index is nil and the field access fails. getBranchSimpleInfo can also divide by neededForNext = -1 at the last level.
- moduleVersion = 42: an older save (info.json version < 42) is considered outdated.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_branches.calcBranchLevelFromValue(val, id)` | Computes a branch's level for an XP value: last level whose requiredValue <= val, plus the progress toward the next one. | 294 |
| `career_branches.checkUnlocks()` | Recomputes unlocked, unlockInfo, lockedReason and unlockInfos of each branch according to unlockCondition and career_modules_unlockFlags. | 462 |
| `career_branches.expandUnlocks(skill, level, unlocks)` | Replaces in a level's unlock list each "automaticMission" entry with an "unlockCard" card giving the number of challenges available for this branch; the other entries are kept. | 396 |
| `career_branches.extractBranchPathIdFromFilePath(filePath)` | Infers the pathId from a file path located under /gameplay/domains/. | 624 |
| `career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId)` | Builds the pathId "domain-branch-skill" (absent parts are omitted) and returns the branch. | 265 |
| `career_branches.getBranchById(id)` | Alias of getBranchByPath. | 248 |
| `career_branches.getBranchByPath(pathId)` | Looks up a branch by pathId; accepts the old names (warning logged). | 252 |
| `career_branches.getBranchIcon(id)` | Returns the branch's icon (nil if "missing"). | 360 |
| `career_branches.getBranchLevel(id)` | The player's current level in a branch (based on their attribute). Returns nil if the branch is unknown; also returns the values of calcBranchLevelFromValue. | 331 |
| `career_branches.getBranchLevelByPath(pathId)` | Same as getBranchLevel, taking a pathId. | 338 |
| `career_branches.getBranchSimpleInfo(id)` | Returns a summary for the UI: label, level, icon, curLvlProgress, neededForNext, processPercent and max (number of levels). | 315 |
| `career_branches.getBranchXP(id)` | The player's attribute value (XP) for the branch, -1 if it is unknown to the attribute system, nil if the branch is "missing". | 345 |
| `career_branches.getBranches()` | Returns all branches keyed by id. On the first call, loads the info.json files of /gameplay/domains/, sorts them (domains then children) and propagates the parent's color. | 158 |
| `career_branches.getLevelLabel(id, level)` | Label of a level: "ui.career.lvlLabelMax" for the last one, the level's levelName otherwise, or a text with context {lvl}. | 366 |
| `career_branches.getLevelRewardMultiplier(id)` | Reward multiplier of the player's current level (levels[level].rewardMultiplier). The default multipliers go from 1 to 5 in steps of 0.25 when the branch declares defaultRewardMultipliers. | 374 |
| `career_branches.getOrder(key)` | Returns the order of an attribute key (order table) or -math.huge if unknown. | 21 |
| `career_branches.getSortedBranches()` | Returns the list of branches sorted by order (cached). | 281 |
| `career_branches.getXPNeededForLevel(id, level)` | XP required (requiredValue) to reach a level, -1 if the level does not exist. | 352 |
| `career_branches.onCareerActive(active)` | Hook called on career activation/deactivation; on activation reads branchUnlocks.json (see notes: the restoration is empty). *(internal)* *(hook)* | 445 |
| `career_branches.onGetUnlockFlagDefinitions(flagDefinitions)` | Hook where each branch declares unlock flags: "<id>-level-<n>" for each level (and unlockFlags of the level) and one flag per certification (set when the required mission is passed). *(internal)* *(hook)* | 509 |
| `career_branches.onSaveCurrentProfile(currentSavePath)` | Profile save hook: writes <save>/career/branchUnlocks.json with the unlocked field of each branch (career_saveSystem.jsonWriteFileSafe). *(internal)* *(hook)* | 432 |
| `career_branches.orderAttributeKeysByBranchOrder(list)` | Sorts a list of attribute keys in place according to the branch order and returns it. | 383 |
| `career_branches.orderBranchNamesKeysByBranchOrder(list)` | Sorts a list of branch identifiers (all by default) according to the branch order. | 389 |

### Parameter details

#### `career_branches.calcBranchLevelFromValue(val, id)`

Computes a branch's level for an XP value: last level whose requiredValue <= val, plus the progress toward the next one.

- `val` (*number*) : Attribute value (XP).
- `id` (*string*) : Branch identifier.
- **returns**: integer Level (-1 if none).
- **returns**: number Progress within the current level (-1 if there is no next).
- **returns**: number XP needed to reach the next level (-1 if there is no next).
- **returns**: number Threshold of the current level (-1 if there is no next).
- **returns**: number Threshold of the next level (-1 if there is no next).

#### `career_branches.expandUnlocks(skill, level, unlocks)`

Replaces in a level's unlock list each "automaticMission" entry with an "unlockCard" card giving the number of challenges available for this branch; the other entries are kept.

- `skill` (*table*) : Branch (id used).
- `level` (*integer*) : Level (not used in the computation).
- `unlocks` (*table[]*) : Unlock list of the level.
- **returns**: table[] New list.

#### `career_branches.extractBranchPathIdFromFilePath(filePath)`

Infers the pathId from a file path located under /gameplay/domains/.

- `filePath` (*string*) : Path of a branch's file.
- **returns**: string pathId.

#### `career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId)`

Builds the pathId "domain-branch-skill" (absent parts are omitted) and returns the branch.

- `domainId` (*string*) : Domain.
- `branchId` (*string|nil*) : Branch.
- `skillId` (*string|nil*) : Skill (used only if branchId is given).
- **returns**: table The branch.

#### `career_branches.getBranchById(id)`

Alias of getBranchByPath.

- `id` (*string*) : Identifier (pathId).
- **returns**: table The branch, or the "missing" branch.

#### `career_branches.getBranchByPath(pathId)`

Looks up a branch by pathId; accepts the old names (warning logged).

- `pathId` (*string*) : Path like "apm-motorsport".
- **returns**: table The branch or the "missing" branch.

#### `career_branches.getBranchIcon(id)`

Returns the branch's icon (nil if "missing").

- `id` (*string*) : Branch identifier.
- **returns**: string|nil Icon.

#### `career_branches.getBranchLevel(id)`

The player's current level in a branch (based on their attribute). Returns nil if the branch is unknown; also returns the values of calcBranchLevelFromValue.

- `id` (*string*) : Branch identifier.
- **returns**: integer|nil Level.

#### `career_branches.getBranchLevelByPath(pathId)`

Same as getBranchLevel, taking a pathId.

- `pathId` (*string*) : Branch path.
- **returns**: integer|nil Level.

#### `career_branches.getBranchSimpleInfo(id)`

Returns a summary for the UI: label, level, icon, curLvlProgress, neededForNext, processPercent and max (number of levels).

- `id` (*string*) : Branch identifier.
- **returns**: table Summary.

#### `career_branches.getBranchXP(id)`

The player's attribute value (XP) for the branch, -1 if it is unknown to the attribute system, nil if the branch is "missing".

- `id` (*string*) : Branch identifier.
- **returns**: number|nil XP.

#### `career_branches.getBranches()`

Returns all branches keyed by id. On the first call, loads the info.json files of /gameplay/domains/, sorts them (domains then children) and propagates the parent's color.

- **returns**: table<string, table> Branches by id.

#### `career_branches.getLevelLabel(id, level)`

Label of a level: "ui.career.lvlLabelMax" for the last one, the level's levelName otherwise, or a text with context {lvl}.

- `id` (*string*) : Branch identifier.
- `level` (*integer|nil*) : Level.
- **returns**: string|table|nil Translation key or table {txt, context}.

#### `career_branches.getLevelRewardMultiplier(id)`

Reward multiplier of the player's current level (levels[level].rewardMultiplier). The default multipliers go from 1 to 5 in steps of 0.25 when the branch declares defaultRewardMultipliers.

- `id` (*string*) : Branch identifier.
- **returns**: number|nil Multiplier.

#### `career_branches.getOrder(key)`

Returns the order of an attribute key (order table) or -math.huge if unknown.

- `key` (*string*) : Attribute key (money, beamXP, ...).
- **returns**: number Order rank.

#### `career_branches.getSortedBranches()`

Returns the list of branches sorted by order (cached).

- **returns**: table[] Sorted branches.

#### `career_branches.getXPNeededForLevel(id, level)`

XP required (requiredValue) to reach a level, -1 if the level does not exist.

- `id` (*string*) : Branch identifier.
- `level` (*integer*) : Target level.
- **returns**: number|nil Required XP.

#### `career_branches.onCareerActive(active)`

Hook called on career activation/deactivation; on activation reads branchUnlocks.json (see notes: the restoration is empty).

- `active` (*boolean*) : Career active or not.

#### `career_branches.onGetUnlockFlagDefinitions(flagDefinitions)`

Hook where each branch declares unlock flags: "<id>-level-<n>" for each level (and unlockFlags of the level) and one flag per certification (set when the required mission is passed).

- `flagDefinitions` (*table<string, table>*) : Table to fill with the flag definitions.

#### `career_branches.onSaveCurrentProfile(currentSavePath)`

Profile save hook: writes <save>/career/branchUnlocks.json with the unlocked field of each branch (career_saveSystem.jsonWriteFileSafe).

- `currentSavePath` (*string*) : Folder of the current save.

#### `career_branches.orderAttributeKeysByBranchOrder(list)`

Sorts a list of attribute keys in place according to the branch order and returns it.

- `list` (*string[]*) : Keys to sort.
- **returns**: string[] The same sorted list.

#### `career_branches.orderBranchNamesKeysByBranchOrder(list)`

Sorts a list of branch identifiers (all by default) according to the branch order.

- `list` (*string[]|nil*) : Identifiers; default: all branches.
- **returns**: string[] Sorted list.

## Fields

| Field | Type | Description |
|---|---|---|
| `newAttributeNamesToOldNames` | table<string, string> | Inverse table. Built from the old table; if several old names target the same path, the last one walked wins. |
| `oldAttributeNamesToNewNames` | table<string, string> | Old attribute names to current paths (e.g. drift to bmra-drift). |
| `onPlayerAttributesChanged` | nil | Always nil: reference to a variable not defined in the file. ⚠ reference `onPlayerAttributesChanged` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/branches.lua`.*
