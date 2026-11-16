# `core_terrain`

*File: `lua/ge/extensions/core/terrain.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_terrain`: `extensions.load("core_terrain")`, then the global `core_terrain`

Simplified access to the first TerrainBlock of the scene: terrain height and normal at a point. A modder uses it to place objects on the ground or orient an element along the slope. The block found is cached by its id.

## Example

```lua
local z = core_terrain.getTerrainHeight(vec3(x, y, 0))
local n = core_terrain.getTerrainNormal(vec3(x, y, 0))
```

## Notes

- All functions return nil if there is no TerrainBlock in the scene.
- Only the first TerrainBlock found is used.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_terrain.getTerrain()` | Returns the TerrainBlock object (cached by id, otherwise the first result of scenetree.findClassObjects("TerrainBlock")). | 9 |
| `core_terrain.getTerrainHeight(point)` | Returns the terrain height at the given point (terrain:getHeight). | 21 |
| `core_terrain.getTerrainNormal(point)` | Returns the terrain normal at the point (terrain:getNormal(point, true, true)). | 28 |
| `core_terrain.getTerrainSmoothNormal(point)` | Returns the smoothed terrain normal at the point (terrain:getSmoothNormal(point, true, true)). | 35 |

### Parameter details

#### `core_terrain.getTerrain()`

Returns the TerrainBlock object (cached by id, otherwise the first result of scenetree.findClassObjects("TerrainBlock")).

- **returns**: userdata|nil TerrainBlock object or nil.

#### `core_terrain.getTerrainHeight(point)`

Returns the terrain height at the given point (terrain:getHeight).

- `point` (*vec3*) : World position; only x and y matter (inferred from code).
- **returns**: number|nil Altitude, nil without terrain.

#### `core_terrain.getTerrainNormal(point)`

Returns the terrain normal at the point (terrain:getNormal(point, true, true)).

- `point` (*vec3*) : World position.
- **returns**: vec3|nil Normal, nil without terrain.

#### `core_terrain.getTerrainSmoothNormal(point)`

Returns the smoothed terrain normal at the point (terrain:getSmoothNormal(point, true, true)).

- `point` (*vec3*) : World position.
- **returns**: vec3|nil Smoothed normal, nil without terrain.

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/terrain.lua`.*
