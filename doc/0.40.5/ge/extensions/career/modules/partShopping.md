# `career_modules_partShopping`

*File: `lua/ge/extensions/career/modules/partShopping.lua` · VM: Game Engine (GE) · 1086 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_partShopping`: `extensions.load("career_modules_partShopping")`, then the global `career_modules_partShopping`

Career parts shop ("part customization" screen of the garage computer). For an inventory vehicle, it generates the list of compatible parts per slot (new JBeam parts with their value, plus inventory parts in storage at zero cost), maintains a cart (partsIn / partsOut), previews the result by respawning the vehicle with the chosen parts, automatically adds the necessary parts in sub-slots, removes parts that became incompatible and applies the purchase (payment, parts inventory update, save).

## Example

```lua
career_modules_partShopping.startShopping(inventoryId, computerId)
career_modules_partShopping.installPartByPartShopId(partShopId)
local cart = career_modules_partShopping.getShoppingCart()
print(cart.total)
```

## Notes

- Sales tax: 7% (salesTax) added to the cart total; shoppingCart.total = sum of finalValue + taxes.
- A new part has a final value = computed value (career_modules_valueCalculator.getPartValue) rounded to the nearest 5 minus 0.01 (minimum 0); an offered inventory part has finalValue = 0; the "empty" entry (emptyPlaceholder) allows removing a non-essential part.
- Cargo parts (dryBulk or fluid) are disabled until the logistics-materials branch is unlocked (except the "Magic Cargo Testing Part" test part).
- The preview replaces the vehicle (core_vehicles.replaceVehicle) with previewVehicle.config and freezes the vehicle; the paint of the new parts uses the primer color from career_modules_painting.getPrimerColor.
- A vehicle with broken parts (between 1 and the threshold) is first repaired via insurance before entering the shop.
- A capsule tether between the computer and the vehicle cancels the session (cancelShopping) if the player moves away.
- Emitted hooks: onPartShoppingStarted, onPartShoppingPartInstalled({part}), onPartShoppingCancelled, onPartShoppingTransactionComplete, plus guihooks partShoppingData and partShoppingRequestExit.
- The purchase calls career_modules_vehiclePerformance.invalidateCertification and unlocks the VEHICLE_MODIFIED achievement.
- UI route: career.computer.partShopping, .category ("cargo" category or all parts) and .category.slot; the active panel (categories, slots, parts) depends on the route.

**Dependencies (loaded first):** `career_career`, `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_partShopping.applyShopping()` | Confirms the purchase: does nothing if the player cannot pay the total including tax. Otherwise replaces the inventory vehicle with the preview, moves removed parts to storage, adds/updates installed parts, pays (tags partsBought, buying), saves the vehicle, plays the sound and emits onPartShoppingTransactionComplete. | 972 |
| `career_modules_partShopping.cancelShopping()` | Cancels the session: emits onPartShoppingCancelled, respawns the original vehicle (spawnVehicle option 2) and closes the menu. | 910 |
| `career_modules_partShopping.getCategoryBreadcrumbTitle(category)` | Breadcrumb title for the category route: "cargo parts" for category == "cargo", otherwise "all parts". | 1000 |
| `career_modules_partShopping.getPartsInShop()` | Returns the list of offered parts (partsInShop). | 1020 |
| `career_modules_partShopping.getShoppingCart()` | Returns the cart {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}. | 1024 |
| `career_modules_partShopping.getSlotBreadcrumbTitle(slotPath)` | Breadcrumb title for the slot route: readable name of the last segment of the path. | 1010 |
| `career_modules_partShopping.installPart(part)` | Adds a part to the cart (no effect outside a session), automatically fills empty sub-slots with inventory or default parts, updates the preview and emits onPartShoppingPartInstalled. | 855 |
| `career_modules_partShopping.installPartByPartShopId(partShopId)` | Installs the shop part identified by its partShopId. | 870 |
| `career_modules_partShopping.isShoppingSessionActive()` | Indicates whether a shopping session is active. | 994 |
| `career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions)` | Computer hook: adds the "part customization" function (order 1) for each garage vehicle, disabled if the vehicle needs repair, if the starter vehicle is not bought or if career_modules_permissions denies partBuying/vehicleModification. *(internal)* *(hook)* | 1028 |
| `career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data)` | UI router lifecycle: remembers the selection (category, slot, panel) inferred from the route. *(internal)* *(hook)* | 445 |
| `career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data)` | UI router lifecycle: renormalizes the selection then sends the shop data. *(internal)* *(hook)* | 451 |
| `career_modules_partShopping.onVehicleSaveFinished()` | Hook: once the vehicle save is finished after a purchase, closes the menu if closing was deferred. *(internal)* *(hook)* | 922 |
| `career_modules_partShopping.removePartBySlot(slot)` | Removes from the cart the part of the given slot (restores the original part if it still fits the slot). | 879 |
| `career_modules_partShopping.requestExit()` | Asks the UI to leave the screen (guihooks partShoppingRequestExit). | 918 |
| `career_modules_partShopping.sendShoppingDataToUI()` | Regenerates the shop and sends to the UI (guihooks partShoppingData): parts, slot tree, cart, names, search list, parts filtered by route, slot -> installed part map and the player's money. | 414 |
| `career_modules_partShopping.setupTether()` | Creates the capsule tether between the computer and the vehicle; when it is crossed, cancelShopping is called. | 516 |
| `career_modules_partShopping.startShopping(inventoryId, _originComputerId)` | Starts a session for a vehicle (the given one, the current one, otherwise the nearest garage one). First repairs via insurance if the vehicle is damaged, then prepares the cart, generates the shop, sets the tether, opens the screen and freezes the vehicle. | 531 |
| `career_modules_partShopping.updatePreviewVehicle(currentPartConditions)` | Callback called by the vehicle with its part conditions after the preview respawn: copies the parts tree, updates the cart, sends the data back to the UI and refreezes the vehicle. *(internal)* | 456 |

### Parameter details

#### `career_modules_partShopping.getCategoryBreadcrumbTitle(category)`

Breadcrumb title for the category route: "cargo parts" for category == "cargo", otherwise "all parts".

- `category` (*string*) : Route parameter category.
- **returns**: string Translated title.

#### `career_modules_partShopping.getPartsInShop()`

Returns the list of offered parts (partsInShop).

- **returns**: table[] Shop parts.

#### `career_modules_partShopping.getShoppingCart()`

Returns the cart {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}.

- **returns**: table Cart.

#### `career_modules_partShopping.getSlotBreadcrumbTitle(slotPath)`

Breadcrumb title for the slot route: readable name of the last segment of the path.

- `slotPath` (*string*) : Route parameter slotPath.
- **returns**: string|nil Slot name, nil if unknown.

#### `career_modules_partShopping.installPart(part)`

Adds a part to the cart (no effect outside a session), automatically fills empty sub-slots with inventory or default parts, updates the preview and emits onPartShoppingPartInstalled.

- `part` (*table*) : Shop part (containingSlot, name, partPath, finalValue...).

#### `career_modules_partShopping.installPartByPartShopId(partShopId)`

Installs the shop part identified by its partShopId.

- `partShopId` (*integer*) : Part identifier in partsInShop.

#### `career_modules_partShopping.isShoppingSessionActive()`

Indicates whether a shopping session is active.

- **returns**: boolean true if active.

#### `career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions)`

Computer hook: adds the "part customization" function (order 1) for each garage vehicle, disabled if the vehicle needs repair, if the starter vehicle is not bought or if career_modules_permissions denies partBuying/vehicleModification.

- `menuData` (*table*) : Menu data (computerFacility, vehiclesInGarage...).
- `computerFunctions` (*table*) : Functions to fill (vehicleSpecific[inventoryId]).

#### `career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data)`

UI router lifecycle: remembers the selection (category, slot, panel) inferred from the route.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Target route (name, params).
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data)`

