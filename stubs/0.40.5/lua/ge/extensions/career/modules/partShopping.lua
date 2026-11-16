---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career parts shop ("part customization" screen of the garage computer). For an inventory vehicle, it generates the list of compatible parts per slot (new JBeam parts with their value, plus inventory parts in storage at zero cost), maintains a cart (partsIn / partsOut), previews the result by respawning the vehicle with the chosen parts, automatically adds the necessary parts in sub-slots, removes parts that became incompatible and applies the purchase (payment, parts inventory update, save).
--- Access: extension `career_modules_partShopping`: `extensions.load("career_modules_partShopping")`, then the global `career_modules_partShopping`
---@class career_modules_partShopping
---@field dependencies table<integer, string> Extensions loaded before: career_career, gameplay_achievement.
career_modules_partShopping = {}

--- Confirms the purchase: does nothing if the player cannot pay the total including tax. Otherwise replaces the inventory vehicle with the preview, moves removed parts to storage, adds/updates installed parts, pays (tags partsBought, buying), saves the vehicle, plays the sound and emits onPartShoppingTransactionComplete.
---Source: lua/ge/extensions/career/modules/partShopping.lua:972
function career_modules_partShopping.applyShopping() end

--- Cancels the session: emits onPartShoppingCancelled, respawns the original vehicle (spawnVehicle option 2) and closes the menu.
---Source: lua/ge/extensions/career/modules/partShopping.lua:910
function career_modules_partShopping.cancelShopping() end

--- Breadcrumb title for the category route: "cargo parts" for category == "cargo", otherwise "all parts".
---Source: lua/ge/extensions/career/modules/partShopping.lua:1000
---@param category string Route parameter category.
---@return string  Translated title.
function career_modules_partShopping.getCategoryBreadcrumbTitle(category) end

--- Returns the list of offered parts (partsInShop).
---Source: lua/ge/extensions/career/modules/partShopping.lua:1020
---@return table[]  Shop parts.
function career_modules_partShopping.getPartsInShop() end

--- Returns the cart {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}.
---Source: lua/ge/extensions/career/modules/partShopping.lua:1024
---@return table  Cart.
function career_modules_partShopping.getShoppingCart() end

--- Breadcrumb title for the slot route: readable name of the last segment of the path.
---Source: lua/ge/extensions/career/modules/partShopping.lua:1010
---@param slotPath string Route parameter slotPath.
---@return string|nil  Slot name, nil if unknown.
function career_modules_partShopping.getSlotBreadcrumbTitle(slotPath) end

--- Adds a part to the cart (no effect outside a session), automatically fills empty sub-slots with inventory or default parts, updates the preview and emits onPartShoppingPartInstalled.
---Source: lua/ge/extensions/career/modules/partShopping.lua:855
---@param part table Shop part (containingSlot, name, partPath, finalValue...).
function career_modules_partShopping.installPart(part) end

--- Installs the shop part identified by its partShopId.
---Source: lua/ge/extensions/career/modules/partShopping.lua:870
---@param partShopId integer Part identifier in partsInShop.
function career_modules_partShopping.installPartByPartShopId(partShopId) end

--- Indicates whether a shopping session is active.
---Source: lua/ge/extensions/career/modules/partShopping.lua:994
---@return boolean  true if active.
function career_modules_partShopping.isShoppingSessionActive() end

--- Computer hook: adds the "part customization" function _anon(order 1) for each garage vehicle, disabled if the vehicle needs repair, if the starter vehicle is not bought or if career_modules_permissions denies partBuying/vehicleModification.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partShopping.lua:1028
---@param menuData table Menu data (computerFacility, vehiclesInGarage...).
---@param computerFunctions table Functions to fill (vehicleSpecific[inventoryId]).
function career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions) end

--- UI router lifecycle: remembers the selection (category, slot, panel) inferred from the route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partShopping.lua:445
---@param context any Router context.
---@param toRoute table Target route (name, params).
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- UI router lifecycle: renormalizes the selection then sends the shop data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partShopping.lua:451
---@param context any Router context.
---@param toRoute table Target route.
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook: once the vehicle save is finished after a purchase, closes the menu if closing was deferred.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partShopping.lua:922
function career_modules_partShopping.onVehicleSaveFinished() end

--- Removes from the cart the part of the given slot (restores the original part if it still fits the slot).
---Source: lua/ge/extensions/career/modules/partShopping.lua:879
---@param slot string Slot path (containingSlot).
function career_modules_partShopping.removePartBySlot(slot) end

--- Asks the UI to leave the screen (guihooks partShoppingRequestExit).
---Source: lua/ge/extensions/career/modules/partShopping.lua:918
function career_modules_partShopping.requestExit() end

--- Regenerates the shop and sends to the UI (guihooks partShoppingData): parts, slot tree, cart, names, search list, parts filtered by route, slot -> installed part map and the player's money.
---Source: lua/ge/extensions/career/modules/partShopping.lua:414
function career_modules_partShopping.sendShoppingDataToUI() end

--- Creates the capsule tether between the computer and the vehicle; when it is crossed, cancelShopping is called.
---Source: lua/ge/extensions/career/modules/partShopping.lua:516
function career_modules_partShopping.setupTether() end

--- Starts a session for a vehicle (the given one, the current one, otherwise the nearest garage one). First repairs via insurance if the vehicle is damaged, then prepares the cart, generates the shop, sets the tether, opens the screen and freezes the vehicle.
---Source: lua/ge/extensions/career/modules/partShopping.lua:531
---@param inventoryId integer|nil Inventory id of the vehicle.
---@param _originComputerId string|nil Id of the originating computer (used for returning and for the tether).
function career_modules_partShopping.startShopping(inventoryId, _originComputerId) end

--- Callback called by the vehicle with its part conditions after the preview respawn: copies the parts tree, updates the cart, sends the data back to the UI and refreezes the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/partShopping.lua:456
---@param currentPartConditions table|nil Part conditions read from the vehicle.
function career_modules_partShopping.updatePreviewVehicle(currentPartConditions) end

