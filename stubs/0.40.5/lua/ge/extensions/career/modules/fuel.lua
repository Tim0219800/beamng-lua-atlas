---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/fuel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career mode refueling transaction at a gas station. startTransaction opens the career.refueling screen, reads the player vehicle's tanks (energyStorage), then onUpdate raises the energy of the active tanks at the chosen flow rate, computes the price (station price per unit, possible insurance discount) and sends the data to the UI (initialFuelingData, updateFuelData). payPrice debits the money (or nothing for a work vehicle, paid by the company), uiCancelTransaction restores the starting levels.
--- Access: extension `career_modules_fuel`: `extensions.load("career_modules_fuel")`, then the global `career_modules_fuel`
---@class career_modules_fuel
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_fuel = {}

--- Returns the list of tanks kept for the transaction (energyType, name, currentEnergy, maxEnergy in joules).
---Source: lua/ge/extensions/career/modules/fuel.lua:211
---@return table|nil  List of tanks, nil outside a transaction.
function career_modules_fuel.getFuelData() end

--- Returns, per tank, the energy added (fueledEnergy, joules) and the price (price) of the current transaction.
---Source: lua/ge/extensions/career/modules/fuel.lua:372
---@return table  List of {price, fueledEnergy}.
function career_modules_fuel.getFuelingData() end

--- Indicates whether at least one tank is being filled.
---Source: lua/ge/extensions/career/modules/fuel.lua:473
---@return boolean  true if a fill is active.
function career_modules_fuel.isCurrentlyFueling() end

--- Avoids a total fuel outage: for each tank of the vehicle, fully recharges electric, or sets a nearly empty tank (<= 1%) back to 5%, with an emergency message.
---Source: lua/ge/extensions/career/modules/fuel.lua:617
---@param vehId integer|nil Vehicle; by default the current inventory vehicle.
function career_modules_fuel.minimumRefuelingCheck(vehId) end

--- Hook called when career becomes active or inactive: creates the audio sources (gasoline and electric) if active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/fuel.lua:632
---@param active boolean true on activation.
function career_modules_fuel.onCareerActive(active) end

--- Hook/input action (pump trigger): sets the flow rate as a fraction 0 to 1 of the maximum and starts filling the tank; a factor of 0 stops it and resets the flow rate to the maximum.
---Source: lua/ge/extensions/career/modules/fuel.lua:349
---@param factor number Fraction of the maximum flow rate, clamped to [0, 1].
---@param tankIndex integer|nil Target tank; by default the selected tank.
function career_modules_fuel.onChangeFlowRate(factor, tankIndex) end

--- Level end hook: forgets the refueling sound identifiers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/fuel.lua:637
---@param levelPath string Level path.
function career_modules_fuel.onClientEndMission(levelPath) end

--- Per-frame hook: cancels the transaction if the vehicle moves faster than 2 m/s, advances the active tanks (energy, price rounded to the cent), stops a full tank, sends the data to the UI every 0.1 s, adjusts the pump sound, and displays the ImGui debug window outside shipping builds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/fuel.lua:496
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function career_modules_fuel.onUpdate(dtReal, dtSim) end

--- Pays the total (does nothing if the price is zero or the player does not have enough money), stops filling, records the expense (career_modules_playerAttributes, statistic career/fuel/paidPrice.money), ends the transaction and emits onPaidRefuelling.
---Source: lua/ge/extensions/career/modules/fuel.lua:402
function career_modules_fuel.payPrice() end

--- Asks the player vehicle for its tanks (energyStorage); on reply, filters the tanks, prepares the data and sends initialFuelingData to the UI.
---Source: lua/ge/extensions/career/modules/fuel.lua:198
function career_modules_fuel.requestRefuelingTransactionData() end

--- Sends to the UI (guihook 'updateFuelData') current energy, added energy, price, active state per tank, total price, ability to pay (canPay) and relative flow rate.
---Source: lua/ge/extensions/career/modules/fuel.lua:147
function career_modules_fuel.sendUpdateDataToUI() end

--- Starts a transaction for the current inventory vehicle at the given station: enables the 'Refueling' action map, turns the ignition off (setIgnitionLevel 0), opens the career.refueling screen and emits onRefuelingStartTransaction. Does nothing without a current inventory vehicle.
---Source: lua/ge/extensions/career/modules/fuel.lua:202
---@param _gasStation table Gas station; must contain facility (id, name).
function career_modules_fuel.startTransaction(_gasStation) end

--- Called by the UI: starts filling all the tanks of an energy type.
---Source: lua/ge/extensions/career/modules/fuel.lua:437
---@param energyType string gasoline, diesel, kerosine, n2o or electricEnergy.
function career_modules_fuel.uiButtonStartFueling(energyType) end

--- Called by the UI: selects then starts filling a specific tank.
---Source: lua/ge/extensions/career/modules/fuel.lua:445
---@param index integer Index (starting at 1) in the tank list.
function career_modules_fuel.uiButtonStartFuelingTank(index) end

--- Called by the UI: stops filling the tanks of a type (all if nil) and applies the levels to the vehicle.
---Source: lua/ge/extensions/career/modules/fuel.lua:441
---@param energyType string|nil Energy type.
function career_modules_fuel.uiButtonStopFueling(energyType) end

--- Called by the UI: stops filling a specific tank.
---Source: lua/ge/extensions/career/modules/fuel.lua:455
---@param index integer Tank index.
function career_modules_fuel.uiButtonStopFuelingTank(index) end

--- Cancels the transaction: restores the starting energy levels on the vehicle, without paying, and ends the transaction (back to the 'play' screen, autosave or part conditions update).
---Source: lua/ge/extensions/career/modules/fuel.lua:464
function career_modules_fuel.uiCancelTransaction() end

--- Called by the UI: changes the selected tank (ignored during a fill or if the index is invalid).
---Source: lua/ge/extensions/career/modules/fuel.lua:429
---@param index integer Tank index.
function career_modules_fuel.uiSetSelectedTankIndex(index) end

