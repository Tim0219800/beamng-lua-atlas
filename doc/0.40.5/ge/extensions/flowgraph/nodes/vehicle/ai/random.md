# `flowgraph_nodes_vehicle_ai_random`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/random.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/random")` (file under extensions/ but not a regular extension)

Node "AI Random" (color ai, once_p_duration). Puts a vehicle in "random" AI mode (drives on random roads). Input: aiVehId (no value = player vehicle).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends ai.setState({mode = "random"}) to the vehicle. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/random.lua`.*
