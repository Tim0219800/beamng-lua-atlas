# `editor_raceEditor_startPositions`

*File: `lua/ge/extensions/editor/raceEditor/startPositions.lua` · VM: Game Engine (GE) · 354 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/startPositions")` (file under extensions/ but not a regular extension)

"Start Positions" sub-window of the race editor (raceEditor). It lists, creates (Shift + drag: position and orientation), selects, moves with the gizmo (translation and rotation), renames, deletes and reorders start positions (path.startPositions). You can also place the position on the ground (Down to Terrain), align it to the terrain, teleport the player vehicle onto it (Move Vehicle Here) or copy the vehicle's position (Set to Current Vehicle), and choose a group (start, rollingStart, recovery, other, or free text). Actions via editor.history. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/startPositions')(raceEditor).

## Notes

- The positions in the "recovery" group serve as recovery positions for pathnodes (recovery/reverseRecovery fields).
- Hovering a position uses a fixed sphere of radius 3 m.
- "Down to Terrain" and "Align with Terrain" only appear if the scene contains a TerrainBlock; they use core_terrain.getTerrainHeight.

## Class `C`

Start Positions window (windowDescription = 'Start Positions'). Instantiated with init(raceEditor).

The module returns a constructor: `local obj = require("editor_raceEditor_startPositions")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addHistory(name, old)` | Commits a history action for the current position from the previous serialized state and the current state. | 144 |
| `C:beginDrag()` | Start of gizmo manipulation: stores the rotation and the serialized state. | 102 |
| `C:createStartPosition()` | Displays the help and the preview (prisms) during the drag, then on release creates a position (position = anchor point, orientation = drag direction) via history. | 151 |
| `C:dragging()` | During manipulation: applies translation (pos) or rotation (rot). | 109 |
| `C:draw(mouseInfo)` | Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the panel. | 211 |
| `C:drawStartPositions()` | Draws the position list and the current position panel: delete, move in the list, name, position, terrain, vehicle, group. | 223 |
| `C:endDragging()` | End of manipulation: commits the "Moved Start Position by Gizmo" action. | 126 |
| `C:hoveringStartPosition()` | Returns the start position hovered by the mouse ray (3 m sphere), the one closest to the camera. | 69 |
| `C:init(raceEditor)` | Stores raceEditor and sets the selection index to nil. | 13 |
| `C:input()` | Handles the mouse: with Shift, creation; otherwise click to select or deselect. | 86 |
| `C:onEditModeActivate()` | Called when the edit mode is activated: reselects the current position if it exists. | 205 |
| `C:selectStartPosition(id)` | Selects the position with ID id (nil for none): highlight, loads name and group, places the gizmo. | 39 |
| `C:selected()` | Called when the tab becomes active: deselects, draws positions in "normal" and adds the Shift shortcut "Add New". | 22 |
| `C:setPath(path)` | Sets the race path being edited. | 18 |
| `C:unselect()` | Called when the tab is left: positions in "faded", removes the Shift shortcut. | 31 |
| `C:updateTransform(index)` | Places the gizmo on the position (oriented along sp.rot in local alignment). No effect if the gizmo is forbidden. | 52 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/startPositions.lua`.*
