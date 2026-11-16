# `flowgraph_nodes_events_controlsAction`

*File: `lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/controlsAction")` (file under extensions/ but not a regular extension)

Flowgraph node "Controls Action" (category logic, event). Lets flow through when the action (Ctrl + Space) is pressed. Automatically pushes the "FlowgraphActions" action map when the graph starts and removes it on stop. Pins: flow (input), flow (output, pulse once on press) and value (hidden bool, true on press).

## Notes

- The event is valid if it is less than 2 manager frames old (mgr.frameCount).
- Code todo: uncertain interaction if several flowgraphs use this node.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the state and calls pushActionMap("FlowgraphActions"). | 36 |
| `C:_executionStopped()` | Resets the state and calls popActionMap("FlowgraphActions"). | 30 |
| `C:drawMiddle(builder, style)` | Node drawing in the editor. | 47 |
| `C:init(mgr, ...)` | Initializes self.reset = false. | 26 |
| `C:onControlsAction()` | Hook called when the action is triggered: stores the frame number. | 42 |
| `C:work(args)` | Sets flow and value to true during the frame following the press, otherwise to false. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua`.*
