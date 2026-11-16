# `core_settings_textureQuality`

*File: `lua/ge/extensions/core/settings/textureQuality.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_textureQuality`: `extensions.load("core_settings_textureQuality")`, then the global `core_settings_textureQuality`

Texture quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Video::textureReductionLevel and $pref::Reflect::refractTexScale. The onApply hook reloads the textures.

## Notes

- Levels: Lowest, Low, Normal only.
- The code notes that reloadTextures() can be a slow operation.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_textureQuality.onApply()` | Called by graphicsQualityGroup when a value has changed. Calls reloadTextures(). *(internal)* *(hook)* | 24 |

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | textureReductionLevel / refractTexScale: Lowest 2 / 0.5, Low 1 / 0.75, Normal 0 / 1. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/textureQuality.lua`.*
