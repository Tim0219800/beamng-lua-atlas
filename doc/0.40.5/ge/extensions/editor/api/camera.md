# `editor_api_camera`

*Fichier : `lua/ge/extensions/editor/api/camera.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_camera` : `extensions.load("editor_api_camera")`, puis la globale `editor_api_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_camera.initialize(editorInstance)` |  | 323 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addCameraBookmark(name)` | Adds a new named camera bookmark at the current world position.<br> @param name the name of the bookmark<br> @return the id of the bookmark object | 171 |
| `editor.cameraLookAtPoint(pt)` | Orients the camera to look at a specific world point.<br> @param pt the point in world where the camera should look at | 45 |
| `editor.clearCameraBookmarks()` | Delete all the camera bookmarks. | 221 |
| `editor.copyCameraBookmarkToClipboard(obj)` | Copies the camera bookmark to clipboard as text.<br> @param obj the camera bookmark object to copy | 210 |
| `editor.deleteCameraBookmark(objectId)` | Deletes a camera bookmark by its name.<br> @param objectId the object id of the bookmark | 185 |
| `editor.fitViewToSelection(center)` | Fit/position the camera viewport to the bounding box of the selected objects, so one can view the entire selection. | 74 |
| `editor.fitViewToSelectionSmooth()` |  | 106 |
| `editor.getCamera()` | Returns the editor camera (free/fly camera). | 39 |
| `editor.getCameraBookmarks()` | Returns the bookmarks SimGroup object, where the bookmarks are kept. | 193 |
| `editor.getCameraSpeed(speed)` |  | 153 |
| `editor.getObjectLocationText(obj)` | Return the object location as text. Used internally by the editor.<br> @param obj the object to get position text for | 199 |
| `editor.getSmoothCameraParams()` |  | 290 |
| `editor.jumpToCameraBookmark(objectId)` | Jump to the camera bookmark.<br> @param objectId the object id of the bookmark to jump to | 237 |
| `editor.pasteCameraBookmarkFromClipboard()` | Paste the camera bookmark from clipboard. | 215 |
| `editor.placeCameraAtPlayer()` | Sets the camera position at the current player position. | 60 |
| `editor.placeCameraAtSelection()` | Sets the camera position at the center of the current object selection. | 51 |
| `editor.placePlayerAtCamera()` | Sets the player position at the current editor camera position. | 65 |
| `editor.selectCamera(type)` | Sets the current camera in the editor's viewport.<br> @param type the camera type<br>  Allowed values:<br>  - editor.CameraType_Game - the gameplay camera<br>  - editor.CameraType_Free - the editor free fly-by camera | 12 |
| `editor.setCameraSpeed(speed)` | Sets the speed of the editor fly camera.<br> @param speed the speed of the fly camera movement.<br>    Allowed values:<br>      editor.CameraSpeed_Slowest<br>      editor.CameraSpeed_Slow<br>      editor.CameraSpeed_Slower<br>      editor.CameraSpeed_Normal<br>      editor.CameraSpeed_Faster<br>      editor.CameraSpeed_Fast<br>      editor.CameraSpeed_Fastest | 149 |
| `editor.setSmoothCameraAngularDrag(drag)` |  | 269 |
| `editor.setSmoothCameraAngularDragNormalized(value)` |  | 283 |
| `editor.setSmoothCameraDrag(drag)` | Set the smooth camera drag value<br> @param value the drag value | 262 |
| `editor.setSmoothCameraDragNormalized(value)` |  | 276 |
| `editor.setSmoothCameraMove(value)` | Set the smooth camera move value<br> @param value the newton mode value | 248 |
| `editor.setSmoothCameraParams(params)` |  | 307 |
| `editor.setSmoothCameraRotate(value)` | Set the smooth camera rotate value<br> @param value the newton rotate value | 255 |
| `editor.toggleFreeCamera()` | Toggles between current in-game camera and free fly (editor) camera. | 30 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `deleteObject`, `getId`, `getPosition`, `getRotation`, `getTransform`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/camera.lua`.*
