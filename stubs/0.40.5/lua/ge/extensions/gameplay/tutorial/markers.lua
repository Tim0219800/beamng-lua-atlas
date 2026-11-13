---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_tutorial_markers` : `extensions.load("gameplay_tutorial_markers")`, puis la globale `gameplay_tutorial_markers`
---@class gameplay_tutorial_markers
gameplay_tutorial_markers = {}

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:139
---@param parkingSpot any
function gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:193
---@param vehicle any
---@param parkingSpot any
---@param dtReal any
---@param requiredSeconds any
---@param state any
function gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:167
---@param vehicle any
---@param parkingSpot any
function gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:303
function gameplay_tutorial_markers.cleanup() end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:131
function gameplay_tutorial_markers.clearAllMarkers() end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:82
---@param parkingSpot any
---@param scale any
function gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:39
---@param pos any
---@param rot any
---@param scale any
function gameplay_tutorial_markers.createMarker(pos, rot, scale) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:75
---@param vehicle any
---@param scale any
function gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:118
---@param markerId any
function gameplay_tutorial_markers.removeMarker(markerId) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:157
---@param parkingSpotName any
function gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:30
---@param getter any
function gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:163
---@param parkingSpotName any
---@param vehicle any
function gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle) end

---Source : lua/ge/extensions/gameplay/tutorial/markers.lua:231
---@param dt any
---@param dtSim any
function gameplay_tutorial_markers.update(dt, dtSim) end

