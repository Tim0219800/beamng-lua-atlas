---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/branches.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tree of domains, branches and skills of career mode. It reads all info.json files under /gameplay/domains/ (recursively) and infers from the folder structure (domains / branches / skills) the pathId (folder names joined by "-", e.g. "apm-motorsport"), the parent and the type (isDomain, isBranch, isSkill). It computes levels and XP from the value of the player's attribute (career_modules_playerAttributes), the reward multipliers per level, the unlock conditions (flags) and saves the "unlocked" state in career/branchUnlocks.json.
--- Access: extension `career_branches`: `extensions.load("career_branches")`, then the global `career_branches`
---@class career_branches
---@field newAttributeNamesToOldNames table<string, string> Inverse table. Built from the old table; if several old names target the same path, the last one walked wins.
---@field oldAttributeNamesToNewNames table<string, string> Old attribute names to current paths (e.g. drift to bmra-drift).
---@field onPlayerAttributesChanged nil Always nil: reference to a variable not defined in the file.
career_branches = {}

--- Computes a branch's level for an XP value: last level whose requiredValue <= val, plus the progress toward the next one.
---Source: lua/ge/extensions/career/branches.lua:294
---@param val number Attribute value (XP).
---@param id string Branch identifier.
---@return integer  Level (-1 if none).
---@return number  Progress within the current level (-1 if there is no next).
---@return number  XP needed to reach the next level (-1 if there is no next).
---@return number  Threshold of the current level (-1 if there is no next).
---@return number  Threshold of the next level (-1 if there is no next).
function career_branches.calcBranchLevelFromValue(val, id) end

--- Recomputes unlocked, unlockInfo, lockedReason and unlockInfos of each branch according to unlockCondition and career_modules_unlockFlags.
---Source: lua/ge/extensions/career/branches.lua:462
function career_branches.checkUnlocks() end

--- Replaces in a level's unlock list each "automaticMission" entry with an "unlockCard" card giving the number of challenges available for this branch; the other entries are kept.
---Source: lua/ge/extensions/career/branches.lua:396
---@param skill table Branch (id used).
---@param level integer Level (not used in the computation).
---@param unlocks table[] Unlock list of the level.
---@return table[]  New list.
function career_branches.expandUnlocks(skill, level, unlocks) end

--- Infers the pathId from a file path located under /gameplay/domains/.
---Source: lua/ge/extensions/career/branches.lua:624
---@param filePath string Path of a branch's file.
---@return string  pathId.
function career_branches.extractBranchPathIdFromFilePath(filePath) end

--- Builds the pathId "domain-branch-skill" (absent parts are omitted) and returns the branch.
---Source: lua/ge/extensions/career/branches.lua:265
---@param domainId string Domain.
---@param branchId string|nil Branch.
---@param skillId string|nil Skill (used only if branchId is given).
---@return table  The branch.
function career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId) end

--- Alias of getBranchByPath.
---Source: lua/ge/extensions/career/branches.lua:248
---@param id string Identifier (pathId).
---@return table  The branch, or the "missing" branch.
function career_branches.getBranchById(id) end

--- Looks up a branch by pathId; accepts the old names (warning logged).
---Source: lua/ge/extensions/career/branches.lua:252
---@param pathId string Path like "apm-motorsport".
---@return table  The branch or the "missing" branch.
function career_branches.getBranchByPath(pathId) end

--- Returns the branch's icon (nil if "missing").
---Source: lua/ge/extensions/career/branches.lua:360
---@param id string Branch identifier.
---@return string|nil  Icon.
function career_branches.getBranchIcon(id) end

--- The player's current level in a branch (based on their attribute). Returns nil if the branch is unknown; also returns the values of calcBranchLevelFromValue.
---Source: lua/ge/extensions/career/branches.lua:331
---@param id string Branch identifier.
---@return integer|nil  Level.
function career_branches.getBranchLevel(id) end

