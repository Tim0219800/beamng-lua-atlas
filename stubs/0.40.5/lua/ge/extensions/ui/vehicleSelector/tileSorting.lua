---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tile sorting functions of the vehicle selector according to the "Sort by" mode: Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h, Config Type. Each comparator breaks ties by name, placing "Other" last.
--- Access: extension `ui_vehicleSelector_tileSorting`: `extensions.load("ui_vehicleSelector_tileSorting")`, then the global `ui_vehicleSelector_tileSorting`
---@class ui_vehicleSelector_tileSorting
ui_vehicleSelector_tileSorting = {}

--- Returns the comparator of a sort mode; defaults to sorting by name.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:150
---@param sortMode string Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h or Config Type.
---@return function  Comparator (a, b) -> boolean.
function ui_vehicleSelector_tileSorting.getSortFunction(sortMode) end

--- Compares by config type according to the predefined order, then by name.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:171
---@param a table First item.
---@param b table Second item.
---@return boolean  true if a must come before b.
function ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b) end

--- Compares by name (Name, name or label); the item named like the (translated) "Other" label is always placed last.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:159
---@param a table First item.
---@param b table Second item.
---@return boolean  true if a must come before b.
function ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

--- Compares by price (Value, or its min bound if it is a range), then by name.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:163
---@param a table First item.
---@param b table Second item.
---@return boolean  true if a must come before b.
function ui_vehicleSelector_tileSorting.sortByValue(a, b) end

--- Compares by year (Years, or its min bound), then by name; missing year = math.huge.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:167
---@param a table First item.
---@param b table Second item.
---@return boolean  true if a must come before b.
function ui_vehicleSelector_tileSorting.sortByYears(a, b) end

--- Sorts the tiles of a group (group.tiles) in place according to the sort mode.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:176
---@param group table Group with a tiles field.
---@param sortMode string Sort mode.
function ui_vehicleSelector_tileSorting.sortGroup(group, sortMode) end

--- Sorts a list of tiles in place with the mode's comparator.
---Source: lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:154
---@param tiles table[] Tiles to sort.
---@param sortMode string Sort mode.
function ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode) end

