# `editor_toolUtilities_aabbPick`

*File: `lua/ge/extensions/editor/toolUtilities/aabbPick.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_aabbPick`: `extensions.load("editor_toolUtilities_aabbPick")`, then the global `editor_toolUtilities_aabbPick`

Ray picking utility against axis-aligned boxes (AABB), without allocation. Used by editor tools that need to pick a world object by its bounding box (e.g. placed building instances). Linear scan of the candidates.

## Example

```lua
local id, t = editor_toolUtilities_aabbPick.pickNearest(ox,oy,oz, dx,dy,dz, function(visit)
  for id, b in pairs(boxes) do visit(id, b.minx,b.miny,b.minz, b.maxx,b.maxy,b.maxz) end
end)
```

## Notes

- The ray direction does not need to be normalized; the distance t is then expressed in multiples of this direction.
- A ray starting inside the box returns 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider)` | Returns the id of the closest box (by entry distance) that the ray crosses. The provider provider(visit) must call visit(id, minx, miny, minz, maxx, maxy, maxz) once per candidate box. | 49 |
| `editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz)` | Ray/AABB test using the slab method. Returns the entry distance t along the ray (>= 0) if hit, otherwise nil. | 16 |

### Parameter details

#### `editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider)`

Returns the id of the closest box (by entry distance) that the ray crosses. The provider provider(visit) must call visit(id, minx, miny, minz, maxx, maxy, maxz) once per candidate box.

- `ox` (*number*) : Ray origin, x
- `oy` (*number*) : Ray origin, y
- `oz` (*number*) : Ray origin, z
- `dx` (*number*) : Direction, x
- `dy` (*number*) : Direction, y
- `dz` (*number*) : Direction, z
- `provider` (*function*) : function(visit) that enumerates the boxes via visit(id, minx, miny, minz, maxx, maxy, maxz).
- **returns**: any|nil Winning id, or nil if no box is hit.
- **returns**: number Entry distance of the winner (absent if nil).

#### `editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz)`

Ray/AABB test using the slab method. Returns the entry distance t along the ray (>= 0) if hit, otherwise nil.

- `ox` (*number*) : Ray origin, x
- `oy` (*number*) : Ray origin, y
- `oz` (*number*) : Ray origin, z
- `dx` (*number*) : Direction, x
- `dy` (*number*) : Direction, y
- `dz` (*number*) : Direction, z
- `minx` (*number*) : Min corner of the box, x
- `miny` (*number*) : Min corner of the box, y
- `minz` (*number*) : Min corner of the box, z
- `maxx` (*number*) : Max corner of the box, x
- `maxy` (*number*) : Max corner of the box, y
- `maxz` (*number*) : Max corner of the box, z
- **returns**: number|nil Entry distance, or nil if the ray misses the box or if it is behind it.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/aabbPick.lua`.*
