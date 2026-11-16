---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (core_camera, depends on core_vehicle_manager and core_environment): central manager of all the game's cameras. It loads the camera modes from the lua/ge/extensions/core/cameraModes folder (one file per mode), creates for each vehicle an instance of each mode (configured by the jbeam 'camera' section) and manages 'global' instances (free, observer, path, bigMap...) that exist once without a vehicle. It decides which camera is active (per player), handles the user configuration (camera order and activation, Options > Cameras menu, saved in the cameraConfig and freeCameraConfig settings), camera cycling (keys), transitions, and exposes the final position/orientation/FOV. The per-frame computation is in core/cameraUpdate.lua, the inputs in core/cameraInput.lua (re-exposed here). A modder uses it to read the camera position, change camera by name, drive the free camera or create extra views (contexts).
--- Access: extension `core_camera`: `extensions.load("core_camera")`, then the global `core_camera`
---@class core_camera
---@field cameraZoom any
---@field dependencies table<integer, string> Extensions loaded before: core_vehicle_manager, core_environment.
---@field getLastCameraMovementType any
---@field getLastFilter any
---@field moveForwardBackward any
---@field moveLeftRight any
---@field movebackward any
---@field movedown any
---@field moveforward any
---@field moveleft any
---@field moveright any
---@field moveup any
---@field objectTeleported function Deprecated alias of the global objectTeleported (utils.lua).
---@field pitchAbs any
---@field rollAbs any
---@field rotate_pitch any
---@field rotate_pitch_down any
---@field rotate_pitch_relative any
---@field rotate_pitch_up any
---@field rotate_roll_left any
---@field rotate_roll_right any
---@field rotate_yaw any
---@field rotate_yaw_left any
---@field rotate_yaw_relative any
---@field rotate_yaw_right any
---@field speedFactor number Speed factor (1 by default) used to correct a camera movement that is too slow/smoothed when creating thumbnails.
---@field timeSinceLastRotation any
---@field xAxisAbs any
---@field yAxisAbs any
---@field yAxisMoveStep any
---@field yawAbs any
---@field zAxisAbs any
core_camera = {}

--- Moves a free camera in the 'world' cameras configuration and saves (freeCameraConfig setting).
---Source: lua/ge/extensions/core/camera.lua:622
---@param camId integer Index in the free configuration
---@param offset integer Offset
function core_camera.changeFreeCameraOrder(camId, offset) end

--- Moves the camera at index camId by offset positions in the configuration list (skipping hidden cameras), then saves.
---Source: lua/ge/extensions/core/camera.lua:586
---@param camId integer Index in the configuration (1-based)
---@param offset integer Offset, e.g. -1 or +1
function core_camera.changeOrder(camId, offset) end

--- Multiplies or divides the main view's camera speed by (1 + 0.2*|val|) depending on the sign, clamped between 2 and 100, and displays a message. Ignored if camera zoom is disabled in the editor.
---Source: lua/ge/extensions/core/camera.lua:1879
---@param val number Signed change (wheel)
function core_camera.changeSpeed(val) end

--- Cancels the angular movement of the player's camera.
---Source: lua/ge/extensions/core/camera.lua:1447
---@param pid integer|nil Player/view
function core_camera.clearAngularMotion(pid) end

--- Resets the rotation and zoom inputs (roll, pitch, yaw, zoom) of a MoveManager structure. Used by other GE scripts.
---Source: lua/ge/extensions/core/camera.lua:574
---@param mm table|nil Input structure, default MoveManager
function core_camera.clearInputs(mm) end

--- Cancels the movement (velocity) of the player's camera (cam:clearMotion).
---Source: lua/ge/extensions/core/camera.lua:1443
---@param pid integer|nil Player/view
function core_camera.clearMotion(pid) end

--- Creates (or updates) an extra camera context = a camera output with its own RenderView, reusing all camera modes. The identifier 'main' (or nil) returns the main context. The render target (resolution, texture) is managed by the caller. vehiclePlayer lets the view show another seat's vehicle while player only provides the input.
---Source: lua/ge/extensions/core/camera.lua:1908
---@param id string Context identifier
---@param renderView string|nil RenderView name (id by default)
---@param player integer|nil Player/seat whose view follows the inputs (0 by default)
---@param vehiclePlayer integer|nil Seat whose vehicle is taken (optional)
---@return table  Context (internal table)
function core_camera.createContext(id, renderView, player, vehiclePlayer) end

