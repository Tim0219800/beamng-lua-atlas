# `gameplay_rally_notebook_noSelectionPreview`

*File: `lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua` · VM: Game Engine (GE) · 517 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_noSelectionPreview`: `extensions.load("gameplay_rally_notebook_noSelectionPreview")`, then the global `gameplay_rally_notebook_noSelectionPreview`

Preview of the rally note (pacenotes) editor when no note is selected. Far from the road (beyond overviewDistance), draws the whole road in a rainbow gradient with one marker per note; near the road, only draws the window around the point the camera is aimed at, with the labels of the neighboring notes. A model (points, distances, sorted note entries) is cached in pacenoteToolsState.

## Notes

- Cache: pacenoteToolsState._noSelectionPreviewModel (invalidated if path, snaproad or points change) and _noSelectionPreviewRaycastCache; invalidate() deletes both.
- Writes pacenoteToolsState._pacenoteLabelRaycastCursorPos (aimed point) in near view.
- Overview: the route is split into at most 700 segments (overviewMaxRouteSegments). Rainbow color = position along the route (0 red, 1 blue).
- opts.labelMode == 'all' shows all labels; otherwise only those of the notes around the pivot (opts.nearCameraCount, default 3).
- The pivot search is limited to overviewDistance * 1.25 around the camera, the last pivot and a point ahead on the ray.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts)` | Draws the no-selection preview (route and notes via pacenote:drawDebugPacenoteNoSelectionRainbow). | 460 |
| `gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState)` | Deletes the preview's model and ray cache; call when the notebook or the snaproad changes. | 200 |
| `gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts)` | Returns the route window near the camera used by the near view, without drawing. | 490 |

### Parameter details

#### `gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts)`

Draws the no-selection preview (route and notes via pacenote:drawDebugPacenoteNoSelectionRainbow).

- `path` (*table*) : Notebook (path.pacenotes.sorted).
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : Tool state (serves as cache).
- `globalOpacity` (*number|nil*) : Global opacity (default 1).
- `prismWidth` (*number|nil*) : Prism width in meters (default 1.945).
- `drawOnTop` (*boolean|nil*) : true to draw without depth test.
- `opts` (*table|nil*) : {overviewDistance = 650, labelMode = 'all'|other, nearCameraCount = 3}.
- **returns**: boolean true if something was drawn, false if the data is insufficient.

#### `gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState)`

Deletes the preview's model and ray cache; call when the notebook or the snaproad changes.

- `pacenoteToolsState` (*table|nil*) : Tool state.

#### `gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts)`

Returns the route window near the camera used by the near view, without drawing.

- `path` (*table*) : Notebook.
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : Tool state.
- `opts` (*table|nil*) : {overviewDistance = 650}.
- **returns**: table|nil {startDistance, endDistance, pivotDistance, pivotPos} or nil (no notes, camera too far or missing data).

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua`.*
