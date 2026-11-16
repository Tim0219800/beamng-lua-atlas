# `flowgraph_nodes_gameplay_delivery_deliveryFinished`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua` · VM: Game Engine (GE) · 88 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished")` (file under extensions/ but not a regular extension)

Flowgraph node "Delivery Finished" (category repeat_instant, delivery). Detects the end of the delivery (all objectives reached or manual end via the quick menu). Input pins: flow. Outputs: finished (single pulse), isActive, failed, failReason (empty string on success). Uses isActive, isFinished, isFailed and getFailReason of the freeformDelivery module.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the states and outputs. | 44 |
| `C:_executionStopped()` | Resets the states and outputs. | 35 |
| `C:init()` | Initializes the states and outputs. | 26 |
| `C:work()` | If flow is active, compares the finished state with the previous state to emit finished only once and fills failed/failReason. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua`.*
