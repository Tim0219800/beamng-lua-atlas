---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Execution engine of the crawl mode (slow traversal of a trail with waypoints). It keeps the state of each crawler (crawlStates, keyed by vehicle id): current node, nodes cleared or skipped, timer, penalty points, events, recovery point, disqualification. Every frame, updateCrawl advances the timer, reads the vehicle position, detects reached nodes (2D test on the bounding box center, with a direction check if the node has a rotation), checks the boundary zone (gameplay_crawl_boundary), infractions (driving backwards, touching dynamic gates) and the DNF threshold. It also manages the 3D gate markers (shared or per player in split screen), the dotted preview line, the loading of the trail's prefabs, the integration with core_lapTimes and vehicle resets. The scoring table is in infractionPoints.
--- Access: extension `gameplay_crawl_utils`: `extensions.load("gameplay_crawl_utils")`, then the global `gameplay_crawl_utils`
---@class gameplay_crawl_utils
---@field drivingBackwardsSettings table<string, number> Backward driving detection settings: velocityDotThreshold = -0.5, distanceThreshold = 2.
---@field infractionCooldowns table<string, number> Repeat delays in seconds: drivingBackwards = 5, boundaryViolation = 3.
---@field infractionPoints table<string, number> Points per infraction type (see notes). Negative values = bonus.
gameplay_crawl_utils = {}

--- Activates the first marker ('current') of the active path and leaves preview mode.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:540
function gameplay_crawl_utils.activateCrawlMarkers() end

--- Adds points to the crawler (negative = bonus; total clamped to 0), emits onCrawlPenaltyScoreChanged and logs the event. No effect if the crawler is inactive or if penalties are disabled.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:231
---@param crawlerId integer Vehicle id.
---@param penaltyType string Key of infractionPoints (e.g. 'boundaryViolation', 'dnf').
---@param points number|nil Points to add; otherwise the value of infractionPoints[penaltyType].
function gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points) end

--- Computes total distance and elevation change of a path (in 5 m steps) and caches the result.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1741
---@param pathId string Id (file) of the path.
---@param pathReversed boolean|nil No real effect (see notes).
---@return table|nil  {totalDistance (m), totalElevationChange (m), elevationGain, elevationLoss}; nil if the path has fewer than 2 positions.
function gameplay_crawl_utils.calculatePathStats(pathId, pathReversed) end

--- Clears the markers, unloads the prefabs, removes all crawler states, resets gameplay_crawl_general.activeTrail to nil, emits onCrawlCleared and clears the messages. Without force, does nothing if a mission crawl is active.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:397
---@param force boolean|nil True to clear everything even in a mission.
function gameplay_crawl_utils.clear(force) end

--- Removes a crawler (its per-player markers and its state).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:372
---@param crawlerId integer|nil Vehicle id.
function gameplay_crawl_utils.clearCrawler(crawlerId) end

--- Removes all gate markers and leaves preview mode.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:359
function gameplay_crawl_utils.clearMarkers() end

--- Updates and displays the gate markers (hidden in photo mode). Called by onPreRender.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1623
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw) end

--- Returns the id of the first active crawler found.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1902
---@return integer|nil  Vehicle id.
function gameplay_crawl_utils.getActiveCrawlerId() end

--- Returns the internal table of all states (keyed by vehicle id), without copying.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1898
---@return table<integer, table>  States.
function gameplay_crawl_utils.getAllCrawlStates() end

--- Returns the full state of a crawler: active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1862
---@param crawlerId integer Vehicle id.
---@return table|nil  State, or nil.
function gameplay_crawl_utils.getCrawlState(crawlerId) end

--- Returns the vehicle orientation reduced to its yaw (rotation around Z).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1874
---@param crawlerId integer Vehicle id.
---@return quat  Yaw quaternion; identity if unknown.
function gameplay_crawl_utils.getCrawlerDirection(crawlerId) end

--- Returns the last known position of a crawler (reference to a continuously updated vec3).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1866
---@param crawlerId integer Vehicle id.
---@return vec3|nil  Position.
function gameplay_crawl_utils.getCrawlerPosition(crawlerId) end

