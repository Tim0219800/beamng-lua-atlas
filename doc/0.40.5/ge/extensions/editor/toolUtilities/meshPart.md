# `editor_toolUtilities_meshPart`

*File: `lua/ge/extensions/editor/toolUtilities/meshPart.lua` · VM: Game Engine (GE) · 524 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_meshPart`: `extensions.load("editor_toolUtilities_meshPart")`, then the global `editor_toolUtilities_meshPart`

Generic assembly of mesh "parts" for baked kit pieces (bridgeKit, islandKit, etc.). A part is { verts, normals, uvs, faces } where each entry of faces is { v, n, u } with 0-based indices, the format consumed by both ProceduralMesh and the DAE export. All kit geometry goes through here to share a single winding convention. Also provides ear clipping triangulation, chamfered posts and emitObject, which creates the ProceduralMesh in the scene.

## Example

```lua
local mp = require('editor/toolUtilities/meshPart')
local part = mp.newPart()
mp.face4(part, p1, p2, p3, p4, 0, 0, 1, {0,0}, {1,0}, {1,1}, {0,1}) -- face visible on the +Z side
mp.emitObject(folder, 'ma_dalle', {part}, false)
```

## Notes

- Winding: the front face of a ProceduralMesh has its geometric winding normal pointing AWAY from the visible side; the stored shading normal points toward the visible side. The face* functions take a reference point (rx, ry, rz) = direction of the visible side and flip the winding if needed. Do not assemble faces by hand with the opposite convention (daeExport flips the winding only once).
- The faces entries hold one record per triangle CORNER (three per triangle); face4 writes 6 corners, face3 writes 3.
- Engine limit: ProceduralMesh fills a 16-bit index buffer with a 16-bit counter; beyond 65535 corners in a mesh, the counter overflows and the game freezes. emitObject therefore cuts at 60000 corners per mesh and then returns a SimGroup of several meshes.
- The created meshes have canSave = false. Without collide, collisionType is 'None'. Parts coming from a pool are not kept for partsOf (they are reused).
- UV: {u, v} lists; points are { x, y, z } tables.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_meshPart.ccwRing(poly)` | Returns the closed ring of {x, y} pairs wound counter-clockwise (the outward normal of an edge a->b is (dy, -dx)). If the ring is already counter-clockwise, it is returned as is; otherwise a reversed copy. | 236 |
| `editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface)` | Builds a ProceduralMesh named name from parts, in folder, replacing any object of the same name (which survives a Lua-only reload). A nil name leaves the mesh unnamed. Beyond 60000 corners, returns a SimGroup of several meshes under that name instead. Without collision by default. | 484 |
| `editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3)` | Emits a triangle p1 -> p2 -> p3 with the same winding contract as face4. For flat caps (roofs, terraces) where a quad does not fit. | 173 |
| `editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz)` | Emits a quad p1 -> p2 -> p3 -> p4 into the part, with the front face visible on the side of the vector (rx, ry, rz). The shading normal is the face's (toward the visible side), unless snx/sny/snz is provided (the winding always follows the geometry). | 122 |
| `editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4)` | Like face4 but with one shading normal per corner (n1..n4 = {x, y, z}), to smoothly shade a bumpy surface from precomputed vertex normals instead of a single facet normal. | 148 |
| `editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz)` | Emits triangles on shared corners, all flat-shaded: corner i at (x[i], y[i], z[i]) with uv (u[i], v[i]), nv corners and nt triangles whose corners are tri[3t-2..3t] (1-based indices). Each triangle is wound like face3, but a corner is stored only once. | 195 |
| `editor_toolUtilities_meshPart.isDecalSurface(o)` | Tells whether an object is marked as a decal surface. | 459 |
| `editor_toolUtilities_meshPart.markDecalSurface(o)` | Marks an object as a decal-draped surface (deck, slab, tunnel floor, paved square) by setting decalSurface = '1' (saved with the object). Decals project onto static shapes but not onto Forest items: these objects therefore stay TSStatics. | 455 |
| `editor_toolUtilities_meshPart.newPart(pool)` | Returns an empty part { verts, normals, uvs, faces }. With a pool, reuses the next part of the pool, emptying its tables (the inner entries are kept to avoid allocations). | 34 |
| `editor_toolUtilities_meshPart.newPool()` | Creates a pool of reusable parts, for parts emitted then discarded again and again. The engine copies the mesh data on creation: a part passed through emitObject no longer needs to be kept. | 26 |
| `editor_toolUtilities_meshPart.partsCentre(parts)` | Center of the extent of a list of parts. A shape is written around this point and its static object is placed there: written around the world origin, it would lose precision far out on the map. Returns 0, 0, 0 if the list is empty. | 356 |
| `editor_toolUtilities_meshPart.partsOf(id)` | Returns the parts from which a live mesh was built (by id), so it can later be exported as a shape. Nil for a mesh made from pool parts. The table is purged of vanished meshes every 2000 records. | 449 |
| `editor_toolUtilities_meshPart.partsTris(parts)` | Number of triangles in a list of parts (faces entries divided by 3), to report what a bake actually wrote. | 348 |
| `editor_toolUtilities_meshPart.poolReset(pool)` | Resets the pool counter to zero: the parts handed out again by newPart(pool) will be filled anew. | 30 |
| `editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham)` | Outline of a square post of half-width d centered at (cx, cy), vertical edges chamfered by cham (counter-clockwise). Below 0.1 mm of chamfer, it is the plain square (4 points); otherwise an octagon (8 points). | 290 |
| `editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv)` | One dressed post stage (pier die, post cap): the postPlan outline extruded from z0 to z1, all faces facing outward and both ends closed. UV in meters multiplied by uv (U around the outline, V along the height). | 302 |
| `editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4)` | Emits a quad that may actually be a TRIANGLE (one corner coinciding with its neighbor within 1e-6): in that case calls face3 instead of wasting a zero-area triangle; otherwise calls face4. | 223 |
| `editor_toolUtilities_meshPart.scaleUVs(parts, s)` | Scales in place the UVs of a list of parts: lets a kit lay out its UVs in meters and then convert to the kit's tiling at bake time. | 329 |
| `editor_toolUtilities_meshPart.tintParts(parts, m, tint)` | Applies a tint to each part of the list whose material field equals m. Without tint, does nothing. | 338 |
| `editor_toolUtilities_meshPart.triangulate(poly)` | Ear clipping triangulation of a counter-clockwise ring. Stops without finishing if no ear is found (degenerate or self-intersecting ring). | 253 |

