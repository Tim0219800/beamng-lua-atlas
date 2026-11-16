# `editor_raceEditor_trackLayout`

*File: `lua/ge/extensions/editor/raceEditor/trackLayout.lua` · VM: Game Engine (GE) · 155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/trackLayout")` (file under extensions/ but not a regular extension)

"Track Layout" sub-window of the race editor (raceEditor). It sets the default lap count (defaultLaps, minimum 1), the start and end nodes (startNode, endNode), the normal, reverse, rolling and rolling reverse start positions (defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition) and the "Simplify AI Path" option (simplifyAiPath). It displays the classification computed by path:classify() (Reversible, Rolling Start, Closed, Branching) and draws the "Stop Control" and "Split N" labels in the world. Changes via editor.history. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/trackLayout')(raceEditor).

## Notes

- A start position named STOP_ZONE, SS_stop_control or TC_out is recognized as a stop zone and gets the text "Stop Control" in the world.
- Nodes marked useAsSplit (except the last of the sorted list) are numbered "Split 1", "Split 2"... in the world.
- An open track cannot have more than one lap; a closed track does not need an End Node (code tooltips).
- C:selector indexes objects.objects[self.path[fieldName]]: the value -1 ("None") relies on the collection returning a "missing" object for that index.

## Class `C`

Track Layout window (windowDescription = 'Track Layout'). Instantiated with init(raceEditor).

The module returns a constructor: `local obj = require("editor_raceEditor_trackLayout")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:changeField(field, new)` | If the new value differs from path[field], commits a history action that modifies this path field. | 27 |
| `C:displayClassification(classification, name, field, tt)` | Displays a "name" line with a check or cross icon depending on classification[field]. | 78 |
| `C:draw()` | Called every frame: draws the form, the stop zone and the splits. | 20 |
| `C:drawGeneralInfo()` | Draws the form (laps, nodes, start positions, classification, AI simplification option) then the stop zone and the splits. | 35 |
| `C:drawSplits()` | Draws "Split N" on each useAsSplit pathnode (except the last node of the sorted list). | 107 |
| `C:drawStopZone()` | Looks for a start position named STOP_ZONE, SS_stop_control or TC_out and draws the text "Stop Control" there. | 89 |
| `C:init(raceEditor)` | Stores raceEditor. | 10 |
| `C:selected()` | Called when the tab becomes active; does nothing. | 17 |
| `C:selector(name, objects, fieldName, clrI, tt)` | Dropdown to choose a node or a position for a path field (None = -1), with a label drawn in the world and a preview of the hovered name. | 120 |
| `C:setPath(path)` | Sets the race path being edited. | 14 |
| `C:unselect()` | Called when the tab is left; does nothing. | 18 |

## Calls into the engine (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/trackLayout.lua`.*
