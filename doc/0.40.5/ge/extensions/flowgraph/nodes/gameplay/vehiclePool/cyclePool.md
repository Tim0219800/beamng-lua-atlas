# `flowgraph_nodes_gameplay_vehiclePool_cyclePool`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool")` (file under extensions/ but not a regular extension)

Flowgraph node "Cycle Pool" (once_instant). Swaps an active vehicle and an inactive vehicle of the pool to keep the same number of running vehicles (pool:cycle). Input pins: vehPool, vehId1 (active, optional), vehId2 (inactive, optional); outputs: inactiveId, activeId. Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

## Notes

- Bug: workOnce reads self.pinIn.activeId and self.pinIn.inactiveId, which do not exist (the input pins are named vehId1 and vehId2; activeId/inactiveId are outputs): the call raises a Lua error and the outputs are never written.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Meant to call pool:cycle(activeId, inactiveId); see the note about the incorrect pin names. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool.lua`.*
