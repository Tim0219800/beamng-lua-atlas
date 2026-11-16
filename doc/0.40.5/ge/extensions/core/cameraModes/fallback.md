# `core_cameraModes_fallback`

*File: `lua/ge/extensions/core/cameraModes/fallback.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/fallback")` (file under extensions/ but not a regular extension)

Global filter camera (isGlobal, isFilter, hidden, runningOrder 0.6) that guarantees data.res.pos and data.res.rot are set: if no camera provided a position or rotation, it takes the vehicle position (data.pos) and the direction toward data.pos. The module returns a constructor: local cam = require('core/cameraModes/fallback')(options).

## Notes

- All camera modes follow this pattern: a constructor returning an object of class C with C:init() and C:update(data); data is the camData table built by core_cameraUpdate (data.res = pos/rot/fov/targetPos/nearClip result, data.dt, data.veh, data.pos...).

## Class `C`

Class of the fallback camera mode.

The module returns a constructor: `local obj = require("core_cameraModes_fallback")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Sets isGlobal=true, runningOrder=0.6, isFilter=true, hidden=true. | 8 |
| `C:update(data)` | Fills data.res.pos and data.res.rot if they are nil. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/fallback.lua`.*
