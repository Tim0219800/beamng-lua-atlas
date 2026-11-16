# `career_modules_insurance_insurance`

*File: `lua/ge/extensions/career/modules/insurance/insurance.lua` · VM: Game Engine (GE) · 2056 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_insurance_insurance`: `extensions.load("career_modules_insurance_insurance")`, then the global `career_modules_insurance_insurance`

Career mode vehicle insurance and repair system. It loads the definitions from gameplay/insurance (providers, classes, coverage options, perks, driver score tiers), records for each inventory vehicle (invVehs) its insurance and options, tracks the distance driven to renew the policy every 100 km, grant goodwill gestures (free repair) and raise the driver score, computes the premiums (vehicle value x class rate x options x group discount x score tier multiplier), processes claims and repairs (instant or delayed, deductible, roadside assistance) and feeds the UI (guihooks insurancesData, chooseInsuranceData).

## Example

```lua
local ins = career_modules_insurance_insurance
local premium = ins.calculateInsurancePremium(insuranceId).totalPriceWithDriverScore
local needs = ins.inventoryVehNeedsRepair(inventoryId)
ins.startRepair(inventoryId, {isInsuranceRepair = true, cost = {money = 300}, repairTime = 0})
```

## Notes

- Constants: renewal every 100,000 m of insured driving; driver score from 0 to 100 (64 by default in defaultDriverScore, 65 at the very first initialization); -1 per claim (except accident forgiveness); +2 every 50,000 m without a claim; at most 5 accident forgivenesses; 600 s delay between coverage changes; early termination penalty 25%; quick repair surcharge 1000; vehicle test drive claim 500.
- Group discount according to the total value of the vehicles insured with the same insurer (more than one vehicle): 10% (< 50,000), 15%, 20%, 25%, 30% (>= 500,000).
- Coverage options are either insurer-wide (isInsuranceWide, stored in plInsurancesData) or per vehicle (stored in invVehs[id].insuranceData). An insuranceId of -1 means uninsured.
- Provider perks modify the options on load: reduceDeductible (reduced deductible), freeRepaintDuringRepair, freeTowing, repairTimeDiscount, instantRepair, accidentForgivenessAtRenewal, fuelDiscount (used by the fuel module).
- Bug: onEnterVehicleFinished reads startRepairVehInfo.vehId whereas startRepairDelayed stores inventoryId: the index is nil and the delayed repair after leaving the vehicle does not complete as intended.
- Bug: changeInvVehInsuranceCoverageOptions reads plInsurancesData[...].coverageOptions[...] (nonexistent field, the real structure is coverageOptionsData.currentCoverageOptions): the function does not seem usable as is; the UI goes through saveNewInsuranceCoverageOptions and saveNewVehicleCoverageOptions.
- makeTestDriveDamageClaim always sets vehName = 'ibishu n' (hardcoded value) in the history, and ignores its vehId parameter.
- renewActiveInsurance logs concernedInsuranceName with activeInsuranceId and not with the insuranceId passed as a parameter (identical in practice: called with activeInsuranceId).
- getTotalInsuranceVehsValue is defined twice in the file (same code); harmless.
- onVehicleRemoved is exported under this name but the local function is called onVehicleRemovedFromInventory.
- loadInsurancesData reads saveInfo.version even if savePath is nil: be careful if the save does not exist.

**Dependencies (loaded first):** `career_career`, `career_modules_payment`, `career_modules_playerAttributes`, `career_modules_insurance_history`, `career_modules_tether`, `career_modules_log`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_insurance_insurance.addToPlHistory(data)` | Shortcut to career_modules_insurance_history.addToPlHistory. | 2035 |
| `career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue)` | Price to pay to add a vehicle to an insurer: total premium if it is the first, otherwise the vehicle's premium prorated by the distance remaining before renewal. | 1143 |
| `career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue)` | Total premium of an insurer: sum of the premiums of its vehicles plus the insurer-wide options, then totalPriceWithDriverScore (x score tier multiplier). | 1064 |
| `career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions)` | Premium of a vehicle: value x class coverageRate x product of the option influences x (1 - group discount). Provide invVehId (owned vehicle) or nonInvVehInfo ({vehValue, insuranceId}). | 1013 |
| `career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId)` | Insurance change triggered by the player: refused if the vehicle needs repair; computes the net cost (refund minus penalty minus add-on price), applies the new insurer, pays or receives the difference, logs and unlocks the POLICY_REVIEW achievement. | 1551 |
| `career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions)` | Old way of changing a vehicle's coverage options: records the history and charges the paperwork fees (see the bug in the notes). | 1642 |
| `career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving)` | Closes the insurance menu (back to the computer or closing all menus). With autosave, may wait for the end of the save. | 1670 |
| `career_modules_insurance_insurance.doesInsuranceExist(insuranceId)` | Indicates whether the identifier matches a defined insurer. | 1953 |
| `career_modules_insurance_insurance.expediteRepair(inventoryId, price)` | Pays to get immediate access to a vehicle under delayed repair (removes timeToAccess and delayReason). | 1803 |
| `career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk)` | Builds the perk icon table for the UI. | 958 |
| `career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback)` | Asks the vehicle (object) for its part conditions and calls callback(needsRepair) on reply; used for non-inventory vehicles (for example test drive). | 655 |
| `career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId)` | Number of accident forgivenesses remaining with an insurer. | 1961 |
| `career_modules_insurance_insurance.getActualRepairPrice(invVehId)` | Internal use: the vehicle's repair deductible (value of the deductible option). *(internal)* | 805 |
| `career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId)` | Default insurer of a class: the one with the smallest id. | 1889 |
| `career_modules_insurance_insurance.getDriverScore()` | Current driver score (0 to 100). | 562 |
| `career_modules_insurance_insurance.getDriverScoreResetCost()` | Cost to reset the score to the default value (64): 0 if the score is already at least equal, otherwise 500 + proportion x 19500, rounded. | 1738 |
| `career_modules_insurance_insurance.getDriverScoreTierData(score)` | Score tier (min, max, premium multiplier…) for a score; the last tier if none matches. | 552 |
| `career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data)` | Determines the insurance class required for a listing according to the JSON class, the value, the population, the body style and the commercial class (the highest priority wins). | 923 |
| `career_modules_insurance_insurance.getInsuranceDataById(insuranceId)` | Definition of an insurer loaded from the game files. | 1930 |
| `career_modules_insurance_insurance.getInsuranceName(insuranceId)` | Name of the insurer, or the "no insurance" label if unknown. | 1957 |
| `career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId)` | Fuel discount data of a vehicle (hasFuelDiscount, fuelDiscount fraction, insurer name, perk icon); used by the fuel module. | 1907 |
| `career_modules_insurance_insurance.getInvVehRepairTime(vehInvId)` | Repair time included in the vehicle's policy (seconds; 0 = instant). | 1782 |
| `career_modules_insurance_insurance.getInvVehs()` | Table of the insurance entries of the inventory vehicles (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData). | 1965 |
| `career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId)` | Value of an insurer's perk. | 1876 |
| `career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId)` | Value of a perk of a vehicle's insurer. | 1883 |
| `career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName)` | Value of the coverage option currently chosen for a vehicle (e.g. deductible, repairTime, paintRepair, roadsideAssistance). Returns nothing if the vehicle is not insured. | 116 |
| `career_modules_insurance_insurance.getPlHistory()` | Shortcut to career_modules_insurance_history.getPlHistory. | 1996 |
| `career_modules_insurance_insurance.getPlayerAbstractData()` | Player summary for the UI: score and tier, distances (total, insured, uninsured), number of repairs, cost of resetting the score, financial summary (premiums, deductibles, private repairs, damage covered). | 1333 |
| `career_modules_insurance_insurance.getPlayerInsurancesData()` | Data saved per insurer (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…). | 1786 |
| `career_modules_insurance_insurance.getQuickRepairExtraPrice()` | Surcharge for a quick repair (1000). | 1790 |
| `career_modules_insurance_insurance.getRenewsIn(insuranceId)` | Kilometers remaining before the insurer's renewal (0 for -1 or an unknown insurer). | 1127 |
| `career_modules_insurance_insurance.getTestDriveClaimPrice()` | Amount charged for damage during a vehicle test drive (500). | 1872 |
| `career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId)` | A vehicle's insurance info: insured or not, insurer definition and required class. | 1794 |
| `career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId)` | Indicates whether an inventory vehicle has parts to repair (partConditions). | 374 |
| `career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId)` | Indicates whether free roadside assistance tows remain for the vehicle's insurer. | 1853 |
| `career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo)` | Records a repair claim: consumes an accident forgiveness or lowers the score by 1, adds the history (money, vouchers, score, deductible, damage value), emits onInsuranceRepairClaim and unlocks the CLAIM_FILED achievement. No effect if the vehicle is not insured. | 462 |
| `career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId)` | Charges the damage of a test drive (500), shows a message and adds a 'testDriveClaim' entry to the history (see notes: hardcoded vehicle name). | 441 |
| `career_modules_insurance_insurance.missionStartRepairCallback(vehInfo)` | Pre-mission repair callback: reopens the career missions menu and sends the vehicle's damage state to the UI. | 566 |
| `career_modules_insurance_insurance.onCareerActive(active)` | Hook called when career becomes active: loads the insurance data (game files and the insurance.json save). *(internal)* *(hook)* | 949 |
| `career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions)` | Garage computer hook: adds the "Insurances" function (disabled before the starter vehicle is bought). *(internal)* *(hook)* | 1721 |
| `career_modules_insurance_insurance.onEnterVehicleFinished(invVehId)` | Hook after entering a vehicle: resumes a delayed repair that was put on hold (see the bug in the notes). *(internal)* *(hook)* | 936 |
| `career_modules_insurance_insurance.onExitInsurancesComputerScreen()` | Hook: the insurance screen is left; stops sending updates to the UI. *(internal)* *(hook)* | 1717 |
| `career_modules_insurance_insurance.onMenuClosed()` | Menu close hook: removes the leash (tether). *(internal)* *(hook)* | 1713 |
| `career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath)` | Save hook: writes career/insurance.json (score, distances, plInsurancesData, invVehs, history). *(internal)* *(hook)* | 954 |
| `career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: outside a foreground mission and outside walking, accumulates the distance, checks renewal, gestures and rise of the active insured vehicle's driver score; also counts down the coverage edit timers. *(internal)* *(hook)* | 864 |
| `career_modules_insurance_insurance.onVehicleAddedToInventory(data)` | Hook: a vehicle enters the inventory. Creates its invVehs entry (initial value, required insurance class according to value, population, body style, commercial class) and applies the insurance chosen at purchase (or -1). *(internal)* *(hook)* | 1590 |
| `career_modules_insurance_insurance.onVehicleRemoved(invVehId)` | Hook: a vehicle is removed from the inventory; deletes its insurance entry. *(internal)* *(hook)* | 1508 |
| `career_modules_insurance_insurance.onVehicleSaveFinished()` | Vehicle save end hook: closes the menu again if its closing was waiting for the save. *(internal)* *(hook)* | 1683 |
| `career_modules_insurance_insurance.onVehicleSwitched()` | Controlled vehicle change hook: updates the active insurance. *(internal)* *(hook)* | 945 |
| `career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params)` | Navigates to the insurance choice screen: 'purchase' (shop purchase) or 'change' (change from the computer). | 1940 |
| `career_modules_insurance_insurance.openMenu(_originComputerId)` | Opens the insurance menu from a computer (7 m leash) and emits onComputerInsurance. Does nothing without a computer identifier. | 1691 |
| `career_modules_insurance_insurance.repairPartConditions(data)` | Restores the broken parts to new in data.partConditions (integrity 1, repaint or primer according to paintRepair, repair counter of inventory parts, energy tanks kept). | 380 |
| `career_modules_insurance_insurance.resetDriverScore()` | Pays the reset cost and restores the default score, with a history entry and UI update. | 1754 |
| `career_modules_insurance_insurance.resetPlPolicyData()` | Career debug function: reloads the insurance data while resetting some data (loadInsurancesData(true)). *(internal)* | 2051 |
| `career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId)` | Prepares a coverage option for the UI: key, name, choices, choice type, perk text, display order and identifier of the current value. | 716 |
| `career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions)` | Records the insurer-specific coverage options (deductible, roadside assistance…) against the paperwork fees (paperworkFees); recharges roadside assistance if it changes. | 1813 |
| `career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions)` | Records the vehicle-specific coverage options against the paperwork fees of its insurer. | 1835 |
| `career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId)` | Sends 'chooseInsuranceData' for changing the insurance of an already owned vehicle (net change cost, refund). | 1425 |
| `career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId)` | Sends 'chooseInsuranceData' for buying a vehicle in the shop: cards of the insurers of the right class (add-on premium, group discount) plus the "no insurance" card. | 1441 |
| `career_modules_insurance_insurance.sendUIData()` | Sends to the UI (guihook 'insurancesData') the history, the score, the uninsured vehicles, the vehicle tiles and all the classes with their insurers. | 1454 |
| `career_modules_insurance_insurance.setDriverScore(score)` | Sets the driver score without any check (tools/debug). | 1949 |
| `career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback)` | Repairs an inventory vehicle: pays the cost, records a claim (isInsuranceRepair) or a private repair, repairs the parts, then starts a delayed (repairTime > 0) or instant repair. | 587 |
| `career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData)` | Repair from the garage: emits onRepairInGarage then startRepair; for an instant repair, teleports the vehicle to the nearest garage. | 644 |
| `career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound)` | Instant repair: plays a sound, respawns the vehicle if present, then marks the vehicle as modified, reloads the minimum fuel and saves. | 571 |
| `career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId)` | Recharges the number of free tows according to the chosen roadsideAssistance option (on renewal or on modification). | 1847 |
| `career_modules_insurance_insurance.useRoadsideAssistance(invVehId)` | Consumes a free tow of the vehicle's insurer. | 1861 |

### Parameter details

#### `career_modules_insurance_insurance.addToPlHistory(data)`

Shortcut to career_modules_insurance_history.addToPlHistory.

- `data` (*table*) : History entry.

#### `career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue)`

Price to pay to add a vehicle to an insurer: total premium if it is the first, otherwise the vehicle's premium prorated by the distance remaining before renewal.

- `insuranceId` (*integer*) : Insurer.
- `vehValue` (*number*) : Vehicle value.
- **returns**: number Amount.

#### `career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue)`

Total premium of an insurer: sum of the premiums of its vehicles plus the insurer-wide options, then totalPriceWithDriverScore (x score tier multiplier).

- `insuranceId` (*integer*) : Insurer.
- `potentialCoverageOptions` (*table|nil*) : Hypothetical options (an empty table is ignored).
- `potentialVehiclesCoverageOptions` (*table|nil*) : Hypothetical options per vehicle, keyed by string id.
- `potentialNewVehValue` (*number|nil*) : Value of an additional vehicle to include.
- **returns**: table {items, totalPrice, totalPriceWithDriverScore, groupDiscountSavings}.

#### `career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions)`

Premium of a vehicle: value x class coverageRate x product of the option influences x (1 - group discount). Provide invVehId (owned vehicle) or nonInvVehInfo ({vehValue, insuranceId}).

- `invVehId` (*integer|nil*) : Inventory vehicle.
- `nonInvVehInfo` (*table|nil*) : Hypothetical vehicle {vehValue, insuranceId}.
- `potentialCoverageOptions` (*table|nil*) : Hypothetical options instead of the current options.
- **returns**: table {cost, costWithoutGroupDiscount}.

#### `career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId)`

Insurance change triggered by the player: refused if the vehicle needs repair; computes the net cost (refund minus penalty minus add-on price), applies the new insurer, pays or receives the difference, logs and unlocks the POLICY_REVIEW achievement.

- `invVehId` (*integer*) : Inventory identifier.
- `newInsuranceId` (*integer*) : New insurer; -1 or less for no insurance.

#### `career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions)`

Old way of changing a vehicle's coverage options: records the history and charges the paperwork fees (see the bug in the notes).

- `invVehId` (*integer*) : Inventory identifier.
- `changedCoverageOptions` (*table*) : Modified options (name -> value).

#### `career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving)`

Closes the insurance menu (back to the computer or closing all menus). With autosave, may wait for the end of the save.

- `_closeMenuAfterSaving` (*boolean|nil*) : Wait for onVehicleSaveFinished before closing.

#### `career_modules_insurance_insurance.doesInsuranceExist(insuranceId)`

Indicates whether the identifier matches a defined insurer.

- `insuranceId` (*integer*) : Identifier.
- **returns**: boolean true if defined.

#### `career_modules_insurance_insurance.expediteRepair(inventoryId, price)`

Pays to get immediate access to a vehicle under delayed repair (removes timeToAccess and delayReason).

- `inventoryId` (*integer*) : Inventory identifier.
- `price` (*number*) : Price to pay.

#### `career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk)`

Builds the perk icon table for the UI.

- `smallText` (*string*) : Short text.
- `tooltipText` (*string*) : Tooltip.
- `discount` (*number|nil*) : Related discount.
- `isSignaturePerk` (*boolean*) : Insurer's signature perk.
- **returns**: table {smallText, tooltipText, discount, isSignaturePerk}.

#### `career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback)`

Asks the vehicle (object) for its part conditions and calls callback(needsRepair) on reply; used for non-inventory vehicles (for example test drive).

- `vehId` (*integer*) : Vehicle object identifier.
- `callback` (*function*) : function(needsRepair: boolean).

#### `career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId)`

Number of accident forgivenesses remaining with an insurer.

- `insuranceId` (*integer*) : Insurer.
- **returns**: integer Number (0 if unknown).

#### `career_modules_insurance_insurance.getActualRepairPrice(invVehId)`

Internal use: the vehicle's repair deductible (value of the deductible option).

- `invVehId` (*integer*) : Inventory identifier.
- **returns**: number|nil Deductible.

#### `career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId)`

Default insurer of a class: the one with the smallest id.

- `insuranceClassId` (*string*) : Class identifier.
- **returns**: table|nil Insurer data.

#### `career_modules_insurance_insurance.getDriverScore()`

Current driver score (0 to 100).

- **returns**: number Score.

#### `career_modules_insurance_insurance.getDriverScoreResetCost()`

Cost to reset the score to the default value (64): 0 if the score is already at least equal, otherwise 500 + proportion x 19500, rounded.

- **returns**: integer Amount.

#### `career_modules_insurance_insurance.getDriverScoreTierData(score)`

Score tier (min, max, premium multiplier…) for a score; the last tier if none matches.

- `score` (*number|nil*) : Score; default: the current score.
- **returns**: table Tier data.

#### `career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data)`

Determines the insurance class required for a listing according to the JSON class, the value, the population, the body style and the commercial class (the highest priority wins).

- `data` (*table*) : Shop listing (Value, Population, BodyStyle, aggregates, 'Commercial Class').
- **returns**: table|nil Class data.

#### `career_modules_insurance_insurance.getInsuranceDataById(insuranceId)`

Definition of an insurer loaded from the game files.

- `insuranceId` (*integer*) : Insurer.
- **returns**: table|nil Definition.

#### `career_modules_insurance_insurance.getInsuranceName(insuranceId)`

Name of the insurer, or the "no insurance" label if unknown.

- `insuranceId` (*integer*) : Identifier.
- **returns**: string Name.

#### `career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId)`

Fuel discount data of a vehicle (hasFuelDiscount, fuelDiscount fraction, insurer name, perk icon); used by the fuel module.

- `invVehId` (*integer*) : Inventory identifier.
- **returns**: table {hasFuelDiscount, fuelDiscount, perkData, insuranceName?}.

#### `career_modules_insurance_insurance.getInvVehRepairTime(vehInvId)`

Repair time included in the vehicle's policy (seconds; 0 = instant).

- `vehInvId` (*integer*) : Inventory identifier.
- **returns**: number|nil Seconds.

#### `career_modules_insurance_insurance.getInvVehs()`

Table of the insurance entries of the inventory vehicles (insuranceId, name, id, initialValue, requiredInsuranceClass, insuranceData).

- **returns**: table<integer, table> invVehs (reference).

#### `career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId)`

Value of an insurer's perk.

- `insuranceId` (*integer*) : Insurer.
- `perkId` (*string*) : Perk (reduceDeductible, fuelDiscount, instantRepair…).
- **returns**: number|boolean|nil Value or nil.

#### `career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId)`

Value of a perk of a vehicle's insurer.

- `invVehId` (*integer*) : Inventory identifier.
- `perkId` (*string*) : Perk.
- **returns**: number|boolean|nil Value or nil.

#### `career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName)`

Value of the coverage option currently chosen for a vehicle (e.g. deductible, repairTime, paintRepair, roadsideAssistance). Returns nothing if the vehicle is not insured.

- `invVehId` (*integer*) : Inventory identifier.
- `coverageOptionName` (*string*) : Option name.
- **returns**: number|boolean|nil Choice value.

#### `career_modules_insurance_insurance.getPlHistory()`

Shortcut to career_modules_insurance_history.getPlHistory.

- **returns**: table History.

#### `career_modules_insurance_insurance.getPlayerAbstractData()`

Player summary for the UI: score and tier, distances (total, insured, uninsured), number of repairs, cost of resetting the score, financial summary (premiums, deductibles, private repairs, damage covered).

- **returns**: table Summary data.

#### `career_modules_insurance_insurance.getPlayerInsurancesData()`

Data saved per insurer (metersDriven, accidentForgiveness, roadsideAssistance, loyalty, coverageOptionsData…).

- **returns**: table plInsurancesData (reference).

#### `career_modules_insurance_insurance.getQuickRepairExtraPrice()`

Surcharge for a quick repair (1000).

- **returns**: number Amount.

#### `career_modules_insurance_insurance.getRenewsIn(insuranceId)`

Kilometers remaining before the insurer's renewal (0 for -1 or an unknown insurer).

- `insuranceId` (*integer*) : Insurer.
- **returns**: integer Kilometers (rounded up).

#### `career_modules_insurance_insurance.getTestDriveClaimPrice()`

Amount charged for damage during a vehicle test drive (500).

- **returns**: number Amount.

#### `career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId)`

A vehicle's insurance info: insured or not, insurer definition and required class.

- `vehInvId` (*integer*) : Inventory identifier.
- **returns**: table|nil {isInsured, insuranceInfo, insuranceClass}.

#### `career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId)`

Indicates whether an inventory vehicle has parts to repair (partConditions).

- `vehInvId` (*integer*) : Inventory identifier.
- **returns**: boolean|nil nil if the vehicle does not exist.

#### `career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId)`

Indicates whether free roadside assistance tows remain for the vehicle's insurer.

- `invVehId` (*integer*) : Inventory identifier.
- **returns**: boolean true if any remain.

#### `career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo)`

Records a repair claim: consumes an accident forgiveness or lowers the score by 1, adds the history (money, vouchers, score, deductible, damage value), emits onInsuranceRepairClaim and unlocks the CLAIM_FILED achievement. No effect if the vehicle is not insured.

- `invVehId` (*integer*) : Inventory identifier.
- `costs` (*table*) : Costs (numbers or {money, vouchers}) and possibly deductible.
- `vehInfo` (*table|nil*) : Vehicle, to estimate the damage price.

#### `career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId)`

Charges the damage of a test drive (500), shows a message and adds a 'testDriveClaim' entry to the history (see notes: hardcoded vehicle name).

- `vehId` (*integer|nil*) : Ignored.

#### `career_modules_insurance_insurance.missionStartRepairCallback(vehInfo)`

Pre-mission repair callback: reopens the career missions menu and sends the vehicle's damage state to the UI.

- `vehInfo` (*table*) : Inventory vehicle.

#### `career_modules_insurance_insurance.onCareerActive(active)`

Hook called when career becomes active: loads the insurance data (game files and the insurance.json save).

- `active` (*boolean*) : true on activation.

#### `career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions)`

Garage computer hook: adds the "Insurances" function (disabled before the starter vehicle is bought).

- `menuData` (*table*) : Menu data (computerFacility, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Functions to complete.

#### `career_modules_insurance_insurance.onEnterVehicleFinished(invVehId)`

Hook after entering a vehicle: resumes a delayed repair that was put on hold (see the bug in the notes).

- `invVehId` (*integer*) : Inventory identifier (unused).

#### `career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath)`

Save hook: writes career/insurance.json (score, distances, plInsurancesData, invVehs, history).

- `currentSavePath` (*string*) : Save profile folder.

#### `career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: outside a foreground mission and outside walking, accumulates the distance, checks renewal, gestures and rise of the active insured vehicle's driver score; also counts down the coverage edit timers.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `career_modules_insurance_insurance.onVehicleAddedToInventory(data)`

