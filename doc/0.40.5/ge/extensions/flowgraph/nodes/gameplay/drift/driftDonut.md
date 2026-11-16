# `flowgraph_nodes_gameplay_drift_driftDonut`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftDonut.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftDonut")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Donut Detected" (category repeat_instant, drift). Detects donut zones: emits a donutDrift pulse and the donutScore score when the donut callback of the flowgraph drift module is active (ttl > 0).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Reads mgr.modules.drift:getCallBacks().donut and fills donutDrift and donutScore. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftDonut.lua`.*
