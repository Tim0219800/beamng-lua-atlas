---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainAndRoadImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_terrainAndRoadImporter` : `extensions.load("editor_terrainAndRoadImporter")`, puis la globale `editor_terrainAndRoadImporter`
---@class editor_terrainAndRoadImporter
editor_terrainAndRoadImporter = {}

--- Conforms the local terrain to some given peaks
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:75
---@param filepath any
function editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath) end

--- Imports a set of roads from the given paths.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:584
---@param roadPath any
---@param DOI any
---@param margin any
function editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin) end

--- Imports a terrain from the given path.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:537
---@param terrPath any
---@param zMax any
function editor_terrainAndRoadImporter.importTerrain(terrPath, zMax) end

--- World editor main callback for rendering the UI.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:673
function editor_terrainAndRoadImporter.onEditorGui() end

--- Called upon world editor initialization.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:767
function editor_terrainAndRoadImporter.onEditorInitialized() end

--- Removes all decal roads and resets the heightmap/terrain (sets it flat everywhere ie z=0).
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:633
function editor_terrainAndRoadImporter.reset() end

--- Opens/closes the world editor.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:670
---@param isOpen any
function editor_terrainAndRoadImporter.toggleWorldEditor(isOpen) end

