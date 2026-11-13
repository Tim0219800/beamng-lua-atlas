---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_display` : `extensions.load("gameplay_crawl_display")`, puis la globale `gameplay_crawl_display`
---@class gameplay_crawl_display
gameplay_crawl_display = {}

---Source : lua/ge/extensions/gameplay/crawl/display.lua:188
---@param crawlerId any
function gameplay_crawl_display.clearDisqualifiedWaitingMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:156
---@param crawlerId any
function gameplay_crawl_display.clearPointsMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:133
function gameplay_crawl_display.onCrawlComplete() end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:137
function gameplay_crawl_display.onCrawlResultsShown() end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:128
function gameplay_crawl_display.onCrawlStarted() end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:141
function gameplay_crawl_display.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:145
function gameplay_crawl_display.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:212
---@param penaltyPoints any
---@param crawlerId any
function gameplay_crawl_display.showBonusCheckpointMessage(penaltyPoints, crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:208
---@param crawlerId any
function gameplay_crawl_display.showBoundaryViolationMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:160
---@param time any
---@param points any
---@param crawlerId any
function gameplay_crawl_display.showCrawlCompletedMessage(time, points, crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:220
---@param crawlerId any
function gameplay_crawl_display.showDNFMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:179
---@param eventData any
function gameplay_crawl_display.showDisqualifiedMessage(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:184
---@param crawlerId any
function gameplay_crawl_display.showDisqualifiedWaitingMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:192
---@param crawlerId any
function gameplay_crawl_display.showDrivingBackwardsMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:216
---@param penaltyPoints any
---@param crawlerId any
function gameplay_crawl_display.showGateClearedMessage(penaltyPoints, crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:171
---@param crawlerId any
function gameplay_crawl_display.showGateReachedMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:150
---@param points any
---@param crawlerId any
function gameplay_crawl_display.showPointsMessage(points, crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:167
---@param skippedCount any
---@param crawlerId any
function gameplay_crawl_display.showSkippedCheckpointsMessage(skippedCount, crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:175
---@param crawlerId any
function gameplay_crawl_display.showStartedCrawlMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:196
---@param crawlerId any
function gameplay_crawl_display.showVehicleFlippedUprightMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:204
---@param crawlerId any
function gameplay_crawl_display.showVehicleRecoveredMessage(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/display.lua:200
---@param crawlerId any
function gameplay_crawl_display.showVehicleResetMessage(crawlerId) end

