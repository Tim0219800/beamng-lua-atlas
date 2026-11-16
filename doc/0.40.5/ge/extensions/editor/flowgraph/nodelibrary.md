# `editor_flowgraph_nodelibrary`

*File: `lua/ge/extensions/editor/flowgraph/nodelibrary.lua` · VM: Game Engine (GE) · 1411 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/nodelibrary")` (file under extensions/ but not a regular extension)

Node library ("Node library", fg_nodelib) of the Flowgraph editor, also used as the content of the "CreateNodeContentMenu" context menu (right click in the graph, dragging a link into empty space). It lists the available nodes (core_flowgraphManager.getAvailableNodeTemplates), macros, state templates and variables (Get/Set for the project and the graph), with fuzzy search (searchUtil + frecency shared in the flowgraph.general.nodeFrecency preference), pin filter when dragging a link (newNodeLinkPin), keyboard navigation and drag and drop. Also contains a CSV exporter of the node list.

## Notes

- Two display modes: static window (setStatic, drawContentAsTreeNodes/draw) and context menu (drawContent with usedForContextMenu).
- A node's score is the best of its name and its tags (tags weighted by 0.75); sorting puts frecency before score.
- 'hidden' nodes are always excluded; 'obsolete' nodes only if the flowgraph.general.showObsoleteNodes preference is false.
- Probable bugs: findFlowNodes and findVar pass a global variable `score` (nil); stateNodeScoringFunction uses `info` and `self` which do not exist in this local function (error if a state has a non-empty splitPath); the checkEmpty function overwrites dir.isEmpty = true before testing the subfolders; getFilterType iterates the typeOrder table which is empty (no prefix recognized); hasFoldersOnly only tests the first entry.
- printNodesWithTags writes nodeLib.csv and pinLib.csv (relative to the user folder): documentation tool for developers.

## Class `C`

Window class (windowName 'fg_nodelib', windowDescription 'Node library', arrowControllable = true). A static instance is created by flowgraphEditor (M.nodelib) and also serves the context menu.

