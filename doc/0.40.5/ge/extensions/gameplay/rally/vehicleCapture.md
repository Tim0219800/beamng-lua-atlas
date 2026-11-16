# `gameplay_rally_vehicleCapture`

*File: `lua/ge/extensions/gameplay/rally/vehicleCapture.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/vehicleCapture")` (file under extensions/ but not a regular extension)

Recorder of the vehicle's trajectory during a rally recce. Every 2 m traveled, it captures position, orientation and steering, buffers the captures and appends them to the `driveline.json` file (one JSON line per capture) in the mission's recce folder. The module returns a constructor: `require(...)(vehicle, missionDir)`.

## Notes

- The steering is read via core_vehicleBridge (key 'steering', registered as a change notification); it is nil as long as no value is cached.
- The first capture only serves as an anchor (last_dist_pos): nothing is buffered until more than interval_m has been traveled.
- The buffer is only written from 10 captures, unless writeCaptures(true) is called.

## Class `C`

Recorder bound to a vehicle. Fields: vehicle, interval_m (2), last_dist_pos, capturesBuffer, fname.

The module returns a constructor: `local obj = require("gameplay_rally_vehicleCapture")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:capture()` | To be called every frame: reads the vehicle's position and orientation (quatf from direction and up vector) and, if it has moved more than interval_m away from the last capture, buffers {ts, pos, quat, steering}. Then tries to write the buffer. | 52 |
| `C:drawDebug()` | Draws a semi-transparent blue sphere of radius 2 at the last captured position (debugDrawer:drawSphere). | 83 |
| `C:init(vehicle, missionDir)` | Constructor. Registers the 'steering' change notification with core_vehicleBridge and computes the path of the driveline.json file via rallyUtil.missionReccePath. | 12 |
| `C:truncateCapturesFile()` | Empties the captures file (opened in "w" mode). Logs an error if opening fails. | 23 |
| `C:writeCaptures(force)` | Appends the buffer's captures to the file (one JSON line each) then empties the buffer. Without force, does nothing as long as the buffer contains fewer than 10 elements. | 32 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/vehicleCapture.lua`.*
