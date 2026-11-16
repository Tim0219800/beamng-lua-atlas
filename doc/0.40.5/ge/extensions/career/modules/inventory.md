# `career_modules_inventory`

*File: `lua/ge/extensions/career/modules/inventory.lua` · VM: Game Engine (GE) · 1448 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_inventory`: `extensions.load("career_modules_inventory")`, then the global `career_modules_inventory`

Career vehicle inventory: the vehicles table (inventoryId -> info: model, config, niceName, owned, partConditions, timeToAccess, loanType, owningOrganization...), the mapping inventoryId <-> vehicle object id in the world, the current, last and favorite vehicle. It handles adding and removing vehicles, their spawning/entering (spawnVehicle, enterVehicle), saving (one JSON file and one thumbnail per vehicle in career/vehicles/ plus career/inventory.json), the garage computer's "My vehicles" menu, selling, license plates, permissions and big map POIs.

## Example

```lua
local invId = career_modules_inventory.getCurrentVehicle()
local info = career_modules_inventory.getVehicle(invId)
print(info.niceName, info.owned)
```

## Notes

- The inventory has 20 slots (slotAmount); only owned vehicles without takesNoInventorySpace take up a slot.
- inventoryId = smallest free integer starting from 1. An added vehicle gets the fields configBaseValue, finalBuyingPrice, defaultThumbnail and plate (config.licenseName).
- The first vehicle added becomes the favorite. Owning 3 vehicles unlocks the GARAGE_STARTER achievement.
- On adding, the part conditions are initialized on the vehicle side then read; the onVehicleAdded(inventoryId) hook is emitted when they are up to date (note: onVehicleAdded is therefore not immediate).
- Emitted hooks: onInventoryPreRemoveVehicleObject(inventoryId, vehId), onVehicleRemoved(inventoryId), onEnterVehicleFinished(inventoryId), onBeforeVehicleSell({inventoryId, price}), onVehicleSaveFinished(savePath).
- Loading (onExtensionLoaded) ignores saves of version < 42; if the version is < 64, all vehicles are sold (or loaners returned, or deleted) on career activation.
- timeToAccess (s) delays access to a vehicle (purchase, repair); it decreases in real time in onUpdate, including while the game is closed (reduced by the time elapsed since the save).
- A non-owned vehicle (owned = false) is forbidden from sale, repair, painting, tuning, parts purchase, plate, storage, favorite, towing to garage; returnLoanedVehicle is allowed only for these vehicles (hidden for owned ones).
- getInventoryIdsInClosestGarage(true) returns next(...) of the set of garage vehicles, so any vehicle and not necessarily the nearest (the distance sort is only applied to the full list).
- setLicensePlateText tests `if inventoryId` instead of `if vehId`: if the vehicle is not in the world (vehId nil), core_vehicles.setPlateText is called with nil.
- saveAnyVehiclePosDEBUG is true: the positions of all vehicles are always restored as saved.

**Dependencies (loaded first):** `career_career`, `career_modules_log`, `gameplay_tutorial_setup`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_inventory.addVehicle(vehId, inventoryId, options)` | Adds a world vehicle to the inventory: records model, config, name, plate, base value (configBaseValue), initializes the part conditions, assigns a free inventoryId if absent, sets the favorite if it is the first and unlocks GARAGE_STARTER at 3 owned vehicles. | 299 |
| `career_modules_inventory.applyPartConditions(inventoryId, vehId)` | Reapplies the saved part conditions to the in-game vehicle (initPartConditions). | 428 |
| `career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh)` | Runs the callback of the choice button with index buttonIndex for the given vehicle. | 1111 |
| `career_modules_inventory.closeMenu()` | Closes all career menus. | 1032 |
| `career_modules_inventory.debugRespawnCurrentVehicle()` | Debug: updates the current vehicle's part conditions then respawns it (replaceOption 2). | 1370 |
| `career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason)` | Makes a vehicle inaccessible for `delay` seconds (timeToAccess) with a reason (bought, repair). Ignored if delay <= 0. | 1193 |
| `career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback)` | Makes the player enter an inventory vehicle (nil = go on foot). No effect if the vehicle is inaccessible (timeToAccess). First updates the part conditions of the spawned vehicles, except loadOption 1. | 538 |
| `career_modules_inventory.expediteRepairFromInventory(inventoryId, price)` | Speeds up a paid insurance repair (insurance.expediteRepair), saves and refreshes the UI. | 1187 |
| `career_modules_inventory.getClosestGarage(pos)` | Returns the garage whose first zone is nearest to pos (player position by default) in the current level. | 36 |
| `career_modules_inventory.getCurrentVehicle()` | Inventory id of the vehicle the player is driving (nil on foot). Listed in the "Debug" functions of the file. | 674 |
| `career_modules_inventory.getCurrentVehicleId()` | Object id (world) of the current inventory vehicle. | 698 |
| `career_modules_inventory.getDirtiedVehicles()` | Returns the set of inventoryIds modified since the last save. | 1343 |
| `career_modules_inventory.getFavoriteVehicle()` | Returns the inventory id of the favorite vehicle. | 1214 |
| `career_modules_inventory.getInventoryIdFromVehicleId(vehId)` | Converts a world object id to an inventory id (nil if the vehicle is not in the inventory). | 688 |
| `career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst)` | Lists the inventory vehicles present in the nearest garage (intersected zone), sorted by distance to the player. With onlyFirst, returns a single id (the first found by next, see notes). | 973 |
| `career_modules_inventory.getLastVehicle()` | Inventory id of the last vehicle the player entered. | 678 |
| `career_modules_inventory.getMapInventoryIdToVehId()` | Returns the table inventoryId -> object id for the vehicles present in the world (by reference). | 694 |
| `career_modules_inventory.getNumberOfFreeSlots()` | Number of free slots (20 minus the owned vehicles that take up space). | 286 |
| `career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId)` | Records the part conditions received from the vehicle (ignored with a warning if it is not a table), finalizes a pending add (onVehicleAdded hook) and synchronizes the parts inventory. *(internal)* | 395 |
| `career_modules_inventory.getVehicle(inventoryId)` | Returns the info of an inventory vehicle. | 1152 |
| `career_modules_inventory.getVehicleIdFromInventoryId(inventoryId)` | Converts an inventory id to a world object id (nil if not spawned). | 682 |
| `career_modules_inventory.getVehicleNiceNameTranslated(inventoryId)` | Translated display name of the vehicle. | 833 |
| `career_modules_inventory.getVehicleThumbnail(inventoryId)` | Path of the vehicle thumbnail: save file if a capture exists, otherwise the default preview of its configuration. | 760 |
| `career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage)` | Prepares a vehicle's data for the UI: value (and repaired value), express repair price, distance, presence in garage/storage, need for repair, favorite, insurance, permissions (repair, sale, favorite, storage, plate, loan return), listing for sale and performance data. | 839 |
| `career_modules_inventory.getVehicles()` | Returns the complete inventory vehicles table (by reference). | 1148 |
| `career_modules_inventory.hasFreeSlot()` | Indicates whether at least one slot is free. | 294 |
| `career_modules_inventory.isEmpty()` | Indicates whether the inventory contains no vehicle. | 1347 |
| `career_modules_inventory.isLicensePlateValid(text)` | Validates a plate text via core_vehicles.isLicensePlateValid. | 1351 |
| `career_modules_inventory.isSeatedInsideOwnedVehicle()` | Indicates whether the player is in an inventory vehicle (currentVehicle set), owned or not. | 702 |
| `career_modules_inventory.isVehicleNameValid(text)` | Validates a vehicle name: non-empty and without quote, backslash or control character (\b \f \n \r \t). | 1355 |
| `career_modules_inventory.onAvailableMissionsSentToUi()` | Hook: updates the current vehicle's part conditions and sends to the UI whether it needs repair (gameContextPlayerVehicleDamageInfo). *(internal)* *(hook)* | 1200 |
| `career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId)` | Hook: leaving the vehicle (walking mode) enters "no vehicle"; getting into an inventory vehicle records it as current. *(internal)* *(hook)* | 964 |
| `career_modules_inventory.onBigMapActivated()` | Hook: when the big map opens, creates a 'beforeReset' part conditions snapshot for the current vehicle. *(internal)* *(hook)* | 662 |
| `career_modules_inventory.onCareerActive(active)` | Hook: sells the vehicles if the save is too old, then prepares the inventory (vehicles respawning, entering the current vehicle, starting equipment for a new career). *(internal)* *(hook)* | 636 |
| `career_modules_inventory.onCheckPermission(tags, permissions, additionalData)` | Permissions hook: for non-owned vehicles, forbids sale, repair, mission, painting, parts purchase, plate, tuning, storage, parts swap, towing to garage and favorite; also forbids repairing/selling an inaccessible vehicle, favoriting the favorite or a missing file, storing a vehicle absent from the world. *(internal)* *(hook)* | 1270 |
| `career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions)` | Computer hook: adds the "My vehicles" function (order 1), disabled until the starter vehicle is bought. *(internal)* *(hook)* | 1218 |
| `career_modules_inventory.onEnterVehicleFinished(inventoryId)` | Hook: stores the vehicle entered as the last vehicle. *(internal)* *(hook)* | 1142 |
| `career_modules_inventory.onExitVehicleInventory()` | Hook: the inventory screen is closed. *(internal)* *(hook)* | 1137 |
| `career_modules_inventory.onExtensionLoaded()` | Hook: if career is active, loads the files of career/vehicles/ and inventory.json (current vehicle, last, favorite, positions, on-foot position); decrements timeToAccess by the time elapsed since the save. *(internal)* *(hook)* | 54 |
| `career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI list hook: adds a big map marker for each inventory vehicle present in the world (other than the player's), with description (distance, plate, odometer) and thumbnail. *(internal)* *(hook)* | 1299 |
| `career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | Save hook: writes inventory.json, updates the part conditions, then writes each vehicle (JSON + thumbnail if requested) and deletes the files of vehicles that no longer exist; at the end, emits onVehicleSaveFinished. *(internal)* *(hook)* | 247 |
| `career_modules_inventory.onSaveCurrentProfileAsyncStart()` | Hook: registers the inventory as an asynchronous save extension (career_saveSystem.registerAsyncSaveExtension). *(internal)* *(hook)* | 177 |
| `career_modules_inventory.onScreenFadeState(state)` | Hook: when the screen fade is complete (state 1), removes the marked vehicles then runs the deferred action (vehicle spawn). *(internal)* *(hook)* | 1001 |
| `career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: initial save of a new career (after 10 frames), toasts for a vehicle put into storage or a loan returned, timeToAccess countdown with delivery/repair messages. *(internal)* *(hook)* | 923 |
| `career_modules_inventory.openInventoryMenuForChoosingListing()` | Opens the inventory to choose a vehicle to put up for sale (addListing action on the UI side), all other actions disabled. | 1115 |
| `career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget)` | Opens the inventory screen (career.computer.vehicleInventory) with configurable choice buttons and updates the part conditions of the spawned vehicles. | 1009 |
| `career_modules_inventory.openMenuFromComputer(_originComputerId)` | Opens the inventory from the garage computer with three buttons: retrieve at the garage, replace the current vehicle, open the performance index. | 1082 |
| `career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money)` | Buys a plate change: pays, applies the text, unlocks NOW_ITS_MINE, plays the sound and marks the vehicle as modified. Does nothing if the player cannot pay. | 1243 |
| `career_modules_inventory.removeVehicle(inventoryId)` | Removes the vehicle from the inventory and the world, emits onVehicleRemoved and reassigns the favorite if needed. | 378 |
| `career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions)` | Removes only the vehicle object from the world (the vehicle stays in the inventory, in storage); puts the player in walking mode if they were driving it. Emits onInventoryPreRemoveVehicleObject. | 360 |
| `career_modules_inventory.renameVehicle(inventoryId, name)` | Renames the vehicle (niceName) if valid and marks it as modified. | 1360 |
| `career_modules_inventory.requestPickerExit()` | Leaves the selector: navigates to the return route (career.computer by default). | 1036 |
| `career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId)` | Returns a loaned vehicle (career_modules_loanerVehicles.returnVehicle) then saves and refreshes the UI. | 1180 |
| `career_modules_inventory.sellVehicle(inventoryId, price)` | Sells a vehicle: emits onBeforeVehicleSell, credits the price (or the value computed by valueCalculator), removes the vehicle, plays the purchase sound, unlocks FLIP_PROFIT if resold above the final purchase price, and logs. | 1156 |
| `career_modules_inventory.sellVehicleFromInventory(inventoryId)` | Sells from the inventory screen: sells, saves the career and sends the data back to the UI. | 1173 |
| `career_modules_inventory.sendDataToUi()` | Sends to the UI (guihooks vehicleInventoryData) all the vehicles, the choice buttons, the header, the number of free slots and the player's money. | 903 |
| `career_modules_inventory.setFavoriteVehicle(inventoryId)` | Sets the favorite vehicle (ignored if the id is unknown). | 1208 |
| `career_modules_inventory.setLicensePlateText(inventoryId, text)` | Changes the vehicle's plate text in the world and in its config. | 1235 |
| `career_modules_inventory.setVehicleDirty(inventoryId)` | Marks a vehicle as modified: it will be rewritten (with a new dirtyDate) at the next save. | 146 |
| `career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback)` | Spawns an inventory vehicle from its config (flattened parts list), restores its part conditions and reconciles the parts inventory. Returns nil if the model or the config file no longer exists. | 436 |
| `career_modules_inventory.teleportedFromBigmap()` | Called after a teleport from the big map: saves the career if the player is in an inventory vehicle and if autosave is active. | 668 |
| `career_modules_inventory.updatePartConditions(vehId, inventoryId, callback)` | Asks the vehicle for its part conditions (getPartConditions) and stores them in the inventory then in the parts inventory. | 406 |
| `career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback)` | Marks all spawned vehicles as modified and updates their part conditions; callback is called when all are processed (or immediately if there are none). | 150 |

### Parameter details

#### `career_modules_inventory.addVehicle(vehId, inventoryId, options)`

Adds a world vehicle to the inventory: records model, config, name, plate, base value (configBaseValue), initializes the part conditions, assigns a free inventoryId if absent, sets the favorite if it is the first and unlocks GARAGE_STARTER at 3 owned vehicles.

- `vehId` (*integer*) : Vehicle object id.
- `inventoryId` (*integer|nil*) : Imposed inventory id, otherwise the first free one.
- `options` (*{owned: boolean|nil, finalPrice: number|nil}|nil*) : owned is true by default; finalPrice is used for the FLIP_PROFIT achievement.
- **returns**: integer|nil inventoryId, nil if the object or its data cannot be found.

#### `career_modules_inventory.applyPartConditions(inventoryId, vehId)`

Reapplies the saved part conditions to the in-game vehicle (initPartConditions).

- `inventoryId` (*integer*) : Inventory id.
- `vehId` (*integer|nil*) : Object id; otherwise deduced from the inventory.

#### `career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh)`

Runs the callback of the choice button with index buttonIndex for the given vehicle.

- `inventoryId` (*integer*) : Chosen inventory id.
- `buttonIndex` (*integer*) : Button index (starting at 1).
- `repairPrevVeh` (*any*) : Passed to the callback.

#### `career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason)`

Makes a vehicle inaccessible for `delay` seconds (timeToAccess) with a reason (bought, repair). Ignored if delay <= 0.

- `inventoryId` (*integer*) : Inventory id.
- `delay` (*number*) : Duration in seconds.
- `reason` (*string*) : Reason ("bought" or "repair" produce a message at the end).

#### `career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback)`

Makes the player enter an inventory vehicle (nil = go on foot). No effect if the vehicle is inaccessible (timeToAccess). First updates the part conditions of the spawned vehicles, except loadOption 1.

- `newInventoryId` (*integer|nil*) : Inventory id.
- `loadOption` (*integer|nil*) : 1: do not reload the vehicle; 2: force reload; nil: enter the existing object or spawn it.
- `callback` (*function|nil*) : Called after entering.

#### `career_modules_inventory.expediteRepairFromInventory(inventoryId, price)`

Speeds up a paid insurance repair (insurance.expediteRepair), saves and refreshes the UI.

- `inventoryId` (*integer*) : Inventory id.
- `price` (*number*) : Price of the speed-up.

#### `career_modules_inventory.getClosestGarage(pos)`

Returns the garage whose first zone is nearest to pos (player position by default) in the current level.

- `pos` (*vec3|nil*) : Reference position.
- **returns**: table|nil Garage facility.

#### `career_modules_inventory.getCurrentVehicle()`

Inventory id of the vehicle the player is driving (nil on foot). Listed in the "Debug" functions of the file.

- **returns**: integer|nil Current inventoryId.

#### `career_modules_inventory.getCurrentVehicleId()`

Object id (world) of the current inventory vehicle.

- **returns**: integer|nil Vehicle object id.

#### `career_modules_inventory.getDirtiedVehicles()`

Returns the set of inventoryIds modified since the last save.

- **returns**: table<integer, boolean> Set of ids.

#### `career_modules_inventory.getFavoriteVehicle()`

Returns the inventory id of the favorite vehicle.

- **returns**: integer|nil Favorite inventoryId.

#### `career_modules_inventory.getInventoryIdFromVehicleId(vehId)`

Converts a world object id to an inventory id (nil if the vehicle is not in the inventory).

- `vehId` (*integer|nil*) : Vehicle object id.
- **returns**: integer|nil Inventory id.

#### `career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst)`

Lists the inventory vehicles present in the nearest garage (intersected zone), sorted by distance to the player. With onlyFirst, returns a single id (the first found by next, see notes).

- `onlyFirst` (*boolean|nil*) : Return only one id.
- **returns**: integer[]|integer|nil List of ids, or one id if onlyFirst.

#### `career_modules_inventory.getLastVehicle()`

Inventory id of the last vehicle the player entered.

- **returns**: integer|nil inventoryId.

#### `career_modules_inventory.getMapInventoryIdToVehId()`

Returns the table inventoryId -> object id for the vehicles present in the world (by reference).

- **returns**: table<integer, integer> Mapping.

#### `career_modules_inventory.getNumberOfFreeSlots()`

Number of free slots (20 minus the owned vehicles that take up space).

- **returns**: integer Free slots.

#### `career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId)`

Records the part conditions received from the vehicle (ignored with a warning if it is not a table), finalizes a pending add (onVehicleAdded hook) and synchronizes the parts inventory.

- `partConditions` (*table|boolean*) : Conditions, or false if not initialized.
- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.getVehicle(inventoryId)`

