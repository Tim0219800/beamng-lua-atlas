# `utils_heatmap`

*File: `lua/common/utils/heatmap.lua` · VM: Common (GE + vehicle) · 128 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/heatmap")`

Proof of concept: generates an SVG image (2048x2048) of the map's road network (map.getMap()) with a red dot per vehicle on each call of update(). Loaded with require('utils/heatmap'). Used to visualize trajectories; the image is written with the libs/EzSVG library.

## Example

```lua
local heatmap = require('utils/heatmap')
heatmap.init('trace.svg')
-- every frame: heatmap.update()
heatmap.destroy() -- saves then frees
```

## Notes

- Size fixed at 2048 (terrainSize), not read from the terrain (comment in the code); coordinates are offset by the TerrainBlock position and the Y axis is inverted.
- Roads whose link value (difficulty) is < 0.7: brown (dirt), otherwise black. Width = 2 x node radius.
- init() assumes a TerrainBlock exists in the scene (scenetree.findClassObjects('TerrainBlock')[1]): crashes otherwise.
- update() adds one SVG circle per vehicle per call: the document grows every frame.
- destroy() calls save() before freeing; init() calls destroy() first, which saves the old document if any (into the NEW file name, because filename has already been replaced).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_heatmap.destroy()` | Saves then frees the document and the terrain position. | 74 |
| `utils_heatmap.init(_filename)` | Creates the SVG document, remembers the terrain position and draws the map's roads and nodes. | 80 |
| `utils_heatmap.save()` | Writes the current SVG to the file chosen at init(). Does nothing if there is no document. | 69 |
| `utils_heatmap.update()` | To be called every frame (including in menus, without 3D rendering): draws a red circle at the position of each object in map.objects. | 96 |

### Parameter details

#### `utils_heatmap.init(_filename)`

Creates the SVG document, remembers the terrain position and draws the map's roads and nodes.

- `_filename` (*string*) : Output SVG file

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/heatmap.lua`.*
