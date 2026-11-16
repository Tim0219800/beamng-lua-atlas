---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career vehicle inventory: the vehicles table (inventoryId -> info: model, config, niceName, owned, partConditions, timeToAccess, loanType, owningOrganization...), the mapping inventoryId <-> vehicle object id in the world, the current, last and favorite vehicle. It handles adding and removing vehicles, their spawning/entering (spawnVehicle, enterVehicle), saving (one JSON file and one thumbnail per vehicle in career/vehicles/ plus career/inventory.json), the garage computer's "My vehicles" menu, selling, license plates, permissions and big map POIs.
--- Access: extension `career_modules_inventory`: `extensions.load("career_modules_inventory")`, then the global `career_modules_inventory`
---@class career_modules_inventory
---@field dependencies table<integer, string> Extensions loaded before: career_career, career_modules_log, gameplay_tutorial_setup.
career_modules_inventory = {}

--- Adds a world vehicle to the inventory: records model, config, name, plate, base value (configBaseValue), initializes the part conditions, assigns a free inventoryId if absent, sets the favorite if it is the first and unlocks GARAGE_STARTER at 3 owned vehicles.
---Source: lua/ge/extensions/career/modules/inventory.lua:299
---@param vehId integer Vehicle object id.
---@param inventoryId integer|nil Imposed inventory id, otherwise the first free one.
---@param options {owned: boolean|nil, finalPrice: number|nil}|nil owned is true by default; finalPrice is used for the FLIP_PROFIT achievement.
---@return integer|nil  inventoryId, nil if the object or its data cannot be found.
function career_modules_inventory.addVehicle(vehId, inventoryId, options) end

--- Reapplies the saved part conditions to the in-game vehicle (initPartConditions).
---Source: lua/ge/extensions/career/modules/inventory.lua:428
---@param inventoryId integer Inventory id.
---@param vehId integer|nil Object id; otherwise deduced from the inventory.
function career_modules_inventory.applyPartConditions(inventoryId, vehId) end

--- Runs the callback of the choice button with index buttonIndex for the given vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:1111
---@param inventoryId integer Chosen inventory id.
---@param buttonIndex integer Button index (starting at 1).
---@param repairPrevVeh any Passed to the callback.
function career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh) end

--- Closes all career menus.
---Source: lua/ge/extensions/career/modules/inventory.lua:1032
function career_modules_inventory.closeMenu() end

--- Debug: updates the current vehicle's part conditions then respawns it (replaceOption 2).
---Source: lua/ge/extensions/career/modules/inventory.lua:1370
function career_modules_inventory.debugRespawnCurrentVehicle() end

--- Makes a vehicle inaccessible for `delay` seconds (timeToAccess) with a reason (bought, repair). Ignored if delay <= 0.
---Source: lua/ge/extensions/career/modules/inventory.lua:1193
---@param inventoryId integer Inventory id.
---@param delay number Duration in seconds.
---@param reason string Reason ("bought" or "repair" produce a message at the end).
function career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason) end

--- Makes the player enter an inventory vehicle (nil = go on foot). No effect if the vehicle is inaccessible (timeToAccess). First updates the part conditions of the spawned vehicles, except loadOption 1.
---Source: lua/ge/extensions/career/modules/inventory.lua:538
---@param newInventoryId integer|nil Inventory id.
---@param loadOption integer|nil 1: do not reload the vehicle; 2: force reload; nil: enter the existing object or spawn it.
---@param callback function|nil Called after entering.
function career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback) end

--- Speeds up a paid insurance repair (insurance.expediteRepair), saves and refreshes the UI.
---Source: lua/ge/extensions/career/modules/inventory.lua:1187
---@param inventoryId integer Inventory id.
---@param price number Price of the speed-up.
function career_modules_inventory.expediteRepairFromInventory(inventoryId, price) end

