# `editor_rallyEditor_drivelineEditSurface`

*File: `lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua` · VM: Game Engine (GE) · 326 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_drivelineEditSurface`: `extensions.load("editor_rallyEditor_drivelineEditSurface")`, then the global `editor_rallyEditor_drivelineEditSurface`

Editing toolbox for the driveline spline (rally driving line) for the rally editor. All functions take a "host" (the window that owns host.drivelineV3, host.selectedNodeIdx, host.dragState, host.path) and an optional opts table of callbacks (onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked/isInputBlocked, generateFinal). handleSplineInteraction handles the mouse: hover/move a node (click-drag), insert a node on the curve, add a node at the start or end (the nearest), delete the selected node with the Delete key (if more than 2 nodes). Each change is recorded in editor.history with a deep before/after copy of the spline (nodes, widths, nmls).

## Notes

- A moved node is snapped back to the surface via zSnap.snapDrivelineInPlace (options useRaycast and vertRayRaise from the driveline properties).
- The tolerance for selecting a node with the mouse ray is 0.5 + 0.15 × sqrt(camera distance) meters.
- A newly inserted node receives the width drivelineUtil.defaultSplineWidth and the average normal of the two neighboring nodes; a node added at an end takes the width and normal of the end node.
- saveFinalDriveline fails (E log, returns false) if there are fewer than 2 nodes, no host.path or no mission folder.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts)` | Records in editor.history an action with the old spline and a copy of the current one; undo and redo call onHistoryRestore(host, actionName, 'undo'\|'redo') if provided. Then calls opts.onCommit. | 82 |
| `editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host)` | Generates the final driveline from the spline (drivelineV3:createDrivelineFromSpline). | 135 |
| `editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts)` | Call every frame: handles the mouse on the spline (hover, node drag, insertion, addition, deletion with Delete). Does nothing if ImGui captures the mouse, if input is blocked or if the mouse is not over the map. | 162 |
| `editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data)` | Redoes an edit: restores data.new. | 77 |
| `editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts)` | If the spline is dirty and has at least 2 nodes, recomputes its geometry, regenerates the final driveline (unless opts.generateFinal == false) and calls onSplineMutated. | 100 |
| `editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved)` | Replaces the host spline's content (nodes, widths, nmls) with a saved copy, marks it dirty then recomputes the geometry and the final driveline. | 48 |
| `editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host)` | Saves the spline to a file in the notebook's mission folder (drivelineV3:saveSplineToFile) after checking the prerequisites. | 140 |
| `editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts)` | Simplifies the spline (Ramer-Douglas-Peucker algorithm on nodes, widths and normals) with a tolerance, updates the geometry and records the "Simplify Spline" action. No effect with 2 nodes or fewer. | 115 |
| `editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data)` | Undoes an edit: restores data.old. | 72 |

### Parameter details

#### `editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts)`

Records in editor.history an action with the old spline and a copy of the current one; undo and redo call onHistoryRestore(host, actionName, 'undo'|'redo') if provided. Then calls opts.onCommit.

- `host` (*table*) : Object carrying drivelineV3.
- `actionName` (*string*) : History action name.
- `oldSpline` (*table*) : Copy of the spline before modification.
- `opts` (*table|nil*) : Optional callbacks.

#### `editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host)`

Generates the final driveline from the spline (drivelineV3:createDrivelineFromSpline).

- `host` (*table*) : Object carrying drivelineV3.
- **returns**: boolean Generation result; false if host.drivelineV3 is missing.

#### `editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts)`

Call every frame: handles the mouse on the spline (hover, node drag, insertion, addition, deletion with Delete). Does nothing if ImGui captures the mouse, if input is blocked or if the mouse is not over the map.

- `host` (*table*) : Object carrying drivelineV3 (spline.nodes/widths/nmls, updateSplineGeometry...), selectedNodeIdx, dragState, deletePressed.
- `opts` (*table|nil*) : Callbacks: onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked, isInputBlocked, generateFinal.

#### `editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data)`

Redoes an edit: restores data.new.

- `host` (*table*) : Object carrying drivelineV3.
- `data` (*table|nil*) : Action data {old, new}.

#### `editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts)`

If the spline is dirty and has at least 2 nodes, recomputes its geometry, regenerates the final driveline (unless opts.generateFinal == false) and calls onSplineMutated.

- `host` (*table*) : Object carrying drivelineV3.
- `opts` (*table|nil*) : Optional callbacks.
- **returns**: boolean true if the geometry was updated.

#### `editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved)`

Replaces the host spline's content (nodes, widths, nmls) with a saved copy, marks it dirty then recomputes the geometry and the final driveline.

- `host` (*table*) : Object carrying drivelineV3.
- `saved` (*table*) : Saved spline {nodes, widths, nmls} (by drivelineV3:deepCopySpline).

#### `editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host)`

Saves the spline to a file in the notebook's mission folder (drivelineV3:saveSplineToFile) after checking the prerequisites.

- `host` (*table*) : Object carrying drivelineV3 and path (with getMissionDir()).
- **returns**: boolean true if the save succeeded.

#### `editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts)`

Simplifies the spline (Ramer-Douglas-Peucker algorithm on nodes, widths and normals) with a tolerance, updates the geometry and records the "Simplify Spline" action. No effect with 2 nodes or fewer.

- `host` (*table*) : Object carrying drivelineV3.
- `tolerance` (*number*) : Simplification tolerance (meters, inferred from code).
- `opts` (*table|nil*) : Optional callbacks.
- **returns**: boolean true if the spline was simplified.

#### `editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data)`

Undoes an edit: restores data.old.

- `host` (*table*) : Object carrying drivelineV3.
- `data` (*table|nil*) : Action data {old, new}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua`.*
