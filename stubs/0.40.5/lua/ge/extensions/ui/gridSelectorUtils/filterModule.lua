---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grid selector utility: manages filter state ("set" value-set filters and "range" filters), the search text, filter locking and the computation of the active filters list displayed as chips. Backends (vehicles, gameplay, etc.) create an instance via `create`, providing the function that builds the filters from their item list.
--- Access: extension `ui_gridSelectorUtils_filterModule`: `extensions.load("ui_gridSelectorUtils_filterModule")`, then the global `ui_gridSelectorUtils_filterModule`
---@class ui_gridSelectorUtils_filterModule
ui_gridSelectorUtils_filterModule = {}

--- Creates a filter management instance.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:4
---@param createFiltersFunction function|nil (configList) -> filterList, filterByProp, commonFilters; called by initializeFilters.
---@param commonFilters table[]|nil List of { propName, option } pairs considered "common" filters.
---@param rangeFilters table|nil Accepted but unused in the code.
---@param dictFilters table|nil Accepted but unused in the code.
---@param backendName string|nil Backend name, default "gridSelector" (not used afterwards).
---@param customPassesFiltersFunction function|nil (itemData, validFilters, searchText) -> boolean; used by passesFilters.
---@return table  Instance (see classes.instance).
function ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction) end

--- Object returned by create().
---@class ui_gridSelectorUtils_filterModule_instance
local ui_gridSelectorUtils_filterModule_instance = {}

--- Computes the filters that differ from the default values.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Active filters.
---@return boolean  true if there is at least one active non-common filter.
function ui_gridSelectorUtils_filterModule_instance:calculateActiveFilters() end

--- Resets all range and set filters then clears the search text.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:clearAllFilters() end

--- Removes all locks.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:clearLockedFilters() end

--- Returns the list of active filters (displayText, propName, propValue, isActive, iconType, type).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Active filters, in filterList order.
function ui_gridSelectorUtils_filterModule_instance:getActiveFilters() end

--- Returns the full state for the UI.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table  { filterList, filterByProp, commonFilters, lockedFiltersByProp, activeFilters, onlyCommonFilters }.
function ui_gridSelectorUtils_filterModule_instance:getFilters() end

--- Returns the search text.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return string  Text ("" by default).
function ui_gridSelectorUtils_filterModule_instance:getSearchText() end

--- Returns the list of restrictive filters (recomputed if needed).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Valid filters with current values.
function ui_gridSelectorUtils_filterModule_instance:getValidFilters() end

--- Calls createFiltersFunction(configList) and replaces filterList, filterByProp and optionally commonFilters.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param configList any Data passed to the creation function.
function ui_gridSelectorUtils_filterModule_instance:initializeFilters(configList) end

--- Returns whether an option (or any option if option is nil) of a property is locked.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param option any Specific option or nil.
---@return boolean  true if locked.
function ui_gridSelectorUtils_filterModule_instance:isFilterLocked(propName, option) end

--- Locks the current state of a filter (range: min/max; set: the given options or all).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param options table|nil List of options to lock (set).
function ui_gridSelectorUtils_filterModule_instance:lockFilter(propName, options) end

--- Locks a filter in a mode: range -> sets the given min/max; set -> all options to false then those of `options` (table option -> bool) to the given value, all locked.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param options table {min, max} for range or { [option] = bool } for set.
function ui_gridSelectorUtils_filterModule_instance:lockFilterMode(propName, options) end

--- Set filters only: all options set to false and locked, except those of allowedOptions set to true and unlocked.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param allowedOptions table|nil List of allowed options.
function ui_gridSelectorUtils_filterModule_instance:lockFilterModeExclusive(propName, allowedOptions) end

--- Tests an item with customPassesFiltersFunction(itemData, validFilters, searchText); true if no function is provided.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param itemData any Item to test.
---@return boolean  true if the item passes.
function ui_gridSelectorUtils_filterModule_instance:passesFilters(itemData) end

--- Resets a range filter to its default bounds.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
function ui_gridSelectorUtils_filterModule_instance:resetRangeFilter(propName) end

--- Re-enables all options of a set filter.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
function ui_gridSelectorUtils_filterModule_instance:resetSetFilter(propName) end

--- Sets the search text (nil becomes "") and invalidates the cache.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param val string|nil Text.
function ui_gridSelectorUtils_filterModule_instance:setSearchText(val) end

--- Rebuilds the internal list of effectively restrictive filters (used by passesFilters).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:setupValidFilters() end

--- Toggles an option of a set filter (see notes). Ignored if the option is locked.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Filtered property.
---@param option string|number Option value.
function ui_gridSelectorUtils_filterModule_instance:toggleFilter(propName, option) end

--- Intended to unlock a filter; has no effect because of a bug (see notes).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param options table|nil Not used.
function ui_gridSelectorUtils_filterModule_instance:unlockFilter(propName, options) end

--- Replaces filterByProp with newFilters while keeping the locked values.
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param newFilters table New filterByProp state.
function ui_gridSelectorUtils_filterModule_instance:updateFilters(newFilters) end

--- Sets min and max of a range filter (ignored if locked).
---Source: lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Property.
---@param min number Minimum.
---@param max number Maximum.
function ui_gridSelectorUtils_filterModule_instance:updateRangeFilter(propName, min, max) end

