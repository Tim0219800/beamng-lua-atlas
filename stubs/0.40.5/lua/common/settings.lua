---@meta
-- tim19Atlas stub generated from lua/common/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Read access to the game's settings from Lua (both VMs). At load it reads /settings/defaults.json (definitions: each setting is an array whose element [2] is the default value), the file deprecated.json (renamed/obsolete settings), applies presets (units according to the OS language, platform file, internal values outside the shipping build), then getValues() merges defaults + cloud settings + local settings. This is what a mod queries with settings.getValue('key', defaultValue).
--- Access: global `impl`, `settings`
---@class impl
---@field defaultValues table<string, any> precomputed default values (key -> defaults[key][2])
---@field defaults table<string, table> setting definitions read from defaults.json; each entry is an array whose [2] is the default value
---@field deprecated table<string, table> obsolete settings (fields replacement or obsolete)
---@field deprecatedPathTorquescript string '/settings/game-settings.cs' (old TorqueScript format)
---@field path string '/settings/'
---@field pathCloud string '/settings/cloud/settings.json'
---@field pathDefaults string '/settings/defaults.json'
---@field pathDeprecated string '/settings/deprecated.json'
---@field pathInternal string '/settings/not-shipping.internal.json' (internal values, read outside the shipping build)
---@field pathLocal string '/settings/settings.json' (user settings)
---@field pathPersona string '/settings/persona-settings.tmp.json'
---@field pathVariables string '/settings/game-settings.json'
---@field personaScopedSettings table<string, boolean> settings that can have a per-persona value
impl = {}

--- Value of a per-persona setting. If key is not a 'persona' setting or if there is no persona, returns fallbackValue; otherwise the value stored for this persona, or failing that the first fallbackValue memorized for this persona and this key.
---Source: lua/common/settings.lua:223
---@param key string setting name
---@param fallbackValue any default value
---@param persona table|string|number|nil persona or id
---@return any  value
function impl.getPersonaValue(key, fallbackValue, persona) end

--- Returns the value of the setting `key` (defaults/cloud/local merge), or defaultValue if it is nil; then applies the persona value if applicable (if key is in personaScopedSettings and a persona is provided).
---Source: lua/common/settings.lua:248
---@param key string setting name
---@param defaultValue any fallback value if the setting does not exist
---@param persona table|string|number|nil persona (or its id) for per-persona settings
---@return any  setting value
function impl.getValue(key, defaultValue, persona) end

--- Returns the complete table of merged settings (cached). Do not modify the returned table (it is the cache).
---Source: lua/common/settings.lua:188
---@return table<string, any>  all settings
function impl.getValues() end

--- Forgets the settings and persona settings cache: the next getValue/getValues will re-read the files. Same functions: refresh and settingsChanged (compatibility).
---Source: lua/common/settings.lua:260
function impl.invalidateCache() end

--- Forgets the per-persona value cache (re-read on next access).
---Source: lua/common/settings.lua:256
function impl.invalidatePersonaCache() end

--- Alias of invalidateCache (backward compatibility).
---Source: lua/common/settings.lua:260
function impl.refresh() end

--- Alias of invalidateCache, to be called (by the engine or the UI) when settings have just changed.
---Source: lua/common/settings.lua:260
function impl.settingsChanged() end

