# `core_settings_settings`

*File: `lua/ge/extensions/core/settings/settings.lua` · VM: Game Engine (GE) · 620 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_settings`: `extensions.load("core_settings_settings")`, then the global `core_settings_settings`

Central extension for the game settings on the GE side. It keeps the table of current values (initialized from the default values of the common settings module), applies each change through "option helpers" (Lua setters or propagation to CppSettings), saves to disk with a delay (local, cloud, persona), notifies the UI (guihooks SettingsChanged) and the extensions (onSettingsChanged hook), manages languages, and loads or unloads extensions depending on certain settings (ui_extApp, core_couplerCameraModifier, mcp_server, workbench_webSocketHandler). It is the entry point for reading or changing a setting from a mod.

## Example

```lua
local v = core_settings_settings.getValue('uiUnitLength', 'metric')
core_settings_settings.setValue('AudioMasterVol', 0.5)
```

## Notes

- settings.impl is the common module 'settings' (require("settings")): defaults, defaultValues, paths pathLocal/pathCloud/pathPersona, etc.
- save is the same object as requestSave: it does not write right away but schedules a save 0.5 s later via settingsTick (called by the main loop). The actual write is the local function save, called by settingsTick.
- Only values different from the default values are written; keys whose default is classified "cloud" go to pathCloud, "discard" nowhere, otherwise pathLocal.
- After a save: notifyUI, core_settings_graphic.onSettingsChanged(), extensions hook 'onSettingsChanged', and be:queueAllObjectLua('onSettingsChanged()') (the vehicle VMs also receive the hook).
- setValue only triggers the setter (options[key].set) if the value changes (comparison by tostring) or if ignoreCache is true. A recursive call on the same key is ignored (returns nil).
- setState first applies the graphics quality groups (GraphicOverallQuality, GraphicMeshQuality, ...) then the other keys in alphabetical order.
- Probable inconsistency: enableDragRaceInFreeroam, enableDriftInFreeroam, enableCrawlInFreeroam and enableGasStationsInFreeroam all emit the showMissionMarkersToggled hook (like showMissionMarkers); probably an intentional copy-paste to refresh the markers.
- The settingsTick field is nop (global game function) and is replaced by requestSave for the duration of the deferred save.
- Unit values offered in the options (modes): length metric/imperial, temperature c/f/k, weight lb/kg, power hp/bhp/kw, pressure inHg/bar/psi/kPa, etc.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_settings.exit()` | Called on shutdown: saves immediately and deletes the persona values file. *(internal)* | 579 |
| `core_settings_settings.finalizeInit()` | End of initialization called by the engine: load(true), onFirstUpdateSettings of the graphic and audio modules, loading of platform settings (PlatformSwitches.settingsJsonPath, deprecated), allows saves, loads telemetry_core. *(internal)* | 539 |
| `core_settings_settings.getValue(key, defaultValue, persona)` | Reads a setting's current value, or defaultValue if nil. With multiseat active, the value can be overridden by the persona. | 416 |
| `core_settings_settings.getValuesCopy()` | Returns a deep copy of all current values. | 575 |
| `core_settings_settings.initSettings(reason)` | Initialization: builds the key/value dictionaries of the options, loads core_settings_graphic, core_settings_audio and core_settings_multiplayer and merges their buildOptionHelpers, adds a setter propagating to CppSettings for each setting known to the C++ (type checked), then reads the settings file and calls core_settings_graphic.onInitSettings. *(internal)* | 479 |
| `core_settings_settings.load(ignoreCache)` | Reloads the settings from the files: mounts translations.zip if present, merges the values read with the current ones, applies via setState then core_settings_graphic.load. Logs the last CppSettings error if there is one. Meanwhile, saves are blocked. | 454 |
| `core_settings_settings.loadPlatformSettings(platformSettingsPath)` | Loads a JSON of platform-specific settings and applies them with setState. Logs an error if the file is unreadable. *(internal)* | 527 |
| `core_settings_settings.notifyUI()` | Sends the guihooks event 'SettingsChanged' with {values, options} to the UI. | 57 |
| `core_settings_settings.onFilesChanged(files)` | File watching hook: if the local or cloud settings files changed externally (and more than 5 s after the last save), reloads via load(false). *(internal)* *(hook)* | 558 |
| `core_settings_settings.onFirstUpdate()` | First-update hook. If communityTranslations is 'enable' and the game was updated from a 0.x version with x < 39, calls updateTranslations() (defined in ge/main.lua). *(internal)* *(hook)* | 589 |
| `core_settings_settings.refreshTSState(withValue)` | Copies the result of the options' get() into the values table (if withValue) and recomputes the modes (getModes) of the options that have them. Name inherited from TorqueScript. | 116 |
| `core_settings_settings.requestSave()` | Schedules a deferred save of the settings (0.5 s) via settingsTick. | 317 |
| `core_settings_settings.requestState()` | Alias of notifyUI (backward compatibility). | 57 |
| `core_settings_settings.resetSettingToDefault(key)` | Resets a setting to its default value (M.impl.defaultValues) via setValue, if a default value exists. | 410 |
| `core_settings_settings.save()` | Alias of requestSave: deferred save, not immediate. | 317 |
| `core_settings_settings.setState(newState, ignoreCache)` | Applies a table of settings: graphics quality groups first, then the rest in alphabetical order, via setValue. If something changed (or ignoreCache), rereads the state, saves, and reconciles the dependent extensions (ui_extApp according to externalUI2, core_couplerCameraModifier according to couplerCameraModifier, mcp_server according to enableMcp, workbench_webSocketHandler according to workbenchMobile) then the languages. Non-string keys are ignored with a warning. | 212 |
| `core_settings_settings.setValue(key, value, ignoreCache, persona)` | Changes a setting: updates the value, calls the option's setter, and schedules the save. With a persona (and multiseat active) and a persona-specific key, writes to the persona file instead of the global settings. | 357 |

