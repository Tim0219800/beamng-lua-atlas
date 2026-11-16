# `core_cameraModes_occupant`

*File: `lua/ge/extensions/core/cameraModes/occupant.lua` · VM: Game Engine (GE) · 468 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/occupant")` (file under extensions/ but not a regular extension)

"Occupant head" camera (driver or passenger, cockpit view) defined by the vehicle's jbeam. The camera follows a head node with an adjustable blend of static position / physics (setting cameraDriverPhysics), locks horizon and pitch (cameraDriverStableHorizon/Pitch), anticipates the turn (look-ahead, "stone on a string" algorithm), lets you turn the head up to 160 degrees (yaw) and ±80 (pitch), lean over the shoulder (shoulderLeft/Right profiles) and adjust the seat (tilt -30 to 20 degrees, y and z position limited to ±0.4 m), saved per vehicle in the 'cameraDriverVehicleConfigs' setting. Handles the driver zoom (DriverCameraZoom) and the VR options (snap turn, horizon lock). Returns a constructor.

## Notes

- jbeam fields used: seatSide ('left'|'right'|'center'), seatId, shoulderLeft/shoulderRight (startYaw, lateralOffset, forwardOffset, verticalOffset, forwardMultiplier, verticalMultiplier), lookBack{side, yaw}, idRefOccupant/idLeftOccupant/idBackOccupant, camNodeID, refNodes.
- During the first 3 frames after a configuration change (cameraResetted), update only places the camera on the vehicle (unreliable data) and returns nothing.
- Settings read: cameraDriverPhysics, cameraDriverAutocenter, cameraDriverAllowSeatAdjustments, cameraDriverStableHorizon, cameraDriverStablePitch, cameraDriverLookAheadAngle, cameraDriverLookAheadSmoothness, cameraDriverFov, openXRsnapTurnDriver, openXRhorizonLockDriver.
- A FIXME comment in the code notes that camPosInitialLocal can be computed at any time (for example after damage).

## Class `C`

Occupant camera mode. Fields: camRot, relativeYaw/Pitch, seatPosition (vec3), seatRotation (degrees), manualzoom, occupantDetached, icon 'personSolid', canUseVehicleTriggerCrosshair = true.

The module returns a constructor: `local obj = require("core_cameraModes_occupant")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates smoothers, shoulder profiles and parameters, then calls onVehicleCameraConfigChanged and onSettingsChanged. | 60 |
| `C:mouseLocked(locked)` | Indicates whether the mouse is locked or not; on unlock with auto-recentering and the vehicle moving, recenters the head. | 451 |
| `C:onCameraChanged(focused)` | Hook: on focus gain pushes the "DriverCameraZoom" action map; on loss, removes it and resets the driver zoom to 0. | 108 |
| `C:onDeserialized()` | Hook: after extensions reload, reloads the config and resets. | 161 |
| `C:onOccupantDetached(breakGroup)` | Hook: the occupant is detached (break group "ocpAttach<seatId>"): the camera will follow the occupant nodes. | 100 |
| `C:onSettingsChanged()` | Hook: re-reads the cameraDriver* and OpenXR settings. | 123 |
| `C:onVehicleCameraConfigChanged()` | Hook: resets the seat position and the occupant reference nodes; will reload the seat config on the next update. | 88 |
| `C:onVehicleResetted()` | Hook: the vehicle has been repaired, the occupant is no longer detached. | 104 |
| `C:reset()` | Recenters the head, resets the sway and the driver zoom to zero. | 153 |
| `C:resetSeat()` | Resets the seat (position, tilt) to zero for this vehicle and saves it immediately. | 136 |
| `C:resetSeatAll()` | Resets the seat to zero and clears the seat config of all vehicles (cameraDriverVehicleConfigs = {}). | 145 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Sets the reference nodes; if any of the three is nil, uses the idRef/Left/BackOccupant nodes. | 443 |
| `C:update(data)` | Computes head position and orientation and the FOV, handles seat adjustment and delayed saving (1 s), writes data.res. | 179 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/occupant.lua`.*
