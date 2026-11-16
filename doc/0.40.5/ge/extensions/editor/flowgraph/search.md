# `editor_flowgraph_search`

*File: `lua/ge/extensions/editor/flowgraph/search.lua` · VM: Game Engine (GE) · 336 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/search")` (file under extensions/ but not a regular extension)

"Search" window (fg_search) of the Flowgraph editor: fuzzy search in the current project for nodes, graphs and pins, via editor/util/searchUtil with a "frecency" score stored in mgr.frecency. The prefix 'node:', 'graph:' or 'pin:' restricts the result type. A click (or Enter via the NodeLibrary action map) selects the graph and node and recenters the view. Opened by the uiFindShortcut shortcut of flowgraphEditor.

## Notes

- The results are cached per manager (searchResultsByMgr[mgr.id]) and only recomputed when the text changes (searchChanged).
- Keyboard navigation: handleActionMap pushes the 'NodeLibrary' action map when the window has focus, and fgEditor.arrowControllableWindow points to it.
- Inconsistencies: findGraphs references a nonexistent global variable `score` (nil); the `match` parameter of findNodes/findGraphs is not used; the sortFun sort function compares typeOrder when the types are identical (so always equal), the actual sort falls back to the score; a pin's info text contains an extra quote ("''").

## Class `C`

Window class (windowName 'fg_search', windowDescription 'Search', arrowControllable = true).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization hook: empty. | 301 |
| `C:_onSerialize(data)` | Serialization hook: empty. | 297 |
| `C:arrowHelper(cursor, itemSize, doHover)` | Counts the buttons of the list, draws the frame of the selected/hovered item and scrolls to keep it visible. | 305 |
| `C:attach(mgr)` | Stores the manager, forces a new search and creates the manager's result table. | 13 |
| `C:createNode()` | Called by the editor when the user validates (Enter): requests a click on the selected entry at the next draw. | 27 |
| `C:displayResults()` | Displays the result list (type, highlighted name, location, score in debug mode) or "No Results!". | 184 |
| `C:draw()` | Draws the "Search" window if it is visible. | 264 |
| `C:drawSearchInput()` | Draws the "Find:" field, the X button and the help icon (node:/graph:/pin: syntax). | 42 |
| `C:findGraphs(match)` | Submits to the search each graph of type 'graph' of the manager. | 97 |
| `C:findNodes(match)` | Submits to the search each node of the manager (mgr:allNodes()) and each of their pins, with their location and a frecency identifier. | 70 |
| `C:findStuff()` | If the text has changed, re-runs the full search (nodes + graphs) and stores the results for the current manager. | 126 |
| `C:getFilterType()` | Extracts the type prefix ('node', 'graph', 'pin') from the typed text. | 170 |
| `C:handleActionMap()` | When the window has focus, pushes the 'NodeLibrary' action map and registers itself as the arrow-controllable window. | 282 |
| `C:highlightText(label, highlightText)` | Writes a label, coloring (orange) up to 6 occurrences of the searched text, case-insensitive. | 144 |
| `C:init()` | Registers the window, creates the text field (128 chars) and the searchUtil search object. | 20 |
| `C:manageClick(result)` | Handles the click on a result: updates the frecency, selects the graph, deselects everything then selects the node/graph and requests recentering (focusSelection/focusContent). | 235 |
| `C:navigateList(up)` | Moves the keyboard selection in the result list. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/search.lua`.*
