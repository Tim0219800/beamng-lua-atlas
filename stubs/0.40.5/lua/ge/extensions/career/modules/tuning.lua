---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tuning.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tuning menu of a career inventory vehicle, from the garage computer. It reads the vehicle's tuning variables, applies changes by respawning the vehicle, builds a shopping cart (categories, subcategories, prices, 7% taxes) sent to the UI, and debits the money on confirmation. A capsule tether cancels the purchases if the player moves away from the garage.
--- Access: extension `career_modules_tuning`: `extensions.load("career_modules_tuning")`, then the global `career_modules_tuning`
---@class career_modules_tuning
---@field dependencies string[] {"career_career", "gameplay_achievement"}.
career_modules_tuning = {}

--- Merges new tuning values into the vehicle config, respawns it at the same position and rotation, freezes it, triggers the onCareerTuningApplied hook, updates the modified variables and recomputes the cart.
---Source: lua/ge/extensions/career/modules/tuning.lua:310
---@param tuningValues table<string, number> Tuning variables (e.g. "$gear_1") and their value.
---@param callback function|nil Passed to career_modules_inventory.spawnVehicle.
function career_modules_tuning.apply(tuningValues, callback) end

--- Confirms the purchase: invalidates the certification, marks the vehicle modified, debits the total, unlocks the achievement, plays the sound, then saves (if autosave) before closing, otherwise closes directly.
---Source: lua/ge/extensions/career/modules/tuning.lua:152
function career_modules_tuning.applyShopping() end

--- Cancels: reapplies the original variables then closes the menu. Also called by the tether when the player moves away.
---Source: lua/ge/extensions/career/modules/tuning.lua:346
function career_modules_tuning.cancelShopping() end

--- Closes the menu: returns to the computer menu (or closes all career menus), unfreezes the vehicle and removes the tether.
---Source: lua/ge/extensions/career/modules/tuning.lua:350
function career_modules_tuning.close() end

--- Returns the current vehicle's tuning data (variables translated by core_vehicle_partmgmt), without the variables hidden in career.
---Source: lua/ge/extensions/career/modules/tuning.lua:183
---@return table|nil  Tuning variables, or nil if the vehicle is not found.
function career_modules_tuning.getTuningData() end

--- Garage computer hook: adds the "tuning" button for each garage vehicle. Disabled if the vehicle needs repair, if the starter vehicle is not bought or if permissions deny the tuning/vehicleModification tags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tuning.lua:364
---@param menuData table Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Table to fill (vehicleSpecific[inventoryId][id]).
function career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook called at the end of a vehicle save; closes the menu if closing was waiting for the save.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tuning.lua:168
function career_modules_tuning.onVehicleSaveFinished() end

--- Resets a variable to its original value, removes it from the cart and sends the UI (updateTuningVariable).
---Source: lua/ge/extensions/career/modules/tuning.lua:333
---@param varName string Tuning variable name.
function career_modules_tuning.removeVarFromShoppingCart(varName) end

--- Opens tuning for an inventory vehicle. Remembers the original variables, fills in missing default values, offers a repair if few parts are broken (below the valueCalculator threshold), then navigates to career.computer.tuning, creates the cart and the tether. Does nothing if the vehicle has not appeared on the map.
---Source: lua/ge/extensions/career/modules/tuning.lua:289
---@param _inventoryId integer|nil Inventory id; by default, the first one of the nearest garage.
---@param _originComputerId any Id of the originating garage computer (otherwise no UI or tether).
function career_modules_tuning.start(_inventoryId, _originComputerId) end

