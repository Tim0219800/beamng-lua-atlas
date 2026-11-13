---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/parking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_parking` : `extensions.load("gameplay_parking")`, puis la globale `gameplay_parking`
---@class gameplay_parking
---@field debugLevel number
---@field dependencies table
gameplay_parking = {}

---Source : lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds any
function gameplay_parking.activate(vehIds) end

---Source : lua/ge/extensions/gameplay/parking.lua:155
---@param vehId any
---@param parkingSpot any
---@param minDist any
---@param maxDist any
function gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist) end

---Source : lua/ge/extensions/gameplay/parking.lua:682
function gameplay_parking.deactivate() end

---Source : lua/ge/extensions/gameplay/parking.lua:647
---@param amount any
function gameplay_parking.deleteVehicles(amount) end

---Source : lua/ge/extensions/gameplay/parking.lua:394
---@param vehId any
function gameplay_parking.disableTracking(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:374
---@param vehId any
---@param autoDisable any
function gameplay_parking.enableTracking(vehId, autoDisable) end

---Source : lua/ge/extensions/gameplay/parking.lua:226
---@param psList any
---@param filters any
function gameplay_parking.filterParkingSpots(psList, filters) end

---Source : lua/ge/extensions/gameplay/parking.lua:197
---@param pos any
---@param minRadius any
---@param maxRadius any
function gameplay_parking.findParkingSpots(pos, minRadius, maxRadius) end

---Source : lua/ge/extensions/gameplay/parking.lua:335
---@param vehId any
---@param pos any
---@param minDist any
---@param maxDist any
function gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist) end

---Source : lua/ge/extensions/gameplay/parking.lua:403
---@param vehId any
function gameplay_parking.getCurrentParkingSpot(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly any
function gameplay_parking.getParkedCarsAmount(activeOnly) end

---Source : lua/ge/extensions/gameplay/parking.lua:470
function gameplay_parking.getParkedCarsData() end

---Source : lua/ge/extensions/gameplay/parking.lua:466
function gameplay_parking.getParkedCarsList() end

---Source : lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly any
function gameplay_parking.getParkingAmount(activeOnly) end

---Source : lua/ge/extensions/gameplay/parking.lua:74
function gameplay_parking.getParkingSpots() end

---Source : lua/ge/extensions/gameplay/parking.lua:458
function gameplay_parking.getParkingVars() end

---Source : lua/ge/extensions/gameplay/parking.lua:295
---@param originPos any
---@param minDist any
---@param maxDist any
---@param targetCount any
---@param filters any
function gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters) end

---Source : lua/ge/extensions/gameplay/parking.lua:70
function gameplay_parking.getState() end

---Source : lua/ge/extensions/gameplay/parking.lua:399
function gameplay_parking.getTrackingData() end

---Source : lua/ge/extensions/gameplay/parking.lua:604
---@param vehId any
function gameplay_parking.insertVehicle(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:95
---@param vehId any
---@param parkingSpot any
---@param lowPrecision any
function gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision) end

---Source : lua/ge/extensions/gameplay/parking.lua:1004
function gameplay_parking.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/parking.lua:1001
function gameplay_parking.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/parking.lua:1049
---@param data any
---@param options any
function gameplay_parking.onDeserialized(data, options) end

---Source : lua/ge/extensions/gameplay/parking.lua:1008
---@param options any
function gameplay_parking.onSerialize(options) end

---Source : lua/ge/extensions/gameplay/parking.lua:822
---@param dt any
---@param dtSim any
function gameplay_parking.onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/parking.lua:800
---@param vehId any
---@param active any
function gameplay_parking.onVehicleActiveChanged(vehId, active) end

---Source : lua/ge/extensions/gameplay/parking.lua:787
---@param vehId any
function gameplay_parking.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:772
---@param vehList any
---@param groupId any
---@param groupName any
function gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName) end

---Source : lua/ge/extensions/gameplay/parking.lua:778
---@param vehId any
function gameplay_parking.onVehicleResetted(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds any
function gameplay_parking.processVehicles(vehIds) end

---Source : lua/ge/extensions/gameplay/parking.lua:640
---@param vehId any
function gameplay_parking.removeVehicle(vehId) end

---Source : lua/ge/extensions/gameplay/parking.lua:758
function gameplay_parking.resetAll() end

---Source : lua/ge/extensions/gameplay/parking.lua:362
---@param vehIds any
---@param minDist any
---@param maxDist any
function gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist) end

---Source : lua/ge/extensions/gameplay/parking.lua:453
---@param amount any
function gameplay_parking.setActiveAmount(amount) end

---Source : lua/ge/extensions/gameplay/parking.lua:434
---@param data any
---@param reset any
function gameplay_parking.setParkingVars(data, reset) end

--- public interface
---Source : lua/ge/extensions/gameplay/parking.lua:45
---@param data any
function gameplay_parking.setSites(data) end

---Source : lua/ge/extensions/gameplay/parking.lua:58
---@param val any
function gameplay_parking.setState(val) end

---Source : lua/ge/extensions/gameplay/parking.lua:693
---@param amount any
---@param options any
function gameplay_parking.setupVehicles(amount, options) end

