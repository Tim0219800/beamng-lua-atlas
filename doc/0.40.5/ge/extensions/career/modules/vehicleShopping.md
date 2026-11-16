# `career_modules_vehicleShopping`

*File: `lua/ge/extensions/career/modules/vehicleShopping.lua` · VM: Game Engine (GE) · 1214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_vehicleShopping`: `extensions.load("career_modules_vehicleShopping")`, then the global `career_modules_vehicleShopping`

Career vehicle marketplace: generates and maintains the list of vehicles for sale (dealerships and private sellers), manages their lifetime, their "sale" while the player is away, the watchlist, opening the shop (from a dealership or the garage computer), vehicle inspection, the purchase screen (fees, 7% taxes, trade-in, discounts, insurance, custom plate) and the delivery or spawning of the purchased vehicle. Sends data to the UI via the guihooks vehicleShoppingData and vehiclePurchaseData. The list is saved in <profile>/career/vehicleShop.json.

## Notes

- Constants: offers valid for 10 min (vehicleOfferTimeToLive), one vehicle generated per seller every 60 s / vehicleGenerationMultiplier, sold vehicle removed 5 min later, delivery 60 s (1 s if under 500 m), tax 0.07, custom plate 300, moduleVersion 61 (list ignored if info.json has a lower version).
- Generation: util_configListGenerator.getEligibleVehicles then getRandomVehicleInfos with a normalized population (factor 0.4); avoids configs already for sale at the same seller. Year drawn between the config's bounds, mileage drawn according to filter.whiteList.Mileage, value adjusted by career_modules_valueCalculator, price rounded by seller.priceRoundingType (prestige, private, dealer or 10), negotiation via career_modules_marketplace.generatePersonality. "private" seller: random parking spot (tag notprivatesale excluded). Dealerships with staticInventory: fixed list generated once.
- Expired offers are removed, except those in the watchlist which become "sold" (soldFor, soldViewCounter) and stay visible for 5 min; the watchlistVehicleSold toast and the TOO_LATE achievement are triggered in onUpdate when a watched, uninspected vehicle expires.
- Purchase types (purchaseType): "inspect" (vehicle already spawned, bought via career_modules_inspectVehicle) and "instant" (direct purchase, spawn in a dealership spot or shipping to the garage with delay if makeDelivery).
- Related achievements: GOOD_DEAL / DEAL_MAKER (negotiated price < asking, <= 80%), SERIOUS_PURCHASE (>= 100,000).
- Bug: generateShopId is supposed to avoid duplicate identifiers, but the inner loop `break` then `return shopId` always returns the first draw without any real check.
- Minor bug: in onComputerAddFunctions, the code block of an old check is commented out; only the tutorial reasons (tutorialPartShoppingActive/tutorialTuningActive) and the "vehicleShopping" permissions disable the button.
- The local functions (getRoundedPrice, spawnVehicle, buyVehicleAndSendToGarage, etc.) are not exported.
- onExtensionLoaded returns false if the career is not active (the module does not load).

**Dependencies (loaded first):** `career_career`, `util_configListGenerator`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options)` | Executes the purchase from the purchase screen: pays, spawns or delivers the vehicle, removes any trade-in from the inventory, charges the custom plate and removes the offer from the list. | 983 |
| `career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions)` | Buys the already spawned vehicle from the inspection (pays, adds to the inventory, plate, enters it if the player is driving it). | 791 |
| `career_modules_vehicleShopping.cancelPurchase(purchaseType)` | Cancels the purchase: closes the menus for "inspect", reopens the shop for "instant". | 1024 |
| `career_modules_vehicleShopping.cancelShopping()` | Returns to the originating computer's menu, or closes all menus. | 728 |
| `career_modules_vehicleShopping.endShopping()` | Closes all career menus and emits the onVehicleShoppingMenuClosed hook. Also called by the tether. | 723 |
| `career_modules_vehicleShopping.getCurrentSellerId()` | Returns the id of the current dealership (nil if via the computer). | 1107 |
| `career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller)` | Returns a copy of the list of eligible configs without those already offered by the given seller. | 194 |
| `career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle()` | Title of the selected seller for the UI breadcrumb. | 771 |
| `career_modules_vehicleShopping.getShoppingData()` | Builds the shop data for the UI: vehicles for sale and sold, dealerships (with vehicle count, disabled during onboarding except apmStarterVehicles), current and selected seller, player's money and attributes, free inventory slots, purchase rights. | 101 |
| `career_modules_vehicleShopping.getVehicleInfoByShopId(shopId)` | Finds a vehicle for sale by its shopId. | 185 |
| `career_modules_vehicleShopping.getVehiclesInShop()` | Returns the internal table of vehicles for sale. | 787 |
| `career_modules_vehicleShopping.getVisualValueFromMileage(mileage)` | Converts a mileage into a visual wear factor (1 up to 10,000,000, decreasing to 0.75 at 2,000,000,000), passed to partCondition.initConditions on spawn. | 497 |
| `career_modules_vehicleShopping.navigateToPos(pos)` | Draws ground guidance to a position and returns to the game screen ("play"). | 635 |
| `career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts)` | Inventory hook after the parts of a purchased vehicle are added: records year, original parts and modified slots, deletes the vehicle object if delivery, closes the shop, emits onVehicleAddedToInventory and saves if autosave. *(internal)* *(hook)* | 900 |
| `career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions)` | Garage computer hook: adds the general function "vehicleShop" (vehicle marketplace), disabled during the tutorial or if permissions deny vehicleShopping. *(internal)* *(hook)* | 1111 |
| `career_modules_vehicleShopping.onExtensionLoaded()` | Load hook: loads vehicleShop.json from the save if the version is compatible. Returns false outside an active career. *(internal)* *(hook)* | 1071 |
| `career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data)` | UI router hook: restores the selected seller from the route parameters (sellerId). *(internal)* *(hook)* | 657 |
| `career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data)` | UI router hook: sends the shop data once the view is mounted. *(internal)* *(hook)* | 744 |
| `career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath)` | Save hook: writes vehicleShop.json (offers, sellers, watchlist, static state). *(internal)* *(hook)* | 1097 |
| `career_modules_vehicleShopping.onShoppingMenuClosed()` | Hook emitted when the shop closes: removes the tether. *(internal)* *(hook)* | 783 |
| `career_modules_vehicleShopping.onUiChangedState(toState)` | Hook emitted on each UI state change: remembers the current state. *(internal)* *(hook)* | 1167 |
| `career_modules_vehicleShopping.onUpdate()` | Update hook (only in "play" UI state): monitors the watchlist and signals by toast the sale of a watched vehicle whose offer has expired. *(internal)* *(hook)* | 1139 |
| `career_modules_vehicleShopping.onVehicleSpawnFinished(vehId)` | Called by the vehicle (queueGameEngineLua) when its part conditions are initialized: adds it to the inventory, enters it if it is the player vehicle, applies delivery delay and plate. *(internal)* *(hook)* | 537 |
| `career_modules_vehicleShopping.openInventoryMenuForTradeIn()` | Opens the inventory menu to choose a vehicle to trade in (repair required, owner required); the value is computed by valueCalculator. | 1046 |
| `career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId)` | Opens the purchase screen for an offer, adds the offer to the watchlist and emits onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}). | 969 |
| `career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag)` | Opens the shop: updates the list, computes quick travel distances and prices, creates the tether (4 m sphere in front of a dealership, or the computer's door) and navigates to the shop screen. Emits the onVehicleShoppingMenuOpened({seller}) hook. | 666 |
| `career_modules_vehicleShopping.quickTravelToVehicle(shopId)` | Like showVehicle, but teleports the player to the vehicle. | 964 |
| `career_modules_vehicleShopping.removeTradeInVehicle()` | Removes the trade-in vehicle from the current purchase and updates the UI. | 1041 |
| `career_modules_vehicleShopping.requestExit()` | Router back button handler: equivalent to cancelShopping. *(internal)* | 739 |
| `career_modules_vehicleShopping.requestPurchaseExit()` | Back from the purchase screen: closes the menus for "inspect", otherwise returns to the vehicle list. *(internal)* | 1032 |
| `career_modules_vehicleShopping.requestVehicleListExit()` | Exit from the vehicle list: with a current seller, cancels the shop; otherwise deselects the seller and returns to the sellers screen. | 763 |
| `career_modules_vehicleShopping.selectSeller(sellerId)` | The UI chose a seller: records it, emits onVehicleShoppingSelectedSellerIdChanged, sends the data and navigates to the vehicle list. | 750 |
| `career_modules_vehicleShopping.sendPurchaseDataToUi()` | Computes the prices (fees, discount, trade-in, 7% taxes, final price), the insurance, the test drive damage fees, then sends vehiclePurchaseData to the UI. | 805 |
| `career_modules_vehicleShopping.sendShoppingDataToUI()` | Sends getShoppingData to the UI (guihooks vehicleShoppingData). | 134 |
| `career_modules_vehicleShopping.showVehicle(shopId)` | Starts the inspection of a vehicle for sale (fade, spawn via career_modules_inspectVehicle.startInspection). Emits onVehicleShoppingVehicleShown on success. | 959 |
| `career_modules_vehicleShopping.updateInsuranceSelection(insuranceId)` | Changes the selected insurance for the current purchase and resends the data. | 976 |
| `career_modules_vehicleShopping.updateVehicleList(fromScratch)` | Updates the list of vehicles for sale: removes expired offers or those with a missing model, generates each seller's new vehicles according to the elapsed time. | 257 |

### Parameter details

#### `career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options)`

Executes the purchase from the purchase screen: pays, spawns or delivers the vehicle, removes any trade-in from the inventory, charges the custom plate and removes the offer from the list.

- `purchaseType` (*string*) : "inspect" or "instant".
- `options` (*table*) : {licensePlateText, makeDelivery, insuranceId}.

#### `career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions)`

Buys the already spawned vehicle from the inspection (pays, adds to the inventory, plate, enters it if the player is driving it).

- `buyVehicleOptions` (*table*) : {licensePlateText}.

#### `career_modules_vehicleShopping.cancelPurchase(purchaseType)`

Cancels the purchase: closes the menus for "inspect", reopens the shop for "instant".

- `purchaseType` (*string*) : "inspect" or "instant".

#### `career_modules_vehicleShopping.getCurrentSellerId()`

Returns the id of the current dealership (nil if via the computer).

- **returns**: string|nil Id.

#### `career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller)`

Returns a copy of the list of eligible configs without those already offered by the given seller.

- `eligibleVehicles` (*table[]*) : List of eligible configs (model_key, key).
- `seller` (*table*) : Seller (id field).
- **returns**: table[] Filtered list.

#### `career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle()`

Title of the selected seller for the UI breadcrumb.

- **returns**: string|nil Translated name.

#### `career_modules_vehicleShopping.getShoppingData()`

Builds the shop data for the UI: vehicles for sale and sold, dealerships (with vehicle count, disabled during onboarding except apmStarterVehicles), current and selected seller, player's money and attributes, free inventory slots, purchase rights.

- **returns**: table Data sent by the vehicleShoppingData guihook.

#### `career_modules_vehicleShopping.getVehicleInfoByShopId(shopId)`

Finds a vehicle for sale by its shopId.

- `shopId` (*integer*) : Offer identifier.
- **returns**: table|nil Offer information.

#### `career_modules_vehicleShopping.getVehiclesInShop()`

Returns the internal table of vehicles for sale.

- **returns**: table[] Current offers.

#### `career_modules_vehicleShopping.getVisualValueFromMileage(mileage)`

Converts a mileage into a visual wear factor (1 up to 10,000,000, decreasing to 0.75 at 2,000,000,000), passed to partCondition.initConditions on spawn.

- `mileage` (*number*) : Odometer in game units (meters, inferred from code).
- **returns**: number Factor between 0.75 and 1.

#### `career_modules_vehicleShopping.navigateToPos(pos)`

Draws ground guidance to a position and returns to the game screen ("play").

- `pos` (*vec3*) : Position (fields x, y, z).

#### `career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts)`

Inventory hook after the parts of a purchased vehicle are added: records year, original parts and modified slots, deletes the vehicle object if delivery, closes the shop, emits onVehicleAddedToInventory and saves if autosave.

- `inventoryId` (*integer*) : Inventory id of the new vehicle.
- `newParts` (*table*) : Added parts (by name).

#### `career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions)`

Garage computer hook: adds the general function "vehicleShop" (vehicle marketplace), disabled during the tutorial or if permissions deny vehicleShopping.

- `menuData` (*table*) : Menu data.
- `computerFunctions` (*table*) : Table to fill (general).

#### `career_modules_vehicleShopping.onExtensionLoaded()`

Load hook: loads vehicleShop.json from the save if the version is compatible. Returns false outside an active career.

- **returns**: boolean|nil false to refuse loading.

#### `career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data)`

UI router hook: restores the selected seller from the route parameters (sellerId).

- `context` (*any*) : Context.
- `toRoute` (*table*) : Target route (params.sellerId).
- `fromRoute` (*any*) : Origin route.
- `data` (*any*) : Route data.

#### `career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data)`

UI router hook: sends the shop data once the view is mounted.

- `context` (*any*) : Context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Origin route.
- `data` (*any*) : Route data.

#### `career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath)`

Save hook: writes vehicleShop.json (offers, sellers, watchlist, static state).

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_vehicleShopping.onUiChangedState(toState)`

Hook emitted on each UI state change: remembers the current state.

- `toState` (*string*) : New state (e.g. "play").

#### `career_modules_vehicleShopping.onVehicleSpawnFinished(vehId)`

Called by the vehicle (queueGameEngineLua) when its part conditions are initialized: adds it to the inventory, enters it if it is the player vehicle, applies delivery delay and plate.

- `vehId` (*integer*) : Vehicle id.

#### `career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId)`

Opens the purchase screen for an offer, adds the offer to the watchlist and emits onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}).

- `purchaseType` (*string*) : "inspect" or "instant".
- `shopId` (*integer*) : Offer identifier.
- `insuranceId` (*integer|nil*) : Preselected insurance.

#### `career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag)`

Opens the shop: updates the list, computes quick travel distances and prices, creates the tether (4 m sphere in front of a dealership, or the computer's door) and navigates to the shop screen. Emits the onVehicleShoppingMenuOpened({seller}) hook.

- `seller` (*string|nil*) : Dealership id (nil = from the computer).
- `_originComputerId` (*any*) : Originating computer id.
- `screenTag` (*string|nil*) : Screen tag passed to the UI.

#### `career_modules_vehicleShopping.quickTravelToVehicle(shopId)`

Like showVehicle, but teleports the player to the vehicle.

- `shopId` (*integer*) : Offer identifier.

#### `career_modules_vehicleShopping.selectSeller(sellerId)`

The UI chose a seller: records it, emits onVehicleShoppingSelectedSellerIdChanged, sends the data and navigates to the vehicle list.

- `sellerId` (*string*) : Dealership id or "private".

#### `career_modules_vehicleShopping.showVehicle(shopId)`

Starts the inspection of a vehicle for sale (fade, spawn via career_modules_inspectVehicle.startInspection). Emits onVehicleShoppingVehicleShown on success.

- `shopId` (*integer*) : Offer identifier.

#### `career_modules_vehicleShopping.updateInsuranceSelection(insuranceId)`

Changes the selected insurance for the current purchase and resends the data.

- `insuranceId` (*integer*) : Insurance id.

#### `career_modules_vehicleShopping.updateVehicleList(fromScratch)`

Updates the list of vehicles for sale: removes expired offers or those with a missing model, generates each seller's new vehicles according to the elapsed time.

- `fromScratch` (*boolean|nil*) : If true, clears everything and regenerates from scratch.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career', 'util_configListGenerator'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleAddedToInventory` — listened to by 4 module(s)
- `onVehicleShoppingMenuClosed`
- `onVehicleShoppingMenuOpened` — listened to by 1 module(s)
- `onVehicleShoppingPurchaseMenuOpened` — listened to by 1 module(s)
- `onVehicleShoppingSelectedSellerIdChanged` — listened to by 1 module(s)
- `onVehicleShoppingVehicleShown`

**UI events (guihooks.trigger):** `UINavigation`, `toastrMsg`, `vehiclePurchaseData`, `vehicleShoppingData`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/vehicleShopping.lua`.*
