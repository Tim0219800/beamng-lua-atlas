---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Centralized sorting of gameplay selector tiles. Provides four modes (Name, System, GameplayAutomatic, Date), the conversion of UI values ('name', 'automatic', 'date', 'system') to these modes and a fallback to 'Name' for any invalid value (with a warning log).
--- Access: extension `ui_gameplaySelector_tileSorting`: `extensions.load("ui_gameplaySelector_tileSorting")`, then the global `ui_gameplaySelector_tileSorting`
---@class ui_gameplaySelector_tileSorting
---@field SORT_MODE_TO_UI table<string, string> Reverse mapping, computed at load time.
---@field SYSTEM_ORDER table<string, integer> Rank of each gameplay system for sorting.
---@field UI_TO_SORT_MODE table<string, string> UI value -> internal mode mapping (name, automatic, date, system).
---@field VALID_SORT_MODES string[] {'Name', 'System', 'GameplayAutomatic', 'Date'}.
ui_gameplaySelector_tileSorting = {}

--- Converts a UI value to an internal mode; 'Name' if nil, non-string or unknown (with a warning).
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:246
---@param uiValue string|nil 'name', 'automatic', 'date' or 'system'.
---@return string  Internal mode.
function ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue) end

--- Returns the comparison function for a mode. Invalid or unknown mode: warning log and fallback to 'Name'.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:227
---@param sortMode string 'Name', 'System', 'GameplayAutomatic' or 'Date'.
---@return function  function(a, b) -> boolean usable by table.sort.
function ui_gameplaySelector_tileSorting.getSortFunction(sortMode) end

--- Returns whether the sort mode exists.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:242
---@param sortMode string Internal mode.
---@return boolean  true if valid.
function ui_gameplaySelector_tileSorting.isValidSortMode(sortMode) end

--- Comparator by descending date; no date last; name on ties.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:282
---@param a table Tile or item (date field).
---@param b table Tile or item.
---@return boolean  true if a must come before b.
function ui_gameplaySelector_tileSorting.sortByDate(a, b) end

--- Multi-criteria comparator: clusters, system, auxiliary, order, name.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:278
---@param a table Tile or item (isClustered, system, isAuxiliary, order, name).
---@param b table Tile or item.
---@return boolean  true if a must come before b.
function ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b) end

--- Alphabetical comparator, with the "Other" item always last.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:270
---@param a table Tile or item.
---@param b table Tile or item.
---@return boolean  true if a must come before b.
function ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

--- Comparator by system order, then by name when systems are equal.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:274
---@param a table Tile or item (system field).
---@param b table Tile or item (system field).
---@return boolean  true if a must come before b.
function ui_gameplaySelector_tileSorting.sortBySystem(a, b) end

--- Sorts group.tiles in place with the given mode.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:287
---@param group table Group containing a tiles list.
---@param sortMode string Internal mode.
function ui_gameplaySelector_tileSorting.sortGroup(group, sortMode) end

--- Sorts the tile list in place (table.sort) with the given internal mode.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:265
---@param tiles table[] Tiles to sort (modified).
---@param sortMode string Internal mode.
function ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode) end

--- Sorts the tile list in place from a UI value.
---Source: lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:260
---@param tiles table[] Tiles to sort (modified).
---@param uiSortValue string|nil UI sort value.
function ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue) end

