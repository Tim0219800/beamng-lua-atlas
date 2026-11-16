# `gameplay_drift_stuntZones_nearPole`

*File: `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua` · VM: Game Engine (GE) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/drift/stuntZones/nearPole")` (file under extensions/ but not a regular extension)

"nearPole" stunt zone type: a striped pole (delineator, config vehicles/delineator/stripes.pc) is spawned at pos; the player scores points by drifting close to it without touching it. The module returns a constructor called by gameplay_drift_stuntZones.setStuntZones; it is not an extension. Emits onAnyStuntZoneAccomplished with the sub-hook onNearPoleAccomplished (angle, closeness and nearPole base points).

## Notes

- A corner of the vehicle must come within maxDist = 4 m of the pole; the score is awarded when the vehicle moves away (center-to-pole distance greater than in the previous frame) and the pole has not been hit.
- closeness = 1 - (minCornerDist / 4), where minCornerDist is the minimum distance from a vehicle corner to the pole; the closer, the higher the score (score = angle * closeness / 90 * points, in scoring).
- Hitting the pole (collision read from objectCollisions) sets hitPole to true and removes the marker: the zone can then no longer be validated.
- Like hitPole, reset() puts the pole back in place and recreates the marker after 0.1 s.

## Class `C`

nearPole zone. Fields: data = {id, zoneData = {pos}}, marker, activeData = {veh, hitPole, lastFrameHitPole, available, resetFlag, lastFramePlDist, minCornerDist}.

The module returns a constructor: `local obj = require("gameplay_drift_stuntZones_nearPole")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:accomplish()` | Success: removes the marker, makes the zone unavailable and emits onAnyStuntZoneAccomplished (sub-hook onNearPoleAccomplished with currDegAngle, closeness, points). | 82 |
| `C:clear()` | Removes the pole vehicle and its marker. | 8 |
| `C:clearMarker()` | Removes the race marker if it exists. | 15 |
| `C:createMarker()` | Creates an "overhead" race marker (radius 5) 2.5 m above the pole. | 22 |
| `C:detectStunt()` | Iterates over the vehicle's 4 corners (getVehCorners), stores the minimum distance and marks the zone as accomplished when the vehicle moves away from the pole without having hit it. | 104 |
| `C:init(data)` | Internal constructor: stores the data, spawns the striped pole at zoneData.pos, creates the marker. | 67 |
| `C:isAvailable()` | Returns whether the pole can still earn points. | 159 |
| `C:onUpdate(dtReal, dtSim)` | Called every frame: updates the marker and detects a collision between the drift vehicle and the pole. | 132 |
| `C:onVehicleDestroyed(vehId)` | If the destroyed vehicle is the pole, forgets the pole and removes the zone from the manager. | 152 |
| `C:reset()` | Puts the pole back in place (physics and mesh reset), reinitializes the data, then recreates the marker after 0.1 s via a job. | 46 |
| `C:resetData()` | Resets activeData (available = true, distances to infinity). | 33 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyStuntZoneAccomplished` — listened to by 3 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua`.*
