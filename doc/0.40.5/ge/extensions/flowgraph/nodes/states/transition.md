# `flowgraph_nodes_states_transition`

*File: `lua/ge/extensions/flowgraph/nodes/states/transition.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/states/transition")` (file under extensions/ but not a regular extension)

Stategraph node "Transition". Ends the current state and moves to a new state: on flow, collects the value of all its custom input pins (except 'flow') and calls self.mgr.states:transition(stateId, transitionName, data, self). transitionName is 'success' by default and is chosen among the transitions of the state node. The data can be read in the next state with the "Get Transition Variables" node.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores transitionName ('success' by default). | 122 |
| `C:_onSerialize(res)` | Saves transitionName. | 118 |
| `C:customContextMenu()` | Adds to the context menu "Go to target..." listing the target graphs of this transition. | 126 |
| `C:drawCustomProperties()` | "Transition Name" dropdown based on the parent state node. | 72 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 112 |
| `C:hideProperties()` | Frees the pin template cache. | 91 |
| `C:init()` | savePins = true, allowCustomInPins = true, transitionName = 'success'. | 36 |
| `C:makePinTemplates()` | Builds the pin templates (name/type) from the other transition and transitionStack nodes of the project. | 42 |
| `C:work()` | If flow, triggers the transition with the pins' data (nil if there are none). | 97 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/states/transition.lua`.*
