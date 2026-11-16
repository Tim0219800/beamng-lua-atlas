---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode camera: FOV, free camera speed, roll, exposure (auto or manual EV), smoothed movement, visibility of the NodeGrabber's fixed nodes, camera bookmarks (absolute in the world or relative to the player vehicle) and camera presets. The module goes through core_camera (via ui_photomode_shared.getCoreCameraFunction) and commands.setFreeCamera to switch to the free camera, and stores the entry state to restore it when leaving photo mode. It serves as the backend of the photo mode UI camera panel.
--- Access: extension `ui_photomode_camera`: `extensions.load("ui_photomode_camera")`, then the global `ui_photomode_camera`
---@class ui_photomode_camera
---@field dependencies string[] {"ui_photomode_shared"}
ui_photomode_camera = {}

--- Switches to the free camera at the start of the session (unless the entry camera is "path" or the free camera is already active) and notes that the entry camera must be restored on exit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/camera.lua:485
function ui_photomode_camera.activateSessionFreeCamera() end

--- Applies a camera preset: refuses a scene preset from another level (preset_level_mismatch), restores the bookmark or applies FOV and roll, then speed, smoothing and exposure.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1225
---@param state table Preset state
---@return table  {state} or {ok = false, reason}
function ui_photomode_camera.applyPresetState(state) end

--- Subset of the state to write into a photo's metadata: pos, rot, fov, speed, yawDeg, pitchDown, rollDeg.
---Source: lua/ge/extensions/ui/photomode/camera.lua:784
---@return table  Camera data
function ui_photomode_camera.buildMetadataState() end

--- Builds the camera state: sessionActive, bookmark availability, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement.
---Source: lua/ge/extensions/ui/photomode/camera.lua:751
---@return table  Camera state
function ui_photomode_camera.buildState() end

--- "Default" preset built from the state captured at session entry (fov, roll, speed, smoothing, exposure, levelId), or nil if no session was captured.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1207
---@return table|nil  Default state
function ui_photomode_camera.captureDefaultPresetState() end

--- Stores the visibility of the NodeGrabber's fixed nodes then hides them for the session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/camera.lua:436
function ui_photomode_camera.captureNodeGrabberRestoreState() end

--- Camera state to save in a preset. "vehicle" type: bookmark relative to the vehicle (nil if unavailable); "scene" type (default): absolute position and levelId. Also includes speed, smoothMovement, autoExposure, manualEV.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1170
---@param options table|nil {cameraPresetType = "vehicle"|"scene"}
---@return table|nil  Preset state
function ui_photomode_camera.capturePresetState(options) end

--- Captures the camera state at session entry (pos, rot, fov, speed, roll, smoothing, exposure, name of the active camera). Called at the start of a photo mode session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/camera.lua:467
function ui_photomode_camera.captureRestoreState() end

--- Returns the current camera state (same as buildState).
---Source: lua/ge/extensions/ui/photomode/camera.lua:1166
---@return table  Camera state
function ui_photomode_camera.getCameraState() end

--- Converts the scene's CameraBookmark objects (scenetree.findClassObjects) into temporary presets of type camera (id __cameraBookmark_<id>, source cameraBookmark, absolute position). Empty list if the API is unavailable.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1314
---@return table[]  Temporary presets
function ui_photomode_camera.getTemporaryPresetList() end

--- Resets to default values: smoothed movement off, speed 15, roll 0, automatic exposure with manual EV 10. Switches to the free camera if necessary.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1129
---@return table  {state} or {ok = false, reason}
function ui_photomode_camera.resetCameraDefaults() end

--- Moves the free camera to a bookmark (absolute: pos, rot, fov; or relative: offset, rotOffset, fov computed relative to the player vehicle). Switches to the free camera if needed. Accepts a {camera = {...}} bookmark or the content directly.
---Source: lua/ge/extensions/ui/photomode/camera.lua:985
---@param bookmark table Absolute or relative bookmark
---@return table  {state} or {ok = false, reason}
function ui_photomode_camera.restoreCameraBookmark(bookmark) end

--- Restores the fixed nodes visibility stored at the start of the session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/camera.lua:452
function ui_photomode_camera.restoreNodeGrabberState() end

--- Restores the saved absolute bookmark.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1106
---@return table  Result of restoreCameraBookmark, or {ok = false, reason = "bookmark_unavailable"}
function ui_photomode_camera.restoreSavedFreeCameraBookmark() end

--- Restores the saved vehicle-relative bookmark; clears it if invalid.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1117
---@return table  Result of restoreCameraBookmark, or {ok = false, reason = "bookmark_unavailable"}
function ui_photomode_camera.restoreSavedRelativeCameraBookmark() end

--- Puts the free camera back at the position/rotation (and FOV) captured at the start of the session.
---Source: lua/ge/extensions/ui/photomode/camera.lua:797
---@return table  {state} or {ok = false, reason}
function ui_photomode_camera.restoreSessionCameraTransformState() end

--- Restores the captured entry camera mode, FOV, speed, roll, smoothing and exposure. Called at the end of the session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/camera.lua:703
function ui_photomode_camera.restoreState() end

--- Saves the current camera position as the session bookmark: an absolute bookmark, and a bookmark relative to the player vehicle if it can be computed.
---Source: lua/ge/extensions/ui/photomode/camera.lua:899
---@return table  {state} or {ok = false, reason = "camera_state_unavailable", state}
function ui_photomode_camera.saveCurrentCameraBookmark() end

--- Changes the camera's exposure: autoExposure (boolean) and/or manualEV (-20 to 20).
---Source: lua/ge/extensions/ui/photomode/camera.lua:930
---@param partialState table {autoExposure?, manualEV?}
---@return table  {state} or {ok = false, reason, state}
function ui_photomode_camera.setCameraExposureState(partialState) end

--- Sets the FOV (clamped to 10-120 degrees). Uses the free camera (id 0) or the player vehicle. Refused with the "path" camera.
---Source: lua/ge/extensions/ui/photomode/camera.lua:914
---@param value number FOV in degrees
---@return table  {value} on success, otherwise {ok = false, reason, value}
function ui_photomode_camera.setCameraFov(value) end

--- Sets the free camera's roll (-90 to 90 degrees) keeping the current yaw and pitch.
---Source: lua/ge/extensions/ui/photomode/camera.lua:969
---@param value number Roll in degrees
---@return table  {value} or {ok = false, reason, value}
function ui_photomode_camera.setCameraRoll(value) end

--- Enables or disables the free camera's smoothed movement (setting cameraFreeSmoothMovement) and notifies the UI of the settings.
---Source: lua/ge/extensions/ui/photomode/camera.lua:1349
---@param value boolean|table Boolean, or table whose smoothMovement field is read
---@return table  {value, state} or {ok = false, reason, state}
function ui_photomode_camera.setCameraSmoothMovement(value) end

--- Sets the camera's movement speed (clamped to 2-300).
---Source: lua/ge/extensions/ui/photomode/camera.lua:953
---@param value number Camera speed
---@return table  {value} or {ok = false, reason, value}
function ui_photomode_camera.setCameraSpeed(value) end

--- Shows or hides the NodeGrabber's fixed nodes (Engine.NodeGrabber_setFixedNodesVisible).
---Source: lua/ge/extensions/ui/photomode/camera.lua:1329
---@param value boolean|table Boolean, or table whose nodeGrabberVisible field is read
---@return table  {value, state} or {ok = false, reason, state}
function ui_photomode_camera.setNodeGrabberVisible(value) end

