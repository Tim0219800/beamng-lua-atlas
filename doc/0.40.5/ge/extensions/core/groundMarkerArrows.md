# `core_groundMarkerArrows`

*File: `lua/ge/extensions/core/groundMarkerArrows.lua` · VM: Game Engine (GE) · 436 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_groundMarkerArrows`: `extensions.load("core_groundMarkerArrows")`, then the global `core_groundMarkerArrows`

GE extension `core_groundMarkerArrows`: manages the large floating arrows displayed at the intersections of the navigation route (model s_mm_arrow_floating.dae, TSStatic objects in the SimGroup 'arrowPool'). It is driven by core_groundMarkers (createArrowPool, updateArrows, clearArrows); a modder normally does not need to call it directly. It also displays the "wrong way" message when the vehicle moves away from the path.

## Notes

- Pool of 11 arrows (loop 0..10), each represented by a proxy {pos, rot, state, wp, smoothers}. States: 'unused', 'visible', 'fadeout'. Arrows are placed 3.5 m above the intersection node, oriented toward the next point of the path.
- An arrow is only created for a path point that is an intersection (linkCount > 2, with a wp node) located between 15 m (minArrowDistance) and 180 m (maxArrowDistance) ahead of the vehicle, and whose turn angle is greater than 25 degrees, or lower but not the smallest angle among the intersection's exits.
- Size: 3 (arrowSmall) under 65 m, 4.5 (arrowLarge) beyond; slight forward offset when the arrow is under 45 m; fade in/out through temporal smoothing.
- Color: read from core_groundMarkers.floatingArrowColor (the floatingArrowColor parameter of createArrowPool is unused).
- Wrong way: a counter clamped to -20..20 increases when the vehicle's speed is opposite to the path direction (negative dot product) and decreases otherwise; above 0, ui_message 'ui.groundMarkers.wrongDirection' is displayed (5 s, id 'wrongDirection').
- In photo mode (photoModeOpen) all arrows are hidden.
- Inconsistencies: the floatingArrowColor parameter of createArrowPool is ignored; a large ImGui debug block is commented out in onPreRender; onExit is a simple alias of clearArrows.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_groundMarkerArrows.clearArrows()` | Deletes all arrow objects and the SimGroup 'arrowPool', clears the tracking tables and resets the wrong way counter to -20. | 29 |
| `core_groundMarkerArrows.createArrowPool(floatingArrowColor)` | Creates the SimGroup 'arrowPool' with 11 hidden TSStatic arrows (no collision, canSave = false) and their proxies. If the pool already exists, resets all proxies to 'unused' and hides the arrows. | 50 |
| `core_groundMarkerArrows.onExit()` | Engine exit hook: alias of clearArrows. *(internal)* *(hook)* | 29 |
| `core_groundMarkerArrows.onPreRender(dt)` | Render hook: applies to each non-'unused' arrow its position, rotation and scale (smoothed size x alpha) and fades arrows to the 'unused' state once invisible. Hides everything in photo mode. *(internal)* *(hook)* | 246 |
| `core_groundMarkerArrows.updateArrows(path, pathLength)` | Updates the arrows from the path: creates/reuses those of the intersections to guide, fades out those that are no longer useful, and handles the wrong way message. | 122 |

### Parameter details

#### `core_groundMarkerArrows.createArrowPool(floatingArrowColor)`

Creates the SimGroup 'arrowPool' with 11 hidden TSStatic arrows (no collision, canSave = false) and their proxies. If the pool already exists, resets all proxies to 'unused' and hides the arrows.

- `floatingArrowColor` (*number[]|nil*) : Unused (the color comes from core_groundMarkers.floatingArrowColor).

#### `core_groundMarkerArrows.onPreRender(dt)`

Render hook: applies to each non-'unused' arrow its position, rotation and scale (smoothed size x alpha) and fades arrows to the 'unused' state once invisible. Hides everything in photo mode.

- `dt` (*number*) : Render time delta in seconds.

#### `core_groundMarkerArrows.updateArrows(path, pathLength)`

Updates the arrows from the path: creates/reuses those of the intersections to guide, fades out those that are no longer useful, and handles the wrong way message.

- `path` (*table[]*) : Router path: elements {pos = vec3, distToTarget, wp, linkCount}.
- `pathLength` (*number*) : Total distance from the vehicle to the destination in meters (distToVehicle = pathLength - path[i].distToTarget).

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/groundMarkerArrows.lua`.*
