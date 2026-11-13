---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/pointList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/driveline/pointList.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_driveline_pointList
local gameplay_rally_driveline_pointList = {}

--- Calculate total length of the point list
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:76
function gameplay_rally_driveline_pointList:calculateLength() end

--- Get number of points
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:91
function gameplay_rally_driveline_pointList:count() end

--- Create a new point with the standard format
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:17
---@param pos any
---@param quat any
---@param ts any
function gameplay_rally_driveline_pointList:createPoint(pos, quat, ts) end

--- Downsample stub (for compatibility with DrivelineRoute)
---  DrivelineV3 already performs simplification, so this just returns self
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:134
function gameplay_rally_driveline_pointList:downsample() end

--- Draw debug visualization of all points
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:139
---@param drawLabels any
function gameplay_rally_driveline_pointList:drawDebug(drawLabels) end

--- Find nearest point to a given position
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:113
---@param srcPos any
function gameplay_rally_driveline_pointList:findNearestPoint(srcPos) end

--- Get point at index
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:96
---@param index any
function gameplay_rally_driveline_pointList:get(index) end

--- Get all points
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:101
function gameplay_rally_driveline_pointList:getAll() end

--- PointList represents a series of points along a path
---  Each point has: pos, quat, ts, normal, prev, next, id, pacenoteDistances, cachedPacenotes
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:12
---@param points any
function gameplay_rally_driveline_pointList:init(points) end

--- Set all points (and update relationships/normals)
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:106
---@param points any
function gameplay_rally_driveline_pointList:setAll(points) end

--- Calculate and set normals for all points
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:56
function gameplay_rally_driveline_pointList:setupPointNormals() end

--- Set up prev/next relationships and IDs for all points
---Source : lua/ge/extensions/gameplay/rally/driveline/pointList.lua:39
function gameplay_rally_driveline_pointList:setupPointRelationships() end

