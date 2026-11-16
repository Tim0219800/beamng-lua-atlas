# `editor_toolUtilities_groundBounds`

*File: `lua/ge/extensions/editor/toolUtilities/groundBounds.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_groundBounds`: `extensions.load("editor_toolUtilities_groundBounds")`, then the global `editor_toolUtilities_groundBounds`

Answers the questions that any editor tool laying a surface on an outline drawn on the ground must ask: what is already there (roads, junctions, buildings, terrains of other tools), what remains of the outline once these obstacles are subtracted, and which sides are cut or flush. Also does the reverse: publishing what the tool occupies. Relies on groundClaims, networkState, polyBool and geom.

## Notes

- Constants: road margin 0.10 m, road setback for placed elements (standoff) 0.6 m, drawn side tolerance 0.05 m, flush joint tolerance 0.20 m.
- Obstacles are cropped to the outline's box (+1 m) and subtracted one by one by polyBool.difference, because two obstacles sharing the box edge would cancel out in a single subtraction.
- 'owner' is the name under which the tool publishes its own claims: they are not returned to it as obstacles.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_groundBounds.clip(ring, obs, owner, site)` | Subtracts the obstacles from the outline and returns the remaining pieces to process one by one. Each piece is { ring, holes, cut, flush }: cut[i] true if side i comes from a subtraction (road or building on the other side), flush[i] true if it touches a terrain already laid by another tool (open junction). | 122 |
| `editor_toolUtilities_groundBounds.largest(areas)` | Returns the largest piece (by absolute area), for a tool that lays only ONE thing on its outline. | 157 |
| `editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin)` | Lists what owner must not pave near this outline: road and junction surfaces (networkState.surfaces, with at least 0.10 m margin) and the claims of the other tools. Also returns a second list where roads are enlarged by 0.6 m, to place set-back elements there. | 40 |
| `editor_toolUtilities_groundBounds.pieceAt(areas, x, y)` | Indicates which piece a point falls on (inside the ring and outside its holes), or nil if it is on none. | 169 |
| `editor_toolUtilities_groundBounds.publish(owner, rings)` | Announces to the other terrain tools what this one occupies, without margin (groundClaims.publish with margin 0), so that two adjacent surfaces read as a single one. | 184 |
| `editor_toolUtilities_groundBounds.sig()` | Fingerprint of everything that, outside the outline, determines its shape (road network and claims), to rebuild when a road or building moves. Computed every frame without building a ring. | 189 |

### Parameter details

#### `editor_toolUtilities_groundBounds.clip(ring, obs, owner, site)`

Subtracts the obstacles from the outline and returns the remaining pieces to process one by one. Each piece is { ring, holes, cut, flush }: cut[i] true if side i comes from a subtraction (road or building on the other side), flush[i] true if it touches a terrain already laid by another tool (open junction).

- `ring` (*table*) : Outline (at least 3 points); otherwise returns {}.
- `obs` (*table[]|nil*) : Obstacles (result of obstacles); without an obstacle, a single piece equal to the outline.
- `owner` (*any*) : Owner to exclude.
- `site` (*any|nil*) : Ignored site label.
- **returns**: table[] List of pieces { ring, holes, cut, flush }.

#### `editor_toolUtilities_groundBounds.largest(areas)`

Returns the largest piece (by absolute area), for a tool that lays only ONE thing on its outline.

- `areas` (*table[]|nil*) : Pieces from clip.
- **returns**: table|nil The largest piece, or nil.

#### `editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin)`

Lists what owner must not pave near this outline: road and junction surfaces (networkState.surfaces, with at least 0.10 m margin) and the claims of the other tools. Also returns a second list where roads are enlarged by 0.6 m, to place set-back elements there.

- `ring` (*table*) : Site outline (points {x, y}).
- `owner` (*any*) : Name of the owner to exclude.
- `site` (*any|nil*) : Folder (label) of the site being edited: where a copy already exists, it is the outline and not an obstacle.
- `roadMargin` (*number|nil*) : Road margin greater than the default.
- **returns**: table[] Obstacle rings.
- **returns**: table[] Same obstacles, roads enlarged by 0.6 m.

#### `editor_toolUtilities_groundBounds.pieceAt(areas, x, y)`

Indicates which piece a point falls on (inside the ring and outside its holes), or nil if it is on none.

- `areas` (*table[]|nil*) : Pieces from clip.
- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- **returns**: integer|nil Index of the piece in areas, or nil.

#### `editor_toolUtilities_groundBounds.publish(owner, rings)`

Announces to the other terrain tools what this one occupies, without margin (groundClaims.publish with margin 0), so that two adjacent surfaces read as a single one.

- `owner` (*any*) : Owner name.
- `rings` (*table[]*) : Occupied rings.

#### `editor_toolUtilities_groundBounds.sig()`

Fingerprint of everything that, outside the outline, determines its shape (road network and claims), to rebuild when a road or building moves. Computed every frame without building a ring.

- **returns**: number networkState.sig() + groundClaims.sig() * 104729.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/groundBounds.lua`.*
