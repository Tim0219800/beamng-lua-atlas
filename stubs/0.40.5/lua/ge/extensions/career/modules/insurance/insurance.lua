---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/insurance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_insurance_insurance` : `extensions.load("career_modules_insurance_insurance")`, puis la globale `career_modules_insurance_insurance`
---@class career_modules_insurance_insurance
---@field dependencies table
career_modules_insurance_insurance = {}

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:2035
---@param data any
function career_modules_insurance_insurance.addToPlHistory(data) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1143
---@param insuranceId any
---@param vehValue any
function career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue) end

--- potentialCoverageOptions is used to simulate the premium. That's so that the player can test different coverage options without actually changing the insurance coverage
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1064
---@param insuranceId any
---@param potentialCoverageOptions any
---@param potentialVehiclesCoverageOptions any
---@param potentialNewVehValue any
function career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue) end

--- either invVehId or nonInvVehInfo must be provided
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1013
---@param invVehId any
---@param nonInvVehInfo any
---@param potentialCoverageOptions any
function career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions) end

--- user-facing insurance change action. Enforces the "no switching while damaged" rule,
---  charges/refunds the switching fees, records history, and refreshes the UI.
---  newInsuranceId can be -1 to remove the insurance.
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1551
---@param invVehId any
---@param newInsuranceId any
function career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1642
---@param invVehId any
---@param changedCoverageOptions any
function career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions) end

--- close the insurances computer menu
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1670
---@param _closeMenuAfterSaving any
function career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1953
---@param insuranceId any
function career_modules_insurance_insurance.doesInsuranceExist(insuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1803
---@param inventoryId any
---@param price any
function career_modules_insurance_insurance.expediteRepair(inventoryId, price) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:958
---@param smallText any
---@param tooltipText any
---@param discount any
---@param isSignaturePerk any
function career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:655
---@param vehId any
---@param callback any
function career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1961
---@param insuranceId any
function career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId) end

--- internal use only
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:805
---@param invVehId any
function career_modules_insurance_insurance.getActualRepairPrice(invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1889
---@param insuranceClassId any
function career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:562
function career_modules_insurance_insurance.getDriverScore() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1738
function career_modules_insurance_insurance.getDriverScoreResetCost() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:552
---@param score any
function career_modules_insurance_insurance.getDriverScoreTierData(score) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:923
---@param data any
function career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1930
---@param insuranceId any
function career_modules_insurance_insurance.getInsuranceDataById(insuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1957
---@param insuranceId any
function career_modules_insurance_insurance.getInsuranceName(insuranceId) end

--- perks
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1907
---@param invVehId any
function career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1782
---@param vehInvId any
function career_modules_insurance_insurance.getInvVehRepairTime(vehInvId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1965
function career_modules_insurance_insurance.getInvVehs() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1876
---@param insuranceId any
---@param perkId any
function career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1883
---@param invVehId any
---@param perkId any
function career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:116
---@param invVehId any
---@param coverageOptionName any
function career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1996
function career_modules_insurance_insurance.getPlHistory() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1333
function career_modules_insurance_insurance.getPlayerAbstractData() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1786
function career_modules_insurance_insurance.getPlayerInsurancesData() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1790
function career_modules_insurance_insurance.getQuickRepairExtraPrice() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1127
---@param insuranceId any
function career_modules_insurance_insurance.getRenewsIn(insuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1872
function career_modules_insurance_insurance.getTestDriveClaimPrice() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1794
---@param vehInvId any
function career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:374
---@param vehInvId any
function career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1853
---@param invVehId any
function career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId) end

--- meters
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:462
---@param invVehId any
---@param costs any
---@param vehInfo any
function career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo) end

--- when you damage a test drive vehicle, insurance needs to know
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:441
---@param vehId any
function career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:566
---@param vehInfo any
function career_modules_insurance_insurance.missionStartRepairCallback(vehInfo) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:949
---@param active any
function career_modules_insurance_insurance.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1721
---@param menuData any
---@param computerFunctions any
function career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:936
---@param invVehId any
function career_modules_insurance_insurance.onEnterVehicleFinished(invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1717
function career_modules_insurance_insurance.onExitInsurancesComputerScreen() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1713
function career_modules_insurance_insurance.onMenuClosed() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:954
---@param currentSavePath any
function career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath) end

--- hooks
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:864
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw) end

--- apply the minimum applicable insurance to the vehicle, and save it to the json file
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1590
---@param data any
function career_modules_insurance_insurance.onVehicleAddedToInventory(data) end

--- remove the vehicle from the insuranced vehicles json files
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1508
---@param invVehId any
function career_modules_insurance_insurance.onVehicleRemoved(invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1683
function career_modules_insurance_insurance.onVehicleSaveFinished() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:945
function career_modules_insurance_insurance.onVehicleSwitched() end

--- purchase params: { purchaseType, shopId, insuranceId? }; change params: { vehicleId }
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1940
---@param mode any
---@param params any
function career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params) end

--- open the insurances computer menu
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1691
---@param _originComputerId any
function career_modules_insurance_insurance.openMenu(_originComputerId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:380
---@param data any
function career_modules_insurance_insurance.repairPartConditions(data) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1754
function career_modules_insurance_insurance.resetDriverScore() end

--- career debug
---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:2051
function career_modules_insurance_insurance.resetPlPolicyData() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:716
---@param insuranceId any
---@param coverageOptionId any
---@param invVehId any
function career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1813
---@param insuranceId any
---@param newCoverageOptions any
function career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1835
---@param vehicleId any
---@param newCoverageOptions any
function career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1425
---@param invVehId any
function career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1441
---@param purchaseType any
---@param vehShopId any
---@param defaultInsuranceId any
function career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1454
function career_modules_insurance_insurance.sendUIData() end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1949
---@param score any
function career_modules_insurance_insurance.setDriverScore(score) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:587
---@param vehInvId any
---@param repairOptionData any
---@param callback any
function career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:644
---@param invVehId any
---@param repairOptionData any
function career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:571
---@param vehInfo any
---@param callback any
---@param skipSound any
function career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1847
---@param insuranceId any
function career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId) end

---Source : lua/ge/extensions/career/modules/insurance/insurance.lua:1861
---@param invVehId any
function career_modules_insurance_insurance.useRoadsideAssistance(invVehId) end

