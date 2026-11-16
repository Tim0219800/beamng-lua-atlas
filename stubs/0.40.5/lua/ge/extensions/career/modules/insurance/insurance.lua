---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/insurance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career mode vehicle insurance and repair system. It loads the definitions from gameplay/insurance (providers, classes, coverage options, perks, driver score tiers), records for each inventory vehicle (invVehs) its insurance and options, tracks the distance driven to renew the policy every 100 km, grant goodwill gestures (free repair) and raise the driver score, computes the premiums (vehicle value x class rate x options x group discount x score tier multiplier), processes claims and repairs (instant or delayed, deductible, roadside assistance) and feeds the UI (guihooks insurancesData, chooseInsuranceData).
--- Access: extension `career_modules_insurance_insurance`: `extensions.load("career_modules_insurance_insurance")`, then the global `career_modules_insurance_insurance`
---@class career_modules_insurance_insurance
---@field dependencies table<integer, string> Extensions loaded before: career_career, payment, playerAttributes, insurance_history, tether, etc.
career_modules_insurance_insurance = {}

--- Shortcut to career_modules_insurance_history.addToPlHistory.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:2035
---@param data table History entry.
function career_modules_insurance_insurance.addToPlHistory(data) end

--- Price to pay to add a vehicle to an insurer: total premium if it is the first, otherwise the vehicle's premium prorated by the distance remaining before renewal.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1143
---@param insuranceId integer Insurer.
---@param vehValue number Vehicle value.
---@return number  Amount.
function career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue) end

--- Total premium of an insurer: sum of the premiums of its vehicles plus the insurer-wide options, then totalPriceWithDriverScore (x score tier multiplier).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1064
---@param insuranceId integer Insurer.
---@param potentialCoverageOptions table|nil Hypothetical options (an empty table is ignored).
---@param potentialVehiclesCoverageOptions table|nil Hypothetical options per vehicle, keyed by string id.
---@param potentialNewVehValue number|nil Value of an additional vehicle to include.
---@return table  {items, totalPrice, totalPriceWithDriverScore, groupDiscountSavings}.
function career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue) end

--- Premium of a vehicle: value x class coverageRate x product of the option influences x (1 - group discount). Provide invVehId (owned vehicle) or nonInvVehInfo ({vehValue, insuranceId}).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1013
---@param invVehId integer|nil Inventory vehicle.
---@param nonInvVehInfo table|nil Hypothetical vehicle {vehValue, insuranceId}.
---@param potentialCoverageOptions table|nil Hypothetical options instead of the current options.
---@return table  {cost, costWithoutGroupDiscount}.
function career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions) end

--- Insurance change triggered by the player: refused if the vehicle needs repair; computes the net cost (refund minus penalty minus add-on price), applies the new insurer, pays or receives the difference, logs and unlocks the POLICY_REVIEW achievement.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1551
---@param invVehId integer Inventory identifier.
---@param newInsuranceId integer New insurer; -1 or less for no insurance.
function career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId) end

--- Old way of changing a vehicle's coverage options: records the history and charges the paperwork fees (see the bug in the notes).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1642
---@param invVehId integer Inventory identifier.
---@param changedCoverageOptions table Modified options (name -> value).
function career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions) end

--- Closes the insurance menu (back to the computer or closing all menus). With autosave, may wait for the end of the save.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1670
---@param _closeMenuAfterSaving boolean|nil Wait for onVehicleSaveFinished before closing.
function career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving) end

--- Indicates whether the identifier matches a defined insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1953
---@param insuranceId integer Identifier.
---@return boolean  true if defined.
function career_modules_insurance_insurance.doesInsuranceExist(insuranceId) end

--- Pays to get immediate access to a vehicle under delayed repair (removes timeToAccess and delayReason).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1803
---@param inventoryId integer Inventory identifier.
---@param price number Price to pay.
function career_modules_insurance_insurance.expediteRepair(inventoryId, price) end

--- Builds the perk icon table for the UI.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:958
---@param smallText string Short text.
---@param tooltipText string Tooltip.
---@param discount number|nil Related discount.
---@param isSignaturePerk boolean Insurer's signature perk.
---@return table  {smallText, tooltipText, discount, isSignaturePerk}.
function career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk) end

