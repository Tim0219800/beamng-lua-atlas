# `editor_toolUtilities_splineInput`

*File: `lua/ge/extensions/editor/toolUtilities/splineInput.lua` · VM: Game Engine (GE) · 1310 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_splineInput`: `extensions.load("editor_toolUtilities_splineInput")`, then the global `editor_toolUtilities_splineInput`

Shared mouse and keyboard handling for all spline editing tools of the editor (a spline is an editable polyline along a variable-width centerline: roads, paths). Handles selecting and dragging nodes, width handles (ribs) and height handles (bars), the gizmo, adding and inserting nodes, junctions and loops, profile copy-paste (Ctrl+C / Ctrl+V), deletion, undo (via editor.history or an override provided by the tool) and selection across tools. Tools register with registerSplineTool, which makes it possible to select a spline of another tool by clicking on it.

## Example

```lua
local si = require('editor/toolUtilities/splineInput')
si.registerSplineTool(prefix, getSplines, getEditModeKey, deepCopy, deepCopyState, 'editor_meshSpline')
-- every frame, in onEditorGui: si.handleSplineEvents(splines, out, ...)
```

## Notes

- Constants: spline width 3 to 200 m, height 0 to 70 m, default node speed 13.5 m/s (limit 70 m/s), max junction or loop distance 15 m, height sensitivity 1 m per pixel, help text appearance delay 1 s.
- Junctions and loops only change the topology if Ctrl is held when the drag is released; the preview is shown as soon as a candidate exists.
- Alt toggles the gizmo (out.isGizmoActive).
- eventOptions of handleSplineEvents: commitHistoryOverride(name, data, undoFn, redoFn, dontCallRedoNow), preserveNodeZ (drag a node on a horizontal plane at its own altitude), suppressAddNode (hides node adding for the frame), midJoinRefusalFn, maxWidth (max width of a rib drag), gizmoAnchorFn(spline, node) (gizmo display point).
- Fields of `out` read or written: spline, node (selected indices), isGizmoActive, among others.
- A tool hosted in another edit mode (City Builder network tabs) must declare itself with setHostedTool(prefix) while its tab is open.
- cancelDrag is exported as an alias of clearDragState (clears the whole drag state).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_splineInput.cancelDrag()` | Cancels the current drag state (alias of clearDragState): clears spline, node, previous state, rib, bar and aux flags. | 77 |
| `editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars)` | Hit detection that breaks ties by distance to the camera: returns the best target (node, rib or bar) closest to the camera ray, always checking the splines of all tools for cross-tool selection. Nodes have priority. | 478 |
| `editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix)` | Node selection from another tool, for tools that do not run handleSplineEvents (polygon tools such as the forest zone editor). Every frame, hovers the spline nodes of other tools (glow and "select" text) and, on click, switches to that tool and selects the node, starting a drag if the target tool supports it. | 701 |
| `editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars)` | Processes the input events for a path in a navigation graph: click on a graph node to add it to or remove it from the path (with its default speed and limit 13.5 m/s), drag speed bars (0 to 70 m/s), cursor and help texts. | 1171 |
| `editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions)` | Processes the input events of spline tools for one frame: hover, selection, adding and inserting nodes, dragging nodes, ribs and bars, gizmo, junctions, profile copy-paste, deletion, and committing undo steps. Updates the `out` table (selected spline and node, gizmo state, etc.). | 775 |
| `editor_toolUtilities_splineInput.isDragging()` | True if a drag is in progress (node, auxiliary node or gizmo). | 97 |
| `editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn)` | Registers a spline editing tool for the shared input utilities. Called again with the same prefix (hot reload), it updates the callbacks of the existing registration; does nothing if prefix is nil. Warning: on update, getAuxNodesFn and isNodeLockedFn are replaced as is, even if they are nil. | 665 |
| `editor_toolUtilities_splineInput.setHostedTool(prefix)` | Declares that a tool is hosted in another edit mode: its prefix is then used as the active tool name instead of the edit mode's displayName. | 103 |

### Parameter details

#### `editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars)`

Hit detection that breaks ties by distance to the camera: returns the best target (node, rib or bar) closest to the camera ray, always checking the splines of all tools for cross-tool selection. Nodes have priority.

- `selSpline` (*table|nil*) : Selected spline.
- `mousePos` (*vec3*) : 3D mouse position.
- `useRibs` (*boolean*) : Also test the width handles.
- `useBars` (*boolean*) : Also test the height handles.
- **returns**: table|nil Target: fields type ('node', 'rib', 'bar'), splineIdx, nodeIdx, toolName, among others; nil if nothing.

#### `editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix)`

Node selection from another tool, for tools that do not run handleSplineEvents (polygon tools such as the forest zone editor). Every frame, hovers the spline nodes of other tools (glow and "select" text) and, on click, switches to that tool and selects the node, starting a drag if the target tool supports it.