--- Returns the garage whose first zone is nearest to pos (player position by default) in the current level.
---Source: lua/ge/extensions/career/modules/inventory.lua:36
---@param pos vec3|nil Reference position.
---@return table|nil  Garage facility.
function career_modules_inventory.getClosestGarage(pos) end

--- Inventory id of the vehicle the player is driving (nil on foot). Listed in the "Debug" functions of the file.
---Source: lua/ge/extensions/career/modules/inventory.lua:674
---@return integer|nil  Current inventoryId.
function career_modules_inventory.getCurrentVehicle() end

--- Object id (world) of the current inventory vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:698
---@return integer|nil  Vehicle object id.
function career_modules_inventory.getCurrentVehicleId() end

--- Returns the set of inventoryIds modified since the last save.
---Source: lua/ge/extensions/career/modules/inventory.lua:1343
---@return table<integer, boolean>  Set of ids.
function career_modules_inventory.getDirtiedVehicles() end

--- Returns the inventory id of the favorite vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:1214
---@return integer|nil  Favorite inventoryId.
function career_modules_inventory.getFavoriteVehicle() end

--- Converts a world object id to an inventory id (nil if the vehicle is not in the inventory).
---Source: lua/ge/extensions/career/modules/inventory.lua:688
---@param vehId integer|nil Vehicle object id.
---@return integer|nil  Inventory id.
function career_modules_inventory.getInventoryIdFromVehicleId(vehId) end

--- Lists the inventory vehicles present in the nearest garage (intersected zone), sorted by distance to the player. With onlyFirst, returns a single id (the first found by next, see notes).
---Source: lua/ge/extensions/career/modules/inventory.lua:973
---@param onlyFirst boolean|nil Return only one id.
---@return integer[]|integer|nil  List of ids, or one id if onlyFirst.
function career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst) end

--- Inventory id of the last vehicle the player entered.
---Source: lua/ge/extensions/career/modules/inventory.lua:678
---@return integer|nil  inventoryId.
function career_modules_inventory.getLastVehicle() end

--- Returns the table inventoryId -> object id for the vehicles present in the world (by reference).
---Source: lua/ge/extensions/career/modules/inventory.lua:694
---@return table<integer, integer>  Mapping.
function career_modules_inventory.getMapInventoryIdToVehId() end

--- Number of free slots (20 minus the owned vehicles that take up space).
---Source: lua/ge/extensions/career/modules/inventory.lua:286
---@return integer  Free slots.
function career_modules_inventory.getNumberOfFreeSlots() end

--- Records the part conditions received from the vehicle (ignored with a warning if it is not a table), finalizes a pending add (onVehicleAdded hook) and synchronizes the parts inventory.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:395
---@param partConditions table|boolean Conditions, or false if not initialized.
---@param inventoryId integer Inventory id.
function career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId) end

--- Returns the info of an inventory vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:1152
---@param inventoryId integer Inventory id.
---@return table|nil  Vehicle info.
function career_modules_inventory.getVehicle(inventoryId) end

--- Converts an inventory id to a world object id (nil if not spawned).
---Source: lua/ge/extensions/career/modules/inventory.lua:682
---@param inventoryId integer|nil Inventory id.
---@return integer|nil  Object id.
function career_modules_inventory.getVehicleIdFromInventoryId(inventoryId) end

--- Translated display name of the vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:833
---@param inventoryId integer Inventory id.
---@return string|nil  Name.
function career_modules_inventory.getVehicleNiceNameTranslated(inventoryId) end

--- Path of the vehicle thumbnail: save file if a capture exists, otherwise the default preview of its configuration.
---Source: lua/ge/extensions/career/modules/inventory.lua:760
---@param inventoryId integer|nil Inventory id.
---@return string|nil  Image path.
function career_modules_inventory.getVehicleThumbnail(inventoryId) end

