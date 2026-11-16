# `ui_gameplaySelector_tileGenerators_levelTiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua` · VM: Game Engine (GE) · 357 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileGenerators_levelTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, then the global `ui_gameplaySelector_tileGenerators_levelTiles`

Tile generator of the freeroam selector: one tile per spawn point of each level in core_levels.getList(). It also builds a level's details panel (size, biome, roads, country…), the "Start Freeroam" and "Configure" buttons, search text filtering and the opening of the level configuration window. A modder can plug their own buttons into it via the hook onFreeroamSelectorGetDetails.

## Notes

- The tiles are valid for the freeroamSelector backend, not for gameplaySelector (validBackends). They are therefore added without a test on backend.backendName.
- If several spawn points of the same level are marked as default, an error "Default spawnpoint count is greater than 1" is logged.
- The level size is displayed in km (metric) or miles depending on the uiUnitLength setting; a negative dimension means "infinite".
- If backend.getCustomDetailsButtons() returns buttons, they entirely replace the default buttons.
- The tile of the level currently selected in freeroam_freeroamConfigurator receives cornerIcon = "road".

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result)` | Filter hook declared by the tiles (filterHook). If the search text, case-insensitively, appears in the level's biome, suggested use, characteristics, roads or country, sets result.match to true. *(internal)* *(hook)* | 280 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend)` | Hook called when the freeroam selector opens with stored details. Reopens the level configuration window with the level, the spawn point and itemDetails. *(internal)* *(hook)* | 335 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook called when a level tile's details are opened. Finds the level and its spawn point, fills in title, description, preview, favorite, specifications and labels, then adds the "Start Freeroam" (freeroam_freeroam.startFreeroamByName) and "Configure" (opens menu.freeroamconfigurator) buttons. Emits the hook onFreeroamSelectorGetDetails so that other extensions modify the data. *(internal)* *(hook)* | 185 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items)` | Hook called when the selector collects its tiles. Walks through the levels and, for each spawn point, adds a tile (name "point (level)", preview, key spawnPoint_<level>_<object>, region, map size, beamNG, Camshaft or bug icons). *(internal)* *(hook)* | 43 |
| `ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData)` | Triggers the UI event openLevelConfigurationPopup with the level data to display the configuration window. | 330 |
| `ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue)` | Sets the backend's default action: "configureFreeroam" if newValue is true, otherwise "startFreeroam" (via ui_gridSelector.setDisplayDataOption). Logs an error if backendName is missing. | 321 |

### Parameter details

#### `ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result)`

Filter hook declared by the tiles (filterHook). If the search text, case-insensitively, appears in the level's biome, suggested use, characteristics, roads or country, sets result.match to true.

- `item` (*table*) : Tile tested (field levelName used).
- `searchText` (*string|nil*) : Text entered; empty or nil, the function does nothing.
- `result` (*table*) : Table whose match field is set to true on a match.

#### `ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend)`

Hook called when the freeroam selector opens with stored details. Reopens the level configuration window with the level, the spawn point and itemDetails.

- `itemDetails` (*table|nil*) : Stored details; no effect if nil.
- `backend` (*table*) : Calling backend (unused, the name "freeroamSelector" is hardcoded).

#### `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook called when a level tile's details are opened. Finds the level and its spawn point, fills in title, description, preview, favorite, specifications and labels, then adds the "Start Freeroam" (freeroam_freeroam.startFreeroamByName) and "Configure" (opens menu.freeroamconfigurator) buttons. Emits the hook onFreeroamSelectorGetDetails so that other extensions modify the data.

- `itemDetails` (*table*) : showDetails data (levelName, spawnPointObjectName, key).
- `details` (*table*) : List of details blocks to complete.
- `buttonInstance` (*table*) : Object providing addButton.
- `backend` (*table*) : Backend offering isFavourite, trackRecent, getUiData and getCustomDetailsButtons.

#### `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items)`

Hook called when the selector collects its tiles. Walks through the levels and, for each spawn point, adds a tile (name "point (level)", preview, key spawnPoint_<level>_<object>, region, map size, beamNG, Camshaft or bug icons).

- `items` (*table*) : List of tiles to complete (modified in place).

#### `ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData)`

Triggers the UI event openLevelConfigurationPopup with the level data to display the configuration window.

- `levelData` (*table*) : Table with levelName, spawnPointObjectName, level, spawnPoint, backendName, itemDetails.

#### `ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue)`

Sets the backend's default action: "configureFreeroam" if newValue is true, otherwise "startFreeroam" (via ui_gridSelector.setDisplayDataOption). Logs an error if backendName is missing.

- `backendName` (*string*) : Selector backend name.
- `newValue` (*boolean*) : true to always show the configuration window.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFreeroamSelectorGetDetails`

**UI events (guihooks.trigger):** `openLevelConfigurationPopup`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua`.*
