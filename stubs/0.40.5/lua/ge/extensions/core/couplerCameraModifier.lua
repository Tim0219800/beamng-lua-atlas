---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/couplerCameraModifier.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- When player 0's vehicle is hitched to a trailer (distance between the two vehicles between 1 and 15 m, one of the two of type "Trailer"), this extension locks their orbit cameras, sets their distance to (d1+d2)/1.5+1 and recenters the player's camera on the middle of the hitch every frame. On separation, on reload or if the gap becomes too large, the orbit cameras are restored. Active only if the 'couplerCameraModifier' setting is true (otherwise onExtensionLoaded returns false).
--- Access: extension `core_couplerCameraModifier`: `extensions.load("core_couplerCameraModifier")`, then the global `core_couplerCameraModifier`
---@class core_couplerCameraModifier
---@field dependencies string[] {"core_trailerRespawn"}: loaded before (provides getConfigType).
core_couplerCameraModifier = {}

--- Tells whether two vehicles form a nearby hitch with a trailer: different ids, at least one of type "Trailer" (core_trailerRespawn.getConfigType) and distance between 1 and 15 m.
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:19
---@param objId1_ integer id of the first vehicle
---@param objId2_ integer id of the second vehicle
---@return boolean  true if it is a hitch with a trailer
function core_couplerCameraModifier.checkForTrailer(objId1_, objId2_) end

--- Hook: two vehicles hitch together; if one is player 0's vehicle and checkForTrailer is true, starts tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:107
---@param objId1_ integer vehicle 1 id
---@param objId2_ integer vehicle 2 id
function core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_) end

--- Hook: called for any detachment in the world; stops tracking only if it concerns the tracked pair.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:118
---@param objId1_ integer vehicle 1 id
---@param objId2_ integer vehicle 2 id
function core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_) end

--- Hook: restores objId1, objId2, detached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:215
---@param data table|nil table returned by onSerialize
function core_couplerCameraModifier.onDeserialized(data) end

--- Hook: if the couplerCameraModifier setting is active, takes over an already existing hitch of player 0's vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:102
function core_couplerCameraModifier.onExtensionLoaded() end

--- Hook: restores the original orbit cameras (restoreOriginalCamera).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:52
function core_couplerCameraModifier.onExtensionUnloaded() end

--- Hook: saves objId1, objId2, detached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:207
---@return table  data to serialize
function core_couplerCameraModifier.onSerialize() end

--- Per-frame hook: computes the average position of the two orbit cameras and applies setTargetMode(vid, 'notCenter') + setRef(vid, middle, left, rear) to the player's vehicle; restores if the cameras are farther apart than the sum of the orbit distances.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:125
function core_couplerCameraModifier.onUpdate() end

--- Hook: if one of the tracked vehicles is replaced, stops tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:201
---@param vehId integer vehicle id
function core_couplerCameraModifier.onVehicleSpawned(vehId) end

--- Hook: the player changes vehicle; looks for a hitch for the new one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/couplerCameraModifier.lua:197
---@param oldId integer old id
---@param newId integer new id
---@param player integer player number (unused)
function core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player) end

