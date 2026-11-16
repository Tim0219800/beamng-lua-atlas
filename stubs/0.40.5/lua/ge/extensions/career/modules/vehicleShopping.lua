---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career vehicle marketplace: generates and maintains the list of vehicles for sale (dealerships and private sellers), manages their lifetime, their "sale" while the player is away, the watchlist, opening the shop (from a dealership or the garage computer), vehicle inspection, the purchase screen (fees, 7% taxes, trade-in, discounts, insurance, custom plate) and the delivery or spawning of the purchased vehicle. Sends data to the UI via the guihooks vehicleShoppingData and vehiclePurchaseData. The list is saved in <profile>/career/vehicleShop.json.
--- Access: extension `career_modules_vehicleShopping`: `extensions.load("career_modules_vehicleShopping")`, then the global `career_modules_vehicleShopping`
---@class career_modules_vehicleShopping
---@field dependencies string[] {'career_career', 'util_configListGenerator'}.
career_modules_vehicleShopping = {}

--- Executes the purchase from the purchase screen: pays, spawns or delivers the vehicle, removes any trade-in from the inventory, charges the custom plate and removes the offer from the list.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:983
---@param purchaseType string "inspect" or "instant".
---@param options table {licensePlateText, makeDelivery, insuranceId}.
function career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options) end

--- Buys the already spawned vehicle from the inspection (pays, adds to the inventory, plate, enters it if the player is driving it).
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:791
---@param buyVehicleOptions table {licensePlateText}.
function career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions) end

--- Cancels the purchase: closes the menus for "inspect", reopens the shop for "instant".
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1024
---@param purchaseType string "inspect" or "instant".
function career_modules_vehicleShopping.cancelPurchase(purchaseType) end

--- Returns to the originating computer's menu, or closes all menus.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:728
function career_modules_vehicleShopping.cancelShopping() end

--- Closes all career menus and emits the onVehicleShoppingMenuClosed hook. Also called by the tether.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:723
function career_modules_vehicleShopping.endShopping() end

--- Returns the id of the current dealership (nil if via the computer).
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1107
---@return string|nil  Id.
function career_modules_vehicleShopping.getCurrentSellerId() end

--- Returns a copy of the list of eligible configs without those already offered by the given seller.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:194
---@param eligibleVehicles table[] List of eligible configs (model_key, key).
---@param seller table Seller (id field).
---@return table[]  Filtered list.
function career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller) end

--- Title of the selected seller for the UI breadcrumb.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:771
---@return string|nil  Translated name.
function career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle() end

--- Builds the shop data for the UI: vehicles for sale and sold, dealerships (with vehicle count, disabled during onboarding except apmStarterVehicles), current and selected seller, player's money and attributes, free inventory slots, purchase rights.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:101
---@return table  Data sent by the vehicleShoppingData guihook.
function career_modules_vehicleShopping.getShoppingData() end

--- Finds a vehicle for sale by its shopId.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:185
---@param shopId integer Offer identifier.
---@return table|nil  Offer information.
function career_modules_vehicleShopping.getVehicleInfoByShopId(shopId) end

--- Returns the internal table of vehicles for sale.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:787
---@return table[]  Current offers.
function career_modules_vehicleShopping.getVehiclesInShop() end

--- Converts a mileage into a visual wear factor (1 up to 10,000,000, decreasing to 0.75 at 2,000,000,000), passed to partCondition.initConditions on spawn.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:497
---@param mileage number Odometer in game units (meters, inferred from code).
---@return number  Factor between 0.75 and 1.
function career_modules_vehicleShopping.getVisualValueFromMileage(mileage) end

--- Draws ground guidance to a position and returns to the game screen ("play").
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:635
---@param pos vec3 Position (fields x, y, z).
function career_modules_vehicleShopping.navigateToPos(pos) end

--- Inventory hook after the parts of a purchased vehicle are added: records year, original parts and modified slots, deletes the vehicle object if delivery, closes the shop, emits onVehicleAddedToInventory and saves if autosave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:900
---@param inventoryId integer Inventory id of the new vehicle.
---@param newParts table Added parts (by name).
function career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts) end

--- Garage computer hook: adds the general function "vehicleShop" (vehicle marketplace), disabled during the tutorial or if permissions deny vehicleShopping.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1111
---@param menuData table Menu data.
---@param computerFunctions table Table to fill (general).
function career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions) end

--- Load hook: loads vehicleShop.json from the save if the version is compatible. Returns false outside an active career.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1071
---@return boolean|nil  false to refuse loading.
function career_modules_vehicleShopping.onExtensionLoaded() end

