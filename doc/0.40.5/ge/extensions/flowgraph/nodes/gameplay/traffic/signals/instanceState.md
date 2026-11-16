# `flowgraph_nodes_gameplay_traffic_signals_instanceState`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState")` (file under extensions/ but not a regular extension)

Flowgraph node "Predict Signal State" (once_instant). Predicts the future state of a traffic light instance after `seconds` seconds (positive only) via instance:getStateAfterTime. Outputs: stateName, stateAction.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Computes the predicted state and writes stateName / stateAction. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState.lua`.*
