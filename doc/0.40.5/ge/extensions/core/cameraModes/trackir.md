# `core_cameraModes_trackir`

*File: `lua/ge/extensions/core/cameraModes/trackir.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/trackir")` (file under extensions/ but not a regular extension)

Global filter (runningOrder 0.5) that applies TrackIR head tracking: shifts the position (nx, ny, nz * 0.00005) and rotates the camera (yaw, pitch, roll * 0.01 degree). Initializes via TrackIR.init()/start(); without TrackIR available, it does nothing. Disabled during an OpenXR session. Returns a constructor.

## Class `C`

TrackIR filter. Field working: true if TrackIR could start.

The module returns a constructor: `local obj = require("core_cameraModes_trackir")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Marks the mode as global/filter/hidden and starts TrackIR if available. | 20 |
| `C:update(data)` | Reads TrackIR.getData and applies translation and rotation to data.res. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/trackir.lua`.*
