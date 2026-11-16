---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/raceRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Race route. Fields: path, removeFirst, useMapPathfinding, closeDistSquared, originalFixedPositions, dirMult, callbacks, trackingMutationEnabled, done, plus the search parameters (cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ).
---@class gameplay_route_raceRoute
local gameplay_route_raceRoute = {}

--- Recalculates distToTarget of each point.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:132
---@return number  Total length in meters.
function gameplay_route_raceRoute:calcDistance() end

--- Clears the path (without touching originalFixedPositions).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:347
function gameplay_route_raceRoute:clear() end

--- Position of the first fixed point of the path.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:352
---@return vec3|nil  Position, nil if none.
function gameplay_route_raceRoute:getNextFixedWP() end

--- Finds the closest segment to a position (threshold 15 m).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:434
---@param currentPos vec3 Position to test.
---@return integer  Segment index, 0 if off the path.
---@return number  Minimum distance to the path in meters.
function gameplay_route_raceRoute:getPositionOffset(currentPos) end

--- Constructor with options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:13
---@param removeFirst boolean|nil true (default): the first point is not fixed. false: it is marked fixed.
---@param useMapPathfinding boolean|nil true (default): uses the navgraph; false: simply connects the positions.
---@param closeDistSquared number|nil Squared distance (m2) below which two points are merged; default 1.
---@param logTag string|nil No real effect (see notes).
function gameplay_route_raceRoute:init(removeFirst, useMapPathfinding, closeDistSquared, logTag) end

--- Rebuilds the path from startPos, passing through all remaining fixed points, then emits onRecalculatedRoute('raceRoute').
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:358
---@param startPos vec3 New start.
function gameplay_route_raceRoute:recalculateRoute(startPos) end

--- Like recalculateRoute but starts from the original (unshortened) fixed points. An original point is kept if the shouldPointBeFixedForRecalc callback returns true, and the last point is always kept. Emits onRecalculatedRoute('raceRoute').
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:389
---@param startPos vec3 New start.
function gameplay_route_raceRoute:recalculateRouteWithOriginalPositions(startPos) end

--- Sets the navgraph search parameters.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:64
---@param cutOffDrivability number|nil Drivability threshold.
---@param dirMult number|nil Direction multiplier; default 1e3.
---@param penaltyAboveCutoff number|nil Penalty above the threshold.
---@param penaltyBelowCutoff number|nil Penalty below the threshold.
---@param wD number|nil Distance weight (inferred from the name).
---@param wZ number|nil Altitude weight (inferred from the name).
function gameplay_route_raceRoute:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- If false, updatePathForPos no longer modifies the path (no recalculation or shortening) and only returns the offset.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:45
---@param enabled boolean Allows path mutation.
function gameplay_route_raceRoute:setTrackingMutationEnabled(enabled) end

--- Route between two positions.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:143
---@param fromPos vec3 Start.
---@param toPos vec3 End.
function gameplay_route_raceRoute:setupPath(fromPos, toPos) end

--- Builds the path for a list of plain positions (wraps them in {pos=...} then calls setupPathMultiWithMetadata).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:163
---@param positions vec3[] Positions to connect.
function gameplay_route_raceRoute:setupPathMulti(positions) end

--- Appends to the path the navgraph nodes between given waypoints (map.getPath).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:147
---@param wpList string[] Navgraph node names.
function gameplay_route_raceRoute:setupPathMultiWaypoints(wpList) end

--- Builds the path for positions with optional metadata. Each arrival becomes a fixed point that keeps its metadata; points that are too close are merged (onMetadataMerge callback possible); the endpoints are adjusted; onPointProcessed is called for each point; the original fixed points are stored on the first call.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:183
---@param positions table[] List of {pos = vec3, wp = string|nil, metadata = any}. Only pos is required.
function gameplay_route_raceRoute:setupPathMultiWithMetadata(positions) end

--- Removes the points before index idx.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:459
---@param idx integer Current segment index.
function gameplay_route_raceRoute:shortenPath(idx) end

--- Point located stepDist meters further along the route (same logic as route.lua).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:106
---@param stepDist number Distance to advance (m).
---@param reset boolean|nil true to restart from the beginning.
---@return table|nil  {n1, n2, idx, pos, xnorm}, nil if fewer than 2 points.
function gameplay_route_raceRoute:stepAhead(stepDist, reset) end

--- Tracks the camera (core_camera.getPosition).
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:473
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_raceRoute:trackCamera() end

--- Tracks an arbitrary position.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:474
---@param pos vec3 Position.
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_raceRoute:trackPosition(pos) end

--- Tracks a vehicle.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:472
---@param veh table Vehicle object.
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_raceRoute:trackVehicle(veh) end

--- Updates the route for a position: recalculates if off the path (>= 15 m), shortens the path and adjusts the first point (resetting its metadata to nil). Without allowed mutation, only computes the offset.
---Source: lua/ge/extensions/gameplay/route/raceRoute.lua:477
---@param pos vec3 Current position.
---@return integer|nil  Segment index.
---@return number|nil  Distance to the path.
function gameplay_route_raceRoute:updatePathForPos(pos) end

