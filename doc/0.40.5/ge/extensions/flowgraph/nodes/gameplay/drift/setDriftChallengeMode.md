# `flowgraph_nodes_gameplay_drift_setDriftChallengeMode`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Drift Challenge Mode" (category repeat_instant). Sets the drift challenge mode via gameplay_drift_general.setChallengeMode. Input pin: driftChallengeMode (string; the pin help cites "A to B", "A to B with stunt zone", "Gymkhana").

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls gameplay_drift_general.setChallengeMode(driftChallengeMode). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode.lua`.*
