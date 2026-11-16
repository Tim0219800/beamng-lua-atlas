# `scenario_raceMarkers_zoneAttention`

*File: `lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/zoneAttention")` (file under extensions/ but not a regular extension)

Attention marker for a zone (polygon): instead of a 3D object, it asks the zone object to draw itself (zone:drawDebug('faded', color, fence height)). The color goes from blue (normal) to yellow then orange during a countdown, and to dark orange when the zone is "rising" or the countdown is finished. The module returns a constructor: require('scenario/raceMarkers/zoneAttention')(id) gives an object of class C.

## Notes

- setToCheckpoint(wp) accepts either a zone object (fields drawDebug and vertices), or wp.zone; otherwise only wp.pos and wp.radius are stored and nothing is drawn.
- The center is zone.center or the position of the first vertex; if a terrain exists, the height is snapped back to terrain + 2 m (core_terrain).
- The fence is drawn with alpha 0.25 and height fenceHeight (0.33 by default, adjustable with setFenceHeight).
- C:setCountdown actually has the signature (remaining, total, done); the extracted page shows (total, done) because it omits the first parameter: the first argument is the remaining time.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Zone marker drawn by debug.

The module returns a constructor: `local obj = require("scenario_raceMarkers_zoneAttention")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Clears the identifier table. | 153 |
| `C:createMarkers()` | Kept for API compatibility: creates no object. | 149 |
| `C:hide()` | Calls setVisibility(false). | 145 |
| `C:init(id)` | Constructor: initializes the state (invisible, mode 'hidden', blue color). | 12 |
| `C:setCountdown(remaining, total, done)` | Sets the countdown state that drives the color. | 130 |
| `C:setFenceHeight(h)` | Sets the height of the drawn fence. | 126 |
| `C:setMode(mode)` | 'hidden' hides, other mode shows. | 113 |
| `C:setRising(v)` | Marks the zone as "rising": dark orange color. | 136 |
| `C:setToCheckpoint(wp)` | Associates the zone to draw, or a simple position if wp is not a zone. | 84 |
| `C:setVisibility(v)` | Enables or disables drawing. | 141 |
| `C:show()` | Calls setVisibility(true). | 146 |
| `C:update(dt, dtSim)` | Per-frame call: computes the target color (blue, yellow-to-orange gradient during the countdown, dark orange if rising or finished), smooths it then draws the zone. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua`.*
