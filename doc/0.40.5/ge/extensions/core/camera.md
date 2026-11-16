# `core_camera`

*File: `lua/ge/extensions/core/camera.lua` · VM: Game Engine (GE) · 2220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_camera`: `extensions.load("core_camera")`, then the global `core_camera`

GE extension (core_camera, depends on core_vehicle_manager and core_environment): central manager of all the game's cameras. It loads the camera modes from the lua/ge/extensions/core/cameraModes folder (one file per mode), creates for each vehicle an instance of each mode (configured by the jbeam 'camera' section) and manages 'global' instances (free, observer, path, bigMap...) that exist once without a vehicle. It decides which camera is active (per player), handles the user configuration (camera order and activation, Options > Cameras menu, saved in the cameraConfig and freeCameraConfig settings), camera cycling (keys), transitions, and exposes the final position/orientation/FOV. The per-frame computation is in core/cameraUpdate.lua, the inputs in core/cameraInput.lua (re-exposed here). A modder uses it to read the camera position, change camera by name, drive the free camera or create extra views (contexts).

## Example

```lua
local pos = core_camera.getPosition()
local fwd = core_camera.getForward()
core_camera.setByName(0, 'orbit', true)          -- vehicle camera of player 0
core_camera.setByName('free')                    -- global camera
core_camera.setPosition(0, vec3(0,0,100))        -- only in free camera
```

## Notes

- Choice of the active camera: if ctx.activeGlobalCameraName is set (global camera, e.g. 'free', 'observer', 'bigMap'), it is used; otherwise it is the player's vehicle camera 'focusedCamName' (among vdata.cameras, in the order of the 'configuration' list).
- Contexts: one view = one context. 'main' is the player's view (RenderView 'main'); createContext adds extra views (split screen, video streams). Almost all get*(ctxId) functions take a context identifier (nil = main).
- Per-vehicle functions (setRotation, setFOV, setOffset, setRef, setRefNodes, setTargetMode, setDistance, setMaxDistance, setDefaultDistance, setDefaultRotation, setSkipFovModifier, resetCameraByID, setup) always act on the main view and call the method of the same name on the active global camera or the vehicle's focused camera; if that camera lacks the method, nothing happens.
- Per-player functions (setPosition, clearMotion, clearAngularMotion, setSmoothedCam, setNewtonRotation, setNewtonTranslation, resetCamera, hotkey) act on the player's view (pid); setPosition only positions the camera if the 'free' global camera is active.
- Camera configuration: default list {orbit, driver, onboard.hood, external, relative, chase, droneChase}, replaced by the user setting cameraConfig if its version >= 2; the vehicle's other cameras are appended (sorted by the order field), 'occupant.*' cameras are inserted before 'onboard.hood'. A mode can have disabledByDefault = true.
- The 'onboard' and 'occupant' mode types are 'multicam': the jbeam can define several entries, named '<mode>.<name>' (e.g. 'onboard.driver', 'occupant.xxx'). The legacy 'driver' mode is an alias of the 'occupant' constructor (constructorsCache.driver).
- Modes marked isFilter (autopoint, autozoom, bobbing...) never become selectable cameras: they are created but ignored by initCam; other modes instantiate them to process their own result.
- Cache: adding or removing a file in cameraModes (onFileChanged) invalidates the constructors and the caches of all contexts (hot reload).
- Inconsistency: M.objectTeleported is assigned from the global objectTeleported defined in utils.lua (marked deprecated in the code: use objectTeleported directly). The automatic index wrongly reports this reference as undefined.
- Inconsistency: setVehicleCameraByNameWithId uses the variable `player` (nonexistent in the function, so nil) in its error message.
- Inconsistency: getCameraUnicycleZoom is local and not exported (only setCameraUnicycleZoom and unicycleZoomToggle are), unlike getCameraDriverZoom.
- The extension replaces the global MoveManager with its own input table (newMove) and re-points it to the view being updated every frame.

**Dependencies (loaded first):** `core_vehicle_manager`, `core_environment`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_camera.changeFreeCameraOrder(camId, offset)` | Moves a free camera in the 'world' cameras configuration and saves (freeCameraConfig setting). | 622 |
| `core_camera.changeOrder(camId, offset)` | Moves the camera at index camId by offset positions in the configuration list (skipping hidden cameras), then saves. | 586 |
| `core_camera.changeSpeed(val)` | Multiplies or divides the main view's camera speed by (1 + 0.2*\|val\|) depending on the sign, clamped between 2 and 100, and displays a message. Ignored if camera zoom is disabled in the editor. | 1879 |
| `core_camera.clearAngularMotion(pid)` | Cancels the angular movement of the player's camera. | 1447 |
| `core_camera.clearInputs(mm)` | Resets the rotation and zoom inputs (roll, pitch, yaw, zoom) of a MoveManager structure. Used by other GE scripts. | 574 |
| `core_camera.clearMotion(pid)` | Cancels the movement (velocity) of the player's camera (cam:clearMotion). | 1443 |
| `core_camera.createContext(id, renderView, player, vehiclePlayer)` | Creates (or updates) an extra camera context = a camera output with its own RenderView, reusing all camera modes. The identifier 'main' (or nil) returns the main context. The render target (resolution, texture) is managed by the caller. vehiclePlayer lets the view show another seat's vehicle while player only provides the input. | 1908 |
| `core_camera.cycleCameraGroup(player)` | Switches to the next camera group (game cameras, then 'world' free cameras, then back), enters the first camera of the group, emits onCameraToggled and displays the name. | 693 |
| `core_camera.destroyContext(id)` | Destroys an extra context (never the main one) and empties the main context's camera cache. | 1923 |
| `core_camera.displayCameraNameUI(player)` | Sends the current camera name to the UI (Messages app) with the number of options and the current index. Does nothing for a unicycle (walking). | 412 |
| `core_camera.driverZoomToggle(player)` | Toggles the driver camera zoom between 0 and 1. | 1803 |
| `core_camera.exitCinematicCamera()` | Compatibility: leaves the global camera (setGlobalCameraByName(nil)). | 2096 |
| `core_camera.getActiveCamName(player)` | Name of the player's active camera: global camera if active, otherwise vehicle camera (or the pending requested one). nil if the player has no vehicle. | 939 |
| `core_camera.getActiveCamNameByVehId(vehId)` | Name of a vehicle's focused camera (main view). | 958 |
| `core_camera.getActiveGlobalCameraName(player)` | Name of the global camera active for the player, nil if it is a vehicle camera. | 1893 |
| `core_camera.getCameraDataById(vid, ctxId)` | Returns the camera instances of a vehicle. | 899 |
| `core_camera.getCameraDriverZoom(player)` | Current driver camera zoom. | 1799 |
| `core_camera.getCameraGroups(ctx)` | Sorted list of camera group names that have at least one usable camera. | 304 |
| `core_camera.getConfigurationReadOnly()` | Deep copy of the vehicle camera configuration list ({name, enabled}). | 382 |
| `core_camera.getContextCameraParams(id)` | Adjustable settings of a context's active camera, for the camera control UI / video stream. Each mode provides its list via listParams; descriptors {key, title, kind ('range'\|'bool'\|'choice'\|'slots'), type ('float'\|'int'\|'bool'\|'enum'), value, icon, default, min, max, step, unit, options}. | 2023 |
| `core_camera.getContextCameraState(id)` | Lightweight serializable (JSON) snapshot of a context's camera: name, world pose (pos, rot, fov) and the mode's own state (data, via cam:serialize) so it can be restored. | 1983 |
| `core_camera.getContextIdForPlayer(player)` | Identifier of the view through which this player looks, usable with the get*(ctxId) getters. nil = main view. | 1942 |
| `core_camera.getContextIds()` | List of context identifiers ('main' first). | 1935 |
| `core_camera.getDriverCameraNameById(vehId, ctxId)` | Name of the driver camera: 'driver' (if 'onboard.driver' exists) or the name of an 'occupant.*' camera in 'driver' permission mode. | 923 |
| `core_camera.getDriverData(veh, ctxId)` | Like getDriverDataById from a vehicle object. | 935 |
| `core_camera.getDriverDataById(vehId, ctxId)` | Driver camera data of a vehicle. | 927 |
| `core_camera.getForward(ctxId)` | Camera 'forward' vector (y axis rotated by the orientation). | 1833 |
| `core_camera.getForwardXYZ(ctxId)` | Forward vector as separate components (uses a reused internal vec3). | 1840 |
| `core_camera.getFovDeg(ctxId)` | Final field of view in degrees. | 1871 |
| `core_camera.getFovRad(ctxId)` | Final field of view in radians. | 1875 |
| `core_camera.getFreeCameraConfigurationReadOnly()` | Deep copy of the configuration (order, activation) of the free cameras of the 'world' group. | 386 |
| `core_camera.getGlobalCameras(ctx)` | Returns the name -> instance table of the global cameras (once per context, created on demand from the constructors where cam.isGlobal is true). | 199 |
| `core_camera.getGroupCams(ctx, groupName, includeDisabled)` | List of camera names of a group (e.g. 'world'), in the configured order. Disabled 'world' cameras are omitted unless includeDisabled is true (they remain visible in the options but are skipped when cycling). | 277 |
| `core_camera.getLookBack()` | 'Look backward' state of the main view. | 1783 |
| `core_camera.getPosition(ctxId)` | Final camera position (copy). | 1812 |
| `core_camera.getPositionXYZ(ctxId)` | Final position as separate components (avoids allocation). | 1816 |
| `core_camera.getQuat(ctxId)` | Final camera orientation (copy). | 1846 |
| `core_camera.getQuatXYZW(ctxId)` | Orientation as separate components. | 1866 |
| `core_camera.getRight(ctxId)` | Camera 'right' vector (x axis rotated by the orientation). | 1827 |
| `core_camera.getSpeed(ctxId)` | Movement speed of a context's free camera (30 by default). | 1774 |
| `core_camera.getUp(ctxId)` | Camera 'up' vector (z axis rotated by the orientation). | 1821 |
| `core_camera.getYawPitchRoll()` | Yaw, pitch and roll of the main camera in one call. | 1851 |
| `core_camera.globalCameraFunction(globalCameraName, functionName, ...)` | Calls the method functionName of a named global camera. Logs an error if the camera or the method does not exist. | 1463 |
| `core_camera.hotkey(player, hotkeyid, modifier)` | Forwards a shortcut key to the active camera (the mode's hotkey method). | 1546 |
| `core_camera.isCameraInside(player, camPos)` | Tests whether a camera position is inside the player's vehicle (within its oriented box and within 0.6 m of an 'inside' viewpoint of a camera). | 881 |
| `core_camera.isWorldCamera(player)` | Tests whether the player's active camera belongs to the 'world' group (free cameras). | 1973 |
| `core_camera.nextCameraGroup(groups, active)` | Computes the next group in the cycle ring: game cameras (active = nil) to the first group, between groups, then from the last group to the game cameras (nil). active = false (system camera) returns nil. | 324 |
| `core_camera.notifyUI(vdata, forcedCamName)` | Notifies the UI and extensions of the camera change: guihooks 'onCameraNameChanged', hook onCameraModeChanged, then updates the options menu. | 557 |
| `core_camera.onCameraToggled(data)` | Hook (emitted by cycleCameraGroup, setCameraByNameFromOptions): redisplays player 0's camera name. *(internal)* *(hook)* | 488 |
| `core_camera.onClientEndMission()` | Hook called at the end of the level: detaches the camera from the 'main' RenderView to avoid a dead reference. *(internal)* *(hook)* | 1749 |
| `core_camera.onClientPostStartMission()` | Hook called after the level starts: delegated to core/cameraUpdate.lua. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `core_camera.onDeserialized(data)` | Restore hook after Lua reload (merges the serialized state into the existing cameras). *(internal)* *(hook)* | 1694 |
| `core_camera.onDespawnObject(vid, isReloading)` | Hook called when an object is deleted: removes its camera data if it is not a reload. *(internal)* *(hook)* | 1582 |
| `core_camera.onFileChanged(filePath, changeType)` | Hook called when a file changes: adding/removing a cameraModes file invalidates the caches (hot reload). *(internal)* *(hook)* | 1743 |
| `core_camera.onMouseLocked(locked)` | Hook called when the mouse is locked/unlocked: forwarded to the active camera (mouseLocked), except in free camera. *(internal)* *(hook)* | 1576 |
| `core_camera.onPreRender(...)` | Hook called just before rendering: updates the camera (cameraUpdate.onPreRender), then displays the pending camera name after a vehicle change. *(internal)* *(hook)* | 1655 |
| `core_camera.onReplayStateChanged(newState)` | Hook called when the replay state changes: on leaving playback ('playback' to 'inactive'), empties the vehicle camera cache (vehicles deleted by the replay would otherwise be lost). *(internal)* *(hook)* | 2203 |
| `core_camera.onScenarioChange(...)` | Hook called when the scenario state changes: propagated to the cameras; if a trigger was pending and the scenario goes to 'running', it is replayed. *(internal)* *(hook)* | 1632 |
| `core_camera.onScenarioRestarted(...)` | Hook called when a scenario restarts: propagated to all cameras. *(internal)* *(hook)* | 1628 |
| `core_camera.onSerialize()` | Serialization hook before Lua reload: serializes the global and vehicle cameras, the active global camera, the last vehicle, the pending trigger and the camera requests. *(internal)* *(hook)* | 1663 |
| `core_camera.onSettingsChanged(...)` | Hook called when settings change: applies free camera smoothing and propagates onSettingsChanged to all cameras. *(internal)* *(hook)* | 1610 |
| `core_camera.onTrigger(trigger)` | Hook called by BeamNG triggers: if the subject is the player's vehicle (or the triggerOverride), 'enter' with cameraOnEnter switches to the 'observer' global camera pointing at this camera object, and 'exit' with cameraOnLeave leaves it. While a scenario is starting, the request is held until the 'running' state. *(internal)* *(hook)* | 1481 |
| `core_camera.onVehicleDestroyed(vid)` | Hook called when a vehicle is destroyed: removes its camera data from all contexts. *(internal)* *(hook)* | 177 |
| `core_camera.onVehicleReplaced(vid)` | Hook called when a vehicle is replaced (new config): recreates its cameras. *(internal)* *(hook)* | 169 |
| `core_camera.onVehicleResetted(vid, ...)` | Hook called when a vehicle is reset: propagates to the vehicle's cameras and resets the focused camera unless resetCameraOnVehicleReset is false or a global camera is active. *(internal)* *(hook)* | 1563 |
| `core_camera.onVehicleSpawned(vid)` | Hook called when a vehicle is created: creates its camera data in each context. *(internal)* *(hook)* | 161 |
| `core_camera.onVehicleSwitched(oldId, newId, player)` | Hook called when the player switches vehicle: starts a transition (except for a global camera), propagates to the cameras and schedules the name display. Ignores players other than 0. *(internal)* *(hook)* | 1644 |
| `core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx)` | (Re)creates the camera instances of a vehicle from its jbeam data (cameraData), updates the shared configuration (order, activation, saved by the main context), then chooses the camera: pending request, otherwise previous camera, otherwise first enabled and visible camera, otherwise first existing one. Returns false if the vehicle data is not available yet. | 1021 |
| `core_camera.proxy_Player(fct, ...)` | Calls the method fct on player 0's active camera (global or focused). | 1476 |
| `core_camera.requestConfig(forcedCamName)` | Requests sending the current configuration to the Options > Cameras menu (guihooks CameraConfigChanged). | 568 |
| `core_camera.resetCamera(player)` | Resets the player view's inputs, emits the onCameraReset hook and calls reset() on the active camera. | 1540 |
| `core_camera.resetCameraByID(vid, ...)` | Calls reset() on the camera (active global or the vehicle's focused one) of the main view. | 1359 |
| `core_camera.resetConfiguration()` | Clears the cameraConfig and freeCameraConfig settings and recomputes the configuration for all vehicles. | 1617 |
| `core_camera.setByName(...)` | Selects a camera by name. Flexible signature: setByName(player, camName, withTransition, customData) if the first argument is a number, otherwise setByName(camName, withTransition, customData). A global camera name (or nil) acts on the global view; otherwise it is the player's vehicle camera. | 838 |
| `core_camera.setBySlotId(player, slotId)` | Selects the camera associated with a shortcut number (keys 1 to 9, slotId computed over the visible cameras). | 977 |
| `core_camera.setCameraByNameFromOptions(player, camName)` | Selection from the Options menu: a 'world' group camera goes through enterGroupCam (and the onCameraToggled FreeCam hook), otherwise it is a vehicle camera. Displays the name if the selection succeeds. | 851 |
| `core_camera.setCameraDriverZoom(value, player)` | Sets the driver camera zoom. | 1795 |
| `core_camera.setCameraUnicycleZoom(value, player)` | Sets the zoom of the walking camera (unicycle). | 1787 |
| `core_camera.setContextCamera(id, camName, withTransition, customData)` | Selects a camera on a context without touching the player. camName nil or global camera name: global camera (initialized with the view's current pose); otherwise the vehicle camera of the context's player. | 1949 |
| `core_camera.setContextCameraParam(id, key, value)` | Applies a setting to a context's active camera by delegating to cam:setParam(key, value, id). | 2032 |
| `core_camera.setContextCameraState(id, state)` | Restores a context's camera from a getContextCameraState snapshot. A mode with deserialize restores its state; a free/global camera without deserialize is put back at the saved pose. | 2002 |
| `core_camera.setDefaultDistance(vid, ...)` | Delegates cam:setDefaultDistance(...) to the camera. | 1407 |
| `core_camera.setDefaultRotation(vid, ...)` | Delegates cam:setDefaultRotation(...) to the camera. | 1419 |
| `core_camera.setDistance(vid, ...)` | Delegates cam:setDistance(...) to the camera. | 1411 |
| `core_camera.setFOV(vid, ...)` | Sets the field of view (degrees). If 'free' is active, also applies it to the engine; then cam:setFOV(...). | 1375 |
| `core_camera.setFastSpeedModifier(enabled)` | Enables the fast speed modifier (key) of the main view. | 1757 |
| `core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)` | Orients the free camera (only active if the 'free' global camera is active) from yaw, pitch (positive = looking down) and roll in degrees; cancels the angular velocity. | 1233 |
| `core_camera.setGlobalCameraByName(name, withTransition, customData, ctx)` | Activates a global camera by name, or switches back to the vehicle camera with nil. Calls onCameraChanged(false) on the old one and setCustomData + onCameraChanged(true) on the new one; in the main view, emits the onGlobalCameraSet hook. No effect if the name is unknown or if there is no vehicle to return to the vehicle camera. | 639 |
| `core_camera.setInputTargetPlayer(player)` | Forces all camera inputs to target the given player (nil to disable this redirection). | 105 |
| `core_camera.setLookBack(player, enabled)` | Enables/disables looking backward for the player. | 1779 |
| `core_camera.setMaxDistance(vid, ...)` | Delegates cam:setMaxDistance(...) to the camera. | 1415 |
| `core_camera.setNewtonRotation(pid, ...)` | Enables/disables the 'Newton' (inertia) mode for free camera rotation. | 1455 |
| `core_camera.setNewtonTranslation(pid, ...)` | Enables/disables the 'Newton' (inertia) mode for free camera translation. | 1459 |
| `core_camera.setOffset(vid, ...)` | Delegates cam:setOffset(...) to the main view's camera. | 1387 |
| `core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw)` | Places the free camera at a position (and optional quaternion orientation). No effect if the free camera is not active. | 1761 |
| `core_camera.setPosition(pid, ...)` | Sets the camera position (vec3 as the first extra argument). If the 'free' global camera is active in the main view, the position is also applied directly to the engine; then cam:setPosition(...) is called. | 1430 |
| `core_camera.setRef(vid, ...)` | Delegates cam:setRef(...) to the camera. | 1399 |
| `core_camera.setRefNodes(vid, ...)` | Delegates cam:setRefNodes(...) (center, left, rear reference nodes). | 1395 |
| `core_camera.setRotation(vid, ...)` | Sets the camera orientation. If the 'free' global camera is active, also applies the rotation (quat) directly to the engine; then calls cam:setRotation(...). | 1363 |
| `core_camera.setSkipFovModifier(vid, ...)` | Delegates cam:setSkipFovModifier(...) to the camera. | 1423 |
| `core_camera.setSmoothedCam(pid, ...)` | Enables/disables free camera smoothing (cam:setSmoothedCam). | 1451 |
| `core_camera.setSpeed(speed, ctxId)` | Sets the movement speed of the free camera. | 1769 |
| `core_camera.setTargetMode(vid, ...)` | Delegates cam:setTargetMode(...) to the camera. | 1403 |
| `core_camera.setVehicleCameraByIndexOffset(player, offset)` | Switches to the next (offset = 1) or previous (-1) camera, skipping hidden/disabled ones. In a group's global camera, cycles within that group. Used by input actions. | 1275 |
| `core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx)` | Selects a vehicle camera for the vehicle with id vehId. If the vehicle data is not ready yet, the request is stored and applied later. | 800 |
| `core_camera.startCameraTransition(duration, player)` | Blends the current point of view into the camera's view for this frame. To call right after a camera change. duration overrides the configured duration. | 669 |
| `core_camera.toggleEnabledById(camId)` | Enables or disables the vehicle camera at index camId in the cycle (compatibility) then saves the configuration. | 613 |
| `core_camera.toggleFreeCameraEnabledById(camId)` | Enables/disables a free camera of the 'world' group in the cycle and saves. | 631 |
| `core_camera.unicycleZoomToggle(player)` | Toggles the walking camera zoom between 0 and 1. | 1807 |
| `core_camera.vehicleCamerasFunction(vid, functionName, ...)` | Runs a method on all cameras of a vehicle, in all contexts. | 1551 |

### Parameter details

#### `core_camera.changeFreeCameraOrder(camId, offset)`

Moves a free camera in the 'world' cameras configuration and saves (freeCameraConfig setting).

- `camId` (*integer*) : Index in the free configuration
- `offset` (*integer*) : Offset

#### `core_camera.changeOrder(camId, offset)`

Moves the camera at index camId by offset positions in the configuration list (skipping hidden cameras), then saves.

- `camId` (*integer*) : Index in the configuration (1-based)
- `offset` (*integer*) : Offset, e.g. -1 or +1

#### `core_camera.changeSpeed(val)`

Multiplies or divides the main view's camera speed by (1 + 0.2*|val|) depending on the sign, clamped between 2 and 100, and displays a message. Ignored if camera zoom is disabled in the editor.

- `val` (*number*) : Signed change (wheel)

#### `core_camera.clearAngularMotion(pid)`

Cancels the angular movement of the player's camera.

- `pid` (*integer|nil*) : Player/view

#### `core_camera.clearInputs(mm)`

Resets the rotation and zoom inputs (roll, pitch, yaw, zoom) of a MoveManager structure. Used by other GE scripts.

- `mm` (*table|nil*) : Input structure, default MoveManager

#### `core_camera.clearMotion(pid)`

Cancels the movement (velocity) of the player's camera (cam:clearMotion).

- `pid` (*integer|nil*) : Player/view

#### `core_camera.createContext(id, renderView, player, vehiclePlayer)`

Creates (or updates) an extra camera context = a camera output with its own RenderView, reusing all camera modes. The identifier 'main' (or nil) returns the main context. The render target (resolution, texture) is managed by the caller. vehiclePlayer lets the view show another seat's vehicle while player only provides the input.

- `id` (*string*) : Context identifier
- `renderView` (*string|nil*) : RenderView name (id by default)
- `player` (*integer|nil*) : Player/seat whose view follows the inputs (0 by default)
- `vehiclePlayer` (*integer|nil*) : Seat whose vehicle is taken (optional)
- **returns**: table Context (internal table)

#### `core_camera.cycleCameraGroup(player)`

Switches to the next camera group (game cameras, then 'world' free cameras, then back), enters the first camera of the group, emits onCameraToggled and displays the name.

- `player` (*integer|nil*) : Player index

#### `core_camera.destroyContext(id)`

Destroys an extra context (never the main one) and empties the main context's camera cache.

- `id` (*string*) : Context identifier

#### `core_camera.displayCameraNameUI(player)`

Sends the current camera name to the UI (Messages app) with the number of options and the current index. Does nothing for a unicycle (walking).

- `player` (*integer|nil*) : Player index

#### `core_camera.driverZoomToggle(player)`

Toggles the driver camera zoom between 0 and 1.

- `player` (*integer|nil*) : Player index

#### `core_camera.getActiveCamName(player)`

Name of the player's active camera: global camera if active, otherwise vehicle camera (or the pending requested one). nil if the player has no vehicle.

- `player` (*integer|nil*) : Player index
- **returns**: string|nil Camera name

#### `core_camera.getActiveCamNameByVehId(vehId)`

Name of a vehicle's focused camera (main view).

- `vehId` (*integer*) : Vehicle id
- **returns**: string|nil Camera name

#### `core_camera.getActiveGlobalCameraName(player)`

Name of the global camera active for the player, nil if it is a vehicle camera.

- `player` (*integer|nil*) : Player index
- **returns**: string|nil Global camera name

#### `core_camera.getCameraDataById(vid, ctxId)`

Returns the camera instances of a vehicle.

- `vid` (*integer*) : Vehicle id
- `ctxId` (*string|nil*) : Context identifier (nil = main)
- **returns**: table<string, table>|nil Cameras by name, nil if the vehicle is unknown

#### `core_camera.getCameraDriverZoom(player)`

Current driver camera zoom.

- `player` (*integer|nil*) : Player index
- **returns**: number|nil Zoom

#### `core_camera.getCameraGroups(ctx)`

Sorted list of camera group names that have at least one usable camera.

- `ctx` (*table|nil*) : Internal context (nil = main)
- **returns**: table<integer, string> Group names

#### `core_camera.getConfigurationReadOnly()`

Deep copy of the vehicle camera configuration list ({name, enabled}).

- **returns**: table List of {name, enabled}

#### `core_camera.getContextCameraParams(id)`

Adjustable settings of a context's active camera, for the camera control UI / video stream. Each mode provides its list via listParams; descriptors {key, title, kind ('range'|'bool'|'choice'|'slots'), type ('float'|'int'|'bool'|'enum'), value, icon, default, min, max, step, unit, options}.

- `id` (*string|nil*) : Context identifier
- **returns**: table List of descriptors (empty if none)

#### `core_camera.getContextCameraState(id)`

Lightweight serializable (JSON) snapshot of a context's camera: name, world pose (pos, rot, fov) and the mode's own state (data, via cam:serialize) so it can be restored.

- `id` (*string|nil*) : Context identifier (nil = main)
- **returns**: table|nil {cam, pos={x,y,z}, rot={x,y,z,w}, fov, data}

#### `core_camera.getContextIdForPlayer(player)`

Identifier of the view through which this player looks, usable with the get*(ctxId) getters. nil = main view.

- `player` (*integer|nil*) : Player index
- **returns**: string|nil Context identifier or nil

#### `core_camera.getContextIds()`

List of context identifiers ('main' first).

- **returns**: table<integer, string> Identifiers

#### `core_camera.getDriverCameraNameById(vehId, ctxId)`

Name of the driver camera: 'driver' (if 'onboard.driver' exists) or the name of an 'occupant.*' camera in 'driver' permission mode.

- `vehId` (*integer*) : Vehicle id
- `ctxId` (*string|nil*) : Context
- **returns**: string|nil Driver camera name

#### `core_camera.getDriverData(veh, ctxId)`

Like getDriverDataById from a vehicle object.

- `veh` (*userdata|nil*) : Vehicle
- `ctxId` (*string|nil*) : Context
- **returns**: integer|nil camNodeID
- **returns**: boolean rightHandCamera
- **returns**: boolean rightHandDoor

#### `core_camera.getDriverDataById(vehId, ctxId)`

Driver camera data of a vehicle.

- `vehId` (*integer*) : Vehicle id
- `ctxId` (*string|nil*) : Context
- **returns**: integer|nil camNodeID (node of the driver viewpoint)
- **returns**: boolean rightHandCamera
- **returns**: boolean rightHandDoor

#### `core_camera.getForward(ctxId)`

Camera 'forward' vector (y axis rotated by the orientation).

- `ctxId` (*string|nil*) : Context
- **returns**: vec3 Forward vector

#### `core_camera.getForwardXYZ(ctxId)`

Forward vector as separate components (uses a reused internal vec3).

- `ctxId` (*string|nil*) : Context
- **returns**: number x
- **returns**: number y
- **returns**: number z

#### `core_camera.getFovDeg(ctxId)`

Final field of view in degrees.

- `ctxId` (*string|nil*) : Context
- **returns**: number FOV (deg)

#### `core_camera.getFovRad(ctxId)`

Final field of view in radians.

- `ctxId` (*string|nil*) : Context
- **returns**: number FOV (rad)

#### `core_camera.getFreeCameraConfigurationReadOnly()`

Deep copy of the configuration (order, activation) of the free cameras of the 'world' group.

- **returns**: table List of {name, enabled}

#### `core_camera.getGlobalCameras(ctx)`

Returns the name -> instance table of the global cameras (once per context, created on demand from the constructors where cam.isGlobal is true).

- `ctx` (*table|nil*) : Internal context (nil = main); external calls usually omit the argument
- **returns**: table<string, table> Global cameras by name

#### `core_camera.getGroupCams(ctx, groupName, includeDisabled)`

List of camera names of a group (e.g. 'world'), in the configured order. Disabled 'world' cameras are omitted unless includeDisabled is true (they remain visible in the options but are skipped when cycling).

- `ctx` (*table|nil*) : Internal context (nil = main)
- `groupName` (*string*) : Group name, e.g. 'world'
- `includeDisabled` (*boolean|nil*) : Include disabled cameras
- **returns**: table<integer, string> Camera names

#### `core_camera.getLookBack()`

'Look backward' state of the main view.

- **returns**: boolean|nil State

#### `core_camera.getPosition(ctxId)`

Final camera position (copy).

- `ctxId` (*string|nil*) : Context (nil = player view)
- **returns**: vec3 World position (m)

#### `core_camera.getPositionXYZ(ctxId)`

Final position as separate components (avoids allocation).

- `ctxId` (*string|nil*) : Context
- **returns**: number x
- **returns**: number y
- **returns**: number z

#### `core_camera.getQuat(ctxId)`

Final camera orientation (copy).

- `ctxId` (*string|nil*) : Context
- **returns**: quat Orientation

#### `core_camera.getQuatXYZW(ctxId)`

Orientation as separate components.

- `ctxId` (*string|nil*) : Context
- **returns**: number x
- **returns**: number y
- **returns**: number z
- **returns**: number w

#### `core_camera.getRight(ctxId)`

Camera 'right' vector (x axis rotated by the orientation).

- `ctxId` (*string|nil*) : Context
- **returns**: vec3 Right vector

#### `core_camera.getSpeed(ctxId)`

Movement speed of a context's free camera (30 by default).

- `ctxId` (*string|nil*) : Context
- **returns**: number|nil Speed

#### `core_camera.getUp(ctxId)`

Camera 'up' vector (z axis rotated by the orientation).

- `ctxId` (*string|nil*) : Context
- **returns**: vec3 Up vector

#### `core_camera.getYawPitchRoll()`

Yaw, pitch and roll of the main camera in one call.

- **returns**: table {yawDeg, pitchDown (positive = downward), rollDeg}

#### `core_camera.globalCameraFunction(globalCameraName, functionName, ...)`

Calls the method functionName of a named global camera. Logs an error if the camera or the method does not exist.

- `globalCameraName` (*string*) : Global camera name
- `functionName` (*string*) : Method name
- `...` (*any*) : Arguments
- **returns**: any Return of the method

#### `core_camera.hotkey(player, hotkeyid, modifier)`

Forwards a shortcut key to the active camera (the mode's hotkey method).

- `player` (*integer|nil*) : Player index
- `hotkeyid` (*any*) : Shortcut identifier
- `modifier` (*any*) : Modifier
- **returns**: any Return of the camera

#### `core_camera.isCameraInside(player, camPos)`

Tests whether a camera position is inside the player's vehicle (within its oriented box and within 0.6 m of an 'inside' viewpoint of a camera).

- `player` (*integer|nil*) : Player index
- `camPos` (*vec3*) : Position to test (m)
- **returns**: integer 1 if inside, 0 otherwise (also 0 without a vehicle or on a unicycle)

#### `core_camera.isWorldCamera(player)`

Tests whether the player's active camera belongs to the 'world' group (free cameras).

- `player` (*integer|nil*) : Player index
- **returns**: boolean true if 'world' camera

#### `core_camera.nextCameraGroup(groups, active)`

Computes the next group in the cycle ring: game cameras (active = nil) to the first group, between groups, then from the last group to the game cameras (nil). active = false (system camera) returns nil.

- `groups` (*table<integer, string>*) : Group names
- `active` (*string|boolean|nil*) : Active group: nil = game camera, false = camera without group
- **returns**: string|nil Next group or nil (back to game cameras)

#### `core_camera.notifyUI(vdata, forcedCamName)`

Notifies the UI and extensions of the camera change: guihooks 'onCameraNameChanged', hook onCameraModeChanged, then updates the options menu.

- `vdata` (*table|nil*) : Vehicle camera data (player 0 by default)
- `forcedCamName` (*string|nil*) : Name to announce instead of the focused camera

#### `core_camera.onCameraToggled(data)`

Hook (emitted by cycleCameraGroup, setCameraByNameFromOptions): redisplays player 0's camera name.

- `data` (*table*) : {cameraType = 'FreeCam'|'GameCam'}

#### `core_camera.onDeserialized(data)`

Restore hook after Lua reload (merges the serialized state into the existing cameras).

- `data` (*table*) : Data from onSerialize

#### `core_camera.onDespawnObject(vid, isReloading)`

Hook called when an object is deleted: removes its camera data if it is not a reload.

- `vid` (*integer*) : Identifier
- `isReloading` (*boolean*) : true on a reload

#### `core_camera.onFileChanged(filePath, changeType)`

Hook called when a file changes: adding/removing a cameraModes file invalidates the caches (hot reload).

- `filePath` (*string*) : File path
- `changeType` (*string*) : 'added', 'deleted', 'modified'...

#### `core_camera.onMouseLocked(locked)`

Hook called when the mouse is locked/unlocked: forwarded to the active camera (mouseLocked), except in free camera.

- `locked` (*boolean*) : true if locked

#### `core_camera.onPreRender(...)`

Hook called just before rendering: updates the camera (cameraUpdate.onPreRender), then displays the pending camera name after a vehicle change.

- `...` (*any*) : dtReal, dtSim, dtRaw (inferred from cameraUpdate)

#### `core_camera.onReplayStateChanged(newState)`

Hook called when the replay state changes: on leaving playback ('playback' to 'inactive'), empties the vehicle camera cache (vehicles deleted by the replay would otherwise be lost).

- `newState` (*table*) : Table with the state field

#### `core_camera.onScenarioChange(...)`

Hook called when the scenario state changes: propagated to the cameras; if a trigger was pending and the scenario goes to 'running', it is replayed.

- `...` (*any*) : 

#### `core_camera.onScenarioRestarted(...)`

Hook called when a scenario restarts: propagated to all cameras.

- `...` (*any*) : Hook arguments

#### `core_camera.onSerialize()`

Serialization hook before Lua reload: serializes the global and vehicle cameras, the active global camera, the last vehicle, the pending trigger and the camera requests.

- **returns**: table Data to restore

#### `core_camera.onSettingsChanged(...)`

Hook called when settings change: applies free camera smoothing and propagates onSettingsChanged to all cameras.

- `...` (*any*) : Hook arguments

#### `core_camera.onTrigger(trigger)`

Hook called by BeamNG triggers: if the subject is the player's vehicle (or the triggerOverride), 'enter' with cameraOnEnter switches to the 'observer' global camera pointing at this camera object, and 'exit' with cameraOnLeave leaves it. While a scenario is starting, the request is held until the 'running' state.

- `trigger` (*table*) : {subjectID, event, cameraOnEnter, cameraOnLeave, triggerOverride...}

#### `core_camera.onVehicleDestroyed(vid)`

Hook called when a vehicle is destroyed: removes its camera data from all contexts.

- `vid` (*integer*) : Identifier

#### `core_camera.onVehicleReplaced(vid)`

Hook called when a vehicle is replaced (new config): recreates its cameras.

- `vid` (*integer*) : Vehicle id

#### `core_camera.onVehicleResetted(vid, ...)`

Hook called when a vehicle is reset: propagates to the vehicle's cameras and resets the focused camera unless resetCameraOnVehicleReset is false or a global camera is active.

- `vid` (*integer*) : Vehicle id
- `...` (*any*) : Arguments

#### `core_camera.onVehicleSpawned(vid)`

Hook called when a vehicle is created: creates its camera data in each context.

- `vid` (*integer*) : Vehicle id

#### `core_camera.onVehicleSwitched(oldId, newId, player)`

Hook called when the player switches vehicle: starts a transition (except for a global camera), propagates to the cameras and schedules the name display. Ignores players other than 0.

- `oldId` (*integer*) : Old vehicle
- `newId` (*integer*) : New vehicle
- `player` (*integer*) : Player

#### `core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx)`

(Re)creates the camera instances of a vehicle from its jbeam data (cameraData), updates the shared configuration (order, activation, saved by the main context), then chooses the camera: pending request, otherwise previous camera, otherwise first enabled and visible camera, otherwise first existing one. Returns false if the vehicle data is not available yet.

- `vid` (*integer*) : Vehicle id
- `vdata` (*table*) : Vehicle camera data table (modified)
- `focusedCamNamePrevious` (*string|nil*) : Name of the previously focused camera
- `ctx` (*table|nil*) : Internal context (nil = main)
- **returns**: boolean true if handled

#### `core_camera.proxy_Player(fct, ...)`

Calls the method fct on player 0's active camera (global or focused).

- `fct` (*string*) : Method name
- `...` (*any*) : Arguments
- **returns**: any Return of the method

#### `core_camera.requestConfig(forcedCamName)`

Requests sending the current configuration to the Options > Cameras menu (guihooks CameraConfigChanged).

- `forcedCamName` (*string|nil*) : Camera name to mark as active

#### `core_camera.resetCamera(player)`

Resets the player view's inputs, emits the onCameraReset hook and calls reset() on the active camera.

- `player` (*integer|nil*) : Player index
- **returns**: any Return of reset

#### `core_camera.resetCameraByID(vid, ...)`

Calls reset() on the camera (active global or the vehicle's focused one) of the main view.

- `vid` (*integer|table*) : Vehicle id, or table {vehId, camName}
- `...` (*any*) : Arguments passed to reset
- **returns**: any Return of the camera method

#### `core_camera.setByName(...)`

Selects a camera by name. Flexible signature: setByName(player, camName, withTransition, customData) if the first argument is a number, otherwise setByName(camName, withTransition, customData). A global camera name (or nil) acts on the global view; otherwise it is the player's vehicle camera.

- `...` (*any*) : [player,] camName, withTransition, customData

#### `core_camera.setBySlotId(player, slotId)`

Selects the camera associated with a shortcut number (keys 1 to 9, slotId computed over the visible cameras).

- `player` (*integer|nil*) : Player index
- `slotId` (*integer*) : Slot number

#### `core_camera.setCameraByNameFromOptions(player, camName)`

Selection from the Options menu: a 'world' group camera goes through enterGroupCam (and the onCameraToggled FreeCam hook), otherwise it is a vehicle camera. Displays the name if the selection succeeds.

- `player` (*integer|nil*) : Player index
- `camName` (*string*) : Camera name
- **returns**: boolean true if selected

#### `core_camera.setCameraDriverZoom(value, player)`

Sets the driver camera zoom.

- `value` (*number*) : 0 or 1 (threshold 0.5)
- `player` (*integer|nil*) : Player index

#### `core_camera.setCameraUnicycleZoom(value, player)`

Sets the zoom of the walking camera (unicycle).

- `value` (*number*) : 0 or 1 (inferred from code: threshold at 0.5)
- `player` (*integer|nil*) : Player index

#### `core_camera.setContextCamera(id, camName, withTransition, customData)`

Selects a camera on a context without touching the player. camName nil or global camera name: global camera (initialized with the view's current pose); otherwise the vehicle camera of the context's player.

- `id` (*string|nil*) : Context identifier (nil = main)
- `camName` (*string|nil*) : Camera name
- `withTransition` (*boolean|nil*) : Transition
- `customData` (*any*) : Data passed to setCustomData
- **returns**: any No useful return (the internal function returns nothing)

#### `core_camera.setContextCameraParam(id, key, value)`

Applies a setting to a context's active camera by delegating to cam:setParam(key, value, id).

- `id` (*string|nil*) : Context identifier
- `key` (*string*) : Setting key (e.g. 'fov')
- `value` (*any*) : New value

#### `core_camera.setContextCameraState(id, state)`

Restores a context's camera from a getContextCameraState snapshot. A mode with deserialize restores its state; a free/global camera without deserialize is put back at the saved pose.

- `id` (*string|nil*) : Context identifier
- `state` (*table*) : Snapshot

#### `core_camera.setDefaultDistance(vid, ...)`

Delegates cam:setDefaultDistance(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*number*) : Default distance (m)
- **returns**: any Return of the camera

#### `core_camera.setDefaultRotation(vid, ...)`

Delegates cam:setDefaultRotation(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Default rotation
- **returns**: any Return of the camera

#### `core_camera.setDistance(vid, ...)`

Delegates cam:setDistance(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*number*) : Distance (m)
- **returns**: any Return of the camera

#### `core_camera.setFOV(vid, ...)`

Sets the field of view (degrees). If 'free' is active, also applies it to the engine; then cam:setFOV(...).

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*number*) : FOV in degrees
- **returns**: any Return of the camera

#### `core_camera.setFastSpeedModifier(enabled)`

Enables the fast speed modifier (key) of the main view.

- `enabled` (*boolean*) : true to go faster

#### `core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)`

Orients the free camera (only active if the 'free' global camera is active) from yaw, pitch (positive = looking down) and roll in degrees; cancels the angular velocity.

- `yawDeg` (*number*) : Yaw (0 = +Y axis)
- `pitchDownDeg` (*number*) : Pitch downward (deg)
- `rollDeg` (*number*) : Roll (deg)

#### `core_camera.setGlobalCameraByName(name, withTransition, customData, ctx)`

Activates a global camera by name, or switches back to the vehicle camera with nil. Calls onCameraChanged(false) on the old one and setCustomData + onCameraChanged(true) on the new one; in the main view, emits the onGlobalCameraSet hook. No effect if the name is unknown or if there is no vehicle to return to the vehicle camera.

- `name` (*string|nil*) : Global camera name, nil to leave
- `withTransition` (*boolean|nil*) : Not used in the code (inferred from code)
- `customData` (*table|nil*) : Data passed to cam:setCustomData
- `ctx` (*table|nil*) : Internal context (nil = main)

#### `core_camera.setInputTargetPlayer(player)`

Forces all camera inputs to target the given player (nil to disable this redirection).

- `player` (*integer|nil*) : Index of the targeted player

#### `core_camera.setLookBack(player, enabled)`

Enables/disables looking backward for the player.

- `player` (*integer|nil*) : Player index
- `enabled` (*boolean*) : true to look behind

#### `core_camera.setMaxDistance(vid, ...)`

Delegates cam:setMaxDistance(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*number*) : Maximum distance (m)
- **returns**: any Return of the camera

#### `core_camera.setNewtonRotation(pid, ...)`

Enables/disables the 'Newton' (inertia) mode for free camera rotation.

- `pid` (*integer|nil*) : Player/view
- `...` (*any*) : Mode argument

#### `core_camera.setNewtonTranslation(pid, ...)`

Enables/disables the 'Newton' (inertia) mode for free camera translation.

- `pid` (*integer|nil*) : Player/view
- `...` (*any*) : Mode argument

#### `core_camera.setOffset(vid, ...)`

Delegates cam:setOffset(...) to the main view's camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Camera mode arguments
- **returns**: any Return of the camera

#### `core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw)`

Places the free camera at a position (and optional quaternion orientation). No effect if the free camera is not active.

- `pid` (*integer*) : Player
- `px` (*number*) : x (m)
- `py` (*number*) : y (m)
- `pz` (*number*) : z (m)
- `rx` (*number|nil*) : Quaternion x
- `ry` (*number|nil*) : Quaternion y
- `rz` (*number|nil*) : Quaternion z
- `rw` (*number|nil*) : Quaternion w

#### `core_camera.setPosition(pid, ...)`

Sets the camera position (vec3 as the first extra argument). If the 'free' global camera is active in the main view, the position is also applied directly to the engine; then cam:setPosition(...) is called.

- `pid` (*integer|nil*) : Player/view
- `...` (*vec3*) : World position (m)
- **returns**: any Return of the camera

#### `core_camera.setRef(vid, ...)`

Delegates cam:setRef(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Arguments
- **returns**: any Return of the camera

#### `core_camera.setRefNodes(vid, ...)`

Delegates cam:setRefNodes(...) (center, left, rear reference nodes).

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Reference nodes
- **returns**: any Return of the camera

#### `core_camera.setRotation(vid, ...)`

Sets the camera orientation. If the 'free' global camera is active, also applies the rotation (quat) directly to the engine; then calls cam:setRotation(...).

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Rotation (quat) and other arguments
- **returns**: any Return of the camera

#### `core_camera.setSkipFovModifier(vid, ...)`

Delegates cam:setSkipFovModifier(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*boolean*) : Skip the FOV modifier
- **returns**: any Return of the camera

#### `core_camera.setSmoothedCam(pid, ...)`

Enables/disables free camera smoothing (cam:setSmoothedCam).

- `pid` (*integer|nil*) : Player/view
- `...` (*boolean*) : Enable smoothing

#### `core_camera.setSpeed(speed, ctxId)`

Sets the movement speed of the free camera.

- `speed` (*number*) : Speed (m/s)
- `ctxId` (*string|nil*) : Context

#### `core_camera.setTargetMode(vid, ...)`

Delegates cam:setTargetMode(...) to the camera.

- `vid` (*integer|table*) : Vehicle id or {vehId, camName}
- `...` (*any*) : Arguments
- **returns**: any Return of the camera

#### `core_camera.setVehicleCameraByIndexOffset(player, offset)`

Switches to the next (offset = 1) or previous (-1) camera, skipping hidden/disabled ones. In a group's global camera, cycles within that group. Used by input actions.

- `player` (*integer|nil*) : Player index
- `offset` (*integer*) : +1 or -1

#### `core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx)`

Selects a vehicle camera for the vehicle with id vehId. If the vehicle data is not ready yet, the request is stored and applied later.

- `vehId` (*integer*) : Vehicle id
- `name` (*string*) : Camera name
- `withTransition` (*boolean|nil*) : Starts a transition
- `customData` (*any*) : Passed to cam:setCustomData if present
- `ctx` (*table|nil*) : Internal context (nil = main)
- **returns**: boolean|nil true if changed, false otherwise

#### `core_camera.startCameraTransition(duration, player)`

Blends the current point of view into the camera's view for this frame. To call right after a camera change. duration overrides the configured duration.

- `duration` (*number|nil*) : Blend duration in seconds
- `player` (*integer|nil*) : Player/view (nil = main)

#### `core_camera.toggleEnabledById(camId)`

Enables or disables the vehicle camera at index camId in the cycle (compatibility) then saves the configuration.

- `camId` (*integer*) : Index in the configuration

#### `core_camera.toggleFreeCameraEnabledById(camId)`

Enables/disables a free camera of the 'world' group in the cycle and saves.

- `camId` (*integer*) : Index in the free configuration

#### `core_camera.unicycleZoomToggle(player)`

Toggles the walking camera zoom between 0 and 1.

- `player` (*integer|nil*) : Player index

#### `core_camera.vehicleCamerasFunction(vid, functionName, ...)`

Runs a method on all cameras of a vehicle, in all contexts.

- `vid` (*integer*) : Vehicle id
- `functionName` (*string*) : Method name
- `...` (*any*) : Arguments

## Fields

| Field | Type | Description |
|---|---|---|
| `cameraZoom` | any |  |
| `dependencies` | table<integer, string> | Extensions loaded before: core_vehicle_manager, core_environment. |
| `getLastCameraMovementType` | any |  |
| `getLastFilter` | any |  |
| `moveForwardBackward` | any |  |
| `moveLeftRight` | any |  |
| `movebackward` | any |  |
| `movedown` | any |  |
| `moveforward` | any |  |
| `moveleft` | any |  |
| `moveright` | any |  |
| `moveup` | any |  |
| `objectTeleported` | function | Deprecated alias of the global objectTeleported (utils.lua). |
| `pitchAbs` | any |  |
| `rollAbs` | any |  |
| `rotate_pitch` | any |  |
| `rotate_pitch_down` | any |  |
| `rotate_pitch_relative` | any |  |
| `rotate_pitch_up` | any |  |
| `rotate_roll_left` | any |  |
| `rotate_roll_right` | any |  |
| `rotate_yaw` | any |  |
| `rotate_yaw_left` | any |  |
| `rotate_yaw_relative` | any |  |
| `rotate_yaw_right` | any |  |
| `speedFactor` | number | Speed factor (1 by default) used to correct a camera movement that is too slow/smoothed when creating thumbnails. |
| `timeSinceLastRotation` | any |  |
| `xAxisAbs` | any |  |
| `yAxisAbs` | any |  |
| `yAxisMoveStep` | any |  |
| `yawAbs` | any |  |
| `zAxisAbs` | any |  |

**Globals assigned:** `MoveManager`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCameraModeChanged` — listened to by 3 module(s)
- `onCameraReset`
- `onCameraToggled` — listened to by 1 module(s)
- `onGlobalCameraSet` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `CameraConfigChanged`, `Message`, `appContainer:loadLayoutByType`, `onCameraNameChanged`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getObject`, `getObjectCount`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/camera.lua`.*
