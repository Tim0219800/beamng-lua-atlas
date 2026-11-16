# `gameplay_rally_transcripts_entry`

*File: `lua/ge/extensions/gameplay/rally/transcripts/entry.lua` · VM: Game Engine (GE) · 534 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/transcripts/entry")` (file under extensions/ but not a regular extension)

An individual rally recce transcription: the recognized text of the co-driver's voice, its source, its timestamp and the vehicle data at the time of the phrase (position, orientation, and steering captures). Mainly used by the rally editor to display a 3D car in debug, color the trajectory according to the steering angle (corner call) and start a camera path. The module returns a constructor: `require(...)(path, name, forceId)`; the object is an element of `sortedList` (id, name, sortOrder).

## Notes

- The vehicle_data field is a container: vehicle_data.vehicle_data contains {pos, quat} of the vehicle and vehicle_data.capture_data contains {captures, cornerAnglesStyle}; several methods (vehiclePos, vehicleQuat, capture_data) crash if vehicle_data is nil (before onDeserialized).
- get_grouped_captures caches the result in grouped_captures and requires editor_rallyEditor (transcriptions window) to get the corner angles; without the editor, sortedAngles stays nil and rallyUtil.determineCornerCall has no list to iterate over.
- rallyUtil.determineCornerCall returns nil if the steering falls in no range; the code then accesses cap.calc.angle_data.color without a test.
- debugDrawText concatenates without a test: if text is nil and is_hovered, error.
- Dimensions of the debug car: height 1.6 m, width 1.8 m, length 4.4 m; pos is assumed to be at the center of the car. Teal color, white on hover, light teal when selected.

## Class `C`

Transcription. Fields: path, id, name, sortOrder (999999), show (true), text, success, src, file, beamng_file, timestamp, vehicle_data, grouped_captures.

The module returns a constructor: `local obj = require("gameplay_rally_transcripts_entry")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:capture_data()` | Associated steering capture data (vehicle_data.capture_data). | 61 |
| `C:debugDrawText(hovered)` | Text displayed above the debug car: text, followed by "(click to copy)" on hover. | 43 |
| `C:drawDebug(is_hovered, is_selected)` | Draws the debug car then, if hovered or selected, the steering captures. | 249 |
| `C:drawDebugCaptureData(is_hovered, is_selected)` | For a hovered or selected entry: sphere of radius 0.5 colored by angle for each capture and corner call label per group. | 331 |
| `C:drawDebugVehicleData(is_hovered, is_selected)` | Draws a stylized car (square prism + 4 wheel spheres) at the recorded position/orientation, with the transcription text. | 254 |
| `C:get_grouped_captures()` | Groups consecutive captures that have the same corner call (e.g. "3L", "C"). Sorts the angles of the chosen style, assigns them a red-yellow-green gradient (white for the center), computes for each capture a calc field {angle_pct, angle_data, cornerCallStr}, and sets a label point at the middle of each group. Result cached. | 95 |
| `C:init(path, name, forceId)` | Constructor: forced id or one provided by path:getNextUniqueIdentifier(), default name `t_<id>`, display enabled. | 11 |
| `C:isUsable()` | True if the transcription has vehicle data and is displayed. | 39 |
| `C:lookAtMe()` | Centers the editor camera on the vehicle position (rallyUtil.setCameraTarget). | 523 |
| `C:onDeserialized(data, oldIdMap)` | Restores the fields with default values (empty strings, 0.0, empty table). show is forced to false if the vehicle position is absent. | 233 |
| `C:onSerialize()` | Returns {oldId, name, show, text, success, src, file, beamng_file, timestamp, vehicle_data}. | 215 |
| `C:playCameraPath()` | Builds a camera path (1 m above each capture, FOV 60, time relative to the first ts, fixes the sign of the quaternions) and plays it via core_paths.playPath. | 517 |
| `C:setShow(val)` | Sets the display flag. | 35 |
| `C:toggleShow()` | Toggles the show display flag. | 31 |
| `C:vehiclePos()` | Vehicle position at the time of the transcription. | 51 |
| `C:vehicleQuat()` | Vehicle orientation at the time of the transcription. | 56 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/transcripts/entry.lua`.*
