---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/unlockFlags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_unlockFlags` : `extensions.load("career_modules_unlockFlags")`, puis la globale `career_modules_unlockFlags`
---@class career_modules_unlockFlags
---@field dependencies table
career_modules_unlockFlags = {}

--- Get flag value, returns false if flag doesn't exist
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:29
---@param flagName any
function career_modules_unlockFlags.getFlag(flagName) end

---Source : lua/ge/extensions/career/modules/unlockFlags.lua:38
---@param flagName any
function career_modules_unlockFlags.getFlagDefinition(flagName) end

---Source : lua/ge/extensions/career/modules/unlockFlags.lua:59
function career_modules_unlockFlags.onCareerActivated() end

--- Save current flags to file
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:23
---@param currentSavePath any
function career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath) end

--- Reset all flags
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:55
function career_modules_unlockFlags.resetFlags() end

--- Set flag value
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:49
---@param flagName any
---@param value any
function career_modules_unlockFlags.setFlag(flagName, value) end

