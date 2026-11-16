# `editor_api_gizmo`

*File: `lua/ge/extensions/editor/api/gizmo.lua` · VM: Game Engine (GE) · 586 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_gizmo`: `extensions.load("editor_api_gizmo")`, then the global `editor_api_gizmo`

Editor API for the 3D axis gizmo (move / rotate / scale) and for object icons in the world view. It wraps `worldEditorCppApi`: mode and alignment selection, per-axis locks, translation/rotation/scale snapping, mouse hover/drag detection, and computation of object transforms during a move with terrain snapping (raycast or core_terrain). `initialize` installs everything on the `editor` object and defines the `editor.AxisGizmoMode_*` and `editor.AxisGizmoAlignment_*` constants.

## Example

```lua
editor.setAxisGizmoMode(editor.AxisGizmoMode_Translate)
editor.setAxisGizmoTransform(myMatrix)
-- every frame:
editor.updateAxisGizmo(onStart, onEnd, onDragging)
editor.drawAxisGizmo()
```

## Notes

- Constants defined: editor.AxisX/Y/Z/W = 0/1/2/3; AxisGizmoMode_Translate/Rotate/Scale = 1/2/3; AxisGizmoAlignment_World = 0, _Local = 1; editor.objectIconHitId = 0 initially.
- `updateAxisGizmo` and `drawAxisGizmo` must be called together every frame. During a drag, the simulation is paused (simTimeAuthority.pause) then restored at the end or on cancel.
- onEndGizmoDragFunc is only called if the gizmo was actually dragged (objectSelectionManipulated).
- The setAxisGizmo*Lock(x, y, z) locks: true = the axis is allowed (the comment says "allow").
- Terrain snapping (beginGizmoTranslate/getTransformsGizmoTranslate) driven by the snapping.terrain.* preferences: enabled, useRayCast, indObjects, relRotation, keepHeight, snapToCenter, snapToBB.
- In getTransformsGizmoTranslate, each object's height uses core_terrain.getTerrainHeight even in raycast mode (called before testing the raycast): without a terrain, these calls may return nil (inferred from code, a fallback value of 0 is used with `or`).
- The code comment notes that getTransformsGizmoTranslate has no rotation equivalent (TODO).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_gizmo.initialize(editorInstance)` | Remembers the editor, defines the axis/mode/alignment constants and installs all the gizmo/icon functions on `editor`. *(internal)* | 533 |

### Parameter details

#### `editor_api_gizmo.initialize(editorInstance)`

Remembers the editor, defines the axis/mode/alignment constants and installs all the gizmo/icon functions on `editor`.

- `editorInstance` (*table*) : `editor` object

## Class `editor`

