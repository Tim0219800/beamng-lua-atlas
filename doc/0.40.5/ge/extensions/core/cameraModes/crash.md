# `core_cameraModes_crash`

*File: `lua/ge/extensions/core/cameraModes/crash.lua` · VM: Game Engine (GE) · 117 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/crash")` (file under extensions/ but not a regular extension)

Crash replay camera (hidden). Depending on camMode: 1 = close camera above the impact point (hitPoint + camOffset, fov 50); 2 = fixed camera on the ground about 10-20 m from the impact point (random fov 20-25). If veh2Id is provided and the second vehicle's driver is looking at the first, starts in cockpit view (fov 40) until the bounding boxes touch. Returns a constructor.

## Notes

- update does not check that veh1Id exists (Lua error if the vehicle disappears).

## Class `C`

Crash camera. Fields: camMode, veh1Id, veh2Id, hitPoint, camOffset, camPos, fov, cockpitView.

The module returns a constructor: `local obj = require("core_cameraModes_crash")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | camMode = 1, hidden = true, cockpitView = false. | 8 |
| `C:setCustomData(data)` | Configures the shot (called when the global camera is chosen). | 43 |
| `C:update(data)` | Writes data.res.pos / rot / fov depending on the mode. | 73 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/crash.lua`.*
