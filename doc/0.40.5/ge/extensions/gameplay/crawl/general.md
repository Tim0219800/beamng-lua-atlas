# `gameplay_crawl_general`

*File: `lua/ge/extensions/gameplay/crawl/general.lua` · VM: Game Engine (GE) · 519 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_general`: `extensions.load("gameplay_crawl_general")`, then the global `gameplay_crawl_general`

Core of the crawl mode (slow trail traversal) on the freeroam/career side: keeps the active trail (activeTrail: trail, zone, copied path, start, prefabs) and the list of crawler data, prepares a trail (setupCrawl, with optional path reversal), starts the crawl in freeroam or from a flowgraph, and calls gameplay_crawl_utils.updateCrawl every frame. It also provides the points of interest (start markers, map), the activity windows, the drawing of the zone on the minimap, and records the scores at the end. It handles the local multiplayer case (multiseat).

## Example

```lua
gameplay_crawl_general.startCrawlFreeroam(trail, be:getPlayerVehicle(0))
```

## Notes

- Only one active trail at a time (M.activeTrail). If trail.pathReversed is true, the path is copied, reversed and each rotation is turned by 180 degrees around Z; the starting position becomes trail.startingPositionIdReversed, or the first reversed node (radius 10 m).
- Trails appear in the game only if career is active or if the enableCrawlInFreeroam setting is true (onGetRawPoiListForLevel).
- In multiseat, entering the start zone automatically starts the crawl, unless a multiseat game mode is active or the trails differ.
- M.crawlersData and its local copy point to the same table; clear empties it with table.clear, so the variable must not be reassigned.
- When a vehicle is changed or destroyed in freeroam (trail not from a mission), its crawler is cleaned up; the trail is cleared when no crawler exists anymore.
- onCrawlResultsShown records the score (time, points) via saveSystem.addNewPlayerScore.
- Emitted hooks: onCrawlStarted({trail = trail}).

**Dependencies (loaded first):** `gameplay_crawl_saveSystem`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_general.clear(force)` | Unloads the prefabs of the active trail, forgets the trail, cleans up gameplay_crawl_utils and empties crawlersData. | 38 |
| `gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData)` | Activity window hook: for a 'crawl' POI, adds a card (distance, positive/negative elevation change, best points, best time, attempts) and a "Play" button that runs startCrawlFreeroam on the player's vehicle. *(internal)* *(hook)* | 302 |
| `gameplay_crawl_general.onActivityIndexVisible(data)` | Hook called when an activity is shown/hidden in the index: prepares the trail and its path markers for a crawl POI, or cleans up if data is nil. *(internal)* *(hook)* | 385 |
| `gameplay_crawl_general.onAnyMissionChanged(status, id)` | Hook called when a mission's state changes: cleans everything up if it goes to 'stopped'. *(internal)* *(hook)* | 464 |
| `gameplay_crawl_general.onCrawlCleared()` | Hook emitted by utils.clear() at the end of each crawl: empties crawlersData and clears the raw POIs to show the start marker again. *(internal)* *(hook)* | 470 |
| `gameplay_crawl_general.onCrawlResultsShown(eventData)` | Hook called when the results are shown: records the player's time and points for the active trail. *(internal)* *(hook)* | 480 |
| `gameplay_crawl_general.onDrawOnMinimap(td)` | Hook called to draw on the minimap: draws the zone of the active trail. *(internal)* *(hook)* | 424 |
| `gameplay_crawl_general.onExtensionLoaded()` | Hook called on load: cleans up the state and creates the player's save folders. *(internal)* *(hook)* | 433 |
| `gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook collecting the points of interest of a level: for each trail (folder /levels/<level>/crawls/) adds a 'crawl' type POI with an invisible trigger, a start marker and a map marker (name, thumbnail, best points) as long as no trail is active. *(internal)* *(hook)* | 229 |
| `gameplay_crawl_general.onMPSessionChanged(old, new)` | Hook called on multiplayer session change: loads gameplay_crawl_freeroamMultiplayer at session start and unloads it at the end. *(internal)* *(hook)* | 492 |
| `gameplay_crawl_general.onSerialize()` | Hook called before extensions reload: cleans up the state. *(internal)* *(hook)* | 438 |
| `gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: advances the active crawl (gameplay_crawl_utils.updateCrawl). *(internal)* *(hook)* | 209 |
| `gameplay_crawl_general.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed: removes its crawler (non-mission trail). *(internal)* *(hook)* | 453 |
| `gameplay_crawl_general.onVehicleSwitched(oldId, newId, player)` | Hook called when the controlled vehicle changes: removes the crawler from the old vehicle (non-mission trail) and cleans up if none remain. *(internal)* *(hook)* | 442 |
| `gameplay_crawl_general.setupCrawl(trail, veh, isFromMission)` | Prepares a trail: stops the previous crawl, resolves zone, path and start from saveSystem, handles reversal, creates the crawler data, loads the prefabs and, if isFromMission, teleports the vehicle to the starting position. | 49 |
| `gameplay_crawl_general.startCrawlFlowgraph(trail, veh)` | Starts a crawl from a flowgraph. If the same trail (same name) is already prepared, reuses it; otherwise calls setupCrawl(trail, veh, true). Emits onCrawlStarted. | 169 |
| `gameplay_crawl_general.startCrawlFreeroam(trail, veh)` | Starts a crawl in freeroam. In multiseat with the same trail already active, simply adds the vehicle to the crawl; otherwise prepares the trail then calls gameplay_crawl_utils.startCrawl, emits onCrawlStarted and clears the raw POIs. | 131 |

### Parameter details

#### `gameplay_crawl_general.clear(force)`

Unloads the prefabs of the active trail, forgets the trail, cleans up gameplay_crawl_utils and empties crawlersData.

- `force` (*boolean|nil*) : Passed to gameplay_crawl_utils.clear.

#### `gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData)`

Activity window hook: for a 'crawl' POI, adds a card (distance, positive/negative elevation change, best points, best time, attempts) and a "Play" button that runs startCrawlFreeroam on the player's vehicle.

- `elemData` (*table*) : Data of the selected items.
- `activityData` (*table*) : List of cards to complete.

#### `gameplay_crawl_general.onActivityIndexVisible(data)`

Hook called when an activity is shown/hidden in the index: prepares the trail and its path markers for a crawl POI, or cleans up if data is nil.

- `data` (*table|nil*) : POI data (type, trailId); nil when the index closes.

#### `gameplay_crawl_general.onAnyMissionChanged(status, id)`

Hook called when a mission's state changes: cleans everything up if it goes to 'stopped'.

- `status` (*string*) : Mission state.
- `id` (*any*) : Mission concerned.

#### `gameplay_crawl_general.onCrawlResultsShown(eventData)`

Hook called when the results are shown: records the player's time and points for the active trail.

- `eventData` (*table*) : {time, points}.

#### `gameplay_crawl_general.onDrawOnMinimap(td)`

Hook called to draw on the minimap: draws the zone of the active trail.

- `td` (*table*) : Minimap drawing object.

#### `gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook collecting the points of interest of a level: for each trail (folder /levels/<level>/crawls/) adds a 'crawl' type POI with an invisible trigger, a start marker and a map marker (name, thumbnail, best points) as long as no trail is active.

