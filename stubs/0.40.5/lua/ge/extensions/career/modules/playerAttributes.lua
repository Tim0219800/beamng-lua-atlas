---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAttributes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central registry of the player's career attributes: money, beamXP, vouchers, one attribute per branch/skill (branch.attributeKey) and <orgId>Reputation per organization. Each attribute has a value, cumulative gains and losses per tag (+ "all"), and optionally min/max. Every change goes through addAttributes (or setAttributes), which updates the statistics, keeps the change log, writes to career_modules_log and emits the onPlayerAttributesChanged(change, reason) hook. Saved to career/playerAttributes.json and career/attributeLog.json.
--- Access: extension `career_modules_playerAttributes`: `extensions.load("career_modules_playerAttributes")`, then the global `career_modules_playerAttributes`
---@class career_modules_playerAttributes
---@field dependencies table<integer, string> Extensions loaded before: career_career.
---@field logAttributeChange nil Always nil: references a local variable that does not exist in the file (bug).
career_modules_playerAttributes = {}

--- Adds the given changes to the attributes (creating them if absent), updates gains/losses per tag, records the entry in attributeLog, writes a career log and emits onPlayerAttributesChanged(change, reason).
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:66
---@param change table<string, number> Change per attribute (positive = gain, negative = loss).
---@param reason {label: string|table, tags: string[]}|nil Reason: label and list of tags.
function career_modules_playerAttributes.addAttributes(change, reason) end

--- Returns the table of all attributes (direct reference, not copied).
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:152
---@return table<string, table>  Attributes by name.
function career_modules_playerAttributes.getAllAttributes() end

--- Returns the full object of an attribute {value, gains, losses, min, max}.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:145
---@param attributeName string Attribute name.
---@return table|nil  Attribute, nil if it does not exist.
function career_modules_playerAttributes.getAttribute(attributeName) end

--- Returns the attribute change log ({attributeChange, reason, time}).
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:320
---@return table[]  Logbook entries.
function career_modules_playerAttributes.getAttributeLog() end

--- Returns the numeric value of an attribute (0 if it does not exist).
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:148
---@param attributeName string Attribute name.
---@return number  Value.
function career_modules_playerAttributes.getAttributeValue(attributeName) end

--- Returns the title (translation key) of the history screen: gameplay or financial (default).
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:215
---@param historyType string "gameplay" or anything else for financial.
---@return {title: string}  Title.
function career_modules_playerAttributes.getCareerHistoryInfo(historyType) end

--- Money change history, from most recent to oldest.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:207
---@param limit integer|nil Maximum number (all if nil).
---@return table[]  History rows.
function career_modules_playerAttributes.getFinancialHistory(limit) end

--- Gameplay reward history (changes whose tags contain gameplay), with display names and icons.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:211
---@param limit integer|nil Maximum number (all if nil).
---@return table[]  History rows.
function career_modules_playerAttributes.getGameplayHistory(limit) end

--- Recent financial history (the last 5 money changes by default), from most recent to oldest.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:203
---@param limit integer|nil Maximum number, 5 by default.
---@return {reason: any, time: integer, rewards: table[]}[]  History rows.
function career_modules_playerAttributes.getRecentFinancialChanges(limit) end

--- Returns the display translation key of an attribute: money, beamXP, vouchers, reputation, branch XP {txt, context} or the raw key.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:22
---@param attributeKey string Attribute key.
---@return string|table  Translation key or table {txt, context}.
function career_modules_playerAttributes.getRewardDisplayName(attributeKey) end

--- Hook: creates the <orgId>Reputation attribute (min/max from career_modules_reputation) for each organization that does not have one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:294
---@param active boolean Nothing if false.
function career_modules_playerAttributes.onCareerActive(active) end

--- Hook: if the career is active, initializes the attributes then loads playerAttributes.json and attributeLog.json with compatibility conversions (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:226
function career_modules_playerAttributes.onExtensionLoaded() end

--- Logbook integration hook (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:307
---@param _ any Not used.
function career_modules_playerAttributes.onLogbookGetEntries(_) end

--- Save hook: writes playerAttributes.json and attributeLog.json to <save>/career/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:288
---@param currentSavePath string Save folder.
function career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath) end

--- Sets absolute values by calling addAttributes with the difference from the current value.
---Source: lua/ge/extensions/career/modules/playerAttributes.lua:136
---@param newValues table<string, number> New value per attribute.
---@param reason table|nil Same format as for addAttributes.
function career_modules_playerAttributes.setAttributes(newValues, reason) end

