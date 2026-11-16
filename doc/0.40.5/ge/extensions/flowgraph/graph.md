# `flowgraph_graph`

*File: `lua/ge/extensions/flowgraph/graph.lua` · VM: Game Engine (GE) · 1527 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/graph")` (file under extensions/ but not a regular extension)

Flowgraph 'graph' class: a graph of nodes and links belonging to a manager (self.mgr). A graph has a type ('graph', 'macro' or 'instance'), nodes, links, pins, a local variableStorage and an optional parent (parentId). It can create and delete nodes and links, check pin compatibility, serialize and deserialize its data and, for a root graph, plan the node execution order (plan). The module returns a constructor: require('/lua/ge/extensions/flowgraph/graph')(mgr, name, forceId).

## Notes

- Graphs are stored flat in mgr.graphs; the hierarchy comes from parentId (getChildren iterates over mgr.graphs and sorts by id).
- plan() does nothing for a macro or for a graph that has a parent: only the root plans, aggregating the nodes and links of its children (gatherNodesAndLinks) and resolving the macro/integrated and macro/io nodes (virtual links).
- plan() determines the root nodes (triggerable, or with no local input pin and a flow output), propagates the "flow colors" and generates the ordered execution code (_workDynamicRepeat / _workDynamicOnce calls).
- createNode also creates a hidden link from the enterState pin of the events/onUpdate node to the reset pin of 'once' nodes if the preference flowgraph.general.autoConnectResetPins is active.
- deleteLink and deleteNode do not immediately remove the object from the editor: they record the id in mgr.linksToRemove / mgr.nodesToRemove, processed by the manager.
- Probable bug: getDeepChild uses current.children, a field commented out in init (self.children does not exist), so getMacro with non-empty indices fails.
- getSiblings contains a debug print(parent.name).
- pinsCompatible can return nil (instead of false) when no type matches.

## Class `C`

Graph object returned by the constructor.

The module returns a constructor: `local obj = require("flowgraph_graph")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the project starts: notifies each node. | 1266 |
| `C:_executionStopped()` | Called when the project stops: notifies the nodes and the variableStorage. | 1281 |
| `C:_onClear()` | Notifies the nodes and the variableStorage of a clear. | 1274 |
| `C:_onDeserialized(data)` | Rebuilds the graph (nodes sorted by id, links, variables) from the serialized data. | 1031 |
| `C:_onSerialize()` | Serializes the graph (name, nodes, ordered links, type, variables, view, parentId...). Returns the table and the smallest id used. | 952 |
| `C:_printStructure(depth)` | Recursively prints the tree of graphs with indentation. | 1378 |
| `C:canCreateLink(a, b, newLinkInfo)` | True if a link can be created between a and b (opposite directions, different nodes, compatible types, no existing link, equal names if matchName). | 1229 |
| `C:clear()` | Deletes the child graphs, destroys the nodes and clears nodes, links, pins. | 789 |
| `C:clearVariableChangesChildren()` | Clears the pending variable changes of this graph and its descendants. | 77 |
| `C:createLink(startPin, endPin, ...)` | Creates a link between an output pin and an input pin (after removing the hardcoded value from the target pin). | 913 |
| `C:createNode(nodeType, forceId, ...)` | Creates a node of a given type (e.g. 'events/onUpdate') from the manager's templates. Logs an error and returns nil if the type is unknown. Marks obsolete nodes in their name. | 818 |
| `C:deleteLink(link)` | Deletes a link: updates pinIn / _mInFlow of the target, notifies pins and nodes, schedules the deletion on the editor side. | 919 |
| `C:deleteNode(node, ignoreIntegratedNodes)` | Deletes a node and its links (except undeleteable nodes outside debug mode; a node that represents a graph deletes that graph, unless ignoreIntegratedNodes). | 874 |
| `C:findNodeInChildren(id)` | Alias of findNodeRecursive. | 1347 |
| `C:findNodeRecursive(id)` | Looks for a node by id in this graph then in its children. | 1350 |
| `C:findPin(pinId)` | Returns the pin with the given id. | 1249 |
| `C:forceRecursiveNodeUpdatePosition()` | Forces the update of the editor position of all nodes (recursive). | 1365 |
| `C:gatherNodesAndLinks(rNodes, rLinks, interInfo)` | Adds to rNodes and rLinks the nodes and links of this graph and its children, and fills interInfo for macro/integrated nodes. | 127 |
| `C:getChildPosition()` | Returns the sequence of indices of this graph among the children from the root of the instance. | 1315 |
| `C:getChildren()` | Returns the child graphs (parentId == id), sorted by id. | 65 |
| `C:getChildrenWithStates()` | Children of the graph, plus (for a state graph) the non-state graphs represented by its nodes. | 1427 |
| `C:getDeepChild(indexes)` | Descends into the children according to indices (see notes: uses a nonexistent children field). | 1326 |
| `C:getDirtyChildren(dirtyChildren)` | Collects the ids of 'dirty' macros used by child instances. | 92 |
| `C:getInstanceRoot()` | Returns the root of the instance (first ancestor with macroID). | 1304 |
| `C:getLocation(withIds)` | Returns the path of the graph from the root (names, or ids if withIds), parent states included. | 1472 |
| `C:getMacro()` | For a graph of type 'instance', returns the corresponding original macro graph. | 1290 |
| `C:getParent()` | Returns the parent graph. | 58 |
| `C:getParentWithStates()` | Like getParent, but if the graph has no parent, returns the state graph in which a node represents this graph. | 1405 |
| `C:getRecursiveHooksAndDependencies(hooks, deps)` | Recursively collects the nodes (for their hooks) and the extension dependencies declared by the nodes. | 1334 |
| `C:getRootGraph()` | Goes up to the root graph. | 84 |
| `C:getSiblings()` | Returns the sibling graphs (same parent, states included); prints the parent's name (see notes). | 1441 |
| `C:hasLink(pin)` | True if an input pin of a type other than flow/state is already linked. | 1171 |
| `C:init(mgr, name, forceId)` | Initializes the graph: id, name, type 'graph', empty tables, variableStorage, view position and zoom. | 18 |
| `C:linkExists(startPin, endPin)` | True if a link already exists between these two pins. | 1162 |
| `C:moveNodeToGraph(node, newGraph)` | Moves a node to another graph, deleting its links. | 863 |
| `C:pinsCompatible(sourcePin, targetPin)` | Tests the type compatibility of two pins: 'any' accepts everything, 'state' pins link only to each other, table types must have the same tableType or 'generic'. | 1180 |
| `C:plan()` | Plans the execution (non-macro root graph): dependencies, flow roots, color propagation, node order, execution code generation. Called by the manager before starting or after a modification. | 266 |
| `C:printStructure()` | Prints the tree of graphs (only from a root). | 1390 |
| `C:resolveInterHops(rLinks, interInfo)` | Follows links through macro/integrated and macro/io nodes to create virtual links (virtualLink) between the real source and the real targets. | 192 |
| `C:setDirty(dirty, startFromRoot)` | Marks the graph (and its children of the same type) as modified; by default starting from the root. | 109 |
| `C:toString()` | Text 'name (id / type)'. | 1374 |
| `C:updateChildrenTypes(t, ignoreType)` | Applies a type to this graph and its descendants (stops at ignoreType). | 1256 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/graph.lua`.*
