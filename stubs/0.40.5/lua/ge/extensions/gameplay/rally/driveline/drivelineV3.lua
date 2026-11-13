---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_driveline_drivelineV3
local gameplay_rally_driveline_drivelineV3 = {}

--- Projects p1 and p2 onto the final driveline segments and returns the ordered
---  segment range covering the span between them:
---    startIdx, startXnorm, endIdx, endXnorm (startIdx/startXnorm always come first)
---  Returns nil if the range cannot be resolved.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:662
---@param p1 any
---@param p2 any
function gameplay_rally_driveline_drivelineV3:_findSegmentRange(p1, p2) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:724
---@param p1 any
---@param p2 any
function gameplay_rally_driveline_drivelineV3:calculateDistanceBetweenPoints(p1, p2) end

--- Convert driveline points to spline structure with RDP simplification
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:335
---@param drivelinePoints any
function gameplay_rally_driveline_drivelineV3:convertDrivelineToSpline(drivelinePoints) end

--- Create a new driveline from the edited spline
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:481
function gameplay_rally_driveline_drivelineV3:createDrivelineFromSpline() end

--- Helper: Convert array of positions to full driveline point structure
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:418
---@param positions any
function gameplay_rally_driveline_drivelineV3:createDrivelinePointsFromPositions(positions) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:65
---@param name any
---@param isLoop any
---@param id any
function gameplay_rally_driveline_drivelineV3:createEmptySpline(name, isLoop, id) end

--- Deep copy function for undo/redo
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:503
function gameplay_rally_driveline_drivelineV3:deepCopySpline() end

--- Get a PointList from the final points
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:493
function gameplay_rally_driveline_drivelineV3:getFinalPointList() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:654
function gameplay_rally_driveline_drivelineV3:getLiaisonAllocatedTimeSecs() end

--- Returns the ordered list of finalDrivelinePoints covering the span between p1
---  and p2 (inclusive of the segment endpoints), or nil if it can't be resolved.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:713
---@param p1 any
---@param p2 any
function gameplay_rally_driveline_drivelineV3:getPointsBetween(p1, p2) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:650
function gameplay_rally_driveline_drivelineV3:getSpeedLimitKph() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:41
---@param missionDir any
function gameplay_rally_driveline_drivelineV3:init(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:266
function gameplay_rally_driveline_drivelineV3:loadDrivelineFromFile() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:176
function gameplay_rally_driveline_drivelineV3:loadDrivelineSplineFromFile() end

--- Load final driveline from JSON file
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:228
function gameplay_rally_driveline_drivelineV3:loadFinalDrivelineFromFile() end

--- Complete loading pipeline: load raw recording → convert → process → generate final points
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:306
function gameplay_rally_driveline_drivelineV3:loadFromRecording() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:86
---@param data any
function gameplay_rally_driveline_drivelineV3:loadPropertiesFromData(data) end

--- Load raw driveline recording from recce
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:209
function gameplay_rally_driveline_drivelineV3:loadRecceRecording() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:120
---@param data any
function gameplay_rally_driveline_drivelineV3:loadSplineFromData(data) end

--- Render final driveline points
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:587
function gameplay_rally_driveline_drivelineV3:renderFinalDriveline() end

--- Render raw driveline points
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:537
function gameplay_rally_driveline_drivelineV3:renderRawDriveline() end

--- Render smooth spline curve
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:563
---@param lineWidth any
function gameplay_rally_driveline_drivelineV3:renderSmoothCurve(lineWidth) end

--- Render editable spline with nodes
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:613
---@param selectedNodeIdx any
function gameplay_rally_driveline_drivelineV3:renderSpline(selectedNodeIdx) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:145
function gameplay_rally_driveline_drivelineV3:saveSplineToFile() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:97
function gameplay_rally_driveline_drivelineV3:serializeSpline() end

--- Update spline geometry (compute smooth curve, terrain conformance)
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:383
function gameplay_rally_driveline_drivelineV3:updateSplineGeometry() end