Returns the info of an inventory vehicle.

- `inventoryId` (*integer*) : Inventory id.
- **returns**: table|nil Vehicle info.

#### `career_modules_inventory.getVehicleIdFromInventoryId(inventoryId)`

Converts an inventory id to a world object id (nil if not spawned).

- `inventoryId` (*integer|nil*) : Inventory id.
- **returns**: integer|nil Object id.

#### `career_modules_inventory.getVehicleNiceNameTranslated(inventoryId)`

Translated display name of the vehicle.

- `inventoryId` (*integer*) : Inventory id.
- **returns**: string|nil Name.

#### `career_modules_inventory.getVehicleThumbnail(inventoryId)`

Path of the vehicle thumbnail: save file if a capture exists, otherwise the default preview of its configuration.

- `inventoryId` (*integer|nil*) : Inventory id.
- **returns**: string|nil Image path.

#### `career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage)`

Prepares a vehicle's data for the UI: value (and repaired value), express repair price, distance, presence in garage/storage, need for repair, favorite, insurance, permissions (repair, sale, favorite, storage, plate, loan return), listing for sale and performance data.

- `inventoryId` (*integer*) : Inventory id.
- `inventoryIdsInGarage` (*table<integer, boolean>|nil*) : Vehicles of the nearest garage (computed if nil).
- **returns**: table|nil Data for the UI.

