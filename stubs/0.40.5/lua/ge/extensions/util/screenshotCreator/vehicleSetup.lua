---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Physical setup of the vehicle before a thumbnail: replaces it at the starting point (first SpawnSphere of the level, otherwise a fallback position), applies the configured thumbnail rotation (thumbnailConfig.getRotation), aligns it to the ground and waits for it to settle. Also provides ground measurements under a bounding box (used by procedural framing) and turning on the low beams.
--- Access: extension `util_screenshotCreator_vehicleSetup`: `extensions.load("util_screenshotCreator_vehicleSetup")`, then the global `util_screenshotCreator_vehicleSetup`
---@class util_screenshotCreator_vehicleSetup
---@field dependencies string[] Extension loaded before: util_screenshotCreator_thumbnailConfig.
util_screenshotCreator_vehicleSetup = {}

--- Finds the ground height under a bounding box by casting the ray from the top of the box (useful for accessories with buried nodes, such as bollards). Falls back to the bottom of the box if no ground is hit.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:46
---@param bb table OOBB with getPoint(i) and getCenter().
---@return number  Ground Z height in meters.
function util_screenshotCreator_vehicleSetup.getFloorHeight(bb) end

--- Casts a static ray downward (0.5 m above, 2 m below) from the given position and returns the ground height, or the height of the position if the ground is not found or is inconsistent.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:29
---@param position vec3 World position.
---@return number  Ground Z height in meters.
function util_screenshotCreator_vehicleSetup.getGroundHeight(position) end

--- Returns the position and rotation to use to put the vehicle back: the stored original ones if a thumbnail rotation had been applied, otherwise its current pose.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:96
---@param vehicle table Vehicle object.
---@return vec3  Position.
---@return quat  Rotation.
function util_screenshotCreator_vehicleSetup.getResetTransform(vehicle) end

--- Returns the position and rotation of the first SpawnSphere object in the scene, the starting point of thumbnails.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:89
---@return vec3|nil  Position, nil if there is no SpawnSphere.
---@return quat|nil  Rotation.
function util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform() end

--- Hook called when a vehicle spawns: forgets the thumbnail rotation stored for this vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:149
---@param vehicleId integer Vehicle identifier.
function util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId) end

--- Resets the vehicle (vehicle:reset), teleports it to the starting point with the config's thumbnail rotation, then aligns it to the ground (two coroutine.yield).
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:102
---@param vehicle table Vehicle object.
---@param configName string Configuration name (for the thumbnail rotation).
---@param fallbackPosition vec3|nil Position used if there is no SpawnSphere.
---@param fallbackRotation quat|nil Rotation used if there is no SpawnSphere.
function util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation) end

--- If enabled is true, sends electrics.setLightsState(1) (low beams) to the vehicle. Does nothing otherwise.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:143
---@param vehicle table Vehicle object.
---@param enabled boolean Turn on the lights.
function util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled) end

--- Waits (yielding every frame) for the vehicle's settle time.
---Source: lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:135
---@param modelName string Model name.
---@param configName string Configuration name.
---@param options table|nil {settleDelay = seconds} (default 2).
function util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options) end

