# `ui_photomode_shared`

*File: `lua/ge/extensions/ui/photomode/shared.lua` · VM: Game Engine (GE) · 372 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_shared`: `extensions.load("ui_photomode_shared")`, then the global `ui_photomode_shared`

Tool library and shared state of all photo mode modules (ui_photomode_*). It contains the session state table S, the debug log, normalization functions (numbers, booleans, paths), protected (pcall) accesses to VariableRegistry, to the settings and to the "screenshot" capture API, as well as the computation of media action availability (upload, Steam, share URL opening).

## Notes

- The log uses the tag "ui_pause_photomode" (leftover from an old name) and debug is enabled by default (isDebugEnabled = true).
- S.routePayloadContractVersion = 8 and S.photomodeMetadataStateVersion = 2 (versions of the route payload and state metadata formats).
- S notably contains: sessionActive, activeProfile ("pause" by default), photoModeOpen, the session restore states (camera, scene, effects, advanced render, node grabber), the saved bookmarks, pendingPreviewPlayback, pendingMotionCapture, captureInProgressFramesRemaining, exitConfirmationBypass, pendingExitNavigation, persistentSessionState and panelSurfaceMode ("hidden" by default).
- Media actions: upload requires a screenshot.publish backend, onlineFeatures == "enable", OnlineServiceProvider.isWorking and a logged-in account; the Steam action requires the same conditions except the account; URL opening requires openWebBrowser. Possible reasons: backend_unavailable, online_features_disabled, online_service_unavailable, online_account_required, browser_unavailable.
- The internal label table also contains shipping_build_required, but buildMediaActions never produces this reason.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_shared.buildDescribedState(source, fieldDescriptors)` | Builds an output table from source by copying only the described, non-nil fields, applying field.normalize if present and renaming the key to field.outputKey if defined. | 143 |
| `ui_photomode_shared.buildMediaActions()` | Computes the availability of photo mode media actions from the runtime context (shipping build, online features, online service, logged-in account, screenshot backends, browser). | 313 |
| `ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback)` | Converts to a number and clamps between minValue and maxValue; returns fallback if the value is not numeric. | 95 |
| `ui_photomode_shared.getCoreCameraFunction(name)` | Returns the function core_camera[name] if it exists, otherwise nil. | 160 |
| `ui_photomode_shared.getScreenshotApi()` | Loads the "screenshot" module with pcall(require) and returns it, or nil if unavailable. | 263 |
| `ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors)` | Indicates whether the state table contains at least one of the fields described by fieldDescriptors (key field.key non-nil). | 131 |
| `ui_photomode_shared.isDebugEnabled()` | Indicates whether the photo mode debug log is enabled. | 55 |
| `ui_photomode_shared.logDebug(message)` | Writes an Info-level message prefixed with "[Photomode]" if debug is enabled. | 68 |
| `ui_photomode_shared.normalizeBoolean(value, fallback)` | Converts a value to a boolean: boolean unchanged, number (~= 0), strings "true"/"1" and "false"/"0" (case-insensitive); otherwise fallback == true. nil gives fallback == true. | 109 |
| `ui_photomode_shared.normalizePathForCompare(value)` | Normalizes a path for comparison: backslashes converted to /, leading slashes and trailing spaces removed, converted to lowercase. | 171 |
| `ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength)` | Checks that a table contains at least expectedLength convertible numbers and returns a copy of the first expectedLength; nil if one is missing. | 179 |
| `ui_photomode_shared.notifySettingsUi()` | Asks the UI to refresh by calling settings.notifyUI (protected by pcall). | 254 |
| `ui_photomode_shared.playPhotoCaptureSound()` | Plays the photo capture sound (FMOD event "event:>UI>Main>Photo" on AudioGui). | 89 |
| `ui_photomode_shared.readSettingValue(settingName)` | Reads a setting via settings.getValue (protected by pcall); nil if unavailable or on error. | 218 |
| `ui_photomode_shared.readVariableRegistryValue(variableName)` | Reads a VariableRegistry variable (protected by pcall). Returns nil if the registry is unavailable or on error. | 194 |
| `ui_photomode_shared.setDebugEnabled(value)` | Enables or disables photo mode debug and propagates the setting to the screenshot API (setDebugTracingEnabled) if available. | 59 |
| `ui_photomode_shared.stringifyDebugPayload(payload)` | Converts a payload to text for the log: empty string for nil, string unchanged, otherwise JSON (jsonEncode) or tostring on failure. | 75 |
| `ui_photomode_shared.writeSettingValue(settingName, value)` | Writes a setting via settings.setValue (protected by pcall, error logged). | 230 |
| `ui_photomode_shared.writeSettingsState(partialState)` | Applies several settings at once via settings.setState (protected by pcall). | 242 |
| `ui_photomode_shared.writeVariableRegistryValue(variableName, value)` | Writes a VariableRegistry variable (protected by pcall, error logged). | 206 |

### Parameter details

#### `ui_photomode_shared.buildDescribedState(source, fieldDescriptors)`

Builds an output table from source by copying only the described, non-nil fields, applying field.normalize if present and renaming the key to field.outputKey if defined.