Hook: a vehicle enters the inventory. Creates its invVehs entry (initial value, required insurance class according to value, population, body style, commercial class) and applies the insurance chosen at purchase (or -1).

- `data` (*table*) : {inventoryId, vehicleInfo, purchaseData = {insuranceId}}.

#### `career_modules_insurance_insurance.onVehicleRemoved(invVehId)`

Hook: a vehicle is removed from the inventory; deletes its insurance entry.

- `invVehId` (*integer*) : Inventory identifier.

#### `career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params)`

Navigates to the insurance choice screen: 'purchase' (shop purchase) or 'change' (change from the computer).

- `mode` (*string*) : 'purchase' or 'change'.
- `params` (*table*) : Route parameters (purchase: purchaseType, shopId, insuranceId? ; change: vehicleId).
- **returns**: table Navigation result, or {result=false, success=false, reason='unknown_mode'}.

#### `career_modules_insurance_insurance.openMenu(_originComputerId)`

Opens the insurance menu from a computer (7 m leash) and emits onComputerInsurance. Does nothing without a computer identifier.

- `_originComputerId` (*string*) : Garage computer identifier.

#### `career_modules_insurance_insurance.repairPartConditions(data)`

Restores the broken parts to new in data.partConditions (integrity 1, repaint or primer according to paintRepair, repair counter of inventory parts, energy tanks kept).

