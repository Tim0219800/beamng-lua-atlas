# `flowgraph_nodes_gameplay_traffic_signals_controllerByName`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName")` (file under extensions/ but not a regular extension)

Flowgraph node "Controller by Name" (once_instant). Looks up a traffic light controller (signal type) by name in signalsData.controllers. Outputs: exists (hidden), controllerData.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 31 |
| `C:init()` | Calls onNodeReset(). | 27 |
| `C:onNodeReset()` | Clears the controllerData output. | 23 |
| `C:work(args)` | Iterates over signalsData.controllers and publishes the controller with the same name. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName.lua`.*
