# `flowgraph_nodes_gameplay_drift_driftTightDrift`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftTightDrift.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftTightDrift")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Through Detected" (category repeat_instant, drift). Detects tight drift zones: emits tightDrift (pulse) and tightDriftScore when the tight callback of the flowgraph drift module is active (ttl > 0).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Reads mgr.modules.drift:getCallBacks().tight and fills tightDrift and tightDriftScore. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftTightDrift.lua`.*
