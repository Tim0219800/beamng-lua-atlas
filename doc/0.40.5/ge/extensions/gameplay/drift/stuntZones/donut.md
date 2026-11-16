# `gameplay_drift_stuntZones_donut`

*File: `lua/ge/extensions/gameplay/drift/stuntZones/donut.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/drift/stuntZones/donut")` (file under extensions/ but not a regular extension)

"donut" stunt zone type: the player must complete a full turn (360° accumulated velocity direction angle) while drifting inside a circle of radius scl around pos. The module returns a constructor called by gameplay_drift_stuntZones.setStuntZones; it is not an extension. On success, emits onAnyStuntZoneAccomplished with the sub-hook onDonutDriftAccomplished (donut base points).

## Notes

- Leaving the circle resets the angle counter to 0 (isPlayerInside).
- After success, the zone is unavailable for zoneData.cooldown seconds; the circle is drawn with colored segments (blue = turn completed, red/white = cooldown).
- The number of circle segments is drawData.decalCount = scl * 10.

## Class `C`

Donut zone. Fields: data = {id, zoneData = {pos, scl (radius), cooldown}, drawData}, activeData = {isActive, currCooldown, totalDriftAngle, completedPerc}.

The module returns a constructor: `local obj = require("gameplay_drift_stuntZones_donut")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:accomplish()` | Success: resets the accumulated angle to 0, starts the cooldown and emits onAnyStuntZoneAccomplished (sub-hook onDonutDriftAccomplished, points = donut base). | 25 |
| `C:detectStunt()` | Adds the frame's drift angle variation (gameplay_drift_drift.getAngleDiff) to the accumulated angle; at 360° or more, calls accomplish. | 39 |
| `C:init(data)` | Internal constructor: stores the zone data and calls reset(). | 20 |
| `C:isAvailable()` | Returns whether the cooldown has elapsed. | 49 |
| `C:isPlayerInside()` | Tests whether the vehicle is within scl of pos; otherwise resets the accumulated angle to 0. | 53 |
| `C:onUpdate()` | Called every frame by the manager: draws the circle. | 61 |
| `C:reset()` | Resets activeData (cooldown to 0, accumulated angle to 0). | 11 |
| `C:sendDecals()` | Draws the circle with debugDrawer:drawLineInstance, colored according to progress and cooldown (if drawing is enabled). | 68 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyStuntZoneAccomplished` — listened to by 3 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stuntZones/donut.lua`.*
