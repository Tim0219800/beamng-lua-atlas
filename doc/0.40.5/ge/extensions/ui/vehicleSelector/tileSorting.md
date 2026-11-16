# `ui_vehicleSelector_tileSorting`

*File: `lua/ge/extensions/ui/vehicleSelector/tileSorting.lua` · VM: Game Engine (GE) · 181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_tileSorting`: `extensions.load("ui_vehicleSelector_tileSorting")`, then the global `ui_vehicleSelector_tileSorting`

Tile sorting functions of the vehicle selector according to the "Sort by" mode: Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h, Config Type. Each comparator breaks ties by name, placing "Other" last.

## Notes

- The comparators are table.sort style: function (a, b) -> boolean, on tiles or configs (fields Name/name/label, Value, Years, Weight, ...).
- Sort direction: Weight, Top Speed, Power, Value, Years are ascending. Weight/Power and the 0-60 mph / 0-100 km/h times are sorted in descending order of the value (from the code: `>`), with missing values being math.huge.
- Config Type follows the fixed order Factory, Service, Race, Drift, Rally, Police, Custom, Powerglow, Other...; unknown types come after.
- An unknown sortMode (including 'Automatic') falls back to sorting by name.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_tileSorting.getSortFunction(sortMode)` | Returns the comparator of a sort mode; defaults to sorting by name. | 150 |
| `ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b)` | Compares by config type according to the predefined order, then by name. | 171 |
| `ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)` | Compares by name (Name, name or label); the item named like the (translated) "Other" label is always placed last. | 159 |
| `ui_vehicleSelector_tileSorting.sortByValue(a, b)` | Compares by price (Value, or its min bound if it is a range), then by name. | 163 |
| `ui_vehicleSelector_tileSorting.sortByYears(a, b)` | Compares by year (Years, or its min bound), then by name; missing year = math.huge. | 167 |
| `ui_vehicleSelector_tileSorting.sortGroup(group, sortMode)` | Sorts the tiles of a group (group.tiles) in place according to the sort mode. | 176 |
| `ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode)` | Sorts a list of tiles in place with the mode's comparator. | 154 |

### Parameter details

#### `ui_vehicleSelector_tileSorting.getSortFunction(sortMode)`

Returns the comparator of a sort mode; defaults to sorting by name.

- `sortMode` (*string*) : Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h or Config Type.
- **returns**: function Comparator (a, b) -> boolean.

#### `ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b)`

Compares by config type according to the predefined order, then by name.

- `a` (*table*) : First item.
- `b` (*table*) : Second item.
- **returns**: boolean true if a must come before b.

#### `ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)`

Compares by name (Name, name or label); the item named like the (translated) "Other" label is always placed last.

- `a` (*table*) : First item.
- `b` (*table*) : Second item.
- **returns**: boolean true if a must come before b.

#### `ui_vehicleSelector_tileSorting.sortByValue(a, b)`

Compares by price (Value, or its min bound if it is a range), then by name.

- `a` (*table*) : First item.
- `b` (*table*) : Second item.
- **returns**: boolean true if a must come before b.

#### `ui_vehicleSelector_tileSorting.sortByYears(a, b)`

Compares by year (Years, or its min bound), then by name; missing year = math.huge.

- `a` (*table*) : First item.
- `b` (*table*) : Second item.
- **returns**: boolean true if a must come before b.

#### `ui_vehicleSelector_tileSorting.sortGroup(group, sortMode)`

Sorts the tiles of a group (group.tiles) in place according to the sort mode.

- `group` (*table*) : Group with a tiles field.
- `sortMode` (*string*) : Sort mode.

#### `ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode)`

Sorts a list of tiles in place with the mode's comparator.

- `tiles` (*table[]*) : Tiles to sort.
- `sortMode` (*string*) : Sort mode.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/tileSorting.lua`.*
