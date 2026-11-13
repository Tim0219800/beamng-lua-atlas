---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/measurementsTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/rallyEditor/measurementsTab.lua (instanciée par la fonction renvoyée par le module)
---@class editor_rallyEditor_measurementsTab
local editor_rallyEditor_measurementsTab = {}

--- Add point to measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:576
---@param measurementId any
---@param point any
function editor_rallyEditor_measurementsTab:addPointToMeasurement(measurementId, point) end

--- Calculate total distance for a measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:630
---@param measurementId any
function editor_rallyEditor_measurementsTab:calculateMeasurementDistance(measurementId) end

---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:45
function editor_rallyEditor_measurementsTab:clearState() end

--- Create a new measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:502
---@param name any
function editor_rallyEditor_measurementsTab:createMeasurement(name) end

--- Delete measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:546
---@param measurementId any
function editor_rallyEditor_measurementsTab:deleteMeasurement(measurementId) end

--- Deserialize measurements from JSON data
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:103
---@param data any
function editor_rallyEditor_measurementsTab:deserialize(data) end

---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:982
---@param mouseInfo any
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_rallyEditor_measurementsTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Draw debug visualization for measurements and snaproad
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:236
function editor_rallyEditor_measurementsTab:drawDebugEntrypoint() end

--- Draw measurement points and lines
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:250
function editor_rallyEditor_measurementsTab:drawMeasurementPoints() end

--- Find the nearest point to the mouse position
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:747
---@param mousePos any
function editor_rallyEditor_measurementsTab:findNearestPoint(mousePos) end

--- Get measurement by ID
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:532
---@param measurementId any
function editor_rallyEditor_measurementsTab:getMeasurement(measurementId) end

--- Get the measurements file path
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:64
function editor_rallyEditor_measurementsTab:getMeasurementsFilePath() end

--- Handle mouse interactions for placing, selecting, and moving measurement points
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:772
function editor_rallyEditor_measurementsTab:handleMouseInput() end

---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:26
---@param rallyEditor any
function editor_rallyEditor_measurementsTab:init(rallyEditor) end

--- Load measurements from file
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:155
function editor_rallyEditor_measurementsTab:loadMeasurements() end

--- Move point down in measurement (increase index)
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:617
---@param measurementId any
---@param pointIndex any
function editor_rallyEditor_measurementsTab:movePointDown(measurementId, pointIndex) end

--- Move point up in measurement (decrease index)
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:604
---@param measurementId any
---@param pointIndex any
function editor_rallyEditor_measurementsTab:movePointUp(measurementId, pointIndex) end

--- Remove point from measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:589
---@param measurementId any
---@param pointIndex any
function editor_rallyEditor_measurementsTab:removePointFromMeasurement(measurementId, pointIndex) end

--- Save measurements to file (auto-save)
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:140
function editor_rallyEditor_measurementsTab:saveMeasurements() end

--- Select a measurement
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:569
---@param measurementId any
function editor_rallyEditor_measurementsTab:selectMeasurement(measurementId) end

--- called by RallyEditor when this tab is selected.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:203
function editor_rallyEditor_measurementsTab:selected() end

--- Serialize measurements to JSON-compatible format
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:74
function editor_rallyEditor_measurementsTab:serialize() end

--- this is the notebook. why am I still calling it a path???
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:193
---@param path any
function editor_rallyEditor_measurementsTab:setPath(path) end

--- Set the snaproad for distance calculations
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:198
---@param snaproad any
function editor_rallyEditor_measurementsTab:setSnaproad(snaproad) end

--- called by RallyEditor when this tab is unselected.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:228
function editor_rallyEditor_measurementsTab:unselect() end

--- Update measurement name
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:537
---@param measurementId any
---@param name any
function editor_rallyEditor_measurementsTab:updateMeasurement(measurementId, name) end

