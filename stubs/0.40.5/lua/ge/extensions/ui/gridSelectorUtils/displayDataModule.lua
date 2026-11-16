---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grid selector utility: manages display options (sorting, display filters, toggles...), the favorites list and the recent items list, with JSON persistence in a file (default /settings/gridSelectorData.json). An option can be linked to a game setting via `settingsKey`. Emits the hooks onGridSelectorDisplayDataChanged and onGridSelectorFavouriteToggled.
--- Access: extension `ui_gridSelectorUtils_displayDataModule`: `extensions.load("ui_gridSelectorUtils_displayDataModule")`, then the global `ui_gridSelectorUtils_displayDataModule`
---@class ui_gridSelectorUtils_displayDataModule
ui_gridSelectorUtils_displayDataModule = {}

--- Creates a display data, favorites and recents management instance.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:4
---@param dataFile string|nil JSON save file, default /settings/gridSelectorData.json.
---@param displayDataOptions table[]|nil List of options { key, type, default, label, min, max, options, showInModes, description, hideInSimpleMenu, save, settingsKey }.
---@param updateDisplayDataFunction function|nil Migration (displayData, oldVersion, newVersion) -> displayData.
---@param backendName string|nil Name passed to the hooks, default "gridSelector".
---@param targetVersion integer|nil Current data format version, default 1.
---@return table  Instance (see classes.instance).
function ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion) end

--- Object returned by create().
---@class ui_gridSelectorUtils_displayDataModule_instance
local ui_gridSelectorUtils_displayDataModule_instance = {}

--- Clears the favorites and saves.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
function ui_gridSelectorUtils_displayDataModule_instance:clearAllFavourites() end

--- Clears the recents and saves.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
function ui_gridSelectorUtils_displayDataModule_instance:clearAllRecentItems() end

--- Returns the key -> value table of the options, initialized on first call.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  Current values.
function ui_gridSelectorUtils_displayDataModule_instance:getDisplayData() end

--- Returns the options list for the UI: label, key, type, min, max, value, options, showInModes, description, hideInSimpleMenu. The value of `searchText` is always nil (handled by the calling module).
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table[]  Options with their current value.
function ui_gridSelectorUtils_displayDataModule_instance:getDisplayDataOptions() end

--- Returns a deep copy of the recents list.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return string[]  Recent keys, most recent first.
function ui_gridSelectorUtils_displayDataModule_instance:getRecentItems() end

--- Re-reads the file and rebuilds the options table from the defaults, the file and the linked settings.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  New table (does not overwrite the internal cache).
function ui_gridSelectorUtils_displayDataModule_instance:initializeDisplayData() end

--- Returns the favorite's timestamp or nil.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Item key.
---@return integer|nil  os.time() of when it was added.
function ui_gridSelectorUtils_displayDataModule_instance:isFavourite(itemKey) end

--- Returns the position in the recents list, or false.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Item key.
---@return integer|boolean  Index or false.
function ui_gridSelectorUtils_displayDataModule_instance:isRecentItem(itemKey) end

--- Resets the `save` options to their default value, emits the hook for each change and saves.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  Updated displayData.
function ui_gridSelectorUtils_displayDataModule_instance:resetDisplayDataToDefaults() end

--- Changes an option (converted to a number if its type is number), emits onGridSelectorDisplayDataChanged(backendName, key, value), propagates to the linked setting and saves. nil or "undefined" values are ignored.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param key string Option key.
---@param value any New value.
---@return table<string, any>  Updated displayData.
function ui_gridSelectorUtils_displayDataModule_instance:setDisplayDataOption(key, value) end

--- Adds or removes a favorite, emits onGridSelectorFavouriteToggled(backendName, itemKey, isFavourite) and saves.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Item key.
function ui_gridSelectorUtils_displayDataModule_instance:toggleFavourite(itemKey) end

--- Puts the item at the head of the recents (max 100) and saves.
---Source: lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Item key.
function ui_gridSelectorUtils_displayDataModule_instance:trackRecentItem(itemKey) end

