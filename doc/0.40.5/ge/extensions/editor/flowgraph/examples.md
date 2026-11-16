# `editor_flowgraph_examples`

*File: `lua/ge/extensions/editor/flowgraph/examples.lua` · VM: Game Engine (GE) · 337 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/examples")` (file under extensions/ but not a regular extension)

"Examples" window (fg_examples) of the Flowgraph editor. It loads (once, cached) all *flow.json files from the /lua/ge/extensions/flowgraph/examples/ folder, arranges them in a tree by subfolder (beginner, intermediate, expert, nodes first), offers a search and, on clicking an example, opens a new flowgraph project created from its data (without a saved file name). Arrow-key navigation is possible via the "NodeLibrary" action map.

## Notes

- Examples are sorted by exampleOrder (10^10 by default); the description comes from the description field of the .flow.json.
- The examplesLookup cache is shared at module level: it is not reloaded while the game is running.
- findExamples references examplesLookup, which must already have been loaded by loadExamples.

## Class `C`

Examples window class (windowName = 'fg_examples', arrowControllable = true).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization (empty). | 302 |
| `C:_onSerialize(data)` | Serialization (empty). | 298 |
| `C:arrowHelper(cursor, itemSize, doHover)` | Counts the item in the navigable list and draws the keyboard selection frame. | 306 |
| `C:attach(mgr)` | Associates the manager and resets the search. | 13 |
| `C:createNode()` | Requests validation of the selected item at the next display (doClick). | 76 |
| `C:displayResults()` | Displays the search results (or "No Results!"). | 178 |
| `C:displayTreeView()` | Displays the full tree of examples. | 235 |
| `C:draw()` | Draws the Examples window (search or tree). | 214 |
| `C:drawSearchInput()` | Draws the "Find" field, the clear button and the help. | 91 |
| `C:findExamples(match)` | Submits each example to the search utility. | 119 |
| `C:findStuff()` | Re-runs the search if the text has changed and fills self.results. | 133 |
| `C:getExamplesLookup()` | Returns the tree and the flat table (via loadExamples). | 72 |
| `C:handleActionMap()` | When the window has focus, pushes the "NodeLibrary" action map for arrow-key navigation. | 283 |
| `C:highlightText(label, highlightText)` | Displays a label, highlighting in orange the occurrences of the searched text. | 147 |
| `C:init()` | Registers the window, creates the search utility and loads the examples. | 20 |
| `C:loadExamples()` | Walks FS:findFiles over the example .flow.json files, builds the tree (res) and the flat table (lookup) with their JSON content, then caches them. | 30 |
| `C:manageClick(result)` | If the item is clicked (or validated by keyboard), creates a manager via core_flowgraphManager.addManager and makes it active in the editor. | 205 |
| `C:navigateList(up)` | Moves the keyboard selection in the list. | 80 |
| `C:recursiveTreeView(element, depth)` | Recursively displays a tree node: sorted examples then subfolders. | 242 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/examples.lua`.*
