# `flowgraph_nodes_gameplay_traffic_signals_instance`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instance.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instance")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Signal Instance" (repeat_instant). Reads a traffic light instance (signalInstanceData): pos (stop position), dirVec, targetPos (pos if absent), stateName, stateAction, active, sequenceData and controllerData (empty tables if absent).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Copies the instance's properties and its current state (instance:getState()) to the outputs. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instance.lua`.*
