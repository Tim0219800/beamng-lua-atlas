# `gameplay_rally_notebook_focusedNearDraw`

*File: `lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua` · VM: Game Engine (GE) · 356 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_focusedNearDraw`: `extensions.load("gameplay_rally_notebook_focusedNearDraw")`, then the global `gameplay_rally_notebook_focusedNearDraw`

Debug drawing of the rally note (pacenotes) editor: when the camera is close to the notes, only draws the portion of the road (snaproad) and the notes near the point the camera is aimed at. The aimed point (pivot) is the snaproad position closest to the camera ray. The road prisms are progressively shrunk toward the minimum window (nearbyCount notes on each side) as the camera gets closer. Used by the editor's pacenotes tool.

## Example

```lua
local ctx = gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, state, 650, 3)
if ctx then gameplay_rally_notebook_focusedNearDraw.draw(ctx, path, snaproad, state, 1, 1.945, false) end
```

## Notes

- buildContext returns nil when the camera is farther than 2/3 of maxDistance from the notes (fullDrawDistanceRatio): the caller must then draw differently (overview).
- buildContext writes pacenoteToolsState._pacenoteLabelRaycastCursorPos (pivot position) and getCameraLookSnaproadLocation caches in pacenoteToolsState._pacenoteLabelRaycastLocationCache (key: snaproad, camera position and direction).
- The prisms have a height of 0.5 m and a default width of 1.945 m; the color comes from util/colors (snaproads_clr_recce, snaproads_alpha).
- The path, snaproad parameters of draw are only there for the signature: draw uses context and snaproad for the prisms, context and pacenoteToolsState for the notes.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount)` | Prepares the drawing context: note entries (start/end distances along the route), pivot, window [startDistance, endDistance] of the route to draw. The window goes from the minimum window (neighboring notes) to the whole route depending on the camera distance. | 253 |
| `gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop)` | Draws the road prisms of the context window, then each note whose extent overlaps the window via pacenote:drawDebugPacenoteNoSelection. | 350 |
| `gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances)` | Returns the location on the snaproad closest to the ray from the camera (position, segment, xnorm, distanceAlongRoute...). If the snaproad does not expose _allPoints, or if the camera has no direction, uses the snaproad point closest to the camera. The result is cached as long as the camera does not move. | 104 |

### Parameter details

#### `gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount)`

Prepares the drawing context: note entries (start/end distances along the route), pivot, window [startDistance, endDistance] of the route to draw. The window goes from the minimum window (neighboring notes) to the whole route depending on the camera distance.

- `path` (*table*) : Notebook (path.pacenotes.sorted).
- `snaproad` (*table*) : Snaproad (must have totalRouteLength).
- `pacenoteToolsState` (*table*) : Tool state.
- `maxDistance` (*number|nil*) : Maximum camera-to-notes distance in meters (default 650).
- `nearbyCount` (*integer|nil*) : Number of notes kept on each side of the pivot (default 3).
- **returns**: table|nil {entries, pivotLoc, pointDistances, startDistance, endDistance, totalLength} or nil if there is nothing to draw.

#### `gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop)`

Draws the road prisms of the context window, then each note whose extent overlaps the window via pacenote:drawDebugPacenoteNoSelection.

- `context` (*table|nil*) : Result of buildContext.
- `path` (*table*) : Notebook (not used directly).
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : Tool state.
- `globalOpacity` (*number|nil*) : Global opacity (default 1).
- `prismWidth` (*number|nil*) : Prism width in meters (default 1.945).
- `drawOnTop` (*boolean|nil*) : true to draw over the geometry (no depth test).

#### `gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances)`

Returns the location on the snaproad closest to the ray from the camera (position, segment, xnorm, distanceAlongRoute...). If the snaproad does not expose _allPoints, or if the camera has no direction, uses the snaproad point closest to the camera. The result is cached as long as the camera does not move.

- `pacenoteToolsState` (*table*) : Tool state (serves as cache).
- `snaproad` (*table*) : Snaproad object (closestSnapResult, _allPoints, routeLocationForPoint).
- `cameraPos` (*vec3*) : Camera position.
- `pointDistances` (*table<integer, number>|nil*) : Cumulative distances along the route, by point index or id.
- **returns**: table|nil Location {pos, fromPoint, toPoint, nearestPoint, segmentIndex, xnorm, distanceAlongRoute, distSq, rayPos} or nil.

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua`.*
