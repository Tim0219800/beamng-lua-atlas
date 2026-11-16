# `core_settings_dynCaptureQuality`

*File: `lua/ge/extensions/core/settings/dynCaptureQuality.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_dynCaptureQuality`: `extensions.load("core_settings_dynCaptureQuality")`, then the global `core_settings_dynCaptureQuality`

Quality presets for dynamic vehicle captures: dynamic reflections (cubemap) and dynamic mirrors. Each function applies a level by writing the $pref::BeamNGVehicle::dynamicReflection::* or dynamicMirrors::* variables in VariableRegistry. The code comment says it restores the Normal/High/Ultra settings of 0.39.

## Example

```lua
core_settings_dynCaptureQuality.applyReflection("High")
core_settings_dynCaptureQuality.applyMirrors("Low")
```

## Notes

- An unknown level is ignored without a message.
- Available levels: Disabled, Lowest, Low, Normal, High, Ultra.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_dynCaptureQuality.applyMirrors(level)` | Applies a dynamic mirrors level: writes enabled, textureSize, detail and distance to $pref::BeamNGVehicle::dynamicMirrors::*. | 36 |
| `core_settings_dynCaptureQuality.applyReflection(level)` | Applies a dynamic reflections level: writes enabled, textureSize, facesPerUpdate, detail and distance to $pref::BeamNGVehicle::dynamicReflection::*. | 26 |

### Parameter details

#### `core_settings_dynCaptureQuality.applyMirrors(level)`

Applies a dynamic mirrors level: writes enabled, textureSize, detail and distance to $pref::BeamNGVehicle::dynamicMirrors::*.

- `level` (*string*) : Key of mirrorLevels (Disabled, Lowest, Low, Normal, High, Ultra).

#### `core_settings_dynCaptureQuality.applyReflection(level)`

Applies a dynamic reflections level: writes enabled, textureSize, facesPerUpdate, detail and distance to $pref::BeamNGVehicle::dynamicReflection::*.

- `level` (*string*) : Key of reflectionLevels (Disabled, Lowest, Low, Normal, High, Ultra).

## Fields

| Field | Type | Description |
|---|---|---|
| `mirrorLevels` | table<string, table> | Per level: enabled (boolean), textureSize (128 to 1024), detail (0 to 0.75), distance (50 to 300). No facesPerUpdate. |
| `reflectionLevels` | table<string, table> | Per level: enabled (boolean), textureSize (128 to 1024), facesPerUpdate (1 or 2), detail (0 to 0.75), distance (50 to 300). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/dynCaptureQuality.lua`.*
