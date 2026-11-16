# `flowgraph_nodes_logic_flowSwitch`

*File: `lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/flowSwitch")` (file under extensions/ but not a regular extension)

Flowgraph node 'Flow Switch' (logic category). Switch with flow inputs 'on' and 'off'; the state can also be toggled by clicking the checkbox on the node in the editor. The flow output equals the input flow if the switch is ON. The initial state is saved in the project (storedOn).

## Notes

- If storedOn has never been set (nil), _executionStarted sets self.on to nil, which is equivalent to OFF.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Restores the saved state (storedOn). | 46 |
| `C:_executionStopped()` | Restores the saved state (storedOn). | 42 |
| `C:_onDeserialized(nodeData)` | Reads storedOn back from the 'on' field. | 54 |
| `C:_onSerialize(res)` | Saves storedOn in the 'on' field. | 50 |
| `C:drawMiddle(builder, style)` | Draws a clickable checkbox; a click toggles the state and, if editing is allowed, stores storedOn. | 30 |
| `C:init(mgr, ...)` | Initial state: off. | 26 |
| `C:work(args)` | If 'on' has flow, switches to ON; if 'off' has flow, switches to OFF (off wins if both). Output flow = state AND input flow. | 58 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua`.*
