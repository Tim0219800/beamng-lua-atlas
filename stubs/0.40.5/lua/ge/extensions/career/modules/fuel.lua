---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/fuel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_fuel` : `extensions.load("career_modules_fuel")`, puis la globale `career_modules_fuel`
---@class career_modules_fuel
---@field dependencies table
career_modules_fuel = {}

---Source : lua/ge/extensions/career/modules/fuel.lua:211
function career_modules_fuel.getFuelData() end

---Source : lua/ge/extensions/career/modules/fuel.lua:372
function career_modules_fuel.getFuelingData() end

---Source : lua/ge/extensions/career/modules/fuel.lua:473
function career_modules_fuel.isCurrentlyFueling() end

---Source : lua/ge/extensions/career/modules/fuel.lua:617
---@param vehId any
function career_modules_fuel.minimumRefuelingCheck(vehId) end

---Source : lua/ge/extensions/career/modules/fuel.lua:632
---@param active any
function career_modules_fuel.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/fuel.lua:349
---@param factor any
---@param tankIndex any
function career_modules_fuel.onChangeFlowRate(factor, tankIndex) end

---Source : lua/ge/extensions/career/modules/fuel.lua:637
---@param levelPath any
function career_modules_fuel.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/career/modules/fuel.lua:496
---@param dtReal any
---@param dtSim any
function career_modules_fuel.onUpdate(dtReal, dtSim) end

---Source : lua/ge/extensions/career/modules/fuel.lua:402
function career_modules_fuel.payPrice() end

---Source : lua/ge/extensions/career/modules/fuel.lua:198
function career_modules_fuel.requestRefuelingTransactionData() end

---Source : lua/ge/extensions/career/modules/fuel.lua:147
function career_modules_fuel.sendUpdateDataToUI() end

---Source : lua/ge/extensions/career/modules/fuel.lua:202
---@param _gasStation any
function career_modules_fuel.startTransaction(_gasStation) end

--- Called by UI
---Source : lua/ge/extensions/career/modules/fuel.lua:437
---@param energyType any
function career_modules_fuel.uiButtonStartFueling(energyType) end

---Source : lua/ge/extensions/career/modules/fuel.lua:445
---@param index any
function career_modules_fuel.uiButtonStartFuelingTank(index) end

---Source : lua/ge/extensions/career/modules/fuel.lua:441
---@param energyType any
function career_modules_fuel.uiButtonStopFueling(energyType) end

---Source : lua/ge/extensions/career/modules/fuel.lua:455
---@param index any
function career_modules_fuel.uiButtonStopFuelingTank(index) end

---Source : lua/ge/extensions/career/modules/fuel.lua:464
function career_modules_fuel.uiCancelTransaction() end

---Source : lua/ge/extensions/career/modules/fuel.lua:429
---@param index any
function career_modules_fuel.uiSetSelectedTankIndex(index) end