--- Switches to the next camera group (game cameras, then 'world' free cameras, then back), enters the first camera of the group, emits onCameraToggled and displays the name.
---Source: lua/ge/extensions/core/camera.lua:693
---@param player integer|nil Player index
function core_camera.cycleCameraGroup(player) end

--- Destroys an extra context (never the main one) and empties the main context's camera cache.
---Source: lua/ge/extensions/core/camera.lua:1923
---@param id string Context identifier
function core_camera.destroyContext(id) end

--- Sends the current camera name to the UI (Messages app) with the number of options and the current index. Does nothing for a unicycle (walking).
---Source: lua/ge/extensions/core/camera.lua:412
---@param player integer|nil Player index
function core_camera.displayCameraNameUI(player) end

--- Toggles the driver camera zoom between 0 and 1.
---Source: lua/ge/extensions/core/camera.lua:1803
---@param player integer|nil Player index
function core_camera.driverZoomToggle(player) end

--- Compatibility: leaves the global camera (setGlobalCameraByName(nil)).
---Source: lua/ge/extensions/core/camera.lua:2096
function core_camera.exitCinematicCamera() end

--- Name of the player's active camera: global camera if active, otherwise vehicle camera (or the pending requested one). nil if the player has no vehicle.
---Source: lua/ge/extensions/core/camera.lua:939
---@param player integer|nil Player index
---@return string|nil  Camera name
function core_camera.getActiveCamName(player) end

--- Name of a vehicle's focused camera (main view).
---Source: lua/ge/extensions/core/camera.lua:958
---@param vehId integer Vehicle id
---@return string|nil  Camera name
function core_camera.getActiveCamNameByVehId(vehId) end

--- Name of the global camera active for the player, nil if it is a vehicle camera.
---Source: lua/ge/extensions/core/camera.lua:1893
---@param player integer|nil Player index
---@return string|nil  Global camera name
function core_camera.getActiveGlobalCameraName(player) end

--- Returns the camera instances of a vehicle.
---Source: lua/ge/extensions/core/camera.lua:899
---@param vid integer Vehicle id
---@param ctxId string|nil Context identifier (nil = main)
---@return table<string, table>|nil  Cameras by name, nil if the vehicle is unknown
function core_camera.getCameraDataById(vid, ctxId) end

--- Current driver camera zoom.
---Source: lua/ge/extensions/core/camera.lua:1799
---@param player integer|nil Player index
---@return number|nil  Zoom
function core_camera.getCameraDriverZoom(player) end

--- Sorted list of camera group names that have at least one usable camera.
---Source: lua/ge/extensions/core/camera.lua:304
---@param ctx table|nil Internal context (nil = main)
---@return table<integer, string>  Group names
function core_camera.getCameraGroups(ctx) end

--- Deep copy of the vehicle camera configuration list ({name, enabled}).
---Source: lua/ge/extensions/core/camera.lua:382
---@return table  List of {name, enabled}
function core_camera.getConfigurationReadOnly() end

--- Adjustable settings of a context's active camera, for the camera control UI / video stream. Each mode provides its list via listParams; descriptors {key, title, kind ('range'|'bool'|'choice'|'slots'), type ('float'|'int'|'bool'|'enum'), value, icon, default, min, max, step, unit, options}.
---Source: lua/ge/extensions/core/camera.lua:2023
---@param id string|nil Context identifier
---@return table  List of descriptors (empty if none)
function core_camera.getContextCameraParams(id) end

--- Lightweight serializable (JSON) snapshot of a context's camera: name, world pose (pos, rot, fov) and the mode's own state (data, via cam:serialize) so it can be restored.
---Source: lua/ge/extensions/core/camera.lua:1983
---@param id string|nil Context identifier (nil = main)
---@return table|nil  {cam, pos={x,y,z}, rot={x,y,z,w}, fov, data}
function core_camera.getContextCameraState(id) end

