# `editor_crawlEditor_waypoints`

*File: `lua/ge/extensions/editor/crawlEditor/waypoints.lua` · VM: Game Engine (GE) · 636 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/waypoints")` (file under extensions/ but not a regular extension)

"Pathnodes" (waypoints) subtool of the Crawl editor. The module returns a class constructor C. It edits the nodes of a path (path.pathnodes, path.segments): mouse selection, manual creation (Shift+click), moving/rotating the normal/scaling the radius with the axis gizmo, and custom fields. It draws the nodes, the segments linking the sorted nodes and a selection text. All modifications go through editor.history (undo/redo).

## Notes

- In selectPathnode, setSelectedPathnodeIndex and selectedPathnode, "index" is the node id (key of path.pathnodes.objects), not its position in the sorted list.
- Shift held: manual node creation mode (default radius 5.0, linked by a segment to the last sorted node if one exists).
- The gizmo scale only changes the node's radius (negative value brought back to 0).
- The gizmo is only used if crawlEditor.allowGizmo() returns a true value.
- A status text is drawn on screen at (10, 10, 0): "Selected Pathnode: <name> <id>" or "No pathnode selected".

## Class `C`

Tool instance. Fields: crawlEditor (parent editor), path (edited path), index (id of the selected node, -1 by default), mouseInfo (last mouse info), fields (ImGui buffers of the custom fields).

The module returns a constructor: `local obj = require("editor_crawlEditor_waypoints")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of gizmo manipulation: stores the serialized state, rotation and radius of the node. | 86 |
| `C:createManualPathnode()` | Displays "Add manual Pathnode (Click to place)" at the targeted point; on click, creates (undoable) a node at the raycast point, radius 5.0, name "Pathnode", and a segment from the last sorted node. | 179 |
| `C:dragging()` | During manipulation: translation (gizmo position), rotation (new normal, if the node has one) or scale (radius). | 97 |
| `C:draw(mouseInfo)` | Called every frame: stores mouseInfo and, if the gizmo is allowed, updates the gizmo and processes input. | 328 |
| `C:drawCustomFields(fields)` | Draws the custom fields editor of a node (names/types/values tables; string type edited via a 4096-character field). Creates the tables if absent. | 546 |
| `C:drawPathnodeDetail(pathnode, index)` | Draws the detail panel of a node (name, position, radius, normal, custom fields...) with undo history. | 461 |
| `C:drawPathnodeList(trail)` | Draws the trail's node list with the "Add Pathnode" button (creates a node at the camera position, radius 5.0). | 366 |
| `C:drawPathnodeSegments()` | Draws a prism between each pair of consecutive sorted nodes with the label "Segment from-to"; more opaque in "Edit Pathnodes" mode. | 278 |
| `C:drawPathnodeSelectionIndicators()` | Draws all nodes (highlight, normal or faded mode depending on the selection and the "Edit Pathnodes" edit mode), the segments and the status text. | 247 |
| `C:endDragging()` | End of manipulation: records the "Manipulated Pathnode via Gizmo" action in the history with the old and new state. | 139 |
| `C:getSelectedPathnodeIndex()` | Returns the id of the selected node. | 538 |
| `C:handleMouseDown(hovered)` | Click: selects the hovered node, or deselects if the gizmo is not clicked. | 167 |
| `C:init(crawlEditorParam)` | Constructor: stores the parent Crawl editor and initializes selection, fields and drag data. | 33 |
| `C:input()` | Processes input: indicators, manual creation with Shift, hover and selection on click. Does nothing if mouseInfo.valid is false. | 336 |
| `C:mouseOverPathnodes()` | Looks for the node closest to the camera whose distance to the mouse ray is ≤ 1.0 m. | 222 |
| `C:selectPathnode(id)` | Selects the node with the given id: updates the drawing mode (highlight/normal) of the nodes, places the gizmo on it and clears the custom fields. Does nothing if id is nil. | 48 |
| `C:selectedPathnode()` | Returns the selected node, or nil if there is none or if it is marked missing. | 159 |
| `C:setPath(pathParam)` | Sets the path whose nodes are being edited. | 44 |
| `C:setSelectedPathnodeIndex(indexParam)` | Sets the selected id without updating the gizmo or the drawing (unlike selectPathnode). | 542 |
| `C:updateTransform(index)` | Places the gizmo on the node position (oriented according to its normal in local alignment). No effect if the gizmo is not allowed. | 65 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/waypoints.lua`.*