--- Same as getBranchLevel, taking a pathId.
---Source: lua/ge/extensions/career/branches.lua:338
---@param pathId string Branch path.
---@return integer|nil  Level.
function career_branches.getBranchLevelByPath(pathId) end

--- Returns a summary for the UI: label, level, icon, curLvlProgress, neededForNext, processPercent and max (number of levels).
---Source: lua/ge/extensions/career/branches.lua:315
---@param id string Branch identifier.
---@return table  Summary.
function career_branches.getBranchSimpleInfo(id) end

--- The player's attribute value (XP) for the branch, -1 if it is unknown to the attribute system, nil if the branch is "missing".
---Source: lua/ge/extensions/career/branches.lua:345
---@param id string Branch identifier.
---@return number|nil  XP.
function career_branches.getBranchXP(id) end

--- Returns all branches keyed by id. On the first call, loads the info.json files of /gameplay/domains/, sorts them (domains then children) and propagates the parent's color.
---Source: lua/ge/extensions/career/branches.lua:158
---@return table<string, table>  Branches by id.
function career_branches.getBranches() end

--- Label of a level: "ui.career.lvlLabelMax" for the last one, the level's levelName otherwise, or a text with context {lvl}.
---Source: lua/ge/extensions/career/branches.lua:366
---@param id string Branch identifier.
---@param level integer|nil Level.
---@return string|table|nil  Translation key or table {txt, context}.
function career_branches.getLevelLabel(id, level) end

--- Reward multiplier of the player's current level (levels[level].rewardMultiplier). The default multipliers go from 1 to 5 in steps of 0.25 when the branch declares defaultRewardMultipliers.
---Source: lua/ge/extensions/career/branches.lua:374
---@param id string Branch identifier.
---@return number|nil  Multiplier.
function career_branches.getLevelRewardMultiplier(id) end

--- Returns the order of an attribute key (order table) or -math.huge if unknown.
---Source: lua/ge/extensions/career/branches.lua:21
---@param key string Attribute key (money, beamXP, ...).
---@return number  Order rank.
function career_branches.getOrder(key) end

--- Returns the list of branches sorted by order (cached).
---Source: lua/ge/extensions/career/branches.lua:281
---@return table[]  Sorted branches.
function career_branches.getSortedBranches() end

--- XP required (requiredValue) to reach a level, -1 if the level does not exist.
---Source: lua/ge/extensions/career/branches.lua:352
---@param id string Branch identifier.
---@param level integer Target level.
---@return number|nil  Required XP.
function career_branches.getXPNeededForLevel(id, level) end

--- Hook called on career activation/deactivation; on activation reads branchUnlocks.json (see notes: the restoration is empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/branches.lua:445
---@param active boolean Career active or not.
function career_branches.onCareerActive(active) end

--- Hook where each branch declares unlock flags: "<id>-level-<n>" for each level (and unlockFlags of the level) and one flag per certification (set when the required mission is passed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/branches.lua:509
---@param flagDefinitions table<string, table> Table to fill with the flag definitions.
function career_branches.onGetUnlockFlagDefinitions(flagDefinitions) end

--- Profile save hook: writes <save>/career/branchUnlocks.json with the unlocked field of each branch (career_saveSystem.jsonWriteFileSafe).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/branches.lua:432
---@param currentSavePath string Folder of the current save.
function career_branches.onSaveCurrentProfile(currentSavePath) end

--- Sorts a list of attribute keys in place according to the branch order and returns it.
---Source: lua/ge/extensions/career/branches.lua:383
---@param list string[] Keys to sort.
---@return string[]  The same sorted list.
function career_branches.orderAttributeKeysByBranchOrder(list) end

--- Sorts a list of branch identifiers (all by default) according to the branch order.
---Source: lua/ge/extensions/career/branches.lua:389
---@param list string[]|nil Identifiers; default: all branches.
---@return string[]  Sorted list.
function career_branches.orderBranchNamesKeysByBranchOrder(list) end

