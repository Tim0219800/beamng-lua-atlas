# `core_cameraModes_autopoint`

*File: `lua/ge/extensions/core/cameraModes/autopoint.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/autopoint")` (file under extensions/ but not a regular extension)

Camera filter (isFilter = true, hidden = true): makes the camera aim at a point offset from the vehicle, expressed in vehicle-local coordinates (localOffset), with spring smoothing. It is NOT a selectable camera: camera.lua loads the file like any mode but initCam ignores filters. It is instantiated by other modes (e.g. cameraModes/external.lua: self.autopoint = autopoint(), then autopoint:update(data) every frame). The module returns a constructor: require('core/cameraModes/autopoint')(options), which creates the object C with the given options as initial values.

## Example

```lua
local autopoint = require('core/cameraModes/autopoint')
local ap = autopoint()
ap:setRefNodes(ref, left, back)
ap.localOffset = vec3(0, 0, 1)  -- aim 1 m above the reference point
ap:setSpring(5, 1)
-- every frame: ap:update(data)
```

## Notes

- The automatic index gives abbreviated signatures (setRefNodes(leftNodeID, backNodeID), setSpring(accel), update()): the real signatures are setRefNodes(centerNodeID, leftNodeID, backNodeID), setSpring(rate, accel) and update(data).
- update modifies data.res.targetPos (adds the smoothed offset converted to the vehicle basis) then sets data.res.rot to look from data.res.pos toward targetPos. It assumes data.res.pos and data.res.targetPos are already filled by the calling camera, and uses data.veh:getNodePosition (vehicle-local positions).
- The local basis is built from the reference nodes: x = (left - ref), y = (back - ref), z = x cross y (so the y offset is positive toward the rear of the vehicle, per the code's convention).

## Class `C`

Filter object returned by the constructor. Fields: isFilter, hidden, localOffset (vec3), refNodes {ref,left,back}, smX/smY/smZ (smoothers).

The module returns a constructor: `local obj = require("core_cameraModes_autopoint")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the filter: isFilter and hidden to true, localOffset to (0,0,0) and default spring (rate 5, accel 1). Called by the constructor. | 8 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Stores the vehicle reference nodes used to build the local basis. | 21 |
| `C:setSpring(rate, accel)` | Creates or recreates the three sigmoid temporal smoothers (X, Y, Z), keeping their current value. | 15 |
| `C:update(data)` | Applies the smoothed offset to data.res.targetPos and orients data.res.rot toward it. Called by the camera that owns this filter. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/autopoint.lua`.*