- `data` (*table*) : {partConditions, paintRepair?, inventoryId?}.

#### `career_modules_insurance_insurance.resetDriverScore()`

Pays the reset cost and restores the default score, with a history entry and UI update.

- **returns**: boolean true if successful; false if the cost is zero or funds are insufficient.

#### `career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId)`

Prepares a coverage option for the UI: key, name, choices, choice type, perk text, display order and identifier of the current value.

- `insuranceId` (*integer*) : Insurer.
- `coverageOptionId` (*string*) : Option name.
- `invVehId` (*integer|nil*) : Vehicle (required for per-vehicle options).
- **returns**: table|nil Option data.

#### `career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions)`

Records the insurer-specific coverage options (deductible, roadside assistance…) against the paperwork fees (paperworkFees); recharges roadside assistance if it changes.

- `insuranceId` (*integer*) : Insurer.
- `newCoverageOptions` (*table<string, integer>*) : Option name -> choice identifier.

#### `career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions)`

Records the vehicle-specific coverage options against the paperwork fees of its insurer.

- `vehicleId` (*integer*) : Inventory identifier.
- `newCoverageOptions` (*table<string, integer>*) : Option name -> choice identifier.

#### `career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId)`

Sends 'chooseInsuranceData' for changing the insurance of an already owned vehicle (net change cost, refund).

