---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between crawl mode (slow traversal of courses) and the missions' flowgraph nodes. It loads a trail from gameplay_crawl_saveSystem, prepares it (setupCrawl, with teleportation to the start), starts/stops/resets the crawl via gameplay_crawl_general and gameplay_crawl_utils, and exposes the crawl state (time, points, current node, disqualification, recoveries), the trail information and the management of penalties and recovery points. Unlike crawlFlowgraphBridge.lua, it keeps no state of its own: it reads gameplay_crawl_general.activeTrail and looks for the active crawler in gameplay_crawl_utils.getAllCrawlStates().
--- Access: extension `gameplay_crawl_flowgraphBridge`: `extensions.load("gameplay_crawl_flowgraphBridge")`, then the global `gameplay_crawl_flowgraphBridge`
---@class gameplay_crawl_flowgraphBridge
---@field dependencies table<integer, string> Extensions loaded before: gameplay_crawl_saveSystem, general, utils, boundary, display.
gameplay_crawl_flowgraphBridge = {}

--- Applies a penalty to the active crawler with the points from gameplay_crawl_utils.infractionPoints[penaltyType]. No effect if there is no active crawler or if the type is unknown.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:250
---@param penaltyType string One of the types from getPenaltyTypes().
function gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType) end

--- Stops the active crawl if there is one.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:319
function gameplay_crawl_flowgraphBridge.cleanup() end

--- Returns the id of the first crawler whose state is active.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:230
---@return integer|nil  Vehicle id.
function gameplay_crawl_flowgraphBridge.getActiveCrawlerId() end

--- Lists all starting positions (saveSystem).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:238
---@return table  Start positions.
function gameplay_crawl_flowgraphBridge.getAllStartingPositions() end

--- Lists all trails (saveSystem).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:234
---@return table  Trails.
function gameplay_crawl_flowgraphBridge.getAllTrails() end

--- Summary of the active crawler's crawl.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:155
---@return table|nil  {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified, recoveries}; nil if no active crawl.
function gameplay_crawl_flowgraphBridge.getCrawlEndData() end

--- Current state of the active crawl.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:177
---@return table|nil  {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId}; nil if no active crawl.
function gameplay_crawl_flowgraphBridge.getCrawlRuntimeData() end

--- Delegates to gameplay_crawl_utils.getDynamicObjectsFromPrefab.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:246
---@param prefabId any Prefab id.
---@param dynamicName string Dynamic name searched.
---@return table  Objects found (inferred from code).
function gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Last recovery point of the active crawler.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:279
---@return table|nil  Recovery point (inferred from code); nil if no active crawler.
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint() end

--- Index of the last recovery point of the active crawler.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:288
---@return integer  Index, 0 if no active crawler.
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex() end

--- List of penalty types.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:275
---@return string[]  Penalty names.
function gameplay_crawl_flowgraphBridge.getPenaltyTypes() end

--- Player statistics on a trail (saveSystem).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:242
---@param trailId string Trail id.
---@return table|nil  Statistics.
function gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId) end

--- Metadata of a trail (the one given, otherwise the active trail).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:200
---@param trailId string|nil Trail id.
---@return table|nil  {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.
function gameplay_crawl_flowgraphBridge.getTrailInfo(trailId) end

--- Indicates whether a trail is active in gameplay_crawl_general.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:226
---@return boolean  true if activeTrail exists.
function gameplay_crawl_flowgraphBridge.isCrawlActive() end

--- Gets a trail by id from saveSystem.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:21
---@param trailId string Id (file path) of the trail.
---@return table|nil  The trail, or nil if absent.
function gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId) end

--- Hook called when a path node is reached: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:312
---@param eventData table Event data.
function gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData) end

--- Hook called when the results are shown: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:309
---@param eventData table Event data.
function gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData) end

--- Hook called when a crawl starts: empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:306
function gameplay_crawl_flowgraphBridge.onCrawlStarted() end

--- Resets the active crawler's data and teleports its vehicle to the trail's starting position (spawn.safeTeleport).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:121
---@return boolean  true if reset and teleported.
function gameplay_crawl_flowgraphBridge.resetCrawl() end

--- Sets the active crawler's recovery point.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:297
---@param checkpoint any Waypoint (inferred from code).
---@return boolean  false if no active crawler, otherwise the result of utils.setRecoveryCheckpoint.
function gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint) end

--- Prepares a crawl: stops any crawl in progress, then calls gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, path, start, prefabs, teleport to the start).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:36
---@param vehicleId integer|nil Vehicle id; player 0's vehicle if nil.
---@param trail table Trail to prepare.
---@return boolean  true if the preparation succeeded.
function gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail) end

--- Starts the prepared crawl (gameplay_crawl_general.startCrawlFlowgraph) or resumes the timer of a crawl that is already ready.
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:66
---@param vehicleId integer|nil Vehicle id.
---@param trail table|nil Trail; otherwise the active trail of general.
---@return boolean  true if the crawl is started.
function gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail) end

--- Stops the active crawl (gameplay_crawl_utils.stopCrawl(true)).
---Source: lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:112
---@return boolean  false if there was no active trail.
function gameplay_crawl_flowgraphBridge.stopCrawl() end

