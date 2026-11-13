---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/parkingSpot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/sites/parkingSpot.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_sites_parkingSpot
local gameplay_sites_parkingSpot = {}

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:347
---@param extentsX any
---@param extentsY any
---@param extentsZ any
function gameplay_sites_parkingSpot:boxFits(extentsX, extentsY, extentsZ) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:244
function gameplay_sites_parkingSpot:calcVerts() end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:294
---@param vehId any
---@param precision any
---@param drivingSpeed any
---@param parkingSpeed any
function gameplay_sites_parkingSpot:checkParking(vehId, precision, drivingSpeed, parkingSpeed) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:257
---@param pos any
function gameplay_sites_parkingSpot:containsPoint(pos) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:87
---@param drawMode any
---@param clr any
---@param customHeight any
---@param drawDirection any
function gameplay_sites_parkingSpot:drawDebug(drawMode, clr, customHeight, drawDirection) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:176
---@param a any
---@param b any
---@param z any
---@param clrI any
function gameplay_sites_parkingSpot:drawSide(a, b, z, clrI) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:198
---@param parkingSpotList any
---@param skipSort any
function gameplay_sites_parkingSpot:generateMultiSpots(parkingSpotList, skipSort) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:83
function gameplay_sites_parkingSpot:getPath() end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:359
---@param playerId any
function gameplay_sites_parkingSpot:hasAnyVehicles(playerId) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:17
---@param sites any
---@param name any
---@param forceId any
function gameplay_sites_parkingSpot:init(sites, name, forceId) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:399
---@param vehId any
---@param lowPrecision any
---@param backwards any
---@param addedOffsetPos any
---@param addedOffsetRot any
---@param useSafeTeleport any
---@param removeTraffic any
---@param resetVehicleInSafeTeleport any
---@param options any
function gameplay_sites_parkingSpot:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:55
---@param data any
function gameplay_sites_parkingSpot:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:35
function gameplay_sites_parkingSpot:onSerialize() end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:70
---@param pos any
---@param rot any
---@param scl any
function gameplay_sites_parkingSpot:set(pos, rot, scl) end

---Source : lua/ge/extensions/gameplay/sites/parkingSpot.lua:351
---@param vehId any
function gameplay_sites_parkingSpot:vehicleFits(vehId) end

