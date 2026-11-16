# `editor_dragRaceEditor_lanes`

*File: `lua/ge/extensions/editor/dragRaceEditor/lanes.lua` · VM: Game Engine (GE) · 296 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_lanes`: `extensions.load("editor_dragRaceEditor_lanes")`, then the global `editor_dragRaceEditor_lanes`

Manages the list of drag race lanes in the editor: loading from gameplay_drag_saveSystem, selection, adding, removing, saving to a <id>.lane.json file in the level's drag folder, and drawing the ImGui UI (list and details: ID, names, color, order, boundaryId).

## Notes

- Selection indices are 1-based; -1 means no selection.
- Proposed colors: blue, red, green, yellow, purple, orange.
- Lane waypoints come from the strip prefab; the Waypoints section only displays a help text.
- drawAxisBox draws some triangles twice with different permutations; drawTransformsPreview writes the lane name at (0,0,0).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_lanes.addLane()` | Adds a "New Lane" lane (color blue, next laneOrder, empty waypointIds, metadata created/modified), selects it and marks unsaved changes. | 49 |
| `editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr)` | Draws a solid box as debug (colored triangles and black edges) from a corner and three axis vectors. | 245 |
| `editor_dragRaceEditor_lanes.drawLaneDetails()` | Draws the ImGui panel of the selected lane's details (Basics, Waypoints, Boundary); fields modify the lane and mark unsaved changes. *(internal)* | 146 |
| `editor_dragRaceEditor_lanes.drawLanesSection()` | Draws the ImGui panel of the lane list (Add Lane, Remove, Save buttons, selectable list with tooltip). *(internal)* | 97 |
| `editor_dragRaceEditor_lanes.drawTransformsPreview()` | Displays the text "Lane: <name>" at the origin as 3D debug for the selected lane. *(internal)* | 238 |
| `editor_dragRaceEditor_lanes.getAllLanes()` | Returns the list of loaded lanes. | 22 |
| `editor_dragRaceEditor_lanes.getSelectedLane()` | Returns the selected lane. | 34 |
| `editor_dragRaceEditor_lanes.getSelectedLaneIndex()` | Index (1-based) of the selected lane, -1 if none. | 26 |
| `editor_dragRaceEditor_lanes.loadAllLanes()` | Loads all lanes via dragSaveSystem.getAllLanes(). | 17 |
| `editor_dragRaceEditor_lanes.removeSelectedLane()` | Removes the selected lane and moves the selection to the previous one; -1 if the list becomes empty. | 70 |
| `editor_dragRaceEditor_lanes.saveLane(lane)` | Saves the lane to <level drag folder>/<lane.id>.lane.json via dragSaveSystem.saveLane. | 84 |
| `editor_dragRaceEditor_lanes.selectLane(index)` | Selects the lane at the given index and logs its name. | 41 |
| `editor_dragRaceEditor_lanes.setSelectedLaneIndex(index)` | Sets the selected index without logging. | 30 |

### Parameter details

#### `editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr)`

Draws a solid box as debug (colored triangles and black edges) from a corner and three axis vectors.

- `corner` (*vec3*) : box corner
- `x` (*vec3*) : first edge vector
- `y` (*vec3*) : second edge vector
- `z` (*vec3*) : third edge vector
- `clr` (*ColorF*) : fill color

#### `editor_dragRaceEditor_lanes.getAllLanes()`

Returns the list of loaded lanes.

- **returns**: table array of lanes

#### `editor_dragRaceEditor_lanes.getSelectedLane()`

Returns the selected lane.

- **returns**: table|nil lane or nil if the index is out of bounds

#### `editor_dragRaceEditor_lanes.getSelectedLaneIndex()`

Index (1-based) of the selected lane, -1 if none.

- **returns**: integer index

#### `editor_dragRaceEditor_lanes.saveLane(lane)`

Saves the lane to <level drag folder>/<lane.id>.lane.json via dragSaveSystem.saveLane.

- `lane` (*table*) : lane to save
- **returns**: boolean false if there is no lane or no level loaded, otherwise the result of dragSaveSystem.saveLane

#### `editor_dragRaceEditor_lanes.selectLane(index)`

Selects the lane at the given index and logs its name.

- `index` (*integer*) : 1-based index

#### `editor_dragRaceEditor_lanes.setSelectedLaneIndex(index)`

Sets the selected index without logging.

- `index` (*integer*) : 1-based index, -1 for none

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/lanes.lua`.*
