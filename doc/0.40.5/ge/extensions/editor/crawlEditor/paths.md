# `editor_crawlEditor_paths`

*File: `lua/ge/extensions/editor/crawlEditor/paths.lua` · VM: Game Engine (GE) · 833 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/paths")` (file under extensions/ but not a regular extension)

"Paths" subtool of the crawl editor: edits paths (table {name, description, nodes}) made of nodes (pathnodes) {name, pos, rotation, radius, flags}. The module returns a constructor: require('editor_crawlEditor_paths')(crawlEditor) creates an instance C. The tool lists the paths, shows the detail (name, file name, description, node count, length, cumulative elevation change), lets you add, insert, move (gizmo) or delete nodes, orient them, renumber, snap to terrain, reverse the path, set a common radius and validate the path. It also draws the nodes in the world (spheres, direction arrows, labels, cumulative distances).

## Example

```lua
local paths = require('editor_crawlEditor_paths')(crawlEditorInstance)
paths:setPath(myPath)
-- every frame:
paths:draw(mouseInfo)
paths:drawPathnodeSelectionIndicators(mouseInfo)
```

## Notes

- Mouse controls: Shift + click = adds a node where clicked (snapped to terrain if snapToTerrain); Alt + click on the middle of a segment = inserts a node between its two ends (in detection, the last segment links the last node to the first); click = selects a node; click in empty space = deselects.
- New node (getNewPathnode): name "Node N", pos (0,0,0), identity rotation, radius 4.0, empty flags.
- Node flags used by the tool: isRecoveryCheckpoint (green sphere) and isBonusCheckpoint (gold sphere); the other flags are editable as JSON.
- In dragging(), the gizmo translation offset is divided by 2 (posOffset = delta / 2), code behavior; in rotation mode, the node rotation is that of the gizmo.
- dropToTerrain returns (pos, true) as soon as core_terrain exists, even if the height is nil (z kept); otherwise (pos, false).
- validatePath reports: fewer than 2 nodes, zero or negative radius, node at (0,0,0), missing rotation, segment shorter than 0.5 m.
- Any change marks the path as modified (path._dirty = true). Gizmo moves go through editor.history ("Manipulate Pathnode"); other operations (add, renumber, reverse...) are not undoable.
- In drawPathsList, setting selection.index to zero when the same path is clicked again is immediately overwritten (selection.index = i afterwards).

## Class `C`

Instance of the paths tool. Main fields: crawlEditor, path (path being edited), selectedPathnodeIndex (-1 = none), currentPathnode, snapToTerrain (true by default), _isDragging.

The module returns a constructor: `local obj = require("editor_crawlEditor_paths")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addNodeAtCamera()` | Adds a node 15 m in front of the camera, placed on the terrain (if snapToTerrain), and selects it. | 588 |
| `C:autoOrientNodes()` | Orients each node (quatFromDir, up +Z) toward the next; the last keeps the incoming direction. Ignores segments of length <= 0.001. No effect with fewer than 2 nodes. | 614 |
| `C:beginDrag()` | Start of gizmo manipulation: stores the node's position and rotation. | 545 |
| `C:dragging()` | During manipulation: translates (with terrain snap) or rotates the node according to the gizmo. | 554 |
| `C:draw(mouseInfo)` | Called every frame: handles the axis gizmo if a node is selected, processes mouse input and updates the gizmo outside manipulation. | 720 |
| `C:drawPathDetail(path)` | Draws the detail of a path: Goto, name, file name (Rename), description, statistics (nodes, length, elevation change), tool buttons (Add Node, Add Node At Camera, Reverse Order, Auto-Orient Nodes, Renumber, Snap All To Terrain, Set All Radii, Validate Path), node list with Delete and the selected node editor (name, position, rotation, radius, recovery/bonus flags, JSON flags). | 140 |
| `C:drawPathnodeSelectionIndicators(mouseInfo)` | Draws in the world the nodes (sphere of their radius: orange selected, green recovery, gold bonus, white otherwise), direction arrows, labels "name (index) [RECOVERY/BONUS]", prisms between nodes and cumulative distance. | 740 |
| `C:drawPathsList(allPaths, selection)` | Draws the list of paths with "Add Path" and a "Delete" context menu. Fills selection.index and selection.clicked. | 101 |
| `C:dropToTerrain(pos)` | Places a point at the terrain height. | 578 |
| `C:endDragging()` | End of manipulation: re-snaps to the terrain on translation, records "Manipulate Pathnode" in the history, marks the path as modified. | 698 |
| `C:findPathnode(mouseInfo, objects)` | Draws spheres on the elements (orange if selected) and returns the one closest to the camera whose mouse ray crosses the sphere. | 427 |
| `C:getNewPath()` | Creates an empty path table: name "New Path", description "A new path", empty nodes. | 401 |
| `C:getNewPathnode()` | Creates a default node and adds it at the end of the current path (creates a path if none). | 410 |
| `C:getSelectedPathnodeIndex()` | Returns the index of the selected node. | 93 |
| `C:init(crawlEditorParam)` | Initializes the instance (called by the constructor). | 60 |
| `C:input(mouseInfo)` | Processes mouse input: Shift = add, Alt = insertion, otherwise node selection. | 492 |
| `C:renumberNodes()` | Renames all nodes "Node N" in order. | 645 |
| `C:reversePathOrder()` | Reverses the order of the nodes and deselects. | 603 |
| `C:selectPathnode(index)` | Selects the node with the given index (1-based); an invalid index, nil or <= 0 deselects. | 84 |
| `C:setAllRadii(radius)` | Applies the same radius to all nodes. | 636 |
| `C:setFields(path)` | Copies the path's name, file name and description into the imgui input buffers. | 73 |
| `C:setPath(pathParam)` | Sets the path being edited. | 80 |
| `C:setSelectedPathnodeIndex(index)` | Alias of selectPathnode. | 97 |
| `C:snapAllToTerrain()` | Places all nodes on the terrain. | 654 |
| `C:tryInsert(mouseInfo)` | Detects a click on the middle of a segment and inserts a new node there, which it selects. | 459 |
| `C:updateTransform()` | Places the axis gizmo on the position and rotation of the selected node. | 535 |
| `C:validatePath()` | Analyzes the path and returns the list of problems found (see notes). | 665 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/paths.lua`.*
