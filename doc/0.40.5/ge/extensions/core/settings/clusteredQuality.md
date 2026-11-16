# `core_settings_clusteredQuality`

*File: `lua/ge/extensions/core/settings/clusteredQuality.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_clusteredQuality`: `extensions.load("core_settings_clusteredQuality")`, then the global `core_settings_clusteredQuality`

Quality presets for "clustered" lighting (grouped local lights) and their shadows. Each level (Lowest, Low, Normal, High, Ultra) sets properties of the global engine object ClusterShading. Used by the graphics settings system (graphic.lua); a modder can call applyLevel directly.

## Example

```lua
core_settings_clusteredQuality.applyLevel("High")
```

## Notes

- If ClusterShading does not exist or the level is unknown, applyLevel does nothing (silent return).
- Unlike the other quality modules, it does not use VariableRegistry: it writes directly to ClusterShading.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_clusteredQuality.applyLevel(level)` | Copies the preset of the requested level into the ClusterShading properties (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble). | 50 |

### Parameter details

#### `core_settings_clusteredQuality.applyLevel(level)`

Copies the preset of the requested level into the ClusterShading properties (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble).

- `level` (*string*) : Level name: Lowest, Low, Normal, High or Ultra.

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table> | Presets by level name. Each entry contains minLightScreenSize (minimum screen size of a light, fraction), lightFlares (boolean), shadowMaxCasters (max number of lights casting a shadow), shadowFallbackFrames (number of frames), shadowOversample (oversampling factor), shadowBubble (factor). Levels: Lowest, Low, Normal, High, Ultra. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/clusteredQuality.lua`.*
