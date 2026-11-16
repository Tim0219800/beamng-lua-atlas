# `editor_dragRaceEditor_utils`

*File: `lua/ge/extensions/editor/dragRaceEditor/utils.lua` · VM: Game Engine (GE) · 244 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_utils`: `extensions.load("editor_dragRaceEditor_utils")`, then the global `editor_dragRaceEditor_utils`

Utilities of the drag race editor: error display, unsaved changes flag, undo/redo stack on dragRaceData, validation and creation of default race/lane data, mouse update, creation of a transformUtil and ImGui header widgets.

## Notes

- The undo stack is limited to state.getMaxUndoSteps() (20) entries; saveToUndoStack clears the redo stack.
- updateMouseInfo here (unlike input.updateMouseInfo) assumes core_forest exists and forces down/hold/up to false if the raycast fails.
- dragHeaderLabel returns two values (gsub also returns the number of replacements); only the first is used in the concatenation.
- Validation requires a non-empty stripId or strip.lanes, plus a non-empty dragType.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_utils.clearUnsavedChanges()` | Clears the unsaved changes flag. | 34 |
| `editor_dragRaceEditor_utils.createNewDragRaceData()` | Creates a default dragRaceData: context activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) unused. | 116 |
| `editor_dragRaceEditor_utils.createNewLane(laneIndex)` | Creates a default lane: names "Lane N", color blue, stage and endLine waypoints, boundary, all with the default transform. | 94 |
| `editor_dragRaceEditor_utils.dragHeaderLabel(s)` | ImGui-safe header text: "Untitled" if empty, otherwise the string without # characters. | 227 |
| `editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen)` | Draws a CollapsingHeader with larger padding. | 235 |
| `editor_dragRaceEditor_utils.logError(message)` | Stores the message as the last error, displays it for 3 s and writes it to the log (level E, tag DragRaceEditor). | 11 |
| `editor_dragRaceEditor_utils.markUnsavedChanges()` | Marks the state as modified and unsaved. | 30 |
| `editor_dragRaceEditor_utils.redo()` | Restores the undone state: the current one returns to the undo stack. | 62 |
| `editor_dragRaceEditor_utils.reorderLanes(t, old, new)` | Moves an element of an array from position old to new, shifting the others (modifies t in place). | 163 |
| `editor_dragRaceEditor_utils.saveToUndoStack()` | Pushes a deep copy of dragRaceData (removes the oldest if the stack is full) and clears the redo stack. | 38 |
| `editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale)` | Creates a transformUtil (gizmo) initialized from a transform table {position, rotation, scale}. | 212 |
| `editor_dragRaceEditor_utils.showError()` | Displays the current error in red until its delay has elapsed; decrements the delay with the ImGui DeltaTime. To be called every frame. | 17 |
| `editor_dragRaceEditor_utils.undo()` | Pops the previous state: the current one goes to the redo stack. Does nothing if the stack is empty. | 50 |
| `editor_dragRaceEditor_utils.updateMouseInfo()` | Updates the state's mouse table (camera ray, raycast, left button click/hold/release if ImGui does not capture the mouse). | 173 |
| `editor_dragRaceEditor_utils.validateDragRaceData(data)` | Checks that a dragRaceData is usable. | 74 |

### Parameter details

#### `editor_dragRaceEditor_utils.createNewDragRaceData()`

Creates a default dragRaceData: context activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) unused.

- **returns**: table data

#### `editor_dragRaceEditor_utils.createNewLane(laneIndex)`

Creates a default lane: names "Lane N", color blue, stage and endLine waypoints, boundary, all with the default transform.

- `laneIndex` (*integer*) : lane number (laneOrder)
- **returns**: table lane

#### `editor_dragRaceEditor_utils.dragHeaderLabel(s)`

ImGui-safe header text: "Untitled" if empty, otherwise the string without # characters.

- `s` (*string|nil*) : text
- **returns**: string label

#### `editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen)`

Draws a CollapsingHeader with larger padding.

- `visibleLabel` (*string|nil*) : displayed text
- `idSuffix` (*string*) : ImGui ID suffix (e.g. "##xyz")
- `defaultOpen` (*boolean*) : open by default
- **returns**: boolean true if the section is open

#### `editor_dragRaceEditor_utils.logError(message)`

Stores the message as the last error, displays it for 3 s and writes it to the log (level E, tag DragRaceEditor).

- `message` (*string*) : error text

#### `editor_dragRaceEditor_utils.reorderLanes(t, old, new)`

Moves an element of an array from position old to new, shifting the others (modifies t in place).

- `t` (*table*) : array
- `old` (*integer*) : source index
- `new` (*integer*) : destination index

#### `editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale)`

Creates a transformUtil (gizmo) initialized from a transform table {position, rotation, scale}.

- `label` (*string*) : name/identifier of the transformUtil
- `transform` (*table*) : position {x,y,z}, quaternion rotation {x,y,z,w}, scale {x,y,z}
- `allowTranslate` (*boolean|nil*) : false only if explicitly false
- `allowRotate` (*boolean|nil*) : false only if explicitly false
- `allowScale` (*boolean|nil*) : false only if explicitly false
- **returns**: table transformUtil

#### `editor_dragRaceEditor_utils.validateDragRaceData(data)`

Checks that a dragRaceData is usable.

- `data` (*table|nil*) : data to check
- **returns**: boolean validity
- **returns**: string|nil error message if invalid

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/utils.lua`.*
