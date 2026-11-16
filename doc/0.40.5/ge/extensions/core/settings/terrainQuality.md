# `core_settings_terrainQuality`

*File: `lua/ge/extensions/core/settings/terrainQuality.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_terrainQuality`: `extensions.load("core_settings_terrainQuality")`, then the global `core_settings_terrainQuality`

Terrain quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Terrain::lodScale and $pref::Terrain::detailScale. The onApply hook forces a texture update of all TerrainBlocks.

## Notes

- Levels: Lowest, Low, Normal, High (no Ultra). A smaller lodScale value gives more detail.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_terrainQuality.onApply()` | Called by graphicsQualityGroup when a value has changed. Walks the objects of class TerrainBlock (scenetree.findClassObjects) and calls updateAllTextures() on each one if it exists. *(internal)* *(hook)* | 39 |

## Fields

| Field | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | lodScale / detailScale: Lowest 2.0 / 0.5, Low 1.5 / 0.75, Normal 1.0 / 1, High 0.75 / 1.5. |

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/terrainQuality.lua`.*
