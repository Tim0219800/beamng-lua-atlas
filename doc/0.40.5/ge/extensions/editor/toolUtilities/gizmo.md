# `editor_toolUtilities_gizmo`

*File: `lua/ge/extensions/editor/toolUtilities/gizmo.lua` · VM: Game Engine (GE) · 177 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_gizmo`: `extensions.load("editor_toolUtilities_gizmo")`, then the global `editor_toolUtilities_gizmo`

Shared axis gizmo handling for the editor's spline editing tools. Places the gizmo on the selected node (or on a display anchor position), moves the node in translation (or all nodes in rigid mode), rotates the normals around the local tangent, and records the drag in the undo history.

## Notes

- The state (splines, indices, callbacks) is kept in module variables: it is rewritten on every call to handleGizmo.
- Rotation is only possible around the local tangent; the gizmo is forced to local alignment in rotation and to world alignment when switching to translation.
- setAxisGizmoTranslateLock(true, true, not isConformToTerrain): vertical translation (Z) depends on the terrain conform mode (Z lock = not conform, as written in the code).
- At the end of the drag, spline.isDirty is set back to true so that the final state triggers a rebuild.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn)` | To be called every frame: positions, updates and draws the gizmo on the selected node of a spline, and configures the axis locks. During a drag, the node follows the cursor; releasing commits the 'Gizmo Drag' action in the history. | 112 |
| `editor_toolUtilities_gizmo.isDragging()` | True while a gizmo drag (translation or rotation) is in progress; allows heavy rebuilds to be deferred. | 170 |

### Parameter details

#### `editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn)`

To be called every frame: positions, updates and draws the gizmo on the selected node of a spline, and configures the axis locks. During a drag, the node follows the cursor; releasing commits the 'Gizmo Drag' action in the history.

- `isRotEnabledIn` (*boolean*) : Enables rotation (tangent axis).
- `selectedSplineIdx` (*integer*) : Index of the selected spline.
- `selectedNodeIdx` (*integer*) : Index of the selected node.
- `splinesIn` (*table[]*) : List of splines (each with nodes, nmls, isDirty).
- `isConformToTerrainIn` (*boolean*) : Terrain-conforming spline (Z not free on the gizmo).
- `isRigidIn` (*boolean*) : Rigid translation/rotation applied to all nodes.
- `deepCopyFunctIn` (*function*) : Deep copy of a spline's state, for the history.
- `undoFunctIn` (*function*) : Undo callback.
- `redoFunctIn` (*function*) : Redo callback.
- `commitHistoryOverrideIn` (*function|nil*) : Replaces editor.history:commitAction to group the drag into a larger action.
- `anchorPosIn` (*vec3|nil*) : Display position of the gizmo instead of the node; nil = on the node.

#### `editor_toolUtilities_gizmo.isDragging()`

True while a gizmo drag (translation or rotation) is in progress; allows heavy rebuilds to be deferred.

- **returns**: boolean Drag state.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/gizmo.lua`.*
