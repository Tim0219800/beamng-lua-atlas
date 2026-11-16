---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/collision.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera collision filter.
---@class core_cameraModes_collision
local core_cameraModes_collision = {}

--- Target -> camera distance imposed by collision.
---Source: lua/ge/extensions/core/cameraModes/collision.lua:142
---@return number|nil  distance in meters, nil if there is no collision
function core_cameraModes_collision:collidingCamDistance() end

--- Resets the state (distances, ray index, smoothing) and reads the cameraCollision setting.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/collision.lua:18
function core_cameraModes_collision:init() end

--- Detects geometry that the corner rays do not see: full crossing of a wall in one frame, or a near-plane edge that cuts a surface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/collision.lua:36
---@param rayDestinations vec3[] the 4 corners of the near plane
---@param cornerIdx integer corner 1 to 4 to test
---@return boolean  true if obstacle
function core_cameraModes_collision:isObstacleInFrontOfCam(rayDestinations, cornerIdx) end

--- Hook: re-reads the 'cameraCollision' setting (true by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/collision.lua:30
function core_cameraModes_collision:onSettingsChanged() end

--- Hook: resets the filter (calls init).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/collision.lua:138
function core_cameraModes_collision:onVehicleSwitched() end

--- Computes the new camera position on the target -> camera axis and writes data.res.pos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/collision.lua:54
---@param data table camData
function core_cameraModes_collision:update(data) end

