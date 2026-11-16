---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graph object returned by the constructor.
---@class flowgraph_graph
local flowgraph_graph = {}

--- Called when the project starts: notifies each node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:1266
function flowgraph_graph:_executionStarted() end

--- Called when the project stops: notifies the nodes and the variableStorage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:1281
function flowgraph_graph:_executionStopped() end

--- Notifies the nodes and the variableStorage of a clear.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:1274
function flowgraph_graph:_onClear() end

--- Rebuilds the graph (nodes sorted by id, links, variables) from the serialized data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:1031
---@param data table data
function flowgraph_graph:_onDeserialized(data) end

--- Serializes the graph (name, nodes, ordered links, type, variables, view, parentId...). Returns the table and the smallest id used.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:952
---@return table  data
---@return integer  smallest id
function flowgraph_graph:_onSerialize() end

--- Recursively prints the tree of graphs with indentation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:1378
---@param depth integer depth
function flowgraph_graph:_printStructure(depth) end

--- True if a link can be created between a and b (opposite directions, different nodes, compatible types, no existing link, equal names if matchName).
---Source: lua/ge/extensions/flowgraph/graph.lua:1229
---@param a table pin
---@param b table pin
---@param newLinkInfo table|nil authorization info per node
---@return boolean  allowed
function flowgraph_graph:canCreateLink(a, b, newLinkInfo) end

--- Deletes the child graphs, destroys the nodes and clears nodes, links, pins.
---Source: lua/ge/extensions/flowgraph/graph.lua:789
function flowgraph_graph:clear() end

--- Clears the pending variable changes of this graph and its descendants.
---Source: lua/ge/extensions/flowgraph/graph.lua:77
function flowgraph_graph:clearVariableChangesChildren() end

--- Creates a link between an output pin and an input pin (after removing the hardcoded value from the target pin).
---Source: lua/ge/extensions/flowgraph/graph.lua:913
---@param startPin table source pin
---@param endPin table target pin
---@param ... any additional arguments
---@return table  link
function flowgraph_graph:createLink(startPin, endPin, ...) end

--- Creates a node of a given type (e.g. 'events/onUpdate') from the manager's templates. Logs an error and returns nil if the type is unknown. Marks obsolete nodes in their name.
---Source: lua/ge/extensions/flowgraph/graph.lua:818
---@param nodeType string node type path
---@param forceId integer|nil imposed id
---@param ... any arguments passed to the node constructor
---@return table|nil  created node
function flowgraph_graph:createNode(nodeType, forceId, ...) end

--- Deletes a link: updates pinIn / _mInFlow of the target, notifies pins and nodes, schedules the deletion on the editor side.
---Source: lua/ge/extensions/flowgraph/graph.lua:919
---@param link table link
function flowgraph_graph:deleteLink(link) end

--- Deletes a node and its links (except undeleteable nodes outside debug mode; a node that represents a graph deletes that graph, unless ignoreIntegratedNodes).
---Source: lua/ge/extensions/flowgraph/graph.lua:874
---@param node table node
---@param ignoreIntegratedNodes boolean|nil do not delete the represented graph
function flowgraph_graph:deleteNode(node, ignoreIntegratedNodes) end

--- Alias of findNodeRecursive.
---Source: lua/ge/extensions/flowgraph/graph.lua:1347
---@param id integer node id
---@return table|nil  node
function flowgraph_graph:findNodeInChildren(id) end

--- Looks for a node by id in this graph then in its children.
---Source: lua/ge/extensions/flowgraph/graph.lua:1350
---@param id integer node id
---@return table|nil  node
function flowgraph_graph:findNodeRecursive(id) end

--- Returns the pin with the given id.
---Source: lua/ge/extensions/flowgraph/graph.lua:1249
---@param pinId integer|nil id
---@return table|nil  pin
function flowgraph_graph:findPin(pinId) end

--- Forces the update of the editor position of all nodes (recursive).
---Source: lua/ge/extensions/flowgraph/graph.lua:1365
function flowgraph_graph:forceRecursiveNodeUpdatePosition() end

--- Adds to rNodes and rLinks the nodes and links of this graph and its children, and fills interInfo for macro/integrated nodes.
---Source: lua/ge/extensions/flowgraph/graph.lua:127
---@param rNodes table[] list of nodes to fill
---@param rLinks table[] list of links to fill
---@param interInfo table integration info per node
function flowgraph_graph:gatherNodesAndLinks(rNodes, rLinks, interInfo) end

--- Returns the sequence of indices of this graph among the children from the root of the instance.
---Source: lua/ge/extensions/flowgraph/graph.lua:1315
---@return integer[]  indices
function flowgraph_graph:getChildPosition() end

--- Returns the child graphs (parentId == id), sorted by id.
---Source: lua/ge/extensions/flowgraph/graph.lua:65
---@return table[]  children
function flowgraph_graph:getChildren() end

--- Children of the graph, plus (for a state graph) the non-state graphs represented by its nodes.
---Source: lua/ge/extensions/flowgraph/graph.lua:1427
---@return table[]  children
function flowgraph_graph:getChildrenWithStates() end

