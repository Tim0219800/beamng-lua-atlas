---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/routeGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_util_routeGenerator` : `extensions.load("gameplay_util_routeGenerator")`, puis la globale `gameplay_util_routeGenerator`
---@class gameplay_util_routeGenerator
---@field defaultMinDrivability number
---@field drivabilityPenalty number
---@field maxCheckpointRadius number
gameplay_util_routeGenerator = {}

---Source : lua/ge/extensions/gameplay/util/routeGenerator.lua:608
---@param startPos any
---@param targetDistanceMeters any
---@param startDir any
---@param minDrivability any
---@param routeSmoothness any
---@param lookAheadDistance any
---@param job any
---@param seed any
---@param targetRatios any
---@param bandBoundaries any
---@param checkpointDistance any
function gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance) end

---Source : lua/ge/extensions/gameplay/util/routeGenerator.lua:813
function gameplay_util_routeGenerator.pickRandomRoadPoint() end

