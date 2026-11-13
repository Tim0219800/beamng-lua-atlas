---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_freeformDelivery_utils` : `extensions.load("gameplay_freeformDelivery_utils")`, puis la globale `gameplay_freeformDelivery_utils`
---@class gameplay_freeformDelivery_utils
gameplay_freeformDelivery_utils = {}

--- Check if vehicle is in area (unified function for location, zone, parkingSpot)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:114
---@param veh any
---@param siteObj any
---@param areaType any
function gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType) end

--- Check if vehicle is in parking spot (uses parkingSpot:checkParking)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:101
---@param veh any
---@param parkingSpot any
function gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot) end

--- Clear vehicle cache
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:63
function gameplay_freeformDelivery_utils.clearVehicleCache() end

--- Find site object by type and ID
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:81
---@param sites any
---@param siteType any
---@param siteId any
function gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId) end

--- Find target area by ID in delivery data
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:152
---@param delivery any
---@param areaId any
function gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId) end

--- Find vehicle by ID in delivery data
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:163
---@param delivery any
---@param vehicleId any
function gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId) end

--- Format time in seconds to HH:MM:SS or MM:SS
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:68
---@param seconds any
function gameplay_freeformDelivery_utils.formatTime(seconds) end

--- Get cached vehicle position (returns cached vec3, don't modify!)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:46
---@param veh any
function gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh) end

--- Get parking information for a vehicle in a parking spot (uses parkingSpot:checkParking only)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:214
---@param veh any
---@param parkingSpot any
function gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot) end

--- Get player position (handles both vehicle and walking)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:199
function gameplay_freeformDelivery_utils.getPlayerPosition() end

--- Get player vehicle (upcasted)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:192
function gameplay_freeformDelivery_utils.getPlayerVehicle() end

--- Get vehicle IDs from goal (normalize vehicleId to vehicleIds array)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:96
---@param goal any
function gameplay_freeformDelivery_utils.getVehicleIds(goal) end

--- Get vehicle object by delivery vehicle ID (returns upcasted vehicle)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:174
---@param vehicleId any
function gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId) end

--- Get vehicle position by delivery vehicle ID (uses cached position)
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:185
---@param vehicleId any
function gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId) end

--- Resolve relative path to absolute path based on base path
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:132
---@param basePath any
---@param relativePath any
function gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath) end

--- Update vehicle cache for a specific vehicle
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:22
---@param veh any
function gameplay_freeformDelivery_utils.updateVehicleCache(veh) end

--- Update cache for all vehicles in a list
---Source : lua/ge/extensions/gameplay/freeformDelivery/utils.lua:37
---@param vehicles any
function gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles) end