--- Descends into the children according to indices (see notes: uses a nonexistent children field).
---Source: lua/ge/extensions/flowgraph/graph.lua:1326
---@param indexes integer[] indices
---@return table|nil  graph
function flowgraph_graph:getDeepChild(indexes) end

--- Collects the ids of 'dirty' macros used by child instances.
---Source: lua/ge/extensions/flowgraph/graph.lua:92
---@param dirtyChildren table<integer, boolean>|nil table to fill
---@return table<integer, boolean>  ids of macros to update
function flowgraph_graph:getDirtyChildren(dirtyChildren) end

--- Returns the root of the instance (first ancestor with macroID).
---Source: lua/ge/extensions/flowgraph/graph.lua:1304
---@return table  graph
function flowgraph_graph:getInstanceRoot() end

--- Returns the path of the graph from the root (names, or ids if withIds), parent states included.
---Source: lua/ge/extensions/flowgraph/graph.lua:1472
---@param withIds boolean|nil also return the ids
function flowgraph_graph:getLocation(withIds) end

--- For a graph of type 'instance', returns the corresponding original macro graph.
---Source: lua/ge/extensions/flowgraph/graph.lua:1290
---@return table|nil  macro
function flowgraph_graph:getMacro() end

--- Returns the parent graph.
---Source: lua/ge/extensions/flowgraph/graph.lua:58
---@return table|nil  parent graph
function flowgraph_graph:getParent() end

--- Like getParent, but if the graph has no parent, returns the state graph in which a node represents this graph.
---Source: lua/ge/extensions/flowgraph/graph.lua:1405
---@return table|nil  parent
function flowgraph_graph:getParentWithStates() end

--- Recursively collects the nodes (for their hooks) and the extension dependencies declared by the nodes.
---Source: lua/ge/extensions/flowgraph/graph.lua:1334
---@param hooks table[] list of nodes to fill
---@param deps table<string, boolean> dependencies to fill
---@return table[]  nodes
---@return table<string, boolean>  dependencies
function flowgraph_graph:getRecursiveHooksAndDependencies(hooks, deps) end

--- Goes up to the root graph.
---Source: lua/ge/extensions/flowgraph/graph.lua:84
---@return table  root
function flowgraph_graph:getRootGraph() end

--- Returns the sibling graphs (same parent, states included); prints the parent's name (see notes).
---Source: lua/ge/extensions/flowgraph/graph.lua:1441
---@return table[]  siblings
function flowgraph_graph:getSiblings() end

--- True if an input pin of a type other than flow/state is already linked.
---Source: lua/ge/extensions/flowgraph/graph.lua:1171
---@param pin table pin
---@return boolean  linked
function flowgraph_graph:hasLink(pin) end

--- Initializes the graph: id, name, type 'graph', empty tables, variableStorage, view position and zoom.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:18
---@param mgr table manager
---@param name string|nil name (default 'Graph <id>')
---@param forceId integer|nil forced id (deserialization)
function flowgraph_graph:init(mgr, name, forceId) end

--- True if a link already exists between these two pins.
---Source: lua/ge/extensions/flowgraph/graph.lua:1162
---@param startPin table source pin
---@param endPin table target pin
---@return boolean  exists
function flowgraph_graph:linkExists(startPin, endPin) end

--- Moves a node to another graph, deleting its links.
---Source: lua/ge/extensions/flowgraph/graph.lua:863
---@param node table node
---@param newGraph table destination graph
function flowgraph_graph:moveNodeToGraph(node, newGraph) end

--- Tests the type compatibility of two pins: 'any' accepts everything, 'state' pins link only to each other, table types must have the same tableType or 'generic'.
---Source: lua/ge/extensions/flowgraph/graph.lua:1180
---@param sourcePin table pin
---@param targetPin table pin
---@return boolean|nil  compatible
function flowgraph_graph:pinsCompatible(sourcePin, targetPin) end

--- Plans the execution (non-macro root graph): dependencies, flow roots, color propagation, node order, execution code generation. Called by the manager before starting or after a modification.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/graph.lua:266
function flowgraph_graph:plan() end

--- Prints the tree of graphs (only from a root).
---Source: lua/ge/extensions/flowgraph/graph.lua:1390
function flowgraph_graph:printStructure() end

--- Follows links through macro/integrated and macro/io nodes to create virtual links (virtualLink) between the real source and the real targets.
---Source: lua/ge/extensions/flowgraph/graph.lua:192
---@param rLinks table[] list of links to complete
---@param interInfo table integration info
function flowgraph_graph:resolveInterHops(rLinks, interInfo) end

--- Marks the graph (and its children of the same type) as modified; by default starting from the root.
---Source: lua/ge/extensions/flowgraph/graph.lua:109
---@param dirty boolean state
---@param startFromRoot boolean|nil default true
function flowgraph_graph:setDirty(dirty, startFromRoot) end

--- Text 'name (id / type)'.
---Source: lua/ge/extensions/flowgraph/graph.lua:1374
---@return string  description
function flowgraph_graph:toString() end

--- Applies a type to this graph and its descendants (stops at ignoreType).
---Source: lua/ge/extensions/flowgraph/graph.lua:1256
---@param t string new type
---@param ignoreType string|nil type not to traverse
function flowgraph_graph:updateChildrenTypes(t, ignoreType) end

