# `gameplay_crawl_crawlFlowgraphBridge`

*File: `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua` · VM: Game Engine (GE) · 314 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_crawlFlowgraphBridge`: `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, then the global `gameplay_crawl_crawlFlowgraphBridge`

Bridge between "crawl" mode (slow traversal of waypoint courses) and the flowgraph nodes / missions. It loads a trail from gameplay_crawl_saveSystem, configures it (zone, path, start position, prefabs), starts and stops the crawl on a vehicle via gameplay_crawl_general / gameplay_crawl_utils, and exposes the current state (time, points, node reached, disqualification) and the list of trails. Only one crawl is active at a time, stored in bridgeState.

## Example

```lua
local trail = gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)
if trail and gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail) then
  gameplay_crawl_crawlFlowgraphBridge.startCrawl()
end
```

## Notes

- Expected call order: loadCrawlTrail -> configureCrawl -> startCrawl; without configureCrawl, startCrawl fails ("No active trail configured").
- startCrawl without vehicleId uses be:getPlayerVehicle(0).
- stopCrawl and resetCrawl empty the bridge state (the active trail is forgotten).
- Inconsistency: getCrawlEndData reads state.isCompleting and state.events.disqualified (field reset to false as soon as the event is handled, so almost always false), while getCrawlRuntimeData reads state.isCompleted; the more recent flowgraphBridge.lua version uses state.isCompleted and state.isDisqualified. This file seems to be an old variant of flowgraphBridge.lua.
- When the crawl state no longer exists or is no longer active, getCrawlEndData and getCrawlRuntimeData return nil.
- getPenaltyTypes: boundaryViolation, drivingBackwards, gateTouch, vehicleReset, wrongDirection, skippedCheckpoint, vehicleFlippedUpright, dnf.
- The hook logs use eventData.time and eventData.points; these fields must therefore be provided.

**Dependencies (loaded first):** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType)` | Applies a penalty to the active crawler, with the number of points defined in gameplay_crawl_utils.infractionPoints. No effect if the crawl is inactive or the type unknown. | 243 |
| `gameplay_crawl_crawlFlowgraphBridge.cleanup()` | Stops the crawl if any and empties the bridge state. | 303 |
| `gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail)` | Prepares the active crawl from a trail: resolves its zone (boundaryId), its path (pathId) and its start position (startingPositionId); the zone and the path are mandatory. | 32 |
| `gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId()` | Returns the id of the crawling vehicle. | 223 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions()` | Lists all the start positions known to saveSystem. | 231 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllTrails()` | Lists all the trails known to saveSystem. | 227 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData()` | Returns an end-of-crawl summary for the active crawler. | 151 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData()` | Returns the crawl's current state. | 171 |
| `gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab: objects of a prefab carrying a given dynamic name. | 239 |
| `gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex()` | Returns the index of the active crawler's last recovery point. | 271 |
| `gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes()` | Returns the list of penalty types. | 267 |
| `gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId)` | Returns the player's statistics on a trail (saveSystem). | 235 |
| `gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId)` | Returns a trail's metadata (the one given, otherwise the active trail). | 193 |
| `gameplay_crawl_crawlFlowgraphBridge.isCrawlActive()` | Tells whether a crawl is active through this bridge. | 219 |
| `gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)` | Gets a trail by id from saveSystem. | 16 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData)` | Hook called when a path node is reached; logs index and time. *(internal)* *(hook)* | 295 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData)` | Hook called when the results are displayed; logs time and points. *(internal)* *(hook)* | 291 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted()` | Hook called when a crawl starts; only logs. *(internal)* *(hook)* | 287 |
| `gameplay_crawl_crawlFlowgraphBridge.resetCrawl()` | Resets the crawler data, teleports the vehicle to the trail's start position (orientation of the path's first node if available, spawn.safeTeleport) then stops the crawl. | 102 |
| `gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint)` | Sets the active crawler's recovery point. | 279 |
| `gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId)` | Starts the configured crawl on a vehicle (gameplay_crawl_general.startCrawl) and marks the bridge as active. | 59 |
| `gameplay_crawl_crawlFlowgraphBridge.stopCrawl()` | Stops the active crawl (gameplay_crawl_utils.stopCrawl) and resets the bridge state. | 86 |

### Parameter details

#### `gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType)`

Applies a penalty to the active crawler, with the number of points defined in gameplay_crawl_utils.infractionPoints. No effect if the crawl is inactive or the type unknown.

- `penaltyType` (*string*) : One of the types from getPenaltyTypes().

#### `gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail)`

Prepares the active crawl from a trail: resolves its zone (boundaryId), its path (pathId) and its start position (startingPositionId); the zone and the path are mandatory.

- `trail` (*table*) : Trail (name, boundaryId, pathId, startingPositionId, prefabs).
- **returns**: boolean true if the configuration is valid.

#### `gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId()`

Returns the id of the crawling vehicle.

- **returns**: integer|nil Vehicle id, nil if none.

#### `gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions()`

Lists all the start positions known to saveSystem.

- **returns**: table Start positions.

#### `gameplay_crawl_crawlFlowgraphBridge.getAllTrails()`

Lists all the trails known to saveSystem.

- **returns**: table Trails.

#### `gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData()`

Returns an end-of-crawl summary for the active crawler.

- **returns**: table|nil {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified}; nil if no active crawl.

#### `gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData()`

Returns the crawl's current state.

- **returns**: table|nil {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId}; nil if no active crawl.

#### `gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab: objects of a prefab carrying a given dynamic name.

