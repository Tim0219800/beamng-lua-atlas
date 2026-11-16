---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor camera API. initialize(editorInstance) installs on the editor object the camera type constants (CameraType_Game = 1, CameraType_Free = 2), the speed constants (CameraSpeed_Slowest 5, Slow 35, Slower 70, Normal 100, Faster 130, Fast 165, Fastest 200), the currentCameraType / previousCameraType state and the functions for the free camera, camera bookmarks (stored in MissionGroup/CameraBookmarks) and "smooth" camera parameters (newton). The functions listed are therefore methods of editor, not of the module.
--- Access: extension `editor_api_camera`: `extensions.load("editor_api_camera")`, then the global `editor_api_camera`
---@class editor_api_camera
editor_api_camera = {}

--- Called by the editor: installs the camera constants and functions on the editor instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/camera.lua:323
---@param editorInstance table Editor instance.
function editor_api_camera.initialize(editorInstance) end

--- Methods added to the editor instance by this module.
---@class editor_api_camera_editor
local editor_api_camera_editor = {}

--- Adds a named camera bookmark at the free camera's current position, in MissionGroup/CameraBookmarks (group created if needed).
---Source: lua/ge/extensions/editor/api/camera.lua:171
---@param name string Internal name of the bookmark.
---@return integer  Id of the bookmark object.
function editor_api_camera_editor.addCameraBookmark(name) end

--- Orients the camera toward a point in the world.
---Source: lua/ge/extensions/editor/api/camera.lua:45
---@param pt vec3 Point to look at.
function editor_api_camera_editor.cameraLookAtPoint(pt) end

--- Deletes all camera bookmarks.
---Source: lua/ge/extensions/editor/api/camera.lua:221
function editor_api_camera_editor.clearCameraBookmarks() end

--- Copies to the clipboard a bookmark's position and rotation as text [x, y, z, qx, qy, qz, qw].
---Source: lua/ge/extensions/editor/api/camera.lua:210
---@param obj table Bookmark object.
function editor_api_camera_editor.copyCameraBookmarkToClipboard(obj) end

--- Deletes a camera bookmark.
---Source: lua/ge/extensions/editor/api/camera.lua:185
---@param objectId integer Id of the bookmark object.
function editor_api_camera_editor.deleteCameraBookmark(objectId) end

--- Places the camera 15 m behind the center of the selection (or of the gizmo) keeping its starting orientation then turns it toward the center.
---Source: lua/ge/extensions/editor/api/camera.lua:74
---@param center vec3|nil Center to aim at; by default the center of the selection box.
function editor_api_camera_editor.fitViewToSelection(center) end

--- Like fitViewToSelection but with an animated approach and a distance adapted to the selection's size.
---Source: lua/ge/extensions/editor/api/camera.lua:106
function editor_api_camera_editor.fitViewToSelectionSmooth() end

--- Returns the free camera (commands.getCamera).
---Source: lua/ge/extensions/editor/api/camera.lua:39
---@return table  Camera object.
function editor_api_camera_editor.getCamera() end

--- Returns the SimGroup containing the bookmarks (creates it if needed; nil without MissionGroup).
---Source: lua/ge/extensions/editor/api/camera.lua:193
---@return table|nil  SimGroup.
function editor_api_camera_editor.getCameraBookmarks() end

--- Returns the free camera's speed.
---Source: lua/ge/extensions/editor/api/camera.lua:153
---@param speed any
---@return number  Speed.
function editor_api_camera_editor.getCameraSpeed(speed) end

--- Returns an object's position and rotation as text [x, y, z, qx, qy, qz, qw] (internal editor use).
---Source: lua/ge/extensions/editor/api/camera.lua:199
---@param obj table Scene object.
---@return string  Formatted text.
function editor_api_camera_editor.getObjectLocationText(obj) end

