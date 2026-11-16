---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/pointList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- List of points returned by the constructor; attribute self.points.
---@class gameplay_rally_driveline_pointList
local gameplay_rally_driveline_pointList = {}

--- Total length of the path (0 if fewer than 2 points).
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:76
---@return number  Length in meters.
function gameplay_rally_driveline_pointList:calculateLength() end

--- Number of points.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:91
---@return integer  Number of points.
function gameplay_rally_driveline_pointList:count() end

--- Creates a point in standard format (normal (0,0,1), empty pacenoteDistances, empty cachedPacenotes). Does not add the point to the list.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:17
---@param pos vec3 Position.
---@param quat quat|nil Orientation (see the bug in notes: do not omit it).
---@param ts number|nil Timestamp in seconds (0 by default).
---@return table  The point.
function gameplay_rally_driveline_pointList:createPoint(pos, quat, ts) end

--- Compatibility stub with DrivelineRoute: returns the list itself (drivelineV3 already simplifies).
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:134
---@return table  self.
function gameplay_rally_driveline_pointList:downsample() end

--- Draws a sphere per point (color recce_driveline_clr, alpha 0.3) and, if requested, the ts timestamp as a label. Call every frame.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:139
---@param drawLabels boolean|nil true to show the ts labels.
function gameplay_rally_driveline_pointList:drawDebug(drawLabels) end

--- Closest point to a position (3D distance, linear scan).
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:113
---@param srcPos vec3 Reference position.
---@return table|nil  Closest point, nil if the list is empty.
function gameplay_rally_driveline_pointList:findNearestPoint(srcPos) end

--- Point at the given index.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:96
---@param index integer Index starting at 1.
---@return table|nil  Point.
function gameplay_rally_driveline_pointList:get(index) end

--- Internal table of all the points (not a copy).
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:101
---@return table[]  Points.
function gameplay_rally_driveline_pointList:getAll() end

--- Stores the provided list of points (empty by default) without computing relations or normals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:12
---@param points table[]|nil Points already in standard format.
function gameplay_rally_driveline_pointList:init(points) end

--- Replaces all the points then recomputes relations and normals.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:106
---@param points table[] New points.
function gameplay_rally_driveline_pointList:setAll(points) end

--- Computes each point's normal with snaproadNormals.forwardNormalVec and creates pacenoteDistances/cachedPacenotes if missing.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:56
function gameplay_rally_driveline_pointList:setupPointNormals() end

--- Fills in id (index), prev and next of each point.
---Source: lua/ge/extensions/gameplay/rally/driveline/pointList.lua:39
function gameplay_rally_driveline_pointList:setupPointRelationships() end

