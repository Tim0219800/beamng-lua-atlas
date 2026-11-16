# `flowgraph_nodes_gameplay_delivery_loadDelivery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua` · VM: Game Engine (GE) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/delivery/loadDelivery")` (file under extensions/ but not a regular extension)

Flowgraph node "Load Delivery" (category once_f_duration, delivery). Loads a delivery file, prepares vehicles and routes and puts the player in the right vehicle; the setup takes a few frames. Use Start Delivery afterwards. Input pins: flow, reset (hidden), deliveryPath (default 'delivery.delivery.json'). Outputs: flow, success, isLoaded.

## Notes

- If missionTypeData.deliveryPath exists in the activity, it replaces deliveryPath when the latter is empty or equal to the default value.
- The path is resolved with mgr:getRelativeAbsolutePath.

**Dependencies (loaded first):** `gameplay_freeformDelivery_freeformDelivery`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset. | 34 |
| `C:init()` | Initializes the outputs and the duration state to 'inactive'. | 27 |
| `C:onNodeReset()` | Calls reset. | 38 |
| `C:reset()` | Resets the outputs to false and the state to 'inactive'. | 42 |
| `C:work()` | In the 'started' state, waits for isLoaded() then activates success, isLoaded and flow ('finished'); afterwards keeps flow. | 87 |
| `C:workOnce()` | Resolves the path, calls freeformDelivery.load and switches to the 'started' state; logs errors. | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua`.*
