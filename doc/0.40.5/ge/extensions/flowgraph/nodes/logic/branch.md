# `flowgraph_nodes_logic_branch`

*File: `lua/ge/extensions/flowgraph/nodes/logic/branch.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/branch")` (file under extensions/ but not a regular extension)

Flowgraph node 'Branch' (logic category): an 'if'. If the input flow is active, lets the flow through the True or False output depending on the bool pin 'condition'. The (hidden) 'flow' output pin simply follows the input. Runs every frame.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If flow is true: output flow = flow, True = condition, False = not condition. Otherwise all outputs go to false. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/branch.lua`.*
