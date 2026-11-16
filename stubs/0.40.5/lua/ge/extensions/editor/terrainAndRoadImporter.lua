---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainAndRoadImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool 'Terrain And Road Importer': imports a terrain from a 16-bit grayscale PNG (height = value/65535 x zMax), or deforms the terrain toward vertices (IDW) read from a JSON, and imports roads from a JSON (list of roads, each a list of nodes {x,y,width}). The roads become DecalRoads (material road_asphalt_2lane, in a 'Terrain And Road Importer' SimGroup) and the terrain is terraformed around them (domain of influence DOI + margin) to match the road. Requires a TerrainBlock in the scene (otherwise the functions return without doing anything) and the editor_terrainEditor module.
--- Access: extension `editor_terrainAndRoadImporter`: `extensions.load("editor_terrainAndRoadImporter")`, then the global `editor_terrainAndRoadImporter`
---@class editor_terrainAndRoadImporter
editor_terrainAndRoadImporter = {}

--- Deforms the local terrain toward given vertices: reads a JSON [{x,y,z}], converts to grid coordinates, interpolates by IDW on a 2000x2000 grid and writes the heights (0 to 250 m) into the TerrainBlock, then marks it as modified.
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:75
---@param filepath string Path of the .json file containing the list of vertices {x,y,z}.
function editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath) end

--- Imports roads from a JSON (list of roads, each a list of {x,y,width}): places each node on the terrain height, triangulates the roads, conforms the terrain around (DOI/margin), creates the DecalRoads in a scene folder and resets the navgraph.
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:584
---@param roadPath string Path of the roads .json file
---@param DOI number Terraforming domain of influence (m)
---@param margin number Terraforming margin around the roadway (m)
function editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin) end

--- Imports a terrain from a 16-bit PNG: applies each texel (x value/65535 x zMax) to the heightmap, updates the grid then reloads the collision (be:reloadCollision).
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:537
---@param terrPath string Path of the .png file
---@param zMax number Height (m) corresponding to the maximum value of the PNG: the terrain is mapped onto [0, zMax].
function editor_terrainAndRoadImporter.importTerrain(terrPath, zMax) end

--- Editor render hook: if the tool is active, draws the window with the buttons Conform To Peaks, Import Terrain, Import Roads, Reset (they open a file picker) and the three sliders zMax / Domain Of Influence / Margin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:673
function editor_terrainAndRoadImporter.onEditorGui() end

--- Editor initialization hook: if the license is valid, registers the terrainAndRoadImporterEditMode edit mode and the tool window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:767
function editor_terrainAndRoadImporter.onEditorInitialized() end

--- Deletes the imported roads folder ('Terrain And Road Importer') and sets the heightmap to z=0 everywhere.
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:633
function editor_terrainAndRoadImporter.reset() end

--- Opens or closes the world editor (editor.setEditorActive).
---Source: lua/ge/extensions/editor/terrainAndRoadImporter.lua:670
---@param isOpen boolean true to open, false to close.
function editor_terrainAndRoadImporter.toggleWorldEditor(isOpen) end

