---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshPart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic assembly of mesh "parts" for baked kit pieces (bridgeKit, islandKit, etc.). A part is { verts, normals, uvs, faces } where each entry of faces is { v, n, u } with 0-based indices, the format consumed by both ProceduralMesh and the DAE export. All kit geometry goes through here to share a single winding convention. Also provides ear clipping triangulation, chamfered posts and emitObject, which creates the ProceduralMesh in the scene.
--- Access: extension `editor_toolUtilities_meshPart`: `extensions.load("editor_toolUtilities_meshPart")`, then the global `editor_toolUtilities_meshPart`
---@class editor_toolUtilities_meshPart
editor_toolUtilities_meshPart = {}

--- Returns the closed ring of {x, y} pairs wound counter-clockwise (the outward normal of an edge a->b is (dy, -dx)). If the ring is already counter-clockwise, it is returned as is; otherwise a reversed copy.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:236
---@param poly number[][] Ring of {x, y} points (indexed [1] and [2]).
---@return number[][]  Counter-clockwise ring.
function editor_toolUtilities_meshPart.ccwRing(poly) end

--- Builds a ProceduralMesh named name from parts, in folder, replacing any object of the same name (which survives a Lua-only reload). A nil name leaves the mesh unnamed. Beyond 60000 corners, returns a SimGroup of several meshes under that name instead. Without collision by default.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:484
---@param folder userdata Parent SimGroup; nil = returns nil.
---@param name string|nil Scene object name.
---@param parts table[] List of parts; empty = nil.
---@param collide boolean|nil Bake a collision (where the mesh is the only surface, for example a curb the car must feel).
---@param decalSurface boolean|nil Marks the mesh as a surface onto which decals apply.
---@return userdata|nil  Created ProceduralMesh or SimGroup.
function editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface) end

--- Emits a triangle p1 -> p2 -> p3 with the same winding contract as face4. For flat caps (roofs, terraces) where a quad does not fit.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:173
---@param part table Target part.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param rx number Visible side x.
---@param ry number Visible side y.
---@param rz number Visible side z.
---@param u1 number[] UV corner 1.
---@param u2 number[] UV corner 2.
---@param u3 number[] UV corner 3.
function editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3) end

--- Emits a quad p1 -> p2 -> p3 -> p4 into the part, with the front face visible on the side of the vector (rx, ry, rz). The shading normal is the face's (toward the visible side), unless snx/sny/snz is provided (the winding always follows the geometry).
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:122
---@param part table Target part.
---@param p1 table Point {x, y, z}.
---@param p2 table Point {x, y, z}.
---@param p3 table Point {x, y, z}.
---@param p4 table Point {x, y, z}.
---@param rx number Visible side, x component.
---@param ry number Visible side, y component.
---@param rz number Visible side, z component.
---@param u1 number[] UV {u, v} of corner 1.
---@param u2 number[] UV of corner 2.
---@param u3 number[] UV of corner 3.
---@param u4 number[] UV of corner 4.
---@param snx number|nil Imposed shading normal, x.
---@param sny number|nil Imposed shading normal, y.
---@param snz number|nil Imposed shading normal, z.
function editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz) end

--- Like face4 but with one shading normal per corner (n1..n4 = {x, y, z}), to smoothly shade a bumpy surface from precomputed vertex normals instead of a single facet normal.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:148
---@param part table Target part.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param p4 table Point.
---@param rx number Visible side x.
---@param ry number Visible side y.
---@param rz number Visible side z.
---@param u1 number[] UV corner 1.
---@param u2 number[] UV corner 2.
---@param u3 number[] UV corner 3.
---@param u4 number[] UV corner 4.
---@param n1 table Normal of corner 1 {x, y, z}, toward the visible side.
---@param n2 table Normal of corner 2.
---@param n3 table Normal of corner 3.
---@param n4 table Normal of corner 4.
function editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4) end

--- Emits triangles on shared corners, all flat-shaded: corner i at (x[i], y[i], z[i]) with uv (u[i], v[i]), nv corners and nt triangles whose corners are tri[3t-2..3t] (1-based indices). Each triangle is wound like face3, but a corner is stored only once.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:195
---@param part table Target part.
---@param x number[] X of the corners.
---@param y number[] Y of the corners.
---@param z number[] Z of the corners.
---@param u number[] U of the corners.
---@param v number[] V of the corners.
---@param nv integer Number of corners.
---@param tri integer[] Triangle indices, 3 per triangle, 1-based.
---@param nt integer Number of triangles.
---@param rx number Visible side x.
---@param ry number Visible side y.
---@param rz number Visible side z.
function editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz) end

--- Tells whether an object is marked as a decal surface.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:459
---@param o userdata Scene object.
---@return boolean  true if decalSurface equals '1'.
function editor_toolUtilities_meshPart.isDecalSurface(o) end

