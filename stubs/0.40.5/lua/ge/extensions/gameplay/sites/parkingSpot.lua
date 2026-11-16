---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/parkingSpot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parking spot object. Fields: sites, id, name, color, vertices (4 2D corners), pos, rot, scl, isMultiSpot, multiSpotData {spotAmount, spotOffset, spotDirection, spotRotation}, wasGenerated, isProcedural, customFields.
---@class gameplay_sites_parkingSpot
local gameplay_sites_parkingSpot = {}

--- Tests whether a box of given dimensions fits in the spot's dimensions (per-axis comparison, no rotation).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:347
---@param extentsX number Width.
---@param extentsY number Length.
---@param extentsZ number Height.
---@return boolean  true if it fits.
function gameplay_sites_parkingSpot:boxFits(extentsX, extentsY, extentsZ) end

--- Recalculates the 4 2D corners (vertices) from pos, rot and scl.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:244
function gameplay_sites_parkingSpot:calcVerts() end

--- Checks whether a vehicle is correctly parked: low speed, aligned with the spot's axis (|cos| >= 0.707) and the corners of its bounding box inside. With precision <= 0, only the vehicle's center is tested.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:294
---@param vehId integer Vehicle identifier.
---@param precision number|nil Fraction (0..1) from the center toward each corner to test; default 0.8.
---@param drivingSpeed number|nil Max speed (m/s) to test; default 5.
---@param parkingSpeed number|nil Max speed (m/s) to be valid; default 1.
---@return boolean  true if parked.
---@return boolean[]  State of the 4 corners (order depends on front/back).
function gameplay_sites_parkingSpot:checkParking(vehId, precision, drivingSpeed, parkingSpeed) end

--- Tests whether a point is inside the spot's volume (oriented box, with a quick radius check).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:257
---@param pos vec3 World point.
---@return boolean  true if inside the spot.
function gameplay_sites_parkingSpot:containsPoint(pos) end

--- Draws the spot in debug (surface, direction, name depending on the mode). Ignores procedural spots.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:87
---@param drawMode string|nil 'none', 'faded', 'normal' or 'highlight'.
---@param clr table|nil Color {r,g,b}.
---@param customHeight number|nil Custom drawing height.
---@param drawDirection boolean|nil Draw the direction arrow (default true).
function gameplay_sites_parkingSpot:drawDebug(drawMode, clr, customHeight, drawDirection) end

--- Draws a vertical side of the spot between two points (debug aid).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:176
---@param a vec3 First point.
---@param b vec3 Second point.
---@param z number Side height.
---@param clrI any ColorI color (inferred from code).
function gameplay_sites_parkingSpot:drawSide(a, b, z, clrI) end

--- For a multi-spot, creates the additional spots (name "<name>.<n>") offset according to spotDirection/spotOffset, with the spotRotation rotation, and copies tags and custom fields. Acts only once (wasGenerated).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:198
---@param parkingSpotList table Sorted list (sites.parkingSpots) in which to create the spots.
---@param skipSort boolean|nil Do not re-sort on each creation.
function gameplay_sites_parkingSpot:generateMultiSpots(parkingSpotList, skipSort) end

--- Text identifier of the spot: folder + file of the sites set + "#" + name.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:83
---@return string  Path of the form dir..filename#name.
function gameplay_sites_parkingSpot:getPath() end

--- Indicates whether an active vehicle occupies the spot (bounding box center inside it; for vehicles tracked by map, edges are also tested).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:359
---@param playerId integer|nil Identifier of a vehicle to ignore.
---@return boolean  true if at least one vehicle.
---@return integer[]  Identifiers of the vehicles present (may contain duplicates).
function gameplay_sites_parkingSpot:hasAnyVehicles(playerId) end

--- Constructor. Default name "Parking <id>".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:17
---@param sites table Parent sites object.
---@param name string|nil Name.
---@param forceId integer|nil Imposed identifier.
function gameplay_sites_parkingSpot:init(sites, name, forceId) end

--- Places a vehicle on the spot, aligned to its rotation. With useSafeTeleport, goes through spawn.safeTeleport; otherwise computes the bounding box offset, positions the vehicle, resets the flexmesh and calls autoplace.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:399
---@param vehId integer Vehicle identifier.
---@param lowPrecision boolean|nil To use if the vehicle has just been loaded on the first frame (invalid OOBB): places the vehicle 2 m behind and 0.5 m above.
---@param backwards boolean|nil Orient the vehicle in the opposite direction.
---@param addedOffsetPos vec3|nil Position offset (vehicle frame, x/y).
---@param addedOffsetRot quat|nil Additional rotation.
---@param useSafeTeleport boolean|nil Use spawn.safeTeleport.
---@param removeTraffic boolean|nil Passed to safeTeleport.
---@param resetVehicleInSafeTeleport boolean|nil Passed to safeTeleport.
---@param options table|nil Options; skipVehicleIntersectionCheck is passed to safeTeleport.
---@return vec3|nil  New position (nil if vehicle not found).
---@return quat  Applied rotation.
function gameplay_sites_parkingSpot:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options) end

--- Restores the spot from the data and recalculates the corners.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:55
---@param data table Data from onSerialize.
function gameplay_sites_parkingSpot:onDeserialized(data) end

--- Serializes the spot (position, original rotation, dimensions, multi-spot parameters, color, custom fields).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:35
---@return table  JSON-compatible data.
function gameplay_sites_parkingSpot:onSerialize() end

--- Changes position, rotation and/or dimensions (nil values ignored) and recalculates the corners.
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:70
---@param pos vec3|nil Center position.
---@param rot quat|nil Rotation.
---@param scl vec3|nil Dimensions (width, length, height).
function gameplay_sites_parkingSpot:set(pos, rot, scl) end

--- Tests whether the vehicle fits (initial node bounding box, initialNodePosBB).
---Source: lua/ge/extensions/gameplay/sites/parkingSpot.lua:351
---@param vehId integer Vehicle identifier.
---@return boolean  true if it fits; false if the vehicle does not exist.
function gameplay_sites_parkingSpot:vehicleFits(vehId) end

