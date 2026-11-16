# `flowgraph_nodes_debug_flowButton`

*File: `lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/flowButton")` (file under extensions/ but not a regular extension)

Flowgraph node "Flow Button" (simple type, category logic, tag input). A button in the node: a click (only while the graph is running) produces a one-frame pulse on the flow output. Input: flow. The button label (data.btnName, "Push" by default) takes the name of the linked pin (or the target node name if the pin is named flow).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Editor: draws the button; a click arms doTrigger if the graph is in the "running" state. | 26 |
| `C:init(mgr, ...)` | Label "Push" and doTrigger false. | 21 |
| `C:onLink(link)` | Editor hook: renames the button after the pin or target node if the name is still "Push". | 44 |
| `C:onUnlink(link)` | Editor hook: resets the label to "Push". | 53 |
| `C:work()` | Sets the flow output to doTrigger then resets it to false. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua`.*
