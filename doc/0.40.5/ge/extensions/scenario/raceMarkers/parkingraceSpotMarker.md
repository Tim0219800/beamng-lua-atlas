# `scenario_raceMarkers_parkingraceSpotMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua` · VM: Game Engine (GE) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/parkingraceSpotMarker")` (file under extensions/ but not a regular extension)

Parking spot marker for parking races: three stacked outlines (park_outline_marker.dae, height 1.2 m) and a striped ground decal (parkDecalStripes.png, via Engine.Render.DynamicDecalMgr), whose color is smoothed over time. It is not a classic checkpoint marker: it has no setToCheckpoint or setMode, it is set with setSpot and setColor. The module returns a constructor: require('scenario/raceMarkers/parkingraceSpotMarker')(id) gives an object of class C.

## Example

```lua
local m = require('scenario/raceMarkers/parkingraceSpotMarker')('spot1')
m:createMarkers()
m:setSpot(vec3(100, 50, 10), quat(0, 0, 0, 1), vec3(2.5, 5, 0.5))
m:setColor({0, 1, 0, 1})
m:show()
-- every frame:
m:update(dt)
```

## Notes

- setSpot(pos, rot, scl): pos is the center, scl is the FULL size of the spot on each axis. The XY scale of the outlines follows the parkingMarker.lua convention (scl.y / 2.05).
- setColor accepts {r, g, b, a} (indices 1 to 4) or a table with r/g/b/a fields; the components are smoothed at a rate of 8. The outlines are always opaque (alpha 1), the decal has its alpha multiplied by 0.9 and a fade between 3.5 and 6 m.
- The decals must be resubmitted every frame: update calls Engine.Render.DynamicDecalMgr.addDecals on each call (while visible is true).
- This marker has no setMode or setToCheckpoint method: using it via scenario_race_marker.setModes or setToCheckpoints would fail.
- update only takes dt (the color smoother depends on it). The outlines are not added to ScenarioObjectsGroup.
- The extracted page shows setSpot(rot, scl); the actual signature is setSpot(pos, rot, scl).

## Class `C`

Parking spot marker with outlines and decal.

The module returns a constructor: `local obj = require("scenario_raceMarkers_parkingraceSpotMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the outlines (after checking they still exist) and the decal data. | 70 |
| `C:createMarkers()` | Removes the old objects then creates three TSStatic outlines (collision and decal disabled) and prepares the ground decal data. | 39 |
| `C:hide()` | Calls setVisibility(false). | 131 |
| `C:init(id)` | Constructor: initializes position, rotation, size (2.5 x 5 x 0.5), colors and smoothers. | 18 |
| `C:setColor(color)` | Sets the target color (smoothed afterwards). | 114 |
| `C:setSpot(pos, rot, scl)` | Configures the spot: position, rotation and size, applied to the outlines and the decal. | 86 |
| `C:setVisibility(v)` | Shows or hides the outlines. | 122 |
| `C:show()` | Calls setVisibility(true). | 130 |
| `C:update(dt)` | Per-frame call when visible: advances the color smoothers, colors the outlines and resubmits the decal to the dynamic decal manager. | 133 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua`.*
