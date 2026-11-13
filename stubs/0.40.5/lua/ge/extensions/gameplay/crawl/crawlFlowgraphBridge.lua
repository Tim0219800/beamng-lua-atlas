---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_crawlFlowgraphBridge` : `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, puis la globale `gameplay_crawl_crawlFlowgraphBridge`
---@class gameplay_crawl_crawlFlowgraphBridge
---@field dependencies table
gameplay_crawl_crawlFlowgraphBridge = {}

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:243
---@param penaltyType any
function gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:303
function gameplay_crawl_crawlFlowgraphBridge.cleanup() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:32
---@param trail any
function gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:223
function gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:231
function gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:227
function gameplay_crawl_crawlFlowgraphBridge.getAllTrails() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:151
function gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:171
function gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:239
---@param prefabId any
---@param dynamicName any
function gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:271
function gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:267
function gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:235
---@param trailId any
function gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:193
---@param trailId any
function gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:219
function gameplay_crawl_crawlFlowgraphBridge.isCrawlActive() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:16
---@param trailId any
function gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:295
---@param eventData any
function gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:291
---@param eventData any
function gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:287
function gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:102
function gameplay_crawl_crawlFlowgraphBridge.resetCrawl() end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:279
---@param checkpoint any
function gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:59
---@param vehicleId any
function gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId) end

---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:86
function gameplay_crawl_crawlFlowgraphBridge.stopCrawl() end