- `source` (*table*) : Source table; a non-table gives {}.
- `fieldDescriptors` (*table[]*) : List of descriptors {key, outputKey?, normalize?}.
- **returns**: table Built state.

#### `ui_photomode_shared.buildMediaActions()`

Computes the availability of photo mode media actions from the runtime context (shipping build, online features, online service, logged-in account, screenshot backends, browser).

- **returns**: table {runtime={shippingBuild, uiDevMode, onlineFeaturesEnabled, onlineServiceWorking, onlineAccountLoggedIn}, capture={upload, steam}, preview={openShareUrl}}; each action is {visible, enabled, reason, reasonLabel}.

#### `ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback)`

Converts to a number and clamps between minValue and maxValue; returns fallback if the value is not numeric.

- `value` (*any*) : Value to convert with tonumber.
- `minValue` (*number*) : Bottom bound.
- `maxValue` (*number*) : Top bound.
- `fallback` (*any*) : Value returned if the conversion fails (not clamped).
- **returns**: number|any Clamped number or fallback.

#### `ui_photomode_shared.getCoreCameraFunction(name)`

Returns the function core_camera[name] if it exists, otherwise nil.

- `name` (*string*) : Name of the core_camera function (for example setPosRot, setFOV).
- **returns**: function|nil The function, or nil.

#### `ui_photomode_shared.getScreenshotApi()`

Loads the "screenshot" module with pcall(require) and returns it, or nil if unavailable.

- **returns**: table|nil Screenshot module.

#### `ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors)`

Indicates whether the state table contains at least one of the fields described by fieldDescriptors (key field.key non-nil).

- `state` (*table*) : Table to test; a non-table gives false.
- `fieldDescriptors` (*table[]*) : List of descriptors {key, outputKey?, normalize?}.
- **returns**: boolean true if a field is present.

#### `ui_photomode_shared.isDebugEnabled()`

Indicates whether the photo mode debug log is enabled.

- **returns**: boolean true if debug is enabled.

#### `ui_photomode_shared.logDebug(message)`

Writes an Info-level message prefixed with "[Photomode]" if debug is enabled.

- `message` (*any*) : Message (converted with tostring).

#### `ui_photomode_shared.normalizeBoolean(value, fallback)`

Converts a value to a boolean: boolean unchanged, number (~= 0), strings "true"/"1" and "false"/"0" (case-insensitive); otherwise fallback == true. nil gives fallback == true.

- `value` (*any*) : Value to normalize.
- `fallback` (*any*) : Default value (only fallback == true counts).
- **returns**: boolean Normalized boolean.

#### `ui_photomode_shared.normalizePathForCompare(value)`

Normalizes a path for comparison: backslashes converted to /, leading slashes and trailing spaces removed, converted to lowercase.

- `value` (*any*) : Path (nil gives empty string).
- **returns**: string Normalized path.

#### `ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength)`

Checks that a table contains at least expectedLength convertible numbers and returns a copy of the first expectedLength; nil if one is missing.

- `values` (*table*) : Input array.
- `expectedLength` (*integer*) : Number of expected elements (3 for a position, 4 for a quaternion).
- **returns**: number[]|nil Normalized array or nil.

#### `ui_photomode_shared.readSettingValue(settingName)`

Reads a setting via settings.getValue (protected by pcall); nil if unavailable or on error.

- `settingName` (*string*) : Setting name.
- **returns**: any Setting value or nil.

#### `ui_photomode_shared.readVariableRegistryValue(variableName)`

Reads a VariableRegistry variable (protected by pcall). Returns nil if the registry is unavailable or on error.

- `variableName` (*string*) : Variable name.
- **returns**: any Value or nil.

#### `ui_photomode_shared.setDebugEnabled(value)`

Enables or disables photo mode debug and propagates the setting to the screenshot API (setDebugTracingEnabled) if available.

- `value` (*any*) : Enabled only if value == true.

#### `ui_photomode_shared.stringifyDebugPayload(payload)`

Converts a payload to text for the log: empty string for nil, string unchanged, otherwise JSON (jsonEncode) or tostring on failure.

- `payload` (*any*) : Value to convert.
- **returns**: string Text to log.

#### `ui_photomode_shared.writeSettingValue(settingName, value)`

Writes a setting via settings.setValue (protected by pcall, error logged).

- `settingName` (*string*) : Setting name.
- `value` (*any*) : New value.
- **returns**: boolean true if the write succeeded.

#### `ui_photomode_shared.writeSettingsState(partialState)`

Applies several settings at once via settings.setState (protected by pcall).

- `partialState` (*table<string, any>*) : Settings to change.
- **returns**: boolean true if the call succeeded.

#### `ui_photomode_shared.writeVariableRegistryValue(variableName, value)`

Writes a VariableRegistry variable (protected by pcall, error logged).

- `variableName` (*string*) : Variable name.
- `value` (*any*) : Value to write.
- **returns**: boolean true if the write succeeded.

## Fields

| Field | Type | Description |
|---|---|---|
| `S` | table | Mutable state table shared by all photo mode modules (active session, restore states, pending preview playback, etc.). The other modules read and write it directly via ui_photomode_shared.S. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/shared.lua`.*
