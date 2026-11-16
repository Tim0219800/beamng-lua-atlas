# `editor_trafficGatedRoadsEditor`

*File: `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua` · VM: Game Engine (GE) · 444 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_trafficGatedRoadsEditor`: `extensions.load("editor_trafficGatedRoadsEditor")`, then the global `editor_trafficGatedRoadsEditor`

Editor "Traffic Gated Roads" (Traffic menu): places spheres (displayed as vertical cylinders 20 m high, adjustable radius) in the world and saves them to a JSON file, by default /gameplay/trafficGatedRoads.json. Each sphere has id, name, pos {x,y,z}, quat {x,y,z,w} and radius (10 by default). Ctrl+click adds a sphere, Shift+click duplicates the selection, click selects, Del deletes; a gizmo moves, rotates or scales. The role of this data in traffic is not defined in this file.

## Notes

- The SAVE button and the Save menu are disabled as long as the path is the default one: you must go through Save As.
- Moving with "Snap to Terrain" fires a static raycast downward from 50 m above the point.
- The state (data, filePath, selection, nextId) is kept across a Lua reload via onSerialize / onDeserialized.
- Leaving the window switches the editor back to objectSelect mode; regaining focus re-enables the edit mode.
- M.allowGizmo returns false (not nil) outside the edit mode, whereas the local function of the same name may return nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_trafficGatedRoadsEditor.allowGizmo()` | True when the current edit mode is "Edit Traffic Gated Roads": the gizmo is then allowed. | 441 |
| `editor_trafficGatedRoadsEditor.loadData(fp)` | Loads a JSON file of spheres (jsonReadFile). On failure, logs an error and changes nothing. Otherwise replaces the data, remembers the path, clears the selection and recomputes nextId. | 209 |
| `editor_trafficGatedRoadsEditor.onDeserialized(d)` | Hook called after a Lua reload: restores the state returned by onSerialize. *(internal)* *(hook)* | 423 |
| `editor_trafficGatedRoadsEditor.onEditorGui()` | Hook called every interface frame: draws the window (File menu, SAVE, sphere list, name, position, radius, Snap to Terrain checkbox), handles the mouse, draws the cylinders with debugDrawer:drawCylinder and the gizmo (move, rotate, scale). *(internal)* *(hook)* | 230 |
| `editor_trafficGatedRoadsEditor.onEditorInitialized()` | Editor hook: creates the trafficGatedRoadsEditMode edit mode (left click = Select), registers the window (400x500) and the Traffic menu entry. *(internal)* *(hook)* | 389 |
| `editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName)` | Hook called when a tool window is hidden: if it is this one, returns to objectSelect mode. *(internal)* *(hook)* | 402 |
| `editor_trafficGatedRoadsEditor.onSerialize()` | Hook called before a Lua reload: returns the state to keep. *(internal)* *(hook)* | 414 |
| `editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName)` | Hook called when a window gains focus: if it is this one, re-enables the edit mode. *(internal)* *(hook)* | 408 |
| `editor_trafficGatedRoadsEditor.saveData(fp)` | Writes the data to a JSON file (jsonWriteFile, human-readable formatting) and remembers the path. | 203 |
| `editor_trafficGatedRoadsEditor.show()` | Clears the object selection, shows the window and switches to the trafficGatedRoadsEditMode edit mode. | 375 |

### Parameter details

#### `editor_trafficGatedRoadsEditor.allowGizmo()`

True when the current edit mode is "Edit Traffic Gated Roads": the gizmo is then allowed.

- **returns**: boolean Active edit mode.

#### `editor_trafficGatedRoadsEditor.loadData(fp)`

Loads a JSON file of spheres (jsonReadFile). On failure, logs an error and changes nothing. Otherwise replaces the data, remembers the path, clears the selection and recomputes nextId.

- `fp` (*string|nil*) : File path; no effect if nil.

#### `editor_trafficGatedRoadsEditor.onDeserialized(d)`

Hook called after a Lua reload: restores the state returned by onSerialize.

- `d` (*table|nil*) : Serialized state.

#### `editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName)`

Hook called when a tool window is hidden: if it is this one, returns to objectSelect mode.

- `windowName` (*string*) : Name of the hidden window.

#### `editor_trafficGatedRoadsEditor.onSerialize()`

Hook called before a Lua reload: returns the state to keep.

- **returns**: table { data, filePath, selectedIdx, nextId }.

#### `editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName)`

Hook called when a window gains focus: if it is this one, re-enables the edit mode.

- `windowName` (*string*) : Window name.

#### `editor_trafficGatedRoadsEditor.saveData(fp)`

Writes the data to a JSON file (jsonWriteFile, human-readable formatting) and remembers the path.

- `fp` (*string|nil*) : Path; defaults to the current path.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua`.*
