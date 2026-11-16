---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Geometric measurement of the pacenotes' corners from the road (snaproad). From the points of a partition, it fits one or more circles (2D three-point method) to obtain radius, diameter, arc length, angle and fit quality, in three variants: 'single' (one circle), 'split2' (two parts), 'split3' (three parts). From this it derives the corner intensity (according to the notebook's text compositor), the direction, the hairpin candidates and the diameter change. It also draws the measurement in debug. Called by Snaproad:measurePartition in the rally editor.
--- Access: extension `gameplay_rally_snaproad_geoPacenotes`: `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, then the global `gameplay_rally_snaproad_geoPacenotes`
---@class gameplay_rally_snaproad_geoPacenotes
---@field defaultMeasurementType string Default measurement type: 'single'.
---@field measurementTypeOrder string[] Order of the types: 'single', 'split2', 'split3'.
---@field measurementTypes table<string, table> Description of each type: {id, label ('Single fit', 'Two-part fit', 'Three-part fit'), segmentCount (1, 2, 3)}.
gameplay_rally_snaproad_geoPacenotes = {}

--- Computes the circle through three points with the 2D (XY) method: center (average Z of the three points), radius (2D distance from the center to p1) and arc length from p1 to p3 through p2 (direction determined by the cross product).
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:220
---@param p1 vec3 First point
---@param p2 vec3 Intermediate point
---@param p3 vec3 Last point
---@return vec3|nil  Center; nil if the points are collinear
---@return number  Radius in meters (0 on failure)
---@return number  Arc length in meters (0 on failure)
function gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3) end

--- Midpoint of a corner: the pacenote's halfpointPos or halfpoint if it exists, otherwise the partition's focus point closest to the geometric middle between start and end.
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:515
---@param pn table Pacenote
---@param startPos vec3 Start of the corner
---@param endPos vec3 End of the corner
---@param partition table Partition with focus_points
---@return vec3  Position of the middle
function gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition) end

--- Draws a measurement with debugDrawer: circle arc as prisms, radii, and arc text (length, diameter, fit quality, angle). Draws nothing if the center is nil or the radius <= 0.
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:773
---@param center vec3|nil Circle center
---@param radius number Radius (m)
---@param arcDistance number Arc length (m)
---@param p1 vec3 Start of the arc
---@param p2 vec3 Intermediate point
---@param p3 vec3 End of the arc
---@param clr table|nil Color (purple by default)
---@param alpha number|nil Opacity (0.7 by default)
---@param prefix string|nil Text prefix
---@param fitQuality number|nil Fit quality (normalized RMSE)
---@param arcDegrees number|nil Arc angle in degrees
function gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees) end

--- Measures a pacenote's corner from the partition's focus points: builds the path, fits the circles of the three variants, annotates intensity, direction and hairpin, and fills in pn.measurements (see notes).
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:800
---@param pn table Pacenote with start and end waypoints
---@param focusPoints table[] Partition's focus points (at least 3)
---@param skipAuto boolean|nil Unused
function gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto) end

--- Ordered list of the measurement type definitions (for a dropdown).
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:32
---@return table[]  Items {id, label, segmentCount}
function gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions() end

--- Returns the type if it exists, otherwise the default type ('single').
---Source: lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:27
---@param measurementType string|nil Measurement type
---@return string  Valid type
function gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType) end

