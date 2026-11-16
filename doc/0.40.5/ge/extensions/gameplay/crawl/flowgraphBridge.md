# `gameplay_crawl_flowgraphBridge`

*File: `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua` · VM: Game Engine (GE) · 326 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_flowgraphBridge`: `extensions.load("gameplay_crawl_flowgraphBridge")`, then the global `gameplay_crawl_flowgraphBridge`

Bridge between crawl mode (slow traversal of courses) and the missions' flowgraph nodes. It loads a trail from gameplay_crawl_saveSystem, prepares it (setupCrawl, with teleportation to the start), starts/stops/resets the crawl via gameplay_crawl_general and gameplay_crawl_utils, and exposes the crawl state (time, points, current node, disqualification, recoveries), the trail information and the management of penalties and recovery points. Unlike crawlFlowgraphBridge.lua, it keeps no state of its own: it reads gameplay_crawl_general.activeTrail and looks for the active crawler in gameplay_crawl_utils.getAllCrawlStates().

## Example

```lua
local b = gameplay_crawl_flowgraphBridge
local trail = b.loadCrawlTrail(trailId)
if trail and b.setupCrawl(nil, trail) then
  b.startCrawl(nil, trail)
end
```

## Notes

- Expected call order: loadCrawlTrail -> setupCrawl -> startCrawl. startCrawl fails if setupCrawl has not been called.
- setupCrawl teleports the vehicle to the start (isFromMission = true).
- startCrawl: if an active crawl has not started yet (crawlStarted false), simply resumes its timer (resumeCrawlTimer) instead of restarting.
- If vehicleId is nil, startCrawl tries the first crawler of gameplay_crawl_general.crawlersData, then player 0's vehicle; setupCrawl uses be:getPlayerVehicle(0).
- stopCrawl and resetCrawl pass force = true to the utils functions.
- resetCrawl does not stop the crawl: it resets the data and teleports to the start.
- Penalty types: boundaryViolation, drivingBackwards, gateTouch, vehicleReset, wrongDirection, skippedCheckpoint, vehicleFlippedUpright, dnf.
- The hooks onCrawlStarted, onCrawlResultsShown and onCrawlPathnodeReached are empty here (they exist so that flowgraph nodes can subscribe to them via extensions.hook).

**Dependencies (loaded first):** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType)` | Applies a penalty to the active crawler with the points from gameplay_crawl_utils.infractionPoints[penaltyType]. No effect if there is no active crawler or if the type is unknown. | 250 |
| `gameplay_crawl_flowgraphBridge.cleanup()` | Stops the active crawl if there is one. | 319 |
| `gameplay_crawl_flowgraphBridge.getActiveCrawlerId()` | Returns the id of the first crawler whose state is active. | 230 |
| `gameplay_crawl_flowgraphBridge.getAllStartingPositions()` | Lists all starting positions (saveSystem). | 238 |
| `gameplay_crawl_flowgraphBridge.getAllTrails()` | Lists all trails (saveSystem). | 234 |
| `gameplay_crawl_flowgraphBridge.getCrawlEndData()` | Summary of the active crawler's crawl. | 155 |
| `gameplay_crawl_flowgraphBridge.getCrawlRuntimeData()` | Current state of the active crawl. | 177 |
| `gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab. | 246 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint()` | Last recovery point of the active crawler. | 279 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex()` | Index of the last recovery point of the active crawler. | 288 |
| `gameplay_crawl_flowgraphBridge.getPenaltyTypes()` | List of penalty types. | 275 |
| `gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId)` | Player statistics on a trail (saveSystem). | 242 |
| `gameplay_crawl_flowgraphBridge.getTrailInfo(trailId)` | Metadata of a trail (the one given, otherwise the active trail). | 200 |
| `gameplay_crawl_flowgraphBridge.isCrawlActive()` | Indicates whether a trail is active in gameplay_crawl_general. | 226 |
| `gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId)` | Gets a trail by id from saveSystem. | 21 |
| `gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData)` | Hook called when a path node is reached: empty body. *(internal)* *(hook)* | 312 |
| `gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData)` | Hook called when the results are shown: empty body. *(internal)* *(hook)* | 309 |
| `gameplay_crawl_flowgraphBridge.onCrawlStarted()` | Hook called when a crawl starts: empty body. *(internal)* *(hook)* | 306 |
| `gameplay_crawl_flowgraphBridge.resetCrawl()` | Resets the active crawler's data and teleports its vehicle to the trail's starting position (spawn.safeTeleport). | 121 |
| `gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint)` | Sets the active crawler's recovery point. | 297 |
| `gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail)` | Prepares a crawl: stops any crawl in progress, then calls gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, path, start, prefabs, teleport to the start). | 36 |
| `gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail)` | Starts the prepared crawl (gameplay_crawl_general.startCrawlFlowgraph) or resumes the timer of a crawl that is already ready. | 66 |
| `gameplay_crawl_flowgraphBridge.stopCrawl()` | Stops the active crawl (gameplay_crawl_utils.stopCrawl(true)). | 112 |

### Parameter details

#### `gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType)`

Applies a penalty to the active crawler with the points from gameplay_crawl_utils.infractionPoints[penaltyType]. No effect if there is no active crawler or if the type is unknown.

- `penaltyType` (*string*) : One of the types from getPenaltyTypes().

#### `gameplay_crawl_flowgraphBridge.getActiveCrawlerId()`

Returns the id of the first crawler whose state is active.

- **returns**: integer|nil Vehicle id.

#### `gameplay_crawl_flowgraphBridge.getAllStartingPositions()`

Lists all starting positions (saveSystem).

- **returns**: table Start positions.

#### `gameplay_crawl_flowgraphBridge.getAllTrails()`

Lists all trails (saveSystem).

- **returns**: table Trails.

#### `gameplay_crawl_flowgraphBridge.getCrawlEndData()`

Summary of the active crawler's crawl.

- **returns**: table|nil {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified, recoveries}; nil if no active crawl.

#### `gameplay_crawl_flowgraphBridge.getCrawlRuntimeData()`

Current state of the active crawl.

- **returns**: table|nil {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId}; nil if no active crawl.

#### `gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab.

