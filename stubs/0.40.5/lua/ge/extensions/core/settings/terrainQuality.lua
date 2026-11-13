---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/terrainQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité du terrain, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Terrain::lodScale et $pref::Terrain::detailScale. Le hook onApply force la mise à jour des textures de tous les TerrainBlock.
--- Accès : extension `core_settings_terrainQuality` : `extensions.load("core_settings_terrainQuality")`, puis la globale `core_settings_terrainQuality`
---@class core_settings_terrainQuality
---@field qualityLevels table<string, table<string, number>> lodScale / detailScale : Lowest 2.0 / 0.5, Low 1.5 / 0.75, Normal 1.0 / 1, High 0.75 / 1.5.
core_settings_terrainQuality = {}

--- Appelé par graphicsQualityGroup quand une valeur a changé. Parcourt les objets de classe TerrainBlock (scenetree.findClassObjects) et appelle updateAllTextures() sur chacun s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/terrainQuality.lua:39
function core_settings_terrainQuality.onApply() end

