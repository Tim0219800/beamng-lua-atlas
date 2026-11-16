---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/terrainGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility (still a work in progress according to the file comment) that generates a terrain block (TerrainBlock) from a height map: a Lua array of heights or a PNG. It also handles hole maps, layer maps (layerMap) and terrain materials read from a JSON. A modder uses it from the console to create or replace a level's terrain (for example smallgrid). The module only exposes new(data), which returns an object whose methods are described in the class C.
--- Access: extension `util_terrainGenerator`: `extensions.load("util_terrainGenerator")`, then the global `util_terrainGenerator`
---@class util_terrainGenerator
util_terrainGenerator = {}

--- Creates a terrain generator and calls init(data). Returns the object (class C) on which the methods are called.
---Source: lua/ge/extensions/util/terrainGenerator.lua:468
---@param data table|nil Optional options: terrainScale (cell size, 1 by default), terrainHeight, name ('temp'), terrainName ('theTerrain'), userDir ('temp/'), heightMap, holeMap, textureMaps, materials.
---@return table  Terrain generator instance.
function util_terrainGenerator.new(data) end

--- Object returned by new(data): keeps the height map (GBitmap), the scale, the max height, the user folder, the materials and the layer maps.
---@class util_terrainGenerator_C
local util_terrainGenerator_C = {}

--- Places the terrain so that the world origin is at the center of the block (offset of -size/2 in x and y).
---Source: lua/ge/extensions/util/terrainGenerator.lua:105
function util_terrainGenerator_C:centerTerrain() end

--- Creates the terrain from the saved parameters: deletes the old one, creates a TerrainBlock, applies the TextureSet if any, adds the materials, imports the maps (importMaps) and saves the terrain file. Logs an error and exits if the height PNG is not found or if materials and maps differ in number.
---Source: lua/ge/extensions/util/terrainGenerator.lua:380
function util_terrainGenerator_C:createTerrain() end

--- Exports as PNG the height map, hole maps and layer maps of the current terrain (works on any existing terrain).
---Source: lua/ge/extensions/util/terrainGenerator.lua:188
---@param dir string|nil Output folder; userDir by default. Must end with '/' (direct concatenation).
---@param prefix string|nil File prefix; name by default.
function util_terrainGenerator_C:exportTerrainMaps(dir, prefix) end

--- Returns the user height (getHeightScaleUser) of the current terrain, or 0 if there is no terrain.
---Source: lua/ge/extensions/util/terrainGenerator.lua:90
---@return number  Maximum height in meters.
function util_terrainGenerator_C:getMaxHeight() end

--- Builds the data entry of a layer map for a material (channel R, materialId = number of maps already present).
---Source: lua/ge/extensions/util/terrainGenerator.lua:184
---@param path string Path of the layer's PNG.
---@param matName string|nil Material name.
---@return table  {path, selected, material, materialId, channel, channelId}.
function util_terrainGenerator_C:getTextureMap(path, matName) end

--- Initializes the fields from data (scale, height, names, paths, materials), creates an empty GBitmap and empties the temp/ folder. Called by new().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/terrainGenerator.lua:39
---@param data table|nil Options (see new).
function util_terrainGenerator_C:init(data) end

--- Loads a height PNG into the bitmap, updates heightMap and bitmapWidth.
---Source: lua/ge/extensions/util/terrainGenerator.lua:73
---@param path string|nil File path; self.heightMap by default.
function util_terrainGenerator_C:loadBitmap(path) end

--- Deletes the current terrain then, unless deleteOnly, creates a new TerrainBlock named terrainName, attached to the current level's folder and added to MissionGroup.
---Source: lua/ge/extensions/util/terrainGenerator.lua:172
---@param deleteOnly boolean|nil If true, only deletes the terrain.
function util_terrainGenerator_C:resetTerrain(deleteOnly) end

--- Deletes the *heightMap.png, *holeMap.png and *layerMap_*.png files in the folder.
---Source: lua/ge/extensions/util/terrainGenerator.lua:159
---@param dir string|nil Folder; self.userDir by default.
function util_terrainGenerator_C:resetUserDir(dir) end

--- Saves the height bitmap as a PNG (adds .png if missing) and stores the path in heightMap. Logs an error and exits if the save fails.
---Source: lua/ge/extensions/util/terrainGenerator.lua:57
---@param path string|nil File path; self.heightMap by default.
function util_terrainGenerator_C:saveBitmap(path) end

--- Builds the R16 bitmap from a 2D array array[x][y] (1-based indices), fills the gaps with 0, rounds the size up to a multiple of 128 and saves the PNG. Sets terrainHeight to the array's max height.
---Source: lua/ge/extensions/util/terrainGenerator.lua:118
---@param array table<integer, table<integer, number>> Heights in meters. Modified in place (filling).
function util_terrainGenerator_C:setBitmapFromArray(array) end

--- Creates the 'default' terrain material (smallgrid level grid) and makes it the object's only material.
---Source: lua/ge/extensions/util/terrainGenerator.lua:233
function util_terrainGenerator_C:setDefaultMaterial() end

--- Defines the terrain materials before creation. With no argument, takes those of the existing terrain (excluding 'warning_material'). With matData.filePath, reads a materials JSON and creates the matching TerrainMaterials (v1 and v1.5 fields, TextureSet). With matData.materials, uses the list directly. Falls back to the default material if nothing is defined.
---Source: lua/ge/extensions/util/terrainGenerator.lua:249
---@param matData table|nil {filePath = JSON path} or {materials = list of names}.
function util_terrainGenerator_C:setMaterials(matData) end

--- Directly sets the height PNG and its parameters.
---Source: lua/ge/extensions/util/terrainGenerator.lua:203
---@param path string Path of the height PNG.
---@param size integer Bitmap width in pixels.
---@param height number Maximum terrain height.
---@param scale number Cell size.
---@param flipY boolean Flips the Y axis of the maps.
function util_terrainGenerator_C:setPngData(path, size, height, scale, flipY) end

--- Writes a pixel of the height map. x and y start at 0; z is normalized by terrainHeight and clamped to [0, 1].
---Source: lua/ge/extensions/util/terrainGenerator.lua:112
---@param x integer Pixel column (0-based).
---@param y integer Pixel row (0-based).
---@param z number Height in meters.
function util_terrainGenerator_C:setPoint(x, y, z) end

--- Moves the terrain block to the given position (vec3(0,0,0) corresponds to the block's corner) and reloads collision.
---Source: lua/ge/extensions/util/terrainGenerator.lua:98
---@param vec vec3 New terrain position.
function util_terrainGenerator_C:setTerrainOffset(vec) end

--- Associates each material with its *_layerMap_*.png PNG found in userDir, and generates an empty PNG (white for the default material, black otherwise) for those that have none.
---Source: lua/ge/extensions/util/terrainGenerator.lua:339
function util_terrainGenerator_C:setTextureMaps() end

--- Sets the project folder and, if it exists, automatically locates the height PNG, the hole PNG and the *materials.json file (which it loads via setMaterials).
---Source: lua/ge/extensions/util/terrainGenerator.lua:211
---@param dir string|nil Folder; 'temp/' by default. A trailing '/' is added if missing.
function util_terrainGenerator_C:setUserDir(dir) end