--- Identifier of the view through which this player looks, usable with the get*(ctxId) getters. nil = main view.
---Source: lua/ge/extensions/core/camera.lua:1942
---@param player integer|nil Player index
---@return string|nil  Context identifier or nil
function core_camera.getContextIdForPlayer(player) end

--- List of context identifiers ('main' first).
---Source: lua/ge/extensions/core/camera.lua:1935
---@return table<integer, string>  Identifiers
function core_camera.getContextIds() end

--- Name of the driver camera: 'driver' (if 'onboard.driver' exists) or the name of an 'occupant.*' camera in 'driver' permission mode.
---Source: lua/ge/extensions/core/camera.lua:923
---@param vehId integer Vehicle id
---@param ctxId string|nil Context
---@return string|nil  Driver camera name
function core_camera.getDriverCameraNameById(vehId, ctxId) end

--- Like getDriverDataById from a vehicle object.
---Source: lua/ge/extensions/core/camera.lua:935
---@param veh userdata|nil Vehicle
---@param ctxId string|nil Context
---@return integer|nil  camNodeID
---@return boolean  rightHandCamera
---@return boolean  rightHandDoor
function core_camera.getDriverData(veh, ctxId) end

--- Driver camera data of a vehicle.
---Source: lua/ge/extensions/core/camera.lua:927
---@param vehId integer Vehicle id
---@param ctxId string|nil Context
---@return integer|nil  camNodeID (node of the driver viewpoint)
---@return boolean  rightHandCamera
---@return boolean  rightHandDoor
function core_camera.getDriverDataById(vehId, ctxId) end

--- Camera 'forward' vector (y axis rotated by the orientation).
---Source: lua/ge/extensions/core/camera.lua:1833
---@param ctxId string|nil Context
---@return vec3  Forward vector
function core_camera.getForward(ctxId) end

--- Forward vector as separate components (uses a reused internal vec3).
---Source: lua/ge/extensions/core/camera.lua:1840
---@param ctxId string|nil Context
---@return number  x
---@return number  y
---@return number  z
function core_camera.getForwardXYZ(ctxId) end

--- Final field of view in degrees.
---Source: lua/ge/extensions/core/camera.lua:1871
---@param ctxId string|nil Context
---@return number  FOV (deg)
function core_camera.getFovDeg(ctxId) end

--- Final field of view in radians.
---Source: lua/ge/extensions/core/camera.lua:1875
---@param ctxId string|nil Context
---@return number  FOV (rad)
function core_camera.getFovRad(ctxId) end

--- Deep copy of the configuration (order, activation) of the free cameras of the 'world' group.
---Source: lua/ge/extensions/core/camera.lua:386
---@return table  List of {name, enabled}
function core_camera.getFreeCameraConfigurationReadOnly() end

--- Returns the name -> instance table of the global cameras (once per context, created on demand from the constructors where cam.isGlobal is true).
---Source: lua/ge/extensions/core/camera.lua:199
---@param ctx table|nil Internal context (nil = main); external calls usually omit the argument
---@return table<string, table>  Global cameras by name
function core_camera.getGlobalCameras(ctx) end

--- List of camera names of a group (e.g. 'world'), in the configured order. Disabled 'world' cameras are omitted unless includeDisabled is true (they remain visible in the options but are skipped when cycling).
---Source: lua/ge/extensions/core/camera.lua:277
---@param ctx table|nil Internal context (nil = main)
---@param groupName string Group name, e.g. 'world'
---@param includeDisabled boolean|nil Include disabled cameras
---@return table<integer, string>  Camera names
function core_camera.getGroupCams(ctx, groupName, includeDisabled) end

--- 'Look backward' state of the main view.
---Source: lua/ge/extensions/core/camera.lua:1783
---@return boolean|nil  State
function core_camera.getLookBack() end

--- Final camera position (copy).
---Source: lua/ge/extensions/core/camera.lua:1812
---@param ctxId string|nil Context (nil = player view)
---@return vec3  World position (m)
function core_camera.getPosition(ctxId) end

