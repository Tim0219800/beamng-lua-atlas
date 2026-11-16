# `ui_vehicleSelector_tileGrouping`

*File: `lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua` · VM: Game Engine (GE) · 166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_tileGrouping`: `extensions.load("ui_vehicleSelector_tileGrouping")`, then the global `ui_vehicleSelector_tileGrouping`

Determines in which groups (grid sections) a vehicle config appears according to the selector's "Group by" mode: Type, Brand, Country, Config Type, Derby Class, Body Style, Source, as well as Years (by decade) and Value (by price range). Also adds the special Favorites and Recents groups. Used by ui_vehicleSelector_tiles.

## Notes

- A group is a table {groupName, groupOrder}; groupOrder -1 = Favorites, -2 = Recents, 999 = "Other". For Type, the order comes from typeOrder (Car and Truck share "Cars and trucks").
- A config can be in several groups: Years gives one entry per decade covered, and Favorites/Recents are added to the normal groups (unless showFavouritesMode or showRecentMode is 'hidden').
- Value ranges: <10k (Misc), <20k, <50k, <100k, <250k, <500k, <1M, then 1M+.
- getGroupsForConfig calls groupModeFunctions[groupMode] (or groupsForRange) without checking: an unknown group mode causes an error.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop)` | Reads a property on the config, or failing that on the model (core_vehicles.getModel). | 102 |
| `ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode)` | Returns the grouping function of a non-range-based mode. | 151 |
| `ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData)` | Returns the list of groups of a config for a grouping mode, with the Favorites and Recents groups if applicable. A missing value is classified under "Other". | 115 |
| `ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode)` | Returns the function that splits a value into groups for Years or Value. | 156 |
| `ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode)` | Returns whether the mode is range grouping (Years, Value). | 146 |

### Parameter details

#### `ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop)`

Reads a property on the config, or failing that on the model (core_vehicles.getModel).

- `config` (*table*) : Config (with model_key).
- `prop` (*string*) : Property name.
- **returns**: any Value or nil.

#### `ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode)`

Returns the grouping function of a non-range-based mode.

- `groupMode` (*string*) : Grouping mode.
- **returns**: function|nil Function or nil.

#### `ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData)`

Returns the list of groups of a config for a grouping mode, with the Favorites and Recents groups if applicable. A missing value is classified under "Other".

- `config` (*table*) : Vehicle config.
- `groupMode` (*string*) : Grouping mode (Type, Brand, Years, Value, ...).
- `displayData` (*table*) : Display options (showFavouritesMode, showRecentMode).
- **returns**: table[] List of {groupName, groupOrder, isFavouriteGroup?, isRecentGroup?}.

#### `ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode)`

Returns the function that splits a value into groups for Years or Value.

- `groupMode` (*string*) : 'Years' or 'Value'.
- **returns**: function|nil Function or nil.

#### `ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode)`

Returns whether the mode is range grouping (Years, Value).

- `groupMode` (*string*) : Grouping mode.
- **returns**: boolean true for Years and Value.

## Fields

| Field | Type | Description |
|---|---|---|
| `groupModeFunctions` | table<string, function> | Functions (value) -> groupName, groupOrder for the non-range-based modes: Type, Brand, Country, Config Type, Derby Class, Body Style, Source. |
| `isRange` | table<string, boolean> | Range grouping modes: Years and Value. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua`.*
