---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partInventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career parts inventory. Each part (installed on an inventory vehicle or in storage, location = 0) is an entry of the partInventory table keyed by an integer partId. The module generates a vehicle's parts from its parts tree (partsTree), reconciles them with the actual vehicle after modification, sells stored parts, feeds the "My parts" screen of the garage computer and saves everything to career/partInventory.json (serialized).
--- Access: extension `career_modules_partInventory`: `extensions.load("career_modules_partInventory")`, then the global `career_modules_partInventory`
---@class career_modules_partInventory
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_partInventory = {}

--- Adds a part under the smallest free partId (starting from 1).
---Source: lua/ge/extensions/career/modules/partInventory.lua:121
---@param part table Part to add.
function career_modules_partInventory.addPartToInventory(part) end

--- Closes the screen: if autosave is active and vehicles are modified, saves them first (closing happens in onSaveFinished), otherwise returns directly to the computer or closes the menus.
---Source: lua/ge/extensions/career/modules/partInventory.lua:508
function career_modules_partInventory.closeMenu() end

--- Returns the table of all parts (partId -> part), by reference.
---Source: lua/ge/extensions/career/modules/partInventory.lua:548
---@return table<integer, table>  Parts inventory.
function career_modules_partInventory.getInventory() end

--- Looks up the part installed in a slot of a vehicle.
---Source: lua/ge/extensions/career/modules/partInventory.lua:467
---@param inventoryId integer Vehicle inventory id (location).
---@param path string Slot path (containingSlot).
---@return table|nil  The part.
function career_modules_partInventory.getPart(inventoryId, path) end

--- Returns the table inventoryId -> partPath -> partId (vehicles only).
---Source: lua/ge/extensions/career/modules/partInventory.lua:544
---@return table  Part path table.
function career_modules_partInventory.getPartPathToPartIdMap() end

--- Returns the table location -> containingSlot -> partId.
---Source: lua/ge/extensions/career/modules/partInventory.lua:540
---@return table  Slot table.
function career_modules_partInventory.getSlotToPartIdMap() end

--- Indicates whether the part must be hidden in the UI: auxiliary (description.isAuxiliary) and of zero value.
---Source: lua/ge/extensions/career/modules/partInventory.lua:129
---@param part table Part.
---@return boolean|nil  true if hidden.
function career_modules_partInventory.isHiddenInUI(part) end

--- Computer hook: adds the "My parts" function _anon(order 5), disabled while the starter vehicle is not bought.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:552
---@param menuData table Menu data.
---@param computerFunctions table Functions to complete (general).
function career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook: schedules the update of the index tables when entering a vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:438
---@param currentVehicle integer|nil Inventory id of the current vehicle.
function career_modules_partInventory.onEnterVehicleFinished(currentVehicle) end

--- Hook: loads partInventory.json (deserialized), sells parts in storage if the save is of an older version, reloads the JBeam descriptions, removes hidden parts in storage and rebuilds the index tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:399
function career_modules_partInventory.onExtensionLoaded() end

--- Hook: after a parts purchase, removes hidden parts in storage and rebuilds the indexes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:445
function career_modules_partInventory.onPartShoppingTransactionComplete() end

--- UI router lifecycle: sends the inventory data once the view is mounted if the menu is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:493
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data) end

--- End-of-save hook: closes the menu if closeMenu was waiting for it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:529
function career_modules_partInventory.onSaveFinished() end

--- Frame hook: adds the parts of a newly added vehicle and updates the index tables after a vehicle change, as soon as partConditions is available.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:282
function career_modules_partInventory.onUpdate() end

--- Hook: remembers the vehicle whose parts must be added in onUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:450
---@param inventoryId integer Inventory id.
function career_modules_partInventory.onVehicleAdded(inventoryId) end

--- Hook: removes all parts located on the removed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:454
---@param inventoryId integer Inventory id.
function career_modules_partInventory.onVehicleRemoved(inventoryId) end

--- Save hook: writes partInventory.json to <save>/career/ (without the description field, via serialize).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partInventory.lua:355
---@param currentSavePath string Save folder.
function career_modules_partInventory.onVehicleSaveFinished(currentSavePath) end

--- Opens the parts screen: picks the current vehicle or the nearest garage one, updates its part conditions then navigates to career.computer.partInventory.
---Source: lua/ge/extensions/career/modules/partInventory.lua:476
---@param _originComputerId string|nil Originating computer id.
function career_modules_partInventory.openMenu(_originComputerId) end

--- Notifies that the inventory UI is closed (partInventoryOpen = false).
---Source: lua/ge/extensions/career/modules/partInventory.lua:536
function career_modules_partInventory.partInventoryClosed() end

--- Entry point of the UI router back button: calls closeMenu to keep the autosave behavior.
---Source: lua/ge/extensions/career/modules/partInventory.lua:525
function career_modules_partInventory.requestExit() end

--- Sells parts in storage: credits the sum of their values, plays the purchase sound, deletes them and refreshes the UI if the menu is open.
---Source: lua/ge/extensions/career/modules/partInventory.lua:24
---@param partIds integer[] Ids of the parts to sell (location 0 required).
function career_modules_partInventory.sellParts(partIds) end

--- Sends to the UI (guihooks partInventoryData) the list of visible parts (excluding main parts), their final value, their accessibility (not installed on a vehicle) and the vehicle data.
---Source: lua/ge/extensions/career/modules/partInventory.lua:316
function career_modules_partInventory.sendUIData() end

--- Copies into each part the condition (partCondition) known by the vehicle containing it.
---Source: lua/ge/extensions/career/modules/partInventory.lua:110
function career_modules_partInventory.updatePartConditionsInInventory() end

--- Re-reads the parts of the currently present vehicle and reconciles them with the inventory: updates vehicle.config, keeps condition, tags, year, repairCount and primered of existing parts (same slot), adds new ones (default condition integrity 1, odometer 0, visual 1) and removes those that disappeared. Marks the vehicle as modified.
---Source: lua/ge/extensions/career/modules/partInventory.lua:152
---@param inventoryId integer Inventory id of the vehicle.
---@return {added: table[], removed: table[], changed: {old: table, new: table}[]}  Detected differences.
function career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId) end

