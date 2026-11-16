# `ui_photomode_postFxPersistence`

*File: `lua/ge/extensions/ui/photomode/postFxPersistence.lua` · VM: Game Engine (GE) · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_postFxPersistence`: `extensions.load("ui_photomode_postFxPersistence")`, then the global `ui_photomode_postFxPersistence`

Disk save and reload of the photo mode post-processing effects state (depth of field, motion blur, specular occlusion, SSAO/SSR/reflections/mirrors quality, occupant visibility). The file is used to restore the player's original settings after a photo session. The values read are normalized (booleans, numbers, strings) and unknown fields are ignored.

## Notes

- File written: settings/photomodePostFxRestoreState.json, in the format {version = 1, effects = {...}}. An old file without an envelope (direct effects table) is also accepted on read.
- Boolean fields: dofEnabled, dofAutofocus, specularOcclusionEnabled, screenSpaceShadowsEnabled, motionBlurEnabled, occupantsVisible. Numeric fields: dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, motionBlurStrength. String fields: ssaoQualityMode, ssrQualityMode, reflectionQualityMode, mirrorsQualityMode.
- If a DOF field (dofEnabled, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange) is present but dofAutofocus is not, dofAutofocus is forced to false.
- Booleans accept true/false, 1/0, "1"/"0", "true"/"false"; any other value gives false.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_postFxPersistence.loadRestoreState()` | Reads the save file and returns the normalized effects state, or nil if the file is missing, unreadable or has no known field. | 145 |
| `ui_photomode_postFxPersistence.saveRestoreState(effectsState)` | Normalizes the effects table then writes it to RESTORE_STATE_FILE. Returns nil, false if the table is not valid or contains no known field. | 137 |

### Parameter details

#### `ui_photomode_postFxPersistence.loadRestoreState()`

Reads the save file and returns the normalized effects state, or nil if the file is missing, unreadable or has no known field.

- **returns**: table|nil Normalized effects state.

#### `ui_photomode_postFxPersistence.saveRestoreState(effectsState)`

Normalizes the effects table then writes it to RESTORE_STATE_FILE. Returns nil, false if the table is not valid or contains no known field.

- `effectsState` (*table*) : Effects table (fields listed in the notes); unknown fields are ignored.
- **returns**: table|nil Normalized state, or nil if there is nothing to save.
- **returns**: boolean true if the file write succeeded (an error is logged otherwise).

## Fields

| Field | Type | Description |
|---|---|---|
| `RESTORE_STATE_FILE` | string | Relative path of the save file: "settings/photomodePostFxRestoreState.json". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/postFxPersistence.lua`.*