Functions added to `editor` by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects)` | To be called once at the start of the drag: remembers the starting transforms and, if terrain snapping is enabled, the ground offsets, normals and bounding boxes (object collision temporarily disabled for the raycast). | 96 |
| `editor.cancelAxisGizmoInteraction()` | Cancels an ongoing interaction: virtually releases the mouse, restores the simulation pause and deselects the gizmo element. | 349 |
| `editor.drawAxisGizmo()` | Draws the gizmo with its current transform and mode (if the editor camera exists). | 364 |
| `editor.drawObjectIcons()` | Draws the closest objects' icons if the camera exists and editor.hideObjectIcons is not true. | 14 |
| `editor.getAxisGizmoAlignment()` | Returns the current gizmo alignment. | 423 |
| `editor.getAxisGizmoMode()` | Returns the current gizmo mode. | 417 |
| `editor.getAxisGizmoScale()` | Returns the current gizmo scale. | 54 |
| `editor.getAxisGizmoSelectedElement()` | Returns the selected gizmo element (axis or plane). | 433 |
| `editor.getAxisGizmoTransform()` | Returns the current gizmo transform. | 49 |
| `editor.getTransformsGizmoTranslate(objects, objectHeights)` | To be called every frame of the drag after beginGizmoTranslate: returns the new object transforms (gizmo translation, with terrain snapping and relative rotation according to the preferences). Returns {} if beginGizmoTranslate was not called. | 170 |
| `editor.isAxisGizmoHovered()` | Returns whether a gizmo element (axis or plane) is hovered/selected. | 428 |
| `editor.modifyFadeIconsDistance(deltaValue)` | Adjusts the object icons fade distance (preference gizmos.objectIcons.fadeIconsDistance += delta x fadeIconsDistanceModifySpeed, clamped to 1..50000) and shows a notification. | 499 |
| `editor.setAxisGizmoAlignment(alignment)` | Sets the gizmo alignment and emits onEditorAxisGizmoAligmentChanged. | 385 |
| `editor.setAxisGizmoMode(mode)` | Sets the gizmo mode and emits onEditorAxisGizmoModeChanged(mode). | 376 |
| `editor.setAxisGizmoRotateLock(x, y, z)` | Allows or not rotation per axis. | 403 |
| `editor.setAxisGizmoRotateSnap(enabled, rotationSnap)` | Sets rotation snapping. | 447 |
| `editor.setAxisGizmoScaleLock(x, y, z)` | Allows or not scaling per axis. | 411 |
| `editor.setAxisGizmoScaleSnap(enabled, scaleSnap)` | Sets scale snapping. | 454 |
| `editor.setAxisGizmoTransform(matrix, scale)` | Places the gizmo in the world (to edit object parts or custom handles). | 44 |
| `editor.setAxisGizmoTranslateLock(x, y, z)` | Allows or not translation per axis. | 395 |
| `editor.setAxisGizmoTranslateSnap(enabled, gridSize)` | Sets translation snapping. | 440 |
| `editor.toggleAxisGizmoAlignment()` | Toggles between world and local alignment. | 459 |
| `editor.toggleDrawGizmoPlane()` | Toggles the gizmos.general.drawGizmoPlane preference and enables/disables the gizmo's plane, hatching and move grid. | 468 |
| `editor.toggleDrawObjectIcons()` | Toggles the gizmos.general.drawObjectIcons preference and applies it to C++. | 482 |
| `editor.toggleDrawObjectText()` | Toggles the gizmos.general.drawObjectText preference (display of object names) and applies it to C++. | 488 |
| `editor.toggleSelectionHighlight()` | Toggles the gizmos.general.highlightSelectedMeshes preference. | 494 |
| `editor.toggleSnapping(value)` | Enables/disables rotation and translation snapping according to the snapping.general.* preferences (rotateSnapSize, gridSize), unless the corresponding rotateSnapEnabled / snapToGrid preference is already true. | 513 |
| `editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc)` | Handles the gizmo's mouse events (start, drag, end, hover), relays keyboard modifiers to C++ and emits onEditorAxisGizmoAligmentChanged if the alignment changed on the C++ side. To be called together with drawAxisGizmo. | 289 |
| `editor.updateObjectIcons()` | Updates editor.objectIconHitId (object icon under the mouse, 0 if icons are hidden or the gizmos.general.drawObjectIcons preference == false) and editor.objectIconHoverId (only if no mouse button is pressed and the UI does not capture the mouse). To be called every frame. | 24 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorAxisGizmoAligmentChanged` — listened to by 4 module(s)
- `onEditorAxisGizmoModeChanged` — listened to by 2 module(s)

## Calls into the engine (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawAxisGizmo`
- `worldEditorCppApi.` `checkObjectIconHit`, `drawClosestObjectIcons`, `getAxisGizmoAlignment`, `getAxisGizmoMode`, `getAxisGizmoScale`, `getAxisGizmoSelectedElement`, `getAxisGizmoTotalRotateOffset`, `getAxisGizmoTransform`, `getAxisGizmoTranslateOffset`, `onAxisGizmoMouseDown`, `onAxisGizmoMouseDragged`, `onAxisGizmoMouseMove`, `onAxisGizmoMouseUp`, `setAxisGizmoAlignment`, `setAxisGizmoMode`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`, `setAxisGizmoRotateLock`, `setAxisGizmoScaleLock`, `setAxisGizmoSelectedElement`, `setAxisGizmoTransform`, `setAxisGizmoTranslateLock`, `setDrawObjectIcons`, `setDrawObjectsText`, `setEventControlModifiers`, `setGridSnap`, `setRotateSnap`, `setScaleSnap`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/gizmo.lua`.*
