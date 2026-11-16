# `editor_toolUtilities_ribbonInput`

*File: `lua/ge/extensions/editor/toolUtilities/ribbonInput.lua` · VM: Game Engine (GE) · 492 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_ribbonInput`: `extensions.load("editor_toolUtilities_ribbonInput")`, then the global `editor_toolUtilities_ribbonInput`

Mouse and keyboard event handling for the "ribbon" splines of the editor's editing tools. A ribbon is a spline laid out in left/right node pairs (each pair has a depth). handleRibbonEvents (alias handlePrismEvents) draws the cursor, the pair placement help (first node, second node), finds the ribbon segment closest to the cursor, handles selection, node dragging (free or rigid), gizmo (Alt), depth adjustment by dragging (0.1 m per pixel, between 1 and 500 m), deletion (Delete), insertion, and records the changes in the undo history.

## Notes

- handleRibbonEvents and handlePrismEvents are the same function (same line 281 in the auto page).
- out.ribbonIdx is the index of the active ribbon; the old name out.prismIdx is accepted and copied into out.ribbonIdx. Without a valid ribbon at that index, the function returns without returning anything.
- out is updated during interactions with ribbonIdx, nodeIdx, isGizmoActive.
- The help text buffers appear after 1.0 s of mouse stillness (timeUntilTextAppears).
- The depth handle is drawn at scale 0.5 but the stored depth is not scaled.
- The state (mouse, left node placed, timers, closest segment) is local to the module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)` | Alias of handleRibbonEvents (old name, "prism" for prism ribbon). Same parameters and return values. | 281 |
| `editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)` | Handles user events for ribbons, to be called every frame by the active tool. Updates out, calls updateRibbonDataFn after each change and records the full state via deepCopyFn / undoFn / redoFn. Returns the best segment found by the search for the segment under the cursor, on the selected ribbon. | 281 |

### Parameter details

#### `editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)`

Alias of handleRibbonEvents (old name, "prism" for prism ribbon). Same parameters and return values.

- `ribbons` (*table*) : List of ribbons.
- `out` (*table*) : Output table (ribbonIdx or prismIdx, nodeIdx, isGizmoActive).
- `useGizmo` (*boolean*) : Gizmo usable.
- `isRigidTranslation` (*boolean*) : Rigid translation.
- `masterDepth` (*number*) : Depth of new pairs.
- `updateRibbonDataFn` (*function*) : Update callback.
- `deepCopyFn` (*function*) : Deep copy callback.
- `undoFn` (*function*) : Undo callback.
- `redoFn` (*function*) : Redo callback.
- **returns**: integer Index of the closest segment.
- **returns**: boolean Node drag in progress.

#### `editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)`

Handles user events for ribbons, to be called every frame by the active tool. Updates out, calls updateRibbonDataFn after each change and records the full state via deepCopyFn / undoFn / redoFn. Returns the best segment found by the search for the segment under the cursor, on the selected ribbon.

- `ribbons` (*table*) : List of ribbons to edit.
- `out` (*table*) : Output table: ribbonIdx (ribbon), nodeIdx (node), isGizmoActive (gizmo active).
- `useGizmo` (*boolean*) : Whether the gizmo is usable.
- `isRigidTranslation` (*boolean*) : true: dragging moves all nodes by the same vector; false: each node moves independently.
- `masterDepth` (*number*) : Depth used for new node pairs.
- `updateRibbonDataFn` (*function*) : Callback to recompute the ribbon data after a change.
- `deepCopyFn` (*function*) : Callback deep-copying ALL ribbon data (full state) for undo.
- `undoFn` (*function*) : Callback to undo the full state.
- `redoFn` (*function*) : Callback to redo the full state.
- **returns**: integer Index of the segment closest to the cursor on the selected ribbon.
- **returns**: boolean true if a node drag is in progress (isNodeDrag).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/ribbonInput.lua`.*