UI router lifecycle: renormalizes the selection then sends the shop data.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_partShopping.removePartBySlot(slot)`

Removes from the cart the part of the given slot (restores the original part if it still fits the slot).

- `slot` (*string*) : Slot path (containingSlot).

#### `career_modules_partShopping.startShopping(inventoryId, _originComputerId)`

Starts a session for a vehicle (the given one, the current one, otherwise the nearest garage one). First repairs via insurance if the vehicle is damaged, then prepares the cart, generates the shop, sets the tether, opens the screen and freezes the vehicle.

- `inventoryId` (*integer|nil*) : Inventory id of the vehicle.
- `_originComputerId` (*string|nil*) : Id of the originating computer (used for returning and for the tether).

#### `career_modules_partShopping.updatePreviewVehicle(currentPartConditions)`

Callback called by the vehicle with its part conditions after the preview respawn: copies the parts tree, updates the cart, sends the data back to the UI and refreezes the vehicle.

- `currentPartConditions` (*table|nil*) : Part conditions read from the vehicle.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, gameplay_achievement. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPartShoppingCancelled` — listened to by 1 module(s)
- `onPartShoppingPartInstalled`
- `onPartShoppingStarted` — listened to by 2 module(s)
- `onPartShoppingTransactionComplete` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `partShoppingData`, `partShoppingRequestExit`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/partShopping.lua`.*
