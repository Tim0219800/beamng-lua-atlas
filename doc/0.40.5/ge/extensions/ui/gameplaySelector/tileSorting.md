# `ui_gameplaySelector_tileSorting`

*File: `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua` · VM: Game Engine (GE) · 292 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileSorting`: `extensions.load("ui_gameplaySelector_tileSorting")`, then the global `ui_gameplaySelector_tileSorting`

Centralized sorting of gameplay selector tiles. Provides four modes (Name, System, GameplayAutomatic, Date), the conversion of UI values ('name', 'automatic', 'date', 'system') to these modes and a fallback to 'Name' for any invalid value (with a warning log).

## Example

```lua
ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, 'date')
```

## Notes

- System order (SYSTEM_ORDER): freeroam 1, quickStartExperiences 2, challenges 3, scenarios 4, scenariosMultiplayer 5, campaigns 6, 'Other...' 7; unknown system = 999 (in GameplayAutomatic).
- Name: alphabetical sort on Name, name or label; the item whose name equals _tr('ui.menu.gridSelector.other') always goes last.
- GameplayAutomatic: tiles from clustering first (by name), then system order, then non-auxiliary before auxiliary, then the order property (missing = math.huge), then name.
- Date: most recent first; no date last; ties are sorted by name.
- BUG: sortByGameplayAutomatic uses OTHER_PLACEHOLDER, a global variable that is never defined (nil), so a missing system gives nil; the effect is the same as 999 because SYSTEM_ORDER[nil] is nil.
- BUG: the "Challenges" branch compares with a capital letter while the system is named 'challenges'; it is therefore never taken (the career sort compareCareerStatus is unused).
- In sortBySystem, an unknown system is placed after the known systems; if both are unknown and different, the function returns false.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue)` | Converts a UI value to an internal mode; 'Name' if nil, non-string or unknown (with a warning). | 246 |
| `ui_gameplaySelector_tileSorting.getSortFunction(sortMode)` | Returns the comparison function for a mode. Invalid or unknown mode: warning log and fallback to 'Name'. | 227 |
| `ui_gameplaySelector_tileSorting.isValidSortMode(sortMode)` | Returns whether the sort mode exists. | 242 |
| `ui_gameplaySelector_tileSorting.sortByDate(a, b)` | Comparator by descending date; no date last; name on ties. | 282 |
| `ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b)` | Multi-criteria comparator: clusters, system, auxiliary, order, name. | 278 |
| `ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)` | Alphabetical comparator, with the "Other" item always last. | 270 |
| `ui_gameplaySelector_tileSorting.sortBySystem(a, b)` | Comparator by system order, then by name when systems are equal. | 274 |
| `ui_gameplaySelector_tileSorting.sortGroup(group, sortMode)` | Sorts group.tiles in place with the given mode. | 287 |
| `ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode)` | Sorts the tile list in place (table.sort) with the given internal mode. | 265 |
| `ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue)` | Sorts the tile list in place from a UI value. | 260 |

### Parameter details

#### `ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue)`

Converts a UI value to an internal mode; 'Name' if nil, non-string or unknown (with a warning).

- `uiValue` (*string|nil*) : 'name', 'automatic', 'date' or 'system'.
- **returns**: string Internal mode.

#### `ui_gameplaySelector_tileSorting.getSortFunction(sortMode)`

Returns the comparison function for a mode. Invalid or unknown mode: warning log and fallback to 'Name'.

- `sortMode` (*string*) : 'Name', 'System', 'GameplayAutomatic' or 'Date'.
- **returns**: function function(a, b) -> boolean usable by table.sort.

#### `ui_gameplaySelector_tileSorting.isValidSortMode(sortMode)`

Returns whether the sort mode exists.

- `sortMode` (*string*) : Internal mode.
- **returns**: boolean true if valid.

#### `ui_gameplaySelector_tileSorting.sortByDate(a, b)`

Comparator by descending date; no date last; name on ties.

- `a` (*table*) : Tile or item (date field).
- `b` (*table*) : Tile or item.
- **returns**: boolean true if a must come before b.

#### `ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b)`

Multi-criteria comparator: clusters, system, auxiliary, order, name.

- `a` (*table*) : Tile or item (isClustered, system, isAuxiliary, order, name).
- `b` (*table*) : Tile or item.
- **returns**: boolean true if a must come before b.

#### `ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)`

Alphabetical comparator, with the "Other" item always last.

- `a` (*table*) : Tile or item.
- `b` (*table*) : Tile or item.
- **returns**: boolean true if a must come before b.

#### `ui_gameplaySelector_tileSorting.sortBySystem(a, b)`

Comparator by system order, then by name when systems are equal.

- `a` (*table*) : Tile or item (system field).
- `b` (*table*) : Tile or item (system field).
- **returns**: boolean true if a must come before b.

#### `ui_gameplaySelector_tileSorting.sortGroup(group, sortMode)`

Sorts group.tiles in place with the given mode.

- `group` (*table*) : Group containing a tiles list.
- `sortMode` (*string*) : Internal mode.

#### `ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode)`

Sorts the tile list in place (table.sort) with the given internal mode.

- `tiles` (*table[]*) : Tiles to sort (modified).
- `sortMode` (*string*) : Internal mode.

#### `ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue)`

Sorts the tile list in place from a UI value.

- `tiles` (*table[]*) : Tiles to sort (modified).
- `uiSortValue` (*string|nil*) : UI sort value.

## Fields

| Field | Type | Description |
|---|---|---|
| `SORT_MODE_TO_UI` | table<string, string> | Reverse mapping, computed at load time. |
| `SYSTEM_ORDER` | table<string, integer> | Rank of each gameplay system for sorting. |
| `UI_TO_SORT_MODE` | table<string, string> | UI value -> internal mode mapping (name, automatic, date, system). |
| `VALID_SORT_MODES` | string[] | {'Name', 'System', 'GameplayAutomatic', 'Date'}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua`.*
