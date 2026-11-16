# `editor_flowgraph_overview`

*File: `lua/ge/extensions/editor/flowgraph/overview.lua` · VM: Game Engine (GE) · 304 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/overview")` (file under extensions/ but not a regular extension)

"Overview" window (fg_treeview) of the Flowgraph editor: tree of the project's graphs (and macros) with a text filter. The filter applies to the graph names, and to the node names if the flowgraph.debug.displayNodesInOverview preference is enabled. A context menu on a node offers Focus and Delete.

## Notes

- Only graphs whose name (or a parent's) passes the filter are drawn; otherwise only the current graph (mgr.graph) remains displayed (skipDrawing).
- In debug mode (flowgraph.debug.editorDebug), a "Print Graphs" button prints the structure of all graphs and macros to the console.
- Drawing of the root macros is commented out in the code: only mgr.graphs are displayed in the tree.

## Class `C`

Window class (windowName 'fg_treeview', windowDescription 'Overview').

| Method | Description | Line |
|---|---|---|
| `C:TreeView()` | Draws the window content: filter, debug button, sorted list of root graphs. | 210 |
| `C:attach(mgr)` | Stores the current manager. | 21 |
| `C:draw()` | Draws the window if it is visible (calls TreeView). | 289 |
| `C:drawGraph(graph)` | Draws a graph of the tree (and recursively its children). | 79 |
| `C:drawPopups()` | Draws the "nodeOverviewPopup" popup: Focus (selects the node and navigates to it) and Delete (graph:deleteNode). | 25 |
| `C:fillPassedGraphsArray()` | Fills self.passedGraphIds with the ids of the graphs and macros whose name (or a node, depending on the preference) passes the filter. | 175 |
| `C:init()` | Creates the text filter and registers the window (150x300, hidden by default). | 15 |
| `C:selectNode(node, append)` | Selects a node in the editor (fge.SelectNode). | 299 |
| `C:skipDrawing(graph)` | Indicates whether a graph must be hidden: false if it (or one of its parents) passes the filter, otherwise true except for the current graph. | 47 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/overview.lua`.*