--- Asks the vehicle (object) for its part conditions and calls callback(needsRepair) on reply; used for non-inventory vehicles (for example test drive).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:655
---@param vehId integer Vehicle object identifier.
---@param callback function function(needsRepair: boolean).
function career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback) end

--- Number of accident forgivenesses remaining with an insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1961
---@param insuranceId integer Insurer.
---@return integer  Number (0 if unknown).
function career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId) end

--- Internal use: the vehicle's repair deductible (value of the deductible option).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:805
---@param invVehId integer Inventory identifier.
---@return number|nil  Deductible.
function career_modules_insurance_insurance.getActualRepairPrice(invVehId) end

--- Default insurer of a class: the one with the smallest id.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1889
---@param insuranceClassId string Class identifier.
---@return table|nil  Insurer data.
function career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId) end

--- Current driver score (0 to 100).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:562
---@return number  Score.
function career_modules_insurance_insurance.getDriverScore() end

--- Cost to reset the score to the default value (64): 0 if the score is already at least equal, otherwise 500 + proportion x 19500, rounded.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1738
---@return integer  Amount.
function career_modules_insurance_insurance.getDriverScoreResetCost() end

--- Score tier (min, max, premium multiplier…) for a score; the last tier if none matches.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:552
---@param score number|nil Score; default: the current score.
---@return table  Tier data.
function career_modules_insurance_insurance.getDriverScoreTierData(score) end

--- Determines the insurance class required for a listing according to the JSON class, the value, the population, the body style and the commercial class (the highest priority wins).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:923
---@param data table Shop listing (Value, Population, BodyStyle, aggregates, 'Commercial Class').
---@return table|nil  Class data.
function career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data) end

--- Definition of an insurer loaded from the game files.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1930
---@param insuranceId integer Insurer.
---@return table|nil  Definition.
function career_modules_insurance_insurance.getInsuranceDataById(insuranceId) end

--- Name of the insurer, or the "no insurance" label if unknown.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1957
---@param insuranceId integer Identifier.
---@return string  Name.
function career_modules_insurance_insurance.getInsuranceName(insuranceId) end

--- Fuel discount data of a vehicle (hasFuelDiscount, fuelDiscount fraction, insurer name, perk icon); used by the fuel module.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1907
---@param invVehId integer Inventory identifier.
---@return table  {hasFuelDiscount, fuelDiscount, perkData, insuranceName?}.
function career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId) end

--- Repair time included in the vehicle's policy (seconds; 0 = instant).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1782
---@param vehInvId integer Inventory identifier.
---@return number|nil  Seconds.
function career_modules_insurance_insurance.getInvVehRepairTime(vehInvId) end

--- Table of the insurance entries of the inventory vehicles (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1965
---@return table<integer, table>  invVehs (reference).
function career_modules_insurance_insurance.getInvVehs() end

--- Value of an insurer's perk.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1876
---@param insuranceId integer Insurer.
---@param perkId string Perk (reduceDeductible, fuelDiscount, instantRepair…).
---@return number|boolean|nil  Value or nil.
function career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId) end

--- Value of a perk of a vehicle's insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1883
---@param invVehId integer Inventory identifier.
---@param perkId string Perk.
---@return number|boolean|nil  Value or nil.
function career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId) end

--- Value of the coverage option currently chosen for a vehicle (e.g. deductible, repairTime, paintRepair, roadsideAssistance). Returns nothing if the vehicle is not insured.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:116
---@param invVehId integer Inventory identifier.
---@param coverageOptionName string Option name.
---@return number|boolean|nil  Choice value.
function career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName) end

--- Shortcut to career_modules_insurance_history.getPlHistory.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1996
---@return table  History.
function career_modules_insurance_insurance.getPlHistory() end

--- Player summary for the UI: score and tier, distances (total, insured, uninsured), number of repairs, cost of resetting the score, financial summary (premiums, deductibles, private repairs, damage covered).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1333
---@return table  Summary data.
function career_modules_insurance_insurance.getPlayerAbstractData() end