--- Returns the points of the dotted preview line.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1915
---@return table[]  List of {pos, distanceFromStart}.
function gameplay_crawl_utils.getDottedPath() end

--- Lists the ids of the children of a prefab whose dynamic field has the value dynamicName.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:288
---@param prefabId integer Prefab id.
---@param dynamicName string Value searched.
---@return integer[]  Ids of the objects found; empty if absent.
function gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Returns the last recovery point cleared by an active crawler.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1919
---@param crawlerId integer Vehicle id.
---@return table|nil  {position, rotation, index, time}.
function gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId) end

--- Returns the index of the last recovery point of an active crawler.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1932
---@param crawlerId integer Vehicle id.
---@return integer  Index; 0 if none or crawler inactive.
function gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId) end

--- Indicates whether the crawler's trail applies penalties (true unless trail.rules.penalties == false).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:225
---@param crawlerId integer|nil Vehicle id.
---@return boolean  true if penalties are active.
function gameplay_crawl_utils.hasPenalties(crawlerId) end

--- Indicates whether the debug overlay is active.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1737
---@return boolean  State.
function gameplay_crawl_utils.isDebugDrawEnabled() end

--- Indicates whether the markers are in preview mode (before the crawl starts).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1911
---@return boolean  State.
function gameplay_crawl_utils.isPreviewMode() end

--- Spawns the trail's prefabs (canSave = false, added to MissionGroup), prevents automatic entry into vehicles, finds the objects carrying the dynamic field 'crawlDynamic' (gates that cost gateTouch if touched), reloads collisions then creates the boundary zone flags (5 m spacing).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:313
---@param prefabFileList string[]|nil Prefab file paths.
function gameplay_crawl_utils.loadPrefabs(prefabFileList) end

--- Applies the boundaryViolation penalty and shows the message, except during the 3 s delay. Called by gameplay_crawl_boundary.checkBoundary.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1550
---@param crawlerId integer Vehicle id.
function gameplay_crawl_utils.onBoundaryViolation(crawlerId) end

--- Minimap drawing hook: draws the gate markers (those of player 0 in split screen).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1660
---@param td table Minimap drawing object.
function gameplay_crawl_utils.onDrawOnMinimap(td) end

--- Hook called on unload: restores commands.dropPlayerAtCameraNoReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:2063
function gameplay_crawl_utils.onExtensionUnloaded() end

--- Hook called before rendering: displays the markers, the dotted preview (in preview mode), the paused guidance and the debug overlay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1713
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook called when an object is created: during prefab loading, disables automatic entry into the created vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1830
---@param objId integer Id of the created object.
function gameplay_crawl_utils.onSpawnCCallback(objId) end

--- Hook called when split screen changes: rebuilds the markers (per player in 'split' mode, otherwise shared).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1672
---@param enabled boolean Split screen enabled.
---@param _playerCount integer Number of players (unused).
---@param _layoutId any Layout identifier (unused).
---@param layoutMode string|nil Layout mode ('split' for separate views).
function gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode) end

--- Applies the vehicleFlippedUpright penalty and shows the message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1431
---@param crawlerId integer Vehicle id.
function gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId) end

--- Counts a vehicle recovery. With isGateRecovery: vehicleReset penalty and a 5 s delay without backward driving penalty; otherwise, in a mission: vehicleFlippedUpright penalty; outside a mission: dnf penalty (trail threshold), hence disqualification.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1440
---@param crawlerId integer Vehicle id.
---@param isGateRecovery boolean|nil True if the recovery comes from recoverToLastGate.
function gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery) end

--- Teleports the vehicle to the last cleared node (or the starting position), with the node's rotation or a direction inferred from the neighboring node, repairs the vehicle unless recovery.repairVehicle == false, and applies the recovery penalty. Requires trail.rules.recovery.mode == 'lastGate'.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1495
---@param crawlerId integer Vehicle id.
---@return boolean  true if the teleportation took place.
function gameplay_crawl_utils.recoverToLastGate(crawlerId) end