--- Prepares a vehicle's data for the UI: value (and repaired value), express repair price, distance, presence in garage/storage, need for repair, favorite, insurance, permissions (repair, sale, favorite, storage, plate, loan return), listing for sale and performance data.
---Source: lua/ge/extensions/career/modules/inventory.lua:839
---@param inventoryId integer Inventory id.
---@param inventoryIdsInGarage table<integer, boolean>|nil Vehicles of the nearest garage (computed if nil).
---@return table|nil  Data for the UI.
function career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage) end

--- Returns the complete inventory vehicles table (by reference).
---Source: lua/ge/extensions/career/modules/inventory.lua:1148
---@return table<integer, table>  inventoryId -> vehicle info.
function career_modules_inventory.getVehicles() end

--- Indicates whether at least one slot is free.
---Source: lua/ge/extensions/career/modules/inventory.lua:294
---@return boolean  true if so.
function career_modules_inventory.hasFreeSlot() end

--- Indicates whether the inventory contains no vehicle.
---Source: lua/ge/extensions/career/modules/inventory.lua:1347
---@return boolean  true if empty.
function career_modules_inventory.isEmpty() end

--- Validates a plate text via core_vehicles.isLicensePlateValid.
---Source: lua/ge/extensions/career/modules/inventory.lua:1351
---@param text string Text.
---@return boolean  Validity.
function career_modules_inventory.isLicensePlateValid(text) end

--- Indicates whether the player is in an inventory vehicle (currentVehicle set), owned or not.
---Source: lua/ge/extensions/career/modules/inventory.lua:702
---@return boolean  true if seated in an inventory vehicle.
function career_modules_inventory.isSeatedInsideOwnedVehicle() end

--- Validates a vehicle name: non-empty and without quote, backslash or control character (\b \f \n \r \t).
---Source: lua/ge/extensions/career/modules/inventory.lua:1355
---@param text string|nil Name.
---@return boolean  Validity.
function career_modules_inventory.isVehicleNameValid(text) end

--- Hook: updates the current vehicle's part conditions and sends to the UI whether it needs repair (gameContextPlayerVehicleDamageInfo).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1200
function career_modules_inventory.onAvailableMissionsSentToUi() end

--- Hook: leaving the vehicle (walking mode) enters "no vehicle"; getting into an inventory vehicle records it as current.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:964
---@param enabled boolean true if switching to walking mode.
---@param vehicleInFrontVehId integer|nil Id of the vehicle in front of the player.
function career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId) end

--- Hook: when the big map opens, creates a 'beforeReset' part conditions snapshot for the current vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:662
function career_modules_inventory.onBigMapActivated() end

--- Hook: sells the vehicles if the save is too old, then prepares the inventory (vehicles respawning, entering the current vehicle, starting equipment for a new career).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:636
---@param active boolean Nothing if false.
function career_modules_inventory.onCareerActive(active) end

--- Permissions hook: for non-owned vehicles, forbids sale, repair, mission, painting, parts purchase, plate, tuning, storage, parts swap, towing to garage and favorite; also forbids repairing/selling an inaccessible vehicle, favoriting the favorite or a missing file, storing a vehicle absent from the world.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1270
---@param tags string[] Tags requested.
---@param permissions table[] List to complete ({permission}).
---@param additionalData {inventoryId: integer}|nil Context (inventoryId).
function career_modules_inventory.onCheckPermission(tags, permissions, additionalData) end

--- Computer hook: adds the "My vehicles" function _anon(order 1), disabled until the starter vehicle is bought.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1218
---@param menuData table Menu data.
---@param computerFunctions table Functions to complete (general).
function career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook: stores the vehicle entered as the last vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1142
---@param inventoryId integer|nil Inventory id.
function career_modules_inventory.onEnterVehicleFinished(inventoryId) end

--- Hook: the inventory screen is closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1137
function career_modules_inventory.onExitVehicleInventory() end

