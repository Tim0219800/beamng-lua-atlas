---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/route.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/route/route.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_route_route
local gameplay_route_route = {}

---Source : lua/ge/extensions/gameplay/route/route.lua:85
function gameplay_route_route:calcDistance() end

---Source : lua/ge/extensions/gameplay/route/route.lua:249
function gameplay_route_route:clear() end

---Source : lua/ge/extensions/gameplay/route/route.lua:256
function gameplay_route_route:getNextFixedWP() end

--- local offPathDist = 25
---Source : lua/ge/extensions/gameplay/route/route.lua:373
---@param currentPos any
function gameplay_route_route:getPositionOffset(currentPos) end

---Source : lua/ge/extensions/gameplay/route/route.lua:27
function gameplay_route_route:init() end

---Source : lua/ge/extensions/gameplay/route/route.lua:288
---@param startPos any
function gameplay_route_route:recalculateRoute(startPos) end

---Source : lua/ge/extensions/gameplay/route/route.lua:36
---@param cutOffDrivability any
---@param dirMult any
---@param penaltyAboveCutoff any
---@param penaltyBelowCutoff any
---@param wD any
---@param wZ any
function gameplay_route_route:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

---Source : lua/ge/extensions/gameplay/route/route.lua:102
---@param fromPos any
---@param toPos any
function gameplay_route_route:setupPath(fromPos, toPos) end

---Source : lua/ge/extensions/gameplay/route/route.lua:181
---@param positions any
function gameplay_route_route:setupPathMulti(positions) end

--- Same as setupPathMulti but pathfinding runs in core_jobsystem (yields between search steps). Optional onComplete(route) when done.
---  self.path is updated only when the job finishes. If called again while a job is still active, the previous job is cancelled and replaced (warning logged).
---Source : lua/ge/extensions/gameplay/route/route.lua:216
---@param positions any
---@param onComplete any
function gameplay_route_route:setupPathMultiJob(positions, onComplete) end

---Source : lua/ge/extensions/gameplay/route/route.lua:106
---@param wpList any
function gameplay_route_route:setupPathMultiWaypoints(wpList) end

---Source : lua/ge/extensions/gameplay/route/route.lua:399
---@param idx any
function gameplay_route_route:shortenPath(idx) end

---Source : lua/ge/extensions/gameplay/route/route.lua:59
---@param stepDist any
---@param reset any
function gameplay_route_route:stepAhead(stepDist, reset) end

---Source : lua/ge/extensions/gameplay/route/route.lua:408
function gameplay_route_route:trackCamera() end

---Source : lua/ge/extensions/gameplay/route/route.lua:409
---@param pos any
function gameplay_route_route:trackPosition(pos) end

---Source : lua/ge/extensions/gameplay/route/route.lua:407
---@param veh any
function gameplay_route_route:trackVehicle(veh) end

---Source : lua/ge/extensions/gameplay/route/route.lua:262
function gameplay_route_route:unflagFirstFixedNode() end

---Source : lua/ge/extensions/gameplay/route/route.lua:412
---@param pos any
function gameplay_route_route:updatePathForPos(pos) end

