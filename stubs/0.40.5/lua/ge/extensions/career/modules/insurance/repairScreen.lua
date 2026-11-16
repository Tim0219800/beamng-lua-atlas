---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/repairScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prepares the data and handles opening/closing of the repair screen (UI route career.computer.repair) reachable from the garage computer in career. It builds the repair options with or without insurance (damage cost, repair delays from instant to 10 minutes, deductible, current and future premium after a claim, driver score), adds the "Repair" function to the computer functions and applies a 7 m tether around the computer.
--- Access: extension `career_modules_insurance_repairScreen`: `extensions.load("career_modules_insurance_repairScreen")`, then the global `career_modules_insurance_repairScreen`
---@class career_modules_insurance_repairScreen
---@field dependencies table<integer, string> Extensions loaded before: valueCalculator, inventory, playerAttributes, payment, insurance_insurance, tether, etc.
career_modules_insurance_repairScreen = {}

--- Called by the UI to close the screen; ignored while a vehicle save after repair is in progress.
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:196
function career_modules_insurance_repairScreen.closeMenu() end

--- Closes the screen: goes back to the originating computer's menu, or closes all career menus.
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:34
function career_modules_insurance_repairScreen.closeRepairMenu() end

--- Builds the screen data: repairOptions (noInsuranceRepairData, insuranceRepairData with premium, deductible, renewal, tolerances), vehicleData (damage cost, name, initial value, thumbnail, insured), player attributes, tiers and current and future driver score.
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:96
---@return table  Data for the UI.
function career_modules_insurance_repairScreen.getRepairData() end

--- Garage computer hook: adds the "repair" function for each vehicle in the garage (disabled before the starter vehicle is bought or if the 'vehicleRepair' permissions forbid it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:43
---@param menuData table Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Functions to complete (vehicleSpecific[inventoryId][id]).
function career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions) end

--- Menu close hook: removes the leash.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:188
function career_modules_insurance_repairScreen.onMenuClosed() end

--- Vehicle save end hook: if a repair was waiting for this, closes the screen again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:207
function career_modules_insurance_repairScreen.onVehicleSaveFinished() end

--- Opens a vehicle's repair screen. If an originating computer is given, starts a leash (door or sphere, 7 m) that closes the menus if the player moves away.
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:13
---@param vehicle table Data of the inventory vehicle to repair.
---@param _originComputerId string|nil Identifier of the garage computer that opened the screen.
function career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId) end

--- Starts the repair via career_modules_insurance_insurance.startRepairInGarage and waits for the vehicle save to finish before closing the screen again.
---Source: lua/ge/extensions/career/modules/insurance/repairScreen.lua:201
---@param invVehId integer Inventory vehicle identifier.
---@param repairOptionData table Chosen repair option (insurance or not, delay).
function career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData) end

