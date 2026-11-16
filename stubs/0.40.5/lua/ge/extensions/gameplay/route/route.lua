---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/route.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Route. Fields: path, dirMult (1e3), distance, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, done, lastDist, lastIndexAtDist, lockFixedNodes.
---@class gameplay_route_route
local gameplay_route_route = {}

--- Recalculates distToTarget of each point (remaining distance to the end) and self.distance.
---Source: lua/ge/extensions/gameplay/route/route.lua:85
---@return number  Total length in meters.
function gameplay_route_route:calcDistance() end

--- Cancels ongoing jobs and clears the path.
---Source: lua/ge/extensions/gameplay/route/route.lua:249
function gameplay_route_route:clear() end

--- Position of the first fixed point of the path.
---Source: lua/ge/extensions/gameplay/route/route.lua:256
---@return vec3|nil  Position, nil if none.
function gameplay_route_route:getNextFixedWP() end

--- Finds the path segment closest to a position.
---Source: lua/ge/extensions/gameplay/route/route.lua:373
---@param currentPos vec3 Position to test.
---@return integer  Segment index if within 18 m, 0 otherwise.
---@return number  Minimum distance to the path in meters.
function gameplay_route_route:getPositionOffset(currentPos) end

--- Constructor: empty path, dirMult = 1e3, no job running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/route/route.lua:27
function gameplay_route_route:init() end

--- Recalculates the route from startPos in an asynchronous task. If a fixed point exists, only redoes the section up to it then reattaches the rest; otherwise redoes the route up to the last point. Emits the onRecalculatedRoute hook at the end. Cancels previous jobs.
---Source: lua/ge/extensions/gameplay/route/route.lua:288
---@param startPos vec3 New starting point.
function gameplay_route_route:recalculateRoute(startPos) end

--- Sets the search parameters passed to map.getPointToPointPath / map.getPath.
---Source: lua/ge/extensions/gameplay/route/route.lua:36
---@param cutOffDrivability number|nil Road drivability threshold.
---@param dirMult number|nil Direction multiplier; default 1e3.
---@param penaltyAboveCutoff number|nil Penalty above the threshold.
---@param penaltyBelowCutoff number|nil Penalty below the threshold.
---@param wD number|nil Distance weight (inferred from the name).
---@param wZ number|nil Altitude weight (inferred from the name).
function gameplay_route_route:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Simple route between two positions (calls setupPathMulti).
---Source: lua/ge/extensions/gameplay/route/route.lua:102
---@param fromPos vec3 Start.
---@param toPos vec3 End.
function gameplay_route_route:setupPath(fromPos, toPos) end

--- Builds (synchronously) a path through all the positions. The arrival of each segment is a `fixed` point. Close points are merged and the endpoints are adjusted to the closest segment.
---Source: lua/ge/extensions/gameplay/route/route.lua:181
---@param positions vec3[] At least 2 positions.
function gameplay_route_route:setupPathMulti(positions) end

--- Like setupPathMulti but the search runs in core_jobsystem (yields between steps). self.path is replaced once the computation finishes. Cancels any ongoing recalculation or previous job.
---Source: lua/ge/extensions/gameplay/route/route.lua:216
---@param positions vec3[] Positions to connect.
---@param onComplete function|nil Called with the route at the end of the job.
function gameplay_route_route:setupPathMultiJob(positions, onComplete) end

--- Appends to the path the navgraph nodes between given waypoints (map.getPath), without consecutive duplicates, then computes the distances.
---Source: lua/ge/extensions/gameplay/route/route.lua:106
---@param wpList string[] List of navgraph node names.
function gameplay_route_route:setupPathMultiWaypoints(wpList) end

--- Removes the points before index idx (the first idx-1 points).
---Source: lua/ge/extensions/gameplay/route/route.lua:399
---@param idx integer Current segment index.
function gameplay_route_route:shortenPath(idx) end

--- Returns the point located stepDist meters further along the route, storing the last position to speed up successive calls.
---Source: lua/ge/extensions/gameplay/route/route.lua:59
---@param stepDist number Distance to advance (m), accumulated with the previous one unless reset.
---@param reset boolean|nil true to restart from the beginning.
---@return table|nil  {n1, n2, idx, pos, xnorm}; nil if the path has fewer than 2 points. At the end of the route, returns the last segment with xnorm = 1.
function gameplay_route_route:stepAhead(stepDist, reset) end

--- Tracks the camera (core_camera.getPosition).
---Source: lua/ge/extensions/gameplay/route/route.lua:408
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_route:trackCamera() end

--- Tracks an arbitrary position.
---Source: lua/ge/extensions/gameplay/route/route.lua:409
---@param pos vec3 Position.
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_route:trackPosition(pos) end

--- Tracks a vehicle (updatePathForPos on its position).
---Source: lua/ge/extensions/gameplay/route/route.lua:407
---@param veh table Vehicle object.
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_route:trackVehicle(veh) end

--- Removes the fixed flag from the first fixed point (stage reached).
---Source: lua/ge/extensions/gameplay/route/route.lua:262
---@return boolean  true if a point was modified.
function gameplay_route_route:unflagFirstFixedNode() end

--- Updates the route for a position: starts a recalculation if 18 m or more from every segment, cancels a recalculation that has become unnecessary, shortens the path and adjusts the first point to the position. Sets done = true if the path has fewer than 2 points.
---Source: lua/ge/extensions/gameplay/route/route.lua:412
---@param pos vec3 Current position.
---@return integer|nil  Segment index (0 if off the path).
---@return number|nil  Distance to the path in meters.
function gameplay_route_route:updatePathForPos(pos) end

