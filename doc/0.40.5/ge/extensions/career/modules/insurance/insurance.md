# `career_modules_insurance_insurance`

*Fichier : `lua/ge/extensions/career/modules/insurance/insurance.lua` · VM : Game Engine (GE) · 2056 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_insurance_insurance` : `extensions.load("career_modules_insurance_insurance")`, puis la globale `career_modules_insurance_insurance`

**Dépendances (chargées avant) :** `career_career`, `career_modules_payment`, `career_modules_playerAttributes`, `career_modules_insurance_history`, `career_modules_tether`, `career_modules_log`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_insurance_insurance.addToPlHistory(data)` |  | 2035 |
| `career_modules_insurance_insurance.calculateAddVehiclePrice(insuranceId, vehValue)` |  | 1143 |
| `career_modules_insurance_insurance.calculateInsurancePremium(insuranceId, potentialCoverageOptions, potentialVehiclesCoverageOptions, potentialNewVehValue)` | potentialCoverageOptions is used to simulate the premium. That's so that the player can test different coverage options without actually changing the insurance coverage | 1064 |
| `career_modules_insurance_insurance.calculateVehiclePremium(invVehId, nonInvVehInfo, potentialCoverageOptions)` | either invVehId or nonInvVehInfo must be provided | 1013 |
| `career_modules_insurance_insurance.changeInvVehInsurance(invVehId, newInsuranceId)` | user-facing insurance change action. Enforces the "no switching while damaged" rule,<br> charges/refunds the switching fees, records history, and refreshes the UI.<br> newInsuranceId can be -1 to remove the insurance. | 1551 |
| `career_modules_insurance_insurance.changeInvVehInsuranceCoverageOptions(invVehId, changedCoverageOptions)` |  | 1642 |
| `career_modules_insurance_insurance.closeMenu(_closeMenuAfterSaving)` | close the insurances computer menu | 1670 |
| `career_modules_insurance_insurance.doesInsuranceExist(insuranceId)` |  | 1953 |
| `career_modules_insurance_insurance.expediteRepair(inventoryId, price)` |  | 1803 |
| `career_modules_insurance_insurance.formatPerkIconData(smallText, tooltipText, discount, isSignaturePerk)` |  | 958 |
| `career_modules_insurance_insurance.genericVehNeedsRepair(vehId, callback)` |  | 655 |
| `career_modules_insurance_insurance.getAccidentForgivenessCount(insuranceId)` |  | 1961 |
| `career_modules_insurance_insurance.getActualRepairPrice(invVehId)` | internal use only | 805 |
| `career_modules_insurance_insurance.getDefaultInsuranceForClassId(insuranceClassId)` |  | 1889 |
| `career_modules_insurance_insurance.getDriverScore()` |  | 562 |
| `career_modules_insurance_insurance.getDriverScoreResetCost()` |  | 1738 |
| `career_modules_insurance_insurance.getDriverScoreTierData(score)` |  | 552 |
| `career_modules_insurance_insurance.getInsuranceClassFromVehicleShoppingData(data)` |  | 923 |
| `career_modules_insurance_insurance.getInsuranceDataById(insuranceId)` |  | 1930 |
| `career_modules_insurance_insurance.getInsuranceName(insuranceId)` |  | 1957 |
| `career_modules_insurance_insurance.getInvVehFuelDiscountData(invVehId)` | perks | 1907 |
| `career_modules_insurance_insurance.getInvVehRepairTime(vehInvId)` |  | 1782 |
| `career_modules_insurance_insurance.getInvVehs()` |  | 1965 |
| `career_modules_insurance_insurance.getPerkValueByInsuranceId(insuranceId, perkId)` |  | 1876 |
| `career_modules_insurance_insurance.getPerkValueByInvVehId(invVehId, perkId)` |  | 1883 |
| `career_modules_insurance_insurance.getPlCoverageOptionValue(invVehId, coverageOptionName)` |  | 116 |
| `career_modules_insurance_insurance.getPlHistory()` |  | 1996 |
| `career_modules_insurance_insurance.getPlayerAbstractData()` |  | 1333 |
| `career_modules_insurance_insurance.getPlayerInsurancesData()` |  | 1786 |
| `career_modules_insurance_insurance.getQuickRepairExtraPrice()` |  | 1790 |
| `career_modules_insurance_insurance.getRenewsIn(insuranceId)` |  | 1127 |
| `career_modules_insurance_insurance.getTestDriveClaimPrice()` |  | 1872 |
| `career_modules_insurance_insurance.getVehInsuranceInfo(vehInvId)` |  | 1794 |
| `career_modules_insurance_insurance.inventoryVehNeedsRepair(vehInvId)` |  | 374 |
| `career_modules_insurance_insurance.isRoadSideAssistanceFree(invVehId)` |  | 1853 |
| `career_modules_insurance_insurance.makeRepairClaim(invVehId, costs, vehInfo)` | meters | 462 |
| `career_modules_insurance_insurance.makeTestDriveDamageClaim(vehId)` | when you damage a test drive vehicle, insurance needs to know | 441 |
| `career_modules_insurance_insurance.missionStartRepairCallback(vehInfo)` |  | 566 |
| `career_modules_insurance_insurance.onCareerActive(active)` | *(hook)* | 949 |
| `career_modules_insurance_insurance.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 1721 |
| `career_modules_insurance_insurance.onEnterVehicleFinished(invVehId)` | *(hook)* | 936 |
| `career_modules_insurance_insurance.onExitInsurancesComputerScreen()` | *(hook)* | 1717 |
| `career_modules_insurance_insurance.onMenuClosed()` | *(hook)* | 1713 |
| `career_modules_insurance_insurance.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 954 |
| `career_modules_insurance_insurance.onUpdate(dtReal, dtSim, dtRaw)` | hooks *(hook)* | 864 |
| `career_modules_insurance_insurance.onVehicleAddedToInventory(data)` | apply the minimum applicable insurance to the vehicle, and save it to the json file *(hook)* | 1590 |
| `career_modules_insurance_insurance.onVehicleRemoved(invVehId)` | remove the vehicle from the insuranced vehicles json files *(hook)* | 1508 |
| `career_modules_insurance_insurance.onVehicleSaveFinished()` | *(hook)* | 1683 |
| `career_modules_insurance_insurance.onVehicleSwitched()` | *(hook)* | 945 |
| `career_modules_insurance_insurance.openChooseInsuranceScreen(mode, params)` | purchase params: { purchaseType, shopId, insuranceId? }; change params: { vehicleId } | 1940 |
| `career_modules_insurance_insurance.openMenu(_originComputerId)` | open the insurances computer menu | 1691 |
| `career_modules_insurance_insurance.repairPartConditions(data)` |  | 380 |
| `career_modules_insurance_insurance.resetDriverScore()` |  | 1754 |
| `career_modules_insurance_insurance.resetPlPolicyData()` | career debug | 2051 |
| `career_modules_insurance_insurance.sanitizeCoverageOption(insuranceId, coverageOptionId, invVehId)` |  | 716 |
| `career_modules_insurance_insurance.saveNewInsuranceCoverageOptions(insuranceId, newCoverageOptions)` |  | 1813 |
| `career_modules_insurance_insurance.saveNewVehicleCoverageOptions(vehicleId, newCoverageOptions)` |  | 1835 |
| `career_modules_insurance_insurance.sendChangeInsuranceDataToTheUI(invVehId)` |  | 1425 |
| `career_modules_insurance_insurance.sendChooseInsuranceDataToTheUI(purchaseType, vehShopId, defaultInsuranceId)` |  | 1441 |
| `career_modules_insurance_insurance.sendUIData()` |  | 1454 |
| `career_modules_insurance_insurance.setDriverScore(score)` |  | 1949 |
| `career_modules_insurance_insurance.startRepair(vehInvId, repairOptionData, callback)` |  | 587 |
| `career_modules_insurance_insurance.startRepairInGarage(invVehId, repairOptionData)` |  | 644 |
| `career_modules_insurance_insurance.startRepairInstant(vehInfo, callback, skipSound)` |  | 571 |
| `career_modules_insurance_insurance.topUpRoadsideAssistance(insuranceId)` |  | 1847 |
| `career_modules_insurance_insurance.useRoadsideAssistance(invVehId)` |  | 1861 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onComputerInsurance`
- `onInsuranceRepairClaim` — écouté par 1 module(s)
- `onRepairInGarage` — écouté par 1 module(s)
- `onVehicleRepaired` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`, `chooseInsuranceData`, `gameContextPlayerVehicleDamageInfo`, `insurancesData`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/insurance/insurance.lua`.*
