---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/gasStations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simple refueling management at gas stations (fuel or electric charging). Provides the stations' points of interest (POIs) for the big map and markers, the "refuel" action button and the filling of the vehicle's tanks; in career mode, delegates the transaction to career_modules_fuel. Global: freeroam_gasStations. Depends on gameplay_achievement.
--- Access: extension `freeroam_gasStations`: `extensions.load("freeroam_gasStations")`, then the global `freeroam_gasStations`
---@class freeroam_gasStations
---@field dependencies table
freeroam_gasStations = {}

--- Builds a station's POI element: id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round or poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Electric station if energyTypes contains electricEnergy.
---Source: lua/ge/extensions/freeroam/gasStations.lua:53
---@param gasStation table Station facility.
---@return table  POI element.
function freeroam_gasStations.formatGasStationPoi(gasStation) end

--- Computes the center (average of the pump positions, scene objects named by pump[1]) and the radius (max distance to the center) of a station.
---Source: lua/ge/extensions/freeroam/gasStations.lua:30
---@param f table Station facility with `pumps`: list of pairs whose 1st element is the pump's object name.
---@return vec3  Center.
---@return number  Radius (m).
function freeroam_gasStations.gasStationCenterRadius(f) end

--- Hook collecting a POI's activities: for each element of type gasStation, adds a card (icon, title, props per fuel type, "refuel/recharge/refuelMixed" button whose action calls refuelCar on player vehicle 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/gasStations.lua:80
---@param elemData table[] POI elements.
---@param activityData table[] List to fill.
function freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData) end

--- Hook collecting a level's POIs: adds one POI per station of freeroam_facilities.getFacilities(levelIdentifier).gasStations (under conditions, see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/gasStations.lua:69
---@param levelIdentifier string Level name.
---@param elements table List to fill.
function freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Fills the vehicle: requests its tanks (core_vehicleBridge.requestValue 'energyStorage'), checks compatibility with fuelTypes, fills or launches the career transaction, displays the messages and plays the refueling sound.
---Source: lua/ge/extensions/freeroam/gasStations.lua:123
---@param gasStation table Station's POI element (also used as the argument of career_modules_fuel.startTransaction).
---@param fuelTypes table<string, boolean> Energy types supplied (set).
---@param veh userdata Vehicle object to refuel.
function freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh) end

