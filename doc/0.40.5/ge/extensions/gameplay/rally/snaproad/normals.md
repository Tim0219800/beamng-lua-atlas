# `gameplay_rally_snaproad_normals`

*File: `lua/ge/extensions/gameplay/rally/snaproad/normals.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_snaproad_normals`: `extensions.load("gameplay_rally_snaproad_normals")`, then the global `gameplay_rally_snaproad_normals`

Small normal computation utility for the points of a rally snaproad. From a point with prev/next links, it computes the "forward" normal vector using the available neighbors (rallyUtil.calculateForwardNormal).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_snaproad_normals.forwardNormalVec(point)` | Computes the point's forward normal. Uses prev→next if both exist, otherwise current→next, otherwise prev→current; returns nil if no neighbor exists. | 19 |
| `gameplay_rally_snaproad_normals.normalAlignPoints(point)` | Returns the triplet (previous point, current point, next point) of a point; returns nil, nil, nil if the point is nil. | 9 |

### Parameter details

#### `gameplay_rally_snaproad_normals.forwardNormalVec(point)`

Computes the point's forward normal. Uses prev→next if both exist, otherwise current→next, otherwise prev→current; returns nil if no neighbor exists.

- `point` (*table*) : Point with pos, prev and next
- **returns**: vec3|nil Normal vector built from the x, y, z of the result of rallyUtil.calculateForwardNormal

#### `gameplay_rally_snaproad_normals.normalAlignPoints(point)`

Returns the triplet (previous point, current point, next point) of a point; returns nil, nil, nil if the point is nil.

- `point` (*table|nil*) : Point with prev and next fields (and pos)
- **returns**: table|nil point.prev
- **returns**: table|nil the point itself
- **returns**: table|nil point.next

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/snaproad/normals.lua`.*
