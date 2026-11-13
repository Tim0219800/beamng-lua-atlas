---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/valueCalculator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_valueCalculator` : `extensions.load("career_modules_valueCalculator")`, puis la globale `career_modules_valueCalculator`
---@class career_modules_valueCalculator
---@field dependencies table
career_modules_valueCalculator = {}

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:47
---@param value any
---@param vehicleCondition any
function career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:229
function career_modules_valueCalculator.getBrokenPartsThreshold() end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:194
---@param inventoryId any
---@param ignoreDamage any
function career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:200
---@param partConditions any
function career_modules_valueCalculator.getNumberOfBrokenParts(partConditions) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:55
---@param originalParts any
---@param newParts any
---@param changedSlots any
function career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:91
---@param part any
function career_modules_valueCalculator.getPartValue(part) end

--- Vehicle damage related API
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:133
---@param invVehInfo any
function career_modules_valueCalculator.getRepairDetails(invVehInfo) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:33
---@param inventoryId any
function career_modules_valueCalculator.getVehicleMileageById(inventoryId) end

---Source : lua/ge/extensions/career/modules/valueCalculator.lua:219
---@param partConditions any
function career_modules_valueCalculator.partConditionsNeedRepair(partConditions) end

