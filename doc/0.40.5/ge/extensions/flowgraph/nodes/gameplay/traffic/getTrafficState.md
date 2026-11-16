# `flowgraph_nodes_gameplay_traffic_getTrafficState`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getTrafficState.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/getTrafficState")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Traffic State" (repeat_instant). Reads the traffic state (gameplay_traffic.getState: on, off, spawning, loading) and the vehicle count: outputs flow on/spawning/loading/off, onBool, state, amount (getNumOfTraffic), activeAmount (getNumOfTraffic(true), from the vehicle pool).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Writes the traffic state and counters to the outputs every frame. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getTrafficState.lua`.*
