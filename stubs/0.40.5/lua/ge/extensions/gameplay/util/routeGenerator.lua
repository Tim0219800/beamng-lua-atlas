---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/routeGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedurally generates a race route on the map's road graph (map.getMap().nodes). A guided random walk (preferred angle depending on the requested flow, avoidance of U-turns and dead ends, target trail/dirt/tarmac ratios depending on drivability) produces a path, which is smoothed, resampled every 8 m, then reduced to checkpoints by Douglas-Peucker, shifted ahead of sharp turns and validated by A* so that the ground marker properly follows the generated road. A modder calls it with a start position and a target distance.
--- Access: extension `gameplay_util_routeGenerator`: `extensions.load("gameplay_util_routeGenerator")`, then the global `gameplay_util_routeGenerator`
---@class gameplay_util_routeGenerator
---@field defaultMinDrivability number 0.35. Ground marker routing must use the same value, otherwise phase 3 validates a route the player will never take.
---@field drivabilityPenalty number 10. Drivability penalty to use with ground marker routing.
---@field maxCheckpointRadius number 13 (m). Maximum radius of a generated checkpoint.
gameplay_util_routeGenerator = {}

--- Generates a route of the requested length from a position, with checkpoints, radii and normals.
---Source: lua/ge/extensions/gameplay/util/routeGenerator.lua:608
---@param startPos vec3 Start position.
---@param targetDistanceMeters number Target route length (m).
---@param startDir vec3|nil Start direction, used to choose the road direction; otherwise the nearest connected node.
---@param minDrivability number|nil Minimum drivability of links (0.35 by default).
---@param routeSmoothness integer|nil 1 to 3 (2 by default); the higher, the straighter the route.
---@param lookAheadDistance number|nil Look-ahead distance in m (300 by default).
---@param job table|nil Jobsystem job used to yield between phases.
---@param seed integer|nil Random seed (os.time() by default).
---@param targetRatios table<string, number>|nil Target proportions {trail, dirt, tarmac}.
---@param bandBoundaries number[]|nil Two drivability thresholds separating trail/dirt/tarmac.
---@param checkpointDistance number|nil Target distance between checkpoints in m (130 by default).
---@return vec3[]|nil  Positions of the path traveled (coarse), nil on failure.
---@return vec3[]  Checkpoint positions.
---@return number[]  Checkpoint radii (m).
---@return vec3[]  Checkpoint normals (horizontal direction of passage).
---@return number  Total distance traveled (m).
function gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance) end

--- Picks a random position: a random road node, otherwise a random point in the terrain box, otherwise the origin.
---Source: lua/ge/extensions/gameplay/util/routeGenerator.lua:813
---@return vec3  Chosen position.
function gameplay_util_routeGenerator.pickRandomRoadPoint() end

