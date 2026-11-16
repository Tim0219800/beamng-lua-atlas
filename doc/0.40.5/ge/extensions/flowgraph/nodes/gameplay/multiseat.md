# `flowgraph_nodes_gameplay_multiseat`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/multiseat")` (file under extensions/ but not a regular extension)

Flowgraph node "Multiseat" (category once_instant, no pin). Enables the 'multiseat' setting once (workOnce) while saving the previous value, then restores it when graph execution stops.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets self.activated to false when the graph starts. | 20 |
| `C:_executionStopped()` | If the node had enabled multiseat, restores the original value of the setting. | 30 |
| `C:init(mgr, ...)` | Initializes self.activated to false. | 16 |
| `C:workOnce()` | Reads the 'multiseat' setting (default false), stores it in self.previous then sets 'multiseat' to true via settings.setValue. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua`.*