- `levelIdentifier` (*string*) : Level name.
- `elements` (*table*) : POI list to complete.

#### `gameplay_crawl_general.onMPSessionChanged(old, new)`

Hook called on multiplayer session change: loads gameplay_crawl_freeroamMultiplayer at session start and unloads it at the end.

- `old` (*any*) : Old session (nil/false if none).
- `new` (*any*) : New session.

#### `gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: advances the active crawl (gameplay_crawl_utils.updateCrawl).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_crawl_general.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed: removes its crawler (non-mission trail).

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_crawl_general.onVehicleSwitched(oldId, newId, player)`

Hook called when the controlled vehicle changes: removes the crawler from the old vehicle (non-mission trail) and cleans up if none remain.

- `oldId` (*integer*) : Id of the old vehicle.
- `newId` (*integer*) : Id of the new vehicle.
- `player` (*integer*) : Player index.

#### `gameplay_crawl_general.setupCrawl(trail, veh, isFromMission)`

Prepares a trail: stops the previous crawl, resolves zone, path and start from saveSystem, handles reversal, creates the crawler data, loads the prefabs and, if isFromMission, teleports the vehicle to the starting position.

- `trail` (*table*) : Trail (boundaryId, pathId, startingPositionId, pathReversed, prefabs, name).
- `veh` (*userdata*) : Vehicle object.
- `isFromMission` (*boolean|nil*) : True if started by a mission/flowgraph.
- **returns**: boolean false if zone or path are missing or if trail/veh is nil.

#### `gameplay_crawl_general.startCrawlFlowgraph(trail, veh)`

Starts a crawl from a flowgraph. If the same trail (same name) is already prepared, reuses it; otherwise calls setupCrawl(trail, veh, true). Emits onCrawlStarted.

- `trail` (*table*) : Trail to start.
- `veh` (*userdata*) : Vehicle object.
- **returns**: boolean true if the crawl started.

#### `gameplay_crawl_general.startCrawlFreeroam(trail, veh)`

Starts a crawl in freeroam. In multiseat with the same trail already active, simply adds the vehicle to the crawl; otherwise prepares the trail then calls gameplay_crawl_utils.startCrawl, emits onCrawlStarted and clears the raw POIs.

- `trail` (*table*) : Trail to start.
- `veh` (*userdata*) : Vehicle object.

## Fields

| Field | Type | Description |
|---|---|---|
| `activeTrail` | table|nil | Active trail: {trail, boundary, path, startingPosition, prefabs, isFromMission}; nil if none. |
| `crawlersData` | table<integer, table> | List of crawler data (created by gameplay_crawl_utils.setupCrawlerData) of the active trail. |
| `dependencies` | table<integer, string> | Extensions loaded beforehand: gameplay_crawl_saveSystem, utils, boundary, display. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCrawlStarted` — listened to by 6 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`

**Loads extensions:** `gameplay_crawl_freeroamMultiplayer`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/general.lua`.*
