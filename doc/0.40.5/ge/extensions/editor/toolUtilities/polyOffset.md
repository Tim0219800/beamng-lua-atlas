# `editor_toolUtilities_polyOffset`

*File: `lua/ge/extensions/editor/toolUtilities/polyOffset.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_polyOffset`: `extensions.load("editor_toolUtilities_polyOffset")`, then the global `editor_toolUtilities_polyOffset`

Lateral offset of a 2D polyline whose every edge carries an outward normal. Handles corners by miter join, bevel (chamfer) or line intersection, with a miter limit for sharp angles. run builds a closed ribbon between the line and its offset.

## Notes

- Works in 2D (x, y) only.
- nrm must contain one normal per edge (#nrm >= #pts - 1); nrm[i] is the normal of the edge between pts[i] and pts[i+1].
- A closed polyline (first and last points coincident, more than 3 points) has its seam handled as an ordinary corner.
- MITER_LIMIT = 4: a miter never exceeds 4 times the offset distance.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey)` | Intersection of two 2D lines P + t*D and Q + s*E. Returns nil if they are parallel (determinant < 1e-9). | 15 |
| `editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d)` | Offset point of a vertex between two edge normals: the miter, brought back along its bisector when the angle is too sharp (limit MITER_LIMIT * \|d\|). | 24 |
| `editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join)` | Offsets a polyline laterally by the signed distance d. The corner join type is chosen by join: 'chamfer' (two points), 'miter' (one point per vertex) or other/nil (intersection of the offset edges, falling back to two points if too far). | 37 |
| `editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap)` | Builds a closed ring going from the line to its offset: the base is sunk by overlap into the mass behind (opposite side), then the outer edge is traversed in reverse. | 75 |

### Parameter details

#### `editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey)`

Intersection of two 2D lines P + t*D and Q + s*E. Returns nil if they are parallel (determinant < 1e-9).

- `px` (*number*) : x of the point of the first line.
- `py` (*number*) : y of the point of the first line.
- `dx` (*number*) : x of the direction of the first line.
- `dy` (*number*) : y of the direction of the first line.
- `qx` (*number*) : x of the point of the second line.
- `qy` (*number*) : y of the point of the second line.
- `ex` (*number*) : x of the direction of the second line.
- `ey` (*number*) : y of the direction of the second line.
- **returns**: number|nil x of the intersection.
- **returns**: number|nil y of the intersection.

#### `editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d)`

Offset point of a vertex between two edge normals: the miter, brought back along its bisector when the angle is too sharp (limit MITER_LIMIT * |d|).

- `cx` (*number*) : x of the vertex.
- `cy` (*number*) : y of the vertex.
- `n1` (*table*) : Normal {x,y} of the incoming edge.
- `n2` (*table*) : Normal {x,y} of the outgoing edge.
- `d` (*number*) : Signed offset distance.
- **returns**: number x of the offset point.
- **returns**: number y of the offset point.

#### `editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join)`

Offsets a polyline laterally by the signed distance d. The corner join type is chosen by join: 'chamfer' (two points), 'miter' (one point per vertex) or other/nil (intersection of the offset edges, falling back to two points if too far).

- `pts` (*table*) : List of {x,y} points.
- `nrm` (*table*) : Unit {x,y} normals, one per edge.
- `d` (*number*) : Signed offset distance, in meters.
- `join` (*string|nil*) : 'chamfer', 'miter' or nil for the intersection join.
- **returns**: table List of offset {x,y} points.

#### `editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap)`

Builds a closed ring going from the line to its offset: the base is sunk by overlap into the mass behind (opposite side), then the outer edge is traversed in reverse.

- `pts` (*table*) : List of {x,y} points.
- `nrm` (*table*) : Normals per edge.
- `d` (*number*) : Signed offset distance.
- `join` (*string|nil*) : Join type, see polyline.
- `overlap` (*number|nil*) : Sinking of the base (default 0.05 m).
- **returns**: table|nil Ring of {x,y} points, or nil if fewer than 2 points or |d| < 1e-4.

## Fields

| Field | Type | Description |
|---|---|---|
| `MITER_LIMIT` | number | Maximum factor (4.0) of miter length relative to \|d\|. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/polyOffset.lua`.*
