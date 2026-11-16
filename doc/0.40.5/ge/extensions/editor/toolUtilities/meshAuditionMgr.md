# `editor_toolUtilities_meshAuditionMgr`

*File: `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua` · VM: Game Engine (GE) · 305 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_meshAuditionMgr`: `extensions.load("editor_toolUtilities_meshAuditionMgr")`, then the global `editor_toolUtilities_meshAuditionMgr`

Static mesh "audition" utility and imgui selection window, shared between editor tools. It lists .dae files (by default art/shapes/objects and art/shapes/garage_and_dealership/Clutter, or a chosen folder), creates a temporary TSStatic 'Temp Audition Mesh' at 1000 m altitude, rotates the camera around it and calls a callback with the chosen mesh. On close, the camera returns to its former pose and the temporary mesh is deleted.

## Example

```lua
local mam = require('editor/toolUtilities/meshAuditionMgr')
mam.registerWindow()
mam.addMeshToAudition(1, function(obj, path) ... end) -- opens the window
-- every imgui frame:
mam.handleMeshAuditionAndSelection('lampadaire', function(obj, path) ... end)
```

## Notes

- The 'meshSelect' window (300x300) is opened only by addMeshToAudition: handleMeshAuditionAndSelection does nothing until this window has been opened.
- The temporary mesh is created with canSave = false, so it is not saved with the level.
- The camera switches to the free camera (commands.setFreeCamera) and rotates by pi/500 rad every 0.05 s; the distance is set to 1.2 times the length of the mesh's box.
- The file list is computed only once (on the first addMeshToAudition), sorted by file name; populateAvailableStaticMeshes recomputes it on demand.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback)` | Adds or replaces the mesh under audition with the one at the given index: deletes the old one, opens the window if needed, creates the temporary TSStatic (position 0, 0, 1000), adjusts the camera if the audition view is active, then calls the callback. | 97 |
| `editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes()` | Returns the (uncopied) list of available static meshes: { path, filename }. | 53 |
| `editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time)` | Moves the camera to the audition pose (remembers the old pose, resets the timer to zero). No effect if already there. Returns the reset time (0.0) on first entry, otherwise the elapsed time. | 143 |
| `editor_toolUtilities_meshAuditionMgr.goToOldView()` | Brings the camera back to the pose saved before the audition and leaves the audition view. | 163 |
| `editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct)` | To be called every imgui frame: rotates the camera and draws the 'Static Mesh Selector' window (search, folder choice, reset to default folders, filterable list, Close button). Clicking a name puts the mesh under audition and calls the callback. | 184 |
| `editor_toolUtilities_meshAuditionMgr.leaveAuditionView()` | Exits the audition: deletes the temporary mesh, restores the camera and hides the window. No effect if the window is not open. | 174 |
| `editor_toolUtilities_meshAuditionMgr.manageRotateCam()` | Advances the camera one step around the audition center (angle modulo 2 pi). | 154 |
| `editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes()` | Rebuilds the list of *.dae files (recursive search in the current folders via FS:findFiles) and sorts it by file name. | 56 |
| `editor_toolUtilities_meshAuditionMgr.registerWindow()` | Registers the 'meshSelect' selection window in the editor. | 171 |
| `editor_toolUtilities_meshAuditionMgr.removeAuditionMesh()` | Deletes the mesh under audition if it exists. | 78 |
| `editor_toolUtilities_meshAuditionMgr.updateCameraPose()` | Places the free camera facing the audition center according to the current mesh's radius (distance 1.6 times the radius, elevation 0.8 times). | 89 |

### Parameter details

#### `editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback)`

Adds or replaces the mesh under audition with the one at the given index: deletes the old one, opens the window if needed, creates the temporary TSStatic (position 0, 0, 1000), adjusts the camera if the audition view is active, then calls the callback.

- `selectedMeshIdx` (*integer*) : Index in the list of available meshes (1-based).
- `callback` (*function|nil*) : callback(auditionMesh, path) called after creation.

#### `editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes()`

Returns the (uncopied) list of available static meshes: { path, filename }.

- **returns**: table[] Items { path = full path, filename = file name }.

#### `editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time)`

Moves the camera to the audition pose (remembers the old pose, resets the timer to zero). No effect if already there. Returns the reset time (0.0) on first entry, otherwise the elapsed time.

- `timer` (*hptimer*) : Timer to reset.
- `time` (*number*) : Current accumulated time (s).
- **returns**: number New accumulated time.

#### `editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct)`

To be called every imgui frame: rotates the camera and draws the 'Static Mesh Selector' window (search, folder choice, reset to default folders, filterable list, Close button). Clicking a name puts the mesh under audition and calls the callback.

- `meshTarget` (*string*) : Name of the component for which a mesh is being chosen (shown in the header).
- `onMeshSelectedFunct` (*function|nil*) : callback(auditionMesh, path) on each selection.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua`.*