--- Hook: if career is active, loads the files of career/vehicles/ and inventory.json (current vehicle, last, favorite, positions, on-foot position); decrements timeToAccess by the time elapsed since the save.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:54
function career_modules_inventory.onExtensionLoaded() end

--- POI list hook: adds a big map marker for each inventory vehicle present in the world (other than the player's), with description (distance, plate, odometer) and thumbnail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1299
---@param levelIdentifier string Level (unused).
---@param elements table[] POI list to complete.
function career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Save hook: writes inventory.json, updates the part conditions, then writes each vehicle (JSON + thumbnail if requested) and deletes the files of vehicles that no longer exist; at the end, emits onVehicleSaveFinished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:247
---@param currentSavePath string Save folder.
---@param vehiclesThumbnailUpdate integer[]|nil Ids of the vehicles whose thumbnail must be redone.
function career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

--- Hook: registers the inventory as an asynchronous save extension (career_saveSystem.registerAsyncSaveExtension).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:177
function career_modules_inventory.onSaveCurrentProfileAsyncStart() end

--- Hook: when the screen fade is complete (state 1), removes the marked vehicles then runs the deferred action (vehicle spawn).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:1001
---@param state integer Fade state.
function career_modules_inventory.onScreenFadeState(state) end

--- Frame hook: initial save of a new career (after 10 frames), toasts for a vehicle put into storage or a loan returned, timeToAccess countdown with delivery/repair messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inventory.lua:923
---@param dtReal number Real time (s).
---@param dtSim number Simulated time (s).
---@param dtRaw number Raw time (s).
function career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens the inventory to choose a vehicle to put up for sale (addListing action on the UI side), all other actions disabled.
---Source: lua/ge/extensions/career/modules/inventory.lua:1115
function career_modules_inventory.openInventoryMenuForChoosingListing() end

--- Opens the inventory screen (career.computer.vehicleInventory) with configurable choice buttons and updates the part conditions of the spawned vehicles.
---Source: lua/ge/extensions/career/modules/inventory.lua:1009
---@param _chooseButtonsData table[]|nil Buttons {callback, buttonText, repairRequired, insuranceRequired, ownedRequired...}.
---@param header string|nil Menu title.
---@param _buttonsActive table|nil repairEnabled, sellEnabled, favoriteEnabled, storingEnabled, returnLoanerEnabled (true by default).
---@param _backTarget string|nil Return route.
function career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget) end

--- Opens the inventory from the garage computer with three buttons: retrieve at the garage, replace the current vehicle, open the performance index.
---Source: lua/ge/extensions/career/modules/inventory.lua:1082
---@param _originComputerId string Originating computer id.
function career_modules_inventory.openMenuFromComputer(_originComputerId) end

--- Buys a plate change: pays, applies the text, unlocks NOW_ITS_MINE, plays the sound and marks the vehicle as modified. Does nothing if the player cannot pay.
---Source: lua/ge/extensions/career/modules/inventory.lua:1243
---@param inventoryId integer Inventory id.
---@param text string Plate text.
---@param money number Price.
function career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money) end

--- Removes the vehicle from the inventory and the world, emits onVehicleRemoved and reassigns the favorite if needed.
---Source: lua/ge/extensions/career/modules/inventory.lua:378
---@param inventoryId integer Inventory id.
function career_modules_inventory.removeVehicle(inventoryId) end

--- Removes only the vehicle object from the world (the vehicle stays in the inventory, in storage); puts the player in walking mode if they were driving it. Emits onInventoryPreRemoveVehicleObject.
---Source: lua/ge/extensions/career/modules/inventory.lua:360
---@param inventoryId integer Inventory id.
---@param skipPartConditions boolean|nil Not used in the body (remains a TODO).
function career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions) end

--- Renames the vehicle (niceName) if valid and marks it as modified.
---Source: lua/ge/extensions/career/modules/inventory.lua:1360
---@param inventoryId integer Inventory id.
---@param name string New name.
---@return boolean  false if the name is invalid.
function career_modules_inventory.renameVehicle(inventoryId, name) end

