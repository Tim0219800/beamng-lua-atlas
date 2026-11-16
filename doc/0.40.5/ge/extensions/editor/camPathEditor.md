# `editor_camPathEditor`

*File: `lua/ge/extensions/editor/camPathEditor.lua` · VM: Game Engine (GE) · 2496 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_camPathEditor`: `extensions.load("editor_camPathEditor")`, then the global `editor_camPathEditor`

Camera path editor of the World Editor ("Path Camera Tool" window, "Edit Camera Paths" edit mode). It edits the paths managed by core_paths: each path is a list of markers {pos, rot, time, fov, positionSmooth, trackPosition, trackOffset, bullettime, cut, movingStart, movingEnd...} sorted by time. You can create/load/save/delete a path, add markers (Shift + left click in edit mode, or "+ Add Marker" at the camera position), adjust timings (Even Speed, Set Duration, Reverse, Relax Timings, Auto-smooth), orient the camera FPV-style (bank/aim), preview, link the path to a replay (core_replay) and play it (core_paths.playPath), optionally closing the editor. It draws the paths (splines, camera frustums, marker spheres) and framing overlays (rule of thirds, 16:9, 9:16). Depends on core_camera.

## Example

```lua
extensions.load('editor_camPathEditor')
-- select an existing path in the editor:
editor_camPathEditor.selectPath(core_paths.getPaths()[1])
```

## Notes

- Bug: the module assigns M.onExtensionLoaded = onExtensionLoaded, but no local variable onExtensionLoaded is defined: the field is nil (nonexistent hook, no effect).
- onUpdate is empty ("currently unused but kept for future functionality").
- Vehicle tracking offset: X (right/left), Y (forward/back), Z (up/down) sliders from -5 to +5 m, shown when a marker follows the player vehicle (trackPosition). getTrackingOffset() returns it to core/cameraModes/path.lua, which uses it when no marker has its own trackOffset.
- Each marker added by addMarker has: time = time of the last marker + 2 s (or the replay position if "Use with Replay" is checked), positionSmooth = 0.5, bullettime = 1, movingStart = movingEnd = true, fov of the current camera, trackPosition copied from the previous marker. If the replay time is identical to that of the last marker, the latter becomes cut = true.
- Marker sorting: by time; at equal time, a "cut" marker comes first (sortMarkers). The index of the selected marker is recomputed after each sort (setDirty).
- Relax Timings (factor 0.5) brings the interior times closer to a distribution proportional to distances; Even Speed distributes the times for a constant speed, ignoring "cut" segments; Auto-smooth combines heading smoothing, constant speed, angular speed limit and enables movingStart/movingEnd on all markers.
- The render preview in a dedicated window ("cameraPathPreviewWindow") is registered but its content is commented out in onEditorGui.
- Resolution of the splines drawn according to distance: 0.1 / 0.2 / 0.25 / 0.5 m; drawing limited to a 600 m radius (drawDistance).
- The M.currentPath field contains the path currently being edited (nil if none).

**Dependencies (loaded first):** `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_camPathEditor.getTrackingOffset()` | Provides core/cameraModes/path with the vehicle tracking offset set in the editor. | 2476 |
| `editor_camPathEditor.onClientStartMission()` | Called at the start of a level/mission: deselects the current path (selectPath(nil)). *(internal)* *(hook)* | 2471 |
| `editor_camPathEditor.onEditorGui()` | Draws the "Path Camera Tool" window (File menu: New, Load, Save, Delete, Render Options; path choice, replay, marker list and properties, timing tools, FOV, tracking, Play, Play (Close Editor) and Stop buttons) and the camera paths in the world. Called every frame by the editor. *(internal)* *(hook)* | 2020 |
| `editor_camPathEditor.onEditorInitialized()` | Registers the camPathEditMode edit mode (icon, actionMap "CamPathEditor", shortcut Shift + left click = "Add new marker") and the "pathCameraTool" (200x400) and "cameraPathPreviewWindow" (600x400) windows. *(internal)* *(hook)* | 2453 |
| `editor_camPathEditor.onPreRender()` | Called before rendering: if the editor is active in "Edit Camera Paths" mode, stores the window aspect ratio and draws the framing overlay. *(internal)* *(hook)* | 2433 |
| `editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook, currently empty. *(internal)* *(hook)* | 2429 |
| `editor_camPathEditor.selectPath(path)` | Selects a camera path: updates M.currentPath, deselects the marker, and loads the associated replay (path.replay) if it exists and differs from the loaded replay; otherwise stops the current replay. | 127 |

### Parameter details

#### `editor_camPathEditor.getTrackingOffset()`

Provides core/cameraModes/path with the vehicle tracking offset set in the editor.

- **returns**: table|nil {x = right/left, y = forward/back, z = up/down} in meters, or nil if all three values are 0

#### `editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook, currently empty.

- `dtReal` (*number*) : Real-time delta in seconds
- `dtSim` (*number*) : Simulation time delta
- `dtRaw` (*number*) : Raw time delta

#### `editor_camPathEditor.selectPath(path)`

Selects a camera path: updates M.currentPath, deselects the marker, and loads the associated replay (path.replay) if it exists and differs from the loaded replay; otherwise stops the current replay.

- `path` (*table|nil*) : core_paths path, or nil to deselect

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_camera'}: extensions loaded before this one. |
| `onExtensionLoaded` | nil | Reference to a local variable that is never defined: is nil (see notes). ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/camPathEditor.lua`.*
