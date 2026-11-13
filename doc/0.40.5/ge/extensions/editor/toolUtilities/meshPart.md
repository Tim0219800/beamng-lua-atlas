# `editor_toolUtilities_meshPart`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshPart.lua` · VM : Game Engine (GE) · 524 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshPart` : `extensions.load("editor_toolUtilities_meshPart")`, puis la globale `editor_toolUtilities_meshPart`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshPart.ccwRing(poly)` | ============================ 2D outlines ===================================<br> A closed ring of { x, y } pairs wound CCW, so an edge a->b has outward normal (dy, -dx) and an ear clip can trust its<br> own sign test. A kit lays its outline out in whatever order reads best where it is written and hands it through here. | 236 |
| `editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface)` | Build one ProceduralMesh named `name` from `parts`, in `folder`, replacing whatever was there under that name. A nil<br> name leaves it unnamed, for an owner that holds the mesh itself and clears it with its folder. Too many corners for one<br> mesh and it comes back as a SimGroup of several under that name instead; owners only test and delete what they get.<br> Nothing to collide with by default. Most of what is stamped this way is a floor the terrain has already been carved to<br> match, or a face on a piece that carries a hull of its own, and cooking a hull for it would only pay for the same surface<br> twice. Ask for `collide` where the mesh really is the only thing there -- a kerb standing over a carriageway that a car<br> is meant to feel. `decalSurface` marks it as a surface draped decals lie on. | 484 |
| `editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3)` | Emit one triangle p1->p2->p3 into `part`, front visible from the (rx,ry,rz) side (same winding contract as face4:<br> the geometric winding normal ends up pointing AWAY from ref, the stored shading normal toward it). For flat caps<br> (roofs / terraces) where a quad won't do. | 173 |
| `editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz)` | Emit one quad p1->p2->p3->p4 into `part`, front visible from the (rx,ry,rz) side. BeamNG's ProceduralMesh front<br> face has its GEOMETRIC winding normal pointing AWAY from the visible side, so wind the triangles with their face<br> normal opposite ref and store the shading normal toward ref.<br> Optional snx/sny/snz overrides the stored SHADING normal (winding still follows the real geometry): used to shade the<br> sloped end-flap tops with the flat slab-top normal so the chamfer blends in instead of reading as a lit facet. | 122 |
| `editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4)` | Like face4, but with a distinct SHADING normal per corner (n1..n4 = {x,y,z}, toward the visible side), for smoothly<br> shading a bumpy surface from precomputed vertex normals -- instead of the single flat facet normal face4 stores, which<br> makes a displaced surface read as a patchwork of flat facets. Winding still follows the real geometry (ref side). | 148 |
| `editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz)` | Triangles over shared corners, all flat: corner i at (x[i], y[i], z[i]) with uv (u[i], v[i]), `nv` of them, and `nt`<br>triangles whose corners are tri[3t-2..3t]. Each is wound and shaded exactly as face3 lays it, but a corner is stored<br>once however many triangles meet at it. | 195 |
| `editor_toolUtilities_meshPart.isDecalSurface(o)` |  | 459 |
| `editor_toolUtilities_meshPart.markDecalSurface(o)` | A surface draped decals lie on: a deck, a slab, a tunnel floor, a paved square. Decals clip to static shapes but not to<br> forest items, so whatever hands a tool's meshes over to a level keeps these as TSStatics. Saved with the object. | 455 |
| `editor_toolUtilities_meshPart.newPart(pool)` |  | 34 |
| `editor_toolUtilities_meshPart.newPool()` | Parts that are emitted and dropped, made again and again: `newPart(pool)` hands out the pool's parts in turn, refilling<br>the tables the last round left. Only for parts that are done with by the next `poolReset`. The engine copies a mesh's<br>data as it is created, so a part that has been through emitObject is done with. | 26 |
| `editor_toolUtilities_meshPart.partsCentre(parts)` | The middle of a part list's extent. A shape is written around this and its static placed at it: written around the world<br> origin instead, it loses precision the further out the map it stands. | 356 |
| `editor_toolUtilities_meshPart.partsOf(id)` |  | 449 |
| `editor_toolUtilities_meshPart.partsTris(parts)` | The triangles in a part list. The face list holds one entry per CORNER, three to a triangle, so what a bake actually<br> wrote can be reported rather than guessed at. | 348 |
| `editor_toolUtilities_meshPart.poolReset(pool)` |  | 30 |
| `editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham)` | The plan of a square post of half-width `d` about (cx, cy), its vertical arrises taken off by `cham`. Wound CCW, so an<br> edge's outward normal is (dy, -dx). Under a tenth of a millimetre it is the plain square, so one call site covers a<br> chamfered die and the crisp square work over it. | 290 |
| `editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv)` | One stage of a dressed post -- a pier's die, a newel's cap -- as that plan extruded z0..z1, every face out and both<br> ends closed. UVs in metres scaled by `uv`: U round the plan and V up the stage, so the stone matches the wall the post<br> stands in. The masonry kits stack these to build a pier or a newel out of its mouldings, which is why this lives here<br> rather than in one of them: wallKit already depends on propKit, so neither can hold it for the other. | 302 |
| `editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4)` | A quad that may really be a TRIANGLE, one corner having run into its neighbour: a moulding step springing off the<br> face behind it, a spandrel closing on the head it reaches, an arc facet meeting its own crown. Left a quad, half of<br> it is a triangle of no area -- three more indices that draw nothing. | 223 |
| `editor_toolUtilities_meshPart.scaleUVs(parts, s)` | Rescale a built part list's UVs in place. Lets a kit lay its UVs out in plain metres, which is the only way to keep a<br> swept or lathed piece readable, then convert the lot to the kit's tiling in one place at bake time. | 329 |
| `editor_toolUtilities_meshPart.tintParts(parts, m, tint)` | Tint every part in a list wearing material `m`. | 338 |
| `editor_toolUtilities_meshPart.triangulate(poly)` | Ear clipping over a CCW ring, as index triples into it. | 253 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshPart.lua`.*