--- Data saved per insurer (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1786
---@return table  plInsurancesData (reference).
function career_modules_insurance_insurance.getPlayerInsurancesData() end

--- Surcharge for a quick repair (1000).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1790
---@return number  Amount.
function career_modules_insurance_insurance.getQuickRepairExtraPrice() end

--- Kilometers remaining before the insurer's renewal (0 for -1 or an unknown insurer).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1127
---@param insuranceId integer Insurer.
---@return integer  Kilometers (rounded up).
function career_modules_insurance_insurance.getRenewsIn(insuranceId) end

--- Amount charged for damage during a vehicle test drive (500).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1872
---@return number  Amount.
function career_modules_insurance_insurance.getTestDriveClaimPrice() end

--- A vehicle's insurance info: insured or not, insurer definition and required class.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1794
---@param vehInvId integer Inventory identifier.
---@return table|nil  {isInsured, insuranceInfo, insuranceClass}.
function career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId) end

--- Indicates whether an inventory vehicle has parts to repair (partConditions).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:374
---@param vehInvId integer Inventory identifier.
---@return boolean|nil  nil if the vehicle does not exist.
function career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId) end

--- Indicates whether free roadside assistance tows remain for the vehicle's insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1853
---@param invVehId integer Inventory identifier.
---@return boolean  true if any remain.
function career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId) end

--- Records a repair claim: consumes an accident forgiveness or lowers the score by 1, adds the history (money, vouchers, score, deductible, damage value), emits onInsuranceRepairClaim and unlocks the CLAIM_FILED achievement. No effect if the vehicle is not insured.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:462
---@param invVehId integer Inventory identifier.
---@param costs table Costs (numbers or {money, vouchers}) and possibly deductible.
---@param vehInfo table|nil Vehicle, to estimate the damage price.
function career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo) end

--- Charges the damage of a test drive (500), shows a message and adds a 'testDriveClaim' entry to the history (see notes: hardcoded vehicle name).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:441
---@param vehId integer|nil Ignored.
function career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId) end

--- Pre-mission repair callback: reopens the career missions menu and sends the vehicle's damage state to the UI.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:566
---@param vehInfo table Inventory vehicle.
function career_modules_insurance_insurance.missionStartRepairCallback(vehInfo) end

--- Hook called when career becomes active: loads the insurance data (game files and the insurance.json save).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:949
---@param active boolean true on activation.
function career_modules_insurance_insurance.onCareerActive(active) end

--- Garage computer hook: adds the "Insurances" function _anon(disabled before the starter vehicle is bought).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1721
---@param menuData table Menu data (computerFacility, hasBoughtStarterVehicle).
---@param computerFunctions table Functions to complete.
function career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook after entering a vehicle: resumes a delayed repair that was put on hold (see the bug in the notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:936
---@param invVehId integer Inventory identifier (unused).
function career_modules_insurance_insurance.onEnterVehicleFinished(invVehId) end

--- Hook: the insurance screen is left; stops sending updates to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1717
function career_modules_insurance_insurance.onExitInsurancesComputerScreen() end

--- Menu close hook: removes the leash (tether).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1713
function career_modules_insurance_insurance.onMenuClosed() end

--- Save hook: writes career/insurance.json (score, distances, plInsurancesData, invVehs, history).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:954
---@param currentSavePath string Save profile folder.
function career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath) end

--- Per-frame hook: outside a foreground mission and outside walking, accumulates the distance, checks renewal, gestures and rise of the active insured vehicle's driver score; also counts down the coverage edit timers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:864
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: a vehicle enters the inventory. Creates its invVehs entry (initial value, required insurance class according to value, population, body style, commercial class) and applies the insurance chosen at purchase (or -1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1590
---@param data table {inventoryId, vehicleInfo, purchaseData = {insuranceId}}.
function career_modules_insurance_insurance.onVehicleAddedToInventory(data) end

--- Hook: a vehicle is removed from the inventory; deletes its insurance entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1508
---@param invVehId integer Inventory identifier.
function career_modules_insurance_insurance.onVehicleRemoved(invVehId) end

--- Vehicle save end hook: closes the menu again if its closing was waiting for the save.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1683
function career_modules_insurance_insurance.onVehicleSaveFinished() end

--- Controlled vehicle change hook: updates the active insurance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:945
function career_modules_insurance_insurance.onVehicleSwitched() end

--- Navigates to the insurance choice screen: 'purchase' (shop purchase) or 'change' (change from the computer).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1940
---@param mode string 'purchase' or 'change'.
---@param params table Route parameters (purchase: purchaseType, shopId, insuranceId? ; change: vehicleId).
---@return table  Navigation result, or {result=false, success=false, reason='unknown_mode'}.
function career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params) end

