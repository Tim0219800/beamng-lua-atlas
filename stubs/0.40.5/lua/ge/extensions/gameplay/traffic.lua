---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_traffic` : `extensions.load("gameplay_traffic")`, puis la globale `gameplay_traffic`
---@class gameplay_traffic
---@field debugMode boolean
---@field dependencies table
---@field showMessages boolean
gameplay_traffic = {}

---Source : lua/ge/extensions/gameplay/traffic.lua:966
---@param vehList any
function gameplay_traffic.activate(vehList) end

---Source : lua/ge/extensions/gameplay/traffic.lua:992
---@param stopAi any
function gameplay_traffic.deactivate(stopAi) end

---Source : lua/ge/extensions/gameplay/traffic.lua:956
function gameplay_traffic.deleteVehicles() end

---Source : lua/ge/extensions/gameplay/traffic.lua:99
---@param providerName any
---@param count any
function gameplay_traffic.ensureReservedVehicles(providerName, count) end

---Source : lua/ge/extensions/gameplay/traffic.lua:508
---@param id any
---@param pos any
---@param dir any
---@param minDist any
---@param maxDist any
---@param targetDist any
function gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist) end

---Source : lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds any
---@param minDist any
---@param maxDist any
function gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1219
---@param options any
function gameplay_traffic.freezeState(options) end

---Source : lua/ge/extensions/gameplay/traffic.lua:383
function gameplay_traffic.getFocus() end

---Source : lua/ge/extensions/gameplay/traffic.lua:276
---@param amount any
---@param enforceLimit any
function gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit) end

---Source : lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly any
function gameplay_traffic.getNumOfTraffic(activeOnly) end

---Source : lua/ge/extensions/gameplay/traffic.lua:297
function gameplay_traffic.getState() end

---Source : lua/ge/extensions/gameplay/traffic.lua:309
function gameplay_traffic.getTraffic() end

---Source : lua/ge/extensions/gameplay/traffic.lua:305
function gameplay_traffic.getTrafficAiVehIds() end

---Source : lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly any
function gameplay_traffic.getTrafficAmount(activeOnly) end

---Source : lua/ge/extensions/gameplay/traffic.lua:309
function gameplay_traffic.getTrafficData() end

---Source : lua/ge/extensions/gameplay/traffic.lua:305
function gameplay_traffic.getTrafficList() end

---Source : lua/ge/extensions/gameplay/traffic.lua:347
function gameplay_traffic.getTrafficVars() end

---Source : lua/ge/extensions/gameplay/traffic.lua:778
---@param id any
---@param ignoreAi any
---@param ignoreVehPool any
function gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1566
function gameplay_traffic.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1554
function gameplay_traffic.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1639
---@param data any
---@param options any
function gameplay_traffic.onDeserialized(data, options) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1558
function gameplay_traffic.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1493
---@param dt any
function gameplay_traffic.onPreRender(dt) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1591
---@param options any
function gameplay_traffic.onSerialize(options) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1562
function gameplay_traffic.onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1516
function gameplay_traffic.onTrafficStarted() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1547
function gameplay_traffic.onTrafficStopped() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1574
function gameplay_traffic.onUiWaitingState() end

---Source : lua/ge/extensions/gameplay/traffic.lua:1417
---@param dtReal any
---@param dtSim any
function gameplay_traffic.onUpdate(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/traffic.lua:936
---@param vehId any
---@param active any
function gameplay_traffic.onVehicleActiveChanged(vehId, active) end

---Source : lua/ge/extensions/gameplay/traffic.lua:923
---@param id any
function gameplay_traffic.onVehicleDestroyed(id) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1346
---@param vehList any
---@param groupId any
---@param groupName any
function gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1335
---@param id any
function gameplay_traffic.onVehicleMapmgrUpdate(id) end

---Source : lua/ge/extensions/gameplay/traffic.lua:905
---@param id any
function gameplay_traffic.onVehicleResetted(id) end

---Source : lua/ge/extensions/gameplay/traffic.lua:890
---@param id any
function gameplay_traffic.onVehicleSpawned(id) end

---Source : lua/ge/extensions/gameplay/traffic.lua:901
---@param oldId any
---@param newId any
function gameplay_traffic.onVehicleSwitched(oldId, newId) end

--- protects a non-reserved vehicle while a provider uses it (same protections as a claimed reserve)
---Source : lua/ge/extensions/gameplay/traffic.lua:259
---@param id any
---@param providerName any
function gameplay_traffic.protectNonReservedVehicle(id, providerName) end

---Source : lua/ge/extensions/gameplay/traffic.lua:226
---@param providerName any
---@param id any
---@param spawnData any
function gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData) end

---Source : lua/ge/extensions/gameplay/traffic.lua:688
function gameplay_traffic.refreshVehicles() end

---Source : lua/ge/extensions/gameplay/traffic.lua:76
---@param provider any
function gameplay_traffic.registerSpecialVehicleProvider(provider) end

---Source : lua/ge/extensions/gameplay/traffic.lua:147
---@param providerName any
function gameplay_traffic.removeReservedVehicles(providerName) end

---Source : lua/ge/extensions/gameplay/traffic.lua:840
---@param id any
---@param stopAi any
function gameplay_traffic.removeTraffic(id, stopAi) end

---Source : lua/ge/extensions/gameplay/traffic.lua:488
---@param id any
---@param pos any
---@param rot any
---@param strict any
function gameplay_traffic.respawnVehicle(id, pos, rot, strict) end

--- returns in-service reserves to the dormant pool. They keep driving normally until traffic next
---  teleports/pools them out of sight, where they deactivate instead of respawning (setVehToDormant).
---Source : lua/ge/extensions/gameplay/traffic.lua:215
---@param ids any
---@param immediate any
function gameplay_traffic.returnReservedVehicle(ids, immediate) end

---Source : lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds any
---@param minDist any
---@param maxDist any
function gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist) end

---Source : lua/ge/extensions/gameplay/traffic.lua:773
---@param amount any
function gameplay_traffic.setActiveAmount(amount) end

---Source : lua/ge/extensions/gameplay/traffic.lua:768
---@param value any
function gameplay_traffic.setDebugMode(value) end

---Source : lua/ge/extensions/gameplay/traffic.lua:351
---@param mode any
---@param data any
function gameplay_traffic.setFocus(mode, data) end

---Source : lua/ge/extensions/gameplay/traffic.lua:713
---@param data any
---@param reset any
function gameplay_traffic.setTrafficVars(data, reset) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1184
---@param amount any
---@param params any
function gameplay_traffic.setupCustomTraffic(amount, params) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1008
---@param amount any
---@param options any
function gameplay_traffic.setupTraffic(amount, options) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1150
---@param trafficAmount any
---@param trafficOptions any
---@param parkingAmount any
---@param parkingOptions any
---@param extraOptions any
function gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1168
---@param useTraffic any
---@param useParked any
---@param options any
function gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options) end

--- public interface
---Source : lua/ge/extensions/gameplay/traffic.lua:998
---@param amount any
---@param groupData any
---@param options any
function gameplay_traffic.spawnTraffic(amount, groupData, options) end

--- spawns and de-spawns traffic vehicles in freeroam
---  keepInMemory allows instantenous reactivation at the expense of RAM consumption when traffic is disabled
---Source : lua/ge/extensions/gameplay/traffic.lua:1193
---@param keepInMemory any
function gameplay_traffic.toggle(keepInMemory) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1330
---@param mode any
function gameplay_traffic.trackAIAllVeh(mode) end

---Source : lua/ge/extensions/gameplay/traffic.lua:1226
---@param trafficData any
---@param policeData any
---@param parkingData any
---@param options any
function gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options) end

--- removes protection from a non-reserved vehicle, returning it to normal traffic
---Source : lua/ge/extensions/gameplay/traffic.lua:264
---@param id any
function gameplay_traffic.unprotectNonReservedVehicle(id) end

---Source : lua/ge/extensions/gameplay/traffic.lua:90
---@param name any
function gameplay_traffic.unregisterSpecialVehicleProvider(name) end

--- puts up to `count` dormant reserves of a provider into service and activates them. Returns the ids.
---Source : lua/ge/extensions/gameplay/traffic.lua:195
---@param providerName any
---@param count any
---@param onClaim any
---@param filter any
function gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter) end

