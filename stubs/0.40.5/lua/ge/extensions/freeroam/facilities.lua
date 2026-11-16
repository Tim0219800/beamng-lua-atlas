---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/facilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of a level's "facilities": garages, gas stations, dealerships, computers, private sellers, delivery providers and dragstrips. Reads the section of these lists in `<level>/info.json` and in `<level>/facilities/*.facilities.json`, normalizes each entry (id, preview, sites file), then gives access to positions (doors, parking spots, zones), garage teleportation and POI generation (big map / gameplay markers). Global: freeroam_facilities.
--- Access: extension `freeroam_facilities`: `extensions.load("freeroam_facilities")`, then the global `freeroam_facilities`
---@class freeroam_facilities
freeroam_facilities = {}

--- Tries to format a facility according to its default clusterType and to apply the facilityPoiDefaults defaults to it (clusterInBigMap, interactableInPlayMode, quickTravelAvailable...). See the bug in the notes.
---Source: lua/ge/extensions/freeroam/facilities.lua:445
---@param f table|nil Facility.
---@param elements table[] List of POIs.
function freeroam_facilities.formatFacilityToRawPoi(f, elements) end

--- Average of the positions of the scene objects listed in facility.doors; zero vec3 with an error log if there are none.
---Source: lua/ge/extensions/freeroam/facilities.lua:135
---@param facility table Facility with `doors`.
---@return vec3  Average position.
function freeroam_facilities.getAverageDoorPositionForFacility(facility) end

--- Position of the door closest to the camera (core_camera.getPosition).
---Source: lua/ge/extensions/freeroam/facilities.lua:156
---@param facility table Facility with `doors`.
---@return vec3|nil  Position or nil.
function freeroam_facilities.getClosestDoorPositionForFacility(facility) end

--- Shortcut for getFacility('dealership', id).
---Source: lua/ge/extensions/freeroam/facilities.lua:132
---@param id string Dealership id.
---@return table|nil  Dealership.
function freeroam_facilities.getDealership(id) end

--- Loads (cache) and returns all the facilities of a level, as a table of lists (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips).
---Source: lua/ge/extensions/freeroam/facilities.lua:78
---@param levelName string Level name.
---@return table<string, table[]>  Lists by type.
function freeroam_facilities.getFacilities(levelName) end

--- List of the facilities of a type for a level (current level by default).
---Source: lua/ge/extensions/freeroam/facilities.lua:117
---@param type string Facility type.
---@param levelName string|nil Level (default getCurrentLevelIdentifier()).
---@return table[]|nil  List, nil without a level.
function freeroam_facilities.getFacilitiesByType(type, levelName) end

--- Looks up a facility by type and id in the current level; error log if the type is invalid or the id not found.
---Source: lua/ge/extensions/freeroam/facilities.lua:101
---@param type string garage, gasStation, dealership, computer, privateSeller, deliveryProvider or dragstrip.
---@param id string Facility id.
---@return table|nil  Facility.
function freeroam_facilities.getFacility(type, id) end

--- Shortcut for getFacility('garage', id).
---Source: lua/ge/extensions/freeroam/facilities.lua:130
---@param id string Garage id.
---@return table|nil  Garage.
function freeroam_facilities.getGarage(id) end

--- Best parking spot (for the vehicle) of the garage whose id is poi.id.
---Source: lua/ge/extensions/freeroam/facilities.lua:248
---@param poi table {id = garageId}
---@param veh userdata|nil Vehicle (default player 0).
---@return vec3|nil  Position.
---@return quat|nil  Rotation.
function freeroam_facilities.getGaragePosRot(poi, veh) end

--- Shortcut for getFacility('gasStation', id).
---Source: lua/ge/extensions/freeroam/facilities.lua:131
---@param id string Station id.
---@return table|nil  Station.
function freeroam_facilities.getGasStation(id) end

--- Loads the facility's sites files (gameplay_sites_sitesManager.loadSites) and returns the parking spots whose names are in facility.parkingSpotNames.
---Source: lua/ge/extensions/freeroam/facilities.lua:179
---@param facility table Facility.
---@return table[]  Parking spots found (not missing).
function freeroam_facilities.getParkingSpotsForFacility(facility) end

--- Same for the zones listed in facility.zoneNames.
---Source: lua/ge/extensions/freeroam/facilities.lua:214
---@param facility table Facility.
---@return table[]  Zones found.
function freeroam_facilities.getZonesForFacility(facility) end

--- Hook collecting the activities offered by a POI: card (icon, title, props, button) for garage (gameplay_garageMode.start), dealership (career_modules_vehicleShopping.openShop), computer (career_modules_computer.openMenu), dragstrip (rules or history screen via gameplay_drag_dragBridge). Stations are handled in gasStations.lua.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities.lua:493
---@param elemData table[] POI elements.
---@param activityData table[] List to fill.
function freeroam_facilities.onActivityAcceptGatherData(elemData, activityData) end

--- Hook collecting a level's POIs: dealerships (except remotePurchaseOnly) and computers in career, dragstrips always.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities.lua:461
---@param levelIdentifier string Level.
---@param elements table[] List to fill.
function freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook collecting the tutorial POIs: dragstrips with isTutorialForDragstrip on the west_coast_usa level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities.lua:482
---@param elements table[] List to fill.
function freeroam_facilities.onGetRawPoiListForTutorial(elements) end

--- Teleports a vehicle to the garage (spawn.safeTeleport), resets the camera, emits onTeleportedToGarage(garageId, veh) and reframes the big map navigation if a route is active.
---Source: lua/ge/extensions/freeroam/facilities.lua:260
---@param garageId string Garage id.
---@param veh userdata Vehicle.
---@param resetVeh boolean|nil Repair/reset the vehicle.
function freeroam_facilities.teleportToGarage(garageId, veh, resetVeh) end

--- Same as walkingMarkerFormatFacility but with a vehicleTrigger-type marker (dragstrips).
---Source: lua/ge/extensions/freeroam/facilities.lua:409
---@param f table Facility with `doors`.
---@param elements table[] List to fill.
function freeroam_facilities.vehicleTriggerFormatFacility(f, elements) end

--- Adds to `elements` a POI with a pedestrian marker (center of the doors, radius = max distance + door radius) and a big map marker.
---Source: lua/ge/extensions/freeroam/facilities.lua:372
---@param f table Facility with `doors`.
---@param elements table[] List to fill.
function freeroam_facilities.walkingMarkerFormatFacility(f, elements) end

--- Adds to `elements` a POI with a zone marker (zones, center = middle of the bounding box placed on the terrain, radius) and a big map marker with teleportation to the garage.
---Source: lua/ge/extensions/freeroam/facilities.lua:353
---@param f table Facility.
---@param elements table[] POI list to complete.
---@param bigMapIcon string|nil Not used.
function freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon) end

