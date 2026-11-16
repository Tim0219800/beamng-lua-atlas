---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/terrainQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Terrain quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Terrain::lodScale and $pref::Terrain::detailScale. The onApply hook forces a texture update of all TerrainBlocks.
--- Access: extension `core_settings_terrainQuality`: `extensions.load("core_settings_terrainQuality")`, then the global `core_settings_terrainQuality`
---@class core_settings_terrainQuality
---@field qualityLevels table<string, table<string, number>> lodScale / detailScale: Lowest 2.0 / 0.5, Low 1.5 / 0.75, Normal 1.0 / 1, High 0.75 / 1.5.
core_settings_terrainQuality = {}

--- Called by graphicsQualityGroup when a value has changed. Walks the objects of class TerrainBlock (scenetree.findClassObjects) and calls updateAllTextures() on each one if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/terrainQuality.lua:39
function core_settings_terrainQuality.onApply() end