| Method | Description | Line |
|---|---|---|
| `C._sortFunc(a, b)` | Sort comparator by name, case-insensitive. | 796 |
| `C:arrowHelper(cursor, itemSize, doHover, hoverFun)` | Counts the list items and draws the selection/hover frame with automatic scrolling. | 1271 |
| `C:checkEmpty(dir, mode)` | Recursively marks dir.isEmpty depending on whether a folder contains elements. | 837 |
| `C:clear()` | Clears the search field, re-filters nodes and macros and resets selection, focus and scrolling to zero. | 34 |
| `C:createNode()` | Requests creation of the selected node (Enter) or gives focus back to the search field if there is no button. | 127 |
| `C:createNodeFromButon(menuPos, node)` | Creates a node from a template at the given position, links it to the current pin and adds a history entry. (The function name contains the typo "Buton".) | 1214 |
| `C:createStateButton(menuPos, state)` | Creates a state from a template and links it. | 1177 |
| `C:createVariableButton(var, menuPos, read, fromMgr)` | Creates the getter/setter node corresponding to the variable (and links it to the current pin). | 981 |
| `C:displayDir(dir, menuPos, elementFieldName, elementFunction)` | Displays a folder as TreeNodes (subfolders then items). | 1054 |
| `C:displayMacro(macroName, macro, menuPos)` | Displays a macro with hover preview and creation of an instance on click. | 1008 |
| `C:displayNode(dir, menuPos, nodeName, node)` | Displays a node template (button, tooltip, preview, drag and drop). | 1194 |
| `C:displayResults(menuPos)` | Displays the sorted results (frecency then score): nodes, variables, states, macros. | 637 |
| `C:displaySimpleElement(menuPos, text, clickFun, ...)` | Displays a simple button with a text and a click function. | 1086 |
| `C:displayStateExitButton(menuPos, label)` | Displays the creation button of a "State Exit" node (with transition name). | 1114 |
| `C:displayStateTemplate(dir, menuPos, stateName, state)` | Displays a state template in the tree. | 1157 |
| `C:displayVariable(var, menuPos, read, fromMgr)` | Displays a variable (Get/Set) as a node creation button with drag and drop support. | 934 |
| `C:draw()` | Draws the "Node Library" window if visible (not the context menu). | 704 |
| `C:drawContent(menuPos, usedForContextMenu)` | Draws the full content (filter, search results or tree) for the window or the context menu. | 563 |
| `C:drawContentAsTreeNodes(menuPos)` | Window that shows all available nodes as a tree, with drag and drop. | 185 |
| `C:drawTextFilter(usedForContextMenu)` | Draws the "Search:" field, the clear button and, in the context menu, the Paste button. | 66 |
| `C:filterMacroTemplates(filterPins)` | Recomputes filteredMacro from mgr:getAvailableMacros(). | 901 |
| `C:filterMacros(dir, filterPins)` | Returns the macros (name/tag filters are disabled: everything passes). | 869 |
| `C:filterNodes(dir, filterPins, mode)` | Recursively filters a template folder (excludes hidden nodes; applies the pin filter in 'nodes' mode). | 798 |
| `C:filterTemplates(filterPins, mode)` | Recomputes filteredTemplates/filteredFolders for the requested mode (if the mode has changed) then marks the empty folders. | 907 |
| `C:findFlowNodes()` | Submits to the search all visible nodes that pass the pin filter, then the project and graph variables. | 435 |
| `C:findStateNodes()` | Submits to the search the state templates, "New State", "New Group State", "State Exit" (per transition) and the "Comment" node. | 495 |
| `C:findVar(source, sourceName, sourceNameTag)` | Submits to the search the "Get x" / "Set x" entries of each variable of a source. | 456 |
| `C:getFilterType()` | Extracts a type prefix from the search text (empty typeOrder table: in practice returns nil and the text). | 404 |
| `C:hasFoldersOnly(dir)` | Indicates whether a folder contains only subfolders (at the first element examined). | 46 |
| `C:highlightText(label, highlightText)` | Writes a label, highlighting the occurrences of the searched text. | 610 |
| `C:init()` | Initializes search, focus, list indices, registers the window (visible by default) and loads the shared frecency. | 16 |
| `C:linkState(node)` | Links a new state to the current link pin (input flow if the pin is an output, otherwise first output to this pin). | 1139 |
| `C:navigateList(up)` | Moves the keyboard selection (up/down) in the list. | 135 |
| `C:pinsFilter(node)` | Indicates whether a node template has a pin compatible with newNodeLinkPin (and is not the source node). | 720 |
| `C:printDir(dir, name, tagIndex, libtxt)` | Appends to libtxt one line per node of a folder (recursive) for the CSV export. | 1337 |
| `C:printNodesWithTags()` | Exports nodeLib.csv (Name, File, Path, Pin Schema, Todo, Description) and pinLib.csv (Pin, Count, Node, Desc). Developer tool. | 1308 |
| `C:ratePinSimilarity(a, b)` | Computes a.__matchScore for auto-connect: +1000 identical name, +300 identical type, +100 name included, -1150 if one is named 'reset'. Returns nothing. Used by uiAutoConnectShortcut. | 1035 |
| `C:recursiveGetTags(dir, list, pins)` | Recursively collects the tags and pins of all nodes for the export. | 1386 |
| `C:refreshMacro()` | Reloads the macro list if mgr.newMacroAdded is true. | 882 |
| `C:refreshStateTemplates()` | Reloads and sorts by name the list of state templates. | 889 |
| `C:setNewNodeLinkPin(newNodeLinkPin)` | Sets the pin a link is being dragged from: the list is then filtered to compatible nodes/variables. | 62 |
| `C:setStatic()` | Marks the instance as static (permanent window/menu). | 57 |
| `C:variablePinFilter(var, dir)` | Indicates whether a variable is compatible with the current link pin (identical type, 'any', or flow for output). | 386 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/nodelibrary.lua`.*
