---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/measurementsTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab object returned by the constructor (new(rallyEditor)). Fields: measurements (table id -> measurement {id, name, points (vec3), totalDistance, followRoute, color, textColor}), selectedMeasurementId, selectedPointIndex, nextMeasurementId, snaproad, updatedAt. windowDescription = 'Measurements'.
---@class editor_rallyEditor_measurementsTab
local editor_rallyEditor_measurementsTab = {}

--- Adds a point at the end of the measurement, selects it, recomputes the distance and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:576
---@param measurementId integer Identifier.
---@param point vec3 World position.
function editor_rallyEditor_measurementsTab:addPointToMeasurement(measurementId, point) end

--- Computes and stores totalDistance in meters. With followRoute and a snaproad, the distance follows the road between consecutive points; otherwise it is the sum of the direct distances. 0 if there are fewer than 2 points.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:630
---@param measurementId integer Identifier.
---@return number  Total distance in meters.
function editor_rallyEditor_measurementsTab:calculateMeasurementDistance(measurementId) end

--- Clears the measurements, the selection and the interaction state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:45
function editor_rallyEditor_measurementsTab:clearState() end

--- Creates an empty measurement (followRoute = true, random color), selects it and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:502
---@param name string|nil Name; default "Measurement <id>".
---@return table  The created measurement.
function editor_rallyEditor_measurementsTab:createMeasurement(name) end

--- Deletes a measurement, deselects if needed, recomputes nextMeasurementId and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:546
---@param measurementId integer Identifier.
function editor_rallyEditor_measurementsTab:deleteMeasurement(measurementId) end

--- Rebuilds the measurements from the JSON data, with default colors (yellow / black), and recomputes nextMeasurementId (largest id + 1).
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:103
---@param data table|nil Data read from the file; nothing is done if nil.
function editor_rallyEditor_measurementsTab:deserialize(data) end

--- Draws the imgui interface: creating/deleting measurements, list, options (Follow Route, colors), total distance, point list and Move Up / Move Down / Delete Point buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:982
---@param mouseInfo table Mouse information.
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_rallyEditor_measurementsTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- 3D rendering called every frame: draws the snaproad (black) then the measurement points and lines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:236
function editor_rallyEditor_measurementsTab:drawDebugEntrypoint() end

--- Draws in 3D the points (spheres), segments, route following and distance labels of each measurement.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:250
function editor_rallyEditor_measurementsTab:drawMeasurementPoints() end

--- Searches, across all measurements, for the point closest to a position.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:747
---@param mousePos vec3 Reference position.
---@return integer|nil  Measurement identifier.
---@return integer|nil  Point index.
---@return vec3|nil  Point.
---@return number  Distance (math.huge if there are no points).
function editor_rallyEditor_measurementsTab:findNearestPoint(mousePos) end

--- Returns a measurement by identifier.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:532
---@param measurementId integer Identifier.
---@return table|nil  Measurement, or nil.
function editor_rallyEditor_measurementsTab:getMeasurement(measurementId) end

--- Path of the measurements.json file in the mission folder.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:64
---@return string|nil  Path, or nil (with a log error) without a mission folder.
function editor_rallyEditor_measurementsTab:getMeasurementsFilePath() end

--- Handles the mouse in the 3D view: hover, selection, drag-and-drop and adding points snapped to the snaproad (distance < 5 m).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:772
function editor_rallyEditor_measurementsTab:handleMouseInput() end

--- Internal constructor: initializes the measurements and the interaction state (hover, drag).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:26
---@param rallyEditor table Rally editor instance.
function editor_rallyEditor_measurementsTab:init(rallyEditor) end

--- Reads measurements.json if it exists (updatedAt taken from the file date if missing), deserializes then recomputes the distances.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:155
---@return boolean  true if the file was loaded.
function editor_rallyEditor_measurementsTab:loadMeasurements() end

--- Swaps the point with the next one (index + 1), recomputes and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:617
---@param measurementId integer Identifier.
---@param pointIndex integer Point index.
function editor_rallyEditor_measurementsTab:movePointDown(measurementId, pointIndex) end

--- Swaps the point with the previous one (index - 1), recomputes and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:604
---@param measurementId integer Identifier.
---@param pointIndex integer Point index.
function editor_rallyEditor_measurementsTab:movePointUp(measurementId, pointIndex) end

--- Removes a point (adjusts the selected index), recomputes the distance and saves.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:589
---@param measurementId integer Identifier.
---@param pointIndex integer Point index (1-based).
function editor_rallyEditor_measurementsTab:removePointFromMeasurement(measurementId, pointIndex) end

--- Updates updatedAt and writes the measurements.json file (automatic save).
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:140
---@return boolean  false if the file path is unknown.
function editor_rallyEditor_measurementsTab:saveMeasurements() end

--- Selects a measurement and clears the point selection.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:569
---@param measurementId integer|nil Identifier.
function editor_rallyEditor_measurementsTab:selectMeasurement(measurementId) end

--- Called by the editor when the tab is selected: fetches the snaproad from the pacenotes window, loads measurements.json and emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:203
function editor_rallyEditor_measurementsTab:selected() end

--- Converts the measurements to a JSON-compatible table (vec3 points become {x,y,z}).
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:74
---@return table  {measurements, nextMeasurementId, updatedAt}.
function editor_rallyEditor_measurementsTab:serialize() end

--- Sets the current notebook (the code comment notes that "path" actually refers to the notebook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:193
---@param path table Notebook.
function editor_rallyEditor_measurementsTab:setPath(path) end

--- Sets the snaproad used for snapping and distance computation.
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:198
---@param snaproad table|nil Snaproad object.
function editor_rallyEditor_measurementsTab:setSnaproad(snaproad) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:228
function editor_rallyEditor_measurementsTab:unselect() end

--- Renames a measurement (no immediate save).
---Source: lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:537
---@param measurementId integer Identifier.
---@param name string New name.
function editor_rallyEditor_measurementsTab:updateMeasurement(measurementId, name) end

