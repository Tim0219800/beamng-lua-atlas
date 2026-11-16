---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Read-only debug visualization of crawl mode trails, via debugDrawer: waypoints (spheres, direction arrows, labels) and segments, boundary zone, start position. Shared by the crawl editor and the in-game dev overlay to keep a consistent rendering. To be called every render frame.
--- Access: extension `gameplay_crawl_debugDraw`: `extensions.load("gameplay_crawl_debugDraw")`, then the global `gameplay_crawl_debugDraw`
---@class gameplay_crawl_debugDraw
gameplay_crawl_debugDraw = {}

--- Draws the boundary zone by calling boundary:drawDebug(drawMode) (camera culling is done by the zone).
---Source: lua/ge/extensions/gameplay/crawl/debugDraw.lua:99
---@param boundary table|nil Zone with the drawDebug method.
---@param drawMode any Draw mode passed as is to drawDebug.
function gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode) end

--- Draws each node (sphere, arrow according to its rotation, label "index: name [REC]/[BONUS]") and the cylinders between consecutive nodes, optionally with the cumulative distance.
---Source: lua/ge/extensions/gameplay/crawl/debugDraw.lua:53
---@param nodes table<integer, table> Nodes: pos (vec3), radius, rotation (quat), name, flags (isRecoveryCheckpoint, isBonusCheckpoint).
---@param opts table|nil {maxDist = number (m, 400 by default), showSegmentDistance = boolean, showLabels = boolean (true by default)}.
function gameplay_crawl_debugDraw.drawPath(nodes, opts) end

--- Draws the start zone's sphere, a direction arrow and, if present, a small sphere at iconPosition.
---Source: lua/ge/extensions/gameplay/crawl/debugDraw.lua:105
---@param startingPosition table|nil Start position: transform (position, rotation, radius) and iconPosition.
function gameplay_crawl_debugDraw.drawStartingPosition(startingPosition) end