#### `career_modules_inventory.getVehicles()`

Returns the complete inventory vehicles table (by reference).

- **returns**: table<integer, table> inventoryId -> vehicle info.

#### `career_modules_inventory.hasFreeSlot()`

Indicates whether at least one slot is free.

- **returns**: boolean true if so.

#### `career_modules_inventory.isEmpty()`

Indicates whether the inventory contains no vehicle.

- **returns**: boolean true if empty.

#### `career_modules_inventory.isLicensePlateValid(text)`

Validates a plate text via core_vehicles.isLicensePlateValid.

- `text` (*string*) : Text.
- **returns**: boolean Validity.

#### `career_modules_inventory.isSeatedInsideOwnedVehicle()`

Indicates whether the player is in an inventory vehicle (currentVehicle set), owned or not.

- **returns**: boolean true if seated in an inventory vehicle.

#### `career_modules_inventory.isVehicleNameValid(text)`

Validates a vehicle name: non-empty and without quote, backslash or control character (\b \f \n \r \t).

- `text` (*string|nil*) : Name.
- **returns**: boolean Validity.

#### `career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId)`

Hook: leaving the vehicle (walking mode) enters "no vehicle"; getting into an inventory vehicle records it as current.

- `enabled` (*boolean*) : true if switching to walking mode.
- `vehicleInFrontVehId` (*integer|nil*) : Id of the vehicle in front of the player.

