# `core_cameraModes_smooth`

*File: `lua/ge/extensions/core/cameraModes/smooth.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/smooth")` (file under extensions/ but not a regular extension)

Position smoothing filter: three temporal springs (newTemporalSpring) on x, y, z of data.res.pos. Hidden. Returns a constructor.

## Notes

- The extracted page says init(damp, pos) but the code defines init(spring, damp, pos). Default values: spring 30, damp 10.

## Class `C`

Position smoothing filter.

The module returns a constructor: `local obj = require("core_cameraModes_smooth")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(spring, damp, pos)` | Creates the springs; if pos is given, initializes them to that position. | 8 |
| `C:update(data)` | Smooths data.res.pos axis by axis with data.dt. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/smooth.lua`.*
