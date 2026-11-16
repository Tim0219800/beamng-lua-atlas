# `flowgraph_nodes_mission_UpdateDisplayDragRace`

*File: `lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua` · VM: Game Engine (GE) · 129 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/UpdateDisplayDragRace")` (file under extensions/ but not a regular extension)

Flowgraph node 'Update Display Drag Race' (repeat_instant category) for the drag race mission: displays the player's time and speed on the quarter-mile board by changing the shape (shapeName) of the scene objects display_time_i_l/r and display_speed_i_l/r (models art/shapes/quarter_mile_display/display_<digit>.dae). The 'side' pin ('l' or 'r') chooses the side; the speed in m/s is converted to mph (x2.237).

## Notes

- The description of the 'side' and 'velocity' pins is identical ('Velocity of the players vehicle'): copy-paste in the code.
- The m/s to mph conversion is done with a condition 'velocity == 0 and velocity or velocity*2.237'.
- If the scene does not have the display_* objects, indexing nil raises an error.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the display lists and sets the flow output to false. | 96 |
| `C:init()` | Same initialization. | 104 |
| `C:insertDigits()` | Searches the scene for the 20 objects display_time_i_l/r and display_speed_i_l/r (i from 1 to 5) and stores them. | 80 |
| `C:postInit()` | Defines the offered values for the 'side' pin: left=l, right=r. | 22 |
| `C:updateDisplay(side, finishTime, finishSpeed)` | Builds the list of digits (time with 3 decimals, speed with 2) and applies the right model to each of the 5 displays of the chosen side; an 'empty' is added for the leading zero. | 29 |
| `C:work()` | On reset: finds the displays again and resets the display to 0. Otherwise, if time, velocity and side are provided, updates the display; flow=true. | 112 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua`.*
