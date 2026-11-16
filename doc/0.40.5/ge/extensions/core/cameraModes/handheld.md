# `core_cameraModes_handheld`

*File: `lua/ge/extensions/core/cameraModes/handheld.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/handheld")` (file under extensions/ but not a regular extension)

"Shoulder-mounted" camera filter: the aiming direction follows the target through a damped spring and the horizon tilts slightly according to the force (hand-held camera effect). Hidden module (isFilter, hidden). Returns a constructor.

## Notes

- The extracted page says init(damping, rotspring) but the code defines init(spring, damping, rotspring).
- Default values: k = 20, damping = 5, rotk = 3. With an OpenXR session, the up axis stays (0,0,1).

## Class `C`

Spring filter on the aiming direction.

The module returns a constructor: `local obj = require("core_cameraModes_handheld")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(spring, damping, rotspring)` | Initializes the spring parameters and forces a direction reset on the next update. | 8 |
| `C:update(data)` | Computes data.res.rot from the smoothed direction from data.res.pos to data.res.targetPos. | 18 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/handheld.lua`.*
