---@meta
-- tim19Atlas stub generated from lua/ge/server/commands.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera and player placement commands, largely called by the C++ side and the input actions: switching between the game camera and the free camera, free camera speed, dropping the camera on the vehicle or the vehicle at the camera position, reading/writing the free camera transform as JSON. It also contains old global functions (getCameraPosition, setCameraFov…) kept for compatibility, which redirect to core_camera while logging a deprecation warning (once per function).
--- Access: global `commands`
---@class commands
---@field getGame any Backward compatibility; is nil if the global getGame does not exist.
---@field onSettingsChanged any Exported from a variable not defined in this file: is nil (see notes).
commands = {}

--- Applies a plan: moves the vehicle's node cluster (setClusterPosRelRot), cancels its velocity and updates the origin transform.
---Source: lua/ge/server/commands.lua:128
---@param player integer|nil player index (unused)
---@param plan table plan returned by planDropPlayerAtCameraNoReset
---@return boolean  false if the plan's vehicle no longer exists
function commands.applyDropPlayerAtCameraNoResetPlan(player, plan) end

--- Changes the camera's normal speed (typically Alt + wheel).
---Source: lua/ge/server/commands.lua:53
---@param val number speed change (passed to core_camera.changeSpeed)
function commands.changeCameraSpeed(val) end

--- Switches to the free camera and places it at the position and orientation of the player's vehicle.
---Source: lua/ge/server/commands.lua:73
---@param player integer|nil player index
function commands.dropCameraAtPlayer(player) end

--- Teleports the player's vehicle to the camera position, oriented along the camera's horizontal direction, then switches back to the game camera (the bigMap camera becomes orbit) and resets it.
---Source: lua/ge/server/commands.lua:82
---@param player integer|nil player index
function commands.dropPlayerAtCamera(player) end

--- Drops the vehicle at the camera without reset. If multiplayer_vehicleSync exists, delegates the request to it; otherwise calls dropPlayerAtCameraNoResetImpl.
---Source: lua/ge/server/commands.lua:148
---@param player integer|nil player index
function commands.dropPlayerAtCameraNoReset(player) end

--- Plans then applies the drop without reset, then puts the camera back in game mode.
---Source: lua/ge/server/commands.lua:140
---@param player integer|nil player index
---@return table|nil  the applied plan, or nil on failure
function commands.dropPlayerAtCameraNoResetImpl(player) end

--- Returns the "gameCamera" scene object (backward compatibility).
---Source: lua/ge/server/commands.lua:31
---@return table|nil  gameCamera object
function commands.getCamera() end

--- Returns the camera's position and rotation as a JSON string.
---Source: lua/ge/server/commands.lua:164
---@return string  '[x, y, z, qx, qy, qz, qw]' (position to 2 decimals)
function commands.getCameraTransformJson() end

--- Initializes the main camera: empties the core_camera inputs, finds the "gameCamera" object, attaches it to the 'main' view, emits the onCameraHandlerSet hook and resets the camera configuration to default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/server/commands.lua:8
---@return table|nil  gameCamera scene object, or nil if not found
function commands.initCamera() end

--- Indicates whether the player's active camera is "free".
---Source: lua/ge/server/commands.lua:27
---@param player integer|nil player index
---@return boolean  true if the free camera is active
function commands.isFreeCamera(player) end

--- Hook called at the start of a node grab: emits onNodegrab(true), remembers whether the camera was free and, if the grab does not go through the player vehicle, switches to the free camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/server/commands.lua:58
---@param usingPlayerVehicle boolean true if the grab uses the player's vehicle
function commands.onNodegrabStart(usingPlayerVehicle) end

--- Hook called at the end of the node grab: emits onNodegrab(false) and returns to the game camera if the free camera had been activated by the grab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/server/commands.lua:66
---@param usingPlayerVehicle boolean true if the grab used the player's vehicle (unused)
function commands.onNodegrabStop(usingPlayerVehicle) end

--- Computes a plan for dropping the vehicle at the camera position without resetting it (the deformation is kept).
---Source: lua/ge/server/commands.lua:106
---@param player integer|nil player index
---@return table|nil  plan {vid, nodeId, clusterId, x, y, z, rx, ry, rz, rw, origin*}, or nil if no vehicle
function commands.planDropPlayerAtCameraNoReset(player) end