### Parameter details

#### `editor_toolUtilities_meshPart.ccwRing(poly)`

Returns the closed ring of {x, y} pairs wound counter-clockwise (the outward normal of an edge a->b is (dy, -dx)). If the ring is already counter-clockwise, it is returned as is; otherwise a reversed copy.

- `poly` (*number[][]*) : Ring of {x, y} points (indexed [1] and [2]).
- **returns**: number[][] Counter-clockwise ring.

#### `editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface)`

Builds a ProceduralMesh named name from parts, in folder, replacing any object of the same name (which survives a Lua-only reload). A nil name leaves the mesh unnamed. Beyond 60000 corners, returns a SimGroup of several meshes under that name instead. Without collision by default.

- `folder` (*userdata*) : Parent SimGroup; nil = returns nil.
- `name` (*string|nil*) : Scene object name.
- `parts` (*table[]*) : List of parts; empty = nil.
- `collide` (*boolean|nil*) : Bake a collision (where the mesh is the only surface, for example a curb the car must feel).
- `decalSurface` (*boolean|nil*) : Marks the mesh as a surface onto which decals apply.
- **returns**: userdata|nil Created ProceduralMesh or SimGroup.

#### `editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3)`

Emits a triangle p1 -> p2 -> p3 with the same winding contract as face4. For flat caps (roofs, terraces) where a quad does not fit.

- `part` (*table*) : Target part.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `rx` (*number*) : Visible side x.
- `ry` (*number*) : Visible side y.
- `rz` (*number*) : Visible side z.
- `u1` (*number[]*) : UV corner 1.
- `u2` (*number[]*) : UV corner 2.
- `u3` (*number[]*) : UV corner 3.

