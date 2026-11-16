# `core_cameraModes_noise`

*File: `lua/ge/extensions/core/cameraModes/noise.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/noise")` (file under extensions/ but not a regular extension)

Noise effect: adds to data.res.pos a random offset (± factor/2 per axis) renewed every 0.1 s. Hidden mode, not a filter in the isFilter sense. Returns a constructor.

## Class `C`

Camera position noise.

The module returns a constructor: `local obj = require("core_cameraModes_noise")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(factor)` | Prepares the offset; each call forces a new draw on the first update. | 8 |
| `C:update(data)` | Adds the current offset to data.res.pos. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/noise.lua`.*
