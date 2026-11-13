---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tuning.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tuning` : `extensions.load("career_modules_tuning")`, puis la globale `career_modules_tuning`
---@class career_modules_tuning
---@field dependencies table
career_modules_tuning = {}

---Source : lua/ge/extensions/career/modules/tuning.lua:310
---@param tuningValues any
---@param callback any
function career_modules_tuning.apply(tuningValues, callback) end

---Source : lua/ge/extensions/career/modules/tuning.lua:152
function career_modules_tuning.applyShopping() end

---Source : lua/ge/extensions/career/modules/tuning.lua:346
function career_modules_tuning.cancelShopping() end

---Source : lua/ge/extensions/career/modules/tuning.lua:350
function career_modules_tuning.close() end

---Source : lua/ge/extensions/career/modules/tuning.lua:183
function career_modules_tuning.getTuningData() end

---Source : lua/ge/extensions/career/modules/tuning.lua:364
---@param menuData any
---@param computerFunctions any
function career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/tuning.lua:168
function career_modules_tuning.onVehicleSaveFinished() end

---Source : lua/ge/extensions/career/modules/tuning.lua:333
---@param varName any
function career_modules_tuning.removeVarFromShoppingCart(varName) end

---Source : lua/ge/extensions/career/modules/tuning.lua:289
---@param _inventoryId any
---@param _originComputerId any
function career_modules_tuning.start(_inventoryId, _originComputerId) end