--- UI router hook: restores the selected seller from the route parameters (sellerId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:657
---@param context any Context.
---@param toRoute table Target route (params.sellerId).
---@param fromRoute any Origin route.
---@param data any Route data.
function career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- UI router hook: sends the shop data once the view is mounted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:744
---@param context any Context.
---@param toRoute any Target route.
---@param fromRoute any Origin route.
---@param data any Route data.
function career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data) end

--- Save hook: writes vehicleShop.json (offers, sellers, watchlist, static state).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1097
---@param currentSavePath string Save folder.
function career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath) end

--- Hook emitted when the shop closes: removes the tether.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:783
function career_modules_vehicleShopping.onShoppingMenuClosed() end

--- Hook emitted on each UI state change: remembers the current state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1167
---@param toState string New state (e.g. "play").
function career_modules_vehicleShopping.onUiChangedState(toState) end

--- Update hook (only in "play" UI state): monitors the watchlist and signals by toast the sale of a watched vehicle whose offer has expired.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1139
function career_modules_vehicleShopping.onUpdate() end

--- Called by the vehicle (queueGameEngineLua) when its part conditions are initialized: adds it to the inventory, enters it if it is the player vehicle, applies delivery delay and plate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:537
---@param vehId integer Vehicle id.
function career_modules_vehicleShopping.onVehicleSpawnFinished(vehId) end

--- Opens the inventory menu to choose a vehicle to trade in (repair required, owner required); the value is computed by valueCalculator.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1046
function career_modules_vehicleShopping.openInventoryMenuForTradeIn() end

--- Opens the purchase screen for an offer, adds the offer to the watchlist and emits onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}).
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:969
---@param purchaseType string "inspect" or "instant".
---@param shopId integer Offer identifier.
---@param insuranceId integer|nil Preselected insurance.
function career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId) end

--- Opens the shop: updates the list, computes quick travel distances and prices, creates the tether (4 m sphere in front of a dealership, or the computer's door) and navigates to the shop screen. Emits the onVehicleShoppingMenuOpened({seller}) hook.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:666
---@param seller string|nil Dealership id (nil = from the computer).
---@param _originComputerId any Originating computer id.
---@param screenTag string|nil Screen tag passed to the UI.
function career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag) end

--- Like showVehicle, but teleports the player to the vehicle.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:964
---@param shopId integer Offer identifier.
function career_modules_vehicleShopping.quickTravelToVehicle(shopId) end

--- Removes the trade-in vehicle from the current purchase and updates the UI.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1041
function career_modules_vehicleShopping.removeTradeInVehicle() end

--- Router back button handler: equivalent to cancelShopping.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:739
function career_modules_vehicleShopping.requestExit() end

--- Back from the purchase screen: closes the menus for "inspect", otherwise returns to the vehicle list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:1032
function career_modules_vehicleShopping.requestPurchaseExit() end

--- Exit from the vehicle list: with a current seller, cancels the shop; otherwise deselects the seller and returns to the sellers screen.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:763
function career_modules_vehicleShopping.requestVehicleListExit() end

--- The UI chose a seller: records it, emits onVehicleShoppingSelectedSellerIdChanged, sends the data and navigates to the vehicle list.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:750
---@param sellerId string Dealership id or "private".
function career_modules_vehicleShopping.selectSeller(sellerId) end

--- Computes the prices (fees, discount, trade-in, 7% taxes, final price), the insurance, the test drive damage fees, then sends vehiclePurchaseData to the UI.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:805
function career_modules_vehicleShopping.sendPurchaseDataToUi() end

--- Sends getShoppingData to the UI (guihooks vehicleShoppingData).
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:134
function career_modules_vehicleShopping.sendShoppingDataToUI() end

--- Starts the inspection of a vehicle for sale (fade, spawn via career_modules_inspectVehicle.startInspection). Emits onVehicleShoppingVehicleShown on success.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:959
---@param shopId integer Offer identifier.
function career_modules_vehicleShopping.showVehicle(shopId) end

--- Changes the selected insurance for the current purchase and resends the data.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:976
---@param insuranceId integer Insurance id.
function career_modules_vehicleShopping.updateInsuranceSelection(insuranceId) end

--- Updates the list of vehicles for sale: removes expired offers or those with a missing model, generates each seller's new vehicles according to the elapsed time.
---Source: lua/ge/extensions/career/modules/vehicleShopping.lua:257
---@param fromScratch boolean|nil If true, clears everything and regenerates from scratch.
function career_modules_vehicleShopping.updateVehicleList(fromScratch) end

