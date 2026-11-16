# `gameplay_drift_stuntZones_hitPole`

*File: `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/drift/stuntZones/hitPole")` (file under extensions/ but not a regular extension)

"hitPole" stunt zone type: a pole (delineator vehicle, config vehicles/delineator/pole.pc) is spawned at pos, with a race marker above it; the player scores points by hitting it while drifting. The module returns a constructor called by gameplay_drift_stuntZones.setStuntZones; it is not an extension. Emits onAnyStuntZoneAccomplished with the sub-hook onHitPoleAccomplished (angle, speed, hitPole base points).

## Notes

- The collision is read from map.objects[vehId].objectCollisions of the drift vehicle; the point is awarded on the frame the collision appears (hitPole true and lastFrameHitPole false) and only if the player is drifting (detectStunt is called by the manager).
- Once accomplished, the pole is no longer available (available = false) until reset(); the reset physically puts the pole back in place (requestReset, resetBrokenFlexMesh) and recreates the marker after 0.1 s.
- If the pole is destroyed, the zone removes itself via gameplay_drift_stuntZones.clearStuntZone.
- Fallback values for UI tests: angle 50°, speed 30.

## Class `C`

hitPole zone. Fields: data = {id, zoneData = {pos}}, marker (race marker), activeData = {veh (pole), hitPole, lastFrameHitPole, available, resetFlag}.

The module returns a constructor: `local obj = require("gameplay_drift_stuntZones_hitPole")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:accomplish()` | Success: removes the marker, makes the zone unavailable and emits onAnyStuntZoneAccomplished (sub-hook onHitPoleAccomplished). | 77 |
| `C:clear()` | Removes the pole vehicle and its marker. | 6 |
| `C:clearMarker()` | Removes the race marker if it exists. | 13 |
| `C:createMarker()` | Creates an "overhead" race marker (radius 5) 2.5 m above the pole. | 20 |
| `C:detectStunt()` | Called when the player drifts: calls accomplish if the pole was just hit. | 96 |
| `C:init(data)` | Internal constructor: stores the data, spawns the delineator pole (pole.pc) at zoneData.pos without making the player enter it, creates the marker. | 62 |
| `C:isAvailable()` | Returns whether the pole can still earn points. | 129 |
| `C:onUpdate(dtReal, dtSim)` | Called every frame: updates the marker, stores the previous collision state and detects a collision between the drift vehicle and the pole. | 102 |
| `C:onVehicleDestroyed(vehId)` | If the destroyed vehicle is the pole, forgets the pole and removes the zone from the manager. | 122 |
| `C:reset()` | Puts the pole back in place (physics and mesh reset), reinitializes the data, then recreates the marker after 0.1 s via a job. | 41 |
| `C:resetData()` | Resets activeData (available = true, no collision), losing the reference to the pole. | 31 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyStuntZoneAccomplished` — listened to by 3 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua`.*
