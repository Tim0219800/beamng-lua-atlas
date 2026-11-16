# `ui_photomode_presets`

*File: `lua/ge/extensions/ui/photomode/presets.lua` · VM: Game Engine (GE) · 484 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_presets`: `extensions.load("ui_photomode_presets")`, then the global `ui_photomode_presets`

Management of photo mode presets, of three types: camera, scene and effects. Each type is stored in a JSON file under settings/photomode/presets/ (camera.json, scene.json, effects.json); the state is captured or applied by the modules ui_photomode_camera, _scene and _effects. The module also manages a temporary "Defaults" preset (state captured at the start of the session) and the temporary presets provided by these modules.

## Notes

- File format: {version=1, presets={...}}; each preset has id (UUID), type, version=1, name, createdAt, updatedAt, origin, data. New presets are inserted at the head of the list.
- The default preset has the identifier "__defaults" and temporary=true; deleting it does not erase it from disk, it is only hidden until resetTemporaryPresets.
- Scene-type camera presets (data.cameraPresetType == "scene") are listed/applicable only in the level whose identifier matches data.levelId.
- The functions return {ok=false, reason=...} on failure (preset_type_invalid, preset_not_found, preset_capture_failed, preset_write_failed, preset_bundle_invalid). On success, the table does not necessarily contain the ok field.
- renamePreset and deletePreset only affect presets in the file (renaming a temporary preset returns preset_not_found).
- Empty name: replaced by "Untitled preset".

**Dependencies (loaded first):** `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_presets.applyPreset(presetType, presetId, options)` | Applies a preset by identifier (default, temporary or from the file) via the relevant module's applyPresetState. | 275 |
| `ui_photomode_presets.applyPresetPayload(presetType, payload)` | Directly applies a preset payload (for example imported from a capture's metadata), without going through storage. | 398 |
| `ui_photomode_presets.captureSessionDefaultPresets()` | Captures, for each preset type, the current default state (captureDefaultPresetState of the relevant module). Serves as the content of the "Defaults" preset. To be called at the start of a photo session. | 129 |
| `ui_photomode_presets.deletePreset(presetType, presetId)` | Deletes a preset from the file; for the default preset or a temporary preset, only hides it. | 320 |
| `ui_photomode_presets.discoverTemporaryPresets(presetType)` | Enables the inclusion of the module's temporary presets (getTemporaryPresetList) for this type, then returns the full list. | 228 |
| `ui_photomode_presets.getScreenshotPresetBundle()` | Captures the current state of the three modules as a bundle intended for a screenshot's metadata. | 462 |
| `ui_photomode_presets.listPresets(presetType)` | Lists the presets of a type: the default preset (if not hidden), the temporary presets already discovered, then those from the file available in the current level. | 213 |
| `ui_photomode_presets.renamePreset(presetType, presetId, name)` | Renames a preset saved in the file and updates updatedAt. | 373 |
| `ui_photomode_presets.resetTemporaryPresets()` | Resets the temporary state: discovered presets, hidden presets and the session's captured default states. | 58 |
| `ui_photomode_presets.saveCurrentPreset(presetType, name, options)` | Captures the current state of the module of the given type (capturePresetState) and saves it as a new preset at the head of the file. | 245 |
| `ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin)` | Saves a preset bundle: for each of camera, scene, effects present in the bundle, calls savePresetPayload with the name "<prefix> <type>". Stops at the first failure. | 436 |
| `ui_photomode_presets.savePresetPayload(presetType, name, payload, origin)` | Saves a given payload (without capturing the current state) as a new preset at the head of the file. | 415 |

### Parameter details

#### `ui_photomode_presets.applyPreset(presetType, presetId, options)`

Applies a preset by identifier (default, temporary or from the file) via the relevant module's applyPresetState.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `presetId` (*string*) : Preset identifier, or "__defaults".
- `options` (*table|nil*) : Options passed to applyPresetState ({} by default).
- **returns**: table {preset, state} or {ok=false, reason}.

#### `ui_photomode_presets.applyPresetPayload(presetType, payload)`

Directly applies a preset payload (for example imported from a capture's metadata), without going through storage.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `payload` (*table*) : Preset table; if it contains a data field, that is what is applied, otherwise the whole table.
- **returns**: table {state} or {ok=false, reason}.

#### `ui_photomode_presets.deletePreset(presetType, presetId)`

Deletes a preset from the file; for the default preset or a temporary preset, only hides it.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `presetId` (*string*) : Preset identifier.
- **returns**: table {presets} (updated list) or {ok=false, reason}.

#### `ui_photomode_presets.discoverTemporaryPresets(presetType)`

Enables the inclusion of the module's temporary presets (getTemporaryPresetList) for this type, then returns the full list.

- `presetType` (*string*) : "camera", "scene" or "effects".
- **returns**: table {presets=table[]} or {ok=false, reason, presets={}}.

#### `ui_photomode_presets.getScreenshotPresetBundle()`

Captures the current state of the three modules as a bundle intended for a screenshot's metadata.

- **returns**: table {schemaVersion=1, camera={version,type,data}, scene={...}, effects={...}}.

#### `ui_photomode_presets.listPresets(presetType)`

Lists the presets of a type: the default preset (if not hidden), the temporary presets already discovered, then those from the file available in the current level.

- `presetType` (*string*) : "camera", "scene" or "effects".
- **returns**: table {presets=table[]} or {ok=false, reason, presets={}}.

#### `ui_photomode_presets.renamePreset(presetType, presetId, name)`

Renames a preset saved in the file and updates updatedAt.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `presetId` (*string*) : Preset identifier.
- `name` (*string*) : New name.
- **returns**: table {preset, presets} or {ok=false, reason}.

#### `ui_photomode_presets.saveCurrentPreset(presetType, name, options)`

Captures the current state of the module of the given type (capturePresetState) and saves it as a new preset at the head of the file.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `name` (*string*) : Preset name.
- `options` (*table|nil*) : Options passed to capturePresetState ({} by default).
- **returns**: table {preset, presets} or {ok=false, reason}.

#### `ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin)`

Saves a preset bundle: for each of camera, scene, effects present in the bundle, calls savePresetPayload with the name "<prefix> <type>". Stops at the first failure.

- `bundle` (*table*) : Table {camera=..., scene=..., effects=...}.
- `namePrefix` (*string*) : Name prefix.
- `origin` (*any*) : Provenance passed to each preset.
- **returns**: table {imported={camera=preset, scene=preset, effects=preset}} or {ok=false, reason}.

#### `ui_photomode_presets.savePresetPayload(presetType, name, payload, origin)`

Saves a given payload (without capturing the current state) as a new preset at the head of the file.

- `presetType` (*string*) : "camera", "scene" or "effects".
- `name` (*string*) : Preset name.
- `payload` (*table*) : Preset data (data field or whole table).
- `origin` (*any*) : Provenance stored in the preset's origin field (inferred from code).
- **returns**: table {preset, presets} or {ok=false, reason}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_photomode_camera, ui_photomode_scene, ui_photomode_effects. |

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/presets.lua`.*
