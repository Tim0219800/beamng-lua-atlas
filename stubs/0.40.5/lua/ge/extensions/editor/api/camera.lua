---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_camera` : `extensions.load("editor_api_camera")`, puis la globale `editor_api_camera`
---@class editor_api_camera
editor_api_camera = {}

---Source : lua/ge/extensions/editor/api/camera.lua:323
---@param editorInstance any
function editor_api_camera.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/camera.lua
---@class editor_api_camera_editor
local editor_api_camera_editor = {}

--- Adds a new named camera bookmark at the current world position.
---  @param name the name of the bookmark
---  @return the id of the bookmark object
---Source : lua/ge/extensions/editor/api/camera.lua:171
---@param name any
function editor_api_camera_editor.addCameraBookmark(name) end

--- Orients the camera to look at a specific world point.
---  @param pt the point in world where the camera should look at
---Source : lua/ge/extensions/editor/api/camera.lua:45
---@param pt any
function editor_api_camera_editor.cameraLookAtPoint(pt) end

--- Delete all the camera bookmarks.
---Source : lua/ge/extensions/editor/api/camera.lua:221
function editor_api_camera_editor.clearCameraBookmarks() end

--- Copies the camera bookmark to clipboard as text.
---  @param obj the camera bookmark object to copy
---Source : lua/ge/extensions/editor/api/camera.lua:210
---@param obj any
function editor_api_camera_editor.copyCameraBookmarkToClipboard(obj) end

--- Deletes a camera bookmark by its name.
---  @param objectId the object id of the bookmark
---Source : lua/ge/extensions/editor/api/camera.lua:185
---@param objectId any
function editor_api_camera_editor.deleteCameraBookmark(objectId) end

--- Fit/position the camera viewport to the bounding box of the selected objects, so one can view the entire selection.
---Source : lua/ge/extensions/editor/api/camera.lua:74
---@param center any
function editor_api_camera_editor.fitViewToSelection(center) end

---Source : lua/ge/extensions/editor/api/camera.lua:106
function editor_api_camera_editor.fitViewToSelectionSmooth() end

--- Returns the editor camera (free/fly camera).
---Source : lua/ge/extensions/editor/api/camera.lua:39
function editor_api_camera_editor.getCamera() end

--- Returns the bookmarks SimGroup object, where the bookmarks are kept.
---Source : lua/ge/extensions/editor/api/camera.lua:193
function editor_api_camera_editor.getCameraBookmarks() end

---Source : lua/ge/extensions/editor/api/camera.lua:153
---@param speed any
function editor_api_camera_editor.getCameraSpeed(speed) end

--- Return the object location as text. Used internally by the editor.
---  @param obj the object to get position text for
---Source : lua/ge/extensions/editor/api/camera.lua:199
---@param obj any
function editor_api_camera_editor.getObjectLocationText(obj) end

---Source : lua/ge/extensions/editor/api/camera.lua:290
function editor_api_camera_editor.getSmoothCameraParams() end

--- Jump to the camera bookmark.
---  @param objectId the object id of the bookmark to jump to
---Source : lua/ge/extensions/editor/api/camera.lua:237
---@param objectId any
function editor_api_camera_editor.jumpToCameraBookmark(objectId) end

--- Paste the camera bookmark from clipboard.
---Source : lua/ge/extensions/editor/api/camera.lua:215
function editor_api_camera_editor.pasteCameraBookmarkFromClipboard() end

--- Sets the camera position at the current player position.
---Source : lua/ge/extensions/editor/api/camera.lua:60
function editor_api_camera_editor.placeCameraAtPlayer() end

--- Sets the camera position at the center of the current object selection.
---Source : lua/ge/extensions/editor/api/camera.lua:51
function editor_api_camera_editor.placeCameraAtSelection() end

--- Sets the player position at the current editor camera position.
---Source : lua/ge/extensions/editor/api/camera.lua:65
function editor_api_camera_editor.placePlayerAtCamera() end

--- Sets the current camera in the editor's viewport.
---  @param type the camera type
---   Allowed values:
---   - editor.CameraType_Game - the gameplay camera
---   - editor.CameraType_Free - the editor free fly-by camera
---Source : lua/ge/extensions/editor/api/camera.lua:12
---@param type any
function editor_api_camera_editor.selectCamera(type) end

--- Sets the speed of the editor fly camera.
---  @param speed the speed of the fly camera movement.
---     Allowed values:
---       editor.CameraSpeed_Slowest
---       editor.CameraSpeed_Slow
---       editor.CameraSpeed_Slower
---       editor.CameraSpeed_Normal
---       editor.CameraSpeed_Faster
---       editor.CameraSpeed_Fast
---       editor.CameraSpeed_Fastest
---Source : lua/ge/extensions/editor/api/camera.lua:149
---@param speed any
function editor_api_camera_editor.setCameraSpeed(speed) end

---Source : lua/ge/extensions/editor/api/camera.lua:269
---@param drag any
function editor_api_camera_editor.setSmoothCameraAngularDrag(drag) end

---Source : lua/ge/extensions/editor/api/camera.lua:283
---@param value any
function editor_api_camera_editor.setSmoothCameraAngularDragNormalized(value) end

--- Set the smooth camera drag value
---  @param value the drag value
---Source : lua/ge/extensions/editor/api/camera.lua:262
---@param drag any
function editor_api_camera_editor.setSmoothCameraDrag(drag) end

---Source : lua/ge/extensions/editor/api/camera.lua:276
---@param value any
function editor_api_camera_editor.setSmoothCameraDragNormalized(value) end

--- Set the smooth camera move value
---  @param value the newton mode value
---Source : lua/ge/extensions/editor/api/camera.lua:248
---@param value any
function editor_api_camera_editor.setSmoothCameraMove(value) end

---Source : lua/ge/extensions/editor/api/camera.lua:307
---@param params any
function editor_api_camera_editor.setSmoothCameraParams(params) end

--- Set the smooth camera rotate value
---  @param value the newton rotate value
---Source : lua/ge/extensions/editor/api/camera.lua:255
---@param value any
function editor_api_camera_editor.setSmoothCameraRotate(value) end

--- Toggles between current in-game camera and free fly (editor) camera.
---Source : lua/ge/extensions/editor/api/camera.lua:30
function editor_api_camera_editor.toggleFreeCamera() end