#### `editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz)`

Emits a quad p1 -> p2 -> p3 -> p4 into the part, with the front face visible on the side of the vector (rx, ry, rz). The shading normal is the face's (toward the visible side), unless snx/sny/snz is provided (the winding always follows the geometry).

- `part` (*table*) : Target part.
- `p1` (*table*) : Point {x, y, z}.
- `p2` (*table*) : Point {x, y, z}.
- `p3` (*table*) : Point {x, y, z}.
- `p4` (*table*) : Point {x, y, z}.
- `rx` (*number*) : Visible side, x component.
- `ry` (*number*) : Visible side, y component.
- `rz` (*number*) : Visible side, z component.
- `u1` (*number[]*) : UV {u, v} of corner 1.
- `u2` (*number[]*) : UV of corner 2.
- `u3` (*number[]*) : UV of corner 3.
- `u4` (*number[]*) : UV of corner 4.
- `snx` (*number|nil*) : Imposed shading normal, x.
- `sny` (*number|nil*) : Imposed shading normal, y.
- `snz` (*number|nil*) : Imposed shading normal, z.

#### `editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4)`

Like face4 but with one shading normal per corner (n1..n4 = {x, y, z}), to smoothly shade a bumpy surface from precomputed vertex normals instead of a single facet normal.

- `part` (*table*) : Target part.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `p4` (*table*) : Point.
- `rx` (*number*) : Visible side x.
- `ry` (*number*) : Visible side y.
- `rz` (*number*) : Visible side z.
- `u1` (*number[]*) : UV corner 1.
- `u2` (*number[]*) : UV corner 2.
- `u3` (*number[]*) : UV corner 3.
- `u4` (*number[]*) : UV corner 4.
- `n1` (*table*) : Normal of corner 1 {x, y, z}, toward the visible side.
- `n2` (*table*) : Normal of corner 2.
- `n3` (*table*) : Normal of corner 3.
- `n4` (*table*) : Normal of corner 4.

#### `editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz)`

Emits triangles on shared corners, all flat-shaded: corner i at (x[i], y[i], z[i]) with uv (u[i], v[i]), nv corners and nt triangles whose corners are tri[3t-2..3t] (1-based indices). Each triangle is wound like face3, but a corner is stored only once.

- `part` (*table*) : Target part.
- `x` (*number[]*) : X of the corners.
- `y` (*number[]*) : Y of the corners.
- `z` (*number[]*) : Z of the corners.
- `u` (*number[]*) : U of the corners.
- `v` (*number[]*) : V of the corners.
- `nv` (*integer*) : Number of corners.
- `tri` (*integer[]*) : Triangle indices, 3 per triangle, 1-based.
- `nt` (*integer*) : Number of triangles.
- `rx` (*number*) : Visible side x.
- `ry` (*number*) : Visible side y.
- `rz` (*number*) : Visible side z.

#### `editor_toolUtilities_meshPart.isDecalSurface(o)`

Tells whether an object is marked as a decal surface.

- `o` (*userdata*) : Scene object.
- **returns**: boolean true if decalSurface equals '1'.

#### `editor_toolUtilities_meshPart.markDecalSurface(o)`

Marks an object as a decal-draped surface (deck, slab, tunnel floor, paved square) by setting decalSurface = '1' (saved with the object). Decals project onto static shapes but not onto Forest items: these objects therefore stay TSStatics.

- `o` (*userdata*) : Scene object.

#### `editor_toolUtilities_meshPart.newPart(pool)`

Returns an empty part { verts, normals, uvs, faces }. With a pool, reuses the next part of the pool, emptying its tables (the inner entries are kept to avoid allocations).

- `pool` (*table|nil*) : Optional pool.
- **returns**: table Part.

#### `editor_toolUtilities_meshPart.newPool()`

Creates a pool of reusable parts, for parts emitted then discarded again and again. The engine copies the mesh data on creation: a part passed through emitObject no longer needs to be kept.

