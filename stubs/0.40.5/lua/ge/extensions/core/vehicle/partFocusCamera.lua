---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partFocusCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_partFocusCamera`: drives the hidden camera mode 'partFocus' from the parts menu. From the selected parts, computes a bounding box (size from the meshes, position from the jbeam nodes, which follow the vehicle live), sets the camera distance to frame it (FOV 35°, margin 1.2) and moves it smoothly. Requests wait 0.5 s for the selection to stabilize, unless the immediate option is set. Gives the camera back to the player when the selection stays empty.
--- Access: extension `core_vehicle_partFocusCamera`: `extensions.load("core_vehicle_partFocusCamera")`, then the global `core_vehicle_partFocusCamera`
---@class core_vehicle_partFocusCamera
---@field debugDrawPivot boolean false by default; true marks the center of the box with a sphere.
---@field dependencies string[] {'core_vehicle_configTarget'}
---@field onExtensionUnloaded function Alias of clear.
---@field onSerialize function Alias of clear.
---@field updateInterval number Box re-measure interval, in seconds (0.1).
core_vehicle_partFocusCamera = {}

--- Cancels the requests, leaves the partFocus mode (back to the previous camera, 'orbit' by default) and removes the PartCamera action map.
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:354
function core_vehicle_partFocusCamera.clear() end

--- Returns and resets the accumulated zoom notches (called by the camera mode).
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:437
---@return number  accumulated notches
function core_vehicle_partFocusCamera.consumeZoomSteps() end

--- Asks the camera to frame a set of parts. Repeated identical requests are ignored (the delay is not restarted). An empty list falls back to release().
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:312
---@param inVehId integer vehicle
---@param partNames table<string, boolean> [part path] = true
---@param selectedMeshes table|nil part meshes (provided by core_vehicle_partmgmt), used to measure the size
---@param playerId integer|nil player whose camera is driven
---@param cameraOptions table|nil see notes: immediate, focusOffsetUp, distanceMultiplier, preserveDistance
function core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions) end

--- Indicates whether the part camera is active (a vehicle is framed).
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:429
---@return boolean  true if active
function core_vehicle_partFocusCamera.isActive() end

--- Per-frame hook: counts down the wait delay (real time, because the configuration menu often runs paused) then applies the request or releases the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:477
---@param dtReal number real elapsed time (s)
function core_vehicle_partFocusCamera.onUpdate(dtReal) end

--- Hook: the configuration target changes; releases the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:515
function core_vehicle_partFocusCamera.onVehicleConfigTargetChanged() end

--- Hook: the framed vehicle is destroyed; releases the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:497
---@param destroyedId integer vehicle
function core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId) end

--- Hook: the vehicle is reset; forces an immediate re-measure of the box.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:490
---@param resettedId integer vehicle
function core_vehicle_partFocusCamera.onVehicleResetted(resettedId) end

--- Hook: the framed vehicle is recreated; keeps the last camera pose.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:503
---@param spawnedId integer vehicle
function core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId) end

--- Hook: the driven player leaves the framed vehicle; releases the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:509
---@param oldId integer old vehicle
---@param newId integer new vehicle
---@param player integer player
function core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player) end

--- Gives the camera back to the player once the selection stays empty for settleDelay (0.5 s), or immediately.
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:343
---@param immediate boolean|nil true: releases right away (clear)
function core_vehicle_partFocusCamera.release(immediate) end

--- Called by the partFocus camera mode every frame: periodically re-measures the box, rebuilds the box in world space, draws it and sets the camera's aim point.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:446
---@param dt number elapsed time (s)
---@param cam table|nil camera mode object (setRef, setDefaultDistance, retarget)
function core_vehicle_partFocusCamera.updateTarget(dt, cam) end

--- Adds mouse wheel notches (zoom) to be applied by the camera mode.
---Source: lua/ge/extensions/core/vehicle/partFocusCamera.lua:433
---@param value number number of notches (sign = direction)
function core_vehicle_partFocusCamera.zoomStep(value) end

