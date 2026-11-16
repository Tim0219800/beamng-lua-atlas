# `editor_raceEditor_pathnodes`

*File: `lua/ge/extensions/editor/raceEditor/pathnodes.lua` · VM: Game Engine (GE) · 793 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/pathnodes")` (file under extensions/ but not a regular extension)

"Pathnodes" sub-window of the race editor (raceEditor): edits the path nodes (path.pathnodes) of the current path. You can create a manual node (Shift + drag: position, radius and direction), add a node from the navgraph (Alt + click), select, move (gizmo or "simple drag" if the raceEditor.general.useSimpleDrag preference is active), delete, reorder, toggle manual/navgraph mode, and set position, radius, normal, marker visibility, "Use as Split", forward/reverse recovery positions and custom fields. All changes go through editor.history (undo/redo). The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/pathnodes')(raceEditor).

## Notes

- Manual creation: if a previous node exists, a segment is automatically created between the last sorted node and the new one; the AI route is recomputed (editor_raceEditor.calculateAiRoute).
- The normal is only created at creation time if the raceEditor.general.directionalNodes preference is true.
- In navgraph mode, the gizmo does not move the node (message "Set node to manual to move via Gizmo."); scaling acts on navRadiusScale instead of radius.
- In autoRecoverPos, the "redo" function uses the local variable node captured when the action was created (not data) for the position name.
- C:onEditModeActivate tests self.node, a field never set in this file: reselection therefore never happens.
- Shortcuts: Shift = add a manual node, Alt = add a navgraph node.

## Class `C`

Pathnodes window (windowDescription = 'Pathnodes'). Instantiated by the module constructor with init(raceEditor). raceEditor.lua calls setPath, selected, unselect, draw and onEditModeActivate.

The module returns a constructor: `local obj = require("editor_raceEditor_pathnodes")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:autoRecoverPos(reverse)` | Automatically creates a "recovery" group start position at the node's location (direction reversed if reverse) and assigns it to the node's recovery or reverseRecovery field. | 725 |
| `C:beginDrag()` | Start of gizmo manipulation: stores the serialized state, rotation and radius of the node. | 80 |
| `C:createManualPathnode()` | Displays the help and the preview (sphere, direction prisms) during the drag, then on release creates a manual node (and a segment from the last node) via history. | 271 |
| `C:dragging()` | During manipulation: applies translation (manual mode only), normal rotation (if the node has one) or radius scaling. | 94 |
| `C:draw(mouseInfo)` | Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the node panel. | 262 |
| `C:drawCustomFields(fields)` | Draws the custom fields editor and the Copy Fields / Paste Fields buttons (copies into self.cfData). | 705 |
| `C:drawPathnodeList()` | Draws the node list (prefix "*" if useAsSplit, parentheses if not visible) and the current node panel: delete, move in the list, name, mode, position/radius, normal, visibility, split, recovery positions. | 461 |
| `C:endDragging()` | End of manipulation: commits the history action with the node's before/after state. | 147 |
| `C:handleMouseDown(hovered)` | Simple drag mode: on click, allows dragging if the already selected node is clicked, otherwise selects the hovered node or deselects. | 173 |
| `C:handleMouseHold()` | Simple drag mode: while held, computes the position projected onto the ground by static raycast (forest disabled in collision) and draws a sphere and the node name. | 224 |
| `C:handleMouseUp()` | Simple drag mode: on release, commits the "Manipulated Node via Simple Drag" action with the new position. | 234 |
| `C:init(raceEditor)` | Stores raceEditor, selection index nil, empty mouseInfo and creates a custom fields utility (customFieldsUtil). | 18 |
| `C:input()` | Handles the mouse: Alt = navgraph node, Shift = manual creation, otherwise selection (single click, or simple drag depending on the preference). | 416 |
| `C:mouseOverPathnodes()` | Returns the node whose sphere (radius radius) is crossed by the mouse ray, the one closest to the camera. | 399 |
| `C:onEditModeActivate()` | Called when the edit mode is activated (see notes: ineffective). | 256 |
| `C:selectNavgraphNode()` | Alt mode: hovers the navgraph's manual waypoints (map.getManualWaypoints) and lets you add one as a pathnode. | 331 |
| `C:selectPathnode(id)` | Selects the node with ID id (nil for none): highlights that node, places the gizmo, loads the name and custom fields. | 47 |
| `C:selected()` | Called when the tab becomes active: deselects, sets all nodes to "normal" drawing, adds the Shift shortcut "Add New" and fetches the map (map.getMap()). | 29 |
| `C:selectedPathnode()` | Returns the selected node if it exists and is not missing. | 166 |
| `C:selector(name, fieldName, clrI, tt)` | Dropdown to choose a start position (or "None" = -1) in a node field, with a name preview in the world and an "Auto-Place" button if the field is empty and the node has a normal. | 747 |
| `C:setPath(path)` | Sets the race path being edited. | 25 |
| `C:unselect()` | Called when the tab is left: nodes switch to "faded" drawing and the Shift shortcut is removed. | 39 |
| `C:updateTransform(index)` | Places the axis gizmo on the node (oriented along its normal in local alignment if the node has one). No effect if the gizmo is not allowed. | 60 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/pathnodes.lua`.*