#### `career_modules_inventory.onCareerActive(active)`

Hook: sells the vehicles if the save is too old, then prepares the inventory (vehicles respawning, entering the current vehicle, starting equipment for a new career).

- `active` (*boolean*) : Nothing if false.

#### `career_modules_inventory.onCheckPermission(tags, permissions, additionalData)`

Permissions hook: for non-owned vehicles, forbids sale, repair, mission, painting, parts purchase, plate, tuning, storage, parts swap, towing to garage and favorite; also forbids repairing/selling an inaccessible vehicle, favoriting the favorite or a missing file, storing a vehicle absent from the world.

- `tags` (*string[]*) : Tags requested.
- `permissions` (*table[]*) : List to complete ({permission}).
- `additionalData` (*{inventoryId: integer}|nil*) : Context (inventoryId).

#### `career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions)`

Computer hook: adds the "My vehicles" function (order 1), disabled until the starter vehicle is bought.

- `menuData` (*table*) : Menu data.
- `computerFunctions` (*table*) : Functions to complete (general).

#### `career_modules_inventory.onEnterVehicleFinished(inventoryId)`

Hook: stores the vehicle entered as the last vehicle.

- `inventoryId` (*integer|nil*) : Inventory id.

#### `career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI list hook: adds a big map marker for each inventory vehicle present in the world (other than the player's), with description (distance, plate, odometer) and thumbnail.

