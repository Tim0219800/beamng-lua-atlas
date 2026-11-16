# `util_terrainGenerator`

*File: `lua/ge/extensions/util/terrainGenerator.lua` · VM: Game Engine (GE) · 478 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_terrainGenerator`: `extensions.load("util_terrainGenerator")`, then the global `util_terrainGenerator`

Utility (still a work in progress according to the file comment) that generates a terrain block (TerrainBlock) from a height map: a Lua array of heights or a PNG. It also handles hole maps, layer maps (layerMap) and terrain materials read from a JSON. A modder uses it from the console to create or replace a level's terrain (for example smallgrid). The module only exposes new(data), which returns an object whose methods are described in the class C.

## Example

```lua
extensions.load('util/terrainGenerator')
local obj = util_terrainGenerator.new()
local arr = {}
for x = 1, 256 do
  arr[x] = {}
  for y = 1, 256 do arr[x][y] = randomGauss3() / 5 end
end
obj:setBitmapFromArray(arr)
obj:createTerrain()
obj:centerTerrain()
```

## Notes

- The map dimensions must be multiples of 128: setBitmapFromArray rounds the size up to the next multiple of 128 and fills with 0s.
- Heights are written into a GFXFormatR16 bitmap: z is brought back to [0, terrainHeight] then multiplied by 65535. Negative heights are therefore clamped to 0.
- setBitmapFromArray replaces terrainHeight with the array's maximum height and saves the PNG (self.heightMap, default 'temp/temp_heightMap.png').
- init calls resetUserDir('temp/'): all *heightMap.png, *holeMap.png and *layerMap_*.png files in the temp/ folder are deleted each time an object is created.
- createTerrain deletes the existing terrain (resetTerrain) before creating a new one, then saves the level's .ter file.
- createTerrain requires as many materials as layer maps; otherwise it deletes the terrain and exits with an error (the terrain is then lost).
- In init, terrainHeight is initialized with getMaxHeight() which calls core_terrain.getTerrain(): without a loaded terrain the value is 0.
- In setUserDir, files are searched in the folder; the first match of each type (*heightMap.png, *holeMap.png, *materials.json) is kept.
- Inconsistency: setPngData does not check its arguments and overwrites flipYAxis with flipY, which is nil if omitted.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_terrainGenerator.new(data)` | Creates a terrain generator and calls init(data). Returns the object (class C) on which the methods are called. | 468 |

### Parameter details

#### `util_terrainGenerator.new(data)`

Creates a terrain generator and calls init(data). Returns the object (class C) on which the methods are called.

- `data` (*table|nil*) : Optional options: terrainScale (cell size, 1 by default), terrainHeight, name ('temp'), terrainName ('theTerrain'), userDir ('temp/'), heightMap, holeMap, textureMaps, materials.
- **returns**: table Terrain generator instance.

## Class `C`

Object returned by new(data): keeps the height map (GBitmap), the scale, the max height, the user folder, the materials and the layer maps.

| Method | Description | Line |
|---|---|---|
| `C:centerTerrain()` | Places the terrain so that the world origin is at the center of the block (offset of -size/2 in x and y). | 105 |
| `C:createTerrain()` | Creates the terrain from the saved parameters: deletes the old one, creates a TerrainBlock, applies the TextureSet if any, adds the materials, imports the maps (importMaps) and saves the terrain file. Logs an error and exits if the height PNG is not found or if materials and maps differ in number. | 380 |
| `C:exportTerrainMaps(dir, prefix)` | Exports as PNG the height map, hole maps and layer maps of the current terrain (works on any existing terrain). | 188 |
| `C:getMaxHeight()` | Returns the user height (getHeightScaleUser) of the current terrain, or 0 if there is no terrain. | 90 |
| `C:getTextureMap(path, matName)` | Builds the data entry of a layer map for a material (channel R, materialId = number of maps already present). | 184 |
| `C:init(data)` | Initializes the fields from data (scale, height, names, paths, materials), creates an empty GBitmap and empties the temp/ folder. Called by new(). | 39 |
| `C:loadBitmap(path)` | Loads a height PNG into the bitmap, updates heightMap and bitmapWidth. | 73 |
| `C:resetTerrain(deleteOnly)` | Deletes the current terrain then, unless deleteOnly, creates a new TerrainBlock named terrainName, attached to the current level's folder and added to MissionGroup. | 172 |
| `C:resetUserDir(dir)` | Deletes the *heightMap.png, *holeMap.png and *layerMap_*.png files in the folder. | 159 |
| `C:saveBitmap(path)` | Saves the height bitmap as a PNG (adds .png if missing) and stores the path in heightMap. Logs an error and exits if the save fails. | 57 |
| `C:setBitmapFromArray(array)` | Builds the R16 bitmap from a 2D array array[x][y] (1-based indices), fills the gaps with 0, rounds the size up to a multiple of 128 and saves the PNG. Sets terrainHeight to the array's max height. | 118 |
| `C:setDefaultMaterial()` | Creates the 'default' terrain material (smallgrid level grid) and makes it the object's only material. | 233 |
| `C:setMaterials(matData)` | Defines the terrain materials before creation. With no argument, takes those of the existing terrain (excluding 'warning_material'). With matData.filePath, reads a materials JSON and creates the matching TerrainMaterials (v1 and v1.5 fields, TextureSet). With matData.materials, uses the list directly. Falls back to the default material if nothing is defined. | 249 |
| `C:setPngData(path, size, height, scale, flipY)` | Directly sets the height PNG and its parameters. | 203 |
| `C:setPoint(x, y, z)` | Writes a pixel of the height map. x and y start at 0; z is normalized by terrainHeight and clamped to [0, 1]. | 112 |
| `C:setTerrainOffset(vec)` | Moves the terrain block to the given position (vec3(0,0,0) corresponds to the block's corner) and reloads collision. | 98 |
| `C:setTextureMaps()` | Associates each material with its *_layerMap_*.png PNG found in userDir, and generates an empty PNG (white for the default material, black otherwise) for those that have none. | 339 |
| `C:setUserDir(dir)` | Sets the project folder and, if it exists, automatically locates the height PNG, the hole PNG and the *materials.json file (which it loads via setMaterials). | 211 |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/terrainGenerator.lua`.*
