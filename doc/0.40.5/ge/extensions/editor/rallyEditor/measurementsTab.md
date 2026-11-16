# `editor_rallyEditor_measurementsTab`

*File: `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua` · VM: Game Engine (GE) · 1174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/measurementsTab")` (file under extensions/ but not a regular extension)

"Measurements" tab of the rally editor: a tool for measuring distances along the road (snaproad). The user creates measurements, clicks points in the 3D view (snapped to the snaproad within 5 m), reorders them, moves them by dragging, and reads the total distance, either following the road ("Follow Route" option) or in a straight line. Measurements are saved automatically in <mission>/measurements.json. The module returns a constructor (class C).

## Notes

- Format of the measurements.json file: { measurements = { ["id"] = {id, name, points = [{x,y,z}], followRoute, color = {r,g,b}, textColor = {r,g,b}} }, nextMeasurementId, updatedAt }.
- Distances in meters. A new measurement's color is random (vivid HSV) and the text color is black or white depending on luminance.
- Point selection radius: 8 m (pointSelectRadius). Without a snaproad, points are not snapped.
- Each modification (creation, deletion, point add/remove/move) calls saveMeasurements(). updateMeasurement (renaming) does not save immediately.
- getMeasurementsFilePath() uses rallyEditor.getMissionDir(), whereas the other tabs use getCurrentMissionDir().

## Class `C`

Tab object returned by the constructor (new(rallyEditor)). Fields: measurements (table id -> measurement {id, name, points (vec3), totalDistance, followRoute, color, textColor}), selectedMeasurementId, selectedPointIndex, nextMeasurementId, snaproad, updatedAt. windowDescription = 'Measurements'.

The module returns a constructor: `local obj = require("editor_rallyEditor_measurementsTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addPointToMeasurement(measurementId, point)` | Adds a point at the end of the measurement, selects it, recomputes the distance and saves. | 576 |
| `C:calculateMeasurementDistance(measurementId)` | Computes and stores totalDistance in meters. With followRoute and a snaproad, the distance follows the road between consecutive points; otherwise it is the sum of the direct distances. 0 if there are fewer than 2 points. | 630 |
| `C:clearState()` | Clears the measurements, the selection and the interaction state. | 45 |
| `C:createMeasurement(name)` | Creates an empty measurement (followRoute = true, random color), selects it and saves. | 502 |
| `C:deleteMeasurement(measurementId)` | Deletes a measurement, deselects if needed, recomputes nextMeasurementId and saves. | 546 |
| `C:deserialize(data)` | Rebuilds the measurements from the JSON data, with default colors (yellow / black), and recomputes nextMeasurementId (largest id + 1). | 103 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Draws the imgui interface: creating/deleting measurements, list, options (Follow Route, colors), total distance, point list and Move Up / Move Down / Delete Point buttons. | 982 |
| `C:drawDebugEntrypoint()` | 3D rendering called every frame: draws the snaproad (black) then the measurement points and lines. | 236 |
| `C:drawMeasurementPoints()` | Draws in 3D the points (spheres), segments, route following and distance labels of each measurement. | 250 |
| `C:findNearestPoint(mousePos)` | Searches, across all measurements, for the point closest to a position. | 747 |
| `C:getMeasurement(measurementId)` | Returns a measurement by identifier. | 532 |
| `C:getMeasurementsFilePath()` | Path of the measurements.json file in the mission folder. | 64 |
| `C:handleMouseInput()` | Handles the mouse in the 3D view: hover, selection, drag-and-drop and adding points snapped to the snaproad (distance < 5 m). | 772 |
| `C:init(rallyEditor)` | Internal constructor: initializes the measurements and the interaction state (hover, drag). | 26 |
| `C:loadMeasurements()` | Reads measurements.json if it exists (updatedAt taken from the file date if missing), deserializes then recomputes the distances. | 155 |
| `C:movePointDown(measurementId, pointIndex)` | Swaps the point with the next one (index + 1), recomputes and saves. | 617 |
| `C:movePointUp(measurementId, pointIndex)` | Swaps the point with the previous one (index - 1), recomputes and saves. | 604 |
| `C:removePointFromMeasurement(measurementId, pointIndex)` | Removes a point (adjusts the selected index), recomputes the distance and saves. | 589 |
| `C:saveMeasurements()` | Updates updatedAt and writes the measurements.json file (automatic save). | 140 |
| `C:selectMeasurement(measurementId)` | Selects a measurement and clears the point selection. | 569 |
| `C:selected()` | Called by the editor when the tab is selected: fetches the snaproad from the pacenotes window, loads measurements.json and emits onEditorEditModeChanged(nil, nil). | 203 |
| `C:serialize()` | Converts the measurements to a JSON-compatible table (vec3 points become {x,y,z}). | 74 |
| `C:setPath(path)` | Sets the current notebook (the code comment notes that "path" actually refers to the notebook). | 193 |
| `C:setSnaproad(snaproad)` | Sets the snaproad used for snapping and distance computation. | 198 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 228 |
| `C:updateMeasurement(measurementId, name)` | Renames a measurement (no immediate save). | 537 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`, `stat`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua`.*