- `levelIdentifier` (*string*) : Level (unused).
- `elements` (*table[]*) : POI list to complete.

#### `career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)`

Save hook: writes inventory.json, updates the part conditions, then writes each vehicle (JSON + thumbnail if requested) and deletes the files of vehicles that no longer exist; at the end, emits onVehicleSaveFinished.

- `currentSavePath` (*string*) : Save folder.
- `vehiclesThumbnailUpdate` (*integer[]|nil*) : Ids of the vehicles whose thumbnail must be redone.

#### `career_modules_inventory.onScreenFadeState(state)`

Hook: when the screen fade is complete (state 1), removes the marked vehicles then runs the deferred action (vehicle spawn).

- `state` (*integer*) : Fade state.

#### `career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: initial save of a new career (after 10 frames), toasts for a vehicle put into storage or a loan returned, timeToAccess countdown with delivery/repair messages.

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulated time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget)`

Opens the inventory screen (career.computer.vehicleInventory) with configurable choice buttons and updates the part conditions of the spawned vehicles.

- `_chooseButtonsData` (*table[]|nil*) : Buttons {callback, buttonText, repairRequired, insuranceRequired, ownedRequired...}.
- `header` (*string|nil*) : Menu title.
- `_buttonsActive` (*table|nil*) : repairEnabled, sellEnabled, favoriteEnabled, storingEnabled, returnLoanerEnabled (true by default).
- `_backTarget` (*string|nil*) : Return route.

#### `career_modules_inventory.openMenuFromComputer(_originComputerId)`

Opens the inventory from the garage computer with three buttons: retrieve at the garage, replace the current vehicle, open the performance index.

- `_originComputerId` (*string*) : Originating computer id.

#### `career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money)`

Buys a plate change: pays, applies the text, unlocks NOW_ITS_MINE, plays the sound and marks the vehicle as modified. Does nothing if the player cannot pay.

- `inventoryId` (*integer*) : Inventory id.
- `text` (*string*) : Plate text.
- `money` (*number*) : Price.

#### `career_modules_inventory.removeVehicle(inventoryId)`

Removes the vehicle from the inventory and the world, emits onVehicleRemoved and reassigns the favorite if needed.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions)`

