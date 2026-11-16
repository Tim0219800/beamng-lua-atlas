# `ui_gameplaySelector_tileGenerators_discoverTiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua` · VM: Game Engine (GE) · 206 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileGenerators_discoverTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_discoverTiles")`, then the global `ui_gameplaySelector_tileGenerators_discoverTiles`

Tile generator of the gameplay selector for "quick-start experiences" (quickStartExperiences system). It reads the pages and cards from gameplay_discover.getDiscoverPages(), creates one tile per page, groups a page's cards into "Experiences" and "Challenges" (missions), and provides the details and the launch button of a card.

## Notes

- Pages with showMultiseatControllers or without cards produce no tile.
- A mission-type card with missionId receives the key mission_<id> and a showDetails.missionId (details handled by missionTiles); the others receive discover_<discoverId>.
- The launch button navigates to card.preStartRoute if it exists, otherwise calls gameplay_discover.startDiscover(discoverId) with a loading screen.

**Dependencies (loaded first):** `gameplay_discover`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey)` | Returns the tile groups of a discover page: a "discoverExperiences" group (non-mission cards) and a "discoverChallenges" group (mission cards), each only if it is not empty. Returns an empty table if the page is not found. | 106 |
| `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook called when the details are opened. If itemDetails.discoverId designates a known card, adds to details a block (title, description, preview, favorite, labels) with a "play" button that records the item as recent then launches the card. *(internal)* *(hook)* | 164 |
| `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend)` | Hook called when the selector collects its tiles. For the gameplaySelector backend only, adds a discoverPage tile per page containing at least one card, with gotoPath, sub-element count and official or mod icons. *(internal)* *(hook)* | 142 |

### Parameter details

#### `ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey)`

Returns the tile groups of a discover page: a "discoverExperiences" group (non-mission cards) and a "discoverChallenges" group (mission cards), each only if it is not empty. Returns an empty table if the page is not found.

- `pageKey` (*string*) : Page key (page.folder, otherwise page.title, otherwise its index).
- **returns**: table[] List of groups {key, label, tiles}.

#### `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook called when the details are opened. If itemDetails.discoverId designates a known card, adds to details a block (title, description, preview, favorite, labels) with a "play" button that records the item as recent then launches the card.

- `itemDetails` (*table*) : showDetails data (discoverId, key).
- `details` (*table*) : List of details blocks to complete.
- `buttonInstance` (*table*) : Object providing addButton.
- `backend` (*table*) : Backend offering isFavourite and trackRecent.

#### `ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend)`

Hook called when the selector collects its tiles. For the gameplaySelector backend only, adds a discoverPage tile per page containing at least one card, with gotoPath, sub-element count and official or mod icons.

- `items` (*table*) : List of tiles to complete.
- `backend` (*table*) : Calling backend.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: gameplay_discover. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua`.*
