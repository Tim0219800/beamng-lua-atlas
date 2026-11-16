# `ui_gameplaySelector_tileGenerators_campaignTiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua` · VM: Game Engine (GE) · 177 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileGenerators_campaignTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_campaignTiles")`, then the global `ui_gameplaySelector_tileGenerators_campaignTiles`

Tile generator of the gameplay selector for campaigns (legacy system). It adds one tile per campaign returned by campaign_campaignsLoader.getList() and builds the details panel with a "Start Campaign" button. It is called via the hooks onGameplaySelectorGetTiles and onGameplaySelectorGetDetails.

## Notes

- Campaign tiles are only added for the gameplaySelector backend; the "More Campaigns..." tile is added for all backends (validBackends empty).
- The details always show the note "Campaign system is outdated.": the system is marked as legacy (isLegacy).
- Probable bug: order = -tonumber(campaign.date) or 0 evaluates as (-tonumber(date)) or 0, so the "or 0" does not protect against a nil date (arithmetic error on nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook called when the user opens a tile's details. If itemDetails.campaignSourceFile exists, loads the campaign and adds to details a block with title, description, preview, favorite, specifications (difficulty, authors, date, players, number of scenarios), labels (official, auxiliary, mod) and a "Start Campaign" button. This button records the item as recent, navigates to "play" and launches campaign_campaignsLoader.start. *(internal)* *(hook)* | 122 |
| `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend)` | Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per campaign (translated name, preview, level, beamNG or bug icons, key campaign_<sourceFile>). In all cases adds a "More Campaigns..." tile. *(internal)* *(hook)* | 7 |

### Parameter details

#### `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook called when the user opens a tile's details. If itemDetails.campaignSourceFile exists, loads the campaign and adds to details a block with title, description, preview, favorite, specifications (difficulty, authors, date, players, number of scenarios), labels (official, auxiliary, mod) and a "Start Campaign" button. This button records the item as recent, navigates to "play" and launches campaign_campaignsLoader.start.

- `itemDetails` (*table*) : Tile showDetails data (campaignSourceFile, key).
- `details` (*table*) : List of details blocks to complete.
- `buttonInstance` (*table*) : Object providing addButton to create the buttons.
- `backend` (*table*) : Backend offering isFavourite and trackRecent.

#### `ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend)`

Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per campaign (translated name, preview, level, beamNG or bug icons, key campaign_<sourceFile>). In all cases adds a "More Campaigns..." tile.

- `items` (*table*) : List of tiles to complete (modified in place).
- `backend` (*table*) : Calling backend; backendName must be "gameplaySelector" for the campaign tiles.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua`.*
