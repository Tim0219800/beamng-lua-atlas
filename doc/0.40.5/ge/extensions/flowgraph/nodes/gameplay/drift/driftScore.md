# `flowgraph_nodes_gameplay_drift_driftScore`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftScore.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftScore")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Score" (category repeat_instant, drift). Gives the drift scores from gameplay_drift_scoring.getScore(): score (total), cachedScore (temporary) and combo (current).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies score, cachedScore and combo to the output pins. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftScore.lua`.*
