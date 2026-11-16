# `ui_gridSelectorUtils_filterModule`

*File: `lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua` · VM: Game Engine (GE) · 777 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorUtils_filterModule`: `extensions.load("ui_gridSelectorUtils_filterModule")`, then the global `ui_gridSelectorUtils_filterModule`

Grid selector utility: manages filter state ("set" value-set filters and "range" filters), the search text, filter locking and the computation of the active filters list displayed as chips. Backends (vehicles, gameplay, etc.) create an instance via `create`, providing the function that builds the filters from their item list.

## Notes

- A filter is described in filterList by { propName, propKey, type = 'set'|'range', options, min, max }. filterByProp[propName] is { [option] = bool } for a set and { min, max } for a range.
- toggleFilter: if all options are enabled, keeps only the clicked option; otherwise toggles the option; if everything becomes false, everything is re-enabled. Locked options are not modified.
- BUG: unlockFilter tests `if not lockedFiltersByProp[propName] then lockedFiltersByProp[propName] = nil` (inverted condition): it never unlocks anything. Only clearLockedFilters releases the locks.
- Probable BUG: updateFilters tests `type(lockedOptions) == 'table'` while lockedFiltersByProp[propName] is always a table; the "range" branch is never reached.
- Caches are invalidated by an internal flag (filtersDirty); passesFilters and getValidFilters recompute validFilters if needed. passesFilters always returns true without customPassesFiltersFunction.
- A filter's option can be a table: its value is option.value, otherwise option.id, otherwise option.name.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction)` | Creates a filter management instance. | 4 |

### Parameter details

#### `ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction)`

Creates a filter management instance.

- `createFiltersFunction` (*function|nil*) : (configList) -> filterList, filterByProp, commonFilters; called by initializeFilters.
- `commonFilters` (*table[]|nil*) : List of { propName, option } pairs considered "common" filters.
- `rangeFilters` (*table|nil*) : Accepted but unused in the code.
- `dictFilters` (*table|nil*) : Accepted but unused in the code.
- `backendName` (*string|nil*) : Backend name, default "gridSelector" (not used afterwards).
- `customPassesFiltersFunction` (*function|nil*) : (itemData, validFilters, searchText) -> boolean; used by passesFilters.
- **returns**: table Instance (see classes.instance).

## Class `instance`

Object returned by create().

| Method | Description | Line |
|---|---|---|
| `instance:calculateActiveFilters()` | Computes the filters that differ from the default values. | dyn |
| `instance:clearAllFilters()` | Resets all range and set filters then clears the search text. | dyn |
| `instance:clearLockedFilters()` | Removes all locks. | dyn |
| `instance:getActiveFilters()` | Returns the list of active filters (displayText, propName, propValue, isActive, iconType, type). | dyn |
| `instance:getFilters()` | Returns the full state for the UI. | dyn |
| `instance:getSearchText()` | Returns the search text. | dyn |
| `instance:getValidFilters()` | Returns the list of restrictive filters (recomputed if needed). | dyn |
| `instance:initializeFilters(configList)` | Calls createFiltersFunction(configList) and replaces filterList, filterByProp and optionally commonFilters. | dyn |
| `instance:isFilterLocked(propName, option)` | Returns whether an option (or any option if option is nil) of a property is locked. | dyn |
| `instance:lockFilter(propName, options)` | Locks the current state of a filter (range: min/max; set: the given options or all). | dyn |
| `instance:lockFilterMode(propName, options)` | Locks a filter in a mode: range -> sets the given min/max; set -> all options to false then those of `options` (table option -> bool) to the given value, all locked. | dyn |
| `instance:lockFilterModeExclusive(propName, allowedOptions)` | Set filters only: all options set to false and locked, except those of allowedOptions set to true and unlocked. | dyn |
| `instance:passesFilters(itemData)` | Tests an item with customPassesFiltersFunction(itemData, validFilters, searchText); true if no function is provided. | dyn |
| `instance:resetRangeFilter(propName)` | Resets a range filter to its default bounds. | dyn |
| `instance:resetSetFilter(propName)` | Re-enables all options of a set filter. | dyn |
| `instance:setSearchText(val)` | Sets the search text (nil becomes "") and invalidates the cache. | dyn |
| `instance:setupValidFilters()` | Rebuilds the internal list of effectively restrictive filters (used by passesFilters). | dyn |
| `instance:toggleFilter(propName, option)` | Toggles an option of a set filter (see notes). Ignored if the option is locked. | dyn |
| `instance:unlockFilter(propName, options)` | Intended to unlock a filter; has no effect because of a bug (see notes). | dyn |
| `instance:updateFilters(newFilters)` | Replaces filterByProp with newFilters while keeping the locked values. | dyn |
| `instance:updateRangeFilter(propName, min, max)` | Sets min and max of a range filter (ignored if locked). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua`.*
