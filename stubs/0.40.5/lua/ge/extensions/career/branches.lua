---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/branches.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_branches` : `extensions.load("career_branches")`, puis la globale `career_branches`
---@class career_branches
---@field newAttributeNamesToOldNames table
---@field oldAttributeNamesToNewNames table
---@field onPlayerAttributesChanged any
career_branches = {}

---Source : lua/ge/extensions/career/branches.lua:294
---@param val any
---@param id any
function career_branches.calcBranchLevelFromValue(val, id) end

---Source : lua/ge/extensions/career/branches.lua:462
function career_branches.checkUnlocks() end

---Source : lua/ge/extensions/career/branches.lua:396
---@param skill any
---@param level any
---@param unlocks any
function career_branches.expandUnlocks(skill, level, unlocks) end

---Source : lua/ge/extensions/career/branches.lua:624
---@param filePath any
function career_branches.extractBranchPathIdFromFilePath(filePath) end

---Source : lua/ge/extensions/career/branches.lua:265
---@param domainId any
---@param branchId any
---@param skillId any
function career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId) end

---Source : lua/ge/extensions/career/branches.lua:248
---@param id any
function career_branches.getBranchById(id) end

---Source : lua/ge/extensions/career/branches.lua:252
---@param pathId any
function career_branches.getBranchByPath(pathId) end

---Source : lua/ge/extensions/career/branches.lua:360
---@param id any
function career_branches.getBranchIcon(id) end

---Source : lua/ge/extensions/career/branches.lua:331
---@param id any
function career_branches.getBranchLevel(id) end

---Source : lua/ge/extensions/career/branches.lua:338
---@param pathId any
function career_branches.getBranchLevelByPath(pathId) end

---Source : lua/ge/extensions/career/branches.lua:315
---@param id any
function career_branches.getBranchSimpleInfo(id) end

---Source : lua/ge/extensions/career/branches.lua:345
---@param id any
function career_branches.getBranchXP(id) end

--- gets all branches in a dict by ID
---Source : lua/ge/extensions/career/branches.lua:158
function career_branches.getBranches() end

---Source : lua/ge/extensions/career/branches.lua:366
---@param id any
---@param level any
function career_branches.getLevelLabel(id, level) end

---Source : lua/ge/extensions/career/branches.lua:374
---@param id any
function career_branches.getLevelRewardMultiplier(id) end

---Source : lua/ge/extensions/career/branches.lua:21
---@param key any
function career_branches.getOrder(key) end

---Source : lua/ge/extensions/career/branches.lua:281
function career_branches.getSortedBranches() end

---Source : lua/ge/extensions/career/branches.lua:352
---@param id any
---@param level any
function career_branches.getXPNeededForLevel(id, level) end

---Source : lua/ge/extensions/career/branches.lua:445
---@param active any
function career_branches.onCareerActive(active) end

---Source : lua/ge/extensions/career/branches.lua:509
---@param flagDefinitions any
function career_branches.onGetUnlockFlagDefinitions(flagDefinitions) end

---Source : lua/ge/extensions/career/branches.lua:432
---@param currentSavePath any
function career_branches.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/branches.lua:383
---@param list any
function career_branches.orderAttributeKeysByBranchOrder(list) end

---Source : lua/ge/extensions/career/branches.lua:389
---@param list any
function career_branches.orderBranchNamesKeysByBranchOrder(list) end

