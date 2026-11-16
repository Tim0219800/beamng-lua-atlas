# `ui_apps_minimap_vehicles`

*File: `lua/ge/extensions/ui/apps/minimap/vehicles.lua` · VM: Game Engine (GE) · 225 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_vehicles`: `extensions.load("ui_apps_minimap_vehicles")`, then the global `ui_apps_minimap_vehicles`

Draws the minimap's vehicle markers: the player (vehicle, pedestrian on foot or free camera) and the other active vehicles (traffic, parked cars, police, usable or unusable vehicles). The minimap module passes its drawing state to it via setMinimapState then calls drawPlayer and drawOtherVehicles every frame. Loaded by require, it relies on ui_apps_minimap_utils and the minimap's td:vehicleMarker.

## Notes

- setMinimapState must be called before any drawing: the local variables (td, scale, camPos…) are otherwise nil.
- Ignored if not forced (traffic, parked, active police): the models of type Prop, Unknown, Utility, PropTraffic and Traffic. Vehicles out of range (camPos ± cullRadius) are also ignored.
- Police cars pulse red/blue and are drawn on the VEHICLES_POLICE layer; unusable vehicles (pedestrian: gameplay_walk blacklist) are gray and smaller.
- Vehicles of model 'unicycle' are drawn as circles; so is the player on foot.
- In free camera (commands.isFreeCamera()), drawPlayer also draws a camera orientation marker; with lookaheadEnabled, the position is shifted by the lookahead value.
- In drawOtherVehicles, the two tests drawUnusableVehicles and drawOtherVehicles are almost redundant (both only exclude unusable vehicles).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim)` | Draws all the other active vehicles visible according to the debug settings (traffic, parked, active police, usable, unusable). *(internal)* | 153 |
| `ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim)` | Draws the player marker (vehicle or pedestrian) and, in free camera, the camera marker. Also computes a dynamic scale (larger at high speed) returned to the caller; returns nil if there is no player vehicle. *(internal)* | 56 |
| `ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue)` | Receives from the main minimap the whole drawing state (size, center, camera, scale, drawing object, debug settings, camera direction, dpi) and retrieves the current palette and world-to-map transform. *(internal)* | 31 |

### Parameter details

#### `ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim)`

Draws all the other active vehicles visible according to the debug settings (traffic, parked, active police, usable, unusable).

- `dtReal` (*number*) : Elapsed real time (not used).
- `dtSim` (*number*) : Elapsed simulation time (not used).

#### `ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim)`

Draws the player marker (vehicle or pedestrian) and, in free camera, the camera marker. Also computes a dynamic scale (larger at high speed) returned to the caller; returns nil if there is no player vehicle.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).
- **returns**: number|nil Adjusted scale of the player marker.

#### `ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue)`

Receives from the main minimap the whole drawing state (size, center, camera, scale, drawing object, debug settings, camera direction, dpi) and retrieves the current palette and world-to-map transform.

- `w` (*number*) : Map width in pixels.
- `h` (*number*) : Map height in pixels.
- `cx` (*number*) : Center X.
- `cy` (*number*) : Center Y.
- `cp` (*vec3*) : Camera position.
- `cr` (*quat*) : Camera rotation.
- `cri` (*quat*) : Inverse camera rotation.
- `s` (*number*) : Map scale.
- `si` (*number*) : Inverse of the scale.
- `textureDraw` (*table*) : Drawing object (vehicleMarker, line…).
- `debugSettingsObj` (*table*) : Debug settings (drawPlayer, drawTrafficVehicles, drawParkedVehicles, drawOtherVehicles, drawUnusableVehicles, drawActivePoliceVehicles, lookaheadEnabled, lookaheadValue).
- `cameraLookObj` (*vec3*) : Camera look direction.
- `dpiValue` (*number|nil*) : dpi factor, multiplied by the global globalDpi if it exists.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/vehicles.lua`.*
