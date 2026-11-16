# `gameplay_rally_cutCapture`

*File: `lua/ge/extensions/gameplay/rally/cutCapture.lua` · VM: Game Engine (GE) · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/cutCapture")` (file under extensions/ but not a regular extension)

Records 'cuts' during a rally recce: on each capture, the vehicle's position, orientation and steering angle are appended as a JSON line to the cuts.json file in the mission's recce folder. Also manages the associated transcripts.json file. The module returns a constructor: require(...)(vehicle, missionDir).

## Notes

- The cuts.json file contains one JSON object per line (JSON Lines), opened in append mode.
- The position is the vehicle's (the code states it is centered above the top of the windshield).
- The 'steering' value is read from the core_vehicleBridge cache; it stays nil until a value has been received.
- Files are opened without error checking: if io.open fails, self.f is nil and the call crashes.

## Class `C`

Capture object returned by the module constructor. Attributes: vehicle, fname, fname_transcripts, cut_id.

The module returns a constructor: `local obj = require("gameplay_rally_cutCapture")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:capture()` | Captures the vehicle's current state (incremental id, timestamp rallyUtil.getTime(), pos {x,y,z}, quat {x,y,z,w} computed from the direction/up vectors, steering) and writes it via writeCut. | 40 |
| `C:init(vehicle, missionDir)` | Initializes: stores the vehicle, subscribes to changes of the 'steering' value (core_vehicleBridge) and computes the cuts.json and transcripts.json paths. The cut identifier restarts at 1. | 12 |
| `C:truncateCapturesFile()` | Empties the cuts.json file (opens it for writing). | 22 |
| `C:truncateTranscriptsFile()` | Empties the transcripts.json file. | 27 |
| `C:writeCut(cutCapture)` | Appends a JSON-encoded capture, followed by a newline, to cuts.json. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/cutCapture.lua`.*
