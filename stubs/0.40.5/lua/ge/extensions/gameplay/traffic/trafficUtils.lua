---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/trafficUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_traffic_trafficUtils` : `extensions.load("gameplay_traffic_trafficUtils")`, puis la globale `gameplay_traffic_trafficUtils`
---@class gameplay_traffic_trafficUtils
---@field debugMode boolean
gameplay_traffic_trafficUtils = {}

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:293
---@param pos any
---@param origPos any
---@param minDist any
---@param maxDist any
---@param minVehDist any
---@param n1 any
---@param n2 any
function gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:85
---@param amount any
---@param allMods any
function gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:58
---@param amount any
---@param allMods any
---@param allConfigs any
---@param simpleVehs any
function gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:297
---@param pos any
---@param dir any
---@param mapNode1 any
---@param mapNode2 any
---@param options any
function gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:648
---@param startPos any
---@param startDir any
---@param minDist any
---@param maxDist any
---@param targetDist any
---@param options any
function gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos any
---@param startDir any
---@param minDist any
---@param maxDist any
---@param targetDist any
---@param options any
function gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:452
---@param startPos any
---@param startDir any
---@param minDist any
---@param maxDist any
---@param targetDist any
---@param options any
function gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos any
---@param startDir any
---@param minDist any
---@param maxDist any
---@param targetDist any
---@param options any
function gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:384
---@param startPos any
---@param startDir any
---@param minDist any
---@param maxDist any
---@param targetDist any
---@param options any
function gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:161
---@param pos any
---@param dir any
---@param scale any
---@param useZ0 any
function gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:49
function gameplay_traffic_trafficUtils.getBaseGroupParams() end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:45
function gameplay_traffic_trafficUtils.getBaseValues() end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:26
function gameplay_traffic_trafficUtils.getLevelInfo() end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:678
---@param pos any
---@param filters any
function gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:150
---@param roleName any
function gameplay_traffic_trafficUtils.getRoleConstructor(roleName) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:107
---@param options any
function gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:669
---@param pos any
---@param dir any
---@param options any
function gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options) end

---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:707
---@param speed any
---@param mode any
function gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode) end

