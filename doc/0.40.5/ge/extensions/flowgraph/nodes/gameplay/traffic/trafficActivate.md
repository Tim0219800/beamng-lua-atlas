# `flowgraph_nodes_gameplay_traffic_trafficActivate`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficActivate")` (file under extensions/ but not a regular extension)

Flowgraph node "Activate Traffic" (once_instant). Activates traffic mode for a list of ids (vehicleIds, typically from the Spawn Vehicle Group node) via traffic:activateTraffic. Outputs: activated (pulse), vehicleIds (gameplay_traffic.getTrafficList()), total (hidden). On reset or stop: traffic:deactivateTraffic(). Legacy pin "data" renamed vehicleIds (legacyPins).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 34 |
| `C:init()` | Calls onNodeReset(). | 30 |
| `C:onNodeReset()` | Deactivates traffic and resets the flags. | 38 |
| `C:work()` | Publishes the total number of AI vehicles and the activated pulse. | 54 |
| `C:workOnce()` | Activates traffic for vehicleIds (if defined) and publishes the validated traffic list. | 44 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua`.*
