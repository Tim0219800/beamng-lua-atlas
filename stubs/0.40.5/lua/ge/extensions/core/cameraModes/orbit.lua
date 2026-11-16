---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/orbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orbit mode. Fields: camRot (vec3 degrees: x yaw, y pitch), camDist, camMinDist, camMaxDist, defaultDistance, defaultRotation, fov, offset, orbitOffset, mode, target, lockCamera, collision (instance of the collision filter), smoothingEnabled.
---@class core_cameraModes_orbit
local core_cameraModes_orbit = {}

--- Computes (once, cached in dynamicPitchLimit) the maximum downward pitch that keeps the bottom of the vehicle's rear in the field of view.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:53
---@param data table camData (uses data.veh)
---@param targetPos vec3 world aimed point
---@return number  angle in radians (>= 0)
function core_cameraModes_orbit:calculateDynamicPitchLimit(data, targetPos) end

--- Restores the state from serialize and keeps the restored rotation.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:153
---@param s table serialize table
function core_cameraModes_orbit:deserialize(s) end

--- Creates the state, the collision filter, then calls onVehicleCameraConfigChanged, onSettingsChanged and reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:27
function core_cameraModes_orbit:init() end

--- Settings exposed to the camera control UI: dist, smooth, fov.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:169
---@return table[]  parameter descriptors
function core_cameraModes_orbit:listParams() end

--- Hook: re-reads the cameraOrbit* settings and forwards to the collision filter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:115
function core_cameraModes_orbit:onSettingsChanged() end

--- Hook: reloads distances, default rotation, mode, FOV and resets the dynamic pitch.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:91
function core_cameraModes_orbit:onVehicleCameraConfigChanged() end

--- Hook: forwards to the collision filter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:127
function core_cameraModes_orbit:onVehicleSwitched() end

--- Reschedules the camera recentering (3 frames) and resets the collision filter; no effect if a recentering is already in progress.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:131
function core_cameraModes_orbit:reset() end

--- State for video stream views (core_camera get/setContextCameraState): rotation, distance, FOV.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:145
---@return table  {rot={x,y,z}, dist, fov}
function core_cameraModes_orbit:serialize() end

--- Sets the default distance (used when recentering).
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:210
---@param d number meters
function core_cameraModes_orbit:setDefaultDistance(d) end

--- Sets the default rotation when recentering.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:222
---@param rot vec3 x yaw, y pitch in degrees
function core_cameraModes_orbit:setDefaultRotation(rot) end

--- Sets the current distance.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:214
---@param d number meters
function core_cameraModes_orbit:setDistance(d) end

--- Sets the base FOV.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:164
---@param fov number degrees
function core_cameraModes_orbit:setFOV(fov) end

--- Sets the maximum zoom distance.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:218
---@param d number meters
function core_cameraModes_orbit:setMaxDistance(d) end

--- Sets orbitOffset, a world offset added to the camera position.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:183
---@param v vec3 offset (m)
function core_cameraModes_orbit:setOffset(v) end

--- Changes dist, smooth or fov.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:177
---@param key string dist, smooth, fov
---@param value any new value
function core_cameraModes_orbit:setParam(key, value) end

--- Imposes the target point and the frame in world coordinates (center nil = back to following the vehicle's nodes; a change triggers reset).
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:196
---@param center vec3|nil world center
---@param left vec3|nil world left point
---@param back vec3|nil world rear point
function core_cameraModes_orbit:setRef(center, left, back) end

--- Sets the vehicle's reference nodes and the rear node for the dynamic FOV.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:187
---@param centerNodeID integer center node
---@param leftNodeID integer left node
---@param backNodeID integer rear node
---@param dynamicFovRearNodeID integer|nil rear node whose on-screen size stays constant during the dynamic FOV effect
function core_cameraModes_orbit:setRefNodes(centerNodeID, leftNodeID, backNodeID, dynamicFovRearNodeID) end

--- Sets the orbit rotation.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:139
---@param rot vec3 x yaw, y pitch in degrees
function core_cameraModes_orbit:setRotation(rot) end

--- Disables the speed-based dynamic FOV.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:226
---@param skip boolean true to ignore it
function core_cameraModes_orbit:setSkipFovModifier(skip) end

--- Chooses the target mode ('ref' by default) and the camera offset base.
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:205
---@param targetMode string for example 'ref' or 'notCenter'
---@param camBase vec3|nil base offset in the vehicle frame, nil = computed from offset
function core_cameraModes_orbit:setTargetMode(targetMode, camBase) end

--- Computes the orbit pose and writes data.res (pos, rot, fov, targetPos, collisionCompatible = true), then applies the collision filter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/orbit.lua:248
---@param data table camData (data.lookBack, data.speed, data.fastSpeedModifier, data.teleported read)
---@return boolean  false if the reference nodes are degenerate, otherwise true
function core_cameraModes_orbit:update(data) end