--- Opens the insurance menu from a computer (7 m leash) and emits onComputerInsurance. Does nothing without a computer identifier.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1691
---@param _originComputerId string Garage computer identifier.
function career_modules_insurance_insurance.openMenu(_originComputerId) end

--- Restores the broken parts to new in data.partConditions (integrity 1, repaint or primer according to paintRepair, repair counter of inventory parts, energy tanks kept).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:380
---@param data table {partConditions, paintRepair?, inventoryId?}.
function career_modules_insurance_insurance.repairPartConditions(data) end

--- Pays the reset cost and restores the default score, with a history entry and UI update.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1754
---@return boolean  true if successful; false if the cost is zero or funds are insufficient.
function career_modules_insurance_insurance.resetDriverScore() end

--- Career debug function: reloads the insurance data while resetting some data (loadInsurancesData(true)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:2051
function career_modules_insurance_insurance.resetPlPolicyData() end

--- Prepares a coverage option for the UI: key, name, choices, choice type, perk text, display order and identifier of the current value.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:716
---@param insuranceId integer Insurer.
---@param coverageOptionId string Option name.
---@param invVehId integer|nil Vehicle (required for per-vehicle options).
---@return table|nil  Option data.
function career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId) end

--- Records the insurer-specific coverage options (deductible, roadside assistance…) against the paperwork fees (paperworkFees); recharges roadside assistance if it changes.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1813
---@param insuranceId integer Insurer.
---@param newCoverageOptions table<string, integer> Option name -> choice identifier.
function career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions) end

--- Records the vehicle-specific coverage options against the paperwork fees of its insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1835
---@param vehicleId integer Inventory identifier.
---@param newCoverageOptions table<string, integer> Option name -> choice identifier.
function career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions) end

--- Sends 'chooseInsuranceData' for changing the insurance of an already owned vehicle (net change cost, refund).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1425
---@param invVehId integer Inventory identifier.
function career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId) end

--- Sends 'chooseInsuranceData' for buying a vehicle in the shop: cards of the insurers of the right class (add-on premium, group discount) plus the "no insurance" card.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1441
---@param purchaseType string Purchase type passed to the UI.
---@param vehShopId string|integer Listing identifier.
---@param defaultInsuranceId integer|nil Preselected insurer.
function career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId) end

--- Sends to the UI (guihook 'insurancesData') the history, the score, the uninsured vehicles, the vehicle tiles and all the classes with their insurers.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1454
function career_modules_insurance_insurance.sendUIData() end

--- Sets the driver score without any check (tools/debug).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1949
---@param score number New score.
function career_modules_insurance_insurance.setDriverScore(score) end

--- Repairs an inventory vehicle: pays the cost, records a claim (isInsuranceRepair) or a private repair, repairs the parts, then starts a delayed (repairTime > 0) or instant repair.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:587
---@param vehInvId integer|nil Vehicle; default: current vehicle.
---@param repairOptionData table|nil {cost, isInsuranceRepair, repairTime}.
---@param callback function|nil Called after an instant repair with vehInfo.
function career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback) end

--- Repair from the garage: emits onRepairInGarage then startRepair; for an instant repair, teleports the vehicle to the nearest garage.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:644
---@param invVehId integer Inventory identifier.
---@param repairOptionData table {cost, isInsuranceRepair, repairTime}.
---@return any  Value of startRepair (nil).
function career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData) end

--- Instant repair: plays a sound, respawns the vehicle if present, then marks the vehicle as modified, reloads the minimum fuel and saves.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:571
---@param vehInfo table Inventory vehicle.
---@param callback function|nil Called after the respawn.
---@param skipSound boolean|nil Do not play the sound.
function career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound) end

--- Recharges the number of free tows according to the chosen roadsideAssistance option (on renewal or on modification).
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1847
---@param insuranceId integer Insurer.
function career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId) end

--- Consumes a free tow of the vehicle's insurer.
---Source: lua/ge/extensions/career/modules/insurance/insurance.lua:1861
---@param invVehId integer Inventory identifier.
function career_modules_insurance_insurance.useRoadsideAssistance(invVehId) end

