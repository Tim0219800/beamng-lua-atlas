# `core_settings_meshQuality`

*File: `lua/ge/extensions/core/settings/meshQuality.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_meshQuality`: `extensions.load("core_settings_meshQuality")`, then the global `core_settings_meshQuality`

Mesh quality presets (shape level of detail), consumed by graphicsQualityGroup. Each level sets $pref::TS::detailAdjust and $pref::TS::skipRenderDLs.

## Notes

- skipRenderDLs is 0 at all levels. No onApply hook.

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | Levels Lowest (detailAdjust 0.5), Low (0.75), Normal (1.0), High (1.5), Ultra (2.0), key $pref::TS::detailAdjust; $pref::TS::skipRenderDLs = 0 everywhere. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/meshQuality.lua`.*
