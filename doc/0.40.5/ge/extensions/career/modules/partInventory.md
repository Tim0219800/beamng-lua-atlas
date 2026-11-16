# `career_modules_partInventory`

*File: `lua/ge/extensions/career/modules/partInventory.lua` · VM: Game Engine (GE) · 595 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_partInventory`: `extensions.load("career_modules_partInventory")`, then the global `career_modules_partInventory`

Career parts inventory. Each part (installed on an inventory vehicle or in storage, location = 0) is an entry of the partInventory table keyed by an integer partId. The module generates a vehicle's parts from its parts tree (partsTree), reconciles them with the actual vehicle after modification, sells stored parts, feeds the "My parts" screen of the garage computer and saves everything to career/partInventory.json (serialized).

## Example

```lua
local inv = career_modules_partInventory.getInventory()
local id = career_modules_partInventory.getPartPathToPartIdMap()[inventoryId]["/main/".."partName"]
local part = inv[id]
```

## Notes

- Part fields: name, value (100 by default), description (JBeam info, not saved), partCondition, tags, vehicleModel, location (0 = storage, otherwise the vehicle's inventoryId), containingSlot (slot path), partPath (= containingSlot .. name), mainPart (slot "/"), and depending on the case year, repairCount, primered.
- slotToPartIdMap: location -> containingSlot -> partId. partPathToPartIdMap: inventoryId -> partPath -> partId (only for location > 0). These tables are rebuilt by updateVehicleMaps (asynchronously in onUpdate after a vehicle change).
- When a vehicle is added (onVehicleAdded), its parts are added in onUpdate as soon as the vehicle is present and partConditions exists; the onAddedVehiclePartsToInventory(inventoryId, newParts) hook is then emitted.
- An auxiliary part (description.isAuxiliary) with value 0 is hidden from the UI and removed from storage.
- If the save version is lower than that of the save system, all parts in storage are sold on load. If the save is older than version 42, the inventory is empty.
- sellParts silently gives up (selling nothing) if one of the ids is unknown or not in storage; the sale yields the sum of career_modules_valueCalculator.getPartValue, with tags partsSold and selling.
- debugMenu (ImGui window) is defined but its call is commented out.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_partInventory.addPartToInventory(part)` | Adds a part under the smallest free partId (starting from 1). | 121 |
| `career_modules_partInventory.closeMenu()` | Closes the screen: if autosave is active and vehicles are modified, saves them first (closing happens in onSaveFinished), otherwise returns directly to the computer or closes the menus. | 508 |
| `career_modules_partInventory.getInventory()` | Returns the table of all parts (partId -> part), by reference. | 548 |
| `career_modules_partInventory.getPart(inventoryId, path)` | Looks up the part installed in a slot of a vehicle. | 467 |
| `career_modules_partInventory.getPartPathToPartIdMap()` | Returns the table inventoryId -> partPath -> partId (vehicles only). | 544 |
| `career_modules_partInventory.getSlotToPartIdMap()` | Returns the table location -> containingSlot -> partId. | 540 |
| `career_modules_partInventory.isHiddenInUI(part)` | Indicates whether the part must be hidden in the UI: auxiliary (description.isAuxiliary) and of zero value. | 129 |
| `career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions)` | Computer hook: adds the "My parts" function (order 5), disabled while the starter vehicle is not bought. *(internal)* *(hook)* | 552 |
| `career_modules_partInventory.onEnterVehicleFinished(currentVehicle)` | Hook: schedules the update of the index tables when entering a vehicle. *(internal)* *(hook)* | 438 |
| `career_modules_partInventory.onExtensionLoaded()` | Hook: loads partInventory.json (deserialized), sells parts in storage if the save is of an older version, reloads the JBeam descriptions, removes hidden parts in storage and rebuilds the index tables. *(internal)* *(hook)* | 399 |
| `career_modules_partInventory.onPartShoppingTransactionComplete()` | Hook: after a parts purchase, removes hidden parts in storage and rebuilds the indexes. *(internal)* *(hook)* | 445 |
| `career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data)` | UI router lifecycle: sends the inventory data once the view is mounted if the menu is open. *(internal)* *(hook)* | 493 |
| `career_modules_partInventory.onSaveFinished()` | End-of-save hook: closes the menu if closeMenu was waiting for it. *(internal)* *(hook)* | 529 |
| `career_modules_partInventory.onUpdate()` | Frame hook: adds the parts of a newly added vehicle and updates the index tables after a vehicle change, as soon as partConditions is available. *(internal)* *(hook)* | 282 |
| `career_modules_partInventory.onVehicleAdded(inventoryId)` | Hook: remembers the vehicle whose parts must be added in onUpdate. *(internal)* *(hook)* | 450 |
| `career_modules_partInventory.onVehicleRemoved(inventoryId)` | Hook: removes all parts located on the removed vehicle. *(internal)* *(hook)* | 454 |
| `career_modules_partInventory.onVehicleSaveFinished(currentSavePath)` | Save hook: writes partInventory.json to <save>/career/ (without the description field, via serialize). *(internal)* *(hook)* | 355 |
| `career_modules_partInventory.openMenu(_originComputerId)` | Opens the parts screen: picks the current vehicle or the nearest garage one, updates its part conditions then navigates to career.computer.partInventory. | 476 |
| `career_modules_partInventory.partInventoryClosed()` | Notifies that the inventory UI is closed (partInventoryOpen = false). | 536 |
| `career_modules_partInventory.requestExit()` | Entry point of the UI router back button: calls closeMenu to keep the autosave behavior. | 525 |
| `career_modules_partInventory.sellParts(partIds)` | Sells parts in storage: credits the sum of their values, plays the purchase sound, deletes them and refreshes the UI if the menu is open. | 24 |
| `career_modules_partInventory.sendUIData()` | Sends to the UI (guihooks partInventoryData) the list of visible parts (excluding main parts), their final value, their accessibility (not installed on a vehicle) and the vehicle data. | 316 |
| `career_modules_partInventory.updatePartConditionsInInventory()` | Copies into each part the condition (partCondition) known by the vehicle containing it. | 110 |
| `career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId)` | Re-reads the parts of the currently present vehicle and reconciles them with the inventory: updates vehicle.config, keeps condition, tags, year, repairCount and primered of existing parts (same slot), adds new ones (default condition integrity 1, odometer 0, visual 1) and removes those that disappeared. Marks the vehicle as modified. | 152 |

