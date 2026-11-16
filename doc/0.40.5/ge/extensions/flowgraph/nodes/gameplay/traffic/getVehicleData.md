# `flowgraph_nodes_gameplay_traffic_getVehicleData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicleData.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/getVehicleData")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Traffic Vehicle Data" (repeat_instant). Reads the parameters of an active traffic vehicle (gameplay_traffic.getTrafficData): role (role name), state, camVisible, crashDamage, respawnCount.

## Notes

- If the vehicle is not in traffic, the outputs keep their old values.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies the data of traffic vehicle vehId to the outputs. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicleData.lua`.*
