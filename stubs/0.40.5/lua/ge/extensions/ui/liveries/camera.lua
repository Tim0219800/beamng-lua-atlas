---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drives the livery editor camera: preset views around the vehicle (top, left, right, back, front), framing the camera on a decal's angle, and a "transform" mode where the camera switches to free camera or orbit while placing a decal. Movements are run in jobs (core_jobsystem) because the camera needs a frame to update. Used by the livery UI via ui_liveries_camera.
--- Access: extension `ui_liveries_camera`: `extensions.load("ui_liveries_camera")`, then the global `ui_liveries_camera`
---@class ui_liveries_camera
---@field dependencies string[] Extensions loaded before this one: editor_api_dynamicDecals.
ui_liveries_camera = {}

--- Switches to the game camera and enables player 0's orbit camera.
---Source: lua/ge/extensions/ui/liveries/camera.lua:157
---@return boolean  Always true.
function ui_liveries_camera.activateOrbitMode() end

--- Forces the camera into orbit during a transform. If it was free, cancels the jobs, stops the movement and, for an existing decal, puts the orbit back on its angle.
---Source: lua/ge/extensions/ui/liveries/camera.lua:383
---@return boolean  false if no transform is active, otherwise true.
function ui_liveries_camera.ensureTransformOrbitMode() end

--- Returns the list of preset views for the UI.
---Source: lua/ge/extensions/ui/liveries/camera.lua:137
---@return table[]  Items { id, labelKey, icon } for top, left, right, back, front.
function ui_liveries_camera.getViews() end

--- Left/right axis input during a transform. In free camera, moves sideways; in orbit, rotates the yaw (rotate_yaw). No effect outside a transform.
---Source: lua/ge/extensions/ui/liveries/camera.lua:456
---@param value number Signed axis value.
---@param filterType any Input filter type passed to core_camera.rotate_yaw.
---@param player any Player passed to core_camera.rotate_yaw (inferred from code).
function ui_liveries_camera.moveLeftRight(value, filterType, player) end

--- Frames the orbit camera on a decal: preset view if the decal is orthographic, otherwise rotates the orbit to the decal's angle without touching the distance.
---Source: lua/ge/extensions/ui/liveries/camera.lua:246
---@param layerUid string Uid of a decal layer with a camera pose.
---@return boolean  false if the layer is unusable.
function ui_liveries_camera.orbitToLayer(layerUid) end

--- Places the free camera at the position and orientation stored in the decal (camPosition, camDirection converted to the vehicle's world frame).
---Source: lua/ge/extensions/ui/liveries/camera.lua:232
---@param layerUid string Uid of a decal-type layer with a camera pose.
---@return boolean  false if the layer is not found or has no camera pose.
function ui_liveries_camera.panToLayer(layerUid) end

--- Up/down axis input during a transform. In free camera, moves up (positive value) or down (negative value); in orbit, rotates the pitch (rotate_pitch). No effect outside a transform.
---Source: lua/ge/extensions/ui/liveries/camera.lua:438
---@param value number Signed axis value.
---@param filterType any Input filter type passed to core_camera.rotate_pitch.
---@param player any Player passed to core_camera.rotate_pitch (inferred from code).
function ui_liveries_camera.panUpDown(value, filterType, player) end

--- Previews a decal: preset view if it is orthographic, otherwise restores the exact angle (free camera: decal pose; orbit active: direct rotation; other camera: switches to orbit).
---Source: lua/ge/extensions/ui/liveries/camera.lua:265
---@param layerUid string Uid of a decal layer with a camera pose.
---@return boolean  false if the layer is unusable.
function ui_liveries_camera.previewLayer(layerUid) end

--- Applies a preset view: switches back to the game camera in orbit mode, sets the vehicle's default rotation then resets the camera, in a job. Triggers liveries_camera_viewApplied at the end.
---Source: lua/ge/extensions/ui/liveries/camera.lua:145
---@param viewId string "top", "left", "right", "back" or "front".
---@return boolean  false (with a warning) if the view is unknown, otherwise true.
function ui_liveries_camera.setView(viewId) end

--- Starts the module: stores the player vehicle's current default orbit rotation to restore it later. No effect if already started.
---Source: lua/ge/extensions/ui/liveries/camera.lua:112
function ui_liveries_camera.setup() end

--- Starts transform mode for a new decal: stores the current camera, then keeps the orbit (mouse placement) or switches to free camera. No effect if a transform is already active.
---Source: lua/ge/extensions/ui/liveries/camera.lua:329
function ui_liveries_camera.startTransform() end

--- Starts transform mode on an existing decal: stores the current camera, then frames the decal in orbit (mouse placement) or in free camera.
---Source: lua/ge/extensions/ui/liveries/camera.lua:300
---@param layerUid string Uid of the decal to edit.
---@return boolean  false if a transform is already active or the layer is unusable.
function ui_liveries_camera.startTransformAtLayer(layerUid) end

--- Ends the transform: cancels the jobs, stops the movements and rotations, switches back to the game camera, restores the stored camera and orbit rotation, then resets the camera.
---Source: lua/ge/extensions/ui/liveries/camera.lua:404
function ui_liveries_camera.stopTransform() end

--- Stops the module: ends the current transform (stopTransform), cancels the camera job, and restores the default orbit rotation stored by setup. No effect if the module is not started.
---Source: lua/ge/extensions/ui/liveries/camera.lua:121
function ui_liveries_camera.teardown() end

--- Toggles between free camera and orbit camera during a transform.
---Source: lua/ge/extensions/ui/liveries/camera.lua:387
---@return boolean  false if no transform is active, otherwise true.
function ui_liveries_camera.toggleTransformCameraMode() end

