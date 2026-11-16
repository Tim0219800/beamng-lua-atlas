# `flowgraph_nodes_gameplay_delivery_abandonDelivery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery")` (file under extensions/ but not a regular extension)

Flowgraph node "Abandon Delivery" (category once_instant, tags delivery/mission). Abandons the current delivery and tears down the system (vehicles, UI elements, state) via gameplay_freeformDelivery_freeformDelivery.teardown. Input pins: flow, reset (hidden), keepVehicles (bool: keeps the vehicles by taking them out of the prefabs). Outputs: flow, success.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset. | 31 |
| `C:init()` | Sets flow and success to false. | 26 |
| `C:onNodeReset()` | Calls reset. | 35 |
| `C:reset()` | Resets flow and success to false. | 39 |
| `C:work()` | If flow is active: calls teardown(keepVehicles) and signals success; logs an error if the delivery system is absent. | 46 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua`.*
