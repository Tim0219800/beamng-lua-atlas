# `career_modules_vehicleShopping`

*Fichier : `lua/ge/extensions/career/modules/vehicleShopping.lua` · VM : Game Engine (GE) · 1214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehicleShopping` : `extensions.load("career_modules_vehicleShopping")`, puis la globale `career_modules_vehicleShopping`

**Dépendances (chargées avant) :** `career_career`, `util_configListGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options)` |  | 983 |
| `career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions)` |  | 791 |
| `career_modules_vehicleShopping.cancelPurchase(purchaseType)` |  | 1024 |
| `career_modules_vehicleShopping.cancelShopping()` |  | 728 |
| `career_modules_vehicleShopping.endShopping()` |  | 723 |
| `career_modules_vehicleShopping.getCurrentSellerId()` |  | 1107 |
| `career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller)` |  | 194 |
| `career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle()` |  | 771 |
| `career_modules_vehicleShopping.getShoppingData()` |  | 101 |
| `career_modules_vehicleShopping.getVehicleInfoByShopId(shopId)` |  | 185 |
| `career_modules_vehicleShopping.getVehiclesInShop()` |  | 787 |
| `career_modules_vehicleShopping.getVisualValueFromMileage(mileage)` |  | 497 |
| `career_modules_vehicleShopping.navigateToPos(pos)` |  | 635 |
| `career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts)` | *(hook)* | 900 |
| `career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 1111 |
| `career_modules_vehicleShopping.onExtensionLoaded()` | *(hook)* | 1071 |
| `career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data)` | Router lifecycle: restore the selected seller from the route params before the<br> view mounts, so a reload or parameterized deep-link into the vehicle list<br> resolves the correct seller instead of falling back to the seller grid. *(hook)* | 657 |
| `career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: emit the shopping data once the destination view has mounted. *(hook)* | 744 |
| `career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 1097 |
| `career_modules_vehicleShopping.onShoppingMenuClosed()` | *(hook)* | 783 |
| `career_modules_vehicleShopping.onUiChangedState(toState)` | *(hook)* | 1167 |
| `career_modules_vehicleShopping.onUpdate()` | *(hook)* | 1139 |
| `career_modules_vehicleShopping.onVehicleSpawnFinished(vehId)` | *(hook)* | 537 |
| `career_modules_vehicleShopping.openInventoryMenuForTradeIn()` |  | 1046 |
| `career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId)` |  | 969 |
| `career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag)` |  | 666 |
| `career_modules_vehicleShopping.quickTravelToVehicle(shopId)` |  | 964 |
| `career_modules_vehicleShopping.removeTradeInVehicle()` |  | 1041 |
| `career_modules_vehicleShopping.requestExit()` | Router back handler: computer-origin shopping returns to the computer menu,<br> dealership-origin shopping exits to play (mirrors cancelShopping). | 739 |
| `career_modules_vehicleShopping.requestPurchaseExit()` |  | 1032 |
| `career_modules_vehicleShopping.requestVehicleListExit()` |  | 763 |
| `career_modules_vehicleShopping.selectSeller(sellerId)` | UI selected a dealership/private seller: store it, notify listeners (tutorial),<br> push fresh data, then navigate to the vehicle list screen. | 750 |
| `career_modules_vehicleShopping.sendPurchaseDataToUi()` |  | 805 |
| `career_modules_vehicleShopping.sendShoppingDataToUI()` |  | 134 |
| `career_modules_vehicleShopping.showVehicle(shopId)` |  | 959 |
| `career_modules_vehicleShopping.updateInsuranceSelection(insuranceId)` |  | 976 |
| `career_modules_vehicleShopping.updateVehicleList(fromScratch)` |  | 257 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleAddedToInventory` — écouté par 4 module(s)
- `onVehicleShoppingMenuClosed`
- `onVehicleShoppingMenuOpened` — écouté par 1 module(s)
- `onVehicleShoppingPurchaseMenuOpened` — écouté par 1 module(s)
- `onVehicleShoppingSelectedSellerIdChanged` — écouté par 1 module(s)
- `onVehicleShoppingVehicleShown`

**Évènements UI (guihooks.trigger) :** `UINavigation`, `toastrMsg`, `vehiclePurchaseData`, `vehicleShoppingData`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehicleShopping.lua`.*
