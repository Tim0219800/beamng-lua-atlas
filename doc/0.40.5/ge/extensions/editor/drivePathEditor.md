# `editor_drivePathEditor`

*File: `lua/ge/extensions/editor/drivePathEditor.lua` · VM: Game Engine (GE) · 1248 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_drivePathEditor`: `extensions.load("editor_drivePathEditor")`, then the global `editor_drivePathEditor`

Drive Path Editor of the world editor: tool for drawing paths (splines) that AI vehicles follow, in free mode (hand-placed nodes, with widths and speed profile) or in navigation graph mode (choosing nodes of the map's navgraph). It also lets you record a path by driving and start playback (ai.driveUsingPath). This file is the main interface: window, mouse/keyboard input and rendering; the spline logic is in drivePathEditor/splineMgr, playback in playback and recording in record.

## Notes

- Declared edit mode: editor.editModes.drivePathSplineEditMode ("Drive Path Spline"). On activation, the AI of all vehicles is stopped (ai.setState mode stop).
- UI bounds: start delay 0 to 60 s, road speed 0 to 100 m/s, aggression 0.3 to 1.0, laps 1 to 10; displayed speed units: m/s, mph or kph (kph by default).
- onEditorGui always updates "dirty" splines, even when the tool is inactive, and only draws their hulls; if the tool is active, the window is drawn, then playback/recording, otherwise the spline editor.
- onSerialize serializes all splines then removes them from the scene; onDeserialized recreates them and relinks the vehicles.
- The module file only exports the cross-selection (setSelectedSplineIdx/NodeIdx) and the hooks; everything else is local.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_drivePathEditor.onClientEndMission()` | Hook called on map exit: removes all path splines, even disabled ones, to avoid invalid TSStatic pointers on the next load. *(internal)* *(hook)* | 1231 |
| `editor_drivePathEditor.onDeserialized(data)` | Restore hook: recreates the splines from the data, recomputes the id-to-index table and relinks the vehicles. Does nothing if data is empty. *(internal)* *(hook)* | 99 |
| `editor_drivePathEditor.onEditorGui()` | Editor hook called every frame: updates the splines, draws the window, handles playback, recording, input and rendering of free mode or navgraph mode. *(internal)* *(hook)* | 1087 |
| `editor_drivePathEditor.onEditorInitialized()` | Hook: declares the "Drive Path Spline" edit mode (traffic cone icon) and registers the window (300x700). *(internal)* *(hook)* | 1217 |
| `editor_drivePathEditor.onSerialize()` | Save hook before extensions reload: returns the list of serialized splines and removes the splines from the scene. *(internal)* *(hook)* | 86 |
| `editor_drivePathEditor.setSelectedNodeIdx(idx)` | Sets the selected node (for the selection shared between tools). | 83 |
| `editor_drivePathEditor.setSelectedSplineIdx(idx)` | Sets the selected spline (for the selection shared between tools). | 80 |

### Parameter details

#### `editor_drivePathEditor.onDeserialized(data)`

Restore hook: recreates the splines from the data, recomputes the id-to-index table and relinks the vehicles. Does nothing if data is empty.

- `data` (*table|nil*) : array returned by onSerialize

#### `editor_drivePathEditor.onSerialize()`

Save hook before extensions reload: returns the list of serialized splines and removes the splines from the scene.

- **returns**: table array of serialized splines

#### `editor_drivePathEditor.setSelectedNodeIdx(idx)`

Sets the selected node (for the selection shared between tools).

- `idx` (*integer*) : node index (1-based)

#### `editor_drivePathEditor.setSelectedSplineIdx(idx)`

Sets the selected spline (for the selection shared between tools).

- `idx` (*integer*) : spline index (1-based)

## Calls into the engine (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/drivePathEditor.lua`.*
