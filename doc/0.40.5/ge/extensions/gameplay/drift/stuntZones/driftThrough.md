# `gameplay_drift_stuntZones_driftThrough`

*File: `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/drift/stuntZones/driftThrough")` (file under extensions/ but not a regular extension)

"driftThrough" stunt zone type (tight pass): the player must drift through an oriented box (OBB, center pos, half-axes derived from rot and scl) and come out of it. The module returns a constructor called by gameplay_drift_stuntZones.setStuntZones; it is not an extension. On success, emits onAnyStuntZoneAccomplished with the sub-hook onDriftThroughAccomplished (drift angle and driftThrough base points).

## Notes

- The zone is validated on exiting the box: while the player is inside nothing happens; on the first "outside" reading usedFlag becomes true, then detectStunt calls accomplish. Details: isPlayerInside is only called when the player is drifting, so the exit is only detected if they are still drifting.
- If no driftActiveData exists (imgui test), the angle sent is 30°.
- Cooldown of zoneData.cooldown seconds after success. Drawing: two lines that change color (green ready, white/red during cooldown).

## Class `C`

driftThrough zone. Fields: data = {id, zoneData = {pos, scl (vec3), rot (quat), cooldown}, x, y, z (half-axes), drawData = {pointA..D}}, activeData = {isActive, currCooldown, usedFlag}.

The module returns a constructor: `local obj = require("gameplay_drift_stuntZones_driftThrough")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:accomplish()` | Success: resets usedFlag to false, starts the cooldown and emits onAnyStuntZoneAccomplished (sub-hook onDriftThroughAccomplished with currDegAngle and points). | 24 |
| `C:detectStunt()` | Called when the player drifts in the zone; calls accomplish if usedFlag is true. | 41 |
| `C:init(data)` | Internal constructor: stores the zone data and calls reset(). | 19 |
| `C:isAvailable()` | Returns whether the cooldown has elapsed. | 47 |
| `C:isPlayerInside()` | Uses containsOBB_point to test whether the vehicle is in the box; if it is not, sets usedFlag to true. | 51 |
| `C:onUpdate()` | Called every frame by the manager: draws the lines. | 59 |
| `C:reset()` | Resets activeData (cooldown 0, usedFlag false). | 11 |
| `C:sendDecals()` | Draws the two edges of the zone with debugDrawer:drawLineInstance (if drawing is enabled). | 70 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyStuntZoneAccomplished` — listened to by 3 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua`.*
