# `flowgraph_nodes_gameplay_drift_driftReset`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftReset.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftReset")` (file under extensions/ but not a regular extension)

Flowgraph node "Reset Drift" (category repeat_instant, drift). Resets scores and systems: gameplay_drift_general.reset() then mgr.modules.drift:resetModule(). No declared pins.

## Notes

- Category repeat_instant without pins: both calls are redone every frame as long as the node is reached.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls gameplay_drift_general.reset() and resetModule() of the drift module. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftReset.lua`.*
