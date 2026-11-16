# `flowgraph_nodes_gameplay_traffic_signals_instanceByName`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceByName.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instanceByName")` (file under extensions/ but not a regular extension)

Flowgraph node "Signal by Name" (once_instant). Looks up a traffic light instance by name in signalsData.instances. Outputs: exists (hidden), instanceData.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 31 |
| `C:init()` | Calls onNodeReset(). | 27 |
| `C:onNodeReset()` | Clears the instanceData output. | 23 |
| `C:work(args)` | Iterates over signalsData.instances and publishes the instance with the same name. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceByName.lua`.*
