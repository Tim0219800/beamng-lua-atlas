# `gameplay_crawl_utils`

*File: `lua/ge/extensions/gameplay/crawl/utils.lua` · VM: Game Engine (GE) · 2071 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_utils`: `extensions.load("gameplay_crawl_utils")`, then the global `gameplay_crawl_utils`

Execution engine of the crawl mode (slow traversal of a trail with waypoints). It keeps the state of each crawler (crawlStates, keyed by vehicle id): current node, nodes cleared or skipped, timer, penalty points, events, recovery point, disqualification. Every frame, updateCrawl advances the timer, reads the vehicle position, detects reached nodes (2D test on the bounding box center, with a direction check if the node has a rotation), checks the boundary zone (gameplay_crawl_boundary), infractions (driving backwards, touching dynamic gates) and the DNF threshold. It also manages the 3D gate markers (shared or per player in split screen), the dotted preview line, the loading of the trail's prefabs, the integration with core_lapTimes and vehicle resets. The scoring table is in infractionPoints.

## Example

```lua
gameplay_crawl_utils.setDebugDraw(true)  -- shows path, zone and start of the active trail
```

## Notes

- Default scale (points, lower = better): drivingBackwards 1, vehicleFlippedUpright 5, gateTouch 10, vehicleReset 10, boundaryViolation 10, wrongDirection 10, skippedCheckpoint 10, dnf 50, gateCleared -2, bonusGateCleared -15. The total never goes below 0.
- DNF: reached when points >= trail.rules.dnfPointLimit (if > 0), otherwise 50. trail.rules.penalties == false disables all penalties (hasPenalties).
- Cooldowns (s): drivingBackwards 5, boundaryViolation 3. Driving backwards: dot product of velocity/direction (2D) < -0.5; penalty after cumulative distance > 2.
- Clearing a node: the bounding box center (bbCenter) must be within the radius (4.0 m by default) in XY; if the node has a rotation, the vehicle must face and (above 1 m/s) drive in the direction (dot product > 0.5). Only nodes current-1 to current+1 are tested; skipping a node (non-bonus) costs skippedCheckpoint per skipped node. Without penalties, one can only advance in order (except bonus).
- A finished crawl (last node) triggers onCrawlResultsShown, unlocks the CHALLENGE_CRAWL achievement, and the crawler is removed 3 s later (completionDelay) unless it comes from a mission.
- Vehicle reset: with trail.rules.recovery.mode == 'lastGate', the reset key sends back to the last cleared node (or to the start) with the vehicleReset penalty (recoverToLastGate); otherwise, a detected teleport (> 1 m) outside a mission causes an immediate DNF, and in a mission a vehicleFlippedUpright penalty.
- The extension replaces commands.dropPlayerAtCameraNoReset to count a reset; the original function is restored in onExtensionUnloaded.
- Marker modes: inactive, final, skipped, current, bonus, recovery, finished (aggregation priority for a shared camera: finished > bonus = recovery > current > skipped > final > inactive).
- Probable bug: calculatePathStats ignores pathReversed (the loop reassigns the local index i with no effect) and the cache is keyed by pathId alone; elevation gain and loss are therefore not swapped for a reversed trail.
- Inconsistency: if core_lapTimes is not yet loaded when this file is read, the local variable core_lapTimes stays nil for the whole session.
- drawMarkers reads the global photoModeOpen, presumably defined elsewhere.
- Emitted hooks: onCrawlPenaltyScoreChanged({crawlerId, penaltyScore, oldPenaltyScore}), onCrawlPathnodeReached({crawlerId, pathnodeId, pathnodeIndex, time, pathnodeTimings}), onCrawlResultsShown({crawlerId, time, points}), onCrawlDisqualified({crawlerId}), showDisqualifiedMessage({crawlerId, time}), onCrawlCleared().

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_utils.activateCrawlMarkers()` | Activates the first marker ('current') of the active path and leaves preview mode. | 540 |
| `gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points)` | Adds points to the crawler (negative = bonus; total clamped to 0), emits onCrawlPenaltyScoreChanged and logs the event. No effect if the crawler is inactive or if penalties are disabled. | 231 |
| `gameplay_crawl_utils.calculatePathStats(pathId, pathReversed)` | Computes total distance and elevation change of a path (in 5 m steps) and caches the result. | 1741 |
| `gameplay_crawl_utils.clear(force)` | Clears the markers, unloads the prefabs, removes all crawler states, resets gameplay_crawl_general.activeTrail to nil, emits onCrawlCleared and clears the messages. Without force, does nothing if a mission crawl is active. | 397 |
| `gameplay_crawl_utils.clearCrawler(crawlerId)` | Removes a crawler (its per-player markers and its state). | 372 |
| `gameplay_crawl_utils.clearMarkers()` | Removes all gate markers and leaves preview mode. | 359 |
| `gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw)` | Updates and displays the gate markers (hidden in photo mode). Called by onPreRender. *(internal)* | 1623 |
| `gameplay_crawl_utils.getActiveCrawlerId()` | Returns the id of the first active crawler found. | 1902 |
| `gameplay_crawl_utils.getAllCrawlStates()` | Returns the internal table of all states (keyed by vehicle id), without copying. | 1898 |
| `gameplay_crawl_utils.getCrawlState(crawlerId)` | Returns the full state of a crawler: active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData. | 1862 |
| `gameplay_crawl_utils.getCrawlerDirection(crawlerId)` | Returns the vehicle orientation reduced to its yaw (rotation around Z). | 1874 |
| `gameplay_crawl_utils.getCrawlerPosition(crawlerId)` | Returns the last known position of a crawler (reference to a continuously updated vec3). | 1866 |
| `gameplay_crawl_utils.getDottedPath()` | Returns the points of the dotted preview line. | 1915 |
| `gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Lists the ids of the children of a prefab whose dynamic field has the value dynamicName. | 288 |
| `gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId)` | Returns the last recovery point cleared by an active crawler. | 1919 |
| `gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId)` | Returns the index of the last recovery point of an active crawler. | 1932 |
| `gameplay_crawl_utils.hasPenalties(crawlerId)` | Indicates whether the crawler's trail applies penalties (true unless trail.rules.penalties == false). | 225 |
| `gameplay_crawl_utils.isDebugDrawEnabled()` | Indicates whether the debug overlay is active. | 1737 |
| `gameplay_crawl_utils.isPreviewMode()` | Indicates whether the markers are in preview mode (before the crawl starts). | 1911 |
| `gameplay_crawl_utils.loadPrefabs(prefabFileList)` | Spawns the trail's prefabs (canSave = false, added to MissionGroup), prevents automatic entry into vehicles, finds the objects carrying the dynamic field 'crawlDynamic' (gates that cost gateTouch if touched), reloads collisions then creates the boundary zone flags (5 m spacing). | 313 |
| `gameplay_crawl_utils.onBoundaryViolation(crawlerId)` | Applies the boundaryViolation penalty and shows the message, except during the 3 s delay. Called by gameplay_crawl_boundary.checkBoundary. *(internal)* *(hook)* | 1550 |
| `gameplay_crawl_utils.onDrawOnMinimap(td)` | Minimap drawing hook: draws the gate markers (those of player 0 in split screen). *(internal)* *(hook)* | 1660 |
| `gameplay_crawl_utils.onExtensionUnloaded()` | Hook called on unload: restores commands.dropPlayerAtCameraNoReset. *(internal)* *(hook)* | 2063 |
| `gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw)` | Hook called before rendering: displays the markers, the dotted preview (in preview mode), the paused guidance and the debug overlay. *(internal)* *(hook)* | 1713 |
| `gameplay_crawl_utils.onSpawnCCallback(objId)` | Hook called when an object is created: during prefab loading, disables automatic entry into the created vehicle. *(internal)* *(hook)* | 1830 |
| `gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode)` | Hook called when split screen changes: rebuilds the markers (per player in 'split' mode, otherwise shared). *(internal)* *(hook)* | 1672 |
| `gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId)` | Applies the vehicleFlippedUpright penalty and shows the message. *(internal)* *(hook)* | 1431 |
| `gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery)` | Counts a vehicle recovery. With isGateRecovery: vehicleReset penalty and a 5 s delay without backward driving penalty; otherwise, in a mission: vehicleFlippedUpright penalty; outside a mission: dnf penalty (trail threshold), hence disqualification. *(hook)* | 1440 |
| `gameplay_crawl_utils.recoverToLastGate(crawlerId)` | Teleports the vehicle to the last cleared node (or the starting position), with the node's rotation or a direction inferred from the neighboring node, repairs the vehicle unless recovery.repairVehicle == false, and applies the recovery penalty. Requires trail.rules.recovery.mode == 'lastGate'. | 1495 |
| `gameplay_crawl_utils.resetCrawlData(crawlerId, force)` | Resets the crawler state (node 1, timer, points, infractions, events; crawlStarted becomes false), clears the messages and time tracking. | 1151 |
| `gameplay_crawl_utils.resumeCrawlTimer(crawlerId)` | Starts the timer of a crawler that is prepared but not yet started (crawlStarted becomes true) and shows the start and points messages. | 1806 |
| `gameplay_crawl_utils.setCrawlState(crawlerId, state)` | Replaces a crawler's state. | 1890 |
| `gameplay_crawl_utils.setDebugDraw(enabled)` | Enables or disables the debug overlay (path, boundary zone, starting position). | 1727 |
| `gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint)` | Forces the recovery point of an active crawler and enables the 5 s delay without backward driving penalty. | 1945 |
| `gameplay_crawl_utils.setupCrawlMarkers(path)` | Creates the gate markers of a path (all hidden, the last one as 'final'), builds the dotted line from the player's position and switches to preview mode. No effect if the markers of this path already exist. | 490 |
| `gameplay_crawl_utils.setupCrawlerData(veh)` | Creates the dynamic data of a crawler for a vehicle: id, points, bounding box (getSpawnWorldOOBB), wheel offsets (reference corners), infraction values; also registers the accZSmooth notification. | 1279 |
| `gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission)` | Creates the crawler state (node 1, timer 0, points kept in crawlerData), prepares the gate markers of the active path, shows the start and points messages, and configures core_lapTimes (a single lap, one segment per node). Requires gameplay_crawl_general.activeTrail with a non-empty path. | 1074 |
| `gameplay_crawl_utils.stopCrawl(force)` | Stops time tracking (core_lapTimes.onRaceStop), clears the zone exit points and calls clear. Without force, does nothing if an active crawl comes from a mission. | 1029 |
| `gameplay_crawl_utils.toggleDebugDraw()` | Toggles the debug overlay. | 1732 |
| `gameplay_crawl_utils.trackVehReset(vehId)` | Called when the player resets their vehicle: with the last-node recovery rule, cancels the recovery preview then requests recoverToLastGate; otherwise, stores the position to detect a real teleport (> 1 m) on the next frame and apply onVehicleReset. | 2010 |
| `gameplay_crawl_utils.unloadPrefabs()` | Removes the created prefabs, reloads collisions, empties the dynamic objects and the zone markers. | 267 |
| `gameplay_crawl_utils.updateCrawl(dtSim)` | Per-frame update of all active crawlers: boundary zone animations, timer, position, reached nodes, zone, infractions, events, time flow to core_lapTimes, points messages, DNF and removal of finished crawlers. *(internal)* | 1567 |

### Parameter details

#### `gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points)`

Adds points to the crawler (negative = bonus; total clamped to 0), emits onCrawlPenaltyScoreChanged and logs the event. No effect if the crawler is inactive or if penalties are disabled.

- `crawlerId` (*integer*) : Vehicle id.
- `penaltyType` (*string*) : Key of infractionPoints (e.g. 'boundaryViolation', 'dnf').
- `points` (*number|nil*) : Points to add; otherwise the value of infractionPoints[penaltyType].

#### `gameplay_crawl_utils.calculatePathStats(pathId, pathReversed)`

Computes total distance and elevation change of a path (in 5 m steps) and caches the result.

- `pathId` (*string*) : Id (file) of the path.
- `pathReversed` (*boolean|nil*) : No real effect (see notes).
- **returns**: table|nil {totalDistance (m), totalElevationChange (m), elevationGain, elevationLoss}; nil if the path has fewer than 2 positions.

#### `gameplay_crawl_utils.clear(force)`

Clears the markers, unloads the prefabs, removes all crawler states, resets gameplay_crawl_general.activeTrail to nil, emits onCrawlCleared and clears the messages. Without force, does nothing if a mission crawl is active.

- `force` (*boolean|nil*) : True to clear everything even in a mission.

#### `gameplay_crawl_utils.clearCrawler(crawlerId)`

Removes a crawler (its per-player markers and its state).

- `crawlerId` (*integer|nil*) : Vehicle id.

#### `gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw)`

Updates and displays the gate markers (hidden in photo mode). Called by onPreRender.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_crawl_utils.getActiveCrawlerId()`

