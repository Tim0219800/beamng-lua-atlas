# `flowgraph_nodes_environment_directionalGravity`

*File: `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/directionalGravity")` (file under extensions/ but not a regular extension)

Flowgraph node "Directional Gravity" (category dynamic_p_duration, vehicle color/icon). Gives a vehicle directional gravity by simulating a huge, very distant planet: places a "planet" of radius 1,000,000 m at 1,000,000 m from the vehicle in the given direction, with the mass that produces the desired acceleration (mass = magnitude * radius² / G), via obj:setPlanets on the vehicle side. Inputs: vehId (number, otherwise player vehicle), direction (vec3, normalized by the node, default {0,0,-1}), magnitude (m/s², default 1). When the graph stops, the vehicle's planets are removed (obj:setPlanets({})). In 'repeat' mode, recomputed every frame (useful because the origin follows the vehicle).

## Notes

- Bug (editor): drawMiddle reads self.pinIn.mass and self.pinIn.radius which do not exist on this node (copied from Planet): causes a nil indexing error when drawing.
- data.showDebug (true by default) draws a line and the gravity force (text) in the world from drawMiddle.
- Old pin renamed: vehID -> vehId.
- Constant C.gConst = 6.6742e-11 (m³ s⁻² kg⁻¹).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Removes the vehicle's planets (obj:setPlanets({})). | 37 |
| `C:drawMiddle(builder, style)` | Editor: debug display (line, force) and surface gravity. | 82 |
| `C:init()` | Enables showDebug and creates the planet table. | 31 |
| `C:setDirectionalGravity()` | Computes the planet's origin, radius and mass and sends obj:setPlanets to the vehicle. Does nothing if direction or magnitude is nil. | 55 |
| `C:work()` | If dynamicMode is 'repeat', reapplies the gravity every frame. | 49 |
| `C:workOnce()` | Applies the directional gravity once. | 45 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua`.*
