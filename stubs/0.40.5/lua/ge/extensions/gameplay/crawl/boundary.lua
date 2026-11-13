---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/boundary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_boundary` : `extensions.load("gameplay_crawl_boundary")`, puis la globale `gameplay_crawl_boundary`
---@class gameplay_crawl_boundary
gameplay_crawl_boundary = {}

---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:318
---@param site any
---@param crawler any
---@param crawlStates any
function gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates) end

---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:306
function gameplay_crawl_boundary.cleanupBoundaryMarkers() end

--- Function to clear all exit points
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:431
function gameplay_crawl_boundary.clearAllExitPoints() end

--- Function to clear exit point for a specific crawler
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:422
---@param crawlerId any
function gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId) end

--- Returns the recorded boundary exit point for a crawler, or nil if inside the boundary
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:417
---@param crawlerId any
function gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId) end

--- Function to get quadtree statistics for debugging
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:460
function gameplay_crawl_boundary.getQuadtreeStats() end

--- Function to rebuild quadtree (useful if boundary objects change)
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:455
function gameplay_crawl_boundary.rebuildQuadtree() end

---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:189
function gameplay_crawl_boundary.resetBoundaryObjects() end

--- Function to set animation timing
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:444
---@param duration any
---@param fadeIn any
---@param fadeOut any
---@param scaleUp any
function gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp) end

--- Function to set visibility radius for boundary markers
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:438
---@param radius any
function gameplay_crawl_boundary.setVisibilityRadius(radius) end

--- Utility function to spawn flag markers along crawl boundary
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:204
---@param boundary any
---@param spacing any
function gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing) end

--- Function to trigger appearing animation for all currently visible objects
---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:473
function gameplay_crawl_boundary.triggerAppearingAnimation() end

---Source : lua/ge/extensions/gameplay/crawl/boundary.lua:63
---@param dtSim any
---@param crawlStates any
function gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates) end