- `prefabId` (*any*) : Prefab id.
- `dynamicName` (*string*) : Dynamic name searched.
- **returns**: table Objects found (inferred from code).

#### `gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex()`

Returns the index of the active crawler's last recovery point.

- **returns**: integer Index, 0 if no active crawl.

#### `gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes()`

Returns the list of penalty types.

- **returns**: string[] Penalty names.

#### `gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId)`

Returns the player's statistics on a trail (saveSystem).

- `trailId` (*string|integer*) : Trail id.
- **returns**: table|nil Statistics.

#### `gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId)`

Returns a trail's metadata (the one given, otherwise the active trail).

- `trailId` (*string|integer|nil*) : Trail id.
- **returns**: table|nil {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.

#### `gameplay_crawl_crawlFlowgraphBridge.isCrawlActive()`

Tells whether a crawl is active through this bridge.

- **returns**: boolean Active state.

#### `gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)`

Gets a trail by id from saveSystem.

- `trailId` (*string|integer*) : Trail id (exact type inferred from code).
- **returns**: table|nil The trail, or nil if the id is missing or unknown.

#### `gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData)`

Hook called when a path node is reached; logs index and time.

- `eventData` (*table*) : {pathnodeIndex, time}.

#### `gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData)`

Hook called when the results are displayed; logs time and points.

- `eventData` (*table*) : {time, points}.

#### `gameplay_crawl_crawlFlowgraphBridge.resetCrawl()`

Resets the crawler data, teleports the vehicle to the trail's start position (orientation of the path's first node if available, spawn.safeTeleport) then stops the crawl.

- **returns**: boolean true if the teleportation took place.

#### `gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint)`

Sets the active crawler's recovery point.

- `checkpoint` (*any*) : Waypoint (inferred from code).
- **returns**: boolean false if no active crawl; otherwise the result of gameplay_crawl_utils.setRecoveryCheckpoint.

#### `gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId)`

Starts the configured crawl on a vehicle (gameplay_crawl_general.startCrawl) and marks the bridge as active.

- `vehicleId` (*integer|nil*) : Vehicle id; player 0's vehicle if nil.
- **returns**: boolean true if launched.

#### `gameplay_crawl_crawlFlowgraphBridge.stopCrawl()`

Stops the active crawl (gameplay_crawl_utils.stopCrawl) and resets the bridge state.

- **returns**: boolean false if there was no active crawl.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: gameplay_crawl_saveSystem, general, utils, boundary, display. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua`.*
