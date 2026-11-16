---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/inventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_inventory`: simple inventory for the campaign/scenarios. Stores per type (UPPERCASE key) either a numeric counter (money) or a list of objects (vehicles, parts). Provides functions to add, remove and read items, and interprets the `onEvent` blocks of the campaign files (rewards or losses depending on the medal earned).
--- Access: extension `core_inventory`: `extensions.load("core_inventory")`, then the global `core_inventory`
---@class core_inventory
---@field itemsTable table<string, number|table[]> Inventory: type (UPPERCASE) -> counter or list of objects.
core_inventory = {}

--- Adds to the inventory: sum of a number or insertion of an object (without duplicates). Ignored if itemType or valueObj is nil/false.
---Source: lua/ge/extensions/core/inventory.lua:29
---@param itemType string Object type (converted to uppercase), by convention prefixed '$$$_'.
---@param valueObj number|table Quantity to add, or object (e.g. {model, config, color}).
function core_inventory.addItem(itemType, valueObj) end

--- Reads a type. For a counter returns its value (0 if absent); for a list returns a copy of the element whose itemId equals itemId.
---Source: lua/ge/extensions/core/inventory.lua:85
---@param itemType string Exact type (already in uppercase).
---@param itemId any Value of the itemId field searched for (list only).
---@return number|table|nil  Quantity, copy of the element, or nil if not found in a list.
function core_inventory.getItem(itemType, itemId) end

--- Deep copy of a type's list; creates an empty list for this type if absent (side effect).
---Source: lua/ge/extensions/core/inventory.lua:101
---@param itemType string Exact type (already in uppercase).
---@return table  Copy of the list (or of the numeric counter if it is a number).
function core_inventory.getItemList(itemType) end

--- Restore hook: does nothing (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/inventory.lua:196
---@param data table Data from onSerialize (unused).
function core_inventory.onDeserialized(data) end

--- Campaign resume hook: replaces itemsTable with the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/inventory.lua:185
---@param campaignInProgress any Current campaign (not used).
---@param data table Saved data.
function core_inventory.onResumeCampaign(campaignInProgress, data) end

--- Campaign save hook: calls saveCallback(extension alias, copy of itemsTable).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/inventory.lua:180
---@param saveCallback function Function (extensionName, data).
function core_inventory.onSaveCampaign(saveCallback) end

--- Serialization hook before extensions reload: returns a copy of itemsTable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/inventory.lua:190
---@return table  Inventory.
function core_inventory.onSerialize() end

--- Applies a campaign 'onEvent' block: direct 'add' keys (type -> value or list) and 'remove' block (by medal or unconditional).
---Source: lua/ge/extensions/core/inventory.lua:129
---@param onEventData table|nil onEvent block; nil = nothing.
---@param earnedMedal string|nil 'bronze', 'silver' or 'gold': selects the sub-block of 'remove'.
function core_inventory.processOnEvent(onEventData, earnedMedal) end

--- Removes from the inventory: subtracts a number or deletes the object whose model and config match.
---Source: lua/ge/extensions/core/inventory.lua:58
---@param itemType string Object type (converted to uppercase).
---@param valueObj number|table Quantity to remove, or object with model and config.
function core_inventory.removeItem(itemType, valueObj) end

