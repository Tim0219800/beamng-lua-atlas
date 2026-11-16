# `flowgraph_nodes_gameplay_traffic_trafficParams`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficParams.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficParams")` (file under extensions/ but not a regular extension)

Flowgraph node "Traffic Parameters" (once_instant). Sets the traffic system via gameplay_traffic.setTrafficVars: aiMode (traffic, random, flee, chase, follow, stop; default traffic), spawnRate (spawnValue, 0 to 3), directionBias (spawnDirBias, -1 to 1; -1 = away from the player), risk (baseAggression), poolActiveAmount (activeAmount; with data.usePoolInactiveAmount, equals the number of traffic vehicles minus the value), enableRandomEvents. Only non-nil pins are applied. Legacy pin poolAmount renamed poolActiveAmount.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 33 |
| `C:postInit()` | Defines the preset values of the aiMode pin. | 38 |
| `C:workOnce()` | Builds the variables table from the non-nil pins and calls gameplay_traffic.setTrafficVars. | 46 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficParams.lua`.*
