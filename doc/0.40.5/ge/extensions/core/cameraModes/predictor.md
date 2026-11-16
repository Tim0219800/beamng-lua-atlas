# `core_cameraModes_predictor`

*File: `lua/ge/extensions/core/cameraModes/predictor.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/predictor")` (file under extensions/ but not a regular extension)

Filter that anticipates the vehicle's movement: shifts data.res.targetPos by dtFuture * data.vel (vehicle velocity) then recomputes the rotation toward that target. Hidden. Returns a constructor.

## Class `C`

Target prediction filter.

The module returns a constructor: `local obj = require("core_cameraModes_predictor")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(dtFuture)` | Sets isFilter, hidden and dtFuture. | 8 |
| `C:update(data)` | Advances targetPos and updates data.res.rot. | 14 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/predictor.lua`.*
