# `editor_raceEditor_segments`

*File: `lua/ge/extensions/editor/raceEditor/segments.lua` · VM: Game Engine (GE) · 443 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/segments")` (file under extensions/ but not a regular extension)

"Segments" sub-window of the race editor (raceEditor). A segment links two pathnodes (From/To) and has a mode: waypoint, capsules or navpath (if getBeNavpath()). In capsules mode, you edit a list of capsule points (position, radius) with the gizmo or keyboard. Alt + click on a node sets the source, Shift + click the target, Ctrl shows spheres in the middle of capsules to insert one. Changes go through editor.history. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/segments')(raceEditor).

## Notes

- Bug: C:endDragging references serializedUndo and serializedRedo, but these local functions are declared after it in the file; they are therefore nil (globals) at compile time and the gizmo history action is passed without valid undo/redo. The other actions (addHistory) work because they are defined after the locals.
- A capsule's "Remove" button names its history action "Added Capsule" (copy-paste).
- The selected segment's pacenotes are shown, the others hidden.

## Class `C`

Segments window (windowDescription = 'Segments'). Instantiated with init(raceEditor).

The module returns a constructor: `local obj = require("editor_raceEditor_segments")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addHistory(name, old)` | Commits a history action for the current segment from the previous serialized state and the current state; undo/redo restore the segment and the selected capsule. | 135 |
| `C:beginDrag()` | Start of gizmo manipulation: stores the capsule radius and the segment's serialized state. | 81 |
| `C:dragging()` | During manipulation: applies translation (pos) or scaling (radius, never negative) to the capsule. | 88 |
| `C:draw(mouseInfo)` | Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the segment list and the panel. | 142 |
| `C:drawSegmentList()` | Draws the segment list ("(!)" if a node is missing), the Create button and the segment panel: delete, move, name, From/To, mode, and the capsules (list, position, radius, Add Before/After, Remove). | 239 |
| `C:endDragging()` | End of manipulation: tries to commit the "Manipulated Capsule Node via Gizmo" history action (see notes: nil undo/redo functions). | 112 |
| `C:init(raceEditor)` | Stores raceEditor; segment and capsule indices set to nil. | 12 |
| `C:input()` | Handles the mouse for the selected segment: Alt/Shift + click on a node to change source/target; in capsules mode, click to select a capsule and Ctrl + click between two capsules to add one. | 151 |
| `C:mouseDistanceTo(point, mouseInfo)` | Camera-to-point distance if the mouse ray crosses the point's sphere, otherwise -1. | 222 |
| `C:selectCapsule(index)` | Selects a capsule point of the current segment and places the gizmo on it. | 63 |
| `C:selectSegment(index)` | Selects the segment with ID index (nil for none): highlights, loads the name, sets the Shift "Set Target" / Alt "Set Source" shortcuts and shows only this segment's pacenotes. | 39 |
| `C:selected()` | Called when the tab becomes active: deselects and draws segments in "normal". | 22 |
| `C:setPath(path)` | Sets the race path being edited. | 18 |
| `C:unselect()` | Called when the tab is left: segments in "faded", removes the Shift and Alt shortcuts. | 30 |
| `C:updateTransform()` | Places the gizmo on the selected capsule (no effect if the gizmo is forbidden or no capsule is chosen). | 68 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/segments.lua`.*
