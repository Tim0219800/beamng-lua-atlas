---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central extension for the game settings on the GE side. It keeps the table of current values (initialized from the default values of the common settings module), applies each change through "option helpers" (Lua setters or propagation to CppSettings), saves to disk with a delay (local, cloud, persona), notifies the UI (guihooks SettingsChanged) and the extensions (onSettingsChanged hook), manages languages, and loads or unloads extensions depending on certain settings (ui_extApp, core_couplerCameraModifier, mcp_server, workbench_webSocketHandler). It is the entry point for reading or changing a setting from a mod.
--- Access: extension `core_settings_settings`: `extensions.load("core_settings_settings")`, then the global `core_settings_settings`
---@class core_settings_settings
---@field impl table Common module 'settings': default values (defaultValues, defaults), file paths, cache and per-persona values (getPersonaValue, invalidateCache...).
---@field settingsTick function Loop hook called by the engine every frame (dtReal, dtSim, dtRaw). Is nop at rest; requestSave puts a function there that counts down 0.5 s then saves.
core_settings_settings = {}

--- Called on shutdown: saves immediately and deletes the persona values file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:579
function core_settings_settings.exit() end

--- End of initialization called by the engine: load(true), onFirstUpdateSettings of the graphic and audio modules, loading of platform settings (PlatformSwitches.settingsJsonPath, deprecated), allows saves, loads telemetry_core.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:539
function core_settings_settings.finalizeInit() end

--- Reads a setting's current value, or defaultValue if nil. With multiseat active, the value can be overridden by the persona.
---Source: lua/ge/extensions/core/settings/settings.lua:416
---@param key string Setting name.
---@param defaultValue any Fallback value if the setting is nil.
---@param persona string|table|nil Persona (ignored if multiseat is not active).
---@return any  Setting value.
function core_settings_settings.getValue(key, defaultValue, persona) end

--- Returns a deep copy of all current values.
---Source: lua/ge/extensions/core/settings/settings.lua:575
---@return table<string, any>  Copy of the settings.
function core_settings_settings.getValuesCopy() end

--- Initialization: builds the key/value dictionaries of the options, loads core_settings_graphic, core_settings_audio and core_settings_multiplayer and merges their buildOptionHelpers, adds a setter propagating to CppSettings for each setting known to the C++ (type checked), then reads the settings file and calls core_settings_graphic.onInitSettings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:479
---@param reason string|nil Reason for the init; 'reload' for a Lua reload (otherwise the persona values are cleared).
function core_settings_settings.initSettings(reason) end

--- Reloads the settings from the files: mounts translations.zip if present, merges the values read with the current ones, applies via setState then core_settings_graphic.load. Logs the last CppSettings error if there is one. Meanwhile, saves are blocked.
---Source: lua/ge/extensions/core/settings/settings.lua:454
---@param ignoreCache boolean|nil Forces the application of all values.
function core_settings_settings.load(ignoreCache) end

--- Loads a JSON of platform-specific settings and applies them with setState. Logs an error if the file is unreadable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:527
---@param platformSettingsPath string|nil Path of the JSON; ignored if nil or empty.
function core_settings_settings.loadPlatformSettings(platformSettingsPath) end

--- Sends the guihooks event 'SettingsChanged' with {values, options} to the UI.
---Source: lua/ge/extensions/core/settings/settings.lua:57
function core_settings_settings.notifyUI() end

--- File watching hook: if the local or cloud settings files changed externally (and more than 5 s after the last save), reloads via load(false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:558
---@param files table[] List of entries with a filename field.
function core_settings_settings.onFilesChanged(files) end

--- First-update hook. If communityTranslations is 'enable' and the game was updated from a 0.x version with x < 39, calls updateTranslations() (defined in ge/main.lua).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/settings.lua:589
function core_settings_settings.onFirstUpdate() end

--- Copies the result of the options' get() into the values table (if withValue) and recomputes the modes (getModes) of the options that have them. Name inherited from TorqueScript.
---Source: lua/ge/extensions/core/settings/settings.lua:116
---@param withValue boolean If true, also rereads the values via get().
function core_settings_settings.refreshTSState(withValue) end

--- Schedules a deferred save of the settings (0.5 s) via settingsTick.
---Source: lua/ge/extensions/core/settings/settings.lua:317
function core_settings_settings.requestSave() end

--- Alias of notifyUI (backward compatibility).
---Source: lua/ge/extensions/core/settings/settings.lua:57
function core_settings_settings.requestState() end

--- Resets a setting to its default value (M.impl.defaultValues) via setValue, if a default value exists.
---Source: lua/ge/extensions/core/settings/settings.lua:410
---@param key string Setting name.
function core_settings_settings.resetSettingToDefault(key) end

--- Alias of requestSave: deferred save, not immediate.
---Source: lua/ge/extensions/core/settings/settings.lua:317
function core_settings_settings.save() end

--- Applies a table of settings: graphics quality groups first, then the rest in alphabetical order, via setValue. If something changed (or ignoreCache), rereads the state, saves, and reconciles the dependent extensions (ui_extApp according to externalUI2, core_couplerCameraModifier according to couplerCameraModifier, mcp_server according to enableMcp, workbench_webSocketHandler according to workbenchMobile) then the languages. Non-string keys are ignored with a warning.
---Source: lua/ge/extensions/core/settings/settings.lua:212
---@param newState table<string, any>|nil Settings to apply; nil = nothing.
---@param ignoreCache boolean|nil If true, applies even unchanged values.
function core_settings_settings.setState(newState, ignoreCache) end

--- Changes a setting: updates the value, calls the option's setter, and schedules the save. With a persona (and multiseat active) and a persona-specific key, writes to the persona file instead of the global settings.
---Source: lua/ge/extensions/core/settings/settings.lua:357
---@param key string Setting name.
---@param value any New value.
---@param ignoreCache boolean|nil Applies even if the value is identical. If a non-boolean value is passed here without a persona, it is interpreted as the persona.
---@param persona string|table|nil Persona identifier, or table with an id field.
---@return boolean|nil  true if the state changed; false if nothing or invalid persona; nil if recursive call on the same key.
function core_settings_settings.setValue(key, value, ignoreCache, persona) end

