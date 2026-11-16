# `editor_dragRaceEditor_state`

*File: `lua/ge/extensions/editor/dragRaceEditor/state.lua` · VM: Game Engine (GE) · 185 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_state`: `extensions.load("editor_dragRaceEditor_state")`, then the global `editor_dragRaceEditor_state`

Shared state of the drag race editor: a single local State table (race data, current file, lane/facility/strip selection indices, mouse, undo/redo stack, displayed error, zone edit target, search). All other submodules access it via trivial getters/setters.

## Notes

- Module of simple accessors: each getXxx returns State.xxx and each setXxx assigns it, without validation.
- Initial values: current folder "/levels/", selection indices -1, maxUndoSteps 20, usingPrefabs and hasEndCamera are im.BoolPtr(false).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_state.getCurrentFileDir()` | Folder of the current file. | 104 |
| `editor_dragRaceEditor_state.getCurrentFileName()` | Name of the current file. | 112 |
| `editor_dragRaceEditor_state.getDragRaceData()` | Race data being edited. | 48 |
| `editor_dragRaceEditor_state.getErrorTimeout()` | Remaining time (s) for displaying the error. | 148 |
| `editor_dragRaceEditor_state.getHasEndCamera()` | ImGui boolean pointer "has an end camera". | 160 |
| `editor_dragRaceEditor_state.getHasUnsavedChanges()` | Indicates whether there are unsaved changes. | 88 |
| `editor_dragRaceEditor_state.getLastError()` | Last displayed error message. | 140 |
| `editor_dragRaceEditor_state.getMaxUndoSteps()` | Maximum number of undo steps (20). | 136 |
| `editor_dragRaceEditor_state.getMouseInfo()` | Mouse info table filled by utils.updateMouseInfo. | 80 |
| `editor_dragRaceEditor_state.getRedoStack()` | Redo stack. | 128 |
| `editor_dragRaceEditor_state.getSearch()` | searchUtil object used for dropdowns with search. | 164 |
| `editor_dragRaceEditor_state.getSelectedFacilityIndex()` | Selected facility index (-1 if none). | 64 |
| `editor_dragRaceEditor_state.getSelectedLaneIndex()` | Selected lane index (-1 if none). | 56 |
| `editor_dragRaceEditor_state.getSelectedStripIndex()` | Selected strip index (-1 if none). | 72 |
| `editor_dragRaceEditor_state.getState()` | Returns the complete State table. | 40 |
| `editor_dragRaceEditor_state.getTransforms()` | Table of editor transforms. | 96 |
| `editor_dragRaceEditor_state.getUndoStack()` | Undo stack (copies of dragRaceData). | 120 |
| `editor_dragRaceEditor_state.getUsingPrefabs()` | ImGui boolean pointer "uses prefabs". | 156 |
| `editor_dragRaceEditor_state.getZoneEditPreviousEditMode()` | Editor edit mode that was active before entering zone editing. | 176 |
| `editor_dragRaceEditor_state.getZoneEditTarget()` | Zone edit target (type stripZone or laneZone, with strip/lane). | 168 |
| `editor_dragRaceEditor_state.setCurrentFileDir(dir)` | Sets the folder of the current file. | 108 |
| `editor_dragRaceEditor_state.setCurrentFileName(name)` | Sets the name of the current file. | 116 |
| `editor_dragRaceEditor_state.setDragRaceData(data)` | Sets the race data. | 52 |
| `editor_dragRaceEditor_state.setErrorTimeout(timeout)` | Sets the remaining error display time. | 152 |
| `editor_dragRaceEditor_state.setHasUnsavedChanges(value)` | Sets the unsaved changes flag. | 92 |
| `editor_dragRaceEditor_state.setLastError(error)` | Sets the error message. | 144 |
| `editor_dragRaceEditor_state.setMouseInfo(info)` | Sets the mouse info table. | 84 |
| `editor_dragRaceEditor_state.setRedoStack(stack)` | Replaces the redo stack. | 132 |
| `editor_dragRaceEditor_state.setSelectedFacilityIndex(index)` | Sets the selected facility index. | 68 |
| `editor_dragRaceEditor_state.setSelectedLaneIndex(index)` | Sets the selected lane index. | 60 |
| `editor_dragRaceEditor_state.setSelectedStripIndex(index)` | Sets the selected strip index. | 76 |
| `editor_dragRaceEditor_state.setState(newState)` | Replaces the whole State table. | 44 |
| `editor_dragRaceEditor_state.setTransforms(transforms)` | Sets the transforms table. | 100 |
| `editor_dragRaceEditor_state.setUndoStack(stack)` | Replaces the undo stack. | 124 |
| `editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode)` | Stores the previous edit mode. | 180 |
| `editor_dragRaceEditor_state.setZoneEditTarget(target)` | Sets the zone edit target. | 172 |

### Parameter details

