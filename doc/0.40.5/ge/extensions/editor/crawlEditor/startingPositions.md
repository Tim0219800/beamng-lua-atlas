# `editor_crawlEditor_startingPositions`

*File: `lua/ge/extensions/editor/crawlEditor/startingPositions.lua` · VM: Game Engine (GE) · 581 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/startingPositions")` (file under extensions/ but not a regular extension)

Crawl editor subtool to edit the starting positions. The module returns a class constructor C. A starting position is a table {name, description, transform = {position, rotation, radius}, iconPosition, metadata}. The tool shows the list and detail in ImGui, draws the zone (sphere), the orientation arrow and the icon with debugDrawer, and lets you move/rotate through the axis gizmo with undo/redo (editor.history).

## Notes

- Placement: Shift+click places the icon (iconPosition); Ctrl+click then drag places the zone and orients the rotation according to the drag direction.
- The front of a position is the Y axis (rotation * vec3(0,1,0)).
- snapToTerrain is true by default: dropToTerrain uses core_terrain.getTerrainHeight; without core_terrain the position is not modified and the second return value is false.
- Modifications mark the position with _dirty = true for saving.

## Class `C`

Tool instance. Main fields: startingPosition (edited element), currentTransform ("area" or "icon" or nil), snapToTerrain, ImGui buffers name/fileName/description.

The module returns a constructor: `local obj = require("editor_crawlEditor_startingPositions")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of gizmo manipulation: stores the starting positions/rotation. | 381 |
| `C:clearSelection()` | Deselects the transform (currentTransform = nil), which hides the gizmo. | 253 |
| `C:dragging()` | During manipulation: applies the gizmo translation or rotation and snaps back to the terrain if snapToTerrain. | 394 |
| `C:draw(mouseInfo)` | Called every frame: processes input, displays the placement preview with rotation and the axis gizmo. | 460 |
| `C:drawStartingPositionDetail(startingPosition)` | Draws the detail panel (Goto button that places the camera 15 m above, name, description, radius, etc.) with changes recorded in the undo history. | 108 |
| `C:drawStartingPositionIndicators(mouseInfo)` | Draws in the 3D view the sphere of actual radius (translucent green), selection points sized according to camera distance, the orientation arrow (3 m) and the "Area:" and "Icon:" labels. | 520 |
| `C:drawStartingPositionsList(allStartingPositions, selection)` | Draws the "Add Starting Position" button and the selectable list; right click offers Delete. Updates selection.index and selection.clicked. | 72 |
| `C:dropToTerrain(pos)` | Places the position at the terrain height. | 429 |
| `C:endDragging()` | End of manipulation: snaps back to the terrain and records the action (zone or icon) in editor.history. | 438 |
| `C:getNewStartingPosition()` | Creates a default position: name "New Starting Position", position (0,0,0), identity rotation, radius 4.0, metadata version "1.0". | 232 |
| `C:init()` | Initializes the state (no selection, snapToTerrain = true, previous gizmo positions at zero). | 55 |
| `C:input(mouseInfo)` | Handles the mouse: Shift+click places the icon; Ctrl+click/drag places the zone with rotation. | 257 |
| `C:setFields(startingPosition)` | Fills the ImGui buffers (name 256, file name 256, description 1024 characters) from the starting position. | 65 |
| `C:setStartingPosition(startingPositionParam)` | Sets the starting position being edited. | 249 |
| `C:updateTransform()` | Places the axis gizmo on the zone (with its rotation) or on the icon depending on currentTransform. | 365 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/startingPositions.lua`.*
