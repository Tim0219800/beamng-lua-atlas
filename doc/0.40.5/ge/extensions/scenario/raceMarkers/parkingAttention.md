# `scenario_raceMarkers_parkingAttention`

*File: `lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua` · VM: Game Engine (GE) · 137 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/parkingAttention")` (file under extensions/ but not a regular extension)

Attention marker for a parking spot: draws in debug (debugDrawer:drawTriSolid) the four translucent blue walls (alpha 25%) of a box around the spot, height 1.33 m, double-sided. No scene object is created. The module returns a constructor: require('scenario/raceMarkers/parkingAttention')(id) gives an object of class C.

## Notes

- setToCheckpoint(wp) accepts either wp = {pos, rot, scl} (center, quaternion, full size of the spot), or wp.parkingSpot with these three fields; otherwise only wp.pos and wp.radius are stored and nothing is drawn.
- The color is fixed (0, 0.4, 1) regardless of the mode.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Debug walls around a parking spot.

The module returns a constructor: `local obj = require("scenario_raceMarkers_parkingAttention")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Clears the identifier table. | 126 |
| `C:createMarkers()` | Kept for API compatibility with the other markers: creates no object. | 122 |
| `C:hide()` | Calls setVisibility(false). | 118 |
| `C:init(id)` | Constructor: initializes the state. | 34 |
| `C:setMode(mode)` | 'hidden' hides, other mode shows. | 101 |
| `C:setToCheckpoint(wp)` | Stores the parking spot to surround. | 79 |
| `C:setVisibility(v)` | Enables or disables drawing. | 114 |
| `C:show()` | Calls setVisibility(true). | 119 |
| `C:update(dt, dtSim)` | Per-frame call: advances the mode timer, hides after the fade in 'hidden', and draws the four walls if a spot is defined. | 49 |

## Calls into the engine (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua`.*