#### `editor_dragRaceEditor_state.getCurrentFileDir()`

Folder of the current file.

- **returns**: string folder, "/levels/" by default

#### `editor_dragRaceEditor_state.getCurrentFileName()`

Name of the current file.

- **returns**: string|nil name

#### `editor_dragRaceEditor_state.getDragRaceData()`

Race data being edited.

- **returns**: table|nil dragRaceData

#### `editor_dragRaceEditor_state.getErrorTimeout()`

Remaining time (s) for displaying the error.

- **returns**: number seconds

#### `editor_dragRaceEditor_state.getHasEndCamera()`

ImGui boolean pointer "has an end camera".

- **returns**: userdata im.BoolPtr

#### `editor_dragRaceEditor_state.getHasUnsavedChanges()`

Indicates whether there are unsaved changes.

- **returns**: boolean flag

#### `editor_dragRaceEditor_state.getLastError()`

Last displayed error message.

- **returns**: string|nil message

#### `editor_dragRaceEditor_state.getMaxUndoSteps()`

Maximum number of undo steps (20).

- **returns**: integer 20

#### `editor_dragRaceEditor_state.getMouseInfo()`

Mouse info table filled by utils.updateMouseInfo.

- **returns**: table|nil mouseInfo

#### `editor_dragRaceEditor_state.getRedoStack()`

Redo stack.

- **returns**: table stack

#### `editor_dragRaceEditor_state.getSearch()`

searchUtil object used for dropdowns with search.

- **returns**: table searchUtil

#### `editor_dragRaceEditor_state.getSelectedFacilityIndex()`

Selected facility index (-1 if none).

- **returns**: integer index

#### `editor_dragRaceEditor_state.getSelectedLaneIndex()`

Selected lane index (-1 if none).

- **returns**: integer index

#### `editor_dragRaceEditor_state.getSelectedStripIndex()`

Selected strip index (-1 if none).

- **returns**: integer index

#### `editor_dragRaceEditor_state.getState()`

Returns the complete State table.

- **returns**: table state

#### `editor_dragRaceEditor_state.getTransforms()`

Table of editor transforms.

- **returns**: table transforms

#### `editor_dragRaceEditor_state.getUndoStack()`

Undo stack (copies of dragRaceData).

- **returns**: table stack

#### `editor_dragRaceEditor_state.getUsingPrefabs()`

ImGui boolean pointer "uses prefabs".

- **returns**: userdata im.BoolPtr

#### `editor_dragRaceEditor_state.getZoneEditPreviousEditMode()`

Editor edit mode that was active before entering zone editing.

- **returns**: any mode

#### `editor_dragRaceEditor_state.getZoneEditTarget()`

Zone edit target (type stripZone or laneZone, with strip/lane).

- **returns**: table|nil target

#### `editor_dragRaceEditor_state.setCurrentFileDir(dir)`

Sets the folder of the current file.

- `dir` (*string*) : folder

#### `editor_dragRaceEditor_state.setCurrentFileName(name)`

Sets the name of the current file.

- `name` (*string|nil*) : name

#### `editor_dragRaceEditor_state.setDragRaceData(data)`

Sets the race data.

- `data` (*table|nil*) : data

#### `editor_dragRaceEditor_state.setErrorTimeout(timeout)`

Sets the remaining error display time.

- `timeout` (*number*) : seconds

#### `editor_dragRaceEditor_state.setHasUnsavedChanges(value)`

Sets the unsaved changes flag.

- `value` (*boolean*) : flag

#### `editor_dragRaceEditor_state.setLastError(error)`

Sets the error message.

- `error` (*string|nil*) : message

#### `editor_dragRaceEditor_state.setMouseInfo(info)`

Sets the mouse info table.

- `info` (*table|nil*) : mouseInfo

#### `editor_dragRaceEditor_state.setRedoStack(stack)`

Replaces the redo stack.

- `stack` (*table*) : stack

#### `editor_dragRaceEditor_state.setSelectedFacilityIndex(index)`

Sets the selected facility index.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setSelectedLaneIndex(index)`

Sets the selected lane index.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setSelectedStripIndex(index)`

Sets the selected strip index.

- `index` (*integer*) : index

#### `editor_dragRaceEditor_state.setState(newState)`

Replaces the whole State table.

- `newState` (*table*) : new state

#### `editor_dragRaceEditor_state.setTransforms(transforms)`

Sets the transforms table.

- `transforms` (*table*) : transforms

#### `editor_dragRaceEditor_state.setUndoStack(stack)`

Replaces the undo stack.

- `stack` (*table*) : stack

#### `editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode)`

Stores the previous edit mode.

- `mode` (*any*) : mode

#### `editor_dragRaceEditor_state.setZoneEditTarget(target)`

Sets the zone edit target.

- `target` (*table|nil*) : target

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/state.lua`.*
