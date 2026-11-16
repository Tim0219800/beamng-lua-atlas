# `core_cameraModes_onboard`

*File: `lua/ge/extensions/core/cameraModes/onboard.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/onboard")` (file under extensions/ but not a regular extension)

Onboard camera (cockpit, hood, rider...) defined in the vehicle's jbeam (camera section): attaches to the refNodes.ref node (or camNodeID) with an offset, orients the view according to the reference nodes and lets the head turn (yaw ±, pitch limited to ±85 degrees) if canRotate (true by default). Looking backward (data.lookBack) places the camera at the rear of the bounding box. Includes a manualzoom. Returns a constructor.

## Notes

- The camera name determines the icon: onboard.driver -> personSolid, onboard.hood -> vehicleHood, other -> info. "driver" is hidden but its data remain used by other cameras. rider/onboard.rider enables canUseVehicleTriggerCrosshair.
- `self.canRotate = self.canRotate ~= nil and self.canRotate or true` is always true (if canRotate is false, the expression gives true again): bug, canRotate=false from the jbeam is ignored.
- If rotation (jbeam) has a zero z, its x,y are added to the current rotation every frame and the ±85 clamp is not applied.

## Class `C`

Onboard camera. jbeam fields: refNodes{ref,left,back}, offset{x,y,z}, rotation, fov, name, idRef/idUp/idBack, canRotate.

The module returns a constructor: `local obj = require("core_cameraModes_onboard")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the manualzoom, applies the vehicle configuration and resets. | 22 |
| `C:onVehicleCameraConfigChanged()` | Hook: recomputes hidden, icon and canUseVehicleTriggerCrosshair from the name. | 30 |
| `C:reset()` | Resets the head rotation to zero and the zoom to default. | 46 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Sets the reference nodes. | 117 |
| `C:update(data)` | Places the camera and applies rotation and zoom to data.res. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/onboard.lua`.*
