---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between "crawl" mode (slow traversal of waypoint courses) and the flowgraph nodes / missions. It loads a trail from gameplay_crawl_saveSystem, configures it (zone, path, start position, prefabs), starts and stops the crawl on a vehicle via gameplay_crawl_general / gameplay_crawl_utils, and exposes the current state (time, points, node reached, disqualification) and the list of trails. Only one crawl is active at a time, stored in bridgeState.
--- Access: extension `gameplay_crawl_crawlFlowgraphBridge`: `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, then the global `gameplay_crawl_crawlFlowgraphBridge`
---@class gameplay_crawl_crawlFlowgraphBridge
---@field dependencies table<integer, string> Extensions loaded before: gameplay_crawl_saveSystem, general, utils, boundary, display.
gameplay_crawl_crawlFlowgraphBridge = {}

--- Applies a penalty to the active crawler, with the number of points defined in gameplay_crawl_utils.infractionPoints. No effect if the crawl is inactive or the type unknown.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:243
---@param penaltyType string One of the types from getPenaltyTypes().
function gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType) end

--- Stops the crawl if any and empties the bridge state.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:303
function gameplay_crawl_crawlFlowgraphBridge.cleanup() end

--- Prepares the active crawl from a trail: resolves its zone (boundaryId), its path (pathId) and its start position (startingPositionId); the zone and the path are mandatory.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:32
---@param trail table Trail (name, boundaryId, pathId, startingPositionId, prefabs).
---@return boolean  true if the configuration is valid.
function gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail) end

--- Returns the id of the crawling vehicle.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:223
---@return integer|nil  Vehicle id, nil if none.
function gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId() end

--- Lists all the start positions known to saveSystem.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:231
---@return table  Start positions.
function gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions() end

--- Lists all the trails known to saveSystem.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:227
---@return table  Trails.
function gameplay_crawl_crawlFlowgraphBridge.getAllTrails() end

--- Returns an end-of-crawl summary for the active crawler.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:151
---@return table|nil  {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified}; nil if no active crawl.
function gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData() end

--- Returns the crawl's current state.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:171
---@return table|nil  {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId}; nil if no active crawl.
function gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData() end

--- Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab: objects of a prefab carrying a given dynamic name.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:239
---@param prefabId any Prefab id.
---@param dynamicName string Dynamic name searched.
---@return table  Objects found (inferred from code).
function gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Returns the index of the active crawler's last recovery point.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:271
---@return integer  Index, 0 if no active crawl.
function gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex() end

--- Returns the list of penalty types.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:267
---@return string[]  Penalty names.
function gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes() end

--- Returns the player's statistics on a trail (saveSystem).
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:235
---@param trailId string|integer Trail id.
---@return table|nil  Statistics.
function gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId) end

--- Returns a trail's metadata (the one given, otherwise the active trail).
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:193
---@param trailId string|integer|nil Trail id.
---@return table|nil  {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.
function gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId) end

--- Tells whether a crawl is active through this bridge.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:219
---@return boolean  Active state.
function gameplay_crawl_crawlFlowgraphBridge.isCrawlActive() end

--- Gets a trail by id from saveSystem.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:16
---@param trailId string|integer Trail id (exact type inferred from code).
---@return table|nil  The trail, or nil if the id is missing or unknown.
function gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId) end

--- Hook called when a path node is reached; logs index and time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:295
---@param eventData table {pathnodeIndex, time}.
function gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData) end

--- Hook called when the results are displayed; logs time and points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:291
---@param eventData table {time, points}.
function gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData) end

--- Hook called when a crawl starts; only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:287
function gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted() end

--- Resets the crawler data, teleports the vehicle to the trail's start position (orientation of the path's first node if available, spawn.safeTeleport) then stops the crawl.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:102
---@return boolean  true if the teleportation took place.
function gameplay_crawl_crawlFlowgraphBridge.resetCrawl() end

--- Sets the active crawler's recovery point.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:279
---@param checkpoint any Waypoint (inferred from code).
---@return boolean  false if no active crawl; otherwise the result of gameplay_crawl_utils.setRecoveryCheckpoint.
function gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint) end

--- Starts the configured crawl on a vehicle (gameplay_crawl_general.startCrawl) and marks the bridge as active.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:59
---@param vehicleId integer|nil Vehicle id; player 0's vehicle if nil.
---@return boolean  true if launched.
function gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId) end

--- Stops the active crawl (gameplay_crawl_utils.stopCrawl) and resets the bridge state.
---Source: lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:86
---@return boolean  false if there was no active crawl.
function gameplay_crawl_crawlFlowgraphBridge.stopCrawl() end

