---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driveline V3 returned by the constructor. Attributes: missionDir, rawDrivelinePoints, spline, finalDrivelinePoints, simplificationTolerance, properties, stats.
---@class gameplay_rally_driveline_drivelineV3
local gameplay_rally_driveline_drivelineV3 = {}

--- Projects p1 and p2 onto the final driveline's segments (closest projection) and returns the ordered segment range: startIdx, startXnorm, endIdx, endXnorm (the start always comes first). nil if unresolved.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:662
---@param p1 vec3 First point.
---@param p2 vec3 Second point.
---@return integer|nil  startIdx.
---@return number|nil  startXnorm.
---@return integer|nil  endIdx.
---@return number|nil  endXnorm.
function gameplay_rally_driveline_drivelineV3:_findSegmentRange(p1, p2) end

--- Distance along the final driveline between the projections of p1 and p2 (partial start and end segments computed with xnorm).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:724
---@param p1 vec3 First point.
---@param p2 vec3 Second point.
---@return number  Distance in meters (0 if unresolved).
function gameplay_rally_driveline_drivelineV3:calculateDistanceBetweenPoints(p1, p2) end

--- Converts driveline points to a spline: positions, constant width, normals; RDP simplification (simplificationTolerance tolerance). Logs the reduction ratio.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:335
---@param drivelinePoints table[]|nil Points {pos, normal?}; rawDrivelinePoints by default. If provided, they replace rawDrivelinePoints.
---@return boolean  false if fewer than 2 points.
function gameplay_rally_driveline_drivelineV3:convertDrivelineToSpline(drivelinePoints) end

--- Generates finalDrivelinePoints from the spline's subdivided points (divPoints). Sets finalDrivelinePoints to nil if the spline is not ready.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:481
---@return boolean  true if final points exist.
function gameplay_rally_driveline_drivelineV3:createDrivelineFromSpline() end

--- Converts a list of positions into full points: orientation (quatFromDir from the direction toward the next point), ts = index/5, prev/next/id chaining, normal (SnaproadNormals.forwardNormalVec), empty pacenoteDistances and cachedPacenotes.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:418
---@param positions vec3[] At least 2 positions.
---@return table[]|nil  Points, nil if fewer than 2 positions.
function gameplay_rally_driveline_drivelineV3:createDrivelinePointsFromPositions(positions) end

--- Creates an empty spline table ({name, id, isDirty, isEnabled, isLoop, nodes, widths, nmls, divPoints, divWidths, tangents, binormals, normals, discMap}). The id is a UUID if absent.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:65
---@param name string|nil Name ('Driveline' by default).
---@param isLoop boolean|nil Closed spline.
---@param id string|nil Identifier.
---@return table  Empty spline.
function gameplay_rally_driveline_drivelineV3:createEmptySpline(name, isLoop, id) end

--- Deep copy of the spline (nodes, widths, nmls and simple metadata) for undo/redo in the editor. Does not copy the secondary geometry.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:503
---@return table|nil  Copy of the spline.
function gameplay_rally_driveline_drivelineV3:deepCopySpline() end

--- Returns a PointList built from the final points (nil and a warning if there are fewer than 2).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:493
---@return table|nil  PointList instance.
function gameplay_rally_driveline_drivelineV3:getFinalPointList() end

--- Time allocated for the liaison, in seconds (liaisonAllocatedTimeMins x 60).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:654
---@return number  Seconds.
function gameplay_rally_driveline_drivelineV3:getLiaisonAllocatedTimeSecs() end

--- Ordered list of the final points covering the interval between p1 and p2 (segment endpoints included).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:713
---@param p1 vec3 First point.
---@param p2 vec3 Second point.
---@return table[]|nil  Points, or nil if unresolved.
function gameplay_rally_driveline_drivelineV3:getPointsBetween(p1, p2) end

--- Driveline speed limit (speedLimitKph property).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:650
---@return number  km/h.
function gameplay_rally_driveline_drivelineV3:getSpeedLimitKph() end

--- Stores the mission folder and initializes the state (default simplification tolerance, default properties, no data loaded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:41
---@param missionDir string Mission folder.
function gameplay_rally_driveline_drivelineV3:init(missionDir) end

--- Loads the driveline from a file: spline if present, otherwise the old final driveline converted to a spline then regenerated.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:266
---@return boolean  true if loaded.
function gameplay_rally_driveline_drivelineV3:loadDrivelineFromFile() end

--- Loads the spline from its file, computes its geometry and generates the final points.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:176
---@return boolean  true if everything succeeded.
function gameplay_rally_driveline_drivelineV3:loadDrivelineSplineFromFile() end

--- Loads the old final driveline (list of [x,y,z] points, at least 2) and turns it into full points; also reads the properties.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:228
---@return boolean  true if loaded.
function gameplay_rally_driveline_drivelineV3:loadFinalDrivelineFromFile() end

--- Full pipeline: loads the recce recording, converts to a spline, computes the geometry, generates the final points.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:306
---@return boolean  true if all steps succeeded.
function gameplay_rally_driveline_drivelineV3:loadFromRecording() end

--- Reads data.properties (speedLimitKph, liaisonAllocatedTimeMins, useRaycast, vertRayRaise) with default values.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:86
---@param data table|nil JSON data.
function gameplay_rally_driveline_drivelineV3:loadPropertiesFromData(data) end

--- Loads the raw points recorded during the recce (DrivelineRecording.load) into rawDrivelinePoints.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:209
---@return boolean  true if loaded.
function gameplay_rally_driveline_drivelineV3:loadRecceRecording() end

--- Builds the spline from JSON data (nodes, widths, nmls, properties, stats). Fails if fewer than 2 nodes or an invalid node.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:120
---@param data table Data read from a spline file.
---@return boolean  true if loaded.
function gameplay_rally_driveline_drivelineV3:loadSplineFromData(data) end

--- Draws the final points as semi-transparent red cylinders with stakes.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:587
function gameplay_rally_driveline_drivelineV3:renderFinalDriveline() end

--- Draws (debugDrawer) the raw points: pink-purple cylinders between points and small vertical stakes. Call every frame.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:537
function gameplay_rally_driveline_drivelineV3:renderRawDriveline() end

--- Draws the smoothed curve (divPoints) as a blue prism the width of a vehicle.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:563
---@param lineWidth number|nil Prism width in m (1.945 by default).
function gameplay_rally_driveline_drivelineV3:renderSmoothCurve(lineWidth) end

--- Draws the editable spline (rSpline editor tools) with start and end markers; for a single node, draws the node's sphere.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:613
---@param selectedNodeIdx integer|nil Selected node (highlighted).
function gameplay_rally_driveline_drivelineV3:renderSpline(selectedNodeIdx) end

--- Writes the spline to the mission's spline file (folder created if needed).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:145
---@return boolean  true if the write succeeded.
function gameplay_rally_driveline_drivelineV3:saveSplineToFile() end

--- Serializes the current spline into a JSON table {version=1, name, isLoop, nodes, widths, nmls, properties, stats}. Returns nil if fewer than 2 nodes.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:97
---@return table|nil  Spline data.
function gameplay_rally_driveline_drivelineV3:serializeSpline() end

--- Recomputes the spline's secondary geometry (subdivided points divPoints, tangents, normals...) conforming to the terrain via zSnap.conformSplineGeometry, and its roadLength length.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:383
---@return boolean  false if no spline or fewer than 2 nodes.
function gameplay_rally_driveline_drivelineV3:updateSplineGeometry() end

