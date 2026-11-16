# `core_settings_lightingQuality`

*File: `lua/ge/extensions/core/settings/lightingQuality.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_lightingQuality`: `extensions.load("core_settings_lightingQuality")`, then the global `core_settings_lightingQuality`

Lighting quality presets, consumed by graphicsQualityGroup. Each level sets the light manager, shadow filtering, specular, normal mapping, parallax, true water reflections and the shader quality group, via $pref::* keys. The onApply hook changes the active light manager.

## Notes

- There is no Normal level in this module (only Lowest, Low, High, Ultra).
- Only Lowest uses Basic Lighting; Low uses Advanced Lighting; High and Ultra use Advanced Lighting 1.5 with exactly the same values (Ultra is identical to High).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_lightingQuality.onApply()` | Called by graphicsQualityGroup when a value has changed. Reads $pref::lightManager; if getActiveLightManager() is already equal, does nothing, otherwise calls setLightManager. *(internal)* *(hook)* | 49 |

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, any>> | Levels Lowest, Low, High, Ultra. Keys: $pref::lightManager, $pref::Shadows::filterMode, $pref::Video::disablePixSpecular, $pref::Video::disableNormalmapping, $pref::Video::disableParallaxMapping, $pref::Water::disableTrueReflections, $pref::Video::ShaderQualityGroup. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/lightingQuality.lua`.*
