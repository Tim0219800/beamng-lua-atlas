# `flowgraph_nodes_states_stateExit`

*File: `lua/ge/extensions/flowgraph/nodes/states/stateExit.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/states/stateExit")` (file under extensions/ but not a regular extension)

State node "State Exit" (created by _flowgraph_createStateNode). Exit point of the state graph: an input pin 'flow' of type state (manual pins of type state allowed), hidden in the menus. The transitionName field designates the transition (output pin of the parent state node) to take; chosen in the editor among those of the target node.

## Notes

- The "(None)" choice sets transitionName to nil whereas the initial value is ''; drawMiddle displays "No Transition!" for nil.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores transitionName ('' by default). | 69 |
| `C:_onSerialize(res)` | Saves transitionName. | 65 |
| `C:drawCustomProperties()` | "Transition Name" dropdown built from the transition names of the parent state node that targets this graph. | 30 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 59 |
| `C:init(mgr)` | autoStart = false, savePins = true, transitionName = ''. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/states/stateExit.lua`.*
