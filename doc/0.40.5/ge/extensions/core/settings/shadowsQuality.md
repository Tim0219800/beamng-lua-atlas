# `core_settings_shadowsQuality`

*File: `lua/ge/extensions/core/settings/shadowsQuality.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_shadowsQuality`: `extensions.load("core_settings_shadowsQuality")`, then the global `core_settings_shadowsQuality`

Shadow quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Shadows::textureScalar and $pref::Shadows::disable. vehicleTexSizes additionally gives the vehicle shadow texture size per level.

## Notes

- The Disabled level sets $pref::Shadows::disable to 2; the other levels to 0.
- vehicleTexSizes is not applied by this module: it is a data table read elsewhere (graphic.lua).

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | Levels Disabled, Lowest, Low, Normal, High, Ultra. textureScalar: 0.25, 0.25, 0.5, 1.0, 2.0, 4.0. |
| `vehicleTexSizes` | table<string, integer> | Vehicle shadow texture size per level: Disabled 512, Lowest 512, Low 1024, Normal 2048, High 4096, Ultra 8192. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/shadowsQuality.lua`.*
