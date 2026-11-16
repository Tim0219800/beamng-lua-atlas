# `flowgraph_nodes_scene_sevensegmentDisplay`

*File: `lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/sevensegmentDisplay")` (file under extensions/ but not a regular extension)

Flowgraph node "Sevensegment Display" (repeat_instant, author BeamNG). Creates a seven-segment display made of TSStatic (art/shapes/quarter_mile_display/display_*.dae) at the given position/rotation and displays the number of the number pin on it. Settings in self.data: mode ('number', 'minutes', 'hours'), scaling, count (5 digits), decimals (3), decimalOffset, spacing, shapeFolder, showLeadingZeroes. Output: number.

## Notes

- The output pin number is never written.
- The 'hours' and 'number' modes have no distinct logic: only 'minutes' adds the colon.
- If the number pin is nil, updateNumbers fails (division of nil).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the last displayed number. | 135 |
| `C:_executionStopped()` | Deletes the objects on stop. | 131 |
| `C:clearObjects()` | Deletes all created objects and sets spawned back to false. | 139 |
| `C:createObjects(objectName)` | Creates the digits (shape '8'), the decimal point and, in minutes mode, the colon. | 42 |
| `C:destroy()` | Called when the node is destroyed: cleans up the created objects. | 169 |
| `C:init(mgr, ...)` | Initializes the default settings (mode 'minutes', count 5, decimals 3, spacing 5...). | 27 |
| `C:makeDot(offset, name)` | Creates a point TSStatic (shape 'period') offset relative to the base position. | 81 |
| `C:onClientEndMission()` | End-of-mission hook: cleans up the objects created by the node. | 165 |
| `C:updateNumbers()` | Changes the shape of each digit according to the current number; clears leading zeros if showLeadingZeroes is false. | 101 |
| `C:work()` | On clear, deletes the display; otherwise creates it if needed and updates the digits if the number changed. | 152 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`, `postApply`, `preApply`, `setField`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua`.*
