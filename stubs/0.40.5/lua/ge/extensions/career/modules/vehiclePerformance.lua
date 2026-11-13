---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_vehiclePerformance` : `extensions.load("career_modules_vehiclePerformance")`, puis la globale `career_modules_vehiclePerformance`
---@class career_modules_vehiclePerformance
---@field dependencies table
career_modules_vehiclePerformance = {}

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:537
---@param performanceData any
function career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:546
---@param delay any
---@param userAborted any
function career_modules_vehiclePerformance.cancelTest(delay, userAborted) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:616
function career_modules_vehiclePerformance.getActiveVehicleUiData() end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:509
---@param inventoryId any
function career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:516
---@param inventoryId any
function career_modules_vehiclePerformance.getVehicleClass(inventoryId) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:56
---@param inventoryId any
function career_modules_vehiclePerformance.invalidateCertification(inventoryId) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:637
function career_modules_vehiclePerformance.isTestInProgress() end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:555
---@param data any
function career_modules_vehiclePerformance.onBeamNGTrigger(data) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:588
---@param menuData any
---@param computerFunctions any
function career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:580
---@param vehId any
---@param dial any
function career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial) end

--- Router lifecycle: attach the active vehicle data into routeData so the UI
---  reads it from the routeData store instead of fetching it on mount.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:623
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:75
---@param dtReal any
function career_modules_vehiclePerformance.onUpdate(dtReal) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:627
---@param damageData any
---@param damageDataDelta any
function career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:611
---@param options any
function career_modules_vehiclePerformance.openMenu(options) end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:116
function career_modules_vehiclePerformance.startDragTest() end

---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:523
---@param performanceData any
function career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData) end

