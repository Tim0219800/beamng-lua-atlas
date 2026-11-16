# `gameplay_rally_driveline_drivelineMeasurement`

*File: `lua/ge/extensions/gameplay/rally/driveline/drivelineMeasurement.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/driveline/drivelineMeasurement")` (file under extensions/ but not a regular extension)

Empty class (skeleton) intended for measurements on a rally driveline. The constructor require(...)(driveline) calls C:init, which does nothing. No data is stored.

## Class `C`

Object returned by the module constructor; no attributes or other methods.

The module returns a constructor: `local obj = require("gameplay_rally_driveline_drivelineMeasurement")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(driveline)` | Does nothing (the driveline parameter is not stored). | 7 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/drivelineMeasurement.lua`.*
