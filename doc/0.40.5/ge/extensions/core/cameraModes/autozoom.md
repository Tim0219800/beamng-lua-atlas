# `core_cameraModes_autozoom`

*File: `lua/ge/extensions/core/cameraModes/autozoom.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/autozoom")` (file under extensions/ but not a regular extension)

Camera filter (isFilter = true, hidden = true): automatically sets the field of view according to the distance between the camera and its target, in discrete steps (like a jerky manual zoom), with smoothing toward the step. It is not a selectable camera: it is instantiated by other modes (e.g. cameraModes/external.lua with its own steps and smoother) which call autozoom:update(data) every frame. The user's manual zoom (MoveManager zoomIn/zoomOut inputs, numpad keys 9/3) is added to the step. The module returns a constructor: require('core/cameraModes/autozoom')(options).

## Example

```lua
local autozoom = require('core/cameraModes/autozoom')
local az = autozoom()
az:init(newTemporalSpring(15, 10))   -- optional: another smoother
az.steps = { {0, 60}, {3, 40}, {50, 15} } -- {distance in m, FOV in degrees}
-- every frame: az:update(data)  -> writes data.res.fov
```

## Notes

- The automatic index abbreviates the signatures: the real ones are init(smoother), getFov(distance, dt), reset() and update(data).
- Default steps (distance m -> FOV deg): 0->120, 1.5->100, 3->70, 8->50, 20->20, 50->10, 125->4, 200->2. The step retained is the last one whose distance is <= the current distance.
- The user delta is limited so that the final FOV stays between 2 and 100 degrees (with a tolerance margin of +20/-1).
- mustReset is true at start: the first getFov call sets the FOV without smoothing. It must be set back to true (e.g. external does this on a reset) to avoid a visible jump.
- The smoother may have getUncapped (preferred) or get; it must expose set(value).
- Inconsistency: baseFov is initialized to `self.fov or 90`, but self.fov is already 60 just before, so the fallback value 90 is never used.

## Class `C`

Filter object returned by the constructor. Fields: steps, fov, baseFov, userFov, mustReset, fovSmoother, smooth.

The module returns a constructor: `local obj = require("core_cameraModes_autozoom")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getFov(distance, dt)` | Computes the FOV for a distance: chooses the step, adds the user's manual correction (2.5 * dt * (zoomIn - zoomOut) * current FOV, clamped) then smooths toward the target (instant if mustReset). | 37 |
| `C:init(smoother)` | Initializes (or reinitializes) the filter: chooses the FOV smoother (default newTemporalSpring(30, 10)), resets mustReset, fov=60, userFov=0 and the default steps. Can be called again to change the smoother. | 8 |
| `C:reset()` | Cancels the user's manual zoom (userFov = 0), numpad keys 9/3. | 65 |
| `C:update(data)` | Computes the distance between data.res.targetPos and data.res.pos and writes data.res.fov. Called by the owning camera. | 68 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/autozoom.lua`.*