--- Returns the smooth free camera's parameters.
---Source: lua/ge/extensions/editor/api/camera.lua:290
---@return table|nil  {newtonMode, newtonRotation, mass, drag, force, angularDrag, angularForce}, or nil (warning) if the free camera does not exist.
function editor_api_camera_editor.getSmoothCameraParams() end

--- Moves the camera to a bookmark's position and rotation.
---Source: lua/ge/extensions/editor/api/camera.lua:237
---@param objectId integer Id of the bookmark object.
function editor_api_camera_editor.jumpToCameraBookmark(objectId) end

--- Applies to the free camera the transform text read from the clipboard (commands.setFreeCameraTransformJson).
---Source: lua/ge/extensions/editor/api/camera.lua:215
function editor_api_camera_editor.pasteCameraBookmarkFromClipboard() end

--- Places the camera at the player's position (commands.dropCameraAtPlayer).
---Source: lua/ge/extensions/editor/api/camera.lua:60
function editor_api_camera_editor.placeCameraAtPlayer() end

--- Places the camera at the centroid of the object selection (no effect if nothing is selected).
---Source: lua/ge/extensions/editor/api/camera.lua:51
function editor_api_camera_editor.placeCameraAtSelection() end

--- Places the player's vehicle at the camera's position (position only).
---Source: lua/ge/extensions/editor/api/camera.lua:65
function editor_api_camera_editor.placePlayerAtCamera() end

--- Chooses the view's camera: game (commands.setGameCamera) or free (commands.setFreeCamera); remembers the previous type.
---Source: lua/ge/extensions/editor/api/camera.lua:12
---@param type integer editor.CameraType_Game or editor.CameraType_Free.
function editor_api_camera_editor.selectCamera(type) end

--- Sets the free camera's speed (core_camera.setSpeed).
---Source: lua/ge/extensions/editor/api/camera.lua:149
---@param speed number Speed, for example editor.CameraSpeed_Normal.
function editor_api_camera_editor.setCameraSpeed(speed) end

--- Sets the free camera's angular drag.
---Source: lua/ge/extensions/editor/api/camera.lua:269
---@param drag number Angular drag.
function editor_api_camera_editor.setSmoothCameraAngularDrag(drag) end

--- Sets the angular drag from a 0-1 value (same scale).
---Source: lua/ge/extensions/editor/api/camera.lua:283
---@param value number Normalized value.
function editor_api_camera_editor.setSmoothCameraAngularDragNormalized(value) end

--- Sets the free camera's translation drag.
---Source: lua/ge/extensions/editor/api/camera.lua:262
---@param drag number Drag.
function editor_api_camera_editor.setSmoothCameraDrag(drag) end

--- Sets the drag from a 0-1 value (1 gives 5, 0 gives 20).
---Source: lua/ge/extensions/editor/api/camera.lua:276
---@param value number Normalized value.
function editor_api_camera_editor.setSmoothCameraDragNormalized(value) end

--- Enables or sets the free camera's "newton" translation (inertia).
---Source: lua/ge/extensions/editor/api/camera.lua:248
---@param value boolean|number Value passed to core_camera.setNewtonTranslation.
function editor_api_camera_editor.setSmoothCameraMove(value) end

--- Applies smooth free camera parameters and resets the angular velocity to zero.
---Source: lua/ge/extensions/editor/api/camera.lua:307
---@param params table {newtonMode, newtonRotation, drag, mass, force, angularDrag, angularForce}.
function editor_api_camera_editor.setSmoothCameraParams(params) end

--- Enables or sets the free camera's "newton" rotation.
---Source: lua/ge/extensions/editor/api/camera.lua:255
---@param value boolean|number Value passed to core_camera.setNewtonRotation.
function editor_api_camera_editor.setSmoothCameraRotate(value) end

--- Toggles between the current game camera and the editor's free camera.
---Source: lua/ge/extensions/editor/api/camera.lua:30
function editor_api_camera_editor.toggleFreeCamera() end

