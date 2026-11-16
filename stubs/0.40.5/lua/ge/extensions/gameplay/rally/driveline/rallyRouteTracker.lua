---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tracker returned by the module constructor.
---@class gameplay_rally_driveline_rallyRouteTracker
local gameplay_rally_driveline_rallyRouteTracker = {}

--- Accepts or rejects a projection according to the maximum forward/backward jumps relative to the current distance (always accepted if allowJump or first computation).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:202
---@param projection table|nil Candidate projection.
---@param allowJump boolean|nil true to ignore the limits.
---@return boolean  true if accepted.
function gameplay_rally_driveline_rallyRouteTracker:_acceptProjection(projection, allowJump) end

--- Diagnostic: returns the segment window examined by the local projection ({firstIdx, lastIdx}) or {fullSearch=true}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:238
---@param segmentIdx integer|nil Previous segment.
---@param forceFullSearch boolean|nil Full search.
---@return table  Window.
function gameplay_rally_driveline_rallyRouteTracker:_computeDebugWindow(segmentIdx, forceFullSearch) end

--- Records the route exit point (distToTarget, routePos, vehiclePos, lateralDist, segmentIdx) on switching to 'offRoute' and sets the recovery distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:220
---@param pos vec3 Vehicle position.
---@param projection table Current projection.
function gameplay_rally_driveline_rallyRouteTracker:_snapshotDeparture(pos, projection) end

--- Stores the last recoverable point (distToTarget and position on the route) and computes recoveryDistToTarget = distToTarget + backoff, capped at the start of the route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:212
---@param pos vec3 Vehicle position.
---@param projection table Current projection.
function gameplay_rally_driveline_rallyRouteTracker:_updateRecoveryCandidate(pos, projection) end

--- Current half-width of the corridor.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:186
---@return number  Meters.
function gameplay_rally_driveline_rallyRouteTracker:getCorridorWidth() end

--- Current options table (shared, not a copy).
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:190
---@return table  Options.
function gameplay_rally_driveline_rallyRouteTracker:getOptions() end

--- Remaining distance to the finish at which to reposition the vehicle: starting point of the route exit (if off the route) or last recoverable point, plus a backoff, capped at the start of the route.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:334
---@param backoffDistance number|nil Backoff in meters (3 m by default).
---@return number|nil  Recovery distToTarget.
function gameplay_rally_driveline_rallyRouteTracker:getRecoveryDistToTarget(backoffDistance) end

--- Snapshot of the tracker state: state, segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, offRouteDistance, onRouteDistance, lastRecoverable*, recoveryDistToTarget, departure, projectionSource ('local', 'full', 'held'), localCandidate, fullCandidate, window, searchBehind, searchAhead.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:347
---@return table  State.
function gameplay_rally_driveline_rallyRouteTracker:getState() end

--- Stores the route, merges the options with the default values and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:134
---@param path table[] Points of the static route.
---@param options table|nil Options overriding the defaults.
function gameplay_rally_driveline_rallyRouteTracker:init(path, options) end

--- Projects a position onto the route without changing state: full search if options.forceFullSearch, otherwise local around the current segment.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:194
---@param pos vec3 Position.
---@param options table|nil {forceFullSearch = boolean}.
---@return table|nil  {segmentIdx, xnorm, distSq, lateralDist, distToTarget, routePos}.
function gameplay_rally_driveline_rallyRouteTracker:project(pos, options) end

--- Resets the tracking state. If a position is given, immediately performs an update with full search and jump allowed.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:142
---@param pos vec3|nil Initial position.
function gameplay_rally_driveline_rallyRouteTracker:reset(pos) end

--- Sets the corridor half-width (offRouteDistance, clamped to [0.1; 15] m) and the return threshold (onRouteDistance = offRouteDistance - 0.1).
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:178
---@param width number Half-width in meters.
function gameplay_rally_driveline_rallyRouteTracker:setCorridorWidth(width) end

--- Enables diagnostic capture (computes an additional full projection on each update).
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:169
---@param enabled boolean true to enable.
function gameplay_rally_driveline_rallyRouteTracker:setDebugCapture(enabled) end

--- Replaces the tracked route and resets the state.
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:173
---@param path table[] New points.
function gameplay_rally_driveline_rallyRouteTracker:setPath(path) end

--- Updates tracking with the vehicle position: projection (local then full if needed), update of segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, then of the onRoute/offRoute state with hysteresis. Returns the retained projection (or the last one if the new one is rejected).
---Source: lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:249
---@param pos vec3 Vehicle position.
---@param updateOptions table|nil {allowJump, forceFullSearch}.
---@return table|nil  Projection, nil if pos is nil or projection impossible.
function gameplay_rally_driveline_rallyRouteTracker:update(pos, updateOptions) end

