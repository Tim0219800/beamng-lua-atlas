---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simple pacenote generator: from a list of driveline points, it detects left/right corners by computing, for each point, the circle through three points (the point and those `lookAheadContext` indices before/after, in 2D). Nearly straight areas are filtered out, then consecutive segments of the same direction are merged. Used by the rally editor's generation tool.
--- Access: extension `gameplay_rally_notebook_pacenoteGenerator`: `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, then the global `gameplay_rally_notebook_pacenoteGenerator`
---@class gameplay_rally_notebook_pacenoteGenerator
---@field defaultParams table Default parameters: lookAheadContext = 7 (number of points before/after for the circle), straightThreshold = 5.0 (angle in degrees below which a section is considered straight), mergeDistanceThreshold = 0.2 (m, distance to the line for merging straight sections), maxSimplifyIterations = 10.
gameplay_rally_notebook_pacenoteGenerator = {}

--- Detects corners along a driveline. Returns `sections` (all sections, straights included, for debug drawing) and `corners` (only those with a direction, pacenote candidates). Each section contains pos, posEnd, direction, angle, length and nodes.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua:218
---@param pointList table List of points: tables with a .pos field, or vec3s directly.
---@param params table|nil Override of defaultParams (lookAheadContext, straightThreshold, mergeDistanceThreshold, maxSimplifyIterations).
---@return table  { sections = table[], corners = table[] }.
function gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params) end