Returns the id of the first active crawler found.

- **returns**: integer|nil Vehicle id.

#### `gameplay_crawl_utils.getAllCrawlStates()`

Returns the internal table of all states (keyed by vehicle id), without copying.

- **returns**: table<integer, table> States.

#### `gameplay_crawl_utils.getCrawlState(crawlerId)`

Returns the full state of a crawler: active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData.

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: table|nil State, or nil.

#### `gameplay_crawl_utils.getCrawlerDirection(crawlerId)`

Returns the vehicle orientation reduced to its yaw (rotation around Z).

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: quat Yaw quaternion; identity if unknown.

#### `gameplay_crawl_utils.getCrawlerPosition(crawlerId)`

Returns the last known position of a crawler (reference to a continuously updated vec3).

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: vec3|nil Position.

#### `gameplay_crawl_utils.getDottedPath()`

Returns the points of the dotted preview line.

- **returns**: table[] List of {pos, distanceFromStart}.

#### `gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Lists the ids of the children of a prefab whose dynamic field has the value dynamicName.

- `prefabId` (*integer*) : Prefab id.
- `dynamicName` (*string*) : Value searched.
- **returns**: integer[] Ids of the objects found; empty if absent.

#### `gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId)`

Returns the last recovery point cleared by an active crawler.

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: table|nil {position, rotation, index, time}.

