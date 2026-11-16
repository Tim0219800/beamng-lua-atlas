# `gameplay_rally_vehicleTracker`

*File: `lua/ge/extensions/gameplay/rally/vehicleTracker.lua` · VM: Game Engine (GE) · 253 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/vehicleTracker")` (file under extensions/ but not a regular extension)

Tracking of the player vehicle (slot 0) for rally: position, speed and damage detection. At each onUpdate, it rereads map.objects[vehicleId] and triggers a "just took damage" flag when the `damage` value increases by at least a threshold. An optional debug drawing displays position, velocity vector and text. The module returns a constructor: `require(...)(damageThreshold)`.

## Notes

- The tracked vehicle is always getPlayerVehicle(0), not a vehicle passed as a parameter.
- A code comment says that returning vehicle:getPosition() directly "makes it work" whereas the copy via getPositionXYZ into a shared vec3 is kept: pos() and velocity() return a reused vec3 (same object on every call), it must be copied if kept.
- pos() and velocity() log an 'E' error on every call when there is no player vehicle.
- The damage is a cumulative value (map.objects[id].damage); only an increase >= damageThreshold since the last retained value raises justHadDamage, and only for the relevant tick.
- The wheelOffsets/currentCorners/previousCorners fields are filled in init but no longer updated (updateVehicleCorners is commented out).

## Class `C`

Vehicle tracker. Fields: damageThreshold (1 by default), vehicleData, lastDamage, lastDamageDiff, justHadDamage, debugDraw, wheelOffsets, currentCorners, previousCorners.

The module returns a constructor: `local obj = require("gameplay_rally_vehicleTracker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:damage()` | Cumulative damage of the vehicle according to map.objects. | 185 |
| `C:didJustHaveDamage()` | Indicates whether an impact of at least damageThreshold occurred on the last tick. | 193 |
| `C:drawDebugInfo()` | If enabled: magenta sphere (radius 1.5) 2 m above the vehicle, cyan line for the velocity (x2, beyond 0.1 m/s) and text "VehicleTracker \| Pos \| Speed" in km/h and m/s. | 204 |
| `C:getVehicle()` | Returns getPlayerVehicle(0). | 54 |
| `C:getVehicleId()` | Id of player vehicle 0. | 48 |
| `C:init(damageThreshold)` | Constructor. Gets the player vehicle's data, stores the current damage and computes the wheel offsets in the vehicle's frame. | 9 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | To be called every frame: updates vehicleData and the damage state, then draws the debug if enabled. Without a vehicle, resets vehicleData, lastDamage and justHadDamage. | 70 |
| `C:pos()` | Position of the player vehicle (shared vec3, reused between calls). | 151 |
| `C:setDebugDraw(enabled)` | Enables or disables the debug drawing. | 200 |
| `C:speedMs()` | Norm of the velocity. | 180 |
| `C:updateVehicleDamage()` | Compares the current damage to the last retained one and updates lastDamage, lastDamageDiff and justHadDamage. | 115 |
| `C:updateVehicleData(vehicleId)` | Sets vehicleData to map.objects[vehicleId] (or nil). | 145 |
| `C:velocity()` | Velocity of the player vehicle (shared vec3, reused). | 168 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/vehicleTracker.lua`.*