### Parameter details

#### `core_settings_settings.getValue(key, defaultValue, persona)`

Reads a setting's current value, or defaultValue if nil. With multiseat active, the value can be overridden by the persona.

- `key` (*string*) : Setting name.
- `defaultValue` (*any*) : Fallback value if the setting is nil.
- `persona` (*string|table|nil*) : Persona (ignored if multiseat is not active).
- **returns**: any Setting value.

#### `core_settings_settings.getValuesCopy()`

Returns a deep copy of all current values.

- **returns**: table<string, any> Copy of the settings.

#### `core_settings_settings.initSettings(reason)`

Initialization: builds the key/value dictionaries of the options, loads core_settings_graphic, core_settings_audio and core_settings_multiplayer and merges their buildOptionHelpers, adds a setter propagating to CppSettings for each setting known to the C++ (type checked), then reads the settings file and calls core_settings_graphic.onInitSettings.

- `reason` (*string|nil*) : Reason for the init; 'reload' for a Lua reload (otherwise the persona values are cleared).

#### `core_settings_settings.load(ignoreCache)`

Reloads the settings from the files: mounts translations.zip if present, merges the values read with the current ones, applies via setState then core_settings_graphic.load. Logs the last CppSettings error if there is one. Meanwhile, saves are blocked.

- `ignoreCache` (*boolean|nil*) : Forces the application of all values.

#### `core_settings_settings.loadPlatformSettings(platformSettingsPath)`

Loads a JSON of platform-specific settings and applies them with setState. Logs an error if the file is unreadable.

- `platformSettingsPath` (*string|nil*) : Path of the JSON; ignored if nil or empty.

#### `core_settings_settings.onFilesChanged(files)`

File watching hook: if the local or cloud settings files changed externally (and more than 5 s after the last save), reloads via load(false).

- `files` (*table[]*) : List of entries with a filename field.

#### `core_settings_settings.refreshTSState(withValue)`

Copies the result of the options' get() into the values table (if withValue) and recomputes the modes (getModes) of the options that have them. Name inherited from TorqueScript.

- `withValue` (*boolean*) : If true, also rereads the values via get().

#### `core_settings_settings.resetSettingToDefault(key)`

Resets a setting to its default value (M.impl.defaultValues) via setValue, if a default value exists.

- `key` (*string*) : Setting name.

#### `core_settings_settings.setState(newState, ignoreCache)`

Applies a table of settings: graphics quality groups first, then the rest in alphabetical order, via setValue. If something changed (or ignoreCache), rereads the state, saves, and reconciles the dependent extensions (ui_extApp according to externalUI2, core_couplerCameraModifier according to couplerCameraModifier, mcp_server according to enableMcp, workbench_webSocketHandler according to workbenchMobile) then the languages. Non-string keys are ignored with a warning.

- `newState` (*table<string, any>|nil*) : Settings to apply; nil = nothing.
- `ignoreCache` (*boolean|nil*) : If true, applies even unchanged values.

#### `core_settings_settings.setValue(key, value, ignoreCache, persona)`

Changes a setting: updates the value, calls the option's setter, and schedules the save. With a persona (and multiseat active) and a persona-specific key, writes to the persona file instead of the global settings.

- `key` (*string*) : Setting name.
- `value` (*any*) : New value.
- `ignoreCache` (*boolean|nil*) : Applies even if the value is identical. If a non-boolean value is passed here without a persona, it is interpreted as the persona.
- `persona` (*string|table|nil*) : Persona identifier, or table with an id field.
- **returns**: boolean|nil true if the state changed; false if nothing or invalid persona; nil if recursive call on the same key.

## Fields

| Field | Type | Description |
|---|---|---|
| `impl` | table | Common module 'settings': default values (defaultValues, defaults), file paths, cache and per-persona values (getPersonaValue, invalidateCache...). |
| `settingsTick` | function | Loop hook called by the engine every frame (dtReal, dtSim, dtRaw). Is nop at rest; requestSave puts a function there that counts down 0.5 s then saves. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMinimapSettingsChanged` — listened to by 1 module(s)
- `onSettingsChanged` — listened to by 25 module(s)
- `showMissionMarkersToggled`
- `taxiSettingChanged`

**UI events (guihooks.trigger):** `SettingsChanged`, `toastrMsg`

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`, `setMcpPort`
- `FS:` `directoryCreate`, `fileExists`, `isMounted`, `mount`, `removeFile`
- `Lua:` `getOSLanguage`, `getSelectedLanguage`, `getSteamLanguage`, `reloadLanguages`
- `ResearchVerifier.` `isTechLicenseVerified`
- `be:` `queueAllObjectLua`
- `ui_imgui.` `IoFontsGetCount`, `IoFontsGetName`, `SetDefaultFont`

**Loads extensions:** `core_couplerCameraModifier`, `mcp_server`, `telemetry_core`, `ui_extApp`, `workbench_webSocketHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/settings.lua`.*
