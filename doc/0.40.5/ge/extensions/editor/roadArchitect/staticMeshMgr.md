# `editor_roadArchitect_staticMeshMgr`

*File: `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua` · VM: Game Engine (GE) · 157 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_staticMeshMgr`: `extensions.load("editor_roadArchitect_staticMeshMgr")`, then the global `editor_roadArchitect_staticMeshMgr`

Manages the "audition" of static meshes in Road Architect: it lists the available .dae files (art/shapes/objects and art/shapes/garage_and_dealership/Clutter folders), displays a chosen mesh in the scene at 1000 m altitude and moves/rotates the free camera around it to preview it. It also fills in, in the relevant profile layer, the dimensions of the mesh (box). Used by the profile editing UI.

## Notes

- The audition object is called "Mesh Under Audition [temporary]" and is placed at (0, 0, 1000) in MissionGroup.
- The camera rotates in steps of pi/500 per call of manageRotateCam; the distance depends on the mesh size (1.2 x box length).
- availStaticMeshes is emptied and refilled in place (table.clear): the exported reference remains valid after fetchAvailableStaticMeshes.
- In addMeshToAudition, the table scenetree.MissionGroup:addObject receives the object directly (and not .obj as elsewhere): possible inconsistency with the other modules.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx)` | Replaces the mesh under audition with the one at the given index, adjusts the camera distance to its size, then writes into the profile layer the distances from the box to the center (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) and its extents (extentsL, extentsW, extentsH). | 72 |
| `editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes()` | Recursively searches for *.dae in the predefined folders and fills availStaticMeshes (sorted by filename). | 41 |
| `editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time)` | If the camera is not already in audition view: stores its pose, stops and resets the timer, and applies the audition pose. | 118 |
| `editor_roadArchitect_staticMeshMgr.goToOldView()` | Restores the camera pose stored before the audition and leaves the audition view. | 138 |
| `editor_roadArchitect_staticMeshMgr.manageRotateCam()` | Advances the camera rotation angle around the mesh by one step and applies the pose (to be called every frame). | 129 |
| `editor_roadArchitect_staticMeshMgr.removeAuditionMesh()` | Deletes the scene object of the mesh under audition if it exists. | 55 |
| `editor_roadArchitect_staticMeshMgr.updateCameraPose()` | Switches to free camera and places the camera at the audition pose (behind and above the mesh, looking at it). | 64 |

### Parameter details

#### `editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx)`

Replaces the mesh under audition with the one at the given index, adjusts the camera distance to its size, then writes into the profile layer the distances from the box to the center (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) and its extents (extentsL, extentsW, extentsH).

- `selectedMeshIdx` (*integer*) : Index in availStaticMeshes.
- `road` (*table*) : Road whose profile contains the layer.
- `customIdx` (*integer*) : Index of the layer in road.profile.layers.

#### `editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time)`

If the camera is not already in audition view: stores its pose, stops and resets the timer, and applies the audition pose.

- `timer` (*table*) : Timer with stopAndReset().
- `time` (*number*) : Current time.
- **returns**: number 0.0 on entering the view; otherwise the time value received.

## Fields

| Field | Type | Description |
|---|---|---|
| `availStaticMeshes` | table<integer, {path: string, filename: string}> | .dae meshes found, sorted by file name. Filled by fetchAvailableStaticMeshes. |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua`.*
