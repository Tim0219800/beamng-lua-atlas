---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAttributes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_playerAttributes` : `extensions.load("career_modules_playerAttributes")`, puis la globale `career_modules_playerAttributes`
---@class career_modules_playerAttributes
---@field dependencies table
---@field logAttributeChange any
career_modules_playerAttributes = {}

--- reason should be table with label, list of tags
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:66
---@param change any
---@param reason any
function career_modules_playerAttributes.addAttributes(change, reason) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:152
function career_modules_playerAttributes.getAllAttributes() end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:145
---@param attributeName any
function career_modules_playerAttributes.getAttribute(attributeName) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:320
function career_modules_playerAttributes.getAttributeLog() end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:148
---@param attributeName any
function career_modules_playerAttributes.getAttributeValue(attributeName) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:215
---@param historyType any
function career_modules_playerAttributes.getCareerHistoryInfo(historyType) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:207
---@param limit any
function career_modules_playerAttributes.getFinancialHistory(limit) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:211
---@param limit any
function career_modules_playerAttributes.getGameplayHistory(limit) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:203
---@param limit any
function career_modules_playerAttributes.getRecentFinancialChanges(limit) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:22
---@param attributeKey any
function career_modules_playerAttributes.getRewardDisplayName(attributeKey) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:294
---@param active any
function career_modules_playerAttributes.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:226
function career_modules_playerAttributes.onExtensionLoaded() end

--- logbook integration
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:307
---@param _ any
function career_modules_playerAttributes.onLogbookGetEntries(_) end

--- this should only be loaded when the career is active
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:288
---@param currentSavePath any
function career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/playerAttributes.lua:136
---@param newValues any
---@param reason any
function career_modules_playerAttributes.setAttributes(newValues, reason) end