- `prefabId` (*any*) : Prefab id.
- `dynamicName` (*string*) : Dynamic name searched.
- **returns**: table Objects found (inferred from code).

#### `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint()`

Last recovery point of the active crawler.

- **returns**: table|nil Recovery point (inferred from code); nil if no active crawler.

#### `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex()`

Index of the last recovery point of the active crawler.

- **returns**: integer Index, 0 if no active crawler.

#### `gameplay_crawl_flowgraphBridge.getPenaltyTypes()`

List of penalty types.

- **returns**: string[] Penalty names.

#### `gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId)`

Player statistics on a trail (saveSystem).

- `trailId` (*string*) : Trail id.
- **returns**: table|nil Statistics.

#### `gameplay_crawl_flowgraphBridge.getTrailInfo(trailId)`

Metadata of a trail (the one given, otherwise the active trail).

- `trailId` (*string|nil*) : Trail id.
- **returns**: table|nil {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.

#### `gameplay_crawl_flowgraphBridge.isCrawlActive()`

Indicates whether a trail is active in gameplay_crawl_general.

- **returns**: boolean true if activeTrail exists.

#### `gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId)`

Gets a trail by id from saveSystem.

- `trailId` (*string*) : Id (file path) of the trail.
- **returns**: table|nil The trail, or nil if absent.

#### `gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData)`

Hook called when a path node is reached: empty body.

- `eventData` (*table*) : Event data.

#### `gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData)`

Hook called when the results are shown: empty body.

- `eventData` (*table*) : Event data.

#### `gameplay_crawl_flowgraphBridge.resetCrawl()`

Resets the active crawler's data and teleports its vehicle to the trail's starting position (spawn.safeTeleport).

- **returns**: boolean true if reset and teleported.

#### `gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint)`

Sets the active crawler's recovery point.

- `checkpoint` (*any*) : Waypoint (inferred from code).
- **returns**: boolean false if no active crawler, otherwise the result of utils.setRecoveryCheckpoint.

#### `gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail)`

Prepares a crawl: stops any crawl in progress, then calls gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, path, start, prefabs, teleport to the start).

- `vehicleId` (*integer|nil*) : Vehicle id; player 0's vehicle if nil.
- `trail` (*table*) : Trail to prepare.
- **returns**: boolean true if the preparation succeeded.

#### `gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail)`

Starts the prepared crawl (gameplay_crawl_general.startCrawlFlowgraph) or resumes the timer of a crawl that is already ready.

- `vehicleId` (*integer|nil*) : Vehicle id.
- `trail` (*table|nil*) : Trail; otherwise the active trail of general.
- **returns**: boolean true if the crawl is started.

#### `gameplay_crawl_flowgraphBridge.stopCrawl()`

Stops the active crawl (gameplay_crawl_utils.stopCrawl(true)).

- **returns**: boolean false if there was no active trail.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: gameplay_crawl_saveSystem, general, utils, boundary, display. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua`.*
