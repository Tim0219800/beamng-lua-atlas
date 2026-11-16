# `flowgraph_nodes_gameplay_delivery_startDelivery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/startDelivery")` (file under extensions/ but not a regular extension)

Flowgraph node "Start Delivery" (category once_instant, delivery). Starts the delivery: objectives, hints, markers and task list become visible and the timer starts. Requires a loaded delivery (Load Delivery) that is not already active. Pins: flow, reset (hidden) as inputs; flow, success as outputs.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets flow and success to false. | 35 |
| `C:_executionStopped()` | Resets flow and success to false. | 30 |
| `C:init()` | Resets flow and success to false. | 25 |
| `C:work()` | If flow is active: checks isLoaded() and not isActive(), calls freeformDelivery.start() and fills success/flow; logs errors. | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua`.*
