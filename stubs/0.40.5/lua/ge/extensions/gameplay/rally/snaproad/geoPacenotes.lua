---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_snaproad_geoPacenotes` : `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, puis la globale `gameplay_rally_snaproad_geoPacenotes`
---@class gameplay_rally_snaproad_geoPacenotes
---@field defaultMeasurementType string
---@field measurementTypeOrder table
---@field measurementTypes table
gameplay_rally_snaproad_geoPacenotes = {}

--- Calculate circle from points using the simpler 2D method
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:220
---@param p1 any
---@param p2 any
---@param p3 any
function gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3) end

--- Calculate middle point between start and end positions
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:515
---@param pn any
---@param startPos any
---@param endPos any
---@param partition any
function gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition) end

--- Draw pacenote measurements using minimal circle data and original points (always uses prisms)
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:773
---@param center any
---@param radius any
---@param arcDistance any
---@param p1 any
---@param p2 any
---@param p3 any
---@param clr any
---@param alpha any
---@param prefix any
---@param fitQuality any
---@param arcDegrees any
function gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees) end

---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:800
---@param pn any
---@param focusPoints any
---@param skipAuto any
function gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto) end

---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:32
function gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions() end

---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:27
---@param measurementType any
function gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType) end