--- Final position as separate components (avoids allocation).
---Source: lua/ge/extensions/core/camera.lua:1816
---@param ctxId string|nil Context
---@return number  x
---@return number  y
---@return number  z
function core_camera.getPositionXYZ(ctxId) end

--- Final camera orientation (copy).
---Source: lua/ge/extensions/core/camera.lua:1846
---@param ctxId string|nil Context
---@return quat  Orientation
function core_camera.getQuat(ctxId) end

--- Orientation as separate components.
---Source: lua/ge/extensions/core/camera.lua:1866
---@param ctxId string|nil Context
---@return number  x
---@return number  y
---@return number  z
---@return number  w
function core_camera.getQuatXYZW(ctxId) end

--- Camera 'right' vector (x axis rotated by the orientation).
---Source: lua/ge/extensions/core/camera.lua:1827
---@param ctxId string|nil Context
---@return vec3  Right vector
function core_camera.getRight(ctxId) end

--- Movement speed of a context's free camera (30 by default).
---Source: lua/ge/extensions/core/camera.lua:1774
---@param ctxId string|nil Context
---@return number|nil  Speed
function core_camera.getSpeed(ctxId) end

--- Camera 'up' vector (z axis rotated by the orientation).
---Source: lua/ge/extensions/core/camera.lua:1821
---@param ctxId string|nil Context
---@return vec3  Up vector
function core_camera.getUp(ctxId) end

--- Yaw, pitch and roll of the main camera in one call.
---Source: lua/ge/extensions/core/camera.lua:1851
---@return table  {yawDeg, pitchDown (positive = downward), rollDeg}
function core_camera.getYawPitchRoll() end

--- Calls the method functionName of a named global camera. Logs an error if the camera or the method does not exist.
---Source: lua/ge/extensions/core/camera.lua:1463
---@param globalCameraName string Global camera name
---@param functionName string Method name
---@param ... any Arguments
---@return any  Return of the method
function core_camera.globalCameraFunction(globalCameraName, functionName, ...) end

