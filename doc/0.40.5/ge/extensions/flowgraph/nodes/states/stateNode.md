# `flowgraph_nodes_states_stateNode`

*File: `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua` · VM: Game Engine (GE) · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/states/stateNode")` (file under extensions/ but not a regular extension)

State node "State Node" of the stategraph (created by _flowgraph_createStateNode). Represents a target graph (targetGraph) in the state graph; pins: flow (input), success and fail (outputs of type state), plus custom outputs (transitions). Can export its state to a .state.flow.json file. Double-click: opens the target graph.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:EndPin()` | Empty. | 146 |
| `C:_onDeserialized(data)` | Stores targetGraphId for _postDeserialize. | 159 |
| `C:_onSerialize(res)` | Saves the target graph id (res.targetGraphId). | 151 |
| `C:_onSerializeState()` | Serializes the node + target graph for the state export (res.type = 'state'). | 185 |
| `C:_postDeserialize()` | After all graphs are loaded, finds the target graph (id + getGraphNodeOffset offset) and associates it. | 163 |
| `C:doubleClicked()` | Selects the target graph in the editor. | 113 |
| `C:drawCustomProperties()` | "Target Graph" dropdown (root graphs outside the state graph) and "Export State" button (JSON save via editor_fileDialog). | 64 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 121 |
| `C:getTransitionNames()` | Returns the sorted list of output pin names (possible transitions). | 104 |
| `C:init(mgr)` | allowCustomOutPins = true, savePins = true. | 37 |
| `C:onCustomNameChanged(name)` | Renames the target graph and returns a history message. | 176 |
| `C:representsGraph()` | Returns the target graph represented by this node. | 31 |
| `C:setAutoStart(val)` | Empty (unused). | 57 |
| `C:setTargetGraph(graph)` | Associates a target graph, takes its name and takes the "groupstate" color if it is a state graph; otherwise name "No Target!". | 43 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua`.*
