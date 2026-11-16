---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/boundary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone boundary management for "crawl" mode (slow traversal). It spawns flags (TSStatic flagMarker.dae) along a zone's outline, animates them (appearing with scaling and fade, disappearing with fade) when an active crawler or the camera is within visibilityRadius meters, via a 2D quadtree, and checks whether a crawler has left the zone. An exit is recorded; if the crawler moves at least 10 m away from the exit point (all corners outside), the 'dnf' penalty is applied only once via gameplay_crawl_utils.applyPenalty; otherwise onBoundaryViolation is called.
--- Access: extension `gameplay_crawl_boundary`: `extensions.load("gameplay_crawl_boundary")`, then the global `gameplay_crawl_boundary`
---@class gameplay_crawl_boundary
gameplay_crawl_boundary = {}

--- Tests whether a crawler is in the zone (vehicle corners or center of its box). Records the exit point, applies the 'dnf' penalty (once) if all corners are outside at 10 m or more from the exit point, or reports a boundary violation.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:318
---@param site table Zone with the containsPoint2D(pos) method.
---@param crawler table Crawler: id, dynamicData (currentCorners, bbCenter).
---@param crawlStates table<any, table> Crawler states keyed by id (active field).
---@return boolean  false if the crawler is inactive, disqualified (DNF) or if no site is given; true otherwise.
function gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates) end

--- Deletes the markers group and empties the tracking.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:306
function gameplay_crawl_boundary.cleanupBoundaryMarkers() end

--- Clears all exit points and DNF flags.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:431
function gameplay_crawl_boundary.clearAllExitPoints() end

--- Clears a crawler's exit point and DNF flag.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:422
---@param crawlerId any Crawler id.
function gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId) end

--- Returns the point where the crawler left the zone.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:417
---@param crawlerId any Crawler id.
---@return vec3|nil  Exit point, or nil if the crawler is in the zone.
function gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId) end

--- Returns the quadtree state for debug.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:460
---@return table  {built, objectCount, bounds?} (see notes about objectCount).
function gameplay_crawl_boundary.getQuadtreeStats() end

--- Rebuilds the quadtree from the tracked flags (useful if these objects change).
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:455
function gameplay_crawl_boundary.rebuildQuadtree() end

--- Hides all tracked flags (hidden, minimum scale, transparent color) then empties the tracking table.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:189
function gameplay_crawl_boundary.resetBoundaryObjects() end

--- Sets the flags' animation durations (default values if nil).
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:444
---@param duration number|nil Total appearance duration (s), 0.5 by default.
---@param fadeIn number|nil Fade-in duration (s), 0.3 by default.
---@param fadeOut number|nil Fade-out duration (s), 0.2 by default.
---@param scaleUp number|nil Scale-up duration (s), 0.4 by default.
function gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp) end

--- Sets the radius (m) within which the flags are visible.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:438
---@param radius number|nil Radius in meters; 200 if nil.
function gameplay_crawl_boundary.setVisibilityRadius(radius) end

--- Removes the previous markers, then creates flags along the outline (one every spacing meters, placed on the terrain and oriented along the segment) and builds the visibility quadtree. The flags start hidden.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:204
---@param boundary table Outline with vertices (at least 3), each with pos (vec3) and optionally next.
---@param spacing number|nil Distance between flags in meters (2.0 by default).
---@return integer|nil  Id of the markers SimGroup; nil if the outline is invalid.
function gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing) end

--- Restarts the appearance animation for the flags that are currently not hidden.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:473
function gameplay_crawl_boundary.triggerAppearingAnimation() end

--- Updates the visibility and animation of the boundary flags: those close to an active crawler (or to the camera if none is active) appear, the others disappear. To be called every frame.
---Source: lua/ge/extensions/gameplay/crawl/boundary.lua:63
---@param dtSim number Simulation time delta (s).
---@param crawlStates table<any, table>|nil Crawler states (active, crawlerData.dynamicData.vehPos).
function gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates) end

