# `editor_ezObjectSelect_subtools_fence_session`

*File: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua` · VM: Game Engine (GE) · 775 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_subtools_fence_session`: `extensions.load("editor_ezObjectSelect_subtools_fence_session")`, then the global `editor_ezObjectSelect_subtools_fence_session`

Fence editing session of Easy Object Select. begin() discovers an existing fence from the selected object (fence/anchors) or starts a creation; the fence is represented by an editable spline (splineInput, sphere nodes) on which the populationEngine of meshSpline places TSStatic pieces as a preview (max 512). Committing creates/modifies the objects in a single undoable history action ("Edit Fence" or "Delete Fence").

## Example

```lua
local s = extensions.editor_ezObjectSelect_subtools_fence_session
local ok, err = s.begin({assetPaths = {"art/shapes/fence.dae"}, anchorDistance = 0.5, noOverlap = true})
-- every frame: s.update(true)
-- then: s.exitAndCommit()
```

## Notes

- The Esc key cancels the session (update calls cancel).
- On initial creation, a click on the terrain places the first node then dragging defines the second; a drag that is too short is ignored.
- The final objects are added to editor.resolveAddGroup(MissionGroup) and the hook onEditorObjectAdded is emitted on restores (undo/redo).
- exitAndCommit and deleteAndCommit refuse to act (return 0 and a message) if isCapped() is true.
- Uses local upvalues: only one session can be active at a time.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_session.begin(options)` | Starts a session. Fails if a session is already active or if no asset is chosen. If objects are selected, starts from the last one; otherwise starts a blank creation. Saves the original selection and registers the spline tool. | 520 |
| `editor_ezObjectSelect_subtools_fence_session.cancel()` | Cancels the session: restores the source objects and the original selection. | 722 |
| `editor_ezObjectSelect_subtools_fence_session.deleteAndCommit()` | Deletes the fence's original objects in a single "Delete Fence" history action. | 698 |
| `editor_ezObjectSelect_subtools_fence_session.exitAndCommit()` | Commits the fence: serializes the final state, ends the session and records the "Edit Fence" history action (undoable). | 664 |
| `editor_ezObjectSelect_subtools_fence_session.getNodeCount()` | Number of spline nodes (0 without a spline). | 751 |
| `editor_ezObjectSelect_subtools_fence_session.getPieceCount()` | Number of preview pieces. | 743 |
| `editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount()` | Number of original pieces selected at start. | 747 |
| `editor_ezObjectSelect_subtools_fence_session.getStatusMessage()` | Last status message (validation error, etc.). | 770 |
| `editor_ezObjectSelect_subtools_fence_session.isActive()` | true if a session is active. | 735 |
| `editor_ezObjectSelect_subtools_fence_session.isCapped()` | true if discovery or preview has reached the safety limit; committing is then blocked. | 759 |
| `editor_ezObjectSelect_subtools_fence_session.isDragging()` | true if a drag (initial creation or spline node) is in progress. | 739 |
| `editor_ezObjectSelect_subtools_fence_session.isLoop()` | true if the spline is closed as a loop. | 755 |
| `editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled)` | Enables/disables the no-overlap mode (whole mesh lengths, remainder left empty at the end) and marks the spline for rebuilding. | 763 |
| `editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput)` | To be called every frame: handles Esc, the initial creation or spline editing, rebuilds the preview if the spline is modified and draws nodes and spline. | 616 |

### Parameter details

#### `editor_ezObjectSelect_subtools_fence_session.begin(options)`

Starts a session. Fails if a session is already active or if no asset is chosen. If objects are selected, starts from the last one; otherwise starts a blank creation. Saves the original selection and registers the spline tool.

- `options` (*table|nil*) : assetPaths (string[]), anchorDistance (m), noOverlap (boolean, true by default unless explicitly false).
- **returns**: boolean true if the session starts.
- **returns**: string|nil Error message on failure.

#### `editor_ezObjectSelect_subtools_fence_session.deleteAndCommit()`

Deletes the fence's original objects in a single "Delete Fence" history action.

- **returns**: integer Number of pieces deleted; 0 if impossible.

#### `editor_ezObjectSelect_subtools_fence_session.exitAndCommit()`

Commits the fence: serializes the final state, ends the session and records the "Edit Fence" history action (undoable).

- **returns**: integer Number of pieces created; 0 if nothing or on error.

#### `editor_ezObjectSelect_subtools_fence_session.getNodeCount()`

Number of spline nodes (0 without a spline).

- **returns**: integer Number of nodes.

#### `editor_ezObjectSelect_subtools_fence_session.getPieceCount()`

Number of preview pieces.

- **returns**: integer Number of placements.

#### `editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount()`

Number of original pieces selected at start.

- **returns**: integer Number.

#### `editor_ezObjectSelect_subtools_fence_session.getStatusMessage()`

Last status message (validation error, etc.).

- **returns**: string|nil Message.

#### `editor_ezObjectSelect_subtools_fence_session.isActive()`

true if a session is active.

- **returns**: boolean Active session.

#### `editor_ezObjectSelect_subtools_fence_session.isCapped()`

true if discovery or preview has reached the safety limit; committing is then blocked.

- **returns**: boolean Limit reached.

#### `editor_ezObjectSelect_subtools_fence_session.isDragging()`

true if a drag (initial creation or spline node) is in progress.

- **returns**: boolean Drag in progress.

#### `editor_ezObjectSelect_subtools_fence_session.isLoop()`

true if the spline is closed as a loop.

- **returns**: boolean Loop.

#### `editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled)`

Enables/disables the no-overlap mode (whole mesh lengths, remainder left empty at the end) and marks the spline for rebuilding.

- `enabled` (*boolean*) : true to enable.

#### `editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput)`

To be called every frame: handles Esc, the initial creation or spline editing, rebuilds the preview if the spline is modified and draws nodes and spline.

- `canAcceptInput` (*boolean*) : true if input can be processed.
- **returns**: boolean false if no active session.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectAdded` — listened to by 3 module(s)

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `deserializeObjectsFromText`
- `be:` `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `disableCollision`, `enableCollision`, `getGroup`, `getID`, `registerObject`, `serialize`, `setField`, `setHidden`, `setPosRot`, `setRenderEnabled`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua`.*
