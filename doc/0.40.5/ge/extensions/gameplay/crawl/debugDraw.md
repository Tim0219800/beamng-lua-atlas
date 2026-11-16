# `gameplay_crawl_debugDraw`

*File: `lua/ge/extensions/gameplay/crawl/debugDraw.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_debugDraw`: `extensions.load("gameplay_crawl_debugDraw")`, then the global `gameplay_crawl_debugDraw`

Read-only debug visualization of crawl mode trails, via debugDrawer: waypoints (spheres, direction arrows, labels) and segments, boundary zone, start position. Shared by the crawl editor and the in-game dev overlay to keep a consistent rendering. To be called every render frame.

## Example

```lua
gameplay_crawl_debugDraw.drawPath(path.nodes, {maxDist = 200, showSegmentDistance = true})
```

## Notes

- Colors: normal node white, recovery point yellow, bonus purple, last node blue; green arrow; light blue segments.
- Nodes and segments beyond maxDist (400 m by default) from the camera are not drawn.
- A node's sphere radius is node.radius (4.0 m by default); that of the start position is transform.radius (10.0 m by default).
- This page exports no other functions; drawing does not modify any data.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode)` | Draws the boundary zone by calling boundary:drawDebug(drawMode) (camera culling is done by the zone). | 99 |
| `gameplay_crawl_debugDraw.drawPath(nodes, opts)` | Draws each node (sphere, arrow according to its rotation, label "index: name [REC]/[BONUS]") and the cylinders between consecutive nodes, optionally with the cumulative distance. | 53 |
| `gameplay_crawl_debugDraw.drawStartingPosition(startingPosition)` | Draws the start zone's sphere, a direction arrow and, if present, a small sphere at iconPosition. | 105 |

### Parameter details

#### `gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode)`

Draws the boundary zone by calling boundary:drawDebug(drawMode) (camera culling is done by the zone).

- `boundary` (*table|nil*) : Zone with the drawDebug method.
- `drawMode` (*any*) : Draw mode passed as is to drawDebug.

#### `gameplay_crawl_debugDraw.drawPath(nodes, opts)`

Draws each node (sphere, arrow according to its rotation, label "index: name [REC]/[BONUS]") and the cylinders between consecutive nodes, optionally with the cumulative distance.

- `nodes` (*table<integer, table>*) : Nodes: pos (vec3), radius, rotation (quat), name, flags (isRecoveryCheckpoint, isBonusCheckpoint).
- `opts` (*table|nil*) : {maxDist = number (m, 400 by default), showSegmentDistance = boolean, showLabels = boolean (true by default)}.

#### `gameplay_crawl_debugDraw.drawStartingPosition(startingPosition)`

Draws the start zone's sphere, a direction arrow and, if present, a small sphere at iconPosition.

- `startingPosition` (*table|nil*) : Start position: transform (position, rotation, radius) and iconPosition.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/debugDraw.lua`.*
