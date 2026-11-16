# `editor_dragRaceEditor_strips`

*File: `lua/ge/extensions/editor/dragRaceEditor/strips.lua` · VM: Game Engine (GE) · 1061 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_strips`: `extensions.load("editor_dragRaceEditor_strips")`, then the global `editor_dragRaceEditor_strips`

Manages strips (drag tracks) in the drag race editor. A strip is a <id>.strip.json file in the level's dragstrips folder: id, name, description, endCamera, lanes (lanes with stage/endLine waypoints, boundary, zone) and stripZone. The module loads, selects, creates, deletes and saves strips (with file renaming if the id changes), draws the ImGui panels (list, details, lane editor) and the 3D preview (zones, boundaries). It also checks that the expected scene objects (BeamNGWaypoint, lights, displays) exist with names following the convention <stripId>_<type>_<lane number> and can rename those that carry old names (Prestagelight_1, display_time_1_r, BlueLight...).

## Notes

- Indices start at 1; -1 = no selection. The _filePath and _dirty fields of a strip are internal to the editor.
- selectStrip writes to the current drag settings stripId = "/levels/<level>/dragstrips/<id>.strip.json" (or the id alone without a level), deselects the settings and exits the Edit Drag Zone mode.
- A new strip (addStrip) contains two lanes, lane_left (blue) and lane_right (red), each with stage and endLine waypoints at the identity transform; the strip is _dirty=true.
- The zone edit target is {type='stripZone', strip} or {type='laneZone', strip, laneIndex, lane}.
- Boundary: oriented box (position, quaternion rotation, scale as half-dimensions); drawBoundariesInWorld draws it with a corner = pos - (x+y+z) and edges of length 2x.
- drawAxisBox is a duplicate of lanes.drawAxisBox; its triangles are drawn with several vertex orders (front/back face).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_strips.addStrip()` | Adds a default "New Strip" strip with two lanes, unsaved, and selects it. | 227 |
| `editor_dragRaceEditor_strips.beginBoundaryDrag(boundary)` | Stores the boundary's starting transform in M.boundaryDragStart. *(internal)* | 945 |
| `editor_dragRaceEditor_strips.draggingBoundary(boundary)` | During dragging: copies the gizmo's position, rotation or scale into the boundary depending on the mode, and marks the strip as modified. *(internal)* | 953 |
| `editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr)` | Draws a solid box as debug from a corner and three edge vectors. | 981 |
| `editor_dragRaceEditor_strips.drawBoundariesInWorld()` | Draws all boundaries of the lanes of the selected strip (magenta if selected, otherwise the lane color). *(internal)* | 1031 |
| `editor_dragRaceEditor_strips.drawLaneEditor()` | Draws the editor of the selected lane (info, waypoints, boundary, zone; button for zone editing in the scene). *(internal)* | 659 |
| `editor_dragRaceEditor_strips.drawStripDetails()` | Draws the editing UI of the selected strip (id, name, description, end camera, zone, lane list, state of the expected scene objects). *(internal)* | 434 |
| `editor_dragRaceEditor_strips.drawStripsList()` | Draws the ImGui "Strips" section (Add, Remove, Save, Refresh, list; modified entries in orange). *(internal)* | 372 |
| `editor_dragRaceEditor_strips.drawStripsPreview()` | Draws the name of the selected strip at the origin and its zones. *(internal)* | 919 |
| `editor_dragRaceEditor_strips.drawZonesInWorld()` | Draws as 3D debug ("faded" mode) the strip zone and the lane zones, excluding the zone being edited, with the lane color. *(internal)* | 894 |
| `editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex)` | Selects a strip and a lane by index and returns the lane. | 639 |
| `editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary)` | Places the editor's axis gizmo on a boundary and hooks up the drag callbacks. | 927 |
| `editor_dragRaceEditor_strips.endBoundaryDrag(boundary)` | End of dragging: clears M.boundaryDragStart. *(internal)* | 977 |
| `editor_dragRaceEditor_strips.getAllStrips()` | Returns the list of loaded strips. | 171 |
| `editor_dragRaceEditor_strips.getSelectedLane()` | Returns the selected lane of the selected strip. | 651 |
| `editor_dragRaceEditor_strips.getSelectedStrip()` | Returns the selected strip. | 192 |
| `editor_dragRaceEditor_strips.getSelectedStripIndex()` | Index (1-based) of the selected strip, -1 if none. | 184 |
| `editor_dragRaceEditor_strips.hasSavedStrips()` | Indicates whether at least one strip has a file on disk and is not modified. | 175 |
| `editor_dragRaceEditor_strips.loadAllStrips()` | Loads all strips of the level via dragSaveSystem.getAllStrips(), resets _dirty to false and fills in _filePath. | 157 |
| `editor_dragRaceEditor_strips.removeSelectedStrip()` | Removes the selected strip from the list (file not deleted) and adjusts the selection. | 313 |
| `editor_dragRaceEditor_strips.saveStrip(strip)` | Saves the strip to <level dragstrips folder>/<id>.strip.json via dragSaveSystem.saveStrip. Creates the folder if needed and renames the old file if the id changed (fails if the new name already exists). | 327 |
| `editor_dragRaceEditor_strips.selectStrip(index)` | Selects a strip (see notes: updates stripId of the current settings, exits zone editing, deselects the settings). | 199 |
| `editor_dragRaceEditor_strips.setSelectedStripIndex(index)` | Sets the selected index without side effects. | 188 |

