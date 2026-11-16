# `flowgraph_nodes_gameplay_vehiclePool_activateByDistance`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance")` (file under extensions/ but not a regular extension)

Flowgraph node "Activate Vehicles By Distance" (repeat_instant). Every frame, activates the pool vehicles close to a point and deactivates the others (pool:activateByDistanceTo(pos, distance)). pos defaults to the camera position (core_camera.getPositionXYZ). Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Determines the focus point and calls activateByDistanceTo. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance.lua`.*
