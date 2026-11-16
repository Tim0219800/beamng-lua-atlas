# `flowgraph_nodes_macro_integrated`

*File: `lua/ge/extensions/flowgraph/nodes/macro/integrated.lua` · VM: Game Engine (GE) · 222 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/macro/integrated")` (file under extensions/ but not a regular extension)

Macro node 'Integrated' (hidden, canHaveGraph): represents a subgraph (target graph / macro) in the parent graph. Its pins are copied from the I/O nodes of the subgraph: inputs are written to the 'in' I/O node, outputs are read from the 'out' I/O node. Double-click in the editor to open the subgraph.

## Notes

- In _onDeserialized (non-instance case), the getGraphNodeOffset offset is added to targetID and again in the mgr.graphs index; _postDeserialize adds it again: possible inconsistency.
- _onSerialize uses the same code in both branches of the if (instance or not).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Calls updatePins after each execution. | 190 |
| `C:_executionStarted()` | Pushes the values of the hard-coded input pins to the 'in' I/O node. | 195 |
| `C:_executionStopped()` | Resets these values to nil in the 'in' I/O node. | 207 |
| `C:_onDeserialized(nodeData)` | Reads back name, color, graph type and target (macro instance created from macroPath if needed). | 110 |
| `C:_onSerialize(res)` | Saves name, graphType, targetID and color. | 82 |
| `C:_postDeserialize()` | Relinks the target graph via mgr.graphs[targetID + offset]. | 57 |
| `C:doubleClicked()` | Selects the target graph in the editor (except from a macro graph). | 160 |
| `C:drawCustomProperties()` | Debug button 'Manually Refresh Pins'. | 23 |
| `C:drawMiddle(builder, style)` | Search icon with hover preview and watched variables. | 130 |
| `C:gatherPins()` | Recreates the input/output pins from the pin lists of the I/O nodes. | 61 |
| `C:init()` | savePins=true and gray color. | 19 |
| `C:representsGraph()` | Returns the represented graph. | 13 |
| `C:setTargetGraph(graph)` | Binds the node to a graph: finds its macro/io 'in' and 'out' nodes, stores targetGraph/targetID and sets the name. | 36 |
| `C:updatePins()` | Copies the values of the input pins to the 'in' I/O node and those of the 'out' I/O node to the output pins. | 171 |
| `C:work()` | Empty. | 218 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/macro/integrated.lua`.*
