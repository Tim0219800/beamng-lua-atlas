# `editor_api_camera`

*File: `lua/ge/extensions/editor/api/camera.lua` · VM: Game Engine (GE) · 375 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_camera`: `extensions.load("editor_api_camera")`, then the global `editor_api_camera`

Editor camera API. initialize(editorInstance) installs on the editor object the camera type constants (CameraType_Game = 1, CameraType_Free = 2), the speed constants (CameraSpeed_Slowest 5, Slow 35, Slower 70, Normal 100, Faster 130, Fast 165, Fastest 200), the currentCameraType / previousCameraType state and the functions for the free camera, camera bookmarks (stored in MissionGroup/CameraBookmarks) and "smooth" camera parameters (newton). The functions listed are therefore methods of editor, not of the module.

## Example

```lua
editor.toggleFreeCamera()
local id = editor.addCameraBookmark("bridge view")
editor.jumpToCameraBookmark(id)
```

## Notes

- selectCamera does nothing until the level is loaded (global variable levelLoaded).
- The smooth zoom (fitViewToSelectionSmooth) runs in a job of 21 steps of 50 ms; the view radius is clamped between 20 and 16000.
- Inconsistency: fitViewToSelection tests editor.selection.objects (plural) whereas the other functions test editor.selection.object (singular); the test on the plural is therefore always true for "no object" and uses the gizmo.
- getCameraSpeed(speed) ignores its argument and returns core_camera.getSpeed().
- setSmoothCameraMove / Rotate only act in free camera; the "normalized" drag values are converted to the 5-20 range (1 = 5, 0 = 20).
- isFreeCamera is a local function that is not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_camera.initialize(editorInstance)` | Called by the editor: installs the camera constants and functions on the editor instance. *(internal)* | 323 |

### Parameter details

#### `editor_api_camera.initialize(editorInstance)`

Called by the editor: installs the camera constants and functions on the editor instance.

- `editorInstance` (*table*) : Editor instance.

## Class `editor`

Methods added to the editor instance by this module.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addCameraBookmark(name)` | Adds a named camera bookmark at the free camera's current position, in MissionGroup/CameraBookmarks (group created if needed). | 171 |
| `editor.cameraLookAtPoint(pt)` | Orients the camera toward a point in the world. | 45 |
| `editor.clearCameraBookmarks()` | Deletes all camera bookmarks. | 221 |
| `editor.copyCameraBookmarkToClipboard(obj)` | Copies to the clipboard a bookmark's position and rotation as text [x, y, z, qx, qy, qz, qw]. | 210 |
| `editor.deleteCameraBookmark(objectId)` | Deletes a camera bookmark. | 185 |
| `editor.fitViewToSelection(center)` | Places the camera 15 m behind the center of the selection (or of the gizmo) keeping its starting orientation then turns it toward the center. | 74 |
| `editor.fitViewToSelectionSmooth()` | Like fitViewToSelection but with an animated approach and a distance adapted to the selection's size. | 106 |
| `editor.getCamera()` | Returns the free camera (commands.getCamera). | 39 |
| `editor.getCameraBookmarks()` | Returns the SimGroup containing the bookmarks (creates it if needed; nil without MissionGroup). | 193 |
| `editor.getCameraSpeed(speed)` | Returns the free camera's speed. | 153 |
| `editor.getObjectLocationText(obj)` | Returns an object's position and rotation as text [x, y, z, qx, qy, qz, qw] (internal editor use). | 199 |
| `editor.getSmoothCameraParams()` | Returns the smooth free camera's parameters. | 290 |
| `editor.jumpToCameraBookmark(objectId)` | Moves the camera to a bookmark's position and rotation. | 237 |
| `editor.pasteCameraBookmarkFromClipboard()` | Applies to the free camera the transform text read from the clipboard (commands.setFreeCameraTransformJson). | 215 |
| `editor.placeCameraAtPlayer()` | Places the camera at the player's position (commands.dropCameraAtPlayer). | 60 |
| `editor.placeCameraAtSelection()` | Places the camera at the centroid of the object selection (no effect if nothing is selected). | 51 |
| `editor.placePlayerAtCamera()` | Places the player's vehicle at the camera's position (position only). | 65 |
| `editor.selectCamera(type)` | Chooses the view's camera: game (commands.setGameCamera) or free (commands.setFreeCamera); remembers the previous type. | 12 |
| `editor.setCameraSpeed(speed)` | Sets the free camera's speed (core_camera.setSpeed). | 149 |
| `editor.setSmoothCameraAngularDrag(drag)` | Sets the free camera's angular drag. | 269 |
| `editor.setSmoothCameraAngularDragNormalized(value)` | Sets the angular drag from a 0-1 value (same scale). | 283 |
| `editor.setSmoothCameraDrag(drag)` | Sets the free camera's translation drag. | 262 |
| `editor.setSmoothCameraDragNormalized(value)` | Sets the drag from a 0-1 value (1 gives 5, 0 gives 20). | 276 |
| `editor.setSmoothCameraMove(value)` | Enables or sets the free camera's "newton" translation (inertia). | 248 |
| `editor.setSmoothCameraParams(params)` | Applies smooth free camera parameters and resets the angular velocity to zero. | 307 |
| `editor.setSmoothCameraRotate(value)` | Enables or sets the free camera's "newton" rotation. | 255 |
| `editor.toggleFreeCamera()` | Toggles between the current game camera and the editor's free camera. | 30 |

## Calls into the engine (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `deleteObject`, `getId`, `getPosition`, `getRotation`, `getTransform`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/camera.lua`.*
