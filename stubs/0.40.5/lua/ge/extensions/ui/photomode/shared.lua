---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/shared.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tool library and shared state of all photo mode modules (ui_photomode_*). It contains the session state table S, the debug log, normalization functions (numbers, booleans, paths), protected (pcall) accesses to VariableRegistry, to the settings and to the "screenshot" capture API, as well as the computation of media action availability (upload, Steam, share URL opening).
--- Access: extension `ui_photomode_shared`: `extensions.load("ui_photomode_shared")`, then the global `ui_photomode_shared`
---@class ui_photomode_shared
---@field S table Mutable state table shared by all photo mode modules (active session, restore states, pending preview playback, etc.). The other modules read and write it directly via ui_photomode_shared.S.
ui_photomode_shared = {}

--- Builds an output table from source by copying only the described, non-nil fields, applying field.normalize if present and renaming the key to field.outputKey if defined.
---Source: lua/ge/extensions/ui/photomode/shared.lua:143
---@param source table Source table; a non-table gives {}.
---@param fieldDescriptors table[] List of descriptors {key, outputKey?, normalize?}.
---@return table  Built state.
function ui_photomode_shared.buildDescribedState(source, fieldDescriptors) end

--- Computes the availability of photo mode media actions from the runtime context (shipping build, online features, online service, logged-in account, screenshot backends, browser).
---Source: lua/ge/extensions/ui/photomode/shared.lua:313
---@return table  {runtime={shippingBuild, uiDevMode, onlineFeaturesEnabled, onlineServiceWorking, onlineAccountLoggedIn}, capture={upload, steam}, preview={openShareUrl}}; each action is {visible, enabled, reason, reasonLabel}.
function ui_photomode_shared.buildMediaActions() end

--- Converts to a number and clamps between minValue and maxValue; returns fallback if the value is not numeric.
---Source: lua/ge/extensions/ui/photomode/shared.lua:95
---@param value any Value to convert with tonumber.
---@param minValue number Bottom bound.
---@param maxValue number Top bound.
---@param fallback any Value returned if the conversion fails (not clamped).
---@return number|any  Clamped number or fallback.
function ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback) end

--- Returns the function core_camera[name] if it exists, otherwise nil.
---Source: lua/ge/extensions/ui/photomode/shared.lua:160
---@param name string Name of the core_camera function _anon(for example setPosRot, setFOV).
---@return function|nil  The function, or nil.
function ui_photomode_shared.getCoreCameraFunction(name) end

--- Loads the "screenshot" module with pcall(require) and returns it, or nil if unavailable.
---Source: lua/ge/extensions/ui/photomode/shared.lua:263
---@return table|nil  Screenshot module.
function ui_photomode_shared.getScreenshotApi() end

--- Indicates whether the state table contains at least one of the fields described by fieldDescriptors (key field.key non-nil).
---Source: lua/ge/extensions/ui/photomode/shared.lua:131
---@param state table Table to test; a non-table gives false.
---@param fieldDescriptors table[] List of descriptors {key, outputKey?, normalize?}.
---@return boolean  true if a field is present.
function ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors) end

--- Indicates whether the photo mode debug log is enabled.
---Source: lua/ge/extensions/ui/photomode/shared.lua:55
---@return boolean  true if debug is enabled.
function ui_photomode_shared.isDebugEnabled() end

--- Writes an Info-level message prefixed with "[Photomode]" if debug is enabled.
---Source: lua/ge/extensions/ui/photomode/shared.lua:68
---@param message any Message (converted with tostring).
function ui_photomode_shared.logDebug(message) end

--- Converts a value to a boolean: boolean unchanged, number (~= 0), strings "true"/"1" and "false"/"0" (case-insensitive); otherwise fallback == true. nil gives fallback == true.
---Source: lua/ge/extensions/ui/photomode/shared.lua:109
---@param value any Value to normalize.
---@param fallback any Default value (only fallback == true counts).
---@return boolean  Normalized boolean.
function ui_photomode_shared.normalizeBoolean(value, fallback) end

--- Normalizes a path for comparison: backslashes converted to /, leading slashes and trailing spaces removed, converted to lowercase.
---Source: lua/ge/extensions/ui/photomode/shared.lua:171
---@param value any Path (nil gives empty string).
---@return string  Normalized path.
function ui_photomode_shared.normalizePathForCompare(value) end

--- Checks that a table contains at least expectedLength convertible numbers and returns a copy of the first expectedLength; nil if one is missing.
---Source: lua/ge/extensions/ui/photomode/shared.lua:179
---@param values table Input array.
---@param expectedLength integer Number of expected elements (3 for a position, 4 for a quaternion).
---@return number[]|nil  Normalized array or nil.
function ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength) end

--- Asks the UI to refresh by calling settings.notifyUI (protected by pcall).
---Source: lua/ge/extensions/ui/photomode/shared.lua:254
function ui_photomode_shared.notifySettingsUi() end

--- Plays the photo capture sound (FMOD event "event:>UI>Main>Photo" on AudioGui).
---Source: lua/ge/extensions/ui/photomode/shared.lua:89
function ui_photomode_shared.playPhotoCaptureSound() end

--- Reads a setting via settings.getValue (protected by pcall); nil if unavailable or on error.
---Source: lua/ge/extensions/ui/photomode/shared.lua:218
---@param settingName string Setting name.
---@return any  Setting value or nil.
function ui_photomode_shared.readSettingValue(settingName) end

--- Reads a VariableRegistry variable (protected by pcall). Returns nil if the registry is unavailable or on error.
---Source: lua/ge/extensions/ui/photomode/shared.lua:194
---@param variableName string Variable name.
---@return any  Value or nil.
function ui_photomode_shared.readVariableRegistryValue(variableName) end

--- Enables or disables photo mode debug and propagates the setting to the screenshot API (setDebugTracingEnabled) if available.
---Source: lua/ge/extensions/ui/photomode/shared.lua:59
---@param value any Enabled only if value == true.
function ui_photomode_shared.setDebugEnabled(value) end

--- Converts a payload to text for the log: empty string for nil, string unchanged, otherwise JSON (jsonEncode) or tostring on failure.
---Source: lua/ge/extensions/ui/photomode/shared.lua:75
---@param payload any Value to convert.
---@return string  Text to log.
function ui_photomode_shared.stringifyDebugPayload(payload) end

--- Writes a setting via settings.setValue (protected by pcall, error logged).
---Source: lua/ge/extensions/ui/photomode/shared.lua:230
---@param settingName string Setting name.
---@param value any New value.
---@return boolean  true if the write succeeded.
function ui_photomode_shared.writeSettingValue(settingName, value) end

--- Applies several settings at once via settings.setState (protected by pcall).
---Source: lua/ge/extensions/ui/photomode/shared.lua:242
---@param partialState table<string, any> Settings to change.
---@return boolean  true if the call succeeded.
function ui_photomode_shared.writeSettingsState(partialState) end

--- Writes a VariableRegistry variable (protected by pcall, error logged).
---Source: lua/ge/extensions/ui/photomode/shared.lua:206
---@param variableName string Variable name.
---@param value any Value to write.
---@return boolean  true if the write succeeded.
function ui_photomode_shared.writeVariableRegistryValue(variableName, value) end

