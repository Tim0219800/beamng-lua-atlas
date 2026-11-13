---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/raceRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/route/raceRoute.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_route_raceRoute
local gameplay_route_raceRoute = {}

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:132
function gameplay_route_raceRoute:calcDistance() end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:347
function gameplay_route_raceRoute:clear() end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:352
function gameplay_route_raceRoute:getNextFixedWP() end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:434
---@param currentPos any
function gameplay_route_raceRoute:getPositionOffset(currentPos) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:13
---@param removeFirst any
---@param useMapPathfinding any
---@param closeDistSquared any
---@param logTag any
function gameplay_route_raceRoute:init(removeFirst, useMapPathfinding, closeDistSquared, logTag) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:358
---@param startPos any
function gameplay_route_raceRoute:recalculateRoute(startPos) end

--- The difference with recalculateRoute() is that this function uses the
---  original fixed positions, ie the original unshorted self.path points,
---  instead of the remaining points in self.path after repeated shortening.
---  It also uses a callback to determine whether a point should be considered fixed for recalculation.
---  The overall behavior is that the route is recalculatd along the same path as when the route created.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:389
---@param startPos any
function gameplay_route_raceRoute:recalculateRouteWithOriginalPositions(startPos) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:64
---@param cutOffDrivability any
---@param dirMult any
---@param penaltyAboveCutoff any
---@param penaltyBelowCutoff any
---@param wD any
---@param wZ any
function gameplay_route_raceRoute:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:45
---@param enabled any
function gameplay_route_raceRoute:setTrackingMutationEnabled(enabled) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:143
---@param fromPos any
---@param toPos any
function gameplay_route_raceRoute:setupPath(fromPos, toPos) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:163
---@param positions any
function gameplay_route_raceRoute:setupPathMulti(positions) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:147
---@param wpList any
function gameplay_route_raceRoute:setupPathMultiWaypoints(wpList) end

--- Parameters:
---  * positions (array): table of tables with the following fields:
---    Required fields:
---    * pos (vec3): position of the node
---    Optional fields:
---    * mergePriority (float): used to merge nodes into one. lower values are merged into higher values.
---    * metadata (table): used to store additional data for each node. merging
---                        behavior is defined by the metadata. metadata with same keys will have the
---                        higher mergePriority value kept.
---    Internally added fields: wp, fixed
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:183
---@param positions any
function gameplay_route_raceRoute:setupPathMultiWithMetadata(positions) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:459
---@param idx any
function gameplay_route_raceRoute:shortenPath(idx) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:106
---@param stepDist any
---@param reset any
function gameplay_route_raceRoute:stepAhead(stepDist, reset) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:473
function gameplay_route_raceRoute:trackCamera() end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:474
---@param pos any
function gameplay_route_raceRoute:trackPosition(pos) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:472
---@param veh any
function gameplay_route_raceRoute:trackVehicle(veh) end

---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:477
---@param pos any
function gameplay_route_raceRoute:updatePathForPos(pos) end

