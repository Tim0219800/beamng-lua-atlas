# `impl`

*File: `lua/common/settings.lua` · VM: Common (GE + vehicle) · 274 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `impl`, `settings`

Read access to the game's settings from Lua (both VMs). At load it reads /settings/defaults.json (definitions: each setting is an array whose element [2] is the default value), the file deprecated.json (renamed/obsolete settings), applies presets (units according to the OS language, platform file, internal values outside the shipping build), then getValues() merges defaults + cloud settings + local settings. This is what a mod queries with settings.getValue('key', defaultValue).

## Example

```lua
local units = settings.getValue('uiUnitLength', 'metric')
local all = settings.getValues()
```

## Notes

- Values are cached (valuesCache); invalidateCache() (alias refresh, settingsChanged) must be called after a setting change to re-read the files. This module is read-only: it writes no file.
- Value priority order: defaults (modified by units preset, platform, internal values) < /settings/cloud/settings.json < /settings/settings.json (local). Obsolete/renamed names are converted by upgradeSetting (deprecated.json), with logging on the GE side only.
- If a C++ table CppSettings exists and the type of the Lua value differs from the C++ type, the value is ignored with an error in the log.
- The 'persona' settings (personaScopedSettings: defaultGearboxBehavior, autoClutch, autoThrottle, spawnVehicleIgnitionLevel, playerCharacterFace) can have a per-persona value stored in /settings/persona-settings.tmp.json; getValue/getPersonaValue consult persona (id or table with an id field) there.
- Units preset according to getOSLanguage: US region or 'en' language without a region -> imperial; GB/UK -> british; otherwise metric; applied to the defaults uiUnits*, uiUnitLength, etc.
- Peculiarity: if the UI is in simple menu mode (Engine.UI.isSimpleMenu), the default of uiContentScale is 1.05.
- The M.path* paths are not functions but configuration fields (e.g. M.pathLocal = '/settings/settings.json'); M.defaults, M.deprecated, M.defaultValues are working tables.

## Functions

| Function | Description | Line |
|---|---|---|
| `impl.getPersonaValue(key, fallbackValue, persona)` | Value of a per-persona setting. If key is not a 'persona' setting or if there is no persona, returns fallbackValue; otherwise the value stored for this persona, or failing that the first fallbackValue memorized for this persona and this key. | 223 |
| `impl.getValue(key, defaultValue, persona)` | Returns the value of the setting `key` (defaults/cloud/local merge), or defaultValue if it is nil; then applies the persona value if applicable (if key is in personaScopedSettings and a persona is provided). | 248 |
| `impl.getValues()` | Returns the complete table of merged settings (cached). Do not modify the returned table (it is the cache). | 188 |
| `impl.invalidateCache()` | Forgets the settings and persona settings cache: the next getValue/getValues will re-read the files. Same functions: refresh and settingsChanged (compatibility). | 260 |
| `impl.invalidatePersonaCache()` | Forgets the per-persona value cache (re-read on next access). | 256 |
| `impl.refresh()` | Alias of invalidateCache (backward compatibility). | 260 |
| `impl.settingsChanged()` | Alias of invalidateCache, to be called (by the engine or the UI) when settings have just changed. | 260 |

### Parameter details

#### `impl.getPersonaValue(key, fallbackValue, persona)`

Value of a per-persona setting. If key is not a 'persona' setting or if there is no persona, returns fallbackValue; otherwise the value stored for this persona, or failing that the first fallbackValue memorized for this persona and this key.

- `key` (*string*) : setting name
- `fallbackValue` (*any*) : default value
- `persona` (*table|string|number|nil*) : persona or id
- **returns**: any value

#### `impl.getValue(key, defaultValue, persona)`

Returns the value of the setting `key` (defaults/cloud/local merge), or defaultValue if it is nil; then applies the persona value if applicable (if key is in personaScopedSettings and a persona is provided).

- `key` (*string*) : setting name
- `defaultValue` (*any*) : fallback value if the setting does not exist
- `persona` (*table|string|number|nil*) : persona (or its id) for per-persona settings
- **returns**: any setting value

#### `impl.getValues()`

Returns the complete table of merged settings (cached). Do not modify the returned table (it is the cache).

- **returns**: table<string, any> all settings

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultValues` | table<string, any> | precomputed default values (key -> defaults[key][2]) |
| `defaults` | table<string, table> | setting definitions read from defaults.json; each entry is an array whose [2] is the default value |
| `deprecated` | table<string, table> | obsolete settings (fields replacement or obsolete) |
| `deprecatedPathTorquescript` | string | '/settings/game-settings.cs' (old TorqueScript format) |
| `path` | string | '/settings/' |
| `pathCloud` | string | '/settings/cloud/settings.json' |
| `pathDefaults` | string | '/settings/defaults.json' |
| `pathDeprecated` | string | '/settings/deprecated.json' |
| `pathInternal` | string | '/settings/not-shipping.internal.json' (internal values, read outside the shipping build) |
| `pathLocal` | string | '/settings/settings.json' (user settings) |
| `pathPersona` | string | '/settings/persona-settings.tmp.json' |
| `pathVariables` | string | '/settings/game-settings.json' |
| `personaScopedSettings` | table<string, boolean> | settings that can have a per-persona value |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Lua:` `getOSLanguage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/settings.lua`.*
