---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility functions shared by the freeform delivery submodules: vehicle position cache, site object lookup (locations, zones, parking spots), tests for a vehicle's presence in a target area, path resolution, time formatting and player access (vehicle or on foot).
--- Access: extension `gameplay_freeformDelivery_utils`: `extensions.load("gameplay_freeformDelivery_utils")`, then the global `gameplay_freeformDelivery_utils`
---@class gameplay_freeformDelivery_utils
gameplay_freeformDelivery_utils = {}

--- Unified presence test: location (distance <= radius), zone (containsVehicle) or parking spot.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:114
---@param veh table Vehicle object.
---@param siteObj table Site object.
---@param areaType string "location", "zone" or "parkingSpot".
---@return boolean  true if the vehicle is in the area.
function gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType) end

--- Tests whether a vehicle is parked in a spot via parkingSpot:checkParking(vehId, 0.8).
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:101
---@param veh table Vehicle object.
---@param parkingSpot table Parking spot object.
---@return boolean  Result of checkParking, false if an argument is missing.
function gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot) end

--- Clears the entire position cache.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:63
function gameplay_freeformDelivery_utils.clearVehicleCache() end

--- Finds a site object (location, zone or parking spot) by type and identifier.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:81
---@param sites table|nil Sites table with locations, zones, parkingSpots (each with byName and objects).
---@param siteType string "location", "zone" or "parkingSpot".
---@param siteId string|integer Name or index of the object.
---@return table|nil  Site object or nil.
function gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId) end

--- Finds a target area by id in delivery.targetAreas.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:152
---@param delivery table Delivery data.
---@param areaId string ID of the target area.
---@return table|nil  Target area or nil.
function gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId) end

--- Finds a vehicle's definition by id in delivery.vehicles.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:163
---@param delivery table Delivery data.
---@param vehicleId string ID of the delivery vehicle.
---@return table|nil  Vehicle definition or nil.
function gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId) end

--- Formats a duration in seconds as H:MM:SS (if at least one hour) or M:SS.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:68
---@param seconds number Duration in seconds.
---@return string  Formatted string.
function gameplay_freeformDelivery_utils.formatTime(seconds) end

--- Returns a vehicle's cached position (computes it on the first call).
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:46
---@param veh table Vehicle object.
---@return vec3|nil  Shared position, do not modify; nil if veh is invalid.
function gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh) end

--- Details a vehicle's parking in a spot: number of corners in the spot (0 to 4), validity and spot size.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:214
---@param veh table Vehicle object.
---@param parkingSpot table Parking spot object.
---@return table|nil  {valid, cornerCount, corners, spotSize={x,y,z}}; nil if no corner is in the spot.
function gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot) end

--- Player position: cached position of their vehicle, otherwise the position of the character if walking (gameplay_walk).
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:199
---@return vec3|nil  Position or nil.
function gameplay_freeformDelivery_utils.getPlayerPosition() end

--- Returns player 0's vehicle (upcast).
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:192
---@return table|nil  Vehicle object or nil.
function gameplay_freeformDelivery_utils.getPlayerVehicle() end

--- Normalizes a goal: returns goal.vehicleIds, or {goal.vehicleId}, or an empty array.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:96
---@param goal table Delivery goal.
---@return string[]  List of delivery vehicle IDs.
function gameplay_freeformDelivery_utils.getVehicleIds(goal) end

--- Converts a delivery vehicle ID into a vehicle object (via gameplay_freeformDelivery_setup.getVehicleId then Sim.upcast).
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:174
---@param vehicleId string ID of the delivery vehicle.
---@return table|nil  Upcast vehicle object or nil.
function gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId) end

--- Cached position of the vehicle designated by its delivery ID.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:185
---@param vehicleId string ID of the delivery vehicle.
---@return vec3|nil  Cached position or nil.
function gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId) end

--- Resolves a relative path against the folder of a base file. A path starting with '/' is returned as is.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:132
---@param basePath string Path of the reference file.
---@param relativePath string|nil Path to resolve.
---@return string|nil  Resolved path, nil if relativePath is nil or folder not found.
function gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath) end

--- Updates a vehicle's cached position (without allocation) and marks it valid.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:22
---@param veh table Vehicle object (getID, getPositionXYZ).
function gameplay_freeformDelivery_utils.updateVehicleCache(veh) end

--- Updates the cache for each vehicle of a list.
---Source: lua/ge/extensions/gameplay/freeformDelivery/utils.lua:37
---@param vehicles table[] List of vehicle objects.
function gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles) end

