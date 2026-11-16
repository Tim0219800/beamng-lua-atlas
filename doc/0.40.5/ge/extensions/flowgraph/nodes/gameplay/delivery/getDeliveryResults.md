# `flowgraph_nodes_gameplay_delivery_getDeliveryResults`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Delivery Results" (category provider, delivery). Provides the current results of the delivery as a table (time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, allRequiredComplete, vehicleDamages). Outputs: results (nil if no delivery is active) and isActive.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets results and isActive to nil/false. | 34 |
| `C:_executionStopped()` | Resets results and isActive to nil/false. | 29 |
| `C:init()` | Resets results and isActive to nil/false. | 24 |
| `C:work()` | Calls isActive() then getResults() of the freeformDelivery module if the delivery is active. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua`.*
