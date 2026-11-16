# `flowgraph_nodes_gameplay_drift_setDriftContext`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftContext.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftContext")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Drift Context" (category repeat_instant). Sets the drift context, which defines a set of rules and display, via gameplay_drift_general.setContext. Input pin: driftContext (string; the pin help cites stopped, inChallenge, inFreeroam).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls gameplay_drift_general.setContext(driftContext). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftContext.lua`.*
