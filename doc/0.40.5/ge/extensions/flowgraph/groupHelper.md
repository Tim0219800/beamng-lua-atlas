# `flowgraph_groupHelper`

*File: `lua/ge/extensions/flowgraph/groupHelper.lua` · VM: Game Engine (GE) · 500 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/groupHelper")` (file under extensions/ but not a regular extension)

Flowgraph editor helper for grouping and ungrouping selected nodes. For a flow graph, the group becomes a subgraph (or sub-macro) represented by a macro/integrated node; for a state graph, it becomes a group state. The file also contains functions to center nodes based on their position in the editor. The module returns a constructor: require('/lua/ge/extensions/flowgraph/groupHelper')(mgr).

## Notes

- Editor use only: relies on mgr.selectedNodes and ui_flowgraph_editor (GetNodeSize, GetNodePosition).
- A node of size 0x0 is treated as 200 x 100.
- Bug: ungroupSelection calls self:ungroupFlowNode(), which is defined nowhere in the file; ungrouping a flow node therefore raises a Lua error.
- groupFlowNodes returns the integrated node created.

## Class `C`

Object returned by the constructor; keeps the manager in self.mgr.

The module returns a constructor: `local obj = require("flowgraph_groupHelper")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:centerMultiNodes(fixNodes, moveNodes)` | Centers moveNodes on the center of the bounding rectangle of fixNodes. | 59 |
| `C:centerNodes(nodes, pos)` | Repositions a set of nodes around a position while keeping their relative positions (grid alignment). | 39 |
| `C:createGroupingFromSelection()` | Groups the selection: groupStateNodes in a state graph, otherwise groupFlowNodes. | 93 |
| `C:getRectCenter(nodes)` | Computes the bounding rectangle of the nodes and its center. | 13 |
| `C:groupFlowNodes()` | Clones the selection into a new subgraph or sub-macro, copies the graph's variables, recreates the internal links and replaces the selection with a macro/integrated node connected to the incoming and outgoing links. | 172 |
| `C:groupStateNodes()` | Moves the selected state nodes (except entry and exit) into a new 'new group' state graph and reconnects the incoming and outgoing links via the group node. | 101 |
| `C:init(mgr)` | Stores the manager. | 9 |
| `C:ungroupSelection()` | Ungroups the selection: ungroupStateNode in a state graph, otherwise ungroupFlowNode (nonexistent, see notes). | 415 |
| `C:ungroupStateNode()` | Moves the internal nodes (except entry/exit) of a selected group state up into the current graph and restores the links. | 423 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/groupHelper.lua`.*
