# `flowgraph_nodes_gameplay_traffic_signals_instanceSettings`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings")` (file under extensions/ but not a regular extension)

Flowgraph node "Signal Instance Settings" (once_instant). Sets a traffic light instance: sequence (setSequence by id), controller (setController by id), active (setActive), stateIndex (setStrictState; 0 to reset). Only non-nil pins are applied.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Applies the sequence, controller, activation and forced state to the instance. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings.lua`.*
