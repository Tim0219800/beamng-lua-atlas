# `core_cameraModes_bobbing`

*File: `lua/ge/extensions/core/cameraModes/bobbing.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/bobbing")` (file under extensions/ but not a regular extension)

Camera filter (isFilter = true, hidden = true): adds a realistic camera sway (head oscillating while walking, breathing when standing) by modifying the position (slight rise) and orientation (pitch, roll, yaw) of the camera result. Not selectable: it is instantiated by other modes (cameraModes/external.lua, cameraModes/steadycam.lua) or by code such as gameplay/rallyStartClock.lua (require('core/cameraModes/bobbing')()). Disabled while an OpenXR session is running. The intensity comes from the cameraSteadycamWalkBob and cameraSteadycamStandingBob settings (0 to 2). The module returns a constructor: require('core/cameraModes/bobbing')(options).

## Example

```lua
local bobbing = require('core/cameraModes/bobbing')()
-- every frame, after computing data.res:
bobbing:update(data, walkAmount01, dt)
```

## Notes

- The automatic index gives update(walkAmt, dt): the real signature is update(data, walkAmt, dt).
- walkAmt is a walking intensity in [0..1] (clamped); it speeds up the step phase (4 + 6*walkAmt rad/s) and amplifies the sway. The sway is moderated by an internal factor of 0.6.
- Sway angles in radians (passed to quatFromEuler(swayPitch, swayRoll, swayYaw)), vertical rise in meters (up to about 0.035 m when walking).
- update adds a vec3(0,0,bobUp) to data.res.pos and multiplies data.res.rot by a sway quaternion; it must therefore be called after the camera has filled data.res.
- update returns true even when it does nothing (OpenXR active, dt <= 0 or zero amplitude).

## Class `C`

Filter object returned by the constructor. Fields: walkBobScale, standingBobScale, t, bobPhase, phase (vec3 of random phases).

The module returns a constructor: `local obj = require("core_cameraModes_bobbing")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes: isFilter and hidden to true, reads the settings, resets. Called by the constructor. | 8 |
| `C:onSettingsChanged()` | Re-reads the cameraSteadycamWalkBob and cameraSteadycamStandingBob settings (clamped to 0..2, default 1). Called by camera.lua when settings change, or by the owning mode. | 15 |
| `C:reset()` | Resets time and phase to zero and draws new random phases for the sway. | 20 |
| `C:update(data, walkAmt, dt)` | Applies the sway to data.res.pos and data.res.rot. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/bobbing.lua`.*
