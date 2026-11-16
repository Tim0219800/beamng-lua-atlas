# `flowgraph_nodes_logic_chainFlowBranch`

*File: `lua/ge/extensions/flowgraph/nodes/logic/chainFlowBranch.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/chainFlowBranch")` (file under extensions/ but not a regular extension)

Flowgraph node 'Chainflow Branch' (logic category). Variant of Branch for 'chain flow' (pins declared with chainFlow=true): sends the flow to True or False depending on the bool pin 'condition'. No general 'flow' output pin.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If flow is true: True = condition and False = not condition; otherwise True and False go to false. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/chainFlowBranch.lua`.*
