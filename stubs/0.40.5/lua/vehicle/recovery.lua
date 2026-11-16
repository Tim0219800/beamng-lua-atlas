---@meta
-- tim19Atlas stub generated from lua/vehicle/recovery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle recovery system ("recover" key). While driving, records a history of positions/orientations every 0.2 s (up to 700 points, a point at least 2 m after the previous one). When recovery is held, the vehicle "rewinds" this path at increasing speed (3 -> 20 -> 50 m/s) with a recovery camera and a beam wireframe, then is teleported to the point reached on release. Also handles the "home" point (saveHome/loadHome) and multiplayer mode (server validation).
--- Access: global `recovery`
---@class recovery
---@field recoveryHooksOnly boolean If true, the recovery input only emits the hooks without modifying the vehicle (First Drive tutorial). False by default.
---@field recoveryPoints dequeue History of recovery points ({pos=vec3, dirFront=vec3, dirUp=vec3}), from oldest (left) to newest (right).
---@field updateGFX function nop at load, then replaced by updateGFXRecord (recording) or updateGFXRecovery (rewind). ⚠ nop reference not defined in the file (game global).
recovery = {}

--- Finalizes a recovery: resets broken flexmesh beams, releases the nodes fixed by the grabber, displays the appropriate message, closes the camera and emits the GE hook onStopRecovering.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:283
---@param timer number|string|nil Recovery duration in seconds (default: measured duration).
function recovery.afterStopRecovering(timer) end

--- Actually enters rewind mode: creates a starting point, switches updateGFX to updateGFXRecovery, emits the GE hook onStartRecovering. Called by startRecovering or after MP authorization.
---Source: lua/vehicle/recovery.lua:491
---@param useAltMode boolean|nil See startRecovering.
function recovery.beginRecoveringPreview(useAltMode) end

--- Cancels the current recovery without teleporting: resumes recording, resets the materials and closes the recovery camera.
---Source: lua/vehicle/recovery.lua:260
function recovery.cancelRecoveringPreview() end

--- Empties the point history, removes homePoint and invalidates the last recovery point.
---Source: lua/vehicle/recovery.lua:50
function recovery.clear() end

--- Switches to recording mode, stores the number of beams and precomputes the relative positions of the nodes with respect to the reference node (to draw the wireframe).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:559
---@param path string Unused (inferred from code).
function recovery.init(path) end

--- Requests the return to the home point (does nothing if there is none). Goes through multiplayer_vehicleSync.requestLoadHome if present, otherwise calls loadHomeLocal on the vehicle side.
---Source: lua/vehicle/recovery.lua:507
---@param moveTraffic boolean|nil Passed to spawn.safeTeleport: also move obstructing traffic.
function recovery.loadHome(moveTraffic) end

--- Immediately teleports the vehicle to the home point and displays 'vehicle.recovery.loadHome'. Called by loadHome (or the MP server).
---Source: lua/vehicle/recovery.lua:521
---@param moveTraffic boolean|nil See loadHome.
function recovery.loadHomeLocal(moveTraffic) end

--- Applies a recovery point validated by the multiplayer server: teleports the vehicle (smart spawn or vehicleSetPositionRotation) then notifies multiplayer_vehicleSync.onVehicleRecoveryApplied.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:180
---@param requestId integer MP request identifier.
---@param action string Action name sent back to the server.
---@param px number X position (m).
---@param py number Y position (m).
---@param pz number Z position (m).
---@param fx number Front direction X.
---@param fy number Front direction Y.
---@param fz number Front direction Z.
---@param ux number Up direction X.
---@param uy number Up direction Y.
---@param uz number Up direction Z.
---@param useSmartSpawnParam boolean|nil Force/forbid smart spawn (otherwise internal value).
---@param player any Player concerned, passed to safeTeleport.
---@param moveTraffic boolean|nil Move obstructing traffic.
function recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic) end

--- Deserialization hook (vehicle Lua reload): merges the saved state into M and rebuilds the recoveryPoints queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:56
---@param v table Saved data.
function recovery.onDeserialized(v) end

--- Hook called in multiplayer when the server allows the recovery: stores requestId and launches beginRecoveringPreview.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:546
---@param requestId integer Request identifier.
---@param useAltMode boolean|string Alternative mode (true or the string 'true').
function recovery.onRecoveringBeginAllowed(requestId, useAltMode) end

--- Hook called in multiplayer when the server denies the recovery: cancels the waiting state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/recovery.lua:551
function recovery.onRecoveringBeginDenied() end

--- Puts the vehicle upright at its current position (recovery point = current state, applied immediately).
---Source: lua/vehicle/recovery.lua:555
function recovery.recoverInPlace() end

--- Stores a home point. Without argument, uses the current position/orientation and displays the message 'vehicle.recovery.saveHome'.
---Source: lua/vehicle/recovery.lua:223
---@param point table|nil Point {pos, dirFront, dirUp}; current position if nil.
function recovery.saveHome(point) end

--- Starts the recovery (key press). In solo mode directly launches beginRecoveringPreview; in multiplayer first requests authorization from the server. Ignored if already in progress.
---Source: lua/vehicle/recovery.lua:527
---@param useAltMode boolean|nil Alternative mode: inverts the 'enableSmartRecovery' setting (false by default).
function recovery.startRecovering(useAltMode) end

--- Requests the end of the recovery (key release); the actual stop and the teleport occur at the next updateGFX.
---Source: lua/vehicle/recovery.lua:274
---@param player any Player that originated the request, passed to the teleport (inferred from code).
function recovery.stopRecovering(player) end