#### `gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId)`

Returns the index of the last recovery point of an active crawler.

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: integer Index; 0 if none or crawler inactive.

#### `gameplay_crawl_utils.hasPenalties(crawlerId)`

Indicates whether the crawler's trail applies penalties (true unless trail.rules.penalties == false).

- `crawlerId` (*integer|nil*) : Vehicle id.
- **returns**: boolean true if penalties are active.

#### `gameplay_crawl_utils.isDebugDrawEnabled()`

Indicates whether the debug overlay is active.

- **returns**: boolean State.

#### `gameplay_crawl_utils.isPreviewMode()`

Indicates whether the markers are in preview mode (before the crawl starts).

- **returns**: boolean State.

#### `gameplay_crawl_utils.loadPrefabs(prefabFileList)`

Spawns the trail's prefabs (canSave = false, added to MissionGroup), prevents automatic entry into vehicles, finds the objects carrying the dynamic field 'crawlDynamic' (gates that cost gateTouch if touched), reloads collisions then creates the boundary zone flags (5 m spacing).

- `prefabFileList` (*string[]|nil*) : Prefab file paths.

#### `gameplay_crawl_utils.onBoundaryViolation(crawlerId)`

Applies the boundaryViolation penalty and shows the message, except during the 3 s delay. Called by gameplay_crawl_boundary.checkBoundary.