Removes only the vehicle object from the world (the vehicle stays in the inventory, in storage); puts the player in walking mode if they were driving it. Emits onInventoryPreRemoveVehicleObject.

- `inventoryId` (*integer*) : Inventory id.
- `skipPartConditions` (*boolean|nil*) : Not used in the body (remains a TODO).

#### `career_modules_inventory.renameVehicle(inventoryId, name)`

Renames the vehicle (niceName) if valid and marks it as modified.

- `inventoryId` (*integer*) : Inventory id.
- `name` (*string*) : New name.
- **returns**: boolean false if the name is invalid.

#### `career_modules_inventory.requestPickerExit()`

Leaves the selector: navigates to the return route (career.computer by default).

- **returns**: any Result of ui_router.navigate.

#### `career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId)`

Returns a loaned vehicle (career_modules_loanerVehicles.returnVehicle) then saves and refreshes the UI.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.sellVehicle(inventoryId, price)`

Sells a vehicle: emits onBeforeVehicleSell, credits the price (or the value computed by valueCalculator), removes the vehicle, plays the purchase sound, unlocks FLIP_PROFIT if resold above the final purchase price, and logs.

- `inventoryId` (*integer*) : Inventory id.
- `price` (*number|nil*) : Imposed price (otherwise computed value).
- **returns**: boolean|nil true if sold, nil if the vehicle does not exist.

#### `career_modules_inventory.sellVehicleFromInventory(inventoryId)`

Sells from the inventory screen: sells, saves the career and sends the data back to the UI.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.setFavoriteVehicle(inventoryId)`

