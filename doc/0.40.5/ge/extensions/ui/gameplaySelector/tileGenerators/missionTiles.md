# `ui_gameplaySelector_tileGenerators_missionTiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua` · VM: Game Engine (GE) · 279 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileGenerators_missionTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_missionTiles")`, then the global `ui_gameplaySelector_tileGenerators_missionTiles`

Gameplay selector tile generator for missions ("challenges" system). It adds one tile per mission from gameplay_missions_missions.getFilesData(true), computes its type label (dragster race, time trial, gymkhana...) and builds the details panel with a start button.

## Notes

- A career-only mission (showInCareer without showInFreeroam) is sorted by unlock depth (gameplay_missions_unlocks.getForwardMissionInfo) and gets the cup icon; otherwise the order is -date.
- Type labels: table missionTypeLabelByType for dragStripRace, dragStripAPM, generatedTimeTrial, simpleLapconfigScenario and flowgraph; drift missions other than "A to B" and avalanche without a target zone are labeled gymkhana; otherwise bigMap.missionLabels.<missionType>.
- The "moreMissions" tile is added for all backends (empty validBackends).
- The details labels use mission.missionTypeLabel, which may be nil (the computed label is only stored in the tile): it then falls back to the raw missionType.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook called when the details are opened. If itemDetails.missionId refers to a known mission, adds a block (title, description, preview, favorite, general and career specifications, labels) with a start button that calls gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector"). *(internal)* *(hook)* | 213 |
| `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend)` | Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per mission (name, preview, type, subgroup, level, beamNG icons, bug, cup, key mission_<id>). Always adds the "moreMissions" tile. *(internal)* *(hook)* | 25 |

### Parameter details

#### `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook called when the details are opened. If itemDetails.missionId refers to a known mission, adds a block (title, description, preview, favorite, general and career specifications, labels) with a start button that calls gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector").

- `itemDetails` (*table*) : showDetails data (missionId, key).
- `details` (*table*) : List of details blocks to complete.
- `buttonInstance` (*table*) : Object providing addButton.
- `backend` (*table*) : Backend offering isFavourite and trackRecent.

#### `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend)`

Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per mission (name, preview, type, subgroup, level, beamNG icons, bug, cup, key mission_<id>). Always adds the "moreMissions" tile.

- `items` (*table*) : List of tiles to complete.
- `backend` (*table*) : Calling backend; backendName must be "gameplaySelector".

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua`.*
