# `ui_gameplaySelector_tileGenerators_scenarioTiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua` · VM: Game Engine (GE) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileGenerators_scenarioTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_scenarioTiles")`, then the global `ui_gameplaySelector_tileGenerators_scenarioTiles`

Gameplay selector tile generator for scenarios (legacy system). It adds one tile per scenario returned by scenario_scenariosLoader.getList and builds the details panel with a "Start Scenario" button. Local multiplayer scenarios are classified in the scenariosMultiplayer system.

## Notes

- Tiles are only added for the gameplaySelector backend. The "More Scenarios..." tile is commented out in the code and therefore does not exist.
- The details always display "Scenario system is outdated." (legacy system).
- The specifications include difficulty, authors, date, map, number of local players, objectives (goals) and additional attributes.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook called when a tile's details are opened. If itemDetails.scenarioSourceFile exists, loads the scenario and adds to details a block (title, description, preview, favorite, specifications, official, auxiliary, multiplayer, mod labels) with a "Start Scenario" button that records the item as recent and then calls scenario_scenariosLoader.start. *(internal)* *(hook)* | 148 |
| `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend)` | Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per scenario (translated name, preview, level, key scenario_<sourceFile>). A scenario whose playersCountRange.max exceeds 1 gets the helmets icon and the scenarioMultiplayer type; the beamNG and bug icons flag official and auxiliary scenarios. *(internal)* *(hook)* | 7 |

### Parameter details

#### `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook called when a tile's details are opened. If itemDetails.scenarioSourceFile exists, loads the scenario and adds to details a block (title, description, preview, favorite, specifications, official, auxiliary, multiplayer, mod labels) with a "Start Scenario" button that records the item as recent and then calls scenario_scenariosLoader.start.

- `itemDetails` (*table*) : Tile showDetails data (scenarioSourceFile, key).
- `details` (*table*) : List of details blocks to complete.
- `buttonInstance` (*table*) : Object providing addButton.
- `backend` (*table*) : Backend offering isFavourite and trackRecent.

#### `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend)`

Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per scenario (translated name, preview, level, key scenario_<sourceFile>). A scenario whose playersCountRange.max exceeds 1 gets the helmets icon and the scenarioMultiplayer type; the beamNG and bug icons flag official and auxiliary scenarios.

- `items` (*table*) : List of tiles to complete (modified in place).
- `backend` (*table*) : Calling backend; backendName must be "gameplaySelector".

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua`.*
