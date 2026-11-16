# `editor_raceEditor_pacenotes`

*File: `lua/ge/extensions/editor/raceEditor/pacenotes.lua` · VM: Game Engine (GE) · 433 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/pacenotes")` (file under extensions/ but not a regular extension)

"Pacenotes" sub-window of the race editor (raceEditor). It lets you list, select, create (Shift + drag in the world to set position, radius and direction), move with the gizmo, and delete pacenotes of the current path (path.pacenotes). Actions go through editor.history (undo/redo). The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/pacenotes')(raceEditor).

## Notes

- This window is commented out in raceEditor.lua (table.insert ... pacenotes): it is not loaded in game 0.40.5.
- C:selectPacenote tests self.note, a field that is never set in this file; if it were set, the function would call itself indefinitely. C:onEditModeActivate also tests self.note.
- C:selector indexes segments.objects[node[fieldName]]: with the value -1 ("None") the entry does not exist in the table, which would cause an error on .name.

## Class `C`

Pacenotes window. Created by the constructor returned by the module, with init(raceEditor). windowDescription = 'Pacenotes'. The methods are called by raceEditor.lua (setPath, selected, unselect, draw, onEditModeActivate).

The module returns a constructor: `local obj = require("editor_raceEditor_pacenotes")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of gizmo manipulation: stores the serialized state, rotation and radius of the pacenote (navRadiusScale in navgraph mode). | 87 |
| `C:createManualPacenote()` | Displays the creation help and the preview (sphere, prisms) during the drag, then on release creates a manual pacenote (radius 5 if the drag is ≤ 1 m) via history; the direction is given by the drag. | 174 |
| `C:dragging()` | During manipulation: applies gizmo translation (pos), rotation (normal) or scaling (radius, never negative) to the pacenote. | 101 |
| `C:draw(mouseInfo)` | Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the detail panel. | 165 |
| `C:drawPacenoteList()` | Draws the sorted pacenote list (+ "New..." entry) and the current pacenote panel (delete, move, fields). | 273 |
| `C:endDragging()` | End of manipulation: commits the "Manipulated Note via Gizmo" history action (before/after via onSerialize/onDeserialized). | 140 |
| `C:init(raceEditor)` | Initializes the window: stores raceEditor, selection index nil and empty mouseInfo. | 17 |
| `C:input()` | Handles the mouse: with Shift, manual creation; otherwise click on a pacenote to select it (or none). | 247 |
| `C:mouseOverPacenotes()` | Returns the pacenote whose sphere is crossed by the mouse ray, the one closest to the camera. | 230 |
| `C:onEditModeActivate()` | Called when the race edit mode is activated (see notes). | 159 |
| `C:selectPacenote(id)` | Selects the pacenote with ID id (nil for none). See notes on the recursive call conditional on self.note. | 49 |
| `C:selected()` | Called when the tab becomes active: deselects, draws pacenotes in "normal" mode, segments in "faded" mode, adds the Shift shortcut "Add New" and fetches the navigation map (map.getMap()). | 27 |
| `C:selector(name, fieldName, tt)` | Dropdown to choose a segment (or "None" = -1) in a field of the current pacenote, with a history action. | 401 |
| `C:setPath(path)` | Sets the race path (gameplay/race/path) being edited. | 23 |
| `C:unselect()` | Called when the tab is left: hides pacenotes (_drawMode = 'none') and removes the Shift shortcut. | 41 |
| `C:updateTransform(index)` | Places the axis gizmo on the pacenote at the given index, oriented along its normal in local alignment. No effect if the gizmo is not allowed. | 67 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/pacenotes.lua`.*
