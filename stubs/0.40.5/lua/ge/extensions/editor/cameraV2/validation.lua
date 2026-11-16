---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/validation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared Camera V2 checks to reject NaNs, infinities and extreme coordinates coming from faulty raycasts or camera computations, before applying a position or rotation. Useful to a modder who wants to validate points, quaternions or terrain heights before passing them to the camera.
--- Access: extension `editor_cameraV2_validation`: `extensions.load("editor_cameraV2_validation")`, then the global `editor_cameraV2_validation`
---@class editor_cameraV2_validation
editor_cameraV2_validation = {}

--- True if value is a number that is neither NaN nor infinite.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:14
---@param value any Value to test
---@return boolean  true if finite number
function editor_cameraV2_validation.isFinite(value) end

--- True if point is near the ray segment origin -> origin + direction*maximumDistance: projection on the normalized ray between -0.01 and maximumDistance+0.01, and perpendicular distance <= 1.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:76
---@param point vec3 Point to test
---@param origin vec3 Ray origin
---@param direction vec3 Direction (normalized internally; length <= 0.0001 rejected)
---@param maximumDistance number Maximum segment length (>= 0)
---@return boolean  true if on the segment
function editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance) end

--- True if the value is finite and its absolute value does not exceed 10,000,000.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:35
---@param value any Coordinate
---@return boolean  true if reasonable
function editor_cameraV2_validation.isReasonableCoordinate(value) end

--- True if x, y and z are reasonable coordinates.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:45
---@param point table|nil Point with x, y, z
---@return boolean|nil  true/false, or nil if point is nil
function editor_cameraV2_validation.isReasonablePoint(point) end

--- True if x and y are reasonable coordinates.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:39
---@param point table|nil Point with x, y
---@return boolean|nil  true/false, or nil if point is nil
function editor_cameraV2_validation.isReasonableXY(point) end

--- Alias of isFinite for a coordinate.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:21
---@param value any Coordinate
---@return boolean  true if finite
function editor_cameraV2_validation.isValidCoordinate(value) end

--- True if x, y and z are finite numbers.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:31
---@param point table|nil Point with x, y, z
---@return boolean|nil  true/false, or nil if point is nil
function editor_cameraV2_validation.isValidPoint(point) end

--- True if x, y, z, w are finite and if x²+y²+z²+w² is in [0.25; 2.25].
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:49
---@param rotation table|nil Quaternion with x, y, z, w
---@return boolean  true if valid
function editor_cameraV2_validation.isValidQuaternion(rotation) end

--- True if the height is finite and |height| <= 1,000,000.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:66
---@param value any Height
---@return boolean  true if valid
function editor_cameraV2_validation.isValidTerrainHeight(value) end

--- True if point.x and point.y are finite numbers.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:25
---@param point table|nil Table with x and y fields (vec3 possible)
---@return boolean|nil  true/false, or nil if point is nil
function editor_cameraV2_validation.isValidXY(point) end

--- Queries core_terrain.getTerrainHeight(vec3(x, y, 0)) for a reasonable point and returns the height if it is valid.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:70
---@param point table Point with x, y
---@return number|nil  Terrain height, or nil if the point or the height is invalid
function editor_cameraV2_validation.terrainHeightAt(point) end

--- Returns the coordinate limit used by the 'reasonable' tests.
---Source: lua/ge/extensions/editor/cameraV2/validation.lua:98
---@return number  10000000
function editor_cameraV2_validation.worldCoordinateLimit() end