--- Switches back to the game camera (bigMap becomes orbit) and resets the player's camera; final step of the drop without reset.
---Source: lua/ge/server/commands.lua:98
---@param player integer|nil player index
function commands.resetDropPlayerAtCameraNoResetCamera(player) end

--- Compatibility alias of setFreeCamera. Called by the C++.
---Source: lua/ge/server/commands.lua:40
---@param player integer|nil player index
function commands.setCameraFree(player) end

--- Compatibility alias of setGameCamera.
---Source: lua/ge/server/commands.lua:33
---@param player integer|nil player index
function commands.setCameraPlayer(player) end

--- Activates the free camera (initialized to the view's current transform), resets it and emits onCameraToggled (FreeCam) for the main view. Called by the C++.
---Source: lua/ge/server/commands.lua:40
---@param player integer|nil player index
function commands.setFreeCamera(player) end

--- Activates the free camera then applies to it the transform described by a JSON string of 7 numbers (x, y, z, qx, qy, qz, qw). Silently ignores invalid or incomplete JSON.
---Source: lua/ge/server/commands.lua:170
---@param json string string produced by getCameraTransformJson
function commands.setFreeCameraTransformJson(json) end

--- Switches back to the game camera for the player's view; emits onCameraToggled (GameCam) for the main view. Alias: setCameraPlayer.
---Source: lua/ge/server/commands.lua:33
---@param player integer|nil player index
function commands.setGameCamera(player) end

--- Toggles the camera: in split screen, toggles the free camera of the player's view; otherwise moves to the next camera group (core_camera.cycleCameraGroup, Shift+C).
---Source: lua/ge/server/commands.lua:156
---@param player integer|nil player index (0 by default)
function commands.toggleCamera(player) end

--- Enables or disables the free camera's fast speed modifier (typically the Shift key).
---Source: lua/ge/server/commands.lua:48
---@param enabled boolean true to speed up
function commands.toggleFastSpeed(enabled) end

--- (Global function, not in M.) Deprecated: use core_camera.getForward.
---Source: lua/ge/server/commands.lua:222
function getCameraForward() end

--- (Global function, not in M.) Deprecated: use core_camera.getFovDeg (returns degrees).
---Source: lua/ge/server/commands.lua:226
function getCameraFov() end

--- (Global function, not in M.) Deprecated: use core_camera.getFovDeg.
---Source: lua/ge/server/commands.lua:224
function getCameraFovDeg() end

--- (Global function, not in M.) Deprecated: use core_camera.getFovRad.
---Source: lua/ge/server/commands.lua:225
function getCameraFovRad() end

--- (Global function, not in M.) Deprecated: use core_camera.getPosition.
---Source: lua/ge/server/commands.lua:219
function getCameraPosition() end

--- (Global function, not in M.) Deprecated: use core_camera.getQuat.
---Source: lua/ge/server/commands.lua:223
function getCameraQuat() end

--- (Global function, not in M.) Deprecated: use core_camera.getRight.
---Source: lua/ge/server/commands.lua:221
function getCameraRight() end

--- (Global function, not in M.) Deprecated: use core_camera.getUp.
---Source: lua/ge/server/commands.lua:220
function getCameraUp() end

--- (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the FOV in degrees if the free camera is active.
---Source: lua/ge/server/commands.lua:213
---@param fovDeg number FOV in degrees
function setCameraFov(fovDeg) end

--- (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the field of view (degrees) if the free camera is active.
---Source: lua/ge/server/commands.lua:197
---@param fovDeg number FOV in degrees
function setCameraFovDeg(fovDeg) end

--- (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the FOV (radians, converted to degrees) if the free camera is active.
---Source: lua/ge/server/commands.lua:207
---@param fovRad number FOV in radians
function setCameraFovRad(fovRad) end

--- (Global function, not in M.) Deprecated: use core_camera.setPosRot. Applies position and quaternion to player 0's camera.
---Source: lua/ge/server/commands.lua:192
---@param px number x
---@param py number y
---@param pz number z
---@param rx number quat x
---@param ry number quat y
---@param rz number quat z
---@param rw number quat w
function setCameraPosRot(px, py, pz, rx, ry, rz, rw) end

