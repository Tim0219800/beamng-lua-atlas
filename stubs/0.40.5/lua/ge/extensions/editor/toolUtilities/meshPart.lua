---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshPart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_meshPart` : `extensions.load("editor_toolUtilities_meshPart")`, puis la globale `editor_toolUtilities_meshPart`
---@class editor_toolUtilities_meshPart
editor_toolUtilities_meshPart = {}

--- ============================ 2D outlines ===================================
---  A closed ring of { x, y } pairs wound CCW, so an edge a->b has outward normal (dy, -dx) and an ear clip can trust its
---  own sign test. A kit lays its outline out in whatever order reads best where it is written and hands it through here.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:236
---@param poly any
function editor_toolUtilities_meshPart.ccwRing(poly) end

--- Build one ProceduralMesh named `name` from `parts`, in `folder`, replacing whatever was there under that name. A nil
---  name leaves it unnamed, for an owner that holds the mesh itself and clears it with its folder. Too many corners for one
---  mesh and it comes back as a SimGroup of several under that name instead; owners only test and delete what they get.
---  Nothing to collide with by default. Most of what is stamped this way is a floor the terrain has already been carved to
---  match, or a face on a piece that carries a hull of its own, and cooking a hull for it would only pay for the same surface
---  twice. Ask for `collide` where the mesh really is the only thing there -- a kerb standing over a carriageway that a car
---  is meant to feel. `decalSurface` marks it as a surface draped decals lie on.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:484
---@param folder any
---@param name any
---@param parts any
---@param collide any
---@param decalSurface any
function editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface) end

--- Emit one triangle p1->p2->p3 into `part`, front visible from the (rx,ry,rz) side (same winding contract as face4:
---  the geometric winding normal ends up pointing AWAY from ref, the stored shading normal toward it). For flat caps
---  (roofs / terraces) where a quad won't do.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:173
---@param part any
---@param p1 any
---@param p2 any
---@param p3 any
---@param rx any
---@param ry any
---@param rz any
---@param u1 any
---@param u2 any
---@param u3 any
function editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3) end

--- Emit one quad p1->p2->p3->p4 into `part`, front visible from the (rx,ry,rz) side. BeamNG's ProceduralMesh front
---  face has its GEOMETRIC winding normal pointing AWAY from the visible side, so wind the triangles with their face
---  normal opposite ref and store the shading normal toward ref.
---  Optional snx/sny/snz overrides the stored SHADING normal (winding still follows the real geometry): used to shade the
---  sloped end-flap tops with the flat slab-top normal so the chamfer blends in instead of reading as a lit facet.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:122
---@param part any
---@param p1 any
---@param p2 any
---@param p3 any
---@param p4 any
---@param rx any
---@param ry any
---@param rz any
---@param u1 any
---@param u2 any
---@param u3 any
---@param u4 any
---@param snx any
---@param sny any
---@param snz any
function editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz) end

--- Like face4, but with a distinct SHADING normal per corner (n1..n4 = {x,y,z}, toward the visible side), for smoothly
---  shading a bumpy surface from precomputed vertex normals -- instead of the single flat facet normal face4 stores, which
---  makes a displaced surface read as a patchwork of flat facets. Winding still follows the real geometry (ref side).
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:148
---@param part any
---@param p1 any
---@param p2 any
---@param p3 any
---@param p4 any
---@param rx any
---@param ry any
---@param rz any
---@param u1 any
---@param u2 any
---@param u3 any
---@param u4 any
---@param n1 any
---@param n2 any
---@param n3 any
---@param n4 any
function editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4) end

--- Triangles over shared corners, all flat: corner i at (x[i], y[i], z[i]) with uv (u[i], v[i]), `nv` of them, and `nt`
--- triangles whose corners are tri[3t-2..3t]. Each is wound and shaded exactly as face3 lays it, but a corner is stored
--- once however many triangles meet at it.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:195
---@param part any
---@param x any
---@param y any
---@param z any
---@param u any
---@param v any
---@param nv any
---@param tri any
---@param nt any
---@param rx any
---@param ry any
---@param rz any
function editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz) end

---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:459
---@param o any
function editor_toolUtilities_meshPart.isDecalSurface(o) end

--- A surface draped decals lie on: a deck, a slab, a tunnel floor, a paved square. Decals clip to static shapes but not to
---  forest items, so whatever hands a tool's meshes over to a level keeps these as TSStatics. Saved with the object.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:455
---@param o any
function editor_toolUtilities_meshPart.markDecalSurface(o) end

---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:34
---@param pool any
function editor_toolUtilities_meshPart.newPart(pool) end

--- Parts that are emitted and dropped, made again and again: `newPart(pool)` hands out the pool's parts in turn, refilling
--- the tables the last round left. Only for parts that are done with by the next `poolReset`. The engine copies a mesh's
--- data as it is created, so a part that has been through emitObject is done with.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:26
function editor_toolUtilities_meshPart.newPool() end

--- The middle of a part list's extent. A shape is written around this and its static placed at it: written around the world
---  origin instead, it loses precision the further out the map it stands.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:356
---@param parts any
function editor_toolUtilities_meshPart.partsCentre(parts) end

---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:449
---@param id any
function editor_toolUtilities_meshPart.partsOf(id) end

--- The triangles in a part list. The face list holds one entry per CORNER, three to a triangle, so what a bake actually
---  wrote can be reported rather than guessed at.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:348
---@param parts any
function editor_toolUtilities_meshPart.partsTris(parts) end

---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:30
---@param pool any
function editor_toolUtilities_meshPart.poolReset(pool) end

--- The plan of a square post of half-width `d` about (cx, cy), its vertical arrises taken off by `cham`. Wound CCW, so an
---  edge's outward normal is (dy, -dx). Under a tenth of a millimetre it is the plain square, so one call site covers a
---  chamfered die and the crisp square work over it.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:290
---@param d any
---@param cx any
---@param cy any
---@param cham any
function editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham) end

--- One stage of a dressed post -- a pier's die, a newel's cap -- as that plan extruded z0..z1, every face out and both
---  ends closed. UVs in metres scaled by `uv`: U round the plan and V up the stage, so the stone matches the wall the post
---  stands in. The masonry kits stack these to build a pier or a newel out of its mouldings, which is why this lives here
---  rather than in one of them: wallKit already depends on propKit, so neither can hold it for the other.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:302
---@param part any
---@param d any
---@param cx any
---@param cy any
---@param z0 any
---@param z1 any
---@param cham any
---@param uv any
function editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv) end

--- A quad that may really be a TRIANGLE, one corner having run into its neighbour: a moulding step springing off the
---  face behind it, a spandrel closing on the head it reaches, an arc facet meeting its own crown. Left a quad, half of
---  it is a triangle of no area -- three more indices that draw nothing.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:223
---@param part any
---@param p1 any
---@param p2 any
---@param p3 any
---@param p4 any
---@param rx any
---@param ry any
---@param rz any
---@param u1 any
---@param u2 any
---@param u3 any
---@param u4 any
function editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4) end

--- Rescale a built part list's UVs in place. Lets a kit lay its UVs out in plain metres, which is the only way to keep a
---  swept or lathed piece readable, then convert the lot to the kit's tiling in one place at bake time.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:329
---@param parts any
---@param s any
function editor_toolUtilities_meshPart.scaleUVs(parts, s) end

--- Tint every part in a list wearing material `m`.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:338
---@param parts any
---@param m any
---@param tint any
function editor_toolUtilities_meshPart.tintParts(parts, m, tint) end

--- Ear clipping over a CCW ring, as index triples into it.
---Source : lua/ge/extensions/editor/toolUtilities/meshPart.lua:253
---@param poly any
function editor_toolUtilities_meshPart.triangulate(poly) end