--- Forwards a shortcut key to the active camera (the mode's hotkey method).
---Source: lua/ge/extensions/core/camera.lua:1546
---@param player integer|nil Player index
---@param hotkeyid any Shortcut identifier
---@param modifier any Modifier
---@return any  Return of the camera
function core_camera.hotkey(player, hotkeyid, modifier) end

--- Tests whether a camera position is inside the player's vehicle (within its oriented box and within 0.6 m of an 'inside' viewpoint of a camera).
---Source: lua/ge/extensions/core/camera.lua:881
---@param player integer|nil Player index
---@param camPos vec3 Position to test (m)
---@return integer  1 if inside, 0 otherwise (also 0 without a vehicle or on a unicycle)
function core_camera.isCameraInside(player, camPos) end

--- Tests whether the player's active camera belongs to the 'world' group (free cameras).
---Source: lua/ge/extensions/core/camera.lua:1973
---@param player integer|nil Player index
---@return boolean  true if 'world' camera
function core_camera.isWorldCamera(player) end

--- Computes the next group in the cycle ring: game cameras (active = nil) to the first group, between groups, then from the last group to the game cameras (nil). active = false (system camera) returns nil.
---Source: lua/ge/extensions/core/camera.lua:324
---@param groups table<integer, string> Group names
---@param active string|boolean|nil Active group: nil = game camera, false = camera without group
---@return string|nil  Next group or nil (back to game cameras)
function core_camera.nextCameraGroup(groups, active) end

--- Notifies the UI and extensions of the camera change: guihooks 'onCameraNameChanged', hook onCameraModeChanged, then updates the options menu.
---Source: lua/ge/extensions/core/camera.lua:557
---@param vdata table|nil Vehicle camera data (player 0 by default)
---@param forcedCamName string|nil Name to announce instead of the focused camera
function core_camera.notifyUI(vdata, forcedCamName) end

--- Hook (emitted by cycleCameraGroup, setCameraByNameFromOptions): redisplays player 0's camera name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:488
---@param data table {cameraType = 'FreeCam'|'GameCam'}
function core_camera.onCameraToggled(data) end

--- Hook called at the end of the level: detaches the camera from the 'main' RenderView to avoid a dead reference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1749
function core_camera.onClientEndMission() end

--- Hook called after the level starts: delegated to core/cameraUpdate.lua. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:dyn
function core_camera.onClientPostStartMission() end

--- Restore hook after Lua reload (merges the serialized state into the existing cameras).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1694
---@param data table Data from onSerialize
function core_camera.onDeserialized(data) end

--- Hook called when an object is deleted: removes its camera data if it is not a reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1582
---@param vid integer Identifier
---@param isReloading boolean true on a reload
function core_camera.onDespawnObject(vid, isReloading) end

--- Hook called when a file changes: adding/removing a cameraModes file invalidates the caches (hot reload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1743
---@param filePath string File path
---@param changeType string 'added', 'deleted', 'modified'...
function core_camera.onFileChanged(filePath, changeType) end

--- Hook called when the mouse is locked/unlocked: forwarded to the active camera (mouseLocked), except in free camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1576
---@param locked boolean true if locked
function core_camera.onMouseLocked(locked) end

--- Hook called just before rendering: updates the camera (cameraUpdate.onPreRender), then displays the pending camera name after a vehicle change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1655
---@param ... any dtReal, dtSim, dtRaw (inferred from cameraUpdate)
function core_camera.onPreRender(...) end

--- Hook called when the replay state changes: on leaving playback ('playback' to 'inactive'), empties the vehicle camera cache (vehicles deleted by the replay would otherwise be lost).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:2203
---@param newState table Table with the state field
function core_camera.onReplayStateChanged(newState) end

--- Hook called when the scenario state changes: propagated to the cameras; if a trigger was pending and the scenario goes to 'running', it is replayed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1632
---@param ... any
function core_camera.onScenarioChange(...) end

--- Hook called when a scenario restarts: propagated to all cameras.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1628
---@param ... any Hook arguments
function core_camera.onScenarioRestarted(...) end

--- Serialization hook before Lua reload: serializes the global and vehicle cameras, the active global camera, the last vehicle, the pending trigger and the camera requests.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1663
---@return table  Data to restore
function core_camera.onSerialize() end

--- Hook called when settings change: applies free camera smoothing and propagates onSettingsChanged to all cameras.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1610
---@param ... any Hook arguments
function core_camera.onSettingsChanged(...) end

--- Hook called by BeamNG triggers: if the subject is the player's vehicle (or the triggerOverride), 'enter' with cameraOnEnter switches to the 'observer' global camera pointing at this camera object, and 'exit' with cameraOnLeave leaves it. While a scenario is starting, the request is held until the 'running' state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1481
---@param trigger table {subjectID, event, cameraOnEnter, cameraOnLeave, triggerOverride...}
function core_camera.onTrigger(trigger) end

--- Hook called when a vehicle is destroyed: removes its camera data from all contexts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:177
---@param vid integer Identifier
function core_camera.onVehicleDestroyed(vid) end

--- Hook called when a vehicle is replaced (new config): recreates its cameras.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:169
---@param vid integer Vehicle id
function core_camera.onVehicleReplaced(vid) end

--- Hook called when a vehicle is reset: propagates to the vehicle's cameras and resets the focused camera unless resetCameraOnVehicleReset is false or a global camera is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1563
---@param vid integer Vehicle id
---@param ... any Arguments
function core_camera.onVehicleResetted(vid, ...) end

--- Hook called when a vehicle is created: creates its camera data in each context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:161
---@param vid integer Vehicle id
function core_camera.onVehicleSpawned(vid) end

--- Hook called when the player switches vehicle: starts a transition (except for a global camera), propagates to the cameras and schedules the name display. Ignores players other than 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.lua:1644
---@param oldId integer Old vehicle
---@param newId integer New vehicle
---@param player integer Player
function core_camera.onVehicleSwitched(oldId, newId, player) end

--- (Re)creates the camera instances of a vehicle from its jbeam data (cameraData), updates the shared configuration (order, activation, saved by the main context), then chooses the camera: pending request, otherwise previous camera, otherwise first enabled and visible camera, otherwise first existing one. Returns false if the vehicle data is not available yet.
---Source: lua/ge/extensions/core/camera.lua:1021
---@param vid integer Vehicle id
---@param vdata table Vehicle camera data table (modified)
---@param focusedCamNamePrevious string|nil Name of the previously focused camera
---@param ctx table|nil Internal context (nil = main)
---@return boolean  true if handled
function core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx) end

--- Calls the method fct on player 0's active camera (global or focused).
---Source: lua/ge/extensions/core/camera.lua:1476
---@param fct string Method name
---@param ... any Arguments
---@return any  Return of the method
function core_camera.proxy_Player(fct, ...) end

--- Requests sending the current configuration to the Options > Cameras menu (guihooks CameraConfigChanged).
---Source: lua/ge/extensions/core/camera.lua:568
---@param forcedCamName string|nil Camera name to mark as active
function core_camera.requestConfig(forcedCamName) end

--- Resets the player view's inputs, emits the onCameraReset hook and calls reset() on the active camera.
---Source: lua/ge/extensions/core/camera.lua:1540
---@param player integer|nil Player index
---@return any  Return of reset
function core_camera.resetCamera(player) end

--- Calls reset() on the camera (active global or the vehicle's focused one) of the main view.
---Source: lua/ge/extensions/core/camera.lua:1359
---@param vid integer|table Vehicle id, or table {vehId, camName}
---@param ... any Arguments passed to reset
---@return any  Return of the camera method
function core_camera.resetCameraByID(vid, ...) end

--- Clears the cameraConfig and freeCameraConfig settings and recomputes the configuration for all vehicles.
---Source: lua/ge/extensions/core/camera.lua:1617
function core_camera.resetConfiguration() end

--- Selects a camera by name. Flexible signature: setByName(player, camName, withTransition, customData) if the first argument is a number, otherwise setByName(camName, withTransition, customData). A global camera name (or nil) acts on the global view; otherwise it is the player's vehicle camera.
---Source: lua/ge/extensions/core/camera.lua:838
---@param ... any [player,] camName, withTransition, customData
function core_camera.setByName(...) end

--- Selects the camera associated with a shortcut number (keys 1 to 9, slotId computed over the visible cameras).
---Source: lua/ge/extensions/core/camera.lua:977
---@param player integer|nil Player index
---@param slotId integer Slot number
function core_camera.setBySlotId(player, slotId) end

--- Selection from the Options menu: a 'world' group camera goes through enterGroupCam (and the onCameraToggled FreeCam hook), otherwise it is a vehicle camera. Displays the name if the selection succeeds.
---Source: lua/ge/extensions/core/camera.lua:851
---@param player integer|nil Player index
---@param camName string Camera name
---@return boolean  true if selected
function core_camera.setCameraByNameFromOptions(player, camName) end

--- Sets the driver camera zoom.
---Source: lua/ge/extensions/core/camera.lua:1795
---@param value number 0 or 1 (threshold 0.5)
---@param player integer|nil Player index
function core_camera.setCameraDriverZoom(value, player) end

--- Sets the zoom of the walking camera (unicycle).
---Source: lua/ge/extensions/core/camera.lua:1787
---@param value number 0 or 1 (inferred from code: threshold at 0.5)
---@param player integer|nil Player index
function core_camera.setCameraUnicycleZoom(value, player) end

--- Selects a camera on a context without touching the player. camName nil or global camera name: global camera (initialized with the view's current pose); otherwise the vehicle camera of the context's player.
---Source: lua/ge/extensions/core/camera.lua:1949
---@param id string|nil Context identifier (nil = main)
---@param camName string|nil Camera name
---@param withTransition boolean|nil Transition
---@param customData any Data passed to setCustomData
---@return any  No useful return (the internal function returns nothing)
function core_camera.setContextCamera(id, camName, withTransition, customData) end

--- Applies a setting to a context's active camera by delegating to cam:setParam(key, value, id).
---Source: lua/ge/extensions/core/camera.lua:2032
---@param id string|nil Context identifier
---@param key string Setting key (e.g. 'fov')
---@param value any New value
function core_camera.setContextCameraParam(id, key, value) end

--- Restores a context's camera from a getContextCameraState snapshot. A mode with deserialize restores its state; a free/global camera without deserialize is put back at the saved pose.
---Source: lua/ge/extensions/core/camera.lua:2002
---@param id string|nil Context identifier
---@param state table Snapshot
function core_camera.setContextCameraState(id, state) end

--- Delegates cam:setDefaultDistance(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1407
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... number Default distance (m)
---@return any  Return of the camera
function core_camera.setDefaultDistance(vid, ...) end

--- Delegates cam:setDefaultRotation(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1419
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Default rotation
---@return any  Return of the camera
function core_camera.setDefaultRotation(vid, ...) end

--- Delegates cam:setDistance(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1411
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... number Distance (m)
---@return any  Return of the camera
function core_camera.setDistance(vid, ...) end

--- Sets the field of view (degrees). If 'free' is active, also applies it to the engine; then cam:setFOV(...).
---Source: lua/ge/extensions/core/camera.lua:1375
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... number FOV in degrees
---@return any  Return of the camera
function core_camera.setFOV(vid, ...) end

--- Enables the fast speed modifier (key) of the main view.
---Source: lua/ge/extensions/core/camera.lua:1757
---@param enabled boolean true to go faster
function core_camera.setFastSpeedModifier(enabled) end

--- Orients the free camera (only active if the 'free' global camera is active) from yaw, pitch (positive = looking down) and roll in degrees; cancels the angular velocity.
---Source: lua/ge/extensions/core/camera.lua:1233
---@param yawDeg number Yaw (0 = +Y axis)
---@param pitchDownDeg number Pitch downward (deg)
---@param rollDeg number Roll (deg)
function core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg) end

--- Activates a global camera by name, or switches back to the vehicle camera with nil. Calls onCameraChanged(false) on the old one and setCustomData + onCameraChanged(true) on the new one; in the main view, emits the onGlobalCameraSet hook. No effect if the name is unknown or if there is no vehicle to return to the vehicle camera.
---Source: lua/ge/extensions/core/camera.lua:639
---@param name string|nil Global camera name, nil to leave
---@param withTransition boolean|nil Not used in the code (inferred from code)
---@param customData table|nil Data passed to cam:setCustomData
---@param ctx table|nil Internal context (nil = main)
function core_camera.setGlobalCameraByName(name, withTransition, customData, ctx) end

--- Forces all camera inputs to target the given player (nil to disable this redirection).
---Source: lua/ge/extensions/core/camera.lua:105
---@param player integer|nil Index of the targeted player
function core_camera.setInputTargetPlayer(player) end

--- Enables/disables looking backward for the player.
---Source: lua/ge/extensions/core/camera.lua:1779
---@param player integer|nil Player index
---@param enabled boolean true to look behind
function core_camera.setLookBack(player, enabled) end

--- Delegates cam:setMaxDistance(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1415
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... number Maximum distance (m)
---@return any  Return of the camera
function core_camera.setMaxDistance(vid, ...) end

--- Enables/disables the 'Newton' (inertia) mode for free camera rotation.
---Source: lua/ge/extensions/core/camera.lua:1455
---@param pid integer|nil Player/view
---@param ... any Mode argument
function core_camera.setNewtonRotation(pid, ...) end

--- Enables/disables the 'Newton' (inertia) mode for free camera translation.
---Source: lua/ge/extensions/core/camera.lua:1459
---@param pid integer|nil Player/view
---@param ... any Mode argument
function core_camera.setNewtonTranslation(pid, ...) end

--- Delegates cam:setOffset(...) to the main view's camera.
---Source: lua/ge/extensions/core/camera.lua:1387
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Camera mode arguments
---@return any  Return of the camera
function core_camera.setOffset(vid, ...) end

--- Places the free camera at a position (and optional quaternion orientation). No effect if the free camera is not active.
---Source: lua/ge/extensions/core/camera.lua:1761
---@param pid integer Player
---@param px number x (m)
---@param py number y (m)
---@param pz number z (m)
---@param rx number|nil Quaternion x
---@param ry number|nil Quaternion y
---@param rz number|nil Quaternion z
---@param rw number|nil Quaternion w
function core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw) end

--- Sets the camera position (vec3 as the first extra argument). If the 'free' global camera is active in the main view, the position is also applied directly to the engine; then cam:setPosition(...) is called.
---Source: lua/ge/extensions/core/camera.lua:1430
---@param pid integer|nil Player/view
---@param ... vec3 World position (m)
---@return any  Return of the camera
function core_camera.setPosition(pid, ...) end

--- Delegates cam:setRef(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1399
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Arguments
---@return any  Return of the camera
function core_camera.setRef(vid, ...) end

--- Delegates cam:setRefNodes(...) (center, left, rear reference nodes).
---Source: lua/ge/extensions/core/camera.lua:1395
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Reference nodes
---@return any  Return of the camera
function core_camera.setRefNodes(vid, ...) end

--- Sets the camera orientation. If the 'free' global camera is active, also applies the rotation (quat) directly to the engine; then calls cam:setRotation(...).
---Source: lua/ge/extensions/core/camera.lua:1363
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Rotation (quat) and other arguments
---@return any  Return of the camera
function core_camera.setRotation(vid, ...) end

--- Delegates cam:setSkipFovModifier(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1423
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... boolean Skip the FOV modifier
---@return any  Return of the camera
function core_camera.setSkipFovModifier(vid, ...) end

--- Enables/disables free camera smoothing (cam:setSmoothedCam).
---Source: lua/ge/extensions/core/camera.lua:1451
---@param pid integer|nil Player/view
---@param ... boolean Enable smoothing
function core_camera.setSmoothedCam(pid, ...) end

--- Sets the movement speed of the free camera.
---Source: lua/ge/extensions/core/camera.lua:1769
---@param speed number Speed (m/s)
---@param ctxId string|nil Context
function core_camera.setSpeed(speed, ctxId) end

--- Delegates cam:setTargetMode(...) to the camera.
---Source: lua/ge/extensions/core/camera.lua:1403
---@param vid integer|table Vehicle id or {vehId, camName}
---@param ... any Arguments
---@return any  Return of the camera
function core_camera.setTargetMode(vid, ...) end

--- Switches to the next (offset = 1) or previous (-1) camera, skipping hidden/disabled ones. In a group's global camera, cycles within that group. Used by input actions.
---Source: lua/ge/extensions/core/camera.lua:1275
---@param player integer|nil Player index
---@param offset integer +1 or -1
function core_camera.setVehicleCameraByIndexOffset(player, offset) end

--- Selects a vehicle camera for the vehicle with id vehId. If the vehicle data is not ready yet, the request is stored and applied later.
---Source: lua/ge/extensions/core/camera.lua:800
---@param vehId integer Vehicle id
---@param name string Camera name
---@param withTransition boolean|nil Starts a transition
---@param customData any Passed to cam:setCustomData if present
---@param ctx table|nil Internal context (nil = main)
---@return boolean|nil  true if changed, false otherwise
function core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx) end

--- Blends the current point of view into the camera's view for this frame. To call right after a camera change. duration overrides the configured duration.
---Source: lua/ge/extensions/core/camera.lua:669
---@param duration number|nil Blend duration in seconds
---@param player integer|nil Player/view (nil = main)
function core_camera.startCameraTransition(duration, player) end

--- Enables or disables the vehicle camera at index camId in the cycle (compatibility) then saves the configuration.
---Source: lua/ge/extensions/core/camera.lua:613
---@param camId integer Index in the configuration
function core_camera.toggleEnabledById(camId) end

--- Enables/disables a free camera of the 'world' group in the cycle and saves.
---Source: lua/ge/extensions/core/camera.lua:631
---@param camId integer Index in the free configuration
function core_camera.toggleFreeCameraEnabledById(camId) end

--- Toggles the walking camera zoom between 0 and 1.
---Source: lua/ge/extensions/core/camera.lua:1807
---@param player integer|nil Player index
function core_camera.unicycleZoomToggle(player) end

--- Runs a method on all cameras of a vehicle, in all contexts.
---Source: lua/ge/extensions/core/camera.lua:1551
---@param vid integer Vehicle id
---@param functionName string Method name
---@param ... any Arguments
function core_camera.vehicleCamerasFunction(vid, functionName, ...) end

---@type any
MoveManager = nil
