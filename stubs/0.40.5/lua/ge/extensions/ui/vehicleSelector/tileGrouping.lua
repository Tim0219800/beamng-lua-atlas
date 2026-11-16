---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Determines in which groups (grid sections) a vehicle config appears according to the selector's "Group by" mode: Type, Brand, Country, Config Type, Derby Class, Body Style, Source, as well as Years (by decade) and Value (by price range). Also adds the special Favorites and Recents groups. Used by ui_vehicleSelector_tiles.
--- Access: extension `ui_vehicleSelector_tileGrouping`: `extensions.load("ui_vehicleSelector_tileGrouping")`, then the global `ui_vehicleSelector_tileGrouping`
---@class ui_vehicleSelector_tileGrouping
---@field groupModeFunctions table<string, function> Functions (value) -> groupName, groupOrder for the non-range-based modes: Type, Brand, Country, Config Type, Derby Class, Body Style, Source.
---@field isRange table<string, boolean> Range grouping modes: Years and Value.
ui_vehicleSelector_tileGrouping = {}

--- Reads a property on the config, or failing that on the model (core_vehicles.getModel).
---Source: lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:102
---@param config table Config (with model_key).
---@param prop string Property name.
---@return any  Value or nil.
function ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop) end

--- Returns the grouping function of a non-range-based mode.
---Source: lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:151
---@param groupMode string Grouping mode.
---@return function|nil  Function or nil.
function ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode) end

--- Returns the list of groups of a config for a grouping mode, with the Favorites and Recents groups if applicable. A missing value is classified under "Other".
---Source: lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:115
---@param config table Vehicle config.
---@param groupMode string Grouping mode (Type, Brand, Years, Value, ...).
---@param displayData table Display options (showFavouritesMode, showRecentMode).
---@return table[]  List of {groupName, groupOrder, isFavouriteGroup?, isRecentGroup?}.
function ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData) end

--- Returns the function that splits a value into groups for Years or Value.
---Source: lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:156
---@param groupMode string 'Years' or 'Value'.
---@return function|nil  Function or nil.
function ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode) end

--- Returns whether the mode is range grouping (Years, Value).
---Source: lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:146
---@param groupMode string Grouping mode.
---@return boolean  true for Years and Value.
function ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode) end