- `invVehId` (*integer*) : Inventory identifier.

#### `career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId)`

Sends 'chooseInsuranceData' for buying a vehicle in the shop: cards of the insurers of the right class (add-on premium, group discount) plus the "no insurance" card.

- `purchaseType` (*string*) : Purchase type passed to the UI.
- `vehShopId` (*string|integer*) : Listing identifier.
- `defaultInsuranceId` (*integer|nil*) : Preselected insurer.

#### `career_modules_insurance_insurance.setDriverScore(score)`

Sets the driver score without any check (tools/debug).

- `score` (*number*) : New score.

#### `career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback)`

Repairs an inventory vehicle: pays the cost, records a claim (isInsuranceRepair) or a private repair, repairs the parts, then starts a delayed (repairTime > 0) or instant repair.

- `vehInvId` (*integer|nil*) : Vehicle; default: current vehicle.
- `repairOptionData` (*table|nil*) : {cost, isInsuranceRepair, repairTime}.
- `callback` (*function|nil*) : Called after an instant repair with vehInfo.

#### `career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData)`

Repair from the garage: emits onRepairInGarage then startRepair; for an instant repair, teleports the vehicle to the nearest garage.

- `invVehId` (*integer*) : Inventory identifier.
- `repairOptionData` (*table*) : {cost, isInsuranceRepair, repairTime}.
- **returns**: any Value of startRepair (nil).

#### `career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound)`

Instant repair: plays a sound, respawns the vehicle if present, then marks the vehicle as modified, reloads the minimum fuel and saves.

- `vehInfo` (*table*) : Inventory vehicle.
- `callback` (*function|nil*) : Called after the respawn.
- `skipSound` (*boolean|nil*) : Do not play the sound.

#### `career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId)`

Recharges the number of free tows according to the chosen roadsideAssistance option (on renewal or on modification).

- `insuranceId` (*integer*) : Insurer.

#### `career_modules_insurance_insurance.useRoadsideAssistance(invVehId)`

Consumes a free tow of the vehicle's insurer.

- `invVehId` (*integer*) : Inventory identifier.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, payment, playerAttributes, insurance_history, tether, etc. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onComputerInsurance`
- `onInsuranceRepairClaim` — listened to by 1 module(s)
- `onRepairInGarage` — listened to by 1 module(s)
- `onVehicleRepaired` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `MenuOpenModule`, `chooseInsuranceData`, `gameContextPlayerVehicleDamageInfo`, `insurancesData`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/insurance/insurance.lua`.*
