---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_flowgraphBridge` : `extensions.load("gameplay_crawl_flowgraphBridge")`, puis la globale `gameplay_crawl_flowgraphBridge`
---@class gameplay_crawl_flowgraphBridge
---@field dependencies table
gameplay_crawl_flowgraphBridge = {}

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:250
---@param penaltyType any
function gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:319
function gameplay_crawl_flowgraphBridge.cleanup() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:230
function gameplay_crawl_flowgraphBridge.getActiveCrawlerId() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:238
function gameplay_crawl_flowgraphBridge.getAllStartingPositions() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:234
function gameplay_crawl_flowgraphBridge.getAllTrails() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:155
function gameplay_crawl_flowgraphBridge.getCrawlEndData() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:177
function gameplay_crawl_flowgraphBridge.getCrawlRuntimeData() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:246
---@param prefabId any
---@param dynamicName any
function gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:279
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:288
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:275
function gameplay_crawl_flowgraphBridge.getPenaltyTypes() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:242
---@param trailId any
function gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:200
---@param trailId any
function gameplay_crawl_flowgraphBridge.getTrailInfo(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:226
function gameplay_crawl_flowgraphBridge.isCrawlActive() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:21
---@param trailId any
function gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:312
---@param eventData any
function gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:309
---@param eventData any
function gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:306
function gameplay_crawl_flowgraphBridge.onCrawlStarted() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:121
function gameplay_crawl_flowgraphBridge.resetCrawl() end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:297
---@param checkpoint any
function gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:36
---@param vehicleId any
---@param trail any
function gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:66
---@param vehicleId any
---@param trail any
function gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail) end

---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:112
function gameplay_crawl_flowgraphBridge.stopCrawl() end

