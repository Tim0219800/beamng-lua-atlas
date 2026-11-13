---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_general` : `extensions.load("career_modules_delivery_general")`, puis la globale `career_modules_delivery_general`
---@class career_modules_delivery_general
---@field dependencies table
career_modules_delivery_general = {}

---Source : lua/ge/extensions/career/modules/delivery/general.lua:990
function career_modules_delivery_general.checkExitDeliveryMode() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:957
function career_modules_delivery_general.exitDeliveryMode() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:29
function career_modules_delivery_general.getDeliveryAbandonPenaltyFactor() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1046
---@param onlyVehIdsAsKeys any
function career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:295
function career_modules_delivery_general.getMostRecentCargoContainerData() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:192
---@param callback any
function career_modules_delivery_general.getNearbyVehicleCargoContainers(callback) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1030
function career_modules_delivery_general.getSettings() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:171
---@param vehId any
function career_modules_delivery_general.getVehicleName(vehId) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:998
function career_modules_delivery_general.isAutomaticRouteEnabled() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1044
function career_modules_delivery_general.isDeliveryModeActive() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:37
function career_modules_delivery_general.loadSaveData() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:642
---@param elemData any
---@param activityData any
function career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1111
---@param change any
function career_modules_delivery_general.onAnyMissionChanged(change) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:10
function career_modules_delivery_general.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:155
---@param active any
function career_modules_delivery_general.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1090
function career_modules_delivery_general.onCareerPaintingStarted() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1097
function career_modules_delivery_general.onCareerTuningStarted() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:939
---@param tags any
---@param permissions any
function career_modules_delivery_general.onCheckPermission(tags, permissions) end

--- poi list stuff
---Source : lua/ge/extensions/career/modules/delivery/general.lua:505
---@param levelIdentifier any
---@param elements any
function career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1152
---@param inventoryId any
---@param vehId any
function career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1083
function career_modules_delivery_general.onPartShoppingStarted() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1147
---@param invVehId any
function career_modules_delivery_general.onRepairInGarage(invVehId) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:75
---@param currentSavePath any
function career_modules_delivery_general.onSaveCurrentProfile(currentSavePath) end

--- Deactivate automatic route when setting a manual waypoint
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1020
function career_modules_delivery_general.onSetBigmapNavFocus() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1104
---@param garageId any
---@param veh any
function career_modules_delivery_general.onTeleportedToGarage(garageId, veh) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:420
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:333
function career_modules_delivery_general.requestUpdateContainerWeights() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1003
---@param enabled any
function career_modules_delivery_general.setAutomaticRoute(enabled) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:419
---@param paused any
function career_modules_delivery_general.setDeliveryTimePaused(paused) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1014
---@param enabled any
function career_modules_delivery_general.setDetailedDropOff(enabled) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:1026
---@param key any
---@param value any
function career_modules_delivery_general.setSetting(key, value) end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:949
function career_modules_delivery_general.startDeliveryMode() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:165
function career_modules_delivery_general.time() end

---Source : lua/ge/extensions/career/modules/delivery/general.lua:334
---@param delayCallback any
function career_modules_delivery_general.updateContainerWeights(delayCallback) end

