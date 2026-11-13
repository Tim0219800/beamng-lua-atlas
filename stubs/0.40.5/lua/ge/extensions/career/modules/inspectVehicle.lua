---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inspectVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_inspectVehicle` : `extensions.load("career_modules_inspectVehicle")`, puis la globale `career_modules_inspectVehicle`
---@class career_modules_inspectVehicle
---@field dependencies table
career_modules_inspectVehicle = {}

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:293
---@param buyVehicleOptions any
function career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:471
function career_modules_inspectVehicle.getDidTestDrive() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:403
function career_modules_inspectVehicle.getInspectVehiclePoi() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:388
function career_modules_inspectVehicle.getSpawnedVehicleInfo() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:368
function career_modules_inspectVehicle.isTestDriveDamageDetected() end

--- internal only
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:157
---@param despawnPreviousVehMode any
---@param freezePreviousVeh any
---@param checkDamage any
---@param defaultLeaveMessage any
function career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:443
---@param elemData any
---@param activityData any
function career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:372
---@param status any
---@param id any
function career_modules_inspectVehicle.onAnyMissionChanged(status, id) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:379
function career_modules_inspectVehicle.onDeliveryModeStarted() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:436
---@param levelIdentifier any
---@param elements any
function career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:475
function career_modules_inspectVehicle.onPurchaseMenuClosed() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:482
function career_modules_inspectVehicle.onTestDriveAbandoned() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:364
function career_modules_inspectVehicle.onTestDriveDamageDetected() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:486
function career_modules_inspectVehicle.onTestDriveEndedAfterFade() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:356
function career_modules_inspectVehicle.onTestDriveStarted() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:333
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:349
---@param vehId any
function career_modules_inspectVehicle.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:502
---@param oldId any
---@param newId any
---@param player any
function career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player) end

--- this function is only used during tutorial
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:393
function career_modules_inspectVehicle.repairVehicle() end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:98
---@param vehicleInfo any
function career_modules_inspectVehicle.showVehicle(vehicleInfo) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:222
---@param vehicleInfo any
---@param teleportToVehicle any
---@param job any
function career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job) end

---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:383
function career_modules_inspectVehicle.startTestDrive() end

