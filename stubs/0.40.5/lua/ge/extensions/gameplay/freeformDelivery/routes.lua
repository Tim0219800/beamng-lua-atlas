---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/routes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_freeformDelivery_routes` : `extensions.load("gameplay_freeformDelivery_routes")`, puis la globale `gameplay_freeformDelivery_routes`
---@class gameplay_freeformDelivery_routes
---@field dependencies table
gameplay_freeformDelivery_routes = {}

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:587
function gameplay_freeformDelivery_routes.cleanup() end

--- Clear current route
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:487
function gameplay_freeformDelivery_routes.clearRoute() end

--- Get current active route
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:453
function gameplay_freeformDelivery_routes.getCurrentRoute() end

--- Get route by index
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:440
---@param index any
function gameplay_freeformDelivery_routes.getRoute(index) end

--- Get route count
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:458
function gameplay_freeformDelivery_routes.getRouteCount() end

--- Get route display name
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:422
---@param route any
function gameplay_freeformDelivery_routes.getRouteName(route) end

--- Get all available routes
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:448
function gameplay_freeformDelivery_routes.getRoutes() end

--- Get target area position (public API)
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:475
---@param targetAreaId any
function gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId) end

--- Get all target areas (for POI generation)
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:463
function gameplay_freeformDelivery_routes.getTargetAreas() end

--- Get vehicle position (public API)
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:481
---@param vehicleId any
function gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId) end

--- Get all vehicles (for POI generation)
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:469
function gameplay_freeformDelivery_routes.getVehicles() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1134
---@param customGroupStructures any
function gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures) end

--- Bigmap handlers
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1116
---@param groupData any
function gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1151
---@param objId1 any
---@param objId2 any
---@param nodeId any
---@param obj2nodeId any
function gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1165
---@param objId1 any
---@param objId2 any
---@param nodeId any
---@param obj2nodeId any
---@param breakForce any
function gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1147
---@param levelIdentifier any
---@param elements any
function gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Set route to a target area
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:366
---@param targetAreaId any
---@param route any
function gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route) end

--- Set route to a vehicle
---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:404
---@param vehicleId any
---@param route any
function gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:505
---@param delivery any
function gameplay_freeformDelivery_routes.setup(delivery) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/routes.lua:582
---@param dtReal any
---@param dtSim any
---@param dtRaw any
---@param profiler any
function gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler) end

