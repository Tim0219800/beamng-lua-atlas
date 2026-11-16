# `flowgraph_nodes_gameplay_traffic_fileVehicleGroup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup")` (file under extensions/ but not a regular extension)

Flowgraph node "File Vehicle Group" (once_p_duration). Loads a .vehGroup.json file (jsonReadFile). If the file has a generator or no data, the group is generated with core_multiSpawn.createGroup(amount, generator) (amount defaults to 10). Output: group (vehicleGroupData) for the traffic spawn nodes.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Called when the flowgraph project execution stops; releases the internal state. | 36 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 22 |
| `C:onNodeReset()` | Called when the node is reset; resets its internal state. | 32 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 26 |
| `C:work()` | On the first call, resolves the path, reads the file, generates the data if needed and publishes the group; node error if the file is not found. | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua`.*
