# `career_modules_inventory`

*Fichier : `lua/ge/extensions/career/modules/inventory.lua` · VM : Game Engine (GE) · 1448 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_inventory` : `extensions.load("career_modules_inventory")`, puis la globale `career_modules_inventory`

**Dépendances (chargées avant) :** `career_career`, `career_modules_log`, `gameplay_tutorial_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_inventory.addVehicle(vehId, inventoryId, options)` |  | 299 |
| `career_modules_inventory.applyPartConditions(inventoryId, vehId)` |  | 428 |
| `career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh)` |  | 1111 |
| `career_modules_inventory.closeMenu()` |  | 1032 |
| `career_modules_inventory.debugRespawnCurrentVehicle()` |  | 1370 |
| `career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason)` |  | 1193 |
| `career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback)` | loadOption 1: dont reload the vehicle<br> loadOption 2: force reload the vehicle | 538 |
| `career_modules_inventory.expediteRepairFromInventory(inventoryId, price)` |  | 1187 |
| `career_modules_inventory.getClosestGarage(pos)` |  | 36 |
| `career_modules_inventory.getCurrentVehicle()` | Debug | 674 |
| `career_modules_inventory.getCurrentVehicleId()` |  | 698 |
| `career_modules_inventory.getDirtiedVehicles()` |  | 1343 |
| `career_modules_inventory.getFavoriteVehicle()` |  | 1214 |
| `career_modules_inventory.getInventoryIdFromVehicleId(vehId)` |  | 688 |
| `career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst)` |  | 973 |
| `career_modules_inventory.getLastVehicle()` |  | 678 |
| `career_modules_inventory.getMapInventoryIdToVehId()` |  | 694 |
| `career_modules_inventory.getNumberOfFreeSlots()` |  | 286 |
| `career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId)` |  | 395 |
| `career_modules_inventory.getVehicle(inventoryId)` |  | 1152 |
| `career_modules_inventory.getVehicleIdFromInventoryId(inventoryId)` |  | 682 |
| `career_modules_inventory.getVehicleNiceNameTranslated(inventoryId)` |  | 833 |
| `career_modules_inventory.getVehicleThumbnail(inventoryId)` |  | 760 |
| `career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage)` |  | 839 |
| `career_modules_inventory.getVehicles()` |  | 1148 |
| `career_modules_inventory.hasFreeSlot()` |  | 294 |
| `career_modules_inventory.isEmpty()` |  | 1347 |
| `career_modules_inventory.isLicensePlateValid(text)` |  | 1351 |
| `career_modules_inventory.isSeatedInsideOwnedVehicle()` |  | 702 |
| `career_modules_inventory.isVehicleNameValid(text)` |  | 1355 |
| `career_modules_inventory.onAvailableMissionsSentToUi()` | *(hook)* | 1200 |
| `career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId)` | *(hook)* | 964 |
| `career_modules_inventory.onBigMapActivated()` | *(hook)* | 662 |
| `career_modules_inventory.onCareerActive(active)` | *(hook)* | 636 |
| `career_modules_inventory.onCheckPermission(tags, permissions, additionalData)` | *(hook)* | 1270 |
| `career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 1218 |
| `career_modules_inventory.onEnterVehicleFinished(inventoryId)` | *(hook)* | 1142 |
| `career_modules_inventory.onExitVehicleInventory()` | *(hook)* | 1137 |
| `career_modules_inventory.onExtensionLoaded()` | *(hook)* | 54 |
| `career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 1299 |
| `career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | TODO update a vehicles part conditions in the table when you exit a vehicle *(hook)* | 247 |
| `career_modules_inventory.onSaveCurrentProfileAsyncStart()` | *(hook)* | 177 |
| `career_modules_inventory.onScreenFadeState(state)` | *(hook)* | 1001 |
| `career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 923 |
| `career_modules_inventory.openInventoryMenuForChoosingListing()` |  | 1115 |
| `career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget)` |  | 1009 |
| `career_modules_inventory.openMenuFromComputer(_originComputerId)` |  | 1082 |
| `career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money)` |  | 1243 |
| `career_modules_inventory.removeVehicle(inventoryId)` |  | 378 |
| `career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions)` |  | 360 |
| `career_modules_inventory.renameVehicle(inventoryId, name)` |  | 1360 |
| `career_modules_inventory.requestPickerExit()` |  | 1036 |
| `career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId)` |  | 1180 |
| `career_modules_inventory.sellVehicle(inventoryId, price)` |  | 1156 |
| `career_modules_inventory.sellVehicleFromInventory(inventoryId)` |  | 1173 |
| `career_modules_inventory.sendDataToUi()` |  | 903 |
| `career_modules_inventory.setFavoriteVehicle(inventoryId)` |  | 1208 |
| `career_modules_inventory.setLicensePlateText(inventoryId, text)` |  | 1235 |
| `career_modules_inventory.setVehicleDirty(inventoryId)` |  | 146 |
| `career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback)` | replaceOption 1: replace the current vehicle object<br> replaceOption 2: replace the vehicle object with the same inventoryId | 436 |
| `career_modules_inventory.teleportedFromBigmap()` |  | 668 |
| `career_modules_inventory.updatePartConditions(vehId, inventoryId, callback)` |  | 406 |
| `career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback)` |  | 150 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeVehicleSell` — écouté par 1 module(s)
- `onEnterVehicleFinished` — écouté par 4 module(s)
- `onInventoryPreRemoveVehicleObject` — écouté par 1 module(s)
- `onVehicleAdded` — écouté par 2 module(s)
- `onVehicleRemoved` — écouté par 3 module(s)
- `onVehicleSaveFinished` — écouté par 8 module(s)

**Évènements UI (guihooks.trigger) :** `addListing`, `gameContextPlayerVehicleDamageInfo`, `saveFinished`, `toastrMsg`, `vehicleInventoryData`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`
- `be:` `enterVehicle`, `getPlayerVehicleID`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/inventory.lua`.*
