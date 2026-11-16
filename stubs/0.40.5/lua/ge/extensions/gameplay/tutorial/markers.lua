---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the career tutorial's visual markers: attention markers above a vehicle or at a position, direction markers on a parking spot, and ground decals of parking spots whose color indicates whether the vehicle is properly parked (white: not parked, yellow: parked but badly oriented, green: parked and well oriented). Also provides the parking tests used to validate a parking objective.
--- Access: extension `gameplay_tutorial_markers`: `extensions.load("gameplay_tutorial_markers")`, then the global `gameplay_tutorial_markers`
---@class gameplay_tutorial_markers
gameplay_tutorial_markers = {}

--- Registers a ground decal for a parking spot (displayed by update).
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:139
---@param parkingSpot table Spot with name, pos, rot, scl.
function gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot) end

--- Validates a parking objective: parked, properly oriented and motionless for the requested duration. The timer state is kept in the state table.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:193
---@param vehicle table Vehicle object.
---@param parkingSpot table Parking spot.
---@param dtReal number Real time delta (s).
---@param requiredSeconds number|nil Required stationary duration (1 s by default).
---@param state table|nil State table {stationaryTimer, wasStationary}, to reuse from one call to the next.
---@return boolean  true when the objective is reached.
function gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state) end

--- Tests whether a vehicle is parked in a spot, properly oriented and stationary.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:167
---@param vehicle table Vehicle object.
---@param parkingSpot table Parking spot (checkParking method, rot).
---@return boolean  isParked: parked in the spot (tolerance 0.8).
---@return boolean  isFacingCorrect: compatible orientation (dot product >= 0.7).
---@return boolean  isStationary: speed < 0.1 m/s.
function gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot) end

--- Removes all markers and clears the decals and associated vehicles.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:303
function gameplay_tutorial_markers.cleanup() end

--- Removes all markers.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:131
function gameplay_tutorial_markers.clearAllMarkers() end

--- Creates a direction marker placed 1.75 m above a parking spot, oriented according to the spot's rotation.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:82
---@param parkingSpot table Parking spot with pos, rot (and name).
---@param scale vec3|nil Scale; x is used as the radius (2 by default).
---@return integer|nil  Marker id, or nil if the spot is invalid or loading fails.
function gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale) end

--- Creates an attention marker (scenario/raceMarkers/attention) at a position, 1.75 m above for the visible part, and displays it.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:39
---@param pos vec3 Marker position.
---@param rot quat|nil Optional rotation.
---@param scale vec3|nil Scale (1,1,1 by default).
---@return integer|nil  Marker id, or nil on failure.
function gameplay_tutorial_markers.createMarker(pos, rot, scale) end

--- Creates an attention marker 2 m above a vehicle (scale 1.5 by default).
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:75
---@param vehicle table Vehicle object (getPosition).
---@param scale vec3|nil Marker scale.
---@return integer|nil  Marker id, or nil.
function gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale) end

--- Removes a marker by its id.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:118
---@param markerId integer Id returned on creation.
---@return boolean  true if removed, false if not found.
function gameplay_tutorial_markers.removeMarker(markerId) end

--- Removes a spot's decal and the vehicle that was associated with it.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:157
---@param parkingSpotName string Spot name.
function gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName) end

--- Sets the function that provides the vehicle to test for the parking decals' color, when no vehicle is associated with the spot.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:30
---@param getter function|nil Function with no argument returning a vehicle (object) or nil.
function gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter) end

--- Associates a vehicle with a spot to determine its decal's color.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:163
---@param parkingSpotName string Spot name.
---@param vehicle table|nil Vehicle object.
function gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle) end

--- Updates the markers (scale according to camera distance, update of each marker) then computes and sends the nearby parking decals to Engine.Render.DynamicDecalMgr.
---Source: lua/ge/extensions/gameplay/tutorial/markers.lua:231
---@param dt number Real-time delta.
---@param dtSim number Simulation time delta.
function gameplay_tutorial_markers.update(dt, dtSim) end

