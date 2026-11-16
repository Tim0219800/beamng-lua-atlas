# `flowgraph_nodes_gameplay_completeScenario`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/completeScenario.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/completeScenario")` (file under extensions/ but not a regular extension)

Flowgraph node "Complete Scenario" (category once_instant). Ends the current scenario via scenario_scenarios.finish. Input pins: reason (final message) and fail (bool, if true the scenario fails). Without reason, the message is "Failed" or "Completed".

## Notes

- Does nothing if scenario_scenarios is not loaded.
- On failure the table passed contains failed = reason, otherwise msg = reason.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Node drawing in the editor. | 30 |
| `C:workOnce()` | Calls scenario_scenarios.finish({failed=...}) or ({msg=...}) depending on fail. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/completeScenario.lua`.*