Sets the favorite vehicle (ignored if the id is unknown).

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.setLicensePlateText(inventoryId, text)`

Changes the vehicle's plate text in the world and in its config.

- `inventoryId` (*integer*) : Inventory id.
- `text` (*string*) : Plate text.

#### `career_modules_inventory.setVehicleDirty(inventoryId)`

Marks a vehicle as modified: it will be rewritten (with a new dirtyDate) at the next save.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback)`

Spawns an inventory vehicle from its config (flattened parts list), restores its part conditions and reconciles the parts inventory. Returns nil if the model or the config file no longer exists.

- `inventoryId` (*integer*) : Inventory id.
- `replaceOption` (*integer|nil*) : 1: replaces the player's current vehicle; 2: replaces the object with the same inventoryId; other: new vehicle without entering it.
- `callback` (*function|nil*) : Called when the part conditions are synchronized.
- **returns**: userdata|nil Vehicle object created.

#### `career_modules_inventory.updatePartConditions(vehId, inventoryId, callback)`

Asks the vehicle for its part conditions (getPartConditions) and stores them in the inventory then in the parts inventory.

- `vehId` (*integer|nil*) : Object id; otherwise deduced from inventoryId.
- `inventoryId` (*integer*) : Inventory id.
- `callback` (*function|nil*) : Called once the value is received.

#### `career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback)`

Marks all spawned vehicles as modified and updates their part conditions; callback is called when all are processed (or immediately if there are none).

- `callback` (*function|nil*) : Called at the end.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, career_modules_log, gameplay_tutorial_setup. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeVehicleSell` — listened to by 1 module(s)
- `onEnterVehicleFinished` — listened to by 4 module(s)
- `onInventoryPreRemoveVehicleObject` — listened to by 1 module(s)
- `onVehicleAdded` — listened to by 2 module(s)
- `onVehicleRemoved` — listened to by 3 module(s)
- `onVehicleSaveFinished` — listened to by 8 module(s)

**UI events (guihooks.trigger):** `addListing`, `gameContextPlayerVehicleDamageInfo`, `saveFinished`, `toastrMsg`, `vehicleInventoryData`

## Calls into the engine (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`
- `be:` `enterVehicle`, `getPlayerVehicleID`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/inventory.lua`.*
