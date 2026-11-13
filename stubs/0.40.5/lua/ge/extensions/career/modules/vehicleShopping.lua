---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_vehicleShopping` : `extensions.load("career_modules_vehicleShopping")`, puis la globale `career_modules_vehicleShopping`
---@class career_modules_vehicleShopping
---@field dependencies table
career_modules_vehicleShopping = {}

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:983
---@param purchaseType any
---@param options any
function career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:791
---@param buyVehicleOptions any
function career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1024
---@param purchaseType any
function career_modules_vehicleShopping.cancelPurchase(purchaseType) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:728
function career_modules_vehicleShopping.cancelShopping() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:723
function career_modules_vehicleShopping.endShopping() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1107
function career_modules_vehicleShopping.getCurrentSellerId() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:194
---@param eligibleVehicles any
---@param seller any
function career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:771
function career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:101
function career_modules_vehicleShopping.getShoppingData() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:185
---@param shopId any
function career_modules_vehicleShopping.getVehicleInfoByShopId(shopId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:787
function career_modules_vehicleShopping.getVehiclesInShop() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:497
---@param mileage any
function career_modules_vehicleShopping.getVisualValueFromMileage(mileage) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:635
---@param pos any
function career_modules_vehicleShopping.navigateToPos(pos) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:900
---@param inventoryId any
---@param newParts any
function career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1111
---@param menuData any
---@param computerFunctions any
function career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1071
function career_modules_vehicleShopping.onExtensionLoaded() end

--- Router lifecycle: restore the selected seller from the route params before the
---  view mounts, so a reload or parameterized deep-link into the vehicle list
---  resolves the correct seller instead of falling back to the seller grid.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:657
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- Router lifecycle: emit the shopping data once the destination view has mounted.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:744
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1097
---@param currentSavePath any
function career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:783
function career_modules_vehicleShopping.onShoppingMenuClosed() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1167
---@param toState any
function career_modules_vehicleShopping.onUiChangedState(toState) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1139
function career_modules_vehicleShopping.onUpdate() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:537
---@param vehId any
function career_modules_vehicleShopping.onVehicleSpawnFinished(vehId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1046
function career_modules_vehicleShopping.openInventoryMenuForTradeIn() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:969
---@param purchaseType any
---@param shopId any
---@param insuranceId any
function career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:666
---@param seller any
---@param _originComputerId any
---@param screenTag any
function career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:964
---@param shopId any
function career_modules_vehicleShopping.quickTravelToVehicle(shopId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1041
function career_modules_vehicleShopping.removeTradeInVehicle() end

--- Router back handler: computer-origin shopping returns to the computer menu,
---  dealership-origin shopping exits to play (mirrors cancelShopping).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:739
function career_modules_vehicleShopping.requestExit() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1032
function career_modules_vehicleShopping.requestPurchaseExit() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:763
function career_modules_vehicleShopping.requestVehicleListExit() end

--- UI selected a dealership/private seller: store it, notify listeners (tutorial),
---  push fresh data, then navigate to the vehicle list screen.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:750
---@param sellerId any
function career_modules_vehicleShopping.selectSeller(sellerId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:805
function career_modules_vehicleShopping.sendPurchaseDataToUi() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:134
function career_modules_vehicleShopping.sendShoppingDataToUI() end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:959
---@param shopId any
function career_modules_vehicleShopping.showVehicle(shopId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:976
---@param insuranceId any
function career_modules_vehicleShopping.updateInsuranceSelection(insuranceId) end

---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:257
---@param fromScratch any
function career_modules_vehicleShopping.updateVehicleList(fromScratch) end