### Parameter details

#### `career_modules_partInventory.addPartToInventory(part)`

Adds a part under the smallest free partId (starting from 1).

- `part` (*table*) : Part to add.

#### `career_modules_partInventory.getInventory()`

Returns the table of all parts (partId -> part), by reference.

- **returns**: table<integer, table> Parts inventory.

#### `career_modules_partInventory.getPart(inventoryId, path)`

Looks up the part installed in a slot of a vehicle.

- `inventoryId` (*integer*) : Vehicle inventory id (location).
- `path` (*string*) : Slot path (containingSlot).
- **returns**: table|nil The part.

#### `career_modules_partInventory.getPartPathToPartIdMap()`

Returns the table inventoryId -> partPath -> partId (vehicles only).

- **returns**: table Part path table.

#### `career_modules_partInventory.getSlotToPartIdMap()`

Returns the table location -> containingSlot -> partId.

- **returns**: table Slot table.

#### `career_modules_partInventory.isHiddenInUI(part)`

Indicates whether the part must be hidden in the UI: auxiliary (description.isAuxiliary) and of zero value.

- `part` (*table*) : Part.
- **returns**: boolean|nil true if hidden.

#### `career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions)`

Computer hook: adds the "My parts" function (order 5), disabled while the starter vehicle is not bought.

- `menuData` (*table*) : Menu data.
- `computerFunctions` (*table*) : Functions to complete (general).

#### `career_modules_partInventory.onEnterVehicleFinished(currentVehicle)`

Hook: schedules the update of the index tables when entering a vehicle.

- `currentVehicle` (*integer|nil*) : Inventory id of the current vehicle.

#### `career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data)`

UI router lifecycle: sends the inventory data once the view is mounted if the menu is open.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_partInventory.onVehicleAdded(inventoryId)`

Hook: remembers the vehicle whose parts must be added in onUpdate.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_partInventory.onVehicleRemoved(inventoryId)`

Hook: removes all parts located on the removed vehicle.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_partInventory.onVehicleSaveFinished(currentSavePath)`

Save hook: writes partInventory.json to <save>/career/ (without the description field, via serialize).

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_partInventory.openMenu(_originComputerId)`

Opens the parts screen: picks the current vehicle or the nearest garage one, updates its part conditions then navigates to career.computer.partInventory.

- `_originComputerId` (*string|nil*) : Originating computer id.

#### `career_modules_partInventory.sellParts(partIds)`

Sells parts in storage: credits the sum of their values, plays the purchase sound, deletes them and refreshes the UI if the menu is open.

- `partIds` (*integer[]*) : Ids of the parts to sell (location 0 required).

#### `career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId)`

Re-reads the parts of the currently present vehicle and reconciles them with the inventory: updates vehicle.config, keeps condition, tags, year, repairCount and primered of existing parts (same slot), adds new ones (default condition integrity 1, odometer 0, visual 1) and removes those that disappeared. Marks the vehicle as modified.

- `inventoryId` (*integer*) : Inventory id of the vehicle.
- **returns**: {added: table[], removed: table[], changed: {old: table, new: table}[]} Detected differences.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAddedVehiclePartsToInventory` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `partInventoryData`

## Calls into the engine (C++)

- `FS:` `directoryExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/partInventory.lua`.*
