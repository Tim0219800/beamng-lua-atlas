# `editor_toolUtilities_edgeHandles`

*File: `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua` · VM: Game Engine (GE) · 148 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_edgeHandles`: `extensions.load("editor_toolUtilities_edgeHandles")`, then the global `editor_toolUtilities_edgeHandles`

Editor tool utility for "gate" handles that can be moved along the outline of a polygon (ring: list of {x,y} points). A gate is { edge, t, id }: edge index and position t (0..1) on that edge. Provides snapping to the outline, default gates (ends of the long axis), the geometry of a floating handle outside the edge and its drawing via debugDraw.

## Notes

- The ring is implicitly closed: edge i goes from point i to point (i % n) + 1.
- The center used (centroid) is the simple average of the vertices, not area-weighted.
- gateWorldDir returns 4 values (wx, wy, nx, ny), the normal pointing away from the ring center.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_edgeHandles.defaultGates(ring)` | Two default gates at opposite ends of the ring's long axis (entry, exit). | 99 |
| `editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered)` | Draws the handle (points from handleGeom): stem from the edge to the bar, bar with end points, central button that pulses on hover. | 127 |
| `editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate)` | World position of a gate and the outward unit normal of its edge (away from the ring center). | 84 |
| `editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn)` | Geometry of a gate's grabbable handle: the bar floats at outDist meters off the edge and extends halfWidth meters on each side. | 115 |
| `editor_toolUtilities_edgeHandles.nearestGate(ring, px, py)` | Snaps a world point (px,py) to the nearest gate on the outline. | 68 |
| `editor_toolUtilities_edgeHandles.tagGates(gates)` | Gives a unique id (Engine.generateUUID) to each gate that has none, then returns the list. A gate is otherwise identified only by its position in the list, which changes when a previous gate is removed. | 60 |

### Parameter details

#### `editor_toolUtilities_edgeHandles.defaultGates(ring)`

Two default gates at opposite ends of the ring's long axis (entry, exit).

- `ring` (*table*) : List of points {x,y}
- **returns**: table Entry gate { edge, t }
- **returns**: table Exit gate { edge, t }

#### `editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered)`

Draws the handle (points from handleGeom): stem from the edge to the bar, bar with end points, central button that pulses on hover.

- `gp` (*vec3*) : Point on the edge
- `cp` (*vec3*) : Center of the bar
- `e1` (*vec3*) : End 1
- `e2` (*vec3*) : End 2
- `base` (*integer*) : Base color (packed)
- `glow` (*integer*) : Halo color (packed)
- `hovered` (*boolean*) : true if hovered

#### `editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate)`

World position of a gate and the outward unit normal of its edge (away from the ring center).

- `ring` (*table*) : List of points {x,y}
- `gate` (*table*) : { edge, t }
- **returns**: number wx
- **returns**: number wy
- **returns**: number nx (outward normal)
- **returns**: number ny (outward normal)

#### `editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn)`

Geometry of a gate's grabbable handle: the bar floats at outDist meters off the edge and extends halfWidth meters on each side.

- `ring` (*table*) : List of points {x,y}
- `gate` (*table|nil*) : { edge, t }
- `outDist` (*number*) : Distance of the bar from the edge (m)
- `halfWidth` (*number*) : Half-width of the bar (m)
- `liftFn` (*function|nil*) : function(x,y) -> vec3 that places a point on the terrain; z=0 plane by default.
- **returns**: vec3|nil Point on the edge
- **returns**: vec3 Center of the bar (grab button)
- **returns**: vec3 End 1 of the bar
- **returns**: vec3 End 2 of the bar

#### `editor_toolUtilities_edgeHandles.nearestGate(ring, px, py)`

Snaps a world point (px,py) to the nearest gate on the outline.

- `ring` (*table*) : List of points {x=,y=}
- `px` (*number*) : world x
- `py` (*number*) : world y
- **returns**: table { edge = edge index, t = position 0..1 }

#### `editor_toolUtilities_edgeHandles.tagGates(gates)`

Gives a unique id (Engine.generateUUID) to each gate that has none, then returns the list. A gate is otherwise identified only by its position in the list, which changes when a previous gate is removed.

- `gates` (*table|nil*) : List of gates { edge, t, id? }
- **returns**: table|nil The same list, with named gates.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua`.*
