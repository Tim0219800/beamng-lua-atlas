# `editor_toolUtilities_gridCap`

*File: `lua/ge/extensions/editor/toolUtilities/gridCap.lua` · VM: Game Engine (GE) · 356 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_gridCap`: `extensions.load("editor_toolUtilities_gridCap")`, then the global `editor_toolUtilities_gridCap`

Builds a "cap" of triangles over an outline that must follow a height field: a square grid aligned with the grain of the outline, clipped to that outline. Each cell entirely inside the outline gives two triangles at the field's heights; only the cells crossed by the outline are clipped (polyBool), which avoids very long or sliver triangles. A Delaunay pass then improves the mesh.

## Notes

- build always returns the same reused 'mesh' table: { x, y, z (positions), tri (1-based indices, 3 per triangle), nv, nt }. It is only valid until the next build: copy if needed.
- Points are welded to a tenth of a millimeter (WELD = 1e4); clipped cells with holes are cached (20000 per generation, two generations kept).
- A ring point whose nodes carry a height (p.z) keeps the straight line between them; a ring without height takes that of the field.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_gridCap.build(rings, cf, zAt, cell)` | Builds the cap on the given rings (the outer outline, then its holes; open or closed) in world coordinates. Works in the grain frame where cells are square. Returns nil if no triangle is produced. | 206 |
| `editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell)` | Filters the rings that can touch a cell of the grid on which the cap of the 'outer' outline is laid (box in the grain frame, rounded to the grid, plus a small margin). The others do not change the result. | 330 |

### Parameter details

#### `editor_toolUtilities_gridCap.build(rings, cf, zAt, cell)`

Builds the cap on the given rings (the outer outline, then its holes; open or closed) in world coordinates. Works in the grain frame where cells are square. Returns nil if no triangle is produced.

- `rings` (*table[]*) : Rings of points {x, y, z?}: the outline then the holes.
- `cf` (*table*) : The grain: ax, ay (along), inX, inY (across).
- `zAt` (*function*) : Height field zAt(x, y) -> z, in world.
- `cell` (*number*) : Grid step (m).
- **returns**: table|nil The flat mesh { x, y, z, tri, nv, nt } or nil.

#### `editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell)`

Filters the rings that can touch a cell of the grid on which the cap of the 'outer' outline is laid (box in the grain frame, rounded to the grid, plus a small margin). The others do not change the result.

- `outer` (*table*) : Outer outline.
- `rings` (*table[]*) : Candidate rings.
- `cf` (*table*) : The grain (ax, ay, inX, inY).
- `cell` (*number*) : Grid step (m).
- **returns**: table[] Sublist of reachable rings.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/gridCap.lua`.*
