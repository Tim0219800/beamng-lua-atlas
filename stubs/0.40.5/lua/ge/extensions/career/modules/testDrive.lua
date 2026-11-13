---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/testDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_testDrive` : `extensions.load("career_modules_testDrive")`, puis la globale `career_modules_testDrive`
---@class career_modules_testDrive
---@field dependencies table
career_modules_testDrive = {}

---Source : lua/ge/extensions/career/modules/testDrive.lua:217
function career_modules_testDrive.abandonTestDrive() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:279
---@param elements any
function career_modules_testDrive.formatTestDriveToRawPoi(elements) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:266
function career_modules_testDrive.getTimeLeft() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:270
function career_modules_testDrive.isActive() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:274
function career_modules_testDrive.isDamageDetected() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:322
function career_modules_testDrive.onBeforeRadialOpened() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:316
---@param active any
function career_modules_testDrive.onCareerActive(active) end

--- poi list stuff
---Source : lua/ge/extensions/career/modules/testDrive.lua:294
---@param levelIdentifier any
---@param elements any
function career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:298
---@param elemData any
---@param promptData any
function career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:252
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:203
---@param amount any
function career_modules_testDrive.onVehicleRepairedByInsurance(amount) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:55
function career_modules_testDrive.resetData() end

---Source : lua/ge/extensions/career/modules/testDrive.lua:111
---@param _vehicleId any
---@param testDriveInfo any
function career_modules_testDrive.start(_vehicleId, testDriveInfo) end

---Source : lua/ge/extensions/career/modules/testDrive.lua:207
---@param userAborted any
function career_modules_testDrive.stop(userAborted) end

