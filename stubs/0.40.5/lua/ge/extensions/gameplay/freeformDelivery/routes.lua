---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/routes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of freeform delivery routes. Builds guidance routes (core_groundMarkers.setPath) to a target area or to a vehicle, with waypoints from a race file or map node names, detects the player's arrival, automatically chooses the route when only one visible goal remains, reacts to couplings (couplerAttachedRoute) and feeds the big map (bigmap) with points of interest and groups.
--- Access: extension `gameplay_freeformDelivery_routes`: `extensions.load("gameplay_freeformDelivery_routes")`, then the global `gameplay_freeformDelivery_routes`
---@class gameplay_freeformDelivery_routes
---@field dependencies string[] gameplay_freeformDelivery_utils, _goals and _markers.
gameplay_freeformDelivery_routes = {}

--- Clears the guidance and forgets the delivery, the routes and the current route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:587
function gameplay_freeformDelivery_routes.cleanup() end

--- Hides the route marker, clears the guidance (core_groundMarkers.resetAll) and updates the task list.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:487
---@return boolean  false if core_groundMarkers is not available, otherwise true.
function gameplay_freeformDelivery_routes.clearRoute() end

--- Active route.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:453
---@return table|nil  {type = 'targetArea'|'vehicle', id, automaticGoalId?} or nil.
function gameplay_freeformDelivery_routes.getCurrentRoute() end

--- Returns the route at the given index (starting at 1).
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:440
---@param index integer 1-based index.
---@return table|nil  Route or nil if out of bounds.
function gameplay_freeformDelivery_routes.getRoute(index) end

--- Number of available routes.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:458
---@return integer  Number of routes.
function gameplay_freeformDelivery_routes.getRouteCount() end

--- Displayable name of a route: translated name of the target area or vehicle, otherwise the id, or the text "unknown route".
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:422
---@param route table Route entry.
---@return string  Name to display.
function gameplay_freeformDelivery_routes.getRouteName(route) end

--- Returns the list of the delivery's routes.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:448
---@return table[]  Routes (delivery.routes).
function gameplay_freeformDelivery_routes.getRoutes() end

--- Position of a target area: pos for a location or a spot, center (or average of the vertices snapped to the terrain) for a zone.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:475
---@param targetAreaId string ID of the target area.
---@return vec3|nil  Position or nil.
function gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId) end

--- Returns the target areas of the active delivery (useful for generating POIs).
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:463
---@return table[]  targetAreas, or empty array without a delivery.
function gameplay_freeformDelivery_routes.getTargetAreas() end

--- Cached position of a vehicle of the active delivery.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:481
---@param vehicleId string ID of the delivery vehicle.
---@return vec3|nil  Position or nil.
function gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId) end

--- Returns the vehicles of the active delivery (useful for generating POIs).
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:469
---@return table[]  vehicles, or empty array without a delivery.
function gameplay_freeformDelivery_routes.getVehicles() end

--- Big map hook: adds the "delivery" group structure (delivery_relevant and the delivery's groups).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1134
---@param customGroupStructures table[] List of structures, modified in place.
function gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures) end

--- Big map hook: creates the delivery_relevant groups and those of bigmapGroups in groupData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1116
---@param groupData table Table of groups, keyed by id, modified in place.
function gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData) end

--- Hook called when two vehicles couple; if one is the player's vehicle and the other has a couplerAttachedRoute, activates that route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1151
---@param objId1 integer ID of the first vehicle.
---@param objId2 integer ID of the second vehicle.
---@param nodeId integer Coupling node of the first vehicle (inferred from code).
---@param obj2nodeId integer Coupling node of the second vehicle (inferred from code).
function gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook called on uncoupling; clears the current route if it matches the couplerAttachedRoute of the uncoupled vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1165
---@param objId1 integer ID of the first vehicle.
---@param objId2 integer ID of the second vehicle.
---@param nodeId integer Coupling node of the first vehicle (inferred from code).
---@param obj2nodeId integer Coupling node of the second vehicle (inferred from code).
---@param breakForce number Breaking force (unused).
function gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- POI system hook: adds the delivery's POIs (target areas and vehicles, with description of the linked goals) when a delivery is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:1147
---@param levelIdentifier string Level identifier (unused).
---@param elements table[] POI list completed in place.
function gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Builds and activates a guidance route to a target area of the delivery (location position, zone center or spot position). Places the route marker, with the zone or spot outline if applicable, and updates the task list message.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:366
---@param targetAreaId string ID of the target area in delivery.targetAreas.
---@param route table|nil Route entry whose params provides waypoints and computation options.
---@return boolean  true if the route is placed; false if core_groundMarkers is missing or if the area, site or position cannot be found.
function gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route) end

--- Builds and activates a guidance route to the cached position of a delivery vehicle.
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:404
---@param vehicleId string Vehicle ID in delivery.vehicles.
---@param route table|nil Route entry (params).
---@return boolean  true if the route is placed.
function gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route) end

--- Initializes the module with the delivery: routes, big map groups, fallback groups otherLocations and otherVehicles for routes and vehicles without a group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:505
---@param delivery table Delivery data.
function gameplay_freeformDelivery_routes.setup(delivery) end

--- Called every frame: checks arrival at the current route then updates the automatic route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/routes.lua:582
---@param dtReal number Not used.
---@param dtSim number Not used.
---@param dtRaw number Not used.
---@param profiler table|nil Not used.
function gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler) end