--- Leaves the selector: navigates to the return route (career.computer by default).
---Source: lua/ge/extensions/career/modules/inventory.lua:1036
---@return any  Result of ui_router.navigate.
function career_modules_inventory.requestPickerExit() end

--- Returns a loaned vehicle (career_modules_loanerVehicles.returnVehicle) then saves and refreshes the UI.
---Source: lua/ge/extensions/career/modules/inventory.lua:1180
---@param inventoryId integer Inventory id.
function career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId) end

--- Sells a vehicle: emits onBeforeVehicleSell, credits the price (or the value computed by valueCalculator), removes the vehicle, plays the purchase sound, unlocks FLIP_PROFIT if resold above the final purchase price, and logs.
---Source: lua/ge/extensions/career/modules/inventory.lua:1156
---@param inventoryId integer Inventory id.
---@param price number|nil Imposed price (otherwise computed value).
---@return boolean|nil  true if sold, nil if the vehicle does not exist.
function career_modules_inventory.sellVehicle(inventoryId, price) end

--- Sells from the inventory screen: sells, saves the career and sends the data back to the UI.
---Source: lua/ge/extensions/career/modules/inventory.lua:1173
---@param inventoryId integer Inventory id.
function career_modules_inventory.sellVehicleFromInventory(inventoryId) end

--- Sends to the UI (guihooks vehicleInventoryData) all the vehicles, the choice buttons, the header, the number of free slots and the player's money.
---Source: lua/ge/extensions/career/modules/inventory.lua:903
function career_modules_inventory.sendDataToUi() end

--- Sets the favorite vehicle (ignored if the id is unknown).
---Source: lua/ge/extensions/career/modules/inventory.lua:1208
---@param inventoryId integer Inventory id.
function career_modules_inventory.setFavoriteVehicle(inventoryId) end

--- Changes the vehicle's plate text in the world and in its config.
---Source: lua/ge/extensions/career/modules/inventory.lua:1235
---@param inventoryId integer Inventory id.
---@param text string Plate text.
function career_modules_inventory.setLicensePlateText(inventoryId, text) end

--- Marks a vehicle as modified: it will be rewritten (with a new dirtyDate) at the next save.
---Source: lua/ge/extensions/career/modules/inventory.lua:146
---@param inventoryId integer Inventory id.
function career_modules_inventory.setVehicleDirty(inventoryId) end

--- Spawns an inventory vehicle from its config (flattened parts list), restores its part conditions and reconciles the parts inventory. Returns nil if the model or the config file no longer exists.
---Source: lua/ge/extensions/career/modules/inventory.lua:436
---@param inventoryId integer Inventory id.
---@param replaceOption integer|nil 1: replaces the player's current vehicle; 2: replaces the object with the same inventoryId; other: new vehicle without entering it.
---@param callback function|nil Called when the part conditions are synchronized.
---@return userdata|nil  Vehicle object created.
function career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback) end

--- Called after a teleport from the big map: saves the career if the player is in an inventory vehicle and if autosave is active.
---Source: lua/ge/extensions/career/modules/inventory.lua:668
function career_modules_inventory.teleportedFromBigmap() end

--- Asks the vehicle for its part conditions (getPartConditions) and stores them in the inventory then in the parts inventory.
---Source: lua/ge/extensions/career/modules/inventory.lua:406
---@param vehId integer|nil Object id; otherwise deduced from inventoryId.
---@param inventoryId integer Inventory id.
---@param callback function|nil Called once the value is received.
function career_modules_inventory.updatePartConditions(vehId, inventoryId, callback) end

--- Marks all spawned vehicles as modified and updates their part conditions; callback is called when all are processed (or immediately if there are none).
---Source: lua/ge/extensions/career/modules/inventory.lua:150
---@param callback function|nil Called at the end.
function career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback) end

