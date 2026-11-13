---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_debugDraw` : `extensions.load("gameplay_crawl_debugDraw")`, puis la globale `gameplay_crawl_debugDraw`
---@class gameplay_crawl_debugDraw
gameplay_crawl_debugDraw = {}

--- Draws the boundary zone (fence + planes). zone:drawDebug already does camera culling.
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:99
---@param boundary any
---@param drawMode any
function gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode) end

--- Draws waypoints (spheres + facing arrows + labels) and the segments between them.
---  opts: { maxDist = number, showSegmentDistance = bool, showLabels = bool }
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:53
---@param nodes any
---@param opts any
function gameplay_crawl_debugDraw.drawPath(nodes, opts) end

--- Draws the starting position area sphere, icon marker and facing arrow.
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:105
---@param startingPosition any
function gameplay_crawl_debugDraw.drawStartingPosition(startingPosition) end

