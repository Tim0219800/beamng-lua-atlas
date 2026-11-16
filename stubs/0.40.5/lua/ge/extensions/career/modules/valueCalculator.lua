---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/valueCalculator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation of the value and repair state of career vehicles and parts: depreciation per year of age (depreciationByYear table), loss related to mileage (odometer), scrap value (5% of the value), value of an inventory vehicle taking added/removed parts and damage into account, repair cost and duration (parts with integrity 0).
--- Access: extension `career_modules_valueCalculator`: `extensions.load("career_modules_valueCalculator")`, then the global `career_modules_valueCalculator`
---@class career_modules_valueCalculator
---@field dependencies string[] {'career_career'}.
career_modules_valueCalculator = {}

--- Adjusted value of an item according to its age and mileage: yearly depreciation, mileage loss, plus the scrap value.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:47
---@param value number Base value.
---@param vehicleCondition table {age = years, mileage = odometer}.
---@return number  Adjusted value.
function career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition) end

--- Returns the broken parts threshold (3).
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:229
---@return integer  Threshold.
function career_modules_valueCalculator.getBrokenPartsThreshold() end

--- Current value of an inventory vehicle (adjusted base + parts - repairs, floored at the minimum value).
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:194
---@param inventoryId integer Inventory id.
---@param ignoreDamage boolean|nil If true, does not deduct the repair cost.
---@return number|nil  Value, or nil if the vehicle does not exist.
function career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage) end

--- Counts the parts whose integrityValue is 0.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:200
---@param partConditions table|nil Conditions per part path.
---@return integer  Number of broken parts (0 if the argument is not a table).
function career_modules_valueCalculator.getNumberOfBrokenParts(partConditions) end

--- Compares a vehicle's original parts to the current parts and returns the added and removed parts per slot.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:55
---@param originalParts table<string, table> Original parts per slot (with .name).
---@param newParts table<string, string> Names of the current parts per slot.
---@param changedSlots table<string, boolean> Modified slots (to detect an identical part being replaced).
---@return table<string, string>  addedParts (slot -> name).
---@return table  removedParts.
function career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots) end

--- Value of a part: value adjusted by age and mileage, -5% if primered, reduced according to the number of repairs.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:91
---@param part table Part with value, year, partCondition.odometer, primered, repairCount.
---@return number  Part value.
function career_modules_valueCalculator.getPartValue(part) end

--- Damage API: computes the price, duration and number of parts to replace for an inventory vehicle.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:133
---@param invVehInfo table Inventory vehicle (id, partConditions, config.partsTree).
---@return table  {price, repairTime, partsCountToBeReplaced}.
function career_modules_valueCalculator.getRepairDetails(invVehInfo) end

--- Returns the mileage (odometer of the main part) of an inventory vehicle. 0 if not found.
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:33
---@param inventoryId integer Inventory id.
---@return number  Odometer (game unit for partCondition.odometer, inferred from code).
function career_modules_valueCalculator.getVehicleMileageById(inventoryId) end

--- Indicates whether the number of broken parts reaches the threshold (3).
---Source: lua/ge/extensions/career/modules/valueCalculator.lua:219
---@param partConditions table|nil Conditions per part path.
---@return boolean  true if the vehicle needs repair.
function career_modules_valueCalculator.partConditionsNeedRepair(partConditions) end

