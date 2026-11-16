---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/unlockFlags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career unlock flags. The definitions come from other extensions via the onGetUnlockFlagDefinitions hook (each adds {unlockedFunction, icon, level, label} to the received table); a flag's value is computed on demand with unlockedFunction then cached, or forced with setFlag.
--- Access: extension `career_modules_unlockFlags`: `extensions.load("career_modules_unlockFlags")`, then the global `career_modules_unlockFlags`
---@class career_modules_unlockFlags
---@field dependencies string[] {"career_saveSystem"}.
career_modules_unlockFlags = {}

--- Returns a flag's value (evaluating it via its definition if needed). false if the flag has no definition.
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:29
---@param flagName string Flag name.
---@return boolean  Flag value.
function career_modules_unlockFlags.getFlag(flagName) end

--- Returns the registered definition of a flag.
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:38
---@param flagName string Flag name.
---@return table|nil  Definition {unlockedFunction, icon, level, label} or nil.
function career_modules_unlockFlags.getFlagDefinition(flagName) end

--- Hook called when the career is activated: clears the cache and reloads the definitions via the onGetUnlockFlagDefinitions hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:59
function career_modules_unlockFlags.onCareerActivated() end

--- Profile save hook; does nothing in this version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:23
---@param currentSavePath string Profile save folder.
function career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath) end

--- Clears the flag value cache (definitions remain).
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:55
function career_modules_unlockFlags.resetFlags() end

--- Forces a flag's value in the cache and emits onUnlockFlagChanged.
---Source: lua/ge/extensions/career/modules/unlockFlags.lua:49
---@param flagName string Flag name.
---@param value boolean New value.
function career_modules_unlockFlags.setFlag(flagName, value) end