### Parameter details

#### `editor_dragRaceEditor_strips.beginBoundaryDrag(boundary)`

Stores the boundary's starting transform in M.boundaryDragStart.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.draggingBoundary(boundary)`

During dragging: copies the gizmo's position, rotation or scale into the boundary depending on the mode, and marks the strip as modified.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr)`

Draws a solid box as debug from a corner and three edge vectors.

- `corner` (*vec3*) : corner
- `x` (*vec3*) : X edge
- `y` (*vec3*) : Y edge
- `z` (*vec3*) : Z edge
- `clr` (*ColorF*) : fill color

#### `editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex)`

Selects a strip and a lane by index and returns the lane.

- `stripIndex` (*integer*) : strip index (1-based)
- `laneIndex` (*integer*) : lane index (1-based)
- **returns**: table|nil lane, nil if index out of bounds

#### `editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary)`

Places the editor's axis gizmo on a boundary and hooks up the drag callbacks.

- `boundary` (*table|nil*) : boundary with transform {position, rotation, scale}

#### `editor_dragRaceEditor_strips.endBoundaryDrag(boundary)`

End of dragging: clears M.boundaryDragStart.

- `boundary` (*table*) : boundary

#### `editor_dragRaceEditor_strips.getAllStrips()`

Returns the list of loaded strips.

- **returns**: table array of strips

#### `editor_dragRaceEditor_strips.getSelectedLane()`

Returns the selected lane of the selected strip.

- **returns**: table|nil lane or nil

#### `editor_dragRaceEditor_strips.getSelectedStrip()`

Returns the selected strip.

- **returns**: table|nil strip or nil

#### `editor_dragRaceEditor_strips.getSelectedStripIndex()`

Index (1-based) of the selected strip, -1 if none.

- **returns**: integer index

#### `editor_dragRaceEditor_strips.hasSavedStrips()`

Indicates whether at least one strip has a file on disk and is not modified.

- **returns**: boolean result

#### `editor_dragRaceEditor_strips.saveStrip(strip)`

Saves the strip to <level dragstrips folder>/<id>.strip.json via dragSaveSystem.saveStrip. Creates the folder if needed and renames the old file if the id changed (fails if the new name already exists).

- `strip` (*table*) : strip to save
- **returns**: boolean success

#### `editor_dragRaceEditor_strips.selectStrip(index)`

Selects a strip (see notes: updates stripId of the current settings, exits zone editing, deselects the settings).

- `index` (*integer*) : 1-based index

#### `editor_dragRaceEditor_strips.setSelectedStripIndex(index)`

Sets the selected index without side effects.

- `index` (*integer*) : 1-based index or -1

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `setName`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/strips.lua`.*