--- Resets the crawler state (node 1, timer, points, infractions, events; crawlStarted becomes false), clears the messages and time tracking.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1151
---@param crawlerId integer Vehicle id.
---@param force boolean|nil Required to reset a mission crawl.
---@return boolean  false if the crawler is unknown, inactive, or protected (mission without force).
function gameplay_crawl_utils.resetCrawlData(crawlerId, force) end

--- Starts the timer of a crawler that is prepared but not yet started (crawlStarted becomes true) and shows the start and points messages.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1806
---@param crawlerId integer Vehicle id.
---@return boolean  true if the timer is running (already started or started now).
function gameplay_crawl_utils.resumeCrawlTimer(crawlerId) end

--- Replaces a crawler's state.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1890
---@param crawlerId integer Vehicle id.
---@param state table New state.
---@return boolean  false if a parameter is missing.
function gameplay_crawl_utils.setCrawlState(crawlerId, state) end

--- Enables or disables the debug overlay (path, boundary zone, starting position).
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1727
---@param enabled boolean true to enable.
---@return boolean  New state.
function gameplay_crawl_utils.setDebugDraw(enabled) end

--- Forces the recovery point of an active crawler and enables the 5 s delay without backward driving penalty.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1945
---@param crawlerId integer Vehicle id.
---@param checkpoint table {position, rotation, index, time}.
---@return boolean  false if parameters are missing or the crawler is inactive.
function gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint) end

--- Creates the gate markers of a path (all hidden, the last one as 'final'), builds the dotted line from the player's position and switches to preview mode. No effect if the markers of this path already exist.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:490
---@param path table Path with nodes (pos, rotation, radius).
function gameplay_crawl_utils.setupCrawlMarkers(path) end

--- Creates the dynamic data of a crawler for a vehicle: id, points, bounding box (getSpawnWorldOOBB), wheel offsets (reference corners), infraction values; also registers the accZSmooth notification.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1279
---@param veh userdata Vehicle object.
---@return table|nil  Crawler data, nil if veh is nil.
function gameplay_crawl_utils.setupCrawlerData(veh) end

--- Creates the crawler state (node 1, timer 0, points kept in crawlerData), prepares the gate markers of the active path, shows the start and points messages, and configures core_lapTimes (a single lap, one segment per node). Requires gameplay_crawl_general.activeTrail with a non-empty path.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1074
---@param crawlerId integer Vehicle id.
---@param trail table Trail (rules, etc.).
---@param crawlerData table Crawler data created by setupCrawlerData.
---@param isFromMission boolean|nil True if started by a mission: the crawler is then not automatically removed at the end.
---@return boolean  false if invalid parameters or empty path.
function gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission) end

--- Stops time tracking (core_lapTimes.onRaceStop), clears the zone exit points and calls clear. Without force, does nothing if an active crawl comes from a mission.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1029
---@param force boolean|nil True to stop even a mission crawl.
function gameplay_crawl_utils.stopCrawl(force) end

--- Toggles the debug overlay.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1732
---@return boolean  New state.
function gameplay_crawl_utils.toggleDebugDraw() end

--- Called when the player resets their vehicle: with the last-node recovery rule, cancels the recovery preview then requests recoverToLastGate; otherwise, stores the position to detect a real teleport (> 1 m) on the next frame and apply onVehicleReset.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:2010
---@param vehId integer|string|nil Vehicle id; if nil, the crawler of the player who last used a device, or all active crawlers.
function gameplay_crawl_utils.trackVehReset(vehId) end

--- Removes the created prefabs, reloads collisions, empties the dynamic objects and the zone markers.
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:267
function gameplay_crawl_utils.unloadPrefabs() end

--- Per-frame update of all active crawlers: boundary zone animations, timer, position, reached nodes, zone, infractions, events, time flow to core_lapTimes, points messages, DNF and removal of finished crawlers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/utils.lua:1567
---@param dtSim number Simulation time delta (s).
function gameplay_crawl_utils.updateCrawl(dtSim) end

