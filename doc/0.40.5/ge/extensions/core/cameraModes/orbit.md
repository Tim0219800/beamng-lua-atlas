# `core_cameraModes_orbit`

*File: `lua/ge/extensions/core/cameraModes/orbit.lua` · VM: Game Engine (GE) · 601 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/orbit")` (file under extensions/ but not a regular extension)

Orbital chase camera, main "external" mode of a vehicle. Orbits around the target point (the vehicle's ref node + offset, or a point imposed by setRef) at a distance camDist; mouse/keyboard rotation (pitch limited to ±85 degrees), zoom (distance between camMinDist and camMaxDist), smoothing, relaxation behind the vehicle, speed-dependent dynamic FOV (dolly zoom effect that keeps the apparent size of the vehicle's rear), dynamic height offset and dynamic pitch above 10 m/s. Uses the collision filter to avoid passing through scenery. Also used by other extensions (couplerCameraModifier). Returns a constructor.

## Example

```lua
-- via core_camera, for example to adjust a vehicle's orbit camera:
core_camera.setDistance({vehId = id, camName = 'orbit'}, 8)
core_camera.setDefaultDistance({vehId = id, camName = 'orbit'}, 8)
```

## Notes

- jbeam configuration fields: distance (5 by default), distanceMin (3), defaultRotation (vec3 degrees, default (0, -17, 0)), offset, mode ('ref' by default), fov (65), skipFovModifier, refNodes. camMaxDist = 10 * distanceMin (or 50 if distanceMin is nil, inferred from code: (distanceMin or 5) * 10).
- Settings read: cameraOrbitFovModifier, cameraOrbitRelaxation (3), cameraOrbitMaxDynamicFov (35), cameraOrbitMaxDrivingPitch, cameraOrbitMaxDynamicOffset, cameraOrbitSmoothing, multiseat (in multiseat the dynamic pitch is disabled).
- Dynamic FOV: fov = fov + fovModifier + maxDynamicFov * min(1, speed/130). Dynamic height: up to 1.4 * maxDynamicOffset at around 70 m/s.
- The extracted page says calculateDynamicPitchLimit(targetPos) but the code takes (data, targetPos); setTargetMode(targetMode, camBase) and setRef(center, left, back) also have more parameters than listed.
- Yaw smoothing is limited to the speed maxRot (4.5 rad... value 4.5 per second in automatic input, 1000 if the user turns the camera); onSettingsChanged calls core_camera.clearInputs() (code comment: "is this really necessary?").

## Class `C`

Orbit mode. Fields: camRot (vec3 degrees: x yaw, y pitch), camDist, camMinDist, camMaxDist, defaultDistance, defaultRotation, fov, offset, orbitOffset, mode, target, lockCamera, collision (instance of the collision filter), smoothingEnabled.

The module returns a constructor: `local obj = require("core_cameraModes_orbit")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateDynamicPitchLimit(data, targetPos)` | Computes (once, cached in dynamicPitchLimit) the maximum downward pitch that keeps the bottom of the vehicle's rear in the field of view. | 53 |
| `C:deserialize(s)` | Restores the state from serialize and keeps the restored rotation. | 153 |
| `C:init()` | Creates the state, the collision filter, then calls onVehicleCameraConfigChanged, onSettingsChanged and reset. | 27 |
| `C:listParams()` | Settings exposed to the camera control UI: dist, smooth, fov. | 169 |
| `C:onSettingsChanged()` | Hook: re-reads the cameraOrbit* settings and forwards to the collision filter. | 115 |
| `C:onVehicleCameraConfigChanged()` | Hook: reloads distances, default rotation, mode, FOV and resets the dynamic pitch. | 91 |
| `C:onVehicleSwitched()` | Hook: forwards to the collision filter. | 127 |
| `C:reset()` | Reschedules the camera recentering (3 frames) and resets the collision filter; no effect if a recentering is already in progress. | 131 |
| `C:serialize()` | State for video stream views (core_camera get/setContextCameraState): rotation, distance, FOV. | 145 |
| `C:setDefaultDistance(d)` | Sets the default distance (used when recentering). | 210 |
| `C:setDefaultRotation(rot)` | Sets the default rotation when recentering. | 222 |
| `C:setDistance(d)` | Sets the current distance. | 214 |
| `C:setFOV(fov)` | Sets the base FOV. | 164 |
| `C:setMaxDistance(d)` | Sets the maximum zoom distance. | 218 |
| `C:setOffset(v)` | Sets orbitOffset, a world offset added to the camera position. | 183 |
| `C:setParam(key, value)` | Changes dist, smooth or fov. | 177 |
| `C:setRef(center, left, back)` | Imposes the target point and the frame in world coordinates (center nil = back to following the vehicle's nodes; a change triggers reset). | 196 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID, dynamicFovRearNodeID)` | Sets the vehicle's reference nodes and the rear node for the dynamic FOV. | 187 |
| `C:setRotation(rot)` | Sets the orbit rotation. | 139 |
| `C:setSkipFovModifier(skip)` | Disables the speed-based dynamic FOV. | 226 |
| `C:setTargetMode(targetMode, camBase)` | Chooses the target mode ('ref' by default) and the camera offset base. | 205 |
| `C:update(data)` | Computes the orbit pose and writes data.res (pos, rot, fov, targetPos, collisionCompatible = true), then applies the collision filter. | 248 |

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBHalfExtentsXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/orbit.lua`.*
