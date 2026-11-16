# `editor_terrainAndRoadImporter`

*File: `lua/ge/extensions/editor/terrainAndRoadImporter.lua` · VM: Game Engine (GE) · 795 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terrainAndRoadImporter`: `extensions.load("editor_terrainAndRoadImporter")`, then the global `editor_terrainAndRoadImporter`

Editor tool 'Terrain And Road Importer': imports a terrain from a 16-bit grayscale PNG (height = value/65535 x zMax), or deforms the terrain toward vertices (IDW) read from a JSON, and imports roads from a JSON (list of roads, each a list of nodes {x,y,width}). The roads become DecalRoads (material road_asphalt_2lane, in a 'Terrain And Road Importer' SimGroup) and the terrain is terraformed around them (domain of influence DOI + margin) to match the road. Requires a TerrainBlock in the scene (otherwise the functions return without doing anything) and the editor_terrainEditor module.

## Notes

- The edit mode (terrainToLine icon) is only registered if license.isValid() is true.
- The imported terrain is limited to 2001x2001 samples (xBmp/yBmp <= 2000); conformTerrainToPeaks works on a fixed 2000x2000 grid with power-2 IDW (costly) and caps heights at 250 m.
- Heights are clamped to >= 0 (max(0, ...)).
- importRoads: the DecalRoads are placed at +10 m in z then conformTerrainToRoad flattens the terrain under the road; map.reset() is called to recompute the navgraph.
- reset() deletes the 'Terrain And Road Importer' folder but sets ALL the terrain back to z=0 (not only the imported area).
- importTerrain: if the PNG fails to load, an error is logged but processing continues anyway (no return).
- Slider values: zMax 0-500 m (default 400), DOI 1-500 m (default 150), margin 0-20 m (default 7).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath)` | Deforms the local terrain toward given vertices: reads a JSON [{x,y,z}], converts to grid coordinates, interpolates by IDW on a 2000x2000 grid and writes the heights (0 to 250 m) into the TerrainBlock, then marks it as modified. | 75 |
| `editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin)` | Imports roads from a JSON (list of roads, each a list of {x,y,width}): places each node on the terrain height, triangulates the roads, conforms the terrain around (DOI/margin), creates the DecalRoads in a scene folder and resets the navgraph. | 584 |
| `editor_terrainAndRoadImporter.importTerrain(terrPath, zMax)` | Imports a terrain from a 16-bit PNG: applies each texel (x value/65535 x zMax) to the heightmap, updates the grid then reloads the collision (be:reloadCollision). | 537 |
| `editor_terrainAndRoadImporter.onEditorGui()` | Editor render hook: if the tool is active, draws the window with the buttons Conform To Peaks, Import Terrain, Import Roads, Reset (they open a file picker) and the three sliders zMax / Domain Of Influence / Margin. *(internal)* *(hook)* | 673 |
| `editor_terrainAndRoadImporter.onEditorInitialized()` | Editor initialization hook: if the license is valid, registers the terrainAndRoadImporterEditMode edit mode and the tool window. *(internal)* *(hook)* | 767 |
| `editor_terrainAndRoadImporter.reset()` | Deletes the imported roads folder ('Terrain And Road Importer') and sets the heightmap to z=0 everywhere. | 633 |
| `editor_terrainAndRoadImporter.toggleWorldEditor(isOpen)` | Opens or closes the world editor (editor.setEditorActive). | 670 |

### Parameter details

#### `editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath)`

Deforms the local terrain toward given vertices: reads a JSON [{x,y,z}], converts to grid coordinates, interpolates by IDW on a 2000x2000 grid and writes the heights (0 to 250 m) into the TerrainBlock, then marks it as modified.

- `filepath` (*string*) : Path of the .json file containing the list of vertices {x,y,z}.

#### `editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin)`

Imports roads from a JSON (list of roads, each a list of {x,y,width}): places each node on the terrain height, triangulates the roads, conforms the terrain around (DOI/margin), creates the DecalRoads in a scene folder and resets the navgraph.

- `roadPath` (*string*) : Path of the roads .json file
- `DOI` (*number*) : Terraforming domain of influence (m)
- `margin` (*number*) : Terraforming margin around the roadway (m)

#### `editor_terrainAndRoadImporter.importTerrain(terrPath, zMax)`

Imports a terrain from a 16-bit PNG: applies each texel (x value/65535 x zMax) to the heightmap, updates the grid then reloads the collision (be:reloadCollision).

- `terrPath` (*string*) : Path of the .png file
- `zMax` (*number*) : Height (m) corresponding to the maximum value of the PNG: the terrain is mapped onto [0, zMax].

#### `editor_terrainAndRoadImporter.toggleWorldEditor(isOpen)`

Opens or closes the world editor (editor.setEditorActive).

- `isOpen` (*boolean*) : true to open, false to close.

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terrainAndRoadImporter.lua`.*
