# `editor_flowgraph_references`

*File: `lua/ge/extensions/editor/flowgraph/references.lua` · VM: Game Engine (GE) · 615 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/references")` (file under extensions/ but not a regular extension)

"References" window (fg_references) of the Flowgraph editor: usage statistics of node types. On clicking "Load Data", it lists all node templates (core_flowgraphManager.getAvailableNodeTemplates), then counts their occurrences in all *.flow.json files of /levels/, /gameplay/ and /lua/ge/extensions/flowgraph/examples, plus in the current project (placeholder "CurrentLocalFile"). Two views: filterable list (All / Current / unused) and node detail (pins, projects that use it).

## Notes

- Loading the data reads all of the game's flowgraph files: can be slow.
- A node found in a project but without a template is classified in the 'OBSOLETE' category.
- addPinsAndBehavioursForCategory reproduces the basenode logic for pins created at runtime (flow, incomplete/complete/completed, reset).
- Probable bugs: draw tests `self.nodeTable == {}` (always false in Lua); updateNodeOccurrence creates the OBSOLETE branch with the literal key `filename` instead of the file name; in the f_duration case, the existence test of the 'completed' pin checks 'flow'; showNodeReferences of flowgraphEditor calls winReferences:searchFor which does not exist in this window.

## Class `C`

Window class (windowName 'fg_references', windowDescription 'References'). Main data: nodeTable (by node name: displayName, amount, pins {inPins,outPins}, category, behaviour, amountForProjects), nodeStatistics, filteredNodes, sortedProjects, sortedCategories, viewMode (1 list, 2 detail).

| Method | Description | Line |
|---|---|---|
| `C:addPinsAndBehavioursForCategory(nodeName, category)` | Adds to the nodeTable entry the pins and behaviors (simple, duration, once) that are only created at runtime depending on the node's category. | 232 |
| `C:checkFilesForNodes(initialCheck)` | Recomputes the occurrences of each node in the .flow.json files and in the current project, then re-filters and re-sorts. | 82 |
| `C:createNodeTable()` | Builds nodeTable from the available node templates then counts the usages (checkFilesForNodes(true)). | 35 |
| `C:draw()` | Draws the window: "Load Data" button while nodeTable is empty, otherwise navigation arrows and view 1 or 2. | 343 |
| `C:drawViewMode1()` | List view: search field, filter mode combo, statistics and node list. | 376 |
| `C:drawViewMode2()` | Detail view of the inspected node: pins and projects that use it. | 497 |
| `C:fillNodeTable(flowgraphDirectory)` | Reads each flowgraph file of the list and updates the occurrences of its nodes. | 131 |
| `C:filterNodes()` | Builds filteredNodes according to the typed text and the filter mode (All, Current, unused), sorted by decreasing number of usages. | 179 |
| `C:findNodesRecursive(nodeDirectory)` | Recursively walks the node folder tree and creates one nodeTable entry per node (in/out pins from the pinSchema, category, behaviors) while updating the per-category statistics. | 47 |
| `C:highlightText(label, highlightText)` | Writes a label, highlighting the occurrences of the searched text (copy from nodelibrary). | 294 |
| `C:init()` | Registers the window and initializes the tables, the view mode (1) and the filter (All). | 21 |
| `C:pinExists(nodeName, direction, pinName)` | Indicates whether a pin of this name already exists in the node's entry. | 278 |
| `C:sortCategories()` | Sorts the categories by decreasing number of node types in self.sortedCategories. | 116 |
| `C:sortProjects()` | Sorts the projects using the inspected node by decreasing number of occurrences in self.sortedProjects. | 326 |
| `C:updateNodeOccurrence(nodeName, fileName)` | Increments the usage counters of a node (total, per project, per category); creates an 'OBSOLETE' entry if the node is unknown. | 146 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/references.lua`.*
