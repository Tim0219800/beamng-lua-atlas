# `editor_mapJsonEditor`

*File: `lua/ge/extensions/editor/mapJsonEditor.lua` · VM: Game Engine (GE) · 820 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_mapJsonEditor`: `extensions.load("editor_mapJsonEditor")`, then the global `editor_mapJsonEditor`

Editor for the navgraph file levels/<level>/map.json (menu Window > Roads > Map Json Editor). This file contains manual road segments: ordered, named chains of BeamNGWaypoint with overrides for drivability, direction, lanes, speed limit, etc. The waypoints are scene objects, the file only references them by name. map.lua watches the file and reloads the navgraph when it is written. The tool draws the segments and waypoints in 3D (debugDrawer) and adds an "Edit Map Json" edit mode.

## Example

```lua
editor_mapJsonEditor.show()
editor_mapJsonEditor.saveFile()
```

## Notes

- Left click: select a segment; Ctrl + left click: add a waypoint to the segment.
- On save, the known keys are written in a fixed order (drivability, oneWay, flipDirection, autoLanes, lanesLeft, lanesRight, autoJunction, hiddenInNavi, gatedRoad, type, speedLimit), the other keys are appended sorted so that nothing is lost; the original compact format is kept.
- A nodes list given as a string in the file is expanded into an array on load.
- onSerialize/onDeserialized keep the unsaved data across a Lua reload; onEditorExitLevel clears them.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_mapJsonEditor.loadFile(fp)` | Reads a map.json file, resets the selection and rescans the scene's waypoints. | 133 |
| `editor_mapJsonEditor.onDeserialized(d)` | Restores the state after a Lua reload. *(internal)* *(hook)* | 798 |
| `editor_mapJsonEditor.onEditorExitLevel()` | Called on level exit: clears data, path, selection and caches. *(internal)* *(hook)* | 784 |
| `editor_mapJsonEditor.onEditorGui()` | Draws the tool window (open/new, SAVE, list of segments and nodes, display options) and the 3D drawing every frame. *(internal)* *(hook)* | 659 |
| `editor_mapJsonEditor.onEditorInitialized()` | Defines the mapJsonEditMode edit mode, registers the window and the menu entry (Roads group). *(internal)* *(hook)* | 758 |
| `editor_mapJsonEditor.onEditorToolWindowHide(windowName)` | When the tool window is hidden, goes back to the objectSelect edit mode. *(internal)* *(hook)* | 772 |
| `editor_mapJsonEditor.onSerialize()` | Called before a Lua reload. *(internal)* *(hook)* | 794 |
| `editor_mapJsonEditor.onWindowGotFocus(windowName)` | When the tool window gets focus, activates the mapJsonEditMode edit mode. *(internal)* *(hook)* | 778 |
| `editor_mapJsonEditor.saveFile(fp)` | Writes the segments to the file (the navgraph reloads when the file changes). Does nothing if there is no data; logs an error if the write fails. | 200 |
| `editor_mapJsonEditor.show()` | Shows the window, activates the mapJsonEditMode edit mode, loads the level's map.json if not already open, then rescans the waypoints. | 745 |

### Parameter details

#### `editor_mapJsonEditor.loadFile(fp)`

Reads a map.json file, resets the selection and rescans the scene's waypoints.

- `fp` (*string|nil*) : File path; the current level's map.json if nil.
- **returns**: boolean true if the file was read, false otherwise (no level or file unreadable).

#### `editor_mapJsonEditor.onDeserialized(d)`

Restores the state after a Lua reload.

- `d` (*table|nil*) : Table returned by onSerialize.

#### `editor_mapJsonEditor.onEditorToolWindowHide(windowName)`

When the tool window is hidden, goes back to the objectSelect edit mode.

- `windowName` (*string*) : Name of the hidden window.

#### `editor_mapJsonEditor.onSerialize()`

Called before a Lua reload.

- **returns**: table {data, filePath, dirty}.

#### `editor_mapJsonEditor.onWindowGotFocus(windowName)`

When the tool window gets focus, activates the mapJsonEditMode edit mode.

- `windowName` (*string*) : Window name.

#### `editor_mapJsonEditor.saveFile(fp)`

Writes the segments to the file (the navgraph reloads when the file changes). Does nothing if there is no data; logs an error if the write fails.

- `fp` (*string|nil*) : Target path; current path or the level's map.json by default.

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/mapJsonEditor.lua`.*