- `crawlerId` (*integer*) : Vehicle id.

#### `gameplay_crawl_utils.onDrawOnMinimap(td)`

Minimap drawing hook: draws the gate markers (those of player 0 in split screen).

- `td` (*table*) : Minimap drawing object.

#### `gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw)`

Hook called before rendering: displays the markers, the dotted preview (in preview mode), the paused guidance and the debug overlay.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_crawl_utils.onSpawnCCallback(objId)`

Hook called when an object is created: during prefab loading, disables automatic entry into the created vehicle.

- `objId` (*integer*) : Id of the created object.

#### `gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode)`

Hook called when split screen changes: rebuilds the markers (per player in 'split' mode, otherwise shared).

- `enabled` (*boolean*) : Split screen enabled.
- `_playerCount` (*integer*) : Number of players (unused).
- `_layoutId` (*any*) : Layout identifier (unused).
- `layoutMode` (*string|nil*) : Layout mode ('split' for separate views).

#### `gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId)`

Applies the vehicleFlippedUpright penalty and shows the message.

- `crawlerId` (*integer*) : Vehicle id.

#### `gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery)`

Counts a vehicle recovery. With isGateRecovery: vehicleReset penalty and a 5 s delay without backward driving penalty; otherwise, in a mission: vehicleFlippedUpright penalty; outside a mission: dnf penalty (trail threshold), hence disqualification.

- `crawlerId` (*integer*) : Vehicle id.
- `isGateRecovery` (*boolean|nil*) : True if the recovery comes from recoverToLastGate.

#### `gameplay_crawl_utils.recoverToLastGate(crawlerId)`

Teleports the vehicle to the last cleared node (or the starting position), with the node's rotation or a direction inferred from the neighboring node, repairs the vehicle unless recovery.repairVehicle == false, and applies the recovery penalty. Requires trail.rules.recovery.mode == 'lastGate'.

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: boolean true if the teleportation took place.

#### `gameplay_crawl_utils.resetCrawlData(crawlerId, force)`

Resets the crawler state (node 1, timer, points, infractions, events; crawlStarted becomes false), clears the messages and time tracking.

- `crawlerId` (*integer*) : Vehicle id.
- `force` (*boolean|nil*) : Required to reset a mission crawl.
- **returns**: boolean false if the crawler is unknown, inactive, or protected (mission without force).

#### `gameplay_crawl_utils.resumeCrawlTimer(crawlerId)`

Starts the timer of a crawler that is prepared but not yet started (crawlStarted becomes true) and shows the start and points messages.

- `crawlerId` (*integer*) : Vehicle id.
- **returns**: boolean true if the timer is running (already started or started now).

#### `gameplay_crawl_utils.setCrawlState(crawlerId, state)`

Replaces a crawler's state.

- `crawlerId` (*integer*) : Vehicle id.
- `state` (*table*) : New state.
- **returns**: boolean false if a parameter is missing.

#### `gameplay_crawl_utils.setDebugDraw(enabled)`

Enables or disables the debug overlay (path, boundary zone, starting position).

- `enabled` (*boolean*) : true to enable.
- **returns**: boolean New state.

#### `gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint)`

Forces the recovery point of an active crawler and enables the 5 s delay without backward driving penalty.

- `crawlerId` (*integer*) : Vehicle id.
- `checkpoint` (*table*) : {position, rotation, index, time}.
- **returns**: boolean false if parameters are missing or the crawler is inactive.

#### `gameplay_crawl_utils.setupCrawlMarkers(path)`

Creates the gate markers of a path (all hidden, the last one as 'final'), builds the dotted line from the player's position and switches to preview mode. No effect if the markers of this path already exist.

- `path` (*table*) : Path with nodes (pos, rotation, radius).

#### `gameplay_crawl_utils.setupCrawlerData(veh)`

Creates the dynamic data of a crawler for a vehicle: id, points, bounding box (getSpawnWorldOOBB), wheel offsets (reference corners), infraction values; also registers the accZSmooth notification.

- `veh` (*userdata*) : Vehicle object.
- **returns**: table|nil Crawler data, nil if veh is nil.

#### `gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission)`

Creates the crawler state (node 1, timer 0, points kept in crawlerData), prepares the gate markers of the active path, shows the start and points messages, and configures core_lapTimes (a single lap, one segment per node). Requires gameplay_crawl_general.activeTrail with a non-empty path.

- `crawlerId` (*integer*) : Vehicle id.
- `trail` (*table*) : Trail (rules, etc.).
- `crawlerData` (*table*) : Crawler data created by setupCrawlerData.
- `isFromMission` (*boolean|nil*) : True if started by a mission: the crawler is then not automatically removed at the end.
- **returns**: boolean false if invalid parameters or empty path.

#### `gameplay_crawl_utils.stopCrawl(force)`

Stops time tracking (core_lapTimes.onRaceStop), clears the zone exit points and calls clear. Without force, does nothing if an active crawl comes from a mission.

- `force` (*boolean|nil*) : True to stop even a mission crawl.

#### `gameplay_crawl_utils.toggleDebugDraw()`

Toggles the debug overlay.

- **returns**: boolean New state.

#### `gameplay_crawl_utils.trackVehReset(vehId)`

Called when the player resets their vehicle: with the last-node recovery rule, cancels the recovery preview then requests recoverToLastGate; otherwise, stores the position to detect a real teleport (> 1 m) on the next frame and apply onVehicleReset.

- `vehId` (*integer|string|nil*) : Vehicle id; if nil, the crawler of the player who last used a device, or all active crawlers.

#### `gameplay_crawl_utils.updateCrawl(dtSim)`

Per-frame update of all active crawlers: boundary zone animations, timer, position, reached nodes, zone, infractions, events, time flow to core_lapTimes, points messages, DNF and removal of finished crawlers.

- `dtSim` (*number*) : Simulation time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `drivingBackwardsSettings` | table<string, number> | Backward driving detection settings: velocityDotThreshold = -0.5, distanceThreshold = 2. |
| `infractionCooldowns` | table<string, number> | Repeat delays in seconds: drivingBackwards = 5, boundaryViolation = 3. |
| `infractionPoints` | table<string, number> | Points per infraction type (see notes). Negative values = bonus. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCrawlCleared` — listened to by 2 module(s)
- `onCrawlDisqualified` — listened to by 2 module(s)
- `onCrawlPathnodeReached` — listened to by 2 module(s)
- `onCrawlPenaltyScoreChanged` — listened to by 1 module(s)
- `onCrawlResultsShown` — listened to by 5 module(s)
- `showDisqualifiedMessage`

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `be:` `getObjectOOBBCenterXYZ`, `getPlayerVehicle`, `getPlayerVehicleID`, `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `setDynDataFieldbyName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/utils.lua`.*
