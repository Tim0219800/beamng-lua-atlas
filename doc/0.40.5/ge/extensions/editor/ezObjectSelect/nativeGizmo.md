# `editor_ezObjectSelect_nativeGizmo`

*File: `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua` · VM: Game Engine (GE) · 375 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_nativeGizmo`: `extensions.load("editor_ezObjectSelect_nativeGizmo")`, then the global `editor_ezObjectSelect_nativeGizmo`

Wrapper of the Easy Select tool around the editor's native axis gizmo (editor.updateAxisGizmo / drawAxisGizmo). Captures the transforms/scales of the selection at the start of the drag, applies translation (with grid snap), rotation and scale during the drag, then at the end records undoable history actions (SetObjectTransform / SetObjectScale, transaction "EasySelectNativeTransform" or "EasySelectNativeScale") and emits the hook onEditorObjectSelectionTransformChanged. Prefab offsets are updated for objects contained in a prefab.

## Notes

- The native grid/rotation snap is disabled during the gizmo update then restored; left Alt forces traditional snap. Grid snap is applied by this module itself (options.gridSnapEnabled, gridRelative, gridSize), relative or absolute depending on gridRelative.
- If the selection changes during a drag, the state is restored (reset) and the gizmo draws nothing this frame.
- A simple click without movement creates no history action.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_nativeGizmo.consumeFinished()` | Reads and clears the "drag ended this frame" flag. | 355 |
| `editor_ezObjectSelect_nativeGizmo.draw(options)` | To be called every frame: checks that the selection matches the captured drag and that the objects support the current mode (non-empty position/rotation/scale, editor.canManipulateObject), updates the gizmo with the snap options then draws it. | 332 |
| `editor_ezObjectSelect_nativeGizmo.isInteracting()` | Indicates whether a gizmo drag is in progress. | 351 |
| `editor_ezObjectSelect_nativeGizmo.reset()` | Cancels the current drag: restores original transforms and scales, clears the flags and cancels the gizmo interaction. | 363 |

### Parameter details

#### `editor_ezObjectSelect_nativeGizmo.consumeFinished()`

Reads and clears the "drag ended this frame" flag.

- **returns**: boolean true if a drag ended
- **returns**: table|nil {mode, anchorDistance} (applied translation distance, 0 outside translation) if changes were committed

#### `editor_ezObjectSelect_nativeGizmo.draw(options)`

To be called every frame: checks that the selection matches the captured drag and that the objects support the current mode (non-empty position/rotation/scale, editor.canManipulateObject), updates the gizmo with the snap options then draws it.

- `options` (*table|nil*) : {gridSnapEnabled, gridRelative, gridSize, rotateSnapEnabled, rotateSnapSize}
- **returns**: boolean false if nothing was drawn (selection changed or mode not supported), otherwise true

#### `editor_ezObjectSelect_nativeGizmo.isInteracting()`

Indicates whether a gizmo drag is in progress.

- **returns**: boolean 

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectSelectionTransformChanged`

## Calls into the engine (C++)

- `Sim.` `upcast`
- `obj:` `getField`, `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`
- `ui_imgui.` `IsMouseDown`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTranslateOffset`, `getGridSize`, `getRotateSnapAngle`, `setAxisGizmoSelectedElement`, `setGridSnap`, `setRotateSnap`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua`.*
