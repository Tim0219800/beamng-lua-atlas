# `flowgraph_nodes_activity_requestAbandon`

*File: `lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/requestAbandon")` (file under extensions/ but not a regular extension)

Flowgraph node "Request Abandon" (category logic, tag input). Lets the flow through, only once, when the player requests to abandon the mission. Pins: flow input; outputs flow (impulse) and value (hidden bool, true as long as the abandon is requested). If this node exists, the graph must be stopped manually at the end. data.blocksOnResetGameplay = true.

## Notes

- The press is consumed: the flag is set back to false after the work and after the trigger (_afterTrigger). The event is recorded in the graph's log (logEvent "Player pressed 'Abandon'").

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Sets reset back to false after the trigger. | 43 |
| `C:_executionStarted()` | Sets reset back to false when the graph starts. | 34 |
| `C:_executionStopped()` | Sets reset back to false when the graph stops. | 29 |
| `C:drawMiddle(builder, style)` | Editor: draws the central area of the node. | 47 |
| `C:init(mgr, ...)` | Sets reset to false and data.blocksOnResetGameplay to true. | 24 |
| `C:onRequestAbandon()` | Hook called when the player requests to abandon; stores the request. | 39 |
| `C:work(args)` | If an abandon request is pending, enables flow and value (and logs), otherwise sets them to false. | 51 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua`.*