- `activePrefix` (*string*) : Prefix of the calling tool, whose splines are ignored.
- **returns**: boolean True if a foreign node is under the cursor, so the caller skips its own scene interaction.

#### `editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars)`

Processes the input events for a path in a navigation graph: click on a graph node to add it to or remove it from the path (with its default speed and limit 13.5 m/s), drag speed bars (0 to 70 m/s), cursor and help texts.

- `selSpline` (*table|nil*) : Selected spline (graphNodes, vels, velLimits, barPoints).
- `nodes` (*table*) : Navigation graph nodes.
- `deepCopyFunct` (*function*) : Deep copy of a spline.
- `undoFunct` (*function*) : Undo callback.
- `redoFunct` (*function*) : Redo callback.
- `isBarsLimit` (*boolean*) : Use velLimits (true) or vels (false) for the bar height.
- `useBars` (*boolean|nil*) : Allow bars (true by default).

#### `editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions)`

Processes the input events of spline tools for one frame: hover, selection, adding and inserting nodes, dragging nodes, ribs and bars, gizmo, junctions, profile copy-paste, deletion, and committing undo steps. Updates the `out` table (selected spline and node, gizmo state, etc.).

- `splines` (*table*) : Collection of splines to manage.
- `out` (*table*) : Table updated during interaction: selection (spline index, node index, layer index for the "decal placement" case), isGizmoActive, etc.
- `isRotEnabled` (*boolean*) : Rotation gizmo allowed.
- `isConformToTerrain` (*boolean*) : The spline must conform to the surface below (vertical gizmo control).
- `useRibs` (*boolean*) : Use ribs (width handles).
- `useBars` (*boolean*) : Use bars (height handles).
- `isBarsLimits` (*boolean*) : The bars are limits (true) or speeds (false).
- `useCopyPaste` (*boolean*) : Enable profile copy-paste.
- `useGizmo` (*boolean*) : Use the gizmo.
- `isLockShape` (*boolean*) : The spline shape is locked.
- `defaultSplineWidth` (*number*) : Default width of a new node, in meters.
- `deepCopyFunct` (*function*) : Deep copy of a spline.
- `deepCopyStateFunct` (*function*) : Deep copy of a spline's state.
- `copyProfileFunct` (*function*) : Copies a profile.
- `pasteProfileFunct` (*function*) : Pastes a profile.
- `afterEndDragCallback` (*function|nil*) : Called at the end of a drag with (selSpline, wasAuxDrag, auxIdx, dragSplineIdx, dragNodeIdx).
- `joinFunct` (*function|nil*) : Called when the user forms a junction.
- `undoFunct` (*function*) : Undo callback of a spline edit.
- `redoFunct` (*function*) : Redo callback of a spline edit.
- `undoStateFunct` (*function|nil*) : Undo callback of the full-state edit.
- `redoStateFunct` (*function|nil*) : Redo callback of the full-state edit.
- `midJoinFunct` (*function|nil*) : Called for a mid-spline junction.
- `canJoinFunct` (*function|nil*) : Tells whether a junction is allowed (inferred from code).
- `canJoinAuxFunct` (*function|nil*) : Variant of canJoinFunct for auxiliary nodes (inferred from code).
- `eventOptions` (*table|nil*) : Options: commitHistoryOverride, preserveNodeZ, suppressAddNode, midJoinRefusalFn, maxWidth, gizmoAnchorFn.

#### `editor_toolUtilities_splineInput.isDragging()`

True if a drag is in progress (node, auxiliary node or gizmo).

- **returns**: boolean Active drag.

#### `editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn)`

Registers a spline editing tool for the shared input utilities. Called again with the same prefix (hot reload), it updates the callbacks of the existing registration; does nothing if prefix is nil. Warning: on update, getAuxNodesFn and isNodeLockedFn are replaced as is, even if they are nil.

- `prefix` (*string*) : Display prefix of the tool (from splineMgr.getToolPrefixStr()).
- `getSplinesFn` (*function*) : Returns the tool's spline array.
- `getEditModeKeyFn` (*function*) : Returns the editor edit mode key for this tool.
- `deepCopyFn` (*function*) : Deep copy of a spline.
- `deepCopyStateFn` (*function*) : Deep copy of the entire tool state.
- `uiModuleName` (*string*) : Name of the UI module (e.g. 'editor_meshSpline'), which exposes setSelectedSplineIdx and setSelectedNodeIdx.
- `getAuxNodesFn` (*function|nil*) : Optional: returns additional selectable node positions (array of vec3), same hit rules as road nodes.
- `isNodeLockedFn` (*function|nil*) : Optional: isNodeLockedFn(spline, nodeIdx) returns true to allow selection but not dragging, the gizmo or deletion.

#### `editor_toolUtilities_splineInput.setHostedTool(prefix)`

Declares that a tool is hosted in another edit mode: its prefix is then used as the active tool name instead of the edit mode's displayName.

- `prefix` (*string|nil*) : Prefix of the hosted tool, nil to cancel.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/splineInput.lua`.*
