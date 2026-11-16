# `flowgraph_nodes_environment_simplePlanet`

*File: `lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/simplePlanet")` (file under extensions/ but not a regular extension)

Flowgraph node "Simple Planet" (category once_p_duration). Creates a spherical gravity source for a vehicle by sending obj:setPlanets({x,y,z,radius,mass}) to its VM. Input pins: vehId (default: player vehicle 0), position (vec3), radius, mass. Executed only once; the node reset or the graph stop empties the planets (obj:setPlanets({})).

## Notes

- If position, mass or radius is nil, the node does nothing.
- If vehId matches no object, self.vehicle is nil and queueLuaCommand crashes (unprotected).
- Old pin vehID renamed vehId (legacyPins). The description of the vehId pin talks about gravity but it designates the target vehicle.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 62 |
| `C:init()` | Initializes self.vehicle to nil. | 29 |
| `C:onNodeReset()` | If a vehicle was targeted, sends it obj:setPlanets({}) and forgets the reference. | 33 |
| `C:workOnce()` | Builds the command obj:setPlanets({x,y,z,radius,mass}) and sends it to the targeted vehicle. | 40 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua`.*
