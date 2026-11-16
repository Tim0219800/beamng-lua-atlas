# `editor_ezObjectSelect_subtools_fence_anchors`

*File: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua` · VM: Game Engine (GE) · 262 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_subtools_fence_anchors`: `extensions.load("editor_ezObjectSelect_subtools_fence_anchors")`, then the global `editor_ezObjectSelect_subtools_fence_anchors`

Automatic fence discovery in the Easy Object Select tool. From a starting TSStatic (whose mesh is in the list of allowed assets), it looks for neighboring TSStatics whose anchors (midpoints of the short sides of the box, via objectBoxAnchors) mutually match within options.distance, builds the connection graph, orders the pieces, detects a loop and computes the spline junction points. draw() draws these junctions with debugDrawer.

## Notes

- Only non-"global bounds" TSStatics whose shapeName (normalized: lowercase, /, no leading /) is in assetPaths are eligible.
- The match must be mutual: A's nearest anchor must have A as its nearest anchor.
- Discovery is capped at options.maximumPieces (2048 by default); result.capped is then true.
- A loop is detected when there are more than 2 pieces and the first and the last each have 2 neighbors.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options)` | Does a breadth-first walk over the fence pieces connected to the seed. Returns nil and a message if the starting object is not an eligible piece. | 184 |
| `editor_ezObjectSelect_subtools_fence_anchors.draw(result)` | Draws with debugDrawer:drawLine the polyline of the junctions (and the closing segment if loop) from the discover result. | 251 |

### Parameter details

#### `editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options)`

Does a breadth-first walk over the fence pieces connected to the seed. Returns nil and a message if the starting object is not an eligible piece.

- `seedObjectId` (*integer*) : ID of the starting TSStatic object.
- `options` (*table|nil*) : assetPaths (string[], allowed meshes), distance (m, default 0.5, min 0.001), maximumPieces (default 2048).
- **returns**: table|nil {ids (ordered), graph, descriptors, joints (vec3[]), isLoop, capped}.
- **returns**: string|nil Error message if nil.

#### `editor_ezObjectSelect_subtools_fence_anchors.draw(result)`

Draws with debugDrawer:drawLine the polyline of the junctions (and the closing segment if loop) from the discover result.

- `result` (*table|nil*) : Result of discover; does nothing if nil.

## Calls into the engine (C++)

- `Sim.` `upcast`
- `debugDrawer:` `drawLine`
- `obj:` `getClassName`, `getField`, `getID`, `isGlobalBounds`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua`.*
