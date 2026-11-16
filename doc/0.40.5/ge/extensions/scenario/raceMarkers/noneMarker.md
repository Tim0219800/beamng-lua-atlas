# `scenario_raceMarkers_noneMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/noneMarker.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/noneMarker")` (file under extensions/ but not a regular extension)

"Empty" checkpoint marker: it implements the common race marker interface (init, update, setToCheckpoint, setMode, setVisibility, hide, show, createMarkers, clearMarkers) without displaying anything. Used to disable visual markers. The module returns a constructor: require('scenario/raceMarkers/noneMarker')(id) gives an object of class C.

## Notes

- C:init does not store the identifier: self.id stays nil. Used via scenario_race_marker.createRaceMarker (which stores the marker in idToMarker[marker.id]), this produces a nil key and a Lua error: probable bug.
- All methods are empty, except hide and show which call setVisibility (empty).

## Class `C`

Marker with no visual effect, same interface as the other race markers.

The module returns a constructor: `local obj = require("scenario_raceMarkers_noneMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes nothing. | 35 |
| `C:createMarkers()` | Creates no object. | 31 |
| `C:hide()` | Calls setVisibility(false). | 27 |
| `C:init(id)` | Constructor called by the module: does nothing (the id is not stored). | 8 |
| `C:setMode(mode)` | Does nothing. | 20 |
| `C:setToCheckpoint(wp, mode)` | Does nothing. | 17 |
| `C:setVisibility(v)` | Does nothing. | 24 |
| `C:show()` | Calls setVisibility(true). | 28 |
| `C:update()` | Per-frame call: does nothing. | 12 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/noneMarker.lua`.*
