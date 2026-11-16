# `flowgraph_nodes_gameplay_delivery_resetDelivery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/resetDelivery")` (file under extensions/ but not a regular extension)

Flowgraph node "Reset Delivery" (category once_f_duration, delivery). Resets the active or finished delivery: vehicles returned to their start position and objectives reset (freeformDelivery.reset). Waits for the setup to finish (gameplay_freeformDelivery_setup.isSetupComplete) before giving flow. Outputs: flow, success.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`, `gameplay_freeformDelivery_setup`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset. | 31 |
| `C:init()` | Initializes the outputs and the duration state to 'inactive'. | 25 |
| `C:onNodeReset()` | Calls reset. | 35 |
| `C:reset()` | Resets the outputs to false and the state to 'inactive'. | 39 |
| `C:work()` | In the 'started' state, waits for the setup to finish then activates success and flow. | 71 |
| `C:workOnce()` | Checks that a delivery exists, calls freeformDelivery.reset() and switches to 'started'; logs a warning or an error otherwise. | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua`.*