- **returns**: table Pool { n = 0 }.

#### `editor_toolUtilities_meshPart.partsCentre(parts)`

Center of the extent of a list of parts. A shape is written around this point and its static object is placed there: written around the world origin, it would lose precision far out on the map. Returns 0, 0, 0 if the list is empty.

- `parts` (*table[]|nil*) : List of parts.
- **returns**: number x of the center.
- **returns**: number y of the center.
- **returns**: number z of the center.

#### `editor_toolUtilities_meshPart.partsOf(id)`

Returns the parts from which a live mesh was built (by id), so it can later be exported as a shape. Nil for a mesh made from pool parts. The table is purged of vanished meshes every 2000 records.

- `id` (*integer*) : Id of the mesh object.
- **returns**: table[]|nil List of parts.

#### `editor_toolUtilities_meshPart.partsTris(parts)`

Number of triangles in a list of parts (faces entries divided by 3), to report what a bake actually wrote.

- `parts` (*table[]|nil*) : List of parts.
- **returns**: integer Number of triangles.

#### `editor_toolUtilities_meshPart.poolReset(pool)`

Resets the pool counter to zero: the parts handed out again by newPart(pool) will be filled anew.

- `pool` (*table*) : Pool from newPool.

#### `editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham)`

Outline of a square post of half-width d centered at (cx, cy), vertical edges chamfered by cham (counter-clockwise). Below 0.1 mm of chamfer, it is the plain square (4 points); otherwise an octagon (8 points).

- `d` (*number*) : Half-width (m).
- `cx` (*number*) : Center x.
- `cy` (*number*) : Center y.
- `cham` (*number*) : Chamfer (m).
- **returns**: number[][] Ring of {x, y} points.

#### `editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv)`

One dressed post stage (pier die, post cap): the postPlan outline extruded from z0 to z1, all faces facing outward and both ends closed. UV in meters multiplied by uv (U around the outline, V along the height).

- `part` (*table*) : Target part.
- `d` (*number*) : Half-width (m).
- `cx` (*number*) : Center x.
- `cy` (*number*) : Center y.
- `z0` (*number*) : Bottom elevation.
- `z1` (*number*) : Top elevation.
- `cham` (*number|nil*) : Chamfer (default 0).
- `uv` (*number|nil*) : UV scale factor (default 1).

#### `editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4)`

Emits a quad that may actually be a TRIANGLE (one corner coinciding with its neighbor within 1e-6): in that case calls face3 instead of wasting a zero-area triangle; otherwise calls face4.

- `part` (*table*) : Target part.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `p4` (*table*) : Point.
- `rx` (*number*) : Visible side x.
- `ry` (*number*) : Visible side y.
- `rz` (*number*) : Visible side z.
- `u1` (*number[]*) : UV corner 1.
- `u2` (*number[]*) : UV corner 2.
- `u3` (*number[]*) : UV corner 3.
- `u4` (*number[]*) : UV corner 4.

#### `editor_toolUtilities_meshPart.scaleUVs(parts, s)`

Scales in place the UVs of a list of parts: lets a kit lay out its UVs in meters and then convert to the kit's tiling at bake time.

- `parts` (*table[]*) : List of parts.
- `s` (*number*) : Factor.
- **returns**: table[] The same parts list.

#### `editor_toolUtilities_meshPart.tintParts(parts, m, tint)`

Applies a tint to each part of the list whose material field equals m. Without tint, does nothing.

- `parts` (*table[]*) : List of parts.
- `m` (*string*) : Material name.
- `tint` (*any|nil*) : Tint to assign to part.tint.
- **returns**: table[] The parts list.

#### `editor_toolUtilities_meshPart.triangulate(poly)`

Ear clipping triangulation of a counter-clockwise ring. Stops without finishing if no ear is found (degenerate or self-intersecting ring).

- `poly` (*number[][]*) : Counter-clockwise ring of {x, y} points.
- **returns**: integer[][] Index triplets {i0, i1, i2} into poly.

## Calls into the engine (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/meshPart.lua`.*
