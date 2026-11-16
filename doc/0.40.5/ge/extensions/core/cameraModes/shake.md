# `core_cameraModes_shake`

*File: `lua/ge/extensions/core/cameraModes/shake.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/shake")` (file under extensions/ but not a regular extension)

Slow shake filter: adds to the position (amplitudes 0.08/0.05/0.03 m) and to the rotation (10 degrees per meter of offset) sinusoidal oscillations of frequencies 0.05/0.04/0.03 Hz with random phase offsets. Hidden. Returns a constructor.

## Class `C`

Shake filter. Fields: amp (vec3), freq (vec3), timeOffset (vec3), time.

The module returns a constructor: `local obj = require("core_cameraModes_shake")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes amplitudes, frequencies and random phases. | 8 |
| `C:update(data)` | Applies the position offset and rotation to data.res. | 17 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/shake.lua`.*
