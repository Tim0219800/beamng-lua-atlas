# `editor_api_terrain`

*File: `lua/ge/extensions/editor/api/terrain.lua` · VM: Game Engine (GE) · 259 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_terrain`: `extensions.load("editor_api_terrain")`, then the global `editor_api_terrain`

Skeleton of the editor API for terrain (sculpting, material painting, foliage). initialize(editor) adds 46 functions to the editor object, but all have an empty body (TODO comment): they do nothing and return nil. The planned hooks are mentioned in a comment: onEditorTerrainCreated, onEditorTerrainDelete, onEditorTerrainHeightBrushChanged, onEditorTerrainHeightChanged, onEditorTerrainCleared, onEditorTerrainRestored.

## Notes

- All the functions are stubs (TODO): do not expect any effect. The names indicate the planned intent; parameter types are inferred from the names.
- The onEditorTerrain* hooks are only comments, nothing calls them here.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_terrain.initialize(editorInstance)` | Adds to the editor object all the terrain/foliage functions listed in the editor class. Called by the editor API loader. *(internal)* | 205 |

### Parameter details

#### `editor_api_terrain.initialize(editorInstance)`

Adds to the editor object all the terrain/foliage functions listed in the editor class. Called by the editor API loader.

- `editorInstance` (*table*) : Global editor object.

## Class `editor`

Functions added to editor. All are empty stubs (TODO).

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addFoliageBrushToGroup(groupName, foliageBrush)` | Planned: add a foliage brush to a group. Empty stub. | 157 |
| `editor.alignTerrainWithMesh(x, y, topOrBottom, amount)` | Planned: align the terrain to a mesh (top or bottom). Empty stub. | 97 |
| `editor.applyTerrainHeightBrushPreset(name)` | Planned: apply a height brush preset. Empty stub. | 41 |
| `editor.averageSmoothTerrain(x, y, amount)` | Planned: smoothing by averaging. Empty stub. | 73 |
| `editor.clearTerrain(x, y)` | Planned: clear the terrain at (x, y) (onEditorTerrainCleared hook). Empty stub. | 89 |
| `editor.createFoliageGroup(name)` | Planned: create a foliage group. Empty stub. | 137 |
| `editor.createFoliageMesh(foliageMesh)` | Planned: create a foliage mesh. Empty stub. | 145 |
| `editor.createTerrain(terrainInfo)` | Planned: create a terrain. Empty stub. | 17 |
| `editor.createTerrainPaintMaterial(mtl)` | Planned: create a paint material. Empty stub. | 109 |
| `editor.deleteFoliageBrush(name)` | Planned: delete a foliage brush. Empty stub. | 161 |
| `editor.deleteFoliageGroup(name)` | Planned: delete a foliage group. Empty stub. | 141 |
| `editor.deleteFoliageMesh(foliageMeshName)` | Planned: delete a foliage mesh. Empty stub. | 149 |
| `editor.deleteTerrain(terrainObjectId)` | Planned: delete a terrain. Empty stub. | 21 |
| `editor.deleteTerrainHeightBrushPreset(name)` | Planned: delete a height brush preset. Empty stub. | 45 |
| `editor.deleteTerrainPaintBrushPreset(name)` | Planned: delete a paint brush preset. Empty stub. | 129 |
| `editor.eraseFoliage(x, y)` | Planned: erase foliage at (x, y). Empty stub. | 181 |
| `editor.eraseSetFoliageBrushOrGroup(x, y)` | Planned: erase the elements of the active brush/group at (x, y). Empty stub. | 185 |
| `editor.exportTerrainHeightmap(terrainObjectId, filename)` | Planned: export a terrain's heightmap. Empty stub. | 29 |
| `editor.flattenTerrain(x, y, amount)` | Planned: flatten the terrain. Empty stub. | 81 |
| `editor.getFoliageMeshes()` | Planned: list the foliage meshes. Empty stub. | 153 |
| `editor.getTerrainHeightBrushPresets()` | Planned: list the height brush presets. Empty stub. | 49 |
| `editor.getTerrainPaintBrushPresets()` | Planned: list the paint brush presets. Empty stub. | 133 |
| `editor.grabTerrain(x, y, amount)` | Planned: "grab" terrain tool at (x, y). Empty stub. | 53 |
| `editor.importTerrainHeightmap(importInfo)` | Planned: import a heightmap. Empty stub. | 25 |
| `editor.loadTerrainPaintBrushPreset(name)` | Planned: load a paint brush preset. Empty stub. | 125 |
| `editor.lowerTerrain(x, y, amount)` | Planned: lower the terrain at (x, y). Empty stub. | 61 |
| `editor.noiseTerrain(x, y, amount)` | Planned: add noise to the terrain. Empty stub. | 77 |
| `editor.paintFoliage(x, y)` | Planned: paint foliage at (x, y). Empty stub. | 177 |
| `editor.paintTerrain(x, y)` | Planned: paint the terrain at (x, y). Empty stub. | 113 |
| `editor.raiseTerrain(x, y, amount)` | Planned: raise the terrain at (x, y). Empty stub. | 57 |
| `editor.restoreTerrain(x, y)` | Planned: restore the terrain at (x, y) (onEditorTerrainRestored hook). Empty stub. | 93 |
| `editor.rotateFoliageSelection(delta)` | Planned: rotate the foliage selection. Empty stub. | 193 |
| `editor.saveTerrainHeightBrushPreset(name)` | Planned: save a height brush preset. Empty stub. | 37 |
| `editor.saveTerrainPaintBrushPreset(name)` | Planned: save a paint brush preset. Empty stub. | 121 |
| `editor.scaleFoliageSelection(delta)` | Planned: scale the foliage selection. Empty stub. | 197 |
| `editor.selectFoliage(x, y)` | Planned: select foliage at (x, y). Empty stub. | 201 |
| `editor.selectTerrainPaintMaterial(mtl)` | Planned: choose the paint material. Empty stub. | 105 |
| `editor.setFoliageBrush(brushName)` | Planned: choose the active foliage brush. Empty stub. | 169 |
| `editor.setFoliageBrushGroup(name)` | Planned: choose the active brush group. Empty stub. | 165 |
| `editor.setFoliagePaintBrushSettings(brush)` | Planned: set the foliage paint brush. Empty stub. | 173 |
| `editor.setTerrainHeight(x, y, amount)` | Planned: set the terrain height. Empty stub. | 85 |
| `editor.setTerrainHeightBrush(brush)` | Planned: set the height brush. Empty stub. | 33 |
| `editor.setTerrainPaintBrush(brush)` | Planned: set the paint brush. Empty stub. | 117 |
| `editor.smoothSlopeTerrain(x, y, amount)` | Planned: smooth the slope. Empty stub. | 69 |
| `editor.smoothTerrain(x, y, amount)` | Planned: smooth the terrain. Empty stub. | 65 |
| `editor.subtractMeshFromTerrain(x, y)` | Planned: subtract a mesh from the terrain. Empty stub. | 101 |
| `editor.translateFoliageSelection(delta)` | Planned: translate the foliage selection. Empty stub. | 189 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/terrain.lua`.*
