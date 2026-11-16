# `core_cameraModes_manualzoom`

*File: `lua/ge/extensions/core/cameraModes/manualzoom.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/manualzoom")` (file under extensions/ but not a regular extension)

Manual zoom filter: changes the field of view (FOV, in degrees) according to MoveManager.zoomIn / zoomOut, clamped between fovMin and fovMax, and displays the FOV via ui_message when it changes. Used by other modes (onboard, bigMap...). Does nothing in an OpenXR session. Returns a constructor.

## Notes

- Zoom speed: 4.5 * dt * (zoomIn - zoomOut) * fov (proportional to the current FOV).
- Default values: fovDefault 80, fovMin 10, fovMax 120, uiTxt "ui.camera.fov". The extracted page says init(fovMin, fovMax, uiTxt) but the code has four parameters, fovDefault first.

## Class `C`

Zoom filter. Fields: fov (current), fovDefault, fovMin, fovMax, uiTxt.

The module returns a constructor: `local obj = require("core_cameraModes_manualzoom")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(fovDefault, fovMin, fovMax, uiTxt)` | Initializes the limits and resets the FOV to fovDefault. | 8 |
| `C:reset()` | Resets fov to fovDefault. | 18 |
| `C:update(data)` | Applies the input zoom and writes data.res.fov. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/manualzoom.lua`.*
