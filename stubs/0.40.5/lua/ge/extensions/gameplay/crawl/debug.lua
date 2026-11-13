---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_debug` : `extensions.load("gameplay_crawl_debug")`, puis la globale `gameplay_crawl_debug`
---@class gameplay_crawl_debug
---@field dependencies table
gameplay_crawl_debug = {}

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:351
function gameplay_crawl_debug.clearDebugData() end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:347
function gameplay_crawl_debug.getEnableDebugWindow() end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:292
---@param eventData any
function gameplay_crawl_debug.onCrawlComplete(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:299
---@param eventData any
function gameplay_crawl_debug.onCrawlDisqualified(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:285
---@param eventData any
function gameplay_crawl_debug.onCrawlStarted(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:307
function gameplay_crawl_debug.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:313
function gameplay_crawl_debug.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:319
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/crawl/debug.lua:338
---@param enabled any
function gameplay_crawl_debug.setEnableDebugWindow(enabled) end

