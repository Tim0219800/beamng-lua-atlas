---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/recoveryCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Temporary free camera during a vehicle's "recovery" (rewind/respawn). beginRecoveryCamera switches the player seated in that vehicle to free camera, setRecoveryCameraPosRot moves it, endRecoveryCamera restores the game camera. If the player was already in free camera, nothing is changed. In practice called from the vehicle's recovery code.
--- Access: extension `core_recoveryCamera`: `extensions.load("core_recoveryCamera")`, then the global `core_recoveryCamera`
---@class core_recoveryCamera
core_recoveryCamera = {}

--- Starts the recovery camera for the player seated in the vehicle: remembers whether it was already in free camera, otherwise calls commands.setFreeCamera(player).
---Source: lua/ge/extensions/core/recoveryCamera.lua:27
---@param vehicleId integer Id of the vehicle in recovery.
function core_recoveryCamera.beginRecoveryCamera(vehicleId) end

--- Ends the recovery: forgets the state and puts the game camera back (commands.setGameCamera) if the free camera had been enabled by beginRecoveryCamera.
---Source: lua/ge/extensions/core/recoveryCamera.lua:45
---@param vehicleId integer Vehicle id.
function core_recoveryCamera.endRecoveryCamera(vehicleId) end

--- Hook called when an object is deleted: forgets a recovery in progress for this vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryCamera.lua:52
---@param vehicleId integer Id of the deleted object.
function core_recoveryCamera.onDespawnObject(vehicleId) end

--- Places the player's camera (core_camera.setPosRot). No effect if no recovery is active for this vehicle or if the player was already in free camera.
---Source: lua/ge/extensions/core/recoveryCamera.lua:38
---@param vehicleId integer Vehicle id.
---@param px number Position x (m).
---@param py number Position y (m).
---@param pz number Position z (m).
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
function core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw) end