--- Marks an object as a decal-draped surface (deck, slab, tunnel floor, paved square) by setting decalSurface = '1' (saved with the object). Decals project onto static shapes but not onto Forest items: these objects therefore stay TSStatics.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:455
---@param o userdata Scene object.
function editor_toolUtilities_meshPart.markDecalSurface(o) end

--- Returns an empty part { verts, normals, uvs, faces }. With a pool, reuses the next part of the pool, emptying its tables (the inner entries are kept to avoid allocations).
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:34
---@param pool table|nil Optional pool.
---@return table  Part.
function editor_toolUtilities_meshPart.newPart(pool) end

--- Creates a pool of reusable parts, for parts emitted then discarded again and again. The engine copies the mesh data on creation: a part passed through emitObject no longer needs to be kept.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:26
---@return table  Pool { n = 0 }.
function editor_toolUtilities_meshPart.newPool() end

--- Center of the extent of a list of parts. A shape is written around this point and its static object is placed there: written around the world origin, it would lose precision far out on the map. Returns 0, 0, 0 if the list is empty.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:356
---@param parts table[]|nil List of parts.
---@return number  x of the center.
---@return number  y of the center.
---@return number  z of the center.
function editor_toolUtilities_meshPart.partsCentre(parts) end

--- Returns the parts from which a live mesh was built (by id), so it can later be exported as a shape. Nil for a mesh made from pool parts. The table is purged of vanished meshes every 2000 records.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:449
---@param id integer Id of the mesh object.
---@return table[]|nil  List of parts.
function editor_toolUtilities_meshPart.partsOf(id) end

--- Number of triangles in a list of parts (faces entries divided by 3), to report what a bake actually wrote.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:348
---@param parts table[]|nil List of parts.
---@return integer  Number of triangles.
function editor_toolUtilities_meshPart.partsTris(parts) end

--- Resets the pool counter to zero: the parts handed out again by newPart(pool) will be filled anew.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:30
---@param pool table Pool from newPool.
function editor_toolUtilities_meshPart.poolReset(pool) end

--- Outline of a square post of half-width d centered at (cx, cy), vertical edges chamfered by cham (counter-clockwise). Below 0.1 mm of chamfer, it is the plain square (4 points); otherwise an octagon (8 points).
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:290
---@param d number Half-width (m).
---@param cx number Center x.
---@param cy number Center y.
---@param cham number Chamfer (m).
---@return number[][]  Ring of {x, y} points.
function editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham) end

--- One dressed post stage (pier die, post cap): the postPlan outline extruded from z0 to z1, all faces facing outward and both ends closed. UV in meters multiplied by uv (U around the outline, V along the height).
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:302
---@param part table Target part.
---@param d number Half-width (m).
---@param cx number Center x.
---@param cy number Center y.
---@param z0 number Bottom elevation.
---@param z1 number Top elevation.
---@param cham number|nil Chamfer (default 0).
---@param uv number|nil UV scale factor (default 1).
function editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv) end

--- Emits a quad that may actually be a TRIANGLE (one corner coinciding with its neighbor within 1e-6): in that case calls face3 instead of wasting a zero-area triangle; otherwise calls face4.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:223
---@param part table Target part.
---@param p1 table Point.
---@param p2 table Point.
---@param p3 table Point.
---@param p4 table Point.
---@param rx number Visible side x.
---@param ry number Visible side y.
---@param rz number Visible side z.
---@param u1 number[] UV corner 1.
---@param u2 number[] UV corner 2.
---@param u3 number[] UV corner 3.
---@param u4 number[] UV corner 4.
function editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4) end

--- Scales in place the UVs of a list of parts: lets a kit lay out its UVs in meters and then convert to the kit's tiling at bake time.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:329
---@param parts table[] List of parts.
---@param s number Factor.
---@return table[]  The same parts list.
function editor_toolUtilities_meshPart.scaleUVs(parts, s) end

--- Applies a tint to each part of the list whose material field equals m. Without tint, does nothing.
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:338
---@param parts table[] List of parts.
---@param m string Material name.
---@param tint any|nil Tint to assign to part.tint.
---@return table[]  The parts list.
function editor_toolUtilities_meshPart.tintParts(parts, m, tint) end

--- Ear clipping triangulation of a counter-clockwise ring. Stops without finishing if no ear is found (degenerate or self-intersecting ring).
---Source: lua/ge/extensions/editor/toolUtilities/meshPart.lua:253
---@param poly number[][] Counter-clockwise ring of {x, y} points.
---@return integer[][]  Index triplets {i0, i1, i2} into poly.
function editor_toolUtilities_meshPart.triangulate(poly) end

